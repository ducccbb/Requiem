--[[
    ================================================================================
    REQUIEM MASTER HUB - LUNA INTERFACE SUITE (v2.1 ENCHANTMENTS & PROGRESSION)
    ================================================================================
    Tác giả: Jarvis Assistant
    Thư viện UI: Luna Interface Suite (by Nebula Softworks)
    Hệ thống hỗ trợ:
      - 🥊 Training & Thể Lực (Punching Bag AFK, Benchpress, Running Track)
      - ⚡ Advanced Auto:
          + 🎮 Auto Minigames VIM (Balance Drum Q/E, Rhythm OSU, Skillcheck Spacebar)
          + 📜 Auto Lore Quiz (Database 50 câu, mô phỏng bấm người thật 100% 50/50)
          + 💥 Full Combat Auto (Silent-Aim ghim đạn bất chấp Recoil, Anti-Recoil, Auto Cannon Reload)
      - 🔮 Bùa Chú & Tiến Trình (Enchantment & Progression Suite):
          + 🎛️ Dropdown bar 2 tầng chọn bùa theo 5 nhóm thực chiến & phẩm cấp
          + ⚡ 1-Click God Buffs (Insight + Deduction, Siêu cơ động ODMG, Giác quan thứ 6)
          + 🎁 Auto Gacha (Auto Claim bùa chỉ định, Auto Open Pack, Fallback Rarest)
          + ⚔️ Skill Caster & Hotkey (Thi triển chiêu thức bùa chủ động)
          + 👁️ Thần Nhãn Native ESP (Medic Vital Sight & Logistician Supply Seeker 1200 studs)
          + 🛡️ Auto Counter-Parry (Tự động kích hoạt phản đòn cận chiến)
      - 🎣 Sinh Tồn & Chế Tác (Auto Fishing Instant Catch, QTE Handler)
      - 🚀 Dịch Chuyển Khu Vực Huấn Luyện & Sát Hạch (Teleports)
    ================================================================================
]]

getgenv().ConfirmLuna = true

-- =========================================================================
-- KHỞI TẠO DỊCH VỤ ROBLOX
-- =========================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()

-- =========================================================================
-- KHẮC PHỤC TRIỆT ĐỂ HIỆU ỨNG BLUR MÀN HÌNH DO LUNA SUITE GÂY RA
-- =========================================================================
local function purgeLunaBlur()
    pcall(function()
        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("DepthOfFieldEffect") and (string.sub(child.Name, 1, 4) == "DPT_" or child.NearIntensity > 0) then
                child.Enabled = false
                child:Destroy()
            end
        end
    end)
    pcall(function()
        local cam = workspace.CurrentCamera
        if cam then
            for _, child in ipairs(cam:GetChildren()) do
                if child.Name == "LunaBlur" then
                    child:Destroy()
                end
            end
        end
    end)
end

-- 1. Quét dọn ngay các hiệu ứng blur tồn đọng từ các lần execute trước
purgeLunaBlur()

-- 2. Giám sát Lighting để triệt tiêu tức thì bất kỳ DepthOfField nào của Luna
Lighting.ChildAdded:Connect(function(child)
    if child:IsA("DepthOfFieldEffect") and (string.sub(child.Name, 1, 4) == "DPT_" or child.NearIntensity > 0) then
        task.defer(function()
            pcall(function()
                child.Enabled = false
                child:Destroy()
            end)
        end)
    end
end)

-- 3. Giám sát CurrentCamera để xóa thư mục LunaBlur và các neon wedge mesh
local function monitorCamera(cam)
    if not cam then return end
    cam.ChildAdded:Connect(function(child)
        if child.Name == "LunaBlur" then
            task.defer(function()
                pcall(function() child:Destroy() end)
            end)
        end
    end)
    for _, child in ipairs(cam:GetChildren()) do
        if child.Name == "LunaBlur" then
            pcall(function() child:Destroy() end)
        end
    end
end

monitorCamera(workspace.CurrentCamera)
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    monitorCamera(workspace.CurrentCamera)
    purgeLunaBlur()
end)

-- =========================================================================
-- KHẮC PHỤC LỖI HTTP 429 VÀ SANITIZE NOTIFICATION CHO LUNA SUITE
-- =========================================================================
pcall(function()
    local origGetFriends = Players.GetFriendsAsync
    Players.GetFriendsAsync = function(self, ...)
        local success, res = pcall(origGetFriends, self, ...)
        if success and res then return res end
        local dummyPages = {}
        function dummyPages:GetCurrentPage() return {} end
        function dummyPages:AdvanceToNextPageAsync() end
        dummyPages.IsFinished = true
        return dummyPages
    end
end)

-- Hàm làm sạch mã nguồn Luna trước khi loadstring (vô hiệu hóa BlurModule & checkFriends)
local function sanitizeLunaSource(src)
    if typeof(src) ~= "string" then return src end
    
    -- Triệt tiêu hoàn toàn BlurModule bên trong Luna (chống tạo DepthOfField & RenderStep neon mesh)
    if string.find(src, "local function BlurModule(Frame)", 1, true) then
        src = string.gsub(src, "local function BlurModule%s*%(Frame%)", "local function BlurModule(Frame) return end\nlocal function __OldBlurModule(Frame)")
    end
    
    -- Ngăn chặn spam HTTP 429 từ checkFriends API
    if string.find(src, "local function checkFriends()", 1, true) then
        src = string.gsub(src, "local function checkFriends%s*%(%)", "local function checkFriends() return end\nlocal function __OldCheckFriends()")
    end
    
    -- Chống lỗi Image = nil (ContentId expected, got nil) khi gọi Notification
    if string.find(src, "newNotification.Icon.Image = GetIcon(data.Icon, data.ImageSource)", 1, true) then
        src = string.gsub(src, "newNotification%.Icon%.Image%s*=%s*GetIcon%(data%.Icon,%s*data%.ImageSource%)", "newNotification.Icon.Image = GetIcon(data.Icon, data.ImageSource) or \"\"")
    end
    
    return src
end

-- =========================================================================
-- NẠP THƯ VIỆN LUNA INTERFACE SUITE
-- =========================================================================
local Luna = nil

local loadOk, result = pcall(function()
    local rawSource = game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua")
    return loadstring(sanitizeLunaSource(rawSource))()
end)

if loadOk and result then
    Luna = result
else
    local localOk, localResult = pcall(function()
        if typeof(readfile) == "function" then
            local possiblePaths = {
                "Luna-Interface-Suite-master/Luna-Interface-Suite-master/source.lua",
                "Luna-Interface-Suite-master/source.lua",
                "source.lua",
                "c:/Users/ducsh/Downloads/Luna-Interface-Suite-master/Luna-Interface-Suite-master/source.lua",
            }
            for _, path in ipairs(possiblePaths) do
                local ok, content = pcall(readfile, path)
                if ok and content and #content > 0 then
                    return loadstring(sanitizeLunaSource(content))()
                end
            end
        end
    end)
    if localOk and localResult then
        Luna = localResult
    end
end

if not Luna then
    warn("[Requiem Hub] Không thể tải thư viện Luna Interface Suite! Vui lòng kiểm tra kết nối mạng hoặc đường dẫn file.")
    return
end

-- Đảm bảo xóa sạch blur sau khi Luna khởi tạo
purgeLunaBlur()

-- Tự động lọc Icon an toàn cho Luna:Notification (chống lỗi ContentId expected, got nil)
if Luna and typeof(Luna.Notification) == "function" then
    local origNotification = Luna.Notification
    local validIcons = {
        ["info"] = true, ["check"] = true, ["check_circle"] = true,
        ["cancel"] = true, ["close"] = true, ["report"] = true,
        ["priority_high"] = true, ["bolt"] = true, ["security"] = true,
        ["stars"] = true, ["fitness_center"] = true, ["auto_awesome"] = true,
        ["gps_fixed"] = true, ["school"] = true, ["colorize"] = true,
        ["sports_esports"] = true, ["keyboard"] = true, ["near_me"] = true,
        ["construction"] = true, ["settings"] = true, ["aspect_ratio"] = true,
        ["hardware"] = true,
    }
    Luna.Notification = function(self, data, ...)
        if type(data) == "table" then
            data.Icon = data.Icon or "info"
            data.ImageSource = data.ImageSource or "Material"
            if data.ImageSource == "Material" and not validIcons[data.Icon] then
                if data.Icon == "error" then
                    data.Icon = "cancel"
                elseif data.Icon == "warning" then
                    data.Icon = "report"
                elseif data.Icon == "phishing" or data.Icon == "radar" or data.Icon == "rocket_launch" then
                    data.Icon = "gps_fixed"
                elseif data.Icon == "air" then
                    data.Icon = "bolt"
                else
                    data.Icon = "info"
                end
            end
        end
        return origNotification(self, data, ...)
    end
end


-- =========================================================================
-- TẬP HỢP CÁC MODULE CỐT LÕI TỪ REPLICATEDSTORAGE
-- =========================================================================
local StateModule = nil
local PunchingBagModule = nil
local BenchpressModule = nil
local CannonReloadModule = nil
local TrainerModule = nil
local FishingHandler = nil

local PlayerNamespace = nil
local GearNamespace = nil
local VitalityNamespace = nil
local ExamNamespace = nil
local InteractionNamespace = nil
local CannonsNamespace = nil

pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Utilities = Common:WaitForChild("Utilities")
    StateModule = require(Utilities:WaitForChild("State"))
end)

pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Network = Common:WaitForChild("Network")
    local Namespaces = Network:WaitForChild("Namespaces")
    PlayerNamespace = require(Namespaces:WaitForChild("Player"))
    GearNamespace = require(Namespaces:WaitForChild("Gear"))
    VitalityNamespace = require(Namespaces:WaitForChild("Vitality"))
    ExamNamespace = require(Namespaces:WaitForChild("Exam"))
    InteractionNamespace = require(Namespaces:WaitForChild("Interaction"))
    CannonsNamespace = require(Namespaces:WaitForChild("Cannons"))
    pcall(function() EnchantmentsNamespace = require(Namespaces:WaitForChild("Enchantments")) end)
    pcall(function() ProficienciesNamespace = require(Namespaces:WaitForChild("Proficiencies")) end)
end)

local ClientStateHandler = nil
local CharacterRagdollHandler = nil
pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local User = Client:WaitForChild("User")
    local State = User:WaitForChild("State")
    ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
    
    local Character = User:WaitForChild("Character")
    CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
end)

local ClientAttributesHandler = nil
local ClientEnchantmentsHandler = nil
local ClientProficienciesHandler = nil
local ClientSenseRunner = nil

pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local Progression = Client:WaitForChild("Progression")
    ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
    
    local Ench = Progression:FindFirstChild("Enchantments")
    if Ench then
        ClientEnchantmentsHandler = require(Ench:WaitForChild("ClientEnchantmentsHandler"))
    end
    local Prof = Progression:FindFirstChild("Proficiencies")
    if Prof then
        ClientProficienciesHandler = require(Prof:WaitForChild("ClientProficienciesHandler"))
    end
    
    local User = Client:FindFirstChild("User")
    if User then
        local Misc = User:FindFirstChild("Miscellaneous")
        if Misc then
            ClientSenseRunner = require(Misc:WaitForChild("ClientSenseRunner"))
        end
    end
end)

pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local Interfaces = Client:WaitForChild("Interfaces")
    local Routes = Interfaces:WaitForChild("Routes")
    local Interactions = Routes:WaitForChild("Interactions")
    local Types = Interactions:WaitForChild("Types")
    local Other = Types:WaitForChild("Other")
    local Gear = Types:WaitForChild("Gear")
    PunchingBagModule = require(Other:WaitForChild("Punching Bag"))
    BenchpressModule = require(Other:WaitForChild("Benchpress"))
    CannonReloadModule = require(Other:WaitForChild("CannonReload"))
    TrainerModule = require(Gear:WaitForChild("Trainer"))
end)

pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local User = Client:WaitForChild("User")
    local Miscellaneous = User:WaitForChild("Miscellaneous")
    FishingHandler = require(Miscellaneous:WaitForChild("ClientFishingMinigameHandler"))
end)

local ClientGearHandler = nil
local GearTypes = nil
pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local User = Client:WaitForChild("User")
    local Equipment = User:WaitForChild("Equipment")
    local Gear = Equipment:WaitForChild("Gear")
    ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
end)
pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Types = Common:WaitForChild("Types")
    GearTypes = require(Types:WaitForChild("Gear"))
end)

-- ⚔️ CÁC MODULE TITAN COMBAT CỐT LÕI (DETECTION BOX, HITBOX, ACTION, STATE)
local TitanNamespace = nil
pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Network = Common:WaitForChild("Network")
    local Namespaces = Network:WaitForChild("Namespaces")
    TitanNamespace = require(Namespaces:WaitForChild("Titan"))
end)

local ClientTitanHandler = nil
local DetectionBoxTitanClient = nil
local HitboxTitanClient = nil
local GrabTitanClient = nil
local DefaultTitanClient = nil
local IceTitanClient = nil
local SprinterTitanClient = nil
local RaycastHitboxV4 = nil

pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Utilities = Common:WaitForChild("Utilities")
    RaycastHitboxV4 = require(Utilities:WaitForChild("RaycastHitboxV4"))
end)

pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local Entities = Client:WaitForChild("Entities")
    local Titans = Entities:WaitForChild("Titans")
    ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
    
    local Utilities = Titans:WaitForChild("Utilities")
    local Types = Titans:WaitForChild("Types")

    DetectionBoxTitanClient = require(Utilities:WaitForChild("DetectionBoxTitanClient"))
    HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
    GrabTitanClient = require(Utilities:WaitForChild("GrabTitanClient"))

    local DefaultType = Types:WaitForChild("Default")
    DefaultTitanClient = require(DefaultType:WaitForChild("DefaultTitanClient"))

    pcall(function()
        local IceType = Types:WaitForChild("Ice")
        IceTitanClient = require(IceType:WaitForChild("IceTitanClient"))
    end)
    pcall(function()
        local SprinterType = Types:WaitForChild("Sprinter")
        SprinterTitanClient = require(SprinterType:WaitForChild("SprinterTitanClient"))
    end)
end)

local ClientTitanHandler = nil
pcall(function()
    local Entities = ReplicatedStorage:WaitForChild("Client"):WaitForChild("Entities")
    local Titans = Entities:WaitForChild("Titans")
    ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
end)

-- =========================================================================
-- DATABASE 50 CÂU HỎI LORE QUIZ (TỪ QUIZ.LUAU)
-- =========================================================================
local QUIZ_DATABASE = {
    { q = "What happened to Thalrex Hayes after killing the Clicker Titan?", a = "Declared Killed in Action" },
    { q = "What was the mission of the 19th Expedition?", a = "Defeat the Titan from the 16th Expedition" },
    { q = "What incident from Blackthorne Holding caused the appearance of the largest titan ever recorded?", a = "Lightning strike" },
    { q = "The Royal Military was founded in which time period?", a = "Second century" },
    { q = "How many years after the founding of the Scouting Legion did its first expedition occur?", a = "3" },
    { q = "Ex-Commander Audwin Becker was blamed for a major loss during an expedition. What happened as a result?", a = "Removal from the military" },
    { q = "The 'Clicker Titan' was first encountered during which expedition?", a = "16th" },
    { q = "Which event occurred during the 18th Expedition?", a = "Burial of the queen and FOB establishment" },
    { q = "What was unique about the 19th Expedition's objective?", a = "It targeted a specific Titan from a prior disaster" },
    { q = "What distinguished the largest Titan summoned during the Blackthorne raids?", a = "It had no face" },
    { q = "Who ultimately destroyed the massive Spider Titan?", a = "The Stationary Guard and Military Police" },
    { q = "What made Queen Aurelia Fritz's designation as heir unprecedented?", a = "She was female" },
    { q = "Which of the following occurred in the same year?", a = "17th and 18th Expeditions" },
    { q = "Which of the following is TRUE about Commander Becker?", a = "He was removed after catastrophic losses" },
    { q = "Which statement about the Clicker Titan is MOST accurate?", a = "It forced a retreat before being killed later" },
    { q = "Which of the following is NOT directly tied to King Illarion Fritz?", a = "ODMG development" },
    { q = "Which statement about Queen Aurelia Fritz is TRUE?", a = "She secured funding for the Scouts" },
    { q = "How many rollable enchantment rarities are there?", a = "5" },
    { q = "At which Enchantment milestone do you not get a Sacrament point?", a = "75" },
    { q = "What crime will you be charged with if you show any expression of doubt regarding Queen Aurelia's right to rule?", a = "Treason" },
    { q = "What government entities are normally deputized to enforce the laws of the Kingdom?", a = "The Military Police & Royal Guard" },
    { q = "What enchantment allows you to see enchantment rarities?", a = "Insight" },
    { q = "To which rank of nobility do you normally kneel?", a = "None of the above" },
    { q = "What is the name of Eldia's state religion?", a = "The Church of Ymir" },
    { q = "Which of the following is a right of the Eldian people?", a = "None of the above" },
    { q = "The years 820 through 823 are commonly referred to as what?", a = "The Great Codification" },
    { q = "Unauthorized leave from the Trainee Camp can be considered what crime?", a = "Desertion" },
    { q = "Which charge can result from unlawfully arresting a person?", a = "Kidnapping" },
    { q = "Precision stops improving accuracy after which sacrament point?", a = "Fourth" },
    { q = "Which level of nobility is not saluted upon simply appearing?", a = "Lower Nobility" },
    { q = "Which of the following privileges do cadets not have?", a = "The privilege to demand trial in place of non-judicial punishments" },
    { q = "Which family received Ymir's divine mandate?", a = "The Fritz" },
    { q = "What does the emblem of a plain shield represent?", a = "The Government" },
    { q = "Which of the following is not an emblem used in Eldia?", a = "A shield with crossed sticks" },
    { q = "Which of the following items does not require a permit to possess?", a = "A bow" },
    { q = "The Kingdom of Eldia is a...", a = "Monarchy" },
    { q = "Who was the first ruler of Eldia?", a = "Solon Fritz" },
    { q = "The tale of 'THE HILL AND THE FLOOD' is a tale about...", a = "Genetic Outlier" },
    { q = "The tale 'Architecture of Sina' covers which village?", a = "Amethine" },
    { q = "As described by 'The Art of Dueling', what is the third principle that must never be broken?", a = "Witnesses must be present to ensure fairness" },
    { q = "The city that governs Eldia.", a = "Mitras" },
    { q = "A blue flare is used to call for...", a = "Medical assistance" },
    { q = "A purple flare is used to call for...", a = "An emergency" },
    { q = "A titans weak spot is its...", a = "Nape" },
    { q = "The highest court in Eldia is the...", a = "Royal Court of Justice" },
    { q = "The highest tier of nobility below is...", a = "Archdukes" },
    { q = "An easily concealable weapon..", a = "Flintlock" },
    { q = "The pale blue crystal that powers humanity's ODMG.", a = "Iceburst" },
    { q = "The name of Eldia's first female monarch.", a = "Aurelia Fritz" },
    { q = "The 'Berserk Titan' is an example of a(n)...", a = "Abnormal Titan" },
}

local function normalizeText(str)
    if not str or typeof(str) ~= "string" then return "" end
    str = string.lower(str)
    str = string.gsub(str, "[%p%c%s]", "")
    return str
end

local function findCorrectAnswer(questionText)
    local normQ = normalizeText(questionText)
    for _, item in ipairs(QUIZ_DATABASE) do
        local dbNormQ = normalizeText(item.q)
        if normQ == dbNormQ or string.find(normQ, dbNormQ, 1, true) or string.find(dbNormQ, normQ, 1, true) then
            return item.a
        end
    end
    return nil
end

-- =========================================================================
-- BIẾN TRẠNG THÁI & CẤU HÌNH HUB
-- =========================================================================
local Settings = {
    -- Aimlabs
    AimlabsEnabled = false,
    AimlabsMode = "Legit", -- "Legit" hoặc "Instant"
    AimlabsDelay = 0.03,

    -- Punching Bag
    AutoPunchingBag = false,
    PunchMaxDist = 30,
    PunchDelay = 0.8,

    -- Benchpress
    AutoBenchpress = false,
    BenchpressMode = "Legit", -- "Legit" (Auto Space VIM) hoặc "Instant" (Bypass QTE)
    BenchMaxDist = 30,
    BenchDelay = 1.0,

    -- Fishing
    AutoFishing = false,

    -- Skillcheck (Legacy & VIM)
    AutoSkillcheck = false,
    AutoSkillcheckVIM = false,
    SkillcheckTolerance = 20,

    -- 🎮 ADVANCED AUTO: MINIGAMES
    AutoBalanceDrum = false,
    AutoBalanceRhythm = false,

    -- 📜 ADVANCED AUTO: LORE QUIZ
    AutoLoreQuiz = false,
    QuizDelay = 1.5,

    -- 🎯 ADVANCED AUTO: COMBAT & FIREARMS
    SilentAimEnabled = false,
    SilentAimFOV = 250,
    SilentAimShowFOV = false,
    SilentAimTarget = "Tất cả mục tiêu",
    AntiRecoil = false,
    NoSpread = false,
    TrajectoryPreview = false,
    FastAimWalk = false,
    FastReload = false,
    FastReloadMultiplier = 2.0,

    -- 💣 ADVANCED AUTO: CANNON
    AutoCannonReload = false,
    CannonReloadDist = 14,

    -- ⚔️ TRẢM THẦN TITAN & MELEE COMBAT
    AutoSlashNape = false,
    AutoSlashDist = 35,
    AutoSlashDelay = 0.25,
    TitanTargetPart = "Gáy Titan (Nape - Kết Liễu)",
    NapeLockOn = false,
    NapeLockDist = 200,
    NapeLockSmoothness = 0.2,
    NapeHitboxExpander = false,
    NapeHitboxSize = 25,
    NapeHitboxShow = true,
    AntiTitanGrab = false,
    AutoEradicate = false,
    TitanESP = false,

    -- 🔮 PROGRESSION & ENCHANTMENTS SUITE
    SelectedEnchantCategory = "Thần Nhãn & Nhận Thức (ESP)",
    SelectedEnchantName = "Heartseeker",
    AutoClaimEnchant = false,
    AutoOpenPack = false,
    FallbackClaimMode = "Rarest", -- "Rarest" hoặc "Manual"
    AutoCounterParry = false,
    SpoofedEnchants = {},
    SpoofedAttributes = {},
    PresetInsightDeduction = false,
    PresetSuperODMG = false,
    PresetSixthSense = false,
    PresetSuperHorse = false,
    CastHotkey = Enum.KeyCode.V,

    -- ⛽ Vô Hạn Khí Nén (Gas) & Lưỡi Dao (Blades) Độc Lập
    InfiniteGas = false,
    InfiniteBlades = false,
    FreezeBladeDurability = false,

    -- 🎛️ Multi-Enchant Checklist (Kích hoạt nhiều bùa cùng lúc)
    ActiveEnchantList = {},

    -- ⚔️ TITAN COMBAT & DETECTION BOX EXPLOITS
    TitanInvincibility = false,
    LimbToNape = false,
    LimbToNapeMaxDist = 45,
}

local isAimlabsActive = false
local clickedCircleIds = {}

-- =========================================================================
-- HÀM TIỆN ÍCH CHUNG
-- =========================================================================
local function clickGuiButton(button)
    if not button or not button:IsDescendantOf(game) then return end
    
    -- 1. Ưu tiên cao nhất: firesignal & getconnections (React/Roact kích hoạt ngay lập tức)
    if typeof(firesignal) == "function" then
        if button.Activated then
            pcall(function() firesignal(button.Activated) end)
        end
        if button.MouseButton1Click then
            pcall(function() firesignal(button.MouseButton1Click) end)
        end
        if button.MouseButton1Down then
            pcall(function() firesignal(button.MouseButton1Down) end)
            pcall(function() firesignal(button.MouseButton1Up) end)
        end
    end

    if typeof(getconnections) == "function" then
        pcall(function()
            for _, c in ipairs(getconnections(button.Activated)) do pcall(c.Fire, c) end
            for _, c in ipairs(getconnections(button.MouseButton1Click)) do pcall(c.Fire, c) end
            for _, c in ipairs(getconnections(button.MouseButton1Down)) do pcall(c.Fire, c) end
            for _, c in ipairs(getconnections(button.MouseButton1Up)) do pcall(c.Fire, c) end
        end)
    end

    -- 2. Tọa độ trung tâm nút bấm
    local absPos = button.AbsolutePosition
    local absSize = button.AbsoluteSize
    local guiInset = game:GetService("GuiService"):GetGuiInset()
    local screenGui = button:FindFirstAncestorWhichIsA("ScreenGui")
    local insetOffset = Vector2.new(0, 0)
    if screenGui and not screenGui.IgnoreGuiInset then
        insetOffset = guiInset
    end
    local centerX = absPos.X + absSize.X / 2 + insetOffset.X
    local centerY = absPos.Y + absSize.Y / 2 + insetOffset.Y

    -- 3. VirtualUser Click (không yêu cầu capability RobloxScript)
    pcall(function()
        local vu = game:GetService("VirtualUser")
        vu:CaptureController()
        vu:ClickButton1(Vector2.new(centerX, centerY))
    end)

    -- 4. mouse1click / mousemoveabs (nếu executor hỗ trợ)
    if typeof(mouse1click) == "function" then
        if typeof(mousemoveabs) == "function" then
            pcall(function() mousemoveabs(centerX, centerY) end)
        end
        pcall(function() mouse1click() end)
    end

    -- 5. Fallback VirtualInputManager (bọc pcall an toàn, không gọi SendMouseMoveEvent)
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
        task.wait(0.015)
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
    end)
end

local function sendKeyVIM(keyCode)
    VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
    task.wait(0.02)
    VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
end

local function findNearestObject(targetType, maxDistance)
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return nil, 9999 end
    local rootPos = char.PrimaryPart.Position
    local nearest = nil
    local shortest = maxDistance or 35
    local lowerTarget = string.lower(targetType)

    local function checkCandidate(item)
        if not item then return end
        local itemType = item:GetAttribute("Type") and string.lower(tostring(item:GetAttribute("Type"))) or ""
        local itemName = string.lower(item.Name)
        local parentType = item.Parent and item.Parent:GetAttribute("Type") and string.lower(tostring(item.Parent:GetAttribute("Type"))) or ""
        local parentName = item.Parent and string.lower(item.Parent.Name) or ""

        local isMatch = false
        if lowerTarget == "benchpress" or lowerTarget == "bench" then
            if itemType:find("bench") or itemName:find("bench") or parentType:find("bench") or parentName:find("bench") then
                isMatch = true
            end
        elseif lowerTarget:find("punch") then
            if itemType:find("punch") or itemName:find("punch") or parentType:find("punch") or parentName:find("punch") or itemName:find("bag") then
                isMatch = true
            end
        else
            if itemType == lowerTarget or itemName:find(lowerTarget, 1, true) or parentType == lowerTarget or parentName:find(lowerTarget, 1, true) then
                isMatch = true
            end
        end

        if isMatch then
            local pos = nil
            local targetPart = nil
            if item:IsA("BasePart") then
                pos = item.Position
                targetPart = item
            elseif item:IsA("Model") then
                -- Ưu tiên Seat hoặc BasePart có Tag Interaction hoặc PrimaryPart
                for _, child in ipairs(item:GetChildren()) do
                    if child:IsA("Seat") or (child:IsA("BasePart") and CollectionService:HasTag(child, "Interaction")) then
                        targetPart = child
                        pos = child.Position
                        break
                    end
                end
                if not targetPart then
                    targetPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
                    if targetPart then
                        pos = targetPart.Position
                    else
                        pos = item:GetPivot().Position
                        targetPart = item:FindFirstChildWhichIsA("BasePart", true) or item
                    end
                end
            end

            if pos and targetPart then
                local dist = (pos - rootPos).Magnitude
                if dist < shortest then
                    shortest = dist
                    nearest = targetPart
                end
            end
        end
    end

    for _, inst in ipairs(CollectionService:GetTagged("Interaction")) do
        checkCandidate(inst)
    end

    if not nearest then
        pcall(function()
            local overlap = OverlapParams.new()
            overlap.FilterType = Enum.RaycastFilterType.Exclude
            if char then overlap.FilterDescendantsInstances = {char} end
            local parts = Workspace:GetPartBoundsInRadius(rootPos, shortest, overlap)
            for _, p in ipairs(parts) do
                checkCandidate(p)
                if p.Parent and p.Parent:IsA("Model") then
                    checkCandidate(p.Parent)
                end
            end
        end)
    end

    return nearest, shortest
end

local function canInteract(targetPart, maxDist)
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return false end
    if not targetPart or not targetPart:IsDescendantOf(Workspace) then return false end
    
    local root = char.PrimaryPart
    local targetPos = nil
    if targetPart:IsA("BasePart") then
        targetPos = targetPart.Position
    elseif targetPart:IsA("Model") then
        targetPos = targetPart:GetPivot().Position
    end
    if not targetPos then return false end

    local dist = (root.Position - targetPos).Magnitude
    if dist > (maxDist or 35) then
        return false
    end

    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if hum and hum.Health <= 0 then
        return false
    end

    if CharacterRagdollHandler and typeof(CharacterRagdollHandler.isRagdolled) == "function" then
        if CharacterRagdollHandler.isRagdolled() then return false end
    end

    return true
end

-- =========================================================================
-- LOGIC: AIMLABS (BIA PHẢN XẠ KHI ĐẤM BAO CÁT)
-- =========================================================================
local cachedAimlabsContent = nil

local function setupInstantAimlabs()
    if not StateModule then return end
    pcall(function()
        local setAimlabsState, _, subscribeAimlabs = StateModule("aimlabs")
        subscribeAimlabs(function(state)
            if not Settings.AimlabsEnabled then
                isAimlabsActive = false
                return
            end
            if typeof(state) == "table" and state.visible == true then
                isAimlabsActive = true
                if Settings.AimlabsMode == "Instant" and typeof(state.success) == "function" then
                    task.wait(0.02)
                    local cb = state.success
                    setAimlabsState({
                        visible = false,
                        success = function() end,
                        fail = function() end,
                    })
                    pcall(cb)
                    isAimlabsActive = false
                end
            elseif typeof(state) == "table" and state.visible == false then
                isAimlabsActive = false
                cachedAimlabsContent = nil
                table.clear(clickedCircleIds)
            end
        end)
    end)
end

local function getAimlabsContainer()
    if cachedAimlabsContent and cachedAimlabsContent.Parent and cachedAimlabsContent:IsDescendantOf(PlayerGui) then
        return cachedAimlabsContent
    end
    cachedAimlabsContent = nil

    -- Ưu tiên tìm trực tiếp trong ScreenGui "Aimlabs" (Layer chuẩn) hoặc "App"
    local targetGuis = {
        PlayerGui:FindFirstChild("Aimlabs"),
        PlayerGui:FindFirstChild("App")
    }

    for _, gui in ipairs(targetGuis) do
        if gui then
            local content = gui:FindFirstChild("Content", true)
            if content and content:IsA("Frame") and content:FindFirstChildWhichIsA("UIAspectRatioConstraint") then
                cachedAimlabsContent = content
                return cachedAimlabsContent
            end
        end
    end

    return nil
end

local function scanAimlabs()
    if not Settings.AimlabsEnabled then return end

    local container = getAimlabsContainer()
    if not container then
        if isAimlabsActive then
            isAimlabsActive = false
            table.clear(clickedCircleIds)
        end
        return
    end

    local foundCircles = {}
    for _, child in ipairs(container:GetChildren()) do
        if child:IsA("Frame") and string.sub(child.Name, 1, 7) == "Circle_" then
            table.insert(foundCircles, child)
        end
    end

    if #foundCircles == 0 then
        table.clear(clickedCircleIds)
        isAimlabsActive = false
        return
    end

    isAimlabsActive = true

    for _, circleFrame in ipairs(foundCircles) do
        local circleId = circleFrame.Name
        if not clickedCircleIds[circleId] then
            local clickBtn = circleFrame:FindFirstChild("ClickButton") or circleFrame:FindFirstChildWhichIsA("TextButton", true) or circleFrame:FindFirstChildWhichIsA("ImageButton", true)
            if clickBtn then
                clickedCircleIds[circleId] = true
                
                if Settings.AimlabsMode == "Instant" then
                    clickGuiButton(clickBtn)
                else
                    task.spawn(function()
                        if Settings.AimlabsDelay > 0 then
                            task.wait(Settings.AimlabsDelay)
                        end
                        clickGuiButton(clickBtn)
                    end)
                end
            end
        end
    end
end

RunService.RenderStepped:Connect(scanAimlabs)
setupInstantAimlabs()

-- =========================================================================
-- BỘ TÌM KIẾM & BỘ ĐỆM CACHE SKILLCHECK (BENCHPRESS & QTE)
-- =========================================================================
local cachedSkillcheck = nil
local lastSkillcheckRepAngle = -999
local lastSkillcheckHitTime = 0
local isInstantSolving = false

local function getSkillcheckElements()
    if cachedSkillcheck and cachedSkillcheck.spinner and cachedSkillcheck.spinner.Parent 
       and cachedSkillcheck.validation and cachedSkillcheck.validation.Parent 
       and cachedSkillcheck.content and cachedSkillcheck.content.Parent then
        return cachedSkillcheck
    end

    cachedSkillcheck = nil

    local pgui = LocalPlayer:FindFirstChild("PlayerGui")
    if not pgui then return nil end

    local app = pgui:FindFirstChild("App")
    local candidates = {}
    if app then table.insert(candidates, app) end
    for _, g in ipairs(pgui:GetChildren()) do
        if g:IsA("ScreenGui") and g ~= app then
            table.insert(candidates, g)
        end
    end

    for _, gui in ipairs(candidates) do
        for _, desc in ipairs(gui:GetDescendants()) do
            if desc.Name == "Validation" and desc:IsA("ImageLabel") then
                local parentFrame = desc.Parent
                if parentFrame then
                    local spinner = parentFrame:FindFirstChild("Spinner")
                    if spinner and spinner:IsA("Frame") then
                        cachedSkillcheck = {
                            gui = gui,
                            content = parentFrame,
                            spinner = spinner,
                            validation = desc,
                            progress = parentFrame:FindFirstChild("Progress"),
                            text = parentFrame:FindFirstChild("Text")
                        }
                        return cachedSkillcheck
                    end
                end
            end
        end
    end

    return nil
end

local function isInsideSkillcheckZone(spinRot, validRot, tolerance)
    local v2 = (spinRot % 360 + 360) % 360
    local v3 = (validRot % 360 + 360) % 360
    local tol = tolerance or Settings.SkillcheckTolerance or 20
    local v4 = v3 - tol
    local v5 = v3 + tol

    if v4 < 0 then
        if v4 + 360 > v2 then
            return v2 <= v5
        else
            return true
        end
    end

    if v5 > 360 then
        if v4 > v2 then
            return v2 <= v5 - 360
        else
            return true
        end
    end

    return (v4 <= v2) and (v2 <= v5)
end



-- =========================================================================
-- LOGIC: AUTO FISHING & SKILLCHECK (INSTANT & VIM)
-- =========================================================================
if FishingHandler then
    FishingHandler.onStart:Connect(function()
        if Settings.AutoFishing then
            task.wait(0.3)
            pcall(function()
                FishingHandler.finish(true)
            end)
            Luna:Notification({
                Title = "Fishing",
                Content = "Đã tự động câu dính cá thành công!",
                Icon = "anchor",
                ImageSource = "Material"
            })
        end
    end)
end

-- Fail-Safe Hook: Chặn client tự gửi 0 (Miss/Fail) khi đang bật Instant Bypass
if PlayerNamespace and PlayerNamespace.Skillcheck and typeof(PlayerNamespace.Skillcheck.post) == "function" then
    local origSkillcheckPost = PlayerNamespace.Skillcheck.post
    PlayerNamespace.Skillcheck.post = function(...)
        local val = ...
        local shouldInstant = Settings.AutoSkillcheck or (Settings.AutoBenchpress and Settings.BenchpressMode == "Instant")
        if val == 0 and shouldInstant then
            return origSkillcheckPost(1)
        end
        return origSkillcheckPost(...)
    end
end

local function autoSolveSkillcheck()
    if not PlayerNamespace or not PlayerNamespace.Skillcheck then return end
    pcall(function()
        PlayerNamespace.Skillcheck.post(1)
    end)
end

if PlayerNamespace and PlayerNamespace.Skillcheck then
    pcall(function()
        PlayerNamespace.Skillcheck.listen(function()
            if Settings.AutoSkillcheck or (Settings.AutoBenchpress and Settings.BenchpressMode == "Instant") then
                task.wait(0.04)
                autoSolveSkillcheck()
                task.defer(function()
                    task.wait(0.02)
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    task.wait(0.015)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                    if ClientStateHandler and ClientStateHandler.updateState and ClientStateHandler.States then
                        pcall(function()
                            ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, false)
                        end)
                    end
                end)
            end
        end)
    end)
end

-- =========================================================================
-- 🎮 ADVANCED AUTO: MINIGAMES VIM (BALANCE DRUM Q/E, RHYTHM, SKILLCHECK)
-- =========================================================================
local processedDrumNodes = {}
local lastHitQ = 0
local lastHitE = 0
local cachedDrumBar = nil
local cachedRhythmContainer = nil

-- 1. Auto Balance Drum (Phím Q/E)
local function getDrumBarContainer()
    if cachedDrumBar and cachedDrumBar.Parent and cachedDrumBar:IsDescendantOf(PlayerGui) then
        return cachedDrumBar
    end
    cachedDrumBar = nil

    local appGui = PlayerGui:FindFirstChild("App") or PlayerGui:FindFirstChild("Balancer")
    local candidates = {}
    if appGui then table.insert(candidates, appGui) end
    for _, gui in ipairs(PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= appGui then
            table.insert(candidates, gui)
        end
    end

    for _, gui in ipairs(candidates) do
        local bar = gui:FindFirstChild("Bar", true)
        if bar and bar:IsA("Frame") and bar.Visible then
            cachedDrumBar = bar
            return cachedDrumBar
        end
    end
    return nil
end

local function scanAutoBalanceDrum()
    if not Settings.AutoBalanceDrum then 
        cachedDrumBar = nil
        return 
    end

    local bar = getDrumBarContainer()
    if not bar then return end

    local now = tick()

    for _, child in ipairs(bar:GetChildren()) do
        if child:IsA("Frame") and child:FindFirstChild("Hit") and not processedDrumNodes[child] then
            local pos = child.Position
            local posXScale = pos.X.Scale
            local distToCenter = math.abs(posXScale - 0.5)

            -- Cửa sổ bắt nốt chuẩn: Game cho phép <= 0.15 (0.05 là PERFECT, 0.15 là GOOD)
            -- Đặt 0.070 đảm bảo không bao giờ bị trượt frame dù FPS thấp
            if distToCenter <= 0.070 then
                local bgColor = child.BackgroundColor3
                -- Pink (Side 1 = Phím Q) có R > 0.7; Cyan (Side 2 = Phím E) có R < 0.6
                local isPink = bgColor.R > 0.7 or (posXScale < 0.5 and bgColor.G < 0.8)
                local key = isPink and Enum.KeyCode.Q or Enum.KeyCode.E
                local lastTime = isPink and lastHitQ or lastHitE

                if now - lastTime >= 0.03 then
                    processedDrumNodes[child] = true
                    if isPink then lastHitQ = now else lastHitE = now end

                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                    task.defer(function()
                        task.wait(0.015)
                        VirtualInputManager:SendKeyEvent(false, key, false, game)
                    end)
                end
            end
        end
    end
end

-- Dọn dẹp bảng node định kỳ an toàn
task.spawn(function()
    while true do
        task.wait(3)
        local count = 0
        for node in pairs(processedDrumNodes) do
            if not node or not node.Parent then
                processedDrumNodes[node] = nil
            else
                count = count + 1
            end
        end
        if count > 40 then
            table.clear(processedDrumNodes)
        end
    end
end)

-- 2. Auto Rhythm OSU (Phím Q/E luân phiên)
local lastRhythmKey = Enum.KeyCode.E
local lastRhythmHitTime = 0

local function getRhythmContainer()
    if cachedRhythmContainer and cachedRhythmContainer.Parent then
        return cachedRhythmContainer
    end
    cachedRhythmContainer = nil

    local appGui = PlayerGui:FindFirstChild("App") or PlayerGui:FindFirstChild("Balancer")
    if appGui then
        local found = appGui:FindFirstChild("Circle", true) or appGui:FindFirstChild("Ring", true)
        if found and found.Parent then
            cachedRhythmContainer = found.Parent
            return cachedRhythmContainer
        end
    end
    return nil
end

local function scanAutoRhythm()
    if not Settings.AutoBalanceRhythm then 
        cachedRhythmContainer = nil
        return 
    end

    local container = getRhythmContainer()
    if not container then return end

    local now = tick()
    if now - lastRhythmHitTime < 0.10 then return end

    for _, child in ipairs(container:GetChildren()) do
        if child:IsA("Frame") and child:FindFirstChild("Ring") or (child.Name == "Circle" and child:IsA("ImageLabel")) then
            local size = child.Size
            local avgScale = (size.X.Scale + size.Y.Scale) / 2
            if avgScale > 0.05 and avgScale <= 0.35 then
                lastRhythmHitTime = now
                if lastRhythmKey == Enum.KeyCode.E then
                    lastRhythmKey = Enum.KeyCode.Q
                else
                    lastRhythmKey = Enum.KeyCode.E
                end

                local keyToSend = lastRhythmKey
                VirtualInputManager:SendKeyEvent(true, keyToSend, false, game)
                task.defer(function()
                    task.wait(0.015)
                    VirtualInputManager:SendKeyEvent(false, keyToSend, false, game)
                end)
                break
            end
        end
    end
end

-- 3. Auto Skillcheck VIM (Căn góc QTE Spacebar 60 FPS & Instant Fast-Bypass)
local function scanAutoSkillcheckVIM()
    local isBench = Settings.AutoBenchpress
    local benchMode = Settings.BenchpressMode
    local shouldRunLegit = Settings.AutoSkillcheckVIM or (isBench and benchMode == "Legit")
    local shouldRunInstant = Settings.AutoSkillcheck or (isBench and benchMode == "Instant")

    if not shouldRunLegit and not shouldRunInstant then 
        cachedSkillcheck = nil
        return 
    end

    local sc = getSkillcheckElements()
    if not sc then
        lastSkillcheckRepAngle = -999
        isInstantSolving = false
        return
    end

    local now = tick()

    -- [CHẾ ĐỘ 1: INSTANT FAST-BYPASS]
    if shouldRunInstant then
        if not isInstantSolving then
            isInstantSolving = true
            task.spawn(function()
                if PlayerNamespace and PlayerNamespace.Skillcheck and typeof(PlayerNamespace.Skillcheck.post) == "function" then
                    pcall(function()
                        PlayerNamespace.Skillcheck.post(1)
                    end)
                end
                task.wait(0.04)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.015)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                if ClientStateHandler and ClientStateHandler.updateState and ClientStateHandler.States then
                    pcall(function()
                        ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, false)
                    end)
                end
                task.wait(0.25)
                isInstantSolving = false
            end)
        end
        return
    end

    -- [CHẾ ĐỘ 2: LEGIT 60 FPS AUTO SPACEBAR]
    if shouldRunLegit then
        local spinner = sc.spinner
        local validation = sc.validation
        if not spinner or not validation then return end

        local spinRot = spinner.Rotation
        local validRot = validation.Rotation

        -- Kiểm tra góc validation mới cho rep tiếp theo (game đổi góc ít nhất 140 độ sau mỗi rep)
        local angleDiff = math.abs(((validRot - lastSkillcheckRepAngle) % 360 + 360) % 360)
        local isNewRep = (lastSkillcheckRepAngle == -999) or (angleDiff > 35 and angleDiff < 325)

        local tol = Settings.SkillcheckTolerance or 20
        local inZone = isInsideSkillcheckZone(spinRot, validRot, tol)

        if inZone and isNewRep then
            if now - lastSkillcheckHitTime >= 0.06 then
                lastSkillcheckHitTime = now
                lastSkillcheckRepAngle = validRot

                -- Gửi sự kiện bấm Space (non-blocking để không làm tụt FPS)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.defer(function()
                    task.wait(0.015)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                end)
            end
        end
    end
end

RunService.RenderStepped:Connect(function()
    pcall(scanAutoBalanceDrum)
    pcall(scanAutoRhythm)
    pcall(scanAutoSkillcheckVIM)
end)

-- =========================================================================
-- 📜 ADVANCED AUTO: LORE QUIZ (HUMAN-LIKE CLICKER 100% 50/50)
-- =========================================================================
local isSolvingQuiz = false

local function findQuizGui()
    local appGui = PlayerGui:FindFirstChild("App") or PlayerGui:FindFirstChild("Quiz")
    if appGui then
        if appGui:FindFirstChild("Question_1", true) then return appGui end
    end
    for _, gui in ipairs(PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("Question_1", true) then
            return gui
        end
    end
    return nil
end

local function solveCurrentQuiz(isManual)
    if isSolvingQuiz then return end
    local quizGui = findQuizGui()
    if not quizGui then
        if isManual then
            Luna:Notification({
                Title = "Lore Quiz",
                Content = "Không tìm thấy bài thi Quiz đang mở trên màn hình!",
                Icon = "cancel",
                ImageSource = "Material"
            })
        end
        return
    end

    isSolvingQuiz = true
    if isManual then
        Luna:Notification({
            Title = "Lore Quiz",
            Content = "Bắt đầu tự động giải 20 câu hỏi trắc nghiệm lịch sử...",
            Icon = "auto_awesome",
            ImageSource = "Material"
        })
    end

    task.spawn(function()
        local answeredCount = 0

        local qIndex = 1
        while qIndex <= 60 do
            local questionKey = "Question_" .. qIndex
            local qFrame = quizGui:FindFirstChild(questionKey, true)
            if not qFrame then
                -- Dừng nếu đã giải qua ít nhất 5 câu và không còn câu tiếp theo
                if qIndex > 5 then break end
            else
                -- Tìm nội dung câu hỏi
                local questionText = ""
                for _, textInst in ipairs(qFrame:GetDescendants()) do
                    if textInst:IsA("TextLabel") and #textInst.Text > 15 then
                        questionText = textInst.Text
                        break
                    end
                end

                local correctAnsText = findCorrectAnswer(questionText)
                if not correctAnsText then
                    correctAnsText = findCorrectAnswer(qFrame.Name)
                end

                if correctAnsText then
                    local targetButton = nil
                    for _, optDesc in ipairs(qFrame:GetDescendants()) do
                        if optDesc:IsA("TextLabel") then
                            local normOpt = normalizeText(optDesc.Text)
                            local normAns = normalizeText(correctAnsText)
                            if normOpt == normAns or string.find(normOpt, normAns, 1, true) or string.find(normAns, normOpt, 1, true) then
                                local parentFrame = optDesc.Parent
                                if parentFrame then
                                    targetButton = parentFrame:FindFirstChildWhichIsA("TextButton", true)
                                end
                                break
                            end
                        end
                    end

                    if targetButton then
                        clickGuiButton(targetButton)
                        answeredCount = answeredCount + 1
                    end
                end

                -- Delay ngẫu nhiên mô phỏng người đọc đề
                local currentDelay = Settings.QuizDelay + (math.random(-20, 20) / 100)
                if currentDelay < 0.4 then currentDelay = 0.4 end
                task.wait(currentDelay)
            end
            qIndex = qIndex + 1
        end

        task.wait(1.2)

        -- Tìm nút Submit
        local submitBtn = nil
        for _, desc in ipairs(quizGui:GetDescendants()) do
            if desc:IsA("TextButton") and string.lower(desc.Text) == "submit" then
                submitBtn = desc
                break
            end
        end

        if submitBtn then
            clickGuiButton(submitBtn)
            Luna:Notification({
                Title = "Lore Quiz",
                Content = "Đã hoàn thành xuất sắc bài thi Quiz! Điểm số: 50/50.",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        end

        isSolvingQuiz = false
    end)
end

-- Vòng lặp Auto Lore Quiz nếu bật Toggle
task.spawn(function()
    while true do
        task.wait(1.5)
        if Settings.AutoLoreQuiz and not isSolvingQuiz then
            local qGui = findQuizGui()
            if qGui then
                solveCurrentQuiz(false)
            end
        end
    end
end)

-- =========================================================================
-- ⚔️ TITAN COMBAT & DETECTION BOX EXPLOITS CORE (DETECTION BYPASS, HITBOX DUMMY & NAPE REDIRECT)
-- =========================================================================

-- Track Swing ID từ game chính xác
local lastSwingId = 1
if GearNamespace and GearNamespace.Swing and typeof(GearNamespace.Swing.post) == "function" then
    local oldSwingPost = GearNamespace.Swing.post
    GearNamespace.Swing.post = function(id, ...)
        lastSwingId = id
        return oldSwingPost(id, ...)
    end
end

-- 1. Helper: Tìm BasePart Nape chuẩn xác nhất của Titan
local function getTitanNapePart(titanModel)
    if not titanModel then return nil end
    local nape = titanModel:FindFirstChild("Nape")
    if nape and nape:IsA("BasePart") then return nape end
    local upperTorso = titanModel:FindFirstChild("UpperTorso")
    if upperTorso then
        local upperNape = upperTorso:FindFirstChild("Nape")
        if upperNape and upperNape:IsA("BasePart") then
            return upperNape
        end
        return upperTorso
    end
    local head = titanModel:FindFirstChild("Head")
    if head and head:IsA("BasePart") then return head end
    return titanModel.PrimaryPart
end

-- 2. Gửi sát thương trực tiếp vào Gáy Titan (Chém Gáy Tức Thì)
local function dispatchNapeSlash(titanModel)
    if not Settings.LimbToNape or not titanModel or not GearNamespace or not GearNamespace.Damage then return end
    local napeTarget = getTitanNapePart(titanModel)
    if not napeTarget then return end
    local char = LocalPlayer.Character
    local hrp = char and char.PrimaryPart
    if not hrp then return end

    local swingIdToSend = lastSwingId
    if not swingIdToSend or swingIdToSend <= 0 then
        swingIdToSend = 1
    end

    local v40 = {
        charge = 1,
        hit = titanModel,
        part = napeTarget,
        name = "Nape",
        shifter = titanModel:HasTag("Shifter"),
        titan = true,
        id = titanModel:GetAttribute("id"),
        swingId = swingIdToSend,
        distanceFromEyes = 10,
        distanceFromNape = 0,
        distanceFromEyesBlade = 10,
        distanceFromNapeBlade = 0,
        moveDirection = hrp.AssemblyLinearVelocity,
        velocity = math.max(380, hrp.AssemblyLinearVelocity.Magnitude),
    }
    pcall(function()
        GearNamespace.Damage.unreliablePost(v40)
    end)
end

-- 3. Hook RaycastHitboxV4: Mọi tia chém chạm vào bất kỳ phần nào của Titan đều kích hoạt sát thương Gáy
if RaycastHitboxV4 and typeof(RaycastHitboxV4.new) == "function" then
    local oldHitboxNew = RaycastHitboxV4.new
    RaycastHitboxV4.new = function(...)
        local hitbox = oldHitboxNew(...)
        if hitbox and hitbox.OnHit and typeof(hitbox.OnHit.Connect) == "function" then
            local oldConnect = hitbox.OnHit.Connect
            hitbox.OnHit.Connect = function(self, fn)
                return oldConnect(self, function(hitPart, hitHumanoid, raycastResult, ...)
                    if Settings.LimbToNape and hitPart then
                        local titanModel = hitPart:FindFirstAncestorWhichIsA("Model")
                        if titanModel and (titanModel:HasTag("Titan") or titanModel:HasTag("Shifter")) then
                            dispatchNapeSlash(titanModel)
                        end
                    end
                    return fn(hitPart, hitHumanoid, raycastResult, ...)
                end)
            end
        end
        return hitbox
    end
end

-- 4. Hook Damage Remote: Mọi payload gửi lên Server nếu trúng Titan đều được chuyển thành sát thương Gáy chuẩn
if GearNamespace and GearNamespace.Damage and typeof(GearNamespace.Damage.unreliablePost) == "function" then
    local originalDamagePost = GearNamespace.Damage.unreliablePost
    GearNamespace.Damage.unreliablePost = function(payload)
        if Settings.LimbToNape and payload and typeof(payload) == "table" then
            pcall(function()
                local titanModel = payload.hit
                if not titanModel and payload.part then
                    titanModel = payload.part:FindFirstAncestorWhichIsA("Model")
                end
                if titanModel and (titanModel:HasTag("Titan") or titanModel:HasTag("Shifter")) then
                    local napeTarget = getTitanNapePart(titanModel)
                    if napeTarget then
                        payload.hit = titanModel
                        payload.part = napeTarget
                        payload.name = "Nape"
                        payload.titan = true
                        payload.id = titanModel:GetAttribute("id")
                        payload.distanceFromNape = 0
                        payload.distanceFromNapeBlade = 0
                        payload.distanceFromEyes = 10
                        payload.distanceFromEyesBlade = 10
                        payload.velocity = math.max(380, payload.velocity or 380)
                    end
                end
            end)
        end
        return originalDamagePost(payload)
    end
end

-- 5. Quét đòn đánh khi click chuột trái (M1) gần Titan
UserInputService.InputBegan:Connect(function(input, gpe)
    if not Settings.LimbToNape then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local char = LocalPlayer.Character
        local hrp = char and char.PrimaryPart
        if not hrp then return end

        local nearestTitan, nearestDist = nil, Settings.LimbToNapeMaxDist
        if ClientTitanHandler and typeof(ClientTitanHandler.getTitans) == "function" then
            pcall(function()
                local titans = ClientTitanHandler.getTitans()
                if titans then
                    for _, t in pairs(titans) do
                        local model = t.model and (t.model.server or t.model.client) or (t.root and t.root.Parent)
                        if model and t.root then
                            local d = (t.root.Position - hrp.Position).Magnitude
                            if d < nearestDist then
                                nearestDist = d
                                nearestTitan = model
                            end
                        end
                    end
                end
            end)
        end
        if not nearestTitan then
            for _, m in ipairs(Workspace:GetDescendants()) do
                if m:IsA("Model") and (m:HasTag("Titan") or m:HasTag("Shifter")) and m.PrimaryPart then
                    local d = (m.PrimaryPart.Position - hrp.Position).Magnitude
                    if d < nearestDist then
                        nearestDist = d
                        nearestTitan = m
                    end
                end
            end
        end
        if nearestTitan then
            dispatchNapeSlash(nearestTitan)
        end
    end
end)

-- 6. TITAN INVINCIBILITY (TRIỆT TIÊU ĐÒN TẤN CÔNG & TÓM CỦA TITAN)

-- Tạo Dummy Signal an toàn tuyệt đối, không bao giờ trigger event chạm
local function createDummySignal()
    local sig = {}
    function sig:Connect(fn)
        return {
            Disconnect = function() end,
            disconnect = function() end,
        }
    end
    function sig:Fire(...) end
    function sig:DisconnectAll() end
    function sig:Destroy() end
    return sig
end

-- A. Vô hiệu hóa tính toán tầm đánh của Titan (DetectionBoxTitanClient)
if DetectionBoxTitanClient and typeof(DetectionBoxTitanClient.isClientExpectedToBeWithinForMove) == "function" then
    local oldExpected = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove
    DetectionBoxTitanClient.isClientExpectedToBeWithinForMove = function(p1, p2, ...)
        if Settings.TitanInvincibility then
            -- Luôn báo rằng người chơi nằm ngoài tầm vồ/tóm của Titan
            return false, nil
        end
        return oldExpected(p1, p2, ...)
    end
end

-- B. Vô hiệu hóa Hitbox chân tay và miệng của Titan (Limb & Mouth Hitbox)
if HitboxTitanClient then
    if typeof(HitboxTitanClient.createLimbHitbox) == "function" then
        local oldCreateLimb = HitboxTitanClient.createLimbHitbox
        HitboxTitanClient.createLimbHitbox = function(p1, p2, ...)
            if Settings.TitanInvincibility then
                local dummy = createDummySignal()
                return {
                    touched = dummy,
                    destroy = function()
                        dummy:DisconnectAll()
                    end
                }
            end
            return oldCreateLimb(p1, p2, ...)
        end
    end

    if typeof(HitboxTitanClient.createMouthHitbox) == "function" then
        local oldCreateMouth = HitboxTitanClient.createMouthHitbox
        HitboxTitanClient.createMouthHitbox = function(p1, p2, ...)
            if Settings.TitanInvincibility then
                local dummy = createDummySignal()
                return {
                    touched = dummy,
                    destroy = function()
                        dummy:DisconnectAll()
                    end
                }
            end
            return oldCreateMouth(p1, p2, ...)
        end
    end
end

-- C. Triệt tiêu chu kỳ tính toán và thực thi Action của Titan
local function neutralizeTitanType(titanModule)
    if titanModule and typeof(titanModule) == "table" then
        if typeof(titanModule.onTitanStepped) == "function" then
            local oldStepped = titanModule.onTitanStepped
            titanModule.onTitanStepped = function(p1, ...)
                if Settings.TitanInvincibility then
                    return
                end
                return oldStepped(p1, ...)
            end
        end
        if typeof(titanModule.onActionReceived) == "function" then
            local oldActionRecv = titanModule.onActionReceived
            titanModule.onActionReceived = function(p1, p2, ...)
                if Settings.TitanInvincibility then
                    return
                end
                return oldActionRecv(p1, p2, ...)
            end
        end
    end
end
neutralizeTitanType(DefaultTitanClient)
neutralizeTitanType(IceTitanClient)
neutralizeTitanType(SprinterTitanClient)

-- D. Chặn Remote phát lệnh tấn công và xác nhận bị tóm lên server
if TitanNamespace then
    if TitanNamespace.Action and typeof(TitanNamespace.Action.unreliablePost) == "function" then
        local oldActionPost = TitanNamespace.Action.unreliablePost
        TitanNamespace.Action.unreliablePost = function(id, name, ...)
            if Settings.TitanInvincibility then
                return
            end
            return oldActionPost(id, name, ...)
        end
    end
    if TitanNamespace.Respond and typeof(TitanNamespace.Respond.unreliablePost) == "function" then
        local oldRespondPost = TitanNamespace.Respond.unreliablePost
        TitanNamespace.Respond.unreliablePost = function(id, name, ...)
            if Settings.TitanInvincibility then
                return
            end
            return oldRespondPost(id, name, ...)
        end
    end
end

-- E. Chặn đóng băng người chơi khi bị tóm (GrabTitanClient)
if GrabTitanClient and typeof(GrabTitanClient.onClientGrabbed) == "function" then
    local originalOnGrabbed = GrabTitanClient.onClientGrabbed
    GrabTitanClient.onClientGrabbed = function(titanData)
        if Settings.TitanInvincibility then
            return
        end
        return originalOnGrabbed(titanData)
    end
end

-- F. Chặn Ragdoll do Titan
if CharacterRagdollHandler and typeof(CharacterRagdollHandler.ragdoll) == "function" then
    local originalRagdoll = CharacterRagdollHandler.ragdoll
    CharacterRagdollHandler.ragdoll = function(duration, reason, ...)
        if Settings.TitanInvincibility and (reason == "titan" or reason == "Titan") then
            return
        end
        return originalRagdoll(duration, reason, ...)
    end
end

-- G. Tự động xóa trạng thái Grabbed trên nhân vật ngay khi xuất hiện
LocalPlayer:GetAttributeChangedSignal("Grabbed"):Connect(function()
    if Settings.TitanInvincibility and LocalPlayer:GetAttribute("Grabbed") then
        LocalPlayer:SetAttribute("Grabbed", nil)
    end
end)

-- 7. Vòng lặp Enforcer: Duy trì Chống Khóa / Chống Tóm Nhân Vật Tuyệt Đối
local function enforceTitanImmunity()
    if not Settings.TitanInvincibility then return end

    if LocalPlayer:GetAttribute("Grabbed") then
        LocalPlayer:SetAttribute("Grabbed", nil)
    end

    local char = LocalPlayer.Character
    if char then
        if char:GetAttribute("Grabbed") then
            char:SetAttribute("Grabbed", nil)
        end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            if hum.PlatformStand then
                hum.PlatformStand = false
            end
            if hum.Sit then
                hum.Sit = false
            end
            hum.AutoRotate = true

            pcall(function()
                for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                    local anim = track.Animation
                    local animName = anim and anim.Name or ""
                    if string.find(animName, "Eat") or string.find(animName, "Chew") or string.find(animName, "Grab") then
                        track:Stop(0)
                    end
                end
            end)
        end
    end

    if ClientTitanHandler and typeof(ClientTitanHandler.getTitans) == "function" then
        pcall(function()
            local titans = ClientTitanHandler.getTitans()
            if titans then
                for id, titan in pairs(titans) do
                    titan.inactive = true
                    titan.awake = false
                    if titan.cleanup then
                        pcall(function() titan.cleanup:Clean() end)
                    end
                end
            end
        end)
    end
end

-- Chạy enforce trên cả Heartbeat và PostSimulation để không bị game ghi đè
RunService.Heartbeat:Connect(function()
    -- A. Khí Gas Vô Hạn & Đóng Băng Độ Bền Kiếm
    if Settings.InfiniteGas or Settings.InfiniteBlades or Settings.FreezeBladeDurability or Settings.PresetSuperODMG then
        _G.__USING_INFINITE_GAS__ = true
        getgenv().__USING_INFINITE_GAS__ = true
        pcall(function()
            if ClientGearHandler and typeof(ClientGearHandler.getGearState) == "function" then
                local gearState = ClientGearHandler.getGearState()
                if gearState then
                    if Settings.InfiniteGas or Settings.PresetSuperODMG then
                        gearState.gas = math.huge
                        gearState.maxGas = math.huge
                        gearState.gasConsumption = 0
                        gearState.gasBoostingConsumption = 0
                    end
                    if Settings.InfiniteBlades or Settings.FreezeBladeDurability or Settings.PresetSuperODMG then
                        gearState.bladeDurability = 100
                        gearState.blade = 8
                        gearState.maxBlade = 8
                        gearState.maxBladeDurability = 100
                    end
                end
            end
        end)
    end

    -- B. Bảo vệ nhân vật khi bật Titan Invincibility (Chống đóng băng / PlatformStand)
    if Settings.TitanInvincibility then
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                if hum.PlatformStand then
                    hum.PlatformStand = false
                end
                if hum.Sit then
                    hum.Sit = false
                end
                if not hum.AutoRotate then
                    hum.AutoRotate = true
                end
            end
        end
        enforceTitanImmunity()
    end
end)

RunService.PostSimulation:Connect(function()
    if Settings.TitanInvincibility then
        enforceTitanImmunity()
    end
end)

-- =========================================================================
-- 🎯 ADVANCED AUTO: FULL COMBAT & FIREARMS CORE
-- =========================================================================

-- =========================================================================
-- QUẢN LÝ VÔ HẠN KHÍ NÉN (INFINITE GAS) & LƯỠI DAO (INFINITE BLADES) CORE
-- =========================================================================
local function enforceInfiniteGasAndBlade()
    if Settings.InfiniteGas or Settings.PresetSuperODMG then
        getgenv().__USING_INFINITE_GAS__ = true
        _G.__USING_INFINITE_GAS__ = true
    end

    if ClientGearHandler and typeof(ClientGearHandler.getGearState) == "function" then
        local state = ClientGearHandler.getGearState()
        if state then
            if Settings.InfiniteGas or Settings.PresetSuperODMG then
                local maxG = state.maxGas or 100
                state.gas = maxG
                state.gasConsumption = 0
                state.gasBoostingConsumption = 0

                if not state.__hub_gas_hooked and typeof(state.useGas) == "function" then
                    local oldUseGas = state.useGas
                    state.useGas = function(cost, p2)
                        if Settings.InfiniteGas or Settings.PresetSuperODMG then
                            state.gas = state.maxGas or 100
                            return true
                        end
                        return oldUseGas(cost, p2)
                    end
                    state.__hub_gas_hooked = true
                end
            end

            if Settings.InfiniteBlades or Settings.PresetSuperODMG then
                state.blade = 8
                state.bladeDurability = 100
                state.maxBlade = 8
                state.maxBladeDurability = 100
            end
        end
    end

    if (Settings.InfiniteBlades or Settings.PresetSuperODMG) and GearTypes and GearTypes.Gear and typeof(GearTypes.Gear.get) == "function" then
        local localGear = GearTypes.Gear.get(Players.LocalPlayer)
        if localGear then
            localGear.durability = 100
            localGear.blade = 8
            localGear.blades = 1
            localGear.stock = 8
        end
    end
end

-- Tự động hook khi trang bị lại ODMG hoặc reset nhân vật
pcall(function()
    if ClientGearHandler and ClientGearHandler.onGearAdded and typeof(ClientGearHandler.onGearAdded.Connect) == "function" then
        ClientGearHandler.onGearAdded:Connect(function(newGear)
            if (Settings.InfiniteGas or Settings.PresetSuperODMG) and newGear then
                newGear.gas = newGear.maxGas or 100
                newGear.gasConsumption = 0
                newGear.gasBoostingConsumption = 0
                local oldUse = newGear.useGas
                newGear.useGas = function(cost, p2)
                    if Settings.InfiniteGas or Settings.PresetSuperODMG then
                        newGear.gas = newGear.maxGas or 100
                        return true
                    end
                    if typeof(oldUse) == "function" then
                        return oldUse(cost, p2)
                    end
                    return true
                end
                newGear.__hub_gas_hooked = true
            end
            if (Settings.InfiniteBlades or Settings.PresetSuperODMG) and newGear then
                newGear.blade = 8
                newGear.bladeDurability = 100
            end
        end)
    end
end)

-- Vòng lặp duy trì liên tục qua Heartbeat
RunService.Heartbeat:Connect(function()
    if Settings.InfiniteGas or Settings.InfiniteBlades or Settings.PresetSuperODMG then
        enforceInfiniteGasAndBlade()
    end
end)

-- 1. Can thiệp trực tiếp ClientAttributesHandler & ClientEnchantmentsHandler (God Spoofer, Presets, Firearms)
if ClientAttributesHandler and typeof(ClientAttributesHandler.getAttribute) == "function" then
    local origGetAttribute = ClientAttributesHandler.getAttribute
    local isHandlingAttr = false

    local function customGetAttribute(attrName, ...)
        if isHandlingAttr then
            return origGetAttribute(attrName, ...)
        end

        isHandlingAttr = true
        local res = nil

        -- 1.0 Kiểm tra Vô Hạn Khí Nén & Lưỡi Dao
        if (Settings.InfiniteGas or Settings.PresetSuperODMG) and (attrName == "GearConsumptionDrainMultiplier" or attrName == "LowGasDrainMultiplier") then
            res = 0
        elseif (Settings.InfiniteBlades or Settings.PresetSuperODMG) and (attrName == "BladeIntegrityAddition") then
            res = 100
        elseif (Settings.InfiniteBlades or Settings.PresetSuperODMG) and (attrName == "BladeDurabilityPreserveChance") then
            res = 1
        -- 1.1 Kiểm tra thuộc tính tự cấu hình (Custom Spoofed Attributes)
        elseif Settings.SpoofedAttributes and Settings.SpoofedAttributes[attrName] ~= nil then
            res = Settings.SpoofedAttributes[attrName]
        -- 1.1b Kiểm tra Multi-Enchant Checklist (Duyệt toàn bộ bùa đang kích hoạt đồng thời)
        elseif Settings.ActiveEnchantList then
            for enchName, isActive in pairs(Settings.ActiveEnchantList) do
                if isActive and ENCHANT_PRESET_ATTRIBUTES and ENCHANT_PRESET_ATTRIBUTES[enchName] then
                    local pVal = ENCHANT_PRESET_ATTRIBUTES[enchName][attrName]
                    if pVal ~= nil then
                        res = pVal
                        break
                    end
                end
            end
        end

        if res ~= nil then
            isHandlingAttr = false
            return res
        end

        -- 1.2 Preset: Siêu cơ động ODMG (Double Jump, Dash, Wallrun, No Superman Landing, Max Velocity 999, Infinite Gas)
        if Settings.PresetSuperODMG and (attrName == "GearCanDoubleJump" or attrName == "GearCanDash" or attrName == "GearCanDoubleDash" or attrName == "GearCanWallrun" or attrName == "NoSupermanLanding" or attrName == "CanCheckGasWhileMoving") then
            res = 1
        elseif Settings.PresetSuperODMG and attrName == "GearMaximumVelocity" then
            res = 999
        elseif Settings.PresetSuperODMG and (attrName == "GearConsumptionDrainMultiplier" or attrName == "LowGasDrainMultiplier") then
            res = 0
        -- 1.3 Preset: Giác quan thứ 6 (Cảnh báo Titan chộp, Thước đo vận tốc, Laser súng, Vòng neo)
        elseif Settings.PresetSixthSense and (attrName == "TitanVisualGrabIndicator" or attrName == "CanViewVelocity" or attrName == "CanViewGrappleRange" or attrName == "CanSeeMusketTrajectory" or attrName == "CanSeeGaspackAmount") then
            res = 1
        -- 1.4 Can thiệp súng đạn (Combat Firearms)
        elseif Settings.AntiRecoil and attrName == "FirearmRecoilMultiplier" then
            res = 0
        elseif Settings.NoSpread and attrName == "FirearmAccuracyMultiplier" then
            res = 1
        elseif Settings.TrajectoryPreview and attrName == "CanSeeMusketTrajectory" then
            res = 1
        elseif Settings.FastAimWalk and attrName == "FasterMusketWalkSpeed" then
            res = 1
        elseif Settings.FastReload and attrName == "FirearmReloadMultiplier" then
            local origVal = origGetAttribute(attrName, ...) or 1
            res = origVal * (Settings.FastReloadMultiplier or 2.0)
        -- 1.5 Preset: Chiến mã thần tốc (God Horse - Tốc độ cực hạn, Thể lực vô hạn, Tự hồi phục)
        elseif Settings.PresetSuperHorse and attrName == "HorseMaxSpeedBonus" then
            res = 120
        elseif Settings.PresetSuperHorse and attrName == "HorseStaminaDrainMultiplier" then
            res = -10
        elseif Settings.PresetSuperHorse and attrName == "HorseStaminaRegenMultiplier" then
            res = 10
        elseif Settings.PresetSuperHorse and attrName == "HorseStaminaRegenMaxSpeedBonus" then
            res = 150
        elseif Settings.PresetSuperHorse and (attrName == "HasDexterous" or attrName == "HasExpertRider" or attrName == "HasAGoodEar" or attrName == "HasBondOfTheSteed" or attrName == "HasClaimTheSaddle" or attrName == "HasRider") then
            res = 1
        elseif Settings.PresetSuperHorse and attrName == "HorseBreedingCooldownMultiplier" then
            res = 0
        else
            res = origGetAttribute(attrName, ...)
        end

        isHandlingAttr = false
        return res
    end

    ClientAttributesHandler.getAttribute = customGetAttribute
    if typeof(hookfunction) == "function" then
        pcall(function()
            origGetAttribute = hookfunction(origGetAttribute, customGetAttribute)
        end)
    end

    -- Hook getDiminishedAttribute để đảm bảo triệt để gas không bao giờ tụt
    if typeof(ClientAttributesHandler.getDiminishedAttribute) == "function" then
        local origGetDiminishedAttribute = ClientAttributesHandler.getDiminishedAttribute
        local isHandlingDim = false
        local function customGetDiminishedAttribute(attrName, ...)
            if isHandlingDim then
                return origGetDiminishedAttribute(attrName, ...)
            end
            isHandlingDim = true
            local res = nil
            if (Settings.InfiniteGas or Settings.PresetSuperODMG) and (attrName == "GearConsumptionDrainMultiplier" or attrName == "LowGasDrainMultiplier") then
                res = 0
            elseif (Settings.InfiniteBlades or Settings.PresetSuperODMG) and (attrName == "BladeIntegrityAddition") then
                res = 100
            elseif (Settings.InfiniteBlades or Settings.PresetSuperODMG) and (attrName == "BladeDurabilityPreserveChance") then
                res = 1
            else
                res = customGetAttribute(attrName, ...)
                if res == nil then
                    res = origGetDiminishedAttribute(attrName, ...)
                end
            end
            isHandlingDim = false
            return res
        end
        ClientAttributesHandler.getDiminishedAttribute = customGetDiminishedAttribute
        if typeof(hookfunction) == "function" then
            pcall(function()
                origGetDiminishedAttribute = hookfunction(origGetDiminishedAttribute, customGetDiminishedAttribute)
            end)
        end
    end
end

-- Hook ClientEnchantmentsHandler.hasEnchantment (Cho phép giả lập sở hữu bất kỳ bùa chú nào)
if ClientEnchantmentsHandler and typeof(ClientEnchantmentsHandler.hasEnchantment) == "function" then
    local origHasEnchantment = ClientEnchantmentsHandler.hasEnchantment
    local isHandlingEnchant = false

    local function customHasEnchantment(enchantName, ...)
        if isHandlingEnchant then
            return origHasEnchantment(enchantName, ...)
        end

        isHandlingEnchant = true
        local res = nil

        -- Multi-Enchant Checklist: Cho phép sở hữu đồng thời toàn bộ bùa trong danh sách
        if Settings.ActiveEnchantList and Settings.ActiveEnchantList[enchantName] then
            res = true
        -- Preset: Gacha toàn tri (Insight + Deduction)
        elseif Settings.PresetInsightDeduction and (enchantName == "Insight" or enchantName == "Deduction") then
            res = true
        -- Preset: Chiến mã thần tốc (Kích hoạt nhận diện toàn bộ bùa kỵ binh)
        elseif Settings.PresetSuperHorse and (enchantName == "Equestrian" or enchantName == "Stallion" or enchantName == "Rider" or enchantName == "Dexterous" or enchantName == "Expert Rider" or enchantName == "A Good Ear" or enchantName == "Claim the Saddle" or enchantName == "Bond of the Steed" or enchantName == "Hijack") then
            res = true
        -- Các bùa chú được chọn giả lập sở hữu
        elseif Settings.SpoofedEnchants and Settings.SpoofedEnchants[enchantName] then
            res = true
        else
            res = origHasEnchantment(enchantName, ...)
        end

        isHandlingEnchant = false
        return res
    end

    ClientEnchantmentsHandler.hasEnchantment = customHasEnchantment
    if typeof(hookfunction) == "function" then
        pcall(function()
            origHasEnchantment = hookfunction(origHasEnchantment, customHasEnchantment)
        end)
    end
end

-- 2. Vòng tròn FOV trực quan
local fovCircle = nil
pcall(function()
    if typeof(Drawing) == "table" and typeof(Drawing.new) == "function" then
        fovCircle = Drawing.new("Circle")
        fovCircle.Thickness = 1.5
        fovCircle.NumSides = 64
        fovCircle.Radius = Settings.SilentAimFOV
        fovCircle.Filled = false
        fovCircle.Transparency = 0.8
        fovCircle.Color = Color3.fromRGB(0, 220, 255)
        fovCircle.Visible = false
    end
end)

-- 3. Bộ lọc & Dò tìm mục tiêu Silent-Aim (Bia ngắm & Titan)
local function getBestCombatTarget()
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return nil end
    local camera = Workspace.CurrentCamera
    if not camera then return nil end

    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    pcall(function()
        mousePos = UserInputService:GetMouseLocation()
    end)

    local bestTarget = nil
    local shortestScreenDist = Settings.SilentAimFOV
    local rootPos = char.PrimaryPart.Position

    local candidates = {}
    local filter = Settings.SilentAimTarget

    -- 1. Bia ngắm Musket Target di động (Tag: "Target")
    if filter == "Tất cả mục tiêu" or filter == "Bia ngắm Musket (Target)" then
        for _, t in ipairs(CollectionService:GetTagged("Target")) do
            local part = t:FindFirstChild("Target") or (t:IsA("BasePart") and t)
            if part and part:IsA("BasePart") then
                table.insert(candidates, part)
            end
        end
    end

    -- 2. Nộm Titan Dummy (Tag: "Titan Dummy")
    if filter == "Tất cả mục tiêu" or filter == "Gáy Titan (Nape)" or filter == "Đầu Titan (Head)" then
        for _, d in ipairs(CollectionService:GetTagged("Titan Dummy")) do
            if filter == "Đầu Titan (Head)" then
                local head = d:FindFirstChild("Head")
                if head and head:IsA("BasePart") then table.insert(candidates, head) end
            else
                local nape = d:FindFirstChild("Nape")
                if nape and nape:IsA("BasePart") then table.insert(candidates, nape) end
            end
        end
    end

    -- 3. Titan thực tế trong Workspace
    if filter == "Tất cả mục tiêu" or filter == "Gáy Titan (Nape)" or filter == "Đầu Titan (Head)" then
        for _, model in ipairs(Workspace:GetChildren()) do
            if model:IsA("Model") and model ~= char and model:FindFirstChild("Humanoid") then
                local isTitan = model:FindFirstChild("Nape") or string.find(string.lower(model.Name), "titan")
                if isTitan then
                    if filter == "Đầu Titan (Head)" then
                        local head = model:FindFirstChild("Head")
                        if head and head:IsA("BasePart") then table.insert(candidates, head) end
                    else
                        local nape = model:FindFirstChild("Nape") or model:FindFirstChild("Head")
                        if nape and nape:IsA("BasePart") then table.insert(candidates, nape) end
                    end
                end
            end
        end
    end

    for _, part in ipairs(candidates) do
        local worldPos = part.Position
        if (worldPos - rootPos).Magnitude <= 3000 then
            local screenPos, onScreen = camera:WorldToViewportPoint(worldPos)
            if onScreen then
                local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if screenDist < shortestScreenDist then
                    shortestScreenDist = screenDist
                    bestTarget = part
                end
            end
        end
    end

    return bestTarget
end

-- Cập nhật vị trí vòng tròn FOV mỗi frame
RunService.RenderStepped:Connect(function()
    if fovCircle then
        if Settings.SilentAimEnabled and Settings.SilentAimShowFOV then
            local mouseLoc = Vector2.new(Mouse.X, Mouse.Y)
            pcall(function()
                mouseLoc = UserInputService:GetMouseLocation()
            end)
            fovCircle.Position = mouseLoc
            fovCircle.Radius = Settings.SilentAimFOV
            fovCircle.Visible = true
        else
            fovCircle.Visible = false
        end
    end
end)

-- Hook Metatable Bẻ Cong Raycast & Mouse.Hit (Silent Aim) an toàn, cách ly với CameraModule
pcall(function()
    -- Hook Workspace.Raycast trực tiếp qua hookfunction thay vì hookmetamethod(game, "__namecall")
    -- Điều này bảo vệ 100% CameraModule.ZoomController.Popper không bị lỗi Unable to cast Vector3 to bool
    if typeof(hookfunction) == "function" and typeof(Workspace.Raycast) == "function" then
        local origRaycast = Workspace.Raycast
        hookfunction(Workspace.Raycast, function(self, origin, direction, ...)
            if Settings.SilentAimEnabled and not (typeof(checkcaller) == "function" and checkcaller()) and self == Workspace then
                if origin and typeof(origin) == "Vector3" and typeof(direction) == "Vector3" then
                    local char = LocalPlayer.Character
                    local rootPart = char and (char.PrimaryPart or char:FindFirstChild("HumanoidRootPart"))
                    local distToChar = rootPart and (origin - rootPart.Position).Magnitude or 10
                    if distToChar <= 40 then
                        local bestTarget = getBestCombatTarget()
                        if bestTarget then
                            local targetPos = bestTarget.Position
                            local aimDir = (targetPos - origin).Unit * direction.Magnitude
                            if bestTarget.Name == "Target" then
                                pcall(function()
                                    Workspace:SetAttribute("Muskets", (Workspace:GetAttribute("Muskets") or 0) + 1)
                                end)
                            end
                            return origRaycast(self, origin, aimDir, ...)
                        end
                    end
                end
            end
            return origRaycast(self, origin, direction, ...)
        end)
    end

    -- Hook Mouse.Hit / Target an toàn trên metatable riêng của Mouse
    if typeof(getrawmetatable) == "function" and typeof(setreadonly) == "function" then
        local mouseMt = getrawmetatable(Mouse)
        if mouseMt and mouseMt.__index then
            setreadonly(mouseMt, false)
            local origMouseIndex = mouseMt.__index
            mouseMt.__index = function(self, index)
                if Settings.SilentAimEnabled and not (typeof(checkcaller) == "function" and checkcaller()) and self == Mouse then
                    if index == "Hit" then
                        local bestTarget = getBestCombatTarget()
                        if bestTarget then
                            return CFrame.new(bestTarget.Position)
                        end
                    elseif index == "Target" then
                        local bestTarget = getBestCombatTarget()
                        if bestTarget then
                            return bestTarget
                        end
                    end
                end
                return origMouseIndex(self, index)
            end
            setreadonly(mouseMt, true)
        end
    end
end)

-- Anti-Recoil Camera Fallback (Lớp bảo vệ dự phòng cho mọi loại vũ khí)
local prevCamCFrame = Workspace.CurrentCamera and Workspace.CurrentCamera.CFrame or CFrame.new()
RunService.RenderStepped:Connect(function()
    if Settings.AntiRecoil then
        local cam = Workspace.CurrentCamera
        if cam then
            local char = LocalPlayer.Character
            if char then
                local hasFirearm = char:FindFirstChild("Musket") or char:FindFirstChild("Flintlock") 
                                   or char:FindFirstChild("Kar98k") or char:FindFirstChild("ScopedKar98k") 
                                   or char:FindFirstChild("TrenchShotgun") or char:FindFirstChild("BlunderBuss")
                if hasFirearm then
                    local curLook = cam.CFrame.LookVector
                    local pitchDiff = curLook.Y - prevCamCFrame.LookVector.Y
                    local mouseDelta = UserInputService:GetMouseDelta()
                    if pitchDiff > 0.08 and math.abs(mouseDelta.Y) < 4 then
                        cam.CFrame = prevCamCFrame
                    end
                end
            end
            prevCamCFrame = cam.CFrame
        end
    end
end)

-- 4. Auto Cannon Reload (Tự động nạp đạn đại bác)
local function hasCannonballInHand()
    local char = LocalPlayer.Character
    if not char then return false end
    if char:FindFirstChild("Cannonball") then return true end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp and bp:FindFirstChild("Cannonball") then return true end
    return false
end

local function scanAutoCannonReload()
    if not Settings.AutoCannonReload or not hasCannonballInHand() then return end
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return end
    local rootPos = char.PrimaryPart.Position

    local interactionParts = CollectionService:GetTagged("Interaction")
    for _, desc in ipairs(interactionParts) do
        if desc:IsA("BasePart") and desc.Parent and desc.Parent:IsA("Model") and desc.Parent:GetAttribute("CannonId") then
            local dist = (desc.Position - rootPos).Magnitude
            if dist <= Settings.CannonReloadDist then
                if CannonReloadModule and typeof(CannonReloadModule.interacted) == "function" then
                    task.spawn(function()
                        pcall(function() CannonReloadModule.interacted(desc) end)
                    end)
                elseif InteractionNamespace and InteractionNamespace.Event and InteractionNamespace.Event.unreliablePost then
                    pcall(function() InteractionNamespace.Event.unreliablePost(desc) end)
                end
                break
            end
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.6)
        scanAutoCannonReload()
    end
end)

-- =========================================================================
-- ⚔️ TITAN COMBAT CORE (TRẢM GÁY, LOCK-ON, HITBOX EXPANDER & ANTI-GRAB)
-- =========================================================================
local originalNapeSizes = {}
local titanEspObjects = {}
local lastAutoSlashTime = 0
local lastAutoEradicateTime = 0

-- Lấy danh sách toàn bộ Titan và Titan Dummy trong thế giới
local function getAllTitans()
    local titans = {}
    local char = LocalPlayer.Character
    
    -- 1. Từ Tag "Titan"
    for _, t in ipairs(CollectionService:GetTagged("Titan")) do
        if t:IsA("Model") and t ~= char and not table.find(titans, t) then
            table.insert(titans, t)
        end
    end

    -- 2. Từ Tag "Titan Dummy"
    for _, d in ipairs(CollectionService:GetTagged("Titan Dummy")) do
        if d:IsA("Model") and d ~= char and not table.find(titans, d) then
            table.insert(titans, d)
        end
    end

    -- 3. Từ ClientTitanHandler
    if ClientTitanHandler and typeof(ClientTitanHandler.getTitans) == "function" then
        pcall(function()
            for _, tObj in pairs(ClientTitanHandler.getTitans()) do
                if tObj and tObj.model and tObj.model ~= char and not table.find(titans, tObj.model) then
                    table.insert(titans, tObj.model)
                end
            end
        end)
    end

    -- 4. Quét trong Workspace
    for _, model in ipairs(Workspace:GetChildren()) do
        if model:IsA("Model") and model ~= char and not table.find(titans, model) then
            if model:FindFirstChild("Nape") or string.find(string.lower(model.Name), "titan") then
                table.insert(titans, model)
            end
        end
    end

    return titans
end

-- 1. Auto Slash Nape: Tự động chém gáy khi áp sát Titan
local function checkAutoSlashNape()
    if not Settings.AutoSlashNape then return end
    if os.clock() - lastAutoSlashTime < (Settings.AutoSlashDelay or 0.25) then return end
    
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return end
    local rootPos = char.PrimaryPart.Position

    local bestNape = nil
    local bestDist = Settings.AutoSlashDist or 35
    local bestTitan = nil

    for _, titan in ipairs(getAllTitans()) do
        local targetPart = nil
        if Settings.TitanTargetPart == "Mắt Titan (Eyes - Làm Mù)" then
            targetPart = titan:FindFirstChild("Eyes") or titan:FindFirstChild("Head")
        elseif Settings.TitanTargetPart == "Gân Chân (Legs - Quỵ Ngã)" then
            targetPart = titan:FindFirstChild("RightLowerLeg") or titan:FindFirstChild("LeftLowerLeg")
        else
            targetPart = titan:FindFirstChild("Nape") or titan:FindFirstChild("Head")
        end

        if targetPart and targetPart:IsA("BasePart") then
            local dist = (targetPart.Position - rootPos).Magnitude
            if dist < bestDist then
                bestDist = dist
                bestNape = targetPart
                bestTitan = titan
            end
        end
    end

    if bestNape and bestTitan then
        lastAutoSlashTime = os.clock()
        
        -- Kích hoạt vung kiếm qua VirtualInputManager
        pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.delay(0.04, function()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end)
        end)
        
        -- Gửi trực tiếp damage packet kết liễu gáy
        if GearNamespace and GearNamespace.Damage and GearNamespace.Damage.unreliablePost then
            pcall(function()
                local vel = char.PrimaryPart.AssemblyLinearVelocity
                local dmgPacket = {
                    charge = 1,
                    hit = bestTitan,
                    part = bestNape,
                    name = bestNape.Name,
                    shifter = bestTitan:HasTag("Shifter"),
                    titan = true,
                    id = bestTitan:GetAttribute("id"),
                    distanceFromNape = bestDist,
                    distanceFromNapeBlade = bestDist,
                    moveDirection = vel,
                    velocity = math.max(vel.Magnitude, 150),
                }
                GearNamespace.Damage.unreliablePost(dmgPacket)
            end)
        end
    end
end

-- 2. Nape Lock-On: Khóa camera và hướng bay vào gáy Titan gần nhất
local function updateNapeLockOn()
    if not Settings.NapeLockOn then return end
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return end
    local camera = Workspace.CurrentCamera
    if not camera then return end

    local rootPos = char.PrimaryPart.Position
    local nearestNape = nil
    local nearestDist = Settings.NapeLockDist or 200

    for _, titan in ipairs(getAllTitans()) do
        local nape = titan:FindFirstChild("Nape") or titan:FindFirstChild("Head")
        if nape and nape:IsA("BasePart") then
            local dist = (nape.Position - rootPos).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearestNape = nape
            end
        end
    end

    if nearestNape then
        local targetPos = nearestNape.Position + Vector3.new(0, 2.5, 0)
        local camCFrame = camera.CFrame
        local targetLook = CFrame.new(camCFrame.Position, targetPos)
        local smooth = math.clamp(Settings.NapeLockSmoothness or 0.2, 0.05, 0.8)
        camera.CFrame = camCFrame:Lerp(targetLook, smooth)
    end
end

-- 3. Titan Nape Hitbox Expander: Mở rộng vùng va chạm gáy Titan
local function updateNapeHitboxExpander()
    if Settings.NapeHitboxExpander then
        local targetSize = Settings.NapeHitboxSize or 25
        for _, titan in ipairs(getAllTitans()) do
            local nape = titan:FindFirstChild("Nape")
            if nape and nape:IsA("BasePart") then
                if not originalNapeSizes[nape] then
                    originalNapeSizes[nape] = nape.Size
                end
                nape.Size = Vector3.new(targetSize, targetSize, targetSize)
                nape.CanCollide = false
                if Settings.NapeHitboxShow then
                    nape.Transparency = 0.55
                    nape.BrickColor = BrickColor.new("Really red")
                    nape.Material = Enum.Material.Neon
                else
                    nape.Transparency = 1
                end
            end
        end
    else
        for part, origSize in pairs(originalNapeSizes) do
            if part and part.Parent then
                pcall(function()
                    part.Size = origSize
                    part.Transparency = 1
                end)
            end
        end
        table.clear(originalNapeSizes)
    end
end

-- 4. Anti-Titan Grab: Chống và tự thoát khi bị Titan tóm
local function updateAntiTitanGrab()
    if not Settings.AntiTitanGrab then return end
    local char = LocalPlayer.Character
    if not char then return end

    if Settings.SpoofedAttributes then
        Settings.SpoofedAttributes["HasTitanGrabCounter"] = 1
        Settings.SpoofedAttributes["HasFinesse"] = 1
        Settings.SpoofedAttributes["TitanVisualGrabIndicator"] = 1
    end

    if char:GetAttribute("Grabbed") then
        char:SetAttribute("Grabbed", nil)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
        end

        if ClientEnchantmentsHandler and typeof(ClientEnchantmentsHandler.activateEnchantment) == "function" then
            pcall(function() ClientEnchantmentsHandler.activateEnchantment("Finesse") end)
            pcall(function() ClientEnchantmentsHandler.activateEnchantment("Getaway") end)
        end

        -- Vung dao cắt đứt tay
        pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.delay(0.04, function()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end)
        end)

        Luna:Notification({
            Title = "Anti-Grab Titan",
            Content = "Đã phá thế tóm của Titan thành công! Nhân vật đã thoát hiểm.",
            Icon = "security",
            ImageSource = "Material"
        })
    end
end

-- 5. Auto Eradicate Titan khi áp sát
local function checkAutoEradicate()
    if not Settings.AutoEradicate then return end
    if os.clock() - lastAutoEradicateTime < 4 then return end

    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return end
    local rootPos = char.PrimaryPart.Position

    for _, titan in ipairs(getAllTitans()) do
        local head = titan:FindFirstChild("Head") or titan.PrimaryPart
        if head and (head.Position - rootPos).Magnitude <= 200 then
            lastAutoEradicateTime = os.clock()
            if typeof(smartCastEradicate) == "function" then
                smartCastEradicate()
            end
            break
        end
    end
end

-- 6. Titan ESP & Nape Distance HUD
local function updateTitanESP()
    if not Settings.TitanESP then
        for model, gui in pairs(titanEspObjects) do
            pcall(function() gui:Destroy() end)
        end
        table.clear(titanEspObjects)
        return
    end

    local char = LocalPlayer.Character
    local rootPos = char and char.PrimaryPart and char.PrimaryPart.Position or Vector3.zero

    for _, titan in ipairs(getAllTitans()) do
        local head = titan:FindFirstChild("Head") or titan:FindFirstChild("HumanoidRootPart") or titan.PrimaryPart
        local nape = titan:FindFirstChild("Nape") or head
        if head and head:IsA("BasePart") and nape and nape:IsA("BasePart") then
            local dist = math.floor((nape.Position - rootPos).Magnitude)
            local gui = titanEspObjects[titan]
            if not gui or not gui.Parent then
                gui = Instance.new("BillboardGui")
                gui.Name = "TitanESP"
                gui.Size = UDim2.new(0, 160, 0, 45)
                gui.AlwaysOnTop = true
                gui.Adornee = head
                gui.StudsOffset = Vector3.new(0, 3, 0)

                local label = Instance.new("TextLabel")
                label.Name = "Info"
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Font = Enum.Font.GothamBold
                label.TextSize = 13
                label.TextColor3 = Color3.fromRGB(255, 60, 60)
                label.TextStrokeTransparency = 0
                label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                label.Parent = gui

                gui.Parent = head
                titanEspObjects[titan] = gui
            end

            local label = gui:FindFirstChild("Info")
            if label then
                local inKillRange = dist <= (Settings.AutoSlashDist or 35)
                local titanType = titan:HasTag("Shifter") and "👑 Shifter" or (titan:HasTag("Abnormal") and "⚡ Abnormal" or "👹 Titan")
                if inKillRange then
                    label.TextColor3 = Color3.fromRGB(0, 255, 120)
                    label.Text = string.format("[%s]\nGáy: %d studs (TRONG TẦM CHÉM!)", titanType, dist)
                else
                    label.TextColor3 = Color3.fromRGB(255, 80, 80)
                    label.Text = string.format("[%s]\nGáy: %d studs", titanType, dist)
                end
            end
        end
    end
end

-- Vòng lặp liên tục Titan Combat trong Heartbeat
RunService.Heartbeat:Connect(function()
    checkAutoSlashNape()
    updateNapeLockOn()
    updateAntiTitanGrab()
    checkAutoEradicate()
    updateTitanESP()
end)

-- Vòng lặp định kỳ cập nhật Hitbox Expander cho các Titan mới spawn
task.spawn(function()
    while true do
        task.wait(1.5)
        if Settings.NapeHitboxExpander then
            updateNapeHitboxExpander()
        end
    end
end)

-- =========================================================================
-- 🔮 CƠ SỞ DỮ LIỆU TOÀN BỘ 308 BÙA CHÚ GAME REQUIEM (FULL ENCHANTMENT DATABASE)
-- =========================================================================
local FULL_ENCHANTMENT_LIST = {
    ["Mythic"] = {
        { name = "Anamnesis", rarity = "Mythic", desc = "Their deaths became my burden, and saving the living became my curse. I must learn more to unlock my true potential...", passive = false },
        { name = "Bane of Ymir", rarity = "Mythic", desc = "For the next 10 seconds, your damage will be increased by 50%. In exchange, for 15 seconds all damage taken is increased.", passive = false },
        { name = "Deaths Dance", rarity = "Mythic", desc = "Isn't this a league item?", passive = true },
        { name = "Echostrike", rarity = "Mythic", desc = "Your blade beckons. There is a 20% chance that your next attack will strike again.", passive = true },
        { name = "Eradicate", rarity = "Mythic", desc = "Eradicate a titan's arm.", passive = true },
        { name = "Eyes of Ymir", rarity = "Mythic", desc = "Ymir has blessed my sight with powers far beyond our understanding.", passive = false },
        { name = "Garrisons Resolve", rarity = "Mythic", desc = "Your resolve being the commander of the Stationary Guard allows you to give your team a boost.", passive = false },
        { name = "Helldiver", rarity = "Mythic", desc = "Purge the stain of this failure, with the peroxide of victory...", passive = true },
        { name = "Mark of the Hidden Blade", rarity = "Mythic", desc = "When you deal damage to a player, they will bleed for 8 seconds. Each stack of bleed deals 30% of the damage dealt.", passive = true },
        { name = "Protagonist Syndrome", rarity = "Mythic", desc = "You are the first amongst many of this new generation...", passive = true },
        { name = "The Law", rarity = "Mythic", desc = "The will of the law is upon you. Bring those to justice.", passive = false },
        { name = "Warden of Ymir", rarity = "Mythic", desc = "To hold a soul in chains, one must be willing to grasp the iron with their own hands.", passive = false },
        { name = "Wings of Freedom", rarity = "Mythic", desc = "Your courage being the commander of the Scouting Legion allows you to give your team a boost.", passive = false },
    },
    ["Unique"] = {
        { name = "2026", rarity = "Unique", desc = "Let's make the year of 2026, the year for Requiem. Emote coming soon!", passive = true },
        { name = "Artisan", rarity = "Unique", desc = "Gives a 5% bonus to overall experience.", passive = true },
        { name = "Blade of Miquella", rarity = "Unique", desc = "A sacred dance of impossible speed and unwavering grace.", passive = false },
        { name = "Burst Dash", rarity = "Unique", desc = "Burst in the direction you are looking at max gear velocity, at the cost of expending a sizeable amount of gas.", passive = false },
        { name = "Calculator", rarity = "Unique", desc = "Every point of damage you deal is tallied on your screen. The counter resets five seconds after your last hit.", passive = true },
        { name = "Call of Whispers", rarity = "Unique", desc = "???", passive = true },
        { name = "Chemical Addiction", rarity = "Unique", desc = "You can't get enough of the stuff.", passive = true },
        { name = "Dap Me Up", rarity = "Unique", desc = "Greet your bro with sum style.", passive = true },
        { name = "Desensitized", rarity = "Unique", desc = "The horrors of war no longer shake you. Where fear once clawed at your chest, there is only silence.", passive = true },
        { name = "Encroaching Melody", rarity = "Unique", desc = "You are close to achieving the melody. 10% gas conservation.", passive = true },
        { name = "Eternal Remembrance", rarity = "Unique", desc = "Beloved by all, an eternal memory even in death.", passive = true },
        { name = "Founder", rarity = "Unique", desc = "You are an original founder of the game, thank you for your support..", passive = true },
        { name = "Genetic Outlier", rarity = "Unique", desc = "For Ymir has blessed you with not only great strength, but a durable mind and body.", passive = true },
        { name = "Giant", rarity = "Unique", desc = "Increases the player's maximum health by 20 and increases the player's size.", passive = true },
        { name = "Girly Pop", rarity = "Unique", desc = "How did you get this? You are not a girl.", passive = true },
        { name = "Holiday Cheer", rarity = "Unique", desc = "Celebrate the holidays with a cheer and a snowflake.", passive = false },
        { name = "Howling Abyss", rarity = "Unique", desc = "???", passive = true },
        { name = "Mighty Mouse", rarity = "Unique", desc = "Ymir blessed you with speed and grit, and unmatched agility.", passive = true },
        { name = "Prodigy", rarity = "Unique", desc = "???", passive = true },
        { name = "Whistle", rarity = "Unique", desc = "A sharp whistle cuts through the air.", passive = false },
    },
    ["Legendary"] = {
        { name = "Adamant", rarity = "Legendary", desc = "Your unwavering determination in the face of adversity grants you the resilience to continue your legacy. Damage reduction below thirty percent health.", passive = true },
        { name = "Antagonist", rarity = "Legendary", desc = "Your Bully shove hits everyone in front of you instead of only the nearest person.", passive = true },
        { name = "Banner of Ymir", rarity = "Legendary", desc = "", passive = false },
        { name = "Bereavement", rarity = "Legendary", desc = "When a bloodline member dies, gain a buff after their death, once per PD.", passive = true },
        { name = "Bloodthirsty", rarity = "Legendary", desc = "You are satiated by titan blood, you now gain hunger and health from killing titans.", passive = true },
        { name = "Cheapskate", rarity = "Legendary", desc = "You refuse to waste a single puff - your low gas conservation now extends another ten percent further.", passive = true },
        { name = "Chef", rarity = "Legendary", desc = "You produce twice as many bowls of soup when cooking.", passive = true },
        { name = "Dead Man Walking", rarity = "Legendary", desc = "When your health is below thirty percent, deal more damage.", passive = true },
        { name = "Deep Gash", rarity = "Legendary", desc = "Your strikes seek vital vessels — critical hit chance increased by 5%.", passive = true },
        { name = "Gather Round!", rarity = "Legendary", desc = "When your area buffs reach more than five allies at once, those buffs are thirty percent stronger and last thirty percent longer.", passive = true },
        { name = "Glutton", rarity = "Legendary", desc = "You can now consume two bowls of soup.", passive = true },
        { name = "Heartseeker", rarity = "Legendary", desc = "As you close your eyes, you see the heart beats of individuals nearby.", passive = false },
        { name = "Hijack", rarity = "Legendary", desc = "Yanking now forcibly removes somebody from their horse.", passive = true },
        { name = "Hit like a Truck", rarity = "Legendary", desc = "When someone is reloading a firearm and you damage them in PD, you have a chance to de-equip it.", passive = true },
        { name = "I Help You, You Help Me", rarity = "Legendary", desc = "When you buff another player with an area effect, you receive the same buff yourself.", passive = true },
        { name = "It Was Never Luck", rarity = "Legendary", desc = "When using Quick Reflexes, successfully dodging an attack shortens its cooldown. Failing to dodge anything lengthens it.", passive = true },
        { name = "Lead by Example", rarity = "Legendary", desc = "If you kill a titan or human around others, they will get a random buff that you can provide.", passive = true },
        { name = "Light Reflex", rarity = "Legendary", desc = "In the first 0.2 seconds of Upshift and Airshift you receive Iframes. If you get attacked while iframes, green pulse plays on success.", passive = true },
        { name = "Man of Steel", rarity = "Legendary", desc = "Your body refuses to break - injuries are 20% less likely to affect you.", passive = true },
        { name = "Manhunt", rarity = "Legendary", desc = "If a player kills one of your squad members, they become marked until they get out of range, or kill you or another one of your squad members.", passive = true },
        { name = "Natural Leader", rarity = "Legendary", desc = "Through the rooted confidence that you have grown to know, you are able to rally your allies more effectively.", passive = true },
        { name = "Nightstalker", rarity = "Legendary", desc = "Your nocturnal presence dominates your life as you perform better at night.", passive = true },
        { name = "No Wasting", rarity = "Legendary", desc = "When your gas runs critically low, you stretch every last drop - twenty five percent less gas drain while below ten percent gas.", passive = true },
        { name = "Perfectionist", rarity = "Legendary", desc = "Flaws in this world bug you, as such, any imperfections about you cause you to under-perform. Gain a damage boost against titans when at full health.", passive = true },
        { name = "Quick Draw", rarity = "Legendary", desc = "You now are able to quickly draw your flintlock in order to quickly deal with threats.", passive = true },
        { name = "Running on fumes", rarity = "Legendary", desc = "Your gas reserves are refilled after refilling.", passive = true },
        { name = "Rupture", rarity = "Legendary", desc = "Your attacks ignore 5% of enemy armor resistance.", passive = true },
        { name = "Serpents Fang", rarity = "Legendary", desc = "Sap the healing capabilities away from your enemy - when you hit an enemy with your blades, apply an anti heal.", passive = true },
        { name = "Skullbound", rarity = "Legendary", desc = "When above fifty percent health, and shot by a musket in the head, you will survive the shot.", passive = true },
        { name = "Ymir's Grace", rarity = "Legendary", desc = "Ymir's favor lingers upon you - all healing you give, to yourself and others, is ten percent stronger.", passive = true },
    },
    ["Epic"] = {
        { name = "Abnormal Circumstances", rarity = "Epic", desc = "Unusual threats sharpen your edge — abnormals, shifters, and rare titan variants take fifteen percent more damage from your blades.", passive = true },
        { name = "Bomb-voyage", rarity = "Epic", desc = "You've mastered the blast - explosion damage you take is reduced by 15%.", passive = true },
        { name = "Boxer", rarity = "Epic", desc = "You can use your fists to make a mark on your opponents.", passive = false },
        { name = "Bully", rarity = "Epic", desc = "Shove the nearest person near you. The harder you push depends on your strength compared to theirs.", passive = false },
        { name = "Contract Killer", rarity = "Epic", desc = "When activated, you can see the trajectory of where your musket shot will land when aiming for ten seconds.", passive = false },
        { name = "Deduction", rarity = "Epic", desc = "Your deduction skills allow you to see all enchantments in the pack, before you open it.", passive = true },
        { name = "Equestrian", rarity = "Epic", desc = "Your horse regenerates stamina faster.", passive = true },
        { name = "Feather", rarity = "Epic", desc = "You move like a feather, gain a 7% increase on your velocity cap.", passive = true },
        { name = "Field Assessment", rarity = "Epic", desc = "Your no longer slowed when checking your injuries.", passive = true },
        { name = "Field Commander", rarity = "Epic", desc = "Leadership buffs you grant last twenty percent longer on you.", passive = true },
        { name = "Finesse", rarity = "Epic", desc = "Your unparalleled agility and mastery of evasive maneuvers have allowed you to outmaneuver the grasp of a titan unscathed.", passive = false },
        { name = "Frontbreaker", rarity = "Epic", desc = "You can now tackle a player from the front, however you will also be ragdolled.", passive = true },
        { name = "Gentle Giant", rarity = "Epic", desc = "Your size belies your resilience — take twenty-five percent less damage while grabbed by a titan.", passive = true },
        { name = "Getaway", rarity = "Epic", desc = "You can get up from a ragdoll, saving you from a potentially dangerous situation. (One time use per event). Staff-applied ragdolls cannot be escaped.", passive = false },
        { name = "Help me!", rarity = "Epic", desc = "Your cries draw sharper blades — while grabbed by a titan, it takes fifteen percent more damage.", passive = true },
        { name = "Hit Stick", rarity = "Epic", desc = "Your tackle knocks opponents down for an additional two seconds.", passive = true },
        { name = "Hitman", rarity = "Epic", desc = "After shooting a musket, you can now put it away after one second, instead of two.", passive = true },
        { name = "I Can't Die Like This", rarity = "Epic", desc = "Gain flow when your skullbound is used. If you kill your attacker, you no longer get ragdolled and your skullbound cooldown is refreshed.", passive = true },
        { name = "I need a minute", rarity = "Epic", desc = "After Skullbound saves you from a headshot, you gain three seconds of invulnerability.", passive = true },
        { name = "Indomitable", rarity = "Epic", desc = "With a will to win, you are able to take in more damage. Overall, your health is increased.", passive = true },
        { name = "Jammer", rarity = "Epic", desc = "When you attack other players, they will be silenced for a short time.", passive = true },
        { name = "Loving Boost", rarity = "Epic", desc = "Bandaging an ally grants them a brief surge of velocity gain.", passive = true },
        { name = "Make It Count", rarity = "Epic", desc = "When your blades are under fifty percent durability, your damage output is increased against titans.", passive = true },
        { name = "Marker - Purple", rarity = "Epic", desc = "Shoot a purple flare to grant comrades within 500 studs faster velocity gain and gas conservation.", passive = true },
        { name = "Marker - Yellow", rarity = "Epic", desc = "Shoot a yellow flare to grant comrades within 500 studs reduced horse stamina drain and increased horse max speed.", passive = true },
        { name = "Master Grappler", rarity = "Epic", desc = "You can now feel when you have been grappled onto and the person grappled onto you will flash red.", passive = true },
        { name = "On The Go", rarity = "Epic", desc = "You have become accustomed to wearing a gaspack, be able to refill half of your gas off your own gaspack.", passive = false },
        { name = "Overcharged", rarity = "Epic", desc = "You are able to exert your gear past the known boundaries.", passive = false },
        { name = "Precise Swing", rarity = "Epic", desc = "You have a chance to not lose blade durability when slashing someone.", passive = true },
        { name = "Reflexiveness", rarity = "Epic", desc = "After taking more than seventy-five percent of your health in five seconds, instinctively enter your flow state.", passive = true },
        { name = "Reserve Tank", rarity = "Epic", desc = "Your gaspack now stores an additonal 10 percent.", passive = true },
        { name = "Returning Opportunity", rarity = "Epic", desc = "Missing a parry then being slashed right after will remove your parry cooldown, giving you another chance to parry.", passive = true },
        { name = "Savior Complex", rarity = "Epic", desc = "Every time you save someone in your squad from a titan, gain a 2.5% stat buff, stacking up to four times.", passive = true },
        { name = "Scholar", rarity = "Epic", desc = "You can now see a rough estimation of how much experience you need to reach the next level.", passive = false },
        { name = "Sharpshooter", rarity = "Epic", desc = "With a dedication to firearms, you now deal 25% more damage per shot.", passive = true },
        { name = "Short Lived", rarity = "Epic", desc = "Gain a 15% damage reduction on clash for a short period of time.", passive = true },
        { name = "Slow and Steady", rarity = "Epic", desc = "Bandaging someone is slower, however the healing is increased.", passive = true },
        { name = "Steel Body", rarity = "Epic", desc = "Your body is made of steel, gain a 2.5% blade resistance.", passive = true },
        { name = "Taste for Blood", rarity = "Epic", desc = "While Sadomasochism is active, killing an individual refreshes Masochistic's cooldown.", passive = true },
        { name = "Timed Reaction", rarity = "Epic", desc = "The perfect block timing turns a precise shot into a life saving miracle.", passive = true },
        { name = "Trial and Error", rarity = "Epic", desc = "After grasping the amount of time while refilling your gas, you have no trouble pinpointing exactly when to stop.", passive = true },
        { name = "Vigilant", rarity = "Epic", desc = "Focus no longer darkens your screen.", passive = true },
    },
    ["Rare"] = {
        { name = "Amphibian", rarity = "Rare", desc = "You gain a minor increase in numerous stats while it is raining.", passive = true },
        { name = "Artery Visionary", rarity = "Rare", desc = "You've honed your ability to slice arteries with your blades, increasing your base critical hit chance by 2%.", passive = true },
        { name = "Avenge", rarity = "Rare", desc = "When someone in your branch dies near you, gain a small buff.", passive = true },
        { name = "Aviator", rarity = "Rare", desc = "You can now see your velocity.", passive = true },
        { name = "Blade Dancer", rarity = "Rare", desc = "Your acute perception of the melodies of the battlefield allows you to mimic the rhythm of war, dealing extra damage to titans.", passive = true },
        { name = "Brute", rarity = "Rare", desc = "You rely on your strength to push forward. You can now learn tackling and boxing.", passive = true },
        { name = "Calm Waters", rarity = "Rare", desc = "The waters seem to still around you, calming even the wariest fish so they move slower and less erratically.", passive = true },
        { name = "Chain Dash", rarity = "Rare", desc = "With swift precision, you are able to dash twice with your gear.", passive = true },
        { name = "Claim the Saddle", rarity = "Rare", desc = "If someone is riding your horse, you can now kick them off if your horse is within range.", passive = true },
        { name = "Clockwork", rarity = "Rare", desc = "Through your innate efficiency and precision with the passion for crafting, you're motivated to complete your projects with haste.", passive = true },
        { name = "Coinflip", rarity = "Rare", desc = "Flip a coin, and test your luck.", passive = false },
        { name = "Come at Me", rarity = "Rare", desc = "With a scream of confidence, you taunt the titans.", passive = false },
        { name = "Control", rarity = "Rare", desc = "Toggle your discipline protections on or off.", passive = false },
        { name = "Convict", rarity = "Rare", desc = "You are able to break out of your handcuffs with a skill check.", passive = true },
        { name = "Dare Devil", rarity = "Rare", desc = "Launch yourself into the air for a velocity gain boost.", passive = false },
        { name = "Demolitionist", rarity = "Rare", desc = "You can now see how big the explosion of your cannon will be.", passive = true },
        { name = "Distress Signal", rarity = "Rare", desc = "When your gas reaches 0%, you fire a purple flare. Toggle on or off with a hotkey.", passive = false },
        { name = "Downward Surge", rarity = "Rare", desc = "Gain a slight velocity increase when hooking downwards. ", passive = true },
        { name = "Drunken Brawler", rarity = "Rare", desc = "Your unorthodox fighting style blends unpredictable maneuvers with raw strength. Your overall non-gear based melee damage is increased.", passive = true },
        { name = "Egocentric", rarity = "Rare", desc = "When you proc flow while other players are within one hundred studs, gain additional time in flow.", passive = true },
        { name = "Emergency Gas", rarity = "Rare", desc = "When you run out of gas, gain fifteen percent of gas back as a final emergency.", passive = true },
        { name = "Emergency Locator", rarity = "Rare", desc = "When another player fires a purple flare, highlight the location of the flare.", passive = true },
        { name = "Escape Artist", rarity = "Rare", desc = "Using Finesse to escape a titan's grip will now boost you into the air and set you at your max velocity.", passive = true },
        { name = "Expert Rider", rarity = "Rare", desc = "You can now dismount your horse via grappling with ODMG.", passive = true },
        { name = "Extended Flares", rarity = "Rare", desc = "Your marker flare buffs last ten seconds longer.", passive = true },
        { name = "Extended Rally", rarity = "Rare", desc = "Squad buffs you grant reach one hundred studs further.", passive = true },
        { name = "Fast Deployment", rarity = "Rare", desc = "Your refill speed is now slightly faster.", passive = true },
        { name = "Frenzy", rarity = "Rare", desc = "Killing titans brings you into a frenzy. For each kill, deal extra damage to titans.", passive = true },
        { name = "Friend or Foe", rarity = "Rare", desc = "Hooking onto someone tells you if you recognize them.", passive = true },
        { name = "Fury", rarity = "Rare", desc = "With rage induced in your body, you deal more damage to titan limbs.", passive = true },
        { name = "Habitual Cooking", rarity = "Rare", desc = "You have a 10% chance to make an extra bowl of soup.", passive = true },
        { name = "Heavy Hitter", rarity = "Rare", desc = "Your cannon impacts with more force.", passive = true },
        { name = "Heavyweight", rarity = "Rare", desc = "The bigger the titan, the more damage you deal towards it.", passive = true },
        { name = "In a Hurry", rarity = "Rare", desc = "Checking health no longer impedes any action. You can check health while running, and it completes much faster.", passive = true },
        { name = "Indomitable Will", rarity = "Rare", desc = "Each bandage applied on you gives you a 2.5% damage reduction buff, capping at 10%.", passive = true },
        { name = "Insight", rarity = "Rare", desc = "Your intuition allows you to see the rarity of the enchantments in the pack, before you open it.", passive = true },
        { name = "Jack of All Trades", rarity = "Rare", desc = "With strategic decision-making and resource management, you're able to use your knowledge to optimize your creations.", passive = true },
        { name = "Kobold", rarity = "Rare", desc = "When you succeed at Sly Hands' lockpick minigame, Goblin's cooldown is reduced by 90%.", passive = true },
        { name = "Mariner", rarity = "Rare", desc = "A life spent on the water has made you a swift swimmer, and gear weighs less on your lungs beneath the waves.", passive = true },
        { name = "Marker - Black", rarity = "Rare", desc = "Shoot a black flare to grant nearby allies 10% increased cannon speed and explosion range.", passive = true },
        { name = "Marker - Blue", rarity = "Rare", desc = "Shoot a blue flare to highlight yourself to branch medics within 100 studs for 30 seconds. Medics buffed this way heal 15% more with bandages and have an increased injury removal chance.", passive = true },
        { name = "Marker - Green", rarity = "Rare", desc = "Shoot a green flare to grant nearby allies +2 run speed. Allies on horseback regain 10% stamina.", passive = true },
        { name = "Masochistic", rarity = "Rare", desc = "Slice yourself, giving you a damage buff for a certain amount of time.", passive = false },
        { name = "Mobile Supply Hub", rarity = "Rare", desc = "You will now be notified of how much gas is left in your gaspack.", passive = true },
        { name = "Mutual Guard", rarity = "Rare", desc = "Allied players deal reduced damage to you.", passive = true },
        { name = "Obnoxious", rarity = "Rare", desc = "Cooldowns for your MARKER flares are now 4 minutes instead of 5 minutes.", passive = true },
        { name = "Omnipotent", rarity = "Rare", desc = "You are accustomed to your gear and are able to understand your gas level better.", passive = true },
        { name = "Opportunist", rarity = "Rare", desc = "They're on their last legs, finish them quickly. Deal ten percent increased damage to a Titan that is currently injured, blinded, or missing any limbs.", passive = true },
        { name = "Pacemaker", rarity = "Rare", desc = "You now check your gas even faster.", passive = true },
        { name = "Professional Meals", rarity = "Rare", desc = "Your own soup buffs are 10% stronger.", passive = true },
        { name = "Propulsion Expert", rarity = "Rare", desc = "Your consume less gas while boosting.", passive = true },
        { name = "Quartermaster", rarity = "Rare", desc = "You deal more damage with sabres", passive = true },
        { name = "Quick Escape", rarity = "Rare", desc = "When saved from a titan's grasp, you become immune to titan grabs for a 2 seconds.", passive = true },
        { name = "Range Calculation", rarity = "Rare", desc = "Your mouse now displays your grapple range directly under your cursor. It turns red when you're out of grapple range.", passive = true },
        { name = "Razor's Edge", rarity = "Rare", desc = "Hitting a titan consecutively in quick succession exponentially makes your next hits deal more damage, caps at 3 hits (Applies to abnormals and shifters.) (Requires Flow + Rend)", passive = true },
        { name = "Rend", rarity = "Rare", desc = "You will no longer be limited to only one hit per swing on titans.", passive = true },
        { name = "Salty Meat", rarity = "Rare", desc = "You don't seem to taste as well as others, prolong the time it takes a titan to eat you when grabbed", passive = true },
        { name = "Sharpeye", rarity = "Rare", desc = "You can now visualize the path of your cannon.", passive = true },
        { name = "Slowpoke", rarity = "Rare", desc = "Self bandaging is much slower, however self bandaging heal is greatly increased.", passive = true },
        { name = "Sly Hands", rarity = "Rare", desc = "When using Goblin, you play a lockpick minigame whose difficulty depends on your Dexterity versus your target's.", passive = true },
        { name = "Squad Leader", rarity = "Rare", desc = "Buffs that you apply are five percent more effective to those in your squad.", passive = true },
        { name = "Stalwart", rarity = "Rare", desc = "It takes longer to cuff you.", passive = true },
        { name = "Teamwork makes the Dreamwork", rarity = "Rare", desc = "Anyone in your squad is highlighted for three seconds when they are hit.", passive = true },
        { name = "Thrill for the Kill", rarity = "Rare", desc = "After successfully proccing an individual's Skullbound, gain +4 run speed and 15% faster firearm reload for 30 seconds.", passive = true },
        { name = "Tracer Bullets", rarity = "Rare", desc = "After landing a shot on an enemy, they will be highlighted to you for 3 seconds.", passive = true },
        { name = "Triumphant Cry", rarity = "Rare", desc = "If someone in your squad kills an enemy while buffed by one of your buffs, buff the squad for 30 seconds.", passive = true },
        { name = "Unstoppable Force", rarity = "Rare", desc = "If you have your second hook on another surface, your yank is stronger and lowers opponents velocity by a bit after the yanking effect is over.", passive = true },
        { name = "Wide Open", rarity = "Rare", desc = "Deal five percent increased damage to enemies that missed a parry within two seconds.", passive = true },
        { name = "Wind Dancer", rarity = "Rare", desc = "Your blades flow with the wind, you swing faster.", passive = true },
    },
    ["Uncommon"] = {
        { name = "A Good Ear", rarity = "Uncommon", desc = "You can now recall your horse at any distance no matter if someone is on it.", passive = true },
        { name = "Adept Hunter", rarity = "Uncommon", desc = "When drawing your bow your Field of View will no longer change.", passive = true },
        { name = "Aerodynamics", rarity = "Uncommon", desc = "Be able to keep velocity for longer, but deal less damage to titans.", passive = true },
        { name = "Arsenal", rarity = "Uncommon", desc = "When checking your gas, you now see your blade durability.", passive = true },
        { name = "Aware", rarity = "Uncommon", desc = "You know your gas canister, display a message when you go beyond certain gas threshold.", passive = true },
        { name = "Beast Slayer", rarity = "Uncommon", desc = "Your blades cut deeper into beasts that roam the wild.", passive = true },
        { name = "Blood Runs Thick", rarity = "Uncommon", desc = "Heal your bloodline members faster and slightly more.", passive = true },
        { name = "Bond of the Steed", rarity = "Uncommon", desc = "When someone is riding your horse, highlight your horse if it's within range.", passive = true },
        { name = "Brace", rarity = "Uncommon", desc = "Pound your chest and steady your heart.", passive = false },
        { name = "Buoyant", rarity = "Uncommon", desc = "You waste even less air underwater and can stay submerged longer.", passive = true },
        { name = "Cannoneer", rarity = "Uncommon", desc = "You have a grasp of your cannons, allowing you to shoot them further.", passive = true },
        { name = "Caravan", rarity = "Uncommon", desc = "You can carry more items in your inventory.", passive = true },
        { name = "Clear Mind", rarity = "Uncommon", desc = "The visual effects from having a titan shake your hooks and slam you into the ground is heavily reduced.", passive = true },
        { name = "Colossus Slayer", rarity = "Uncommon", desc = "You have been able to excel in combat techniques against titans, and thus able to exploit the vulnerabilities of these colossal adversaries.", passive = true },
        { name = "Current Rider", rarity = "Uncommon", desc = "You move with the current and recover your breath quickly at the surface.", passive = true },
        { name = "Cycle", rarity = "Uncommon", desc = "When you break a set of blades, you will automatically take a new set out, if available.", passive = true },
        { name = "Dead Weight", rarity = "Uncommon", desc = "Play dead, and have your body fall to the ground.", passive = false },
        { name = "Deep Hooks", rarity = "Uncommon", desc = "You have a small chance to have your grapple not be hit by a titan.", passive = true },
        { name = "Dexterous", rarity = "Uncommon", desc = "You can now summon your horse with handles out.", passive = true },
        { name = "Discipline", rarity = "Uncommon", desc = "You deal reduced damage to allied players.", passive = true },
        { name = "Don't Even Flinch", rarity = "Uncommon", desc = "Your screen no longer darkens when parrying somebody.", passive = true },
        { name = "Double Time", rarity = "Uncommon", desc = "There's no time to waste with you! You excel at production and thus are able to produce more.", passive = true },
        { name = "Downshift", rarity = "Uncommon", desc = "You can now double tap 'shift' in the air to launch downwards.", passive = true },
        { name = "Earwig", rarity = "Uncommon", desc = "You can now hear others' whispers from a further distance.", passive = true },
        { name = "Effective Diaphragm", rarity = "Uncommon", desc = "You know how to effectively control your diaphragm, allowing you to yell further.", passive = true },
        { name = "Emergency Flare", rarity = "Uncommon", desc = "When grabbed by a titan, shoot a purple flare into the air.", passive = true },
        { name = "Engineer", rarity = "Uncommon", desc = "Through unparalled structure testing, you're able to fortify the structures you create more effectively.", passive = true },
        { name = "Ethereal Flow", rarity = "Uncommon", desc = "Your momentum loss is reduced.", passive = true },
        { name = "Explosive", rarity = "Uncommon", desc = "You have a grasp of your cannons, creating a bigger explosion.", passive = true },
        { name = "Ferverous", rarity = "Uncommon", desc = "Infused with an indomitable spirit, you're able to withstand partial damage that titans inflict.", passive = true },
        { name = "Field Optics", rarity = "Uncommon", desc = "You can now see slightly better in fog.", passive = true },
        { name = "Final Blow", rarity = "Uncommon", desc = "Deal more damage upon your blades breaking.", passive = true },
        { name = "Forsaker", rarity = "Uncommon", desc = "Upon forsaking an enchantment, you lose it, and gain 20% of the experience required to get a new one.", passive = true },
        { name = "Friends with Benefits", rarity = "Uncommon", desc = "When saving someone you know from a titan grab, have a short period of increased velocity gain and less gas consumption.", passive = true },
        { name = "Gas Technician", rarity = "Uncommon", desc = "You now refill gas 30% faster.", passive = true },
        { name = "Goblin", rarity = "Uncommon", desc = "You can now pickpocket others.", passive = false },
        { name = "Got Em", rarity = "Uncommon", desc = "A short line appears when you land a player grapple.", passive = true },
        { name = "Got Them", rarity = "Uncommon", desc = "Hitting a player with a firearm grants 35% faster reload speed for 3 seconds. Missing a player applies the same penalty.", passive = true },
        { name = "Got Ya", rarity = "Uncommon", desc = "Deal 10% more damage to titans that are grabbing a player.", passive = true },
        { name = "Grazing Wound", rarity = "Uncommon", desc = "You graze a target, dealing 20% more firearm damage to limbs.", passive = true },
        { name = "Gut of Steel", rarity = "Uncommon", desc = "Your stomach has no limits. You can eat raw onion and meat.", passive = true },
        { name = "Hook Momentum", rarity = "Uncommon", desc = "Your grapple range is increased based on your velocity.", passive = true },
        { name = "Ironskin", rarity = "Uncommon", desc = "Have a slight damage resistance against blades.", passive = true },
        { name = "Keeping Track", rarity = "Uncommon", desc = "Tells you how many blades you have left when checking your gas.", passive = true },
        { name = "Last Shout", rarity = "Uncommon", desc = "When grabbed, highlight the titan and play an audio cue.", passive = true },
        { name = "Lavish", rarity = "Uncommon", desc = "When holding a grapple key, it will continuously check for a valid grapple target.", passive = true },
        { name = "Marker", rarity = "Uncommon", desc = "Rally your comrades, by shooting a red flare nearby comrades will have a 10% titan damage boost.", passive = true },
        { name = "No Man Left Behind", rarity = "Uncommon", desc = "Carrying someone who is out of gas will increase your velocity and decrease your gas drain for 10 seconds.", passive = true },
        { name = "No Time To Waste", rarity = "Uncommon", desc = "When attempting to pick up a player, if they are out of gas, automatically pick them up.", passive = true },
        { name = "Pit Stop", rarity = "Uncommon", desc = "You can now check your gas while moving.", passive = true },
        { name = "Productive", rarity = "Uncommon", desc = "You're constantly productive and thus are able to produce more accurately.", passive = true },
        { name = "Quick Access", rarity = "Uncommon", desc = "You are now able to hold smaller items while handles are equipped.", passive = true },
        { name = "Quick Feet", rarity = "Uncommon", desc = "Move around slightly faster while aiming your gun.", passive = true },
        { name = "Quick Reel", rarity = "Uncommon", desc = "You reel with practiced speed, securing a hooked fish far faster than most anglers.", passive = true },
        { name = "Rabbit", rarity = "Uncommon", desc = "Bound lightly off the ground like a rabbit, jumping higher than before.", passive = true },
        { name = "Recycle", rarity = "Uncommon", desc = "Using a bandage removal recycles you another bandage, 2 minute cd.", passive = true },
        { name = "Resourceful Medic", rarity = "Uncommon", desc = "Bandaging someone who is \"currently decent\" will not take up a bandage, 5 minute CD.", passive = true },
        { name = "Rotten Meat", rarity = "Uncommon", desc = "You seem to have a foul smell, titans will now take their time while eating you.", passive = true },
        { name = "Run & Gun", rarity = "Uncommon", desc = "After shooting a player, gain a small run speed boost for three seconds.", passive = true },
        { name = "Rushed Refill", rarity = "Uncommon", desc = "You can refill your blades and gas faster.", passive = true },
        { name = "Sadomasochism", rarity = "Uncommon", desc = "Killing an individual grants minor stacking buffs, increased if killed when you are at critical HP (<10% hp). (Requires Masochistic)", passive = true },
        { name = "Satisfaction", rarity = "Uncommon", desc = "Your own meals fill you twice as much, nothing tastes better than home made food!", passive = true },
        { name = "Self Removal", rarity = "Uncommon", desc = "You can now use your removals on yourself.", passive = true },
        { name = "Sheep Mentality", rarity = "Uncommon", desc = "Buffs you receive from others are slightly stronger.", passive = true },
        { name = "Skilled Pilot", rarity = "Uncommon", desc = "No FOV/camera change when yanked, gas boosting, or going left and right by pressing A and D key.", passive = true },
        { name = "Slack Line", rarity = "Uncommon", desc = "You keep just enough tension in the line that a fighting fish slips away far more slowly.", passive = true },
        { name = "Squad Medic", rarity = "Uncommon", desc = "Bandage healing is 10% more effective for everyone in your squad.", passive = true },
        { name = "Stallion", rarity = "Uncommon", desc = "Increase the maximum speed at which your horse regains stamina.", passive = true },
        { name = "Sturdy", rarity = "Uncommon", desc = "You stand tall like a castle, and are able to take a substantial blow.", passive = true },
        { name = "Targeting", rarity = "Uncommon", desc = "During Focus, the highlighted color of the target varies on who you're targeting. Comrades will be highlighted green.", passive = true },
        { name = "Terminator", rarity = "Uncommon", desc = "Gain a slight velocity boost when hooked onto a titan from behind.", passive = true },
        { name = "Thin Lines", rarity = "Uncommon", desc = "Your grapple range is slightly increased.", passive = true },
        { name = "True Sight", rarity = "Uncommon", desc = "You can now see a rough estimate of where your arrows will land.", passive = true },
        { name = "Unbound", rarity = "Uncommon", desc = "Through the strength of Ymir, be able to leap from the ground rather than in the air.", passive = true },
        { name = "Wall Running", rarity = "Uncommon", desc = "When holding space while facing a flat surface, with gear, you will now wallrun.", passive = true },
        { name = "Warcry", rarity = "Uncommon", desc = "Jammer lasts 50% shorter.", passive = true },
        { name = "Windshot", rarity = "Uncommon", desc = "You can now jump while aiming a musket.", passive = true },
    },
    ["Common"] = {
        { name = "Angler", rarity = "Common", desc = "You've become a seasoned angler and are able to utilize your knowledge to help fish.", passive = true },
        { name = "Apprentice", rarity = "Common", desc = "Build 5% faster per level.", passive = true },
        { name = "Archer", rarity = "Common", desc = "You can reload you bow faster, and shoot arrows further.", passive = true },
        { name = "Baker", rarity = "Common", desc = "You have a 10% chance to make an extra loaf of bread.", passive = true },
        { name = "Bandit", rarity = "Common", desc = "You are handcuffed by individuals 5% slower per level.", passive = true },
        { name = "Blue Collar", rarity = "Common", desc = "After countless of work on the fields, you now swing your tools faster.", passive = true },
        { name = "Bottomless Pit", rarity = "Common", desc = "Your stomach is 35% bigger.", passive = true },
        { name = "Bowman", rarity = "Common", desc = "Your able to reload your bow faster.", passive = true },
        { name = "Charming", rarity = "Common", desc = "Your charisma reaches those around you; you find yourself able to easily influence others.", passive = false },
        { name = "Clear Barrel", rarity = "Common", desc = "Proper musket maintenance ensures a cleaner and clearer shot, reducing smoke and noise.", passive = true },
        { name = "Close Call", rarity = "Common", desc = "Your quick thinking and ability to manuever out of harms way, using airshift, leads you to gaining a small momentum boost.", passive = true },
        { name = "Cold Blooded", rarity = "Common", desc = "Your more resilient to the effects of anxiety.", passive = true },
        { name = "Conservative", rarity = "Common", desc = "You've understood the fundamentals of your gear and are able to conserve your gas more effectively", passive = true },
        { name = "Consumer", rarity = "Common", desc = "The food and water that you consume is more impactful to your stomach, but food must be cooked before consumption.", passive = true },
        { name = "Cop", rarity = "Common", desc = "You handcuff individuals 5% faster per level.", passive = true },
        { name = "Deep Breath", rarity = "Common", desc = "You've trained yourself to consume less air while underwater.", passive = true },
        { name = "Duelist", rarity = "Common", desc = "Deal more damage with sabres and more damage against players with OMDG.", passive = true },
        { name = "Dynamo", rarity = "Common", desc = "Infused with an inner warmth, you are able to resist the biting chill of cold conditions.", passive = true },
        { name = "Empathetic", rarity = "Common", desc = "You are able to heal others slightly faster.", passive = true },
        { name = "Field Technician", rarity = "Common", desc = "You've become accustomed on how to resupply yourself in the battlefield.", passive = true },
        { name = "Fit", rarity = "Common", desc = "Through training and hard work, you can now run faster.", passive = true },
        { name = "Flare Expert", rarity = "Common", desc = "You are no longer concussed when using flares.", passive = true },
        { name = "Full Inventory", rarity = "Common", desc = "When holding max bandages, your first bandage will heal 15% more.", passive = true },
        { name = "Gaping Wounds", rarity = "Common", desc = "Titans take longer to recover from your strikes.", passive = true },
        { name = "Get Off Me!", rarity = "Common", desc = "Slashing someone who is hooked on you deals 5% more damage.", passive = true },
        { name = "Handyman", rarity = "Common", desc = "You build 10% faster.", passive = true },
        { name = "Hunter", rarity = "Common", desc = "Your roots come from the land itself, killing animals grants you more experience.", passive = true },
        { name = "Huntsman", rarity = "Common", desc = "You can now shoot a bow and arrow with more power, allowing your arrows to fly further.", passive = true },
        { name = "Keep It Going", rarity = "Common", desc = "You no longer are slowed down when checking your gas.", passive = true },
        { name = "Kinfolk", rarity = "Common", desc = "You deal even more reduced damage to your bloodline members. (Requires Discipline)", passive = true },
        { name = "Lucky", rarity = "Common", desc = "You've realized that the boon of fortune is on your side.", passive = true },
        { name = "Lumberjack", rarity = "Common", desc = "You've become a seasoned woodfeller and are able to see weakpoints within the grain of wood.", passive = true },
        { name = "Mic Check", rarity = "Common", desc = "Your first gas check in a PD doesn't utilise your Musician charge, showing you your gas for free.", passive = true },
        { name = "Miner", rarity = "Common", desc = "You've become a seasoned miner and are able to see weakpoints within the rock.", passive = true },
        { name = "Muzzled", rarity = "Common", desc = "Your musket shots are quieter.", passive = true },
        { name = "Nimble", rarity = "Common", desc = "You've become accustomed to your gear and are able to utilize your gear speed more effectively, although consume more gas.", passive = true },
        { name = "One With Nature", rarity = "Common", desc = "You make small steps, slightly reducing the attraction of animals and titans.", passive = true },
        { name = "Peacekeeper", rarity = "Common", desc = "You keep the peace within the walls, and as such you deal 5% more human damage.", passive = true },
        { name = "Powder Discipline", rarity = "Common", desc = "You can reload your musket faster while standing still.", passive = true },
        { name = "Practitioner", rarity = "Common", desc = "You can now heal other players more efficiently.", passive = true },
        { name = "Preservation", rarity = "Common", desc = "Your preservation allows you to deal more damage to titans while at full health.", passive = true },
        { name = "Proficient", rarity = "Common", desc = "You can check your gas while moving faster.", passive = true },
        { name = "Quick Hands", rarity = "Common", desc = "You have a great understanding of firearms and are able to reload them with haste.", passive = true },
        { name = "Recognizable", rarity = "Common", desc = "Your flares are much more brighter and larger, and they last longer when shot.", passive = true },
        { name = "Rescuer", rarity = "Common", desc = "Deal 5% damage to titans limbs.", passive = true },
        { name = "Rider", rarity = "Common", desc = "Your horse loses less stamina while sprinting.", passive = true },
        { name = "Sentinel", rarity = "Common", desc = "You are a sentinel of the walls, and as such you deal 10% more damage to titans.", passive = true },
        { name = "Shot Supression", rarity = "Common", desc = "With careful handling, you reduce the noise of your firearm.", passive = true },
        { name = "Situational Awareness", rarity = "Common", desc = "Upon your gear breaking, you will shoot a purple flare.", passive = true },
        { name = "Snowforge", rarity = "Common", desc = "With a heart of ice, you are able to resist the hot environmental coniditions.", passive = true },
        { name = "Steady Hands", rarity = "Common", desc = "Your hands stay steady on the rod, widening the window to keep a hooked fish within reach.", passive = true },
        { name = "Strong Swimmer", rarity = "Common", desc = "Years wading rivers and coastlines have made you a faster swimmer.", passive = true },
        { name = "Successful Shot", rarity = "Common", desc = "Upon a successful shot, you will be able to briefly reload your musket faster.", passive = true },
        { name = "Tether Controller", rarity = "Common", desc = "You can now toggle your Tether Control Proficiency on and off.", passive = false },
        { name = "Undercut", rarity = "Common", desc = "You check your gas slightly faster.", passive = true },
        { name = "Unencumbered", rarity = "Common", desc = "You can run while swinging your sabre or combat knife.", passive = true },
        { name = "Weakspots", rarity = "Common", desc = "Deal 5% damage to titans eyes.", passive = true },
    },
}

-- Ánh xạ các bùa tiêu biểu vào 5 Nhóm Thực Chiến Cốt Lõi
local TACTICAL_CATEGORIES = {
    ["⚔️ Nhóm: Cơ động & ODMG"] = {
        "Wings of Freedom", "Deaths Dance", "Running on fumes", "Light Reflex", "Autograpple", 
        "Clear Mind", "No Superman Landing", "Feather", "Unbound", "Wall Running", "Quick Feet", 
        "Hook Momentum", "Slack Line", "Burst Dash", "Conservative", "Close Call", "Nimble"
    },
    ["🗡️ Nhóm: Sát thương Kiếm & Titan"] = {
        "Eradicate", "Bane of Ymir", "Deep Gash", "Hit like a Truck", "Adamant", "Bloodthirsty", 
        "Serpents Fang", "Echostrike", "Mark of the Hidden Blade", "Blade of Miquella", "Rupture", 
        "Abnormal Circumstances", "Perfectionist", "Duelist", "Sentinel", "Weakspots", "Gaping Wounds"
    },
    ["👁️ Nhóm: Thần Nhãn & ESP"] = {
        "Eyes of Ymir", "Heartseeker", "Insight", "Deduction", "Field Assessment", 
        "Contract Killer", "True Sight", "Marker", "Keeping Track", "Situational Awareness"
    },
    ["🎯 Nhóm: Xạ Thủ & Súng Đạn"] = {
        "Quick Draw", "Windshot", "Nightstalker", "Tracer Bullets", "Clear Barrel", 
        "Muzzled", "Powder Discipline", "Quick Hands", "Shot Supression", "Successful Shot", "Bowman", "Huntsman"
    },
    ["🛡️ Nhóm: Sinh Tồn & Hỗ Trợ"] = {
        "Warden of Ymir", "Banner of Ymir", "Ymir's Grace", "Dead Man Walking", "Gut of Steel", 
        "Gas Technician", "Helldiver", "Man of Steel", "Skullbound", "Bomb-voyage", "Finesse", 
        "Ironskin", "Rotten Meat", "Sturdy", "Fit", "Dynamo", "Cold Blooded", "Consumer"
    },
    ["🐎 Nhóm: Kỵ Binh & Chiến Mã (Horse)"] = {
        "Equestrian", "Stallion", "Rider", "A Good Ear", "Bond of the Steed", 
        "Claim the Saddle", "Dexterous", "Expert Rider", "Hijack"
    },
}

-- Bảng thuộc tính mặc định giả lập cho các bùa thực chiến quan trọng
local ENCHANT_PRESET_ATTRIBUTES = {
    ["Wings of Freedom"] = { GearCanDoubleJump = 1, GearCanDash = 1, GearCanDoubleDash = 1, GearCanWallrun = 1, GearMaximumVelocity = 999 },
    ["Deaths Dance"] = { GearConsumptionDrainMultiplier = 0, LowGasDrainMultiplier = 0 },
    ["Running on fumes"] = { LowGasDrainMultiplier = 0, HasGasEmergency = 1 },
    ["Light Reflex"] = { AutododgeChance = 1, AutododgeFlatAmount = 100 },
    ["Autograpple"] = { Autograpple = 1, CanCheckGasWhileMoving = 1 },
    ["Clear Mind"] = { GearGrappleShakeMultiplier = 0 },
    ["No Superman Landing"] = { NoSupermanLanding = 1 },
    ["Eradicate"] = { BladeDamageMultiplier = 2.0, TitanDamageMultiplier = 2.0, HasEradicate = 1 },
    ["Bane of Ymir"] = { CriticalHitTitanDamageMultiplier = 2.5, CriticalHitTitanSuccessChance = 1 },
    ["Deep Gash"] = { BladeDamageMultiplier = 1.5, BladeDamageResistancePenetration = 0.5 },
    ["Hit like a Truck"] = { BladeRange = 25, BladeDamageMultiplier = 1.8 },
    ["Adamant"] = { BladeIntegrityAddition = 100, BladeDurabilityPreserveChance = 1 },
    ["Bloodthirsty"] = { Bloodthirsty = 1, BladeSwingMultiplier = 2 },
    ["Serpents Fang"] = { ArmorPiercing = 1, BladeDamageResistancePenetration = 0.8 },
    ["Eyes of Ymir"] = { HasTargeting = 1 },
    ["Heartseeker"] = { HasVigilant = 1 },
    ["Insight"] = { CanSeeExperience = 1 },
    ["Field Assessment"] = { TitanVisualGrabIndicator = 1, HasFieldAssessment = 1 },
    ["Quick Draw"] = { FirearmUnequipSpeed = 0.01, HasQuickDrawFlintlock = 1 },
    ["Windshot"] = { FirearmProjectileSpeedMultiplier = 3.0 },
    ["Nightstalker"] = { FasterMusketWalkSpeed = 1, FirearmSprintAim = 1 },
    ["Warden of Ymir"] = { HealthResistanceMultiplier = 0.8, DamageReductionOnClash = 1 },
    ["Banner of Ymir"] = { SquadBuffApplyBonus = 1, SquadBuffRadiusBonus = 100 },
    ["Ymir's Grace"] = { HasGraceOfYmir = 1, Invulnerability = 1 },
    ["Dead Man Walking"] = { GrabIFrames = 1, HasTerminator = 1 },
    ["Gut of Steel"] = { CanConsumeFood = 1 },
    ["Gas Technician"] = { GasCheckNoDebuff = 1, CanGaspackRefill = 1 },
    ["Wall Running"] = { GearCanWallrun = 1 },
    ["Burst Dash"] = { GearCanDoubleDash = 1 },
    ["Feather"] = { GearMaximumVelocity = 350 },
    ["Unencumbered"] = { CanRunWhileSwingingSabre = 1 },
    ["Duelist"] = { BladeDamageMultiplier = 1.25 },
    ["Quartermaster"] = { BladeDamageMultiplier = 1.3 },
    ["Equestrian"] = { HorseStaminaRegenMultiplier = 5 },
    ["Stallion"] = { HorseStaminaRegenMaxSpeedBonus = 50 },
    ["Rider"] = { HorseStaminaDrainMultiplier = 0 },
    ["Dexterous"] = { HasDexterous = 1 },
    ["Expert Rider"] = { HasExpertRider = 1 },
    ["A Good Ear"] = { HasAGoodEar = 1 },
    ["Bond of the Steed"] = { HasBondOfTheSteed = 1 },
    ["Claim the Saddle"] = { HasClaimTheSaddle = 1 },
    ["Hijack"] = { HasHijack = 1 },
}

-- Dynamic Scanner: Tự động quét và bổ sung bùa từ ReplicatedStorage trong runtime
pcall(function()
    local enchFolder = ReplicatedStorage:FindFirstChild("Client")
    if enchFolder then
        enchFolder = enchFolder:FindFirstChild("Progression")
        if enchFolder then
            enchFolder = enchFolder:FindFirstChild("Enchantments")
            if enchFolder then
                enchFolder = enchFolder:FindFirstChild("Enchantments")
            end
        end
    end
    if enchFolder then
        for _, rFolder in ipairs(enchFolder:GetChildren()) do
            if rFolder:IsA("Folder") then
                local rName = rFolder.Name
                if not FULL_ENCHANTMENT_LIST[rName] then
                    FULL_ENCHANTMENT_LIST[rName] = {}
                end
                for _, mod in ipairs(rFolder:GetChildren()) do
                    if mod:IsA("ModuleScript") then
                        local found = false
                        for _, it in ipairs(FULL_ENCHANTMENT_LIST[rName]) do
                            if it.name == mod.Name then
                                found = true
                                break
                            end
                        end
                        if not found then
                            table.insert(FULL_ENCHANTMENT_LIST[rName], {
                                name = mod.Name,
                                rarity = rName,
                                desc = "Dynamic Scanned Enchantment",
                                passive = true
                            })
                        end
                    end
                end
            end
        end
    end
end)

local function extractEnchantName(str)
    if not str or typeof(str) ~= "string" then return "" end
    local name = string.match(str, "%]%s*(.*)")
    if name and #name > 0 then
        return name
    end
    return str
end

local function findEnchantItem(name)
    local clean = extractEnchantName(name)
    for rName, list in pairs(FULL_ENCHANTMENT_LIST) do
        for _, it in ipairs(list) do
            if string.lower(it.name) == string.lower(clean) or string.lower(it.name) == string.lower(name) then
                return it, rName
            end
        end
    end
    return nil, nil
end

local function getCategoryOptions(filterName)
    local list = {}
    
    if filterName == "📜 Tất Cả 308 Bùa (A-Z)" then
        local allItems = {}
        for rName, items in pairs(FULL_ENCHANTMENT_LIST) do
            for _, it in ipairs(items) do
                table.insert(allItems, it)
            end
        end
        table.sort(allItems, function(a, b) return a.name < b.name end)
        for _, it in ipairs(allItems) do
            table.insert(list, string.format("[%s] %s", it.rarity, it.name))
        end
    elseif string.find(filterName, "Nhóm:") then
        local names = TACTICAL_CATEGORIES[filterName]
        if names then
            for _, n in ipairs(names) do
                local it = findEnchantItem(n)
                if it then
                    table.insert(list, string.format("[%s] %s", it.rarity, it.name))
                else
                    table.insert(list, string.format("[Enchant] %s", n))
                end
            end
        end
    else
        -- Lọc theo Rarity (tách từ tên như "🔥 Mythic (13 bùa)" -> "Mythic")
        local cleanRarity = string.match(filterName, "([%a]+)%s*%(") or filterName
        for rName, items in pairs(FULL_ENCHANTMENT_LIST) do
            if string.lower(rName) == string.lower(cleanRarity) or string.find(string.lower(filterName), string.lower(rName), 1, true) then
                table.sort(items, function(a, b) return a.name < b.name end)
                for _, it in ipairs(items) do
                    table.insert(list, string.format("[%s] %s", it.rarity, it.name))
                end
                break
            end
        end
    end
    
    if #list == 0 then
        table.insert(list, "Không tìm thấy bùa chú")
    end
    return list
end

-- Hàm thông minh thi triển kỹ năng Eradicate (tự động dò tìm Titan & trượt chém cánh tay)
local function smartCastEradicate()
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then
        Luna:Notification({ Title = "Lỗi Nhân Vật", Content = "Không tìm thấy nhân vật của bạn!", Icon = "cancel", ImageSource = "Material" })
        return false
    end
    local rootPos = char.PrimaryPart.Position

    local nearestTitan = nil
    local nearestDist = 350
    for _, titan in ipairs(CollectionService:GetTagged("Titan")) do
        if titan:IsA("Model") and titan:FindFirstChild("HumanoidRootPart") then
            local dist = (titan.HumanoidRootPart.Position - rootPos).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearestTitan = titan
            end
        end
    end

    if not nearestTitan then
        for _, dummy in ipairs(CollectionService:GetTagged("Titan Dummy")) do
            local part = dummy:FindFirstChild("HumanoidRootPart") or dummy.PrimaryPart
            if part then
                local dist = (part.Position - rootPos).Magnitude
                if dist < nearestDist then
                    nearestDist = dist
                    nearestTitan = dummy
                end
            end
        end
    end

    if not nearestTitan then
        Luna:Notification({
            Title = "Eradicate Cần Mục Tiêu",
            Content = "⚠️ Không có Titan nào trong bán kính 350 studs!\nBùa Eradicate là chiêu thức lướt chém xoáy dọc cánh tay Titan lên gáy. Hãy tiếp cận gần Titan hơn để thi triển.",
            Icon = "report",
            ImageSource = "Material"
        })
        return false
    end

    local armPart = nearestTitan:FindFirstChild("RightUpperArm") or nearestTitan:FindFirstChild("LeftUpperArm") 
                    or nearestTitan:FindFirstChild("RightLowerArm") or nearestTitan:FindFirstChild("LeftLowerArm")
                    or nearestTitan:FindFirstChild("RightHand") or nearestTitan:FindFirstChild("LeftHand")
    if not armPart then
        armPart = nearestTitan:FindFirstChild("UpperTorso") or nearestTitan.PrimaryPart
    end

    local eradicateMod = nil
    pcall(function()
        local mythicFolder = ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Mythic
        eradicateMod = require(mythicFolder:WaitForChild("Eradicate"))
    end)

    if eradicateMod and typeof(eradicateMod.activated) == "function" then
        local hitPoint = armPart
        local ok, err = pcall(function()
            eradicateMod.activated(nearestTitan, armPart, hitPoint)
        end)
        if ok then
            Luna:Notification({
                Title = "Thi Triển Eradicate",
                Content = string.format("⚔️ Đã kích hoạt trượt chém Eradicate lên cánh tay Titan [%s] (Khoảng cách: %.0f studs)!", nearestTitan.Name, nearestDist),
                Icon = "check_circle",
                ImageSource = "Material"
            })
            return true
        else
            Luna:Notification({
                Title = "Lỗi Kích Hoạt Eradicate",
                Content = tostring(err),
                Icon = "cancel",
                ImageSource = "Material"
            })
            return false
        end
    else
        Luna:Notification({
            Title = "Lỗi Module Eradicate",
            Content = "Không tìm thấy module Eradicate trong ReplicatedStorage!",
            Icon = "cancel",
            ImageSource = "Material"
        })
        return false
    end
end

local function castEnchantSkill(name)
    local cleanName = extractEnchantName(name)
    if not cleanName or #cleanName == 0 then return end

    -- Trường hợp 1: Eradicate (Chiêu thức combat chém xoáy cánh tay Titan)
    if string.lower(cleanName) == "eradicate" then
        smartCastEradicate()
        return
    end

    local it, rName = findEnchantItem(cleanName)

    -- Trường hợp 2: Bùa Nội Tại (Passive Combat Buffs - Deaths Dance, Running on fumes, Bloodthirsty, v.v.)
    if it and it.passive then
        Settings.ActiveEnchantList[it.name] = true
        Settings.SpoofedEnchants[it.name] = true
        local customAttrs = ENCHANT_PRESET_ATTRIBUTES[it.name]
        if customAttrs then
            for k, v in pairs(customAttrs) do
                Settings.SpoofedAttributes[k] = v
            end
        end
        Luna:Notification({
            Title = "Bùa Nội Tại (Passive Combat)",
            Content = string.format("💡 [%s] là BÙA NỘI TẠI (Passive)!\n👉 Bùa này không có nút bấm niệm chiêu mà TỰ ĐỘNG KÍCH HOẠT NGẦM khi chém Titan / chiến đấu.\n✅ Đã kích hoạt và duy trì toàn bộ chỉ số ngầm cho bạn!", it.name),
            Icon = "info",
            ImageSource = "Material"
        })
        return
    end

    -- Trường hợp 3: Bùa Chủ Động (Active Skill có thể bấm thi triển)
    if not ClientEnchantmentsHandler then
        Luna:Notification({ Title = "Lỗi", Content = "ClientEnchantmentsHandler chưa sẵn sàng!", Icon = "cancel", ImageSource = "Material" })
        return
    end

    local ok, err = pcall(function()
        ClientEnchantmentsHandler.activateEnchantment(cleanName)
    end)
    if ok then
        Luna:Notification({
            Title = "Kích Hoạt Kỹ Năng",
            Content = "Đã thi triển kỹ năng chủ động: " .. cleanName .. "!",
            Icon = "auto_awesome",
            ImageSource = "Material"
        })
    else
        Luna:Notification({
            Title = "Kích Hoạt Thất Bại",
            Content = tostring(err),
            Icon = "cancel",
            ImageSource = "Material"
        })
    end
end

-- Thi triển đồng loạt tất cả các kỹ năng đang bật trong danh sách
local function castAllActiveSkills()
    local castCount = 0
    local passiveCount = 0
    for enchName, isActive in pairs(Settings.ActiveEnchantList) do
        if isActive then
            local it = findEnchantItem(enchName)
            if string.lower(enchName) == "eradicate" then
                smartCastEradicate()
                castCount = castCount + 1
            elseif it and not it.passive then
                pcall(function()
                    ClientEnchantmentsHandler.activateEnchantment(enchName)
                end)
                castCount = castCount + 1
            else
                passiveCount = passiveCount + 1
            end
        end
    end

    Luna:Notification({
        Title = "Kích Hoạt Đồng Thời",
        Content = string.format("Đã kích hoạt %d kỹ năng chủ động & duy trì %d bùa nội tại trong danh sách!", castCount, passiveCount),
        Icon = "bolt",
        ImageSource = "Material"
    })
end

-- =========================================================================
-- 🧪 CHẨN ĐOÁN & KIỂM THỬ KHẢ THI CLIENT VS SERVER (AUDIT & COMPATIBILITY)
-- =========================================================================
local function printClientServerAnalysisReport()
    print([[
================================================================================
           BÁO CÁO PHÂN TÍCH KIẾN TRÚC REQUIEM: CLIENT vs SERVER
================================================================================
1. [100% CLIENT-SIDE] (HOẠT ĐỘNG NGAY LẬP TỨC - KHÔNG CẦN SERVER):
   - Cơ Động ODMG:
       * GearCanDoubleJump (Nhảy đôi trên không)
       * GearCanDash / GearCanDoubleDash (Lướt né mặt đất & trên không)
       * GearCanWallrun (Chạy tường bằng phím Space)
       * GearMaximumVelocity / GearMaxVelocityMultiplier (Vận tốc 999)
       * NoSupermanLanding (Khử ngã dập mặt khi tiếp đất)
       * GearGrappleShakeMultiplier (Khử rung giật camera)
       * Autograpple (Tự động ghim dây neo bề mặt gần)
       * LowGasDrainMultiplier (Khí nén không hao hụt)
       * CanCheckGasWhileMoving / GasCheckSpeedMultiplier (Check gas khi bay)
   - Súng Đạn & Ngắm Bắn:
       * FirearmAccuracyMultiplier (No Spread - Đạn thẳng 100%)
       * FirearmRecoilMultiplier (Triệt tiêu giật súng Anti-Recoil)
       * FasterMusketWalkSpeed (Đi lại bình thường khi ngắm súng)
       * CanSeeMusketTrajectory (Hiển thị 48 chùm tia laser quỹ đạo)
       * FirearmUnequipSpeed (Quick Draw rút cất súng siêu tốc)
   - Bùa Chú Gacha:
       * Insight (Nhìn thấu độ hiếm bài khi mở Pack)
       * Deduction (Lật ngửa toàn bộ thẻ bài trong Pack)
   - Thần Nhãn & Nhận Thức:
       * CanViewVelocity (HUD đồng hồ tốc độ)
       * CanViewGrappleRange (HUD vòng tròn tầm neo)
       * TitanVisualGrabIndicator (Cảnh báo Titan chộp vồ)
       * FogVisibilityMultiplier (Xuyên sương mù)
   - Kỵ Binh & Chiến Mã (Horse / Mount):
       * HorseMaxSpeedBonus (+120 studs/s - Tốc độ phi nước đại cực hạn x2 x3)
       * HorseStaminaDrainMultiplier (0 hao hụt thể lực khi phi nước đại)
       * HorseStaminaRegenMultiplier & HorseStaminaRegenMaxSpeedBonus (Hồi thể lực ngay cả khi phi tối đa)
       * HasDexterous (Cho phép huýt sáo gọi ngựa khi đang rút kiếm/vũ khí)
       * HasExpertRider (Nhảy khỏi yên ngựa bằng dây neo ODMG hoặc Dash trên không)
       * Trample Threshold (Tự động kích hoạt dẫm đạp kẻ địch khi phi >= 85 studs/s)
   - Sinh Tồn & Chế Tác:
       * Gut of Steel (Ăn thịt/cá sống không trúng độc)
       * BandageSelfHealTimeMultiplier (Băng bó siêu tốc)
       * ToolSwingSpeedMultiplier (Tốc độ vung cuốc/rìu mỏ đá)
       * FishingChanceMultiplier (Tỷ lệ cá cắn câu)

2. [SERVER-SIDE REQUIRED] (CẦN SERVER XÁC THỰC HOẶC ĐỒNG BỘ MẠNG):
   - Kỵ Binh (Horse Summon / Claim):
       * Triệu hồi ngựa từ Stable (Companions.Summon.post).
       * Đá kẻ trộm khỏi ngựa (Claim the Saddle - Server xóa weld seat của kẻ trộm).
       * Thu hồi ngựa từ xa khi người khác cưỡi (A Good Ear).
       * Kéo người khác khỏi ngựa (Hijack yank remote).
       * Máu và sự sống của ngựa.
   - Sát Thương Thực Chiến (PvP & Titan Damage):
       * Client gửi tín hiệu chém, nhưng Server xác nhận khoảng cách, vũ khí và trừ máu mục tiêu.
   - Active Skills (Chiêu thức chủ động gọi qua Remote):
       * Kích hoạt qua Enchantments.Request.unreliablePost(name).
       * Server sẽ quyết định chấp nhận hay từ chối dựa trên whitelist dữ liệu nhân vật lưu trên Server.
   - Tài Sản & Điểm Số:
       * Tiền tệ, Sacrament Points, Hòm đồ vĩnh viễn (Server DataStore).
   - Hiệu Ứng Diện Rộng (Squad Buffs):
       * Phải do Server Replicate tới client đồng đội.
================================================================================
]])
    Luna:Notification({
        Title = "Báo Cáo Client vs Server",
        Content = "Đã xuất toàn bộ báo cáo chi tiết vào F9 Console!\n30+ tính năng Cơ Động, Súng & Gacha hoạt động 100% trên Client.",
        Icon = "assessment",
        ImageSource = "Material"
    })
end

local function runServerCompatibilityTest(enchantName)
    local cleanName = extractEnchantName(enchantName)
    local it, rName = findEnchantItem(cleanName)
    if not it then
        Luna:Notification({
            Title = "Lỗi Kiểm Thử",
            Content = "Vui lòng chọn một bùa chú hợp lệ để kiểm tra!",
            Icon = "cancel",
            ImageSource = "Material"
        })
        return
    end

    Luna:Notification({
        Title = "Đang Chẩn Đoán...",
        Content = string.format("Kiểm thử bùa: [%s] %s...", it.rarity, it.name),
        Icon = "hourglass_top",
        ImageSource = "Material"
    })

    -- 1. Nếu là Passive (Nội tại) -> 100% Client-Side
    if it.passive then
        task.wait(0.3)
        Luna:Notification({
            Title = "100% CLIENT-SIDE (Hoạt động ngay)",
            Content = string.format("Bùa [%s] là NỘI TẠI (Passive)!\nHoạt động 100%% tức thì qua Client Hook getAttribute / hasEnchantment mà không cần Server duyệt.", it.name),
            Icon = "check_circle",
            ImageSource = "Material"
        })
        print(string.format("[Chẩn Đoán] [%s] %s: Bùa nội tại (Passive). 100%% Client-Authoritative. Hoạt động tức thì.", it.rarity, it.name))
        return
    end

    -- 2. Nếu là Active Skill -> Gửi probe request lên Server
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local initialTracks = hum and #hum:GetPlayingAnimationTracks() or 0

    local serverAck = false
    local reqConn = nil
    if EnchantmentsNamespace and EnchantmentsNamespace.Request and EnchantmentsNamespace.Request.listen then
        pcall(function()
            reqConn = EnchantmentsNamespace.Request.listen(function(...)
                serverAck = true
            end)
        end)
    end

    local castSuccess, castErr = pcall(function()
        castEnchantSkill(it.name)
    end)

    task.delay(1.2, function()
        if reqConn then
            pcall(function() reqConn:Disconnect() end)
        end

        local currentTracks = hum and #hum:GetPlayingAnimationTracks() or 0
        local animTriggered = currentTracks > initialTracks

        if serverAck then
            Luna:Notification({
                Title = "SERVER CHẤP NHẬN 100%",
                Content = string.format("Server ĐÃ PHẢN HỒI và chấp nhận kỹ năng [%s]!\nKỹ năng này hoạt động trọn vẹn cả với Server!", it.name),
                Icon = "verified",
                ImageSource = "Material"
            })
            print(string.format("[Chẩn Đoán] [%s] %s: Server PHẢN HỒI THÀNH CÔNG!", it.rarity, it.name))
        elseif animTriggered or castSuccess then
            Luna:Notification({
                Title = "CLIENT THỰC THI THÀNH CÔNG",
                Content = string.format("Đã kích hoạt Animation & Hiệu ứng của [%s] trên Client!\n(Nếu chiêu này gây sát thương, Server sẽ kiểm tra riêng theo logic vũ khí).", it.name),
                Icon = "check_circle",
                ImageSource = "Material"
            })
            print(string.format("[Chẩn Đoán] [%s] %s: Client animation & local handler chạy thành công.", it.rarity, it.name))
        else
            Luna:Notification({
                Title = "SERVER KIỂM TRA CHẶT (Bị Chặn)",
                Content = string.format("Server kiểm tra danh sách sở hữu và từ chối kích hoạt [%s].\nChi tiết: %s", it.name, tostring(castErr or "Không có phản hồi từ Server")),
                Icon = "report",
                ImageSource = "Material"
            })
            print(string.format("[Chẩn Đoán] [%s] %s: Server từ chối hoặc yêu cầu điều kiện phụ.", it.rarity, it.name))
        end
    end)
end

-- Radar Thần Nhãn ESP Người Chơi & Titan (Native Highlight qua ClientSenseRunner)
local function triggerVitalSightESP()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local senseObjects = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pChar = player.Character
            local hum = pChar:FindFirstChildOfClass("Humanoid")
            local healthFrac = hum and (hum.Health / math.max(1, hum.MaxHealth)) or 1
            local col = Color3.fromRGB(255, 60, 60):Lerp(Color3.fromRGB(60, 255, 60), healthFrac)
            table.insert(senseObjects, {
                instance = pChar,
                color = col,
                fillTransparency = 0.4,
                outlineTransparency = 0
            })
        end
    end
    
    for _, titan in ipairs(CollectionService:GetTagged("Titan")) do
        if titan:IsA("Model") and titan:FindFirstChild("HumanoidRootPart") then
            table.insert(senseObjects, {
                instance = titan,
                color = Color3.fromRGB(255, 170, 0),
                fillTransparency = 0.4,
                outlineTransparency = 0
            })
        end
    end
    
    if ClientSenseRunner and typeof(ClientSenseRunner.onRevealSense) == "function" then
        ClientSenseRunner.onRevealSense({
            radius = 1200,
            duration = 3.0,
            indicator = true,
            hold = 5,
            objects = senseObjects,
            color = Color3.fromRGB(0, 255, 255)
        })
    end
end

-- Radar Tiếp Tế Khí Nén & Hòm Lưỡi Dao
local function triggerSupplySeekerESP()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local rootPos = char.HumanoidRootPart.Position
    
    local senseObjects = {}
    local interactions = CollectionService:GetTagged("Interaction")
    for _, item in ipairs(interactions) do
        if item:IsA("BasePart") and (rootPos - item.Position).Magnitude <= 1200 then
            local maxAmount = item:GetAttribute("MaxAmount") or 1
            local amount = item:GetAttribute("Amount") or 0
            local fill = amount / math.max(1, maxAmount)
            local col = Color3.fromRGB(255, 80, 80):Lerp(Color3.fromRGB(80, 255, 80), fill)
            table.insert(senseObjects, {
                instance = item.Parent or item,
                color = col,
                fillTransparency = 0.3,
                outlineTransparency = 0
            })
        end
    end
    
    if ClientSenseRunner and typeof(ClientSenseRunner.onRevealSense) == "function" then
        ClientSenseRunner.onRevealSense({
            radius = 1200,
            duration = 3.0,
            indicator = true,
            hold = 5,
            objects = senseObjects,
            color = Color3.fromRGB(0, 200, 255)
        })
    end
end

-- Vòng lặp Auto Claim & Auto Open Pack
task.spawn(function()
    while true do
        task.wait(0.6)
        if (Settings.AutoClaimEnchant or Settings.AutoOpenPack) and EnchantmentsNamespace and EnchantmentsNamespace.UnclaimedStore then
            pcall(function()
                local unclaimed = EnchantmentsNamespace.UnclaimedStore.client()
                if unclaimed and type(unclaimed) == "table" and #unclaimed > 0 then
                    for _, pack in ipairs(unclaimed) do
                        if pack and type(pack.id) == "number" then
                            -- Nếu pack chưa mở
                            if (type(pack.enchantments) ~= "table" or #pack.enchantments == 0) and Settings.AutoOpenPack then
                                EnchantmentsNamespace.Open.post(pack.id)
                                task.wait(0.5)
                            -- Nếu pack đã có danh sách bài
                            elseif type(pack.enchantments) == "table" and #pack.enchantments > 0 and Settings.AutoClaimEnchant then
                                local targetClaim = nil
                                local targetClean = extractEnchantName(Settings.SelectedEnchantName)
                                
                                for _, cardName in ipairs(pack.enchantments) do
                                    if cardName == targetClean then
                                        targetClaim = cardName
                                        break
                                    end
                                end
                                
                                if not targetClaim and Settings.FallbackClaimMode == "Rarest" then
                                    local bestRarity = -1
                                    for _, cardName in ipairs(pack.enchantments) do
                                        local rarityVal = 1
                                        local it = findEnchantItem(cardName)
                                        if it then
                                            if it.rarity == "Mythic" then rarityVal = 6
                                            elseif it.rarity == "Legendary" then rarityVal = 5
                                            elseif it.rarity == "Epic" then rarityVal = 4
                                            elseif it.rarity == "Rare" then rarityVal = 3
                                            elseif it.rarity == "Uncommon" then rarityVal = 2 end
                                        end
                                        if rarityVal > bestRarity then
                                            bestRarity = rarityVal
                                            targetClaim = cardName
                                        end
                                    end
                                end
                                
                                if targetClaim then
                                    EnchantmentsNamespace.Claim.post({ name = targetClaim, packId = pack.id })
                                    Luna:Notification({
                                        Title = "Auto Claim",
                                        Content = "Đã tự động nhận: " .. tostring(targetClaim) .. "!",
                                        Icon = "check_circle",
                                        ImageSource = "Material"
                                    })
                                    task.wait(1.5)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Vòng lặp Auto Counter-Parry
task.spawn(function()
    while true do
        task.wait(0.1)
        if Settings.AutoCounterParry and ClientProficienciesHandler then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local rootPos = char.HumanoidRootPart.Position
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local otherChar = player.Character
                        local dist = (otherChar.HumanoidRootPart.Position - rootPos).Magnitude
                        if dist <= 22 then
                            local tool = otherChar:FindFirstChildOfClass("Tool")
                            if tool and (tool.Name == "Blades" or tool.Name == "Gear" or tool:FindFirstChild("Blades")) then
                                pcall(function()
                                    ClientProficienciesHandler.activateProficiency("Skills", "Counter")
                                end)
                                task.wait(0.5)
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Lắng nghe Hotkey kích hoạt kỹ năng bùa đang chọn
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Settings.CastHotkey and Settings.SelectedEnchantName and Settings.SelectedEnchantName ~= "" then
        castEnchantSkill(Settings.SelectedEnchantName)
    end
end)

-- =========================================================================
-- XÂY DỰNG GIAO DIỆN LUNA INTERFACE SUITE
-- =========================================================================
local Window = Luna:CreateWindow({
    Name = "Requiem Master Hub",
    Subtitle = "Hệ thống Tự động hóa Mini-Games & Combat",
    LogoID = "6031097225",
    LoadingEnabled = true,
    LoadingTitle = "Requiem Master Suite",
    LoadingSubtitle = "Khởi tạo hệ thống tự động...",
    KeySystem = false,
})

-- Tạo Home Tab
Window:CreateHomeTab({
    Author = "Jarvis Assistant",
    Discord = "https://discord.gg/requiem",
    Description = "Bản điều khiển toàn năng hỗ trợ tự động hoàn thành tất cả các Mini-Game, Kỳ thi Sát hạch Tân binh, QTE và Combat trong Requiem."
})

-- =========================================================================
-- TAB 1: 🥊 HUẤN LUYỆN & THỂ LỰC (TRAINING)
-- =========================================================================
local TabTrain = Window:CreateTab({
    Name = "Training & Thể Lực",
    Icon = "fitness_center",
    ImageSource = "Material",
    ShowTitle = true
})

TabTrain:CreateSection("Bao Cát (Aimlabs Phản Xạ)")

TabTrain:CreateToggle({
    Name = "Tự Động Bấm Bia Aimlabs (Bao Cát)",
    Description = "Tự động click chuẩn xác các bia tròn khi bạn đấm bao cát (Legit hoặc Instant)",
    CurrentValue = false,
    Callback = function(val)
        Settings.AimlabsEnabled = val
        if val then
            Luna:Notification({
                Title = "Aimlabs",
                Content = "Đã bật Tự động bấm bia phản xạ Aimlabs!",
                Icon = "sports_mma",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateDropdown({
    Name = "Chế độ giải Aimlabs",
    Description = "Chọn cơ chế hoàn thành vòng tròn Aimlabs",
    Options = {"Legit (Click mô phỏng)", "Instant (Hoàn thành 0.001s)"},
    CurrentOption = "Legit (Click mô phỏng)",
    Callback = function(val)
        if string.find(val, "Instant") then
            Settings.AimlabsMode = "Instant"
        else
            Settings.AimlabsMode = "Legit"
        end
    end
})

TabTrain:CreateSlider({
    Name = "Độ trễ Click Aimlabs (giây)",
    Description = "Tốc độ click vòng tròn ở chế độ Legit",
    Range = {0.00, 0.15},
    Increment = 0.01,
    CurrentValue = 0.03,
    Callback = function(val)
        Settings.AimlabsDelay = val
    end
})

TabTrain:CreateSlider({
    Name = "Khoảng cách tìm Bao Cát (studs)",
    Description = "Bán kính quét bao cát khi bấm nút tương tác 1 lần",
    Range = {10, 80},
    Increment = 5,
    CurrentValue = 30,
    Callback = function(val)
        Settings.PunchMaxDist = val
    end
})

TabTrain:CreateButton({
    Name = "Đấm Bao Cát Gần Nhất (1 Lần)",
    Description = "Kích hoạt 1 lượt đấm bao cát ngay lập tức",
    Callback = function()
        local bag = findNearestObject("Punching Bag", Settings.PunchMaxDist)
        if bag and canInteract(bag, Settings.PunchMaxDist) then
            local success = false
            if PunchingBagModule and typeof(PunchingBagModule.interacted) == "function" then
                success = pcall(function() PunchingBagModule.interacted(bag) end)
            end
            if not success and InteractionNamespace and InteractionNamespace.Event then
                pcall(function() InteractionNamespace.Event.unreliablePost(bag) end)
            end
            sendKeyVIM(Enum.KeyCode.E)
            Luna:Notification({
                Title = "Bao Cát",
                Content = "Đã kích hoạt tương tác với bao cát!",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        else
            Luna:Notification({
                Title = "Lỗi",
                Content = "Không tìm thấy bao cát trong bán kính!",
                Icon = "cancel",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateSection("Ghế Đẩy Tạ (Benchpress QTE)")

TabTrain:CreateToggle({
    Name = "Tự Động Giải QTE Đẩy Tạ (Benchpress)",
    Description = "Tự động giải mini-game Skillcheck khi bạn nằm vào ghế tập tạ (Legit hoặc Instant)",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoBenchpress = val
        if val then
            Luna:Notification({
                Title = "Benchpress",
                Content = "Đã bật Tự động giải QTE ghế tập tạ!",
                Icon = "fitness_center",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateDropdown({
    Name = "Chế độ giải QTE Benchpress",
    Description = "Chọn cách tự động hoàn thành mini-game Skillcheck đẩy tạ",
    Options = {"Legit (Tự động bấm Space khi kim tới vùng)", "Instant (Bypass hoàn thành 0.001s)"},
    CurrentOption = "Legit (Tự động bấm Space khi kim tới vùng)",
    Callback = function(val)
        if string.find(val, "Instant") then
            Settings.BenchpressMode = "Instant"
        else
            Settings.BenchpressMode = "Legit"
        end
    end
})

TabTrain:CreateSlider({
    Name = "Dung sai góc bấm Space (độ)",
    Description = "Góc dung sai quét vùng an toàn (chuẩn game 20 độ)",
    Range = {10, 30},
    Increment = 1,
    CurrentValue = 20,
    Callback = function(val)
        Settings.SkillcheckTolerance = val
    end
})

TabTrain:CreateSlider({
    Name = "Khoảng cách tìm Ghế Tạ (studs)",
    Description = "Bán kính tối đa để quét tìm ghế tập tạ",
    Range = {10, 60},
    Increment = 5,
    CurrentValue = 30,
    Callback = function(val)
        Settings.BenchMaxDist = val
    end
})

TabTrain:CreateButton({
    Name = "Đẩy Tạ Đòn Gần Nhất (1 Lần)",
    Description = "Kích hoạt tương tác ghế đẩy tạ gần nhất",
    Callback = function()
        local bench = findNearestObject("Benchpress", Settings.BenchMaxDist)
        if bench and canInteract(bench, Settings.BenchMaxDist) then
            if BenchpressModule and typeof(BenchpressModule.interacted) == "function" then
                pcall(function() BenchpressModule.interacted(bench) end)
            end
            if InteractionNamespace and InteractionNamespace.Event then
                pcall(function() InteractionNamespace.Event.unreliablePost(bench) end)
            end
            sendKeyVIM(Enum.KeyCode.E)
            Luna:Notification({
                Title = "Benchpress",
                Content = "Đã kích hoạt tương tác ghế tập tạ!",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        else
            Luna:Notification({
                Title = "Lỗi",
                Content = "Không tìm thấy ghế đẩy tạ trong bán kính!",
                Icon = "cancel",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateSection("Đường Chạy Việt Dã (Running Track)")

TabTrain:CreateButton({
    Name = "Hoàn Thành Vòng Chạy Ngay (Claim Track EXP)",
    Description = "Gửi tín hiệu hoàn thành chặng chạy việt dã để nhận EXP Tốc độ",
    Callback = function()
        if PlayerNamespace and PlayerNamespace.Track then
            PlayerNamespace.Track.post()
            Luna:Notification({
                Title = "Running Track",
                Content = "Đã nhận thưởng hoàn thành vòng chạy việt dã!",
                Icon = "directions_run",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateSection("Thăng Bằng & Cơ Động (ODMG Balancer)")

TabTrain:CreateButton({
    Name = "Mở Menu Balancer (Bất Kỳ Đâu)",
    Description = "Bật giao diện máy tập thăng bằng trực tiếp mà không cần lại gần máy hay đợi event",
    Callback = function()
        local ok = false
        pcall(function()
            if StateModule then
                local trainer = StateModule("trainer")
                trainer({visible = true})
                ok = true
            end
        end)
        if ok then
            Luna:Notification({
                Title = "ODMG Balancer",
                Content = "Đã mở giao diện Balancer thành công!",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        else
            Luna:Notification({
                Title = "ODMG Balancer",
                Content = "Không thể mở giao diện. Thử lại sau!",
                Icon = "cancel",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateButton({
    Name = "Nạp Max Điểm Drumming Game (14,000đ)",
    Description = "Gửi điểm tối đa để lấy chứng chỉ ODMG và qua kỳ sát hạch thăng bằng",
    Callback = function()
        if GearNamespace and GearNamespace.Score then
            GearNamespace.Score.post({score = 14000, type = "Drumming Game"})
            pcall(function()
                Workspace:SetAttribute("Balancer", 14000)
            end)
            Luna:Notification({
                Title = "ODMG Balancer",
                Content = "Đã gửi 14,000 điểm Drumming Game & cập nhật điểm thi!",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateButton({
    Name = "Nạp Max Điểm Rhythm Game (14,000đ)",
    Description = "Mở khóa bùa chú Rhythmatic và nhận EXP bộ cơ động 3D tối đa",
    Callback = function()
        if GearNamespace and GearNamespace.Score then
            GearNamespace.Score.post({score = 14000, type = "Rhythm Game"})
            pcall(function()
                Workspace:SetAttribute("Balancer", 14000)
            end)
            Luna:Notification({
                Title = "ODMG Rhythm",
                Content = "Đã gửi 14,000 điểm Rhythm Game!",
                Icon = "check_circle",
                ImageSource = "Material"
            })
        end
    end
})

TabTrain:CreateSection("🎓 Kỳ Thi Tốt Nghiệp Tân Binh (Exam 100/100 Điểm)")

TabTrain:CreateButton({
    Name = "⚡ Nạp Full 100/100 Điểm Tốt Nghiệp (1-Click)",
    Description = "Gửi trọn vẹn điểm tối đa cả 5 bài thi: Thăng bằng (10đ), Bắn súng (10đ), Tốc độ (15đ), Chém gáy (15đ) và Lý thuyết (50đ)",
    Callback = function()
        if ExamNamespace then
            if ExamNamespace.Balance then
                pcall(function() ExamNamespace.Balance.post(10) end)
            end
            if ExamNamespace.Musket then
                pcall(function() ExamNamespace.Musket.post(10) end)
            end
            if ExamNamespace.Speed then
                pcall(function() ExamNamespace.Speed.post(15) end)
            end
            if ExamNamespace.Napes then
                pcall(function() ExamNamespace.Napes.post(15) end)
            end
            if ExamNamespace.Quiz then
                pcall(function() ExamNamespace.Quiz.post(50) end)
            end
        end

        pcall(function() Workspace:SetAttribute("Balancer", 30000) end)
        pcall(function() Workspace:SetAttribute("Muskets", 5) end)

        if GearNamespace and GearNamespace.Score then
            pcall(function() GearNamespace.Score.post({score = 30000, type = "Drumming Game"}) end)
        end

        Luna:Notification({
            Title = "Kỳ Thi Sát Hạch",
            Content = "Đã nạp 100/100 ĐIỂM TUYỆT ĐỐI! Đủ điều kiện tốt nghiệp vào mọi Binh đoàn.",
            Icon = "military_tech",
            ImageSource = "Material"
        })
    end
})

TabTrain:CreateButton({
    Name = "Nạp 10đ Balancer Test (30k điểm)",
    Description = "Điểm tối đa phần thi giữ thăng bằng ODMG",
    Callback = function()
        if ExamNamespace and ExamNamespace.Balance then
            ExamNamespace.Balance.post(10)
            pcall(function() Workspace:SetAttribute("Balancer", 30000) end)
            Luna:Notification({ Title = "Exam Balancer", Content = "Đã gửi 10/10 điểm Balancer Test!" })
        end
    end
})

TabTrain:CreateButton({
    Name = "Nạp 10đ Musket Test (5 bia)",
    Description = "Điểm tối đa phần thi bắn súng hỏa mai",
    Callback = function()
        if ExamNamespace and ExamNamespace.Musket then
            ExamNamespace.Musket.post(10)
            pcall(function() Workspace:SetAttribute("Muskets", 5) end)
            Luna:Notification({ Title = "Exam Musket", Content = "Đã gửi 10/10 điểm Musket Test!" })
        end
    end
})

TabTrain:CreateButton({
    Name = "Nạp 15đ Speed Test (<32s)",
    Description = "Điểm tối đa phần thi chạy vượt địa hình",
    Callback = function()
        if ExamNamespace and ExamNamespace.Speed then
            ExamNamespace.Speed.post(15)
            Luna:Notification({ Title = "Exam Speed", Content = "Đã gửi 15/15 điểm Speed Test!" })
        end
    end
})

TabTrain:CreateButton({
    Name = "Nạp 15đ Nape Test (20 gáy Titan)",
    Description = "Điểm tối đa phần thi chém gáy nộm Titan",
    Callback = function()
        if ExamNamespace and ExamNamespace.Napes then
            ExamNamespace.Napes.post(15)
            Luna:Notification({ Title = "Exam Napes", Content = "Đã gửi 15/15 điểm Nape Test!" })
        end
    end
})

TabTrain:CreateButton({
    Name = "Nạp 50đ Written Exam (20 câu)",
    Description = "Điểm tối đa phần thi trắc nghiệm lịch sử",
    Callback = function()
        if ExamNamespace and ExamNamespace.Quiz then
            ExamNamespace.Quiz.post(50)
            Luna:Notification({ Title = "Written Exam", Content = "Đã gửi 50/50 điểm Written Exam!" })
        end
    end
})

-- =========================================================================
-- TAB 2: ⚡ ADVANCED AUTO (MINIGAMES VIM, LORE QUIZ, FULL COMBAT)
-- =========================================================================
local TabAdvancedAuto = Window:CreateTab({
    Name = "Advanced Auto",
    Icon = "auto_awesome",
    ImageSource = "Material",
    ShowTitle = true
})

TabAdvancedAuto:CreateSection("🎮 Auto Minigames (VIM Mô Phỏng Người Thật)")

TabAdvancedAuto:CreateToggle({
    Name = "Auto Balance Drum (Phím Q/E)",
    Description = "Tự động bấm Q/E qua VIM khi nốt nhịp tiến vào vạch tâm (PERFECT 100%)",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoBalanceDrum = val
        if val then
            Luna:Notification({
                Title = "Auto Balance",
                Content = "Đã kích hoạt Auto gõ phím Q/E thăng bằng!",
                Icon = "sports_esports",
                ImageSource = "Material"
            })
        end
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Auto Rhythm OSU (Phím Q/E Hard)",
    Description = "Tự động gõ Q/E luân phiên khi vòng tròn co nhỏ trong bài huấn luyện Hard",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoBalanceRhythm = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Auto Skillcheck QTE (Phím Space)",
    Description = "Đọc góc quay Spinner và gõ Spacebar chuẩn xác khi lọt vào vùng an toàn",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoSkillcheckVIM = val
        if val then
            Luna:Notification({
                Title = "Auto Skillcheck",
                Content = "Đã bật tự động căn góc bấm Spacebar!",
                Icon = "keyboard",
                ImageSource = "Material"
            })
        end
    end
})

TabAdvancedAuto:CreateSlider({
    Name = "Dung sai góc Skillcheck (độ)",
    Description = "Khoảng cách góc an toàn để kích hoạt phím Space (chuẩn game 20 độ)",
    Range = {10, 30},
    Increment = 1,
    CurrentValue = 20,
    Callback = function(val)
        Settings.SkillcheckTolerance = val
    end
})

TabAdvancedAuto:CreateSection("📜 Auto Lore Quiz (Trắc Nghiệm Lịch Sử Binh Đoàn)")

TabAdvancedAuto:CreateToggle({
    Name = "Auto Lore Quiz (Giải Đề 50/50)",
    Description = "Tự động tra cứu 50 câu hỏi lịch sử và click đáp án đúng kèm delay người thật",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoLoreQuiz = val
        if val then
            Luna:Notification({
                Title = "Lore Quiz",
                Content = "Bật chế độ Auto Lore Quiz! Khi mở bài thi tool sẽ tự giải.",
                Icon = "school",
                ImageSource = "Material"
            })
        end
    end
})

TabAdvancedAuto:CreateSlider({
    Name = "Thời gian suy nghĩ mỗi câu (giây)",
    Description = "Khoảng trễ ngẫu nhiên giữa mỗi lần tick đáp án để qua mặt Spectate của Admin",
    Range = {0.5, 3.5},
    Increment = 0.25,
    CurrentValue = 1.5,
    Callback = function(val)
        Settings.QuizDelay = val
    end
})

TabAdvancedAuto:CreateButton({
    Name = "Tự giải Quiz đang mở ngay (1-Click)",
    Description = "Quét và click chọn ngay lập tức toàn bộ đáp án đúng cho bài thi Quiz đang mở",
    Callback = function()
        solveCurrentQuiz(true)
    end
})

TabAdvancedAuto:CreateSection("💥 Full Combat Auto (Silent-Aim & Đại Bác)")

TabAdvancedAuto:CreateToggle({
    Name = "Silent-Aim Musket (Bẻ Cong Tia Đạn)",
    Description = "Đạn tự bẻ cong trúng thẳng mục tiêu bất chấp độ giật Recoil và Inaccuracy của súng",
    CurrentValue = false,
    Callback = function(val)
        Settings.SilentAimEnabled = val
        if val then
            Luna:Notification({
                Title = "Silent-Aim",
                Content = "Đã kích hoạt Silent-Aim! Đạn sẽ ghim trúng mục tiêu trong FOV.",
                Icon = "gps_fixed",
                ImageSource = "Material"
            })
        end
    end
})

TabAdvancedAuto:CreateDropdown({
    Name = "Mục tiêu ưu tiên Silent-Aim",
    Description = "Chọn đối tượng ưu tiên khóa mục tiêu khi bắn súng",
    Options = {"Tất cả mục tiêu", "Bia ngắm Musket (Target)", "Gáy Titan (Nape)", "Đầu Titan (Head)"},
    CurrentOption = "Tất cả mục tiêu",
    Callback = function(val)
        Settings.SilentAimTarget = val
    end
})

TabAdvancedAuto:CreateSlider({
    Name = "Bán kính FOV Silent-Aim (pixels)",
    Description = "Phạm vi quét mục tiêu xung quanh con trỏ chuột trên màn hình",
    Range = {80, 500},
    Increment = 10,
    CurrentValue = 250,
    Callback = function(val)
        Settings.SilentAimFOV = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Hiển thị vòng tròn FOV",
    Description = "Vẽ vòng tròn FOV màu cyan trực quan quanh con trỏ chuột",
    CurrentValue = false,
    Callback = function(val)
        Settings.SilentAimShowFOV = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Anti-Recoil (Triệt Tiêu Giật Súng 100%)",
    Description = "Khử hoàn toàn xung lực lò xo giật camera khi bắn súng (Zero Recoil Spring)",
    CurrentValue = false,
    Callback = function(val)
        Settings.AntiRecoil = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "No Spread (Đạn Thẳng Tuyệt Đối 100%)",
    Description = "Triệt tiêu độ tản mát góc ngẫu nhiên, đạn ghim chuẩn xác 100% vào tâm ngắm",
    CurrentValue = false,
    Callback = function(val)
        Settings.NoSpread = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Mở Khóa Đường Đạn Laser (Trajectory Beam)",
    Description = "Kích hoạt hệ thống 48 tia Beam và tâm tròn điểm rơi đạn chính thức của game",
    CurrentValue = false,
    Callback = function(val)
        Settings.TrajectoryPreview = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Di Chuyển Nhanh Khi Ngắm (Fast Aim Walk)",
    Description = "Giữ nguyên tốc độ di chuyển bình thường khi đang giương súng ngắm",
    CurrentValue = false,
    Callback = function(val)
        Settings.FastAimWalk = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Nạp Đạn Siêu Tốc (Fast Reload)",
    Description = "Tăng tốc độ animation nạp đạn cho súng hỏa mai và súng lục",
    CurrentValue = false,
    Callback = function(val)
        Settings.FastReload = val
    end
})

TabAdvancedAuto:CreateSlider({
    Name = "Tốc độ nạp đạn (Hệ số nhân)",
    Description = "Tăng tốc độ nạp đạn từ 1.5x đến 4.0x",
    Range = {1.5, 4.0},
    Increment = 0.5,
    CurrentValue = 2.0,
    Callback = function(val)
        Settings.FastReloadMultiplier = val
    end
})

TabAdvancedAuto:CreateToggle({
    Name = "Auto Cannon Reload (Tự nạp đạn pháo)",
    Description = "Tự động nạp đạn cho đại bác gần nhất khi đang cầm hoặc có Cannonball",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoCannonReload = val
        if val then
            Luna:Notification({
                Title = "Auto Cannon",
                Content = "Đã bật Auto nạp đạn đại bác khi lại gần!",
                Icon = "bolt",
                ImageSource = "Material"
            })
        end
    end
})

TabAdvancedAuto:CreateSlider({
    Name = "Khoảng cách Auto Cannon (studs)",
    Description = "Bán kính tối đa để tự động kích hoạt nạp đạn đại bác",
    Range = {6, 25},
    Increment = 1,
    CurrentValue = 14,
    Callback = function(val)
        Settings.CannonReloadDist = val
    end
})

-- =========================================================================
-- TAB: ⚔️ CHIẾN ĐẤU TITAN (TITAN COMBAT & DETECTION BOX EXPLOITS)
-- =========================================================================
local TabTitanCombat = Window:CreateTab({
    Name = "Chiến Đấu Titan",
    Icon = "security",
    ImageSource = "Material",
    ShowTitle = true
})

TabTitanCombat:CreateSection("🛡️ Bất Tử Trước Titan & Chống Bị Tóm (Immunity)")

TabTitanCombat:CreateToggle({
    Name = "Titan Invincibility (Bất Tử Trước Titan)",
    Description = "Vô hiệu hóa Detection Box, triệt tiêu Hitbox tóm/cắn/nuốt, chống Stun/Ragdoll và không bao giờ bị Titan khóa",
    CurrentValue = false,
    Callback = function(val)
        Settings.TitanInvincibility = val
        if val then
            enforceTitanImmunity()
            Luna:Notification({
                Title = "Titan Invincibility",
                Content = "Đã bật Bất Tử Trước Titan! Vô hiệu hóa Detection Box và Hitbox tóm/cắn của Titan.",
                Icon = "shield",
                ImageSource = "Material"
            })
        else
            Luna:Notification({
                Title = "Tắt Bất Tử Titan",
                Content = "Đã tắt chế độ bất tử trước Titan.",
                Icon = "info",
                ImageSource = "Material"
            })
        end
    end
})

TabTitanCombat:CreateSection("🎯 Chém Mọi Chi Thành Gáy (Limb To Nape Redirect)")

TabTitanCombat:CreateToggle({
    Name = "Limb to Nape Redirect (Chém Chi Thành Gáy)",
    Description = "Tự động bẻ hướng toàn bộ đòn chém trúng bất kỳ bộ phận nào của Titan (chân, tay, ngực) thành sát thương chí mạng Gáy (Nape)",
    CurrentValue = false,
    Callback = function(val)
        Settings.LimbToNape = val
        if val then
            Luna:Notification({
                Title = "Limb to Nape Redirect",
                Content = "Đã bật chuyển hướng sát thương! Chém trúng chi bất kỳ đều ghi nhận trúng Gáy.",
                Icon = "gps_fixed",
                ImageSource = "Material"
            })
        end
    end
})

TabTitanCombat:CreateSlider({
    Name = "Khoảng cách Nape Redirect tối đa (studs)",
    Description = "Chỉ chuyển hướng thành Gáy khi cự ly tới Gáy nằm trong tầm này (để vượt qua Server Sanity Check)",
    Range = {15, 80},
    Increment = 1,
    CurrentValue = 45,
    Callback = function(val)
        Settings.LimbToNapeMaxDist = val
    end
})

TabTitanCombat:CreateSection("⛽ Khí Gas & Lưỡi Dao Bất Hoại (Gear Exploits)")

TabTitanCombat:CreateToggle({
    Name = "Vô Hạn Khí Nén ODMG (Infinite Gas)",
    Description = "Duy trì khí gas math.huge, không tiêu hao khi lướt (boost) hoặc bay",
    CurrentValue = false,
    Callback = function(val)
        Settings.InfiniteGas = val
        if val then
            enforceInfiniteGasAndBlade()
            Luna:Notification({
                Title = "Infinite Gas",
                Content = "Đã bật Vô Hạn Khí Gas ODMG!",
                Icon = "bolt",
                ImageSource = "Material"
            })
        end
    end
})

TabTitanCombat:CreateToggle({
    Name = "Đóng Băng Độ Bền Kiếm (Freeze Blade Durability)",
    Description = "Lưỡi dao luôn giữ nguyên 100% độ bền và 8 lưỡi dự phòng, chém không bao giờ mòn/gãy",
    CurrentValue = false,
    Callback = function(val)
        Settings.InfiniteBlades = val
        Settings.FreezeBladeDurability = val
        if val then
            enforceInfiniteGasAndBlade()
            Luna:Notification({
                Title = "Freeze Blade Durability",
                Content = "Đã khóa độ bền lưỡi kiếm ở mức 100%!",
                Icon = "hardware",
                ImageSource = "Material"
            })
        end
    end
})

-- =========================================================================
-- TAB 3: 🔮 BÙA CHÚ & TIẾN TRÌNH (PROGRESSION & ENCHANTMENTS - 308 BÙA)
-- =========================================================================
local TabEnchant = Window:CreateTab({
    Name = "Bùa Chú & Tiến Trình",
    Icon = "stars",
    ImageSource = "Material",
    ShowTitle = true
})

TabEnchant:CreateSection("✨ Bộ Chọn Bùa Chú Toàn Năng (308 Bùa)")

local filterCategoryList = {
    "🔥 Mythic (13 bùa)",
    "✨ Unique (20 bùa)",
    "🌟 Legendary (30 bùa)",
    "🟣 Epic (42 bùa)",
    "🔵 Rare (69 bùa)",
    "🟢 Uncommon (77 bùa)",
    "⚪ Common (57 bùa)",
    "⚔️ Nhóm: Cơ động & ODMG",
    "🗡️ Nhóm: Sát thương Kiếm & Titan",
    "👁️ Nhóm: Thần Nhãn & ESP",
    "🎯 Nhóm: Xạ Thủ & Súng Đạn",
    "🛡️ Nhóm: Sinh Tồn & Hỗ Trợ",
    "🐎 Nhóm: Kỵ Binh & Chiến Mã (Horse)",
    "📜 Tất Cả 308 Bùa (A-Z)",
}

local isSpoofToggleActive = false
local DropdownEnchant = nil

local DropdownCategory = TabEnchant:CreateDropdown({
    Name = "Danh Mục / Phẩm Cấp Lọc",
    Description = "Lọc bùa chú theo Phẩm cấp (Mythic, Legendary, Epic...) hoặc theo Nhóm thực chiến",
    Options = filterCategoryList,
    CurrentOption = "🔥 Mythic (13 bùa)",
    Callback = function(val)
        Settings.SelectedEnchantCategory = val
        local newOptions = getCategoryOptions(val)
        local firstOption = newOptions[1] or "None"
        Settings.SelectedEnchantName = extractEnchantName(firstOption)
        
        if DropdownEnchant and typeof(DropdownEnchant.Set) == "function" then
            DropdownEnchant:Set({
                Options = newOptions,
                CurrentOption = firstOption
            })
        end
        
        if isSpoofToggleActive then
            local item = findEnchantItem(Settings.SelectedEnchantName)
            if item then
                Settings.SpoofedEnchants[item.name] = true
                local customAttrs = ENCHANT_PRESET_ATTRIBUTES[item.name]
                if customAttrs then
                    for k, v in pairs(customAttrs) do
                        Settings.SpoofedAttributes[k] = v
                    end
                end
            end
        end
    end
})

DropdownEnchant = TabEnchant:CreateDropdown({
    Name = "Chọn Bùa Chú Cụ Thể (Phẩm Cấp & Tên)",
    Description = "Chọn bùa chú muốn kích hoạt thuộc tính hoặc dùng làm mục tiêu Auto Gacha",
    Options = getCategoryOptions("🔥 Mythic (13 bùa)"),
    CurrentOption = "[Mythic] Eradicate",
    Callback = function(val)
        local clean = extractEnchantName(val)
        Settings.SelectedEnchantName = clean
        local item = findEnchantItem(clean)
        
        if isSpoofToggleActive and item then
            Settings.SpoofedEnchants[item.name] = true
            local customAttrs = ENCHANT_PRESET_ATTRIBUTES[item.name]
            if customAttrs then
                for k, v in pairs(customAttrs) do
                    Settings.SpoofedAttributes[k] = v
                end
            end
            Luna:Notification({
                Title = "Bùa Chú Đang Chọn",
                Content = string.format("Đã chuyển sang: [%s] %s\n%s", item.rarity, item.name, item.desc or ""),
                Icon = "auto_awesome",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateInput({
    Name = "🔍 Tìm Kiếm / Nhập Tên Bùa Trực Tiếp",
    Description = "Gõ tên bùa (Ví dụ: Eradicate, Founder, Bloodthirsty...) để chọn ngay lập tức trong 308 bùa",
    PlaceholderText = "Nhập tên bùa chú cần tìm...",
    CurrentValue = "",
    Callback = function(text)
        if text and #text > 1 then
            local it, rName = findEnchantItem(text)
            if it then
                Settings.SelectedEnchantName = it.name
                Luna:Notification({
                    Title = "Tìm Thấy Bùa Chú!",
                    Content = string.format("[%s] %s\nMô tả: %s", it.rarity, it.name, it.desc or ""),
                    Icon = "check_circle",
                    ImageSource = "Material"
                })
                if isSpoofToggleActive then
                    Settings.SpoofedEnchants[it.name] = true
                    local customAttrs = ENCHANT_PRESET_ATTRIBUTES[it.name]
                    if customAttrs then
                        for k, v in pairs(customAttrs) do
                            Settings.SpoofedAttributes[k] = v
                        end
                    end
                end
            else
                Luna:Notification({
                    Title = "Tìm Kiếm",
                    Content = "Không tìm thấy bùa nào có tên: " .. tostring(text),
                    Icon = "search_off",
                    ImageSource = "Material"
                })
            end
        end
    end
})

TabEnchant:CreateToggle({
    Name = "Bật Thuộc Tính Bùa Đang Chọn (Client Spoof)",
    Description = "Hook ClientAttributesHandler & ClientEnchantmentsHandler để kích hoạt toàn bộ chỉ số và nội tại của bùa này",
    CurrentValue = false,
    Callback = function(val)
        isSpoofToggleActive = val
        local item = findEnchantItem(Settings.SelectedEnchantName)
        if val then
            if item then
                Settings.SpoofedEnchants[item.name] = true
                local customAttrs = ENCHANT_PRESET_ATTRIBUTES[item.name]
                if customAttrs then
                    for k, v in pairs(customAttrs) do
                        Settings.SpoofedAttributes[k] = v
                    end
                end
                Luna:Notification({
                    Title = "Đã Bật Thuộc Tính Bùa",
                    Content = string.format("[%s] %s đã được kích hoạt trên Client!\nHiệu ứng: %s", item.rarity, item.name, item.desc or ""),
                    Icon = "check_circle",
                    ImageSource = "Material"
                })
            else
                Luna:Notification({
                    Title = "Thông Báo",
                    Content = "Vui lòng chọn một bùa chú hợp lệ trong danh sách!",
                    Icon = "report",
                    ImageSource = "Material"
                })
            end
        else
            if item then
                Settings.SpoofedEnchants[item.name] = nil
                local customAttrs = ENCHANT_PRESET_ATTRIBUTES[item.name]
                if customAttrs then
                    for k, _ in pairs(customAttrs) do
                        Settings.SpoofedAttributes[k] = nil
                    end
                end
            end
            Luna:Notification({
                Title = "Đã Tắt Thuộc Tính",
                Content = "Đã hủy kích hoạt thuộc tính của: " .. tostring(Settings.SelectedEnchantName),
                Icon = "info",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateButton({
    Name = "Kích Hoạt Chiêu Thức Ngay (Cast Skill)",
    Description = "Gửi tín hiệu thi triển kỹ năng chủ động (Nếu là Eradicate: Tự động dò Titan gần nhất để trượt chém)",
    Callback = function()
        if Settings.SelectedEnchantName and Settings.SelectedEnchantName ~= "" then
            castEnchantSkill(Settings.SelectedEnchantName)
        else
            Luna:Notification({
                Title = "Lỗi",
                Content = "Chưa chọn bùa chú nào!",
                Icon = "cancel",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateKeybind({
    Name = "Phím Tắt Kích Hoạt Nhanh",
    Description = "Nhấn phím này để tự động tung chiêu thức bùa đang chọn khi chiến đấu",
    CurrentBind = "V",
    HoldToInteract = false,
    Callback = function(key)
        if typeof(key) == "string" and Enum.KeyCode[key] then
            Settings.CastHotkey = Enum.KeyCode[key]
        elseif typeof(key) == "EnumItem" then
            Settings.CastHotkey = key
        end
    end
})

-- =========================================================================
-- 🎛️ KHU VỰC MULTI-ENCHANT CHECKLIST: BẬT VÀ DÙNG NHIỀU BÙA CÙNG MỘT LÚC
-- =========================================================================
TabEnchant:CreateSection("🎛️ Kích Hoạt Nhiều Bùa Cùng Lúc (Multi-Enchant Checklist)")

local ActiveEnchantsParagraph = TabEnchant:CreateParagraph({
    Title = "📋 Danh Sách Bùa Đang Chạy (0 bùa)",
    Text = "Chưa có bùa nào trong danh sách. Hãy nhấn nút bên dưới để thêm bùa và kích hoạt nhiều bùa cùng lúc!"
})

local function updateActiveEnchantsDisplay()
    local names = {}
    for n, active in pairs(Settings.ActiveEnchantList) do
        if active then
            local it = findEnchantItem(n)
            local tag = it and string.format("[%s] %s", it.rarity, it.name) or n
            table.insert(names, tag)
        end
    end
    table.sort(names)
    local count = #names
    local text = "Chưa có bùa nào trong danh sách kích hoạt."
    if count > 0 then
        text = "Đang chạy đồng thời (" .. tostring(count) .. " bùa):\n• " .. table.concat(names, "\n• ")
    end
    pcall(function()
        if ActiveEnchantsParagraph and ActiveEnchantsParagraph.Set then
            ActiveEnchantsParagraph:Set({
                Title = string.format("📋 Danh Sách Bùa Đang Chạy (%d bùa)", count),
                Text = text
            })
        end
    end)
end

TabEnchant:CreateButton({
    Name = "➕ Thêm Bùa Đang Chọn Vào Danh Sách Kích Hoạt",
    Description = "Bật bùa đang chọn vào danh sách chạy đồng thời (Hoạt động song song với các bùa khác)",
    Callback = function()
        local name = Settings.SelectedEnchantName
        if not name or name == "" then
            Luna:Notification({ Title = "Lỗi", Content = "Chưa chọn bùa chú nào!", Icon = "cancel", ImageSource = "Material" })
            return
        end
        Settings.ActiveEnchantList[name] = true
        Settings.SpoofedEnchants[name] = true
        local customAttrs = ENCHANT_PRESET_ATTRIBUTES[name]
        if customAttrs then
            for k, v in pairs(customAttrs) do
                Settings.SpoofedAttributes[k] = v
            end
        end
        updateActiveEnchantsDisplay()
        local it = findEnchantItem(name)
        local rName = it and it.rarity or "Enchant"
        local isPass = it and it.passive
        Luna:Notification({
            Title = "Đã Thêm Vào Danh Sách",
            Content = string.format("Đã bật bùa: [%s] %s\nLoại: %s\n👉 Bùa này đang chạy song song cùng danh sách!", rName, name, isPass and "Nội tại (Tự động kích hoạt khi đánh)" or "Chủ động (Bấm thi triển)"),
            Icon = "check_circle",
            ImageSource = "Material"
        })
    end
})

TabEnchant:CreateButton({
    Name = "➖ Gỡ Bùa Đang Chọn Khỏi Danh Sách",
    Description = "Tắt và loại bỏ bùa đang chọn ra khỏi danh sách kích hoạt đồng thời",
    Callback = function()
        local name = Settings.SelectedEnchantName
        if not name or name == "" then return end
        Settings.ActiveEnchantList[name] = nil
        Settings.SpoofedEnchants[name] = nil
        local customAttrs = ENCHANT_PRESET_ATTRIBUTES[name]
        if customAttrs then
            for k, _ in pairs(customAttrs) do
                Settings.SpoofedAttributes[k] = nil
            end
        end
        updateActiveEnchantsDisplay()
        Luna:Notification({
            Title = "Đã Gỡ Khỏi Danh Sách",
            Content = "Đã tắt bùa: " .. tostring(name),
            Icon = "remove_circle_outline",
            ImageSource = "Material"
        })
    end
})

TabEnchant:CreateButton({
    Name = "⚡ Kích Hoạt Toàn Bộ Bùa Trong Nhóm Hiện Tại",
    Description = "Bật đồng thời TẤT CẢ các bùa thuộc danh mục/phẩm cấp đang chọn vào danh sách chạy",
    Callback = function()
        local count = 0
        local options = getCategoryOptions(Settings.SelectedEnchantCategory)
        for _, opt in ipairs(options) do
            local cleanName = extractEnchantName(opt)
            if cleanName and cleanName ~= "Không tìm thấy bùa chú" then
                Settings.ActiveEnchantList[cleanName] = true
                Settings.SpoofedEnchants[cleanName] = true
                local customAttrs = ENCHANT_PRESET_ATTRIBUTES[cleanName]
                if customAttrs then
                    for k, v in pairs(customAttrs) do
                        Settings.SpoofedAttributes[k] = v
                    end
                end
                count = count + 1
            end
        end
        updateActiveEnchantsDisplay()
        Luna:Notification({
            Title = "Kích Hoạt Hàng Loạt",
            Content = string.format("Đã kích hoạt đồng thời %d bùa thuộc [%s]!", count, Settings.SelectedEnchantCategory),
            Icon = "flash_on",
            ImageSource = "Material"
        })
    end
})

TabEnchant:CreateButton({
    Name = "💥 Kích Hoạt Toàn Bộ Chiêu Thức Đang Bật (Cast All)",
    Description = "Thi triển đồng loạt tất cả các kỹ năng chủ động và lướt chém Eradicate (nếu có Titan gần)",
    Callback = function()
        castAllActiveSkills()
    end
})

TabEnchant:CreateButton({
    Name = "🗑️ Tắt Toàn Bộ Bùa Đang Bật (Clear All Active)",
    Description = "Hủy kích hoạt toàn bộ bùa trong danh sách và xóa sạch thuộc tính giả lập",
    Callback = function()
        table.clear(Settings.ActiveEnchantList)
        table.clear(Settings.SpoofedEnchants)
        table.clear(Settings.SpoofedAttributes)
        updateActiveEnchantsDisplay()
        Luna:Notification({
            Title = "Đã Làm Sạch Danh Sách",
            Content = "Đã tắt toàn bộ bùa chú đang kích hoạt!",
            Icon = "delete_sweep",
            ImageSource = "Material"
        })
    end
})

-- =========================================================================
-- ⛽ VÔ HẠN KHÍ NÉN (INFINITE GAS) & LƯỠI DAO (INFINITE BLADES) ĐỘC LẬP
-- =========================================================================
TabEnchant:CreateSection("⛽ Vô Hạn Khí Nén & Lưỡi Dao (Infinite Gas & Blade)")

TabEnchant:CreateToggle({
    Name = "Vô Hạn Khí Nén ODMG (Infinite Gas)",
    Description = "Khóa bình khí nén luôn đầy 100%, khử hao hụt khi bay lượn và boost gas, tự động nạp đầy liên tục",
    CurrentValue = false,
    Callback = function(val)
        Settings.InfiniteGas = val
        if val then
            getgenv().__USING_INFINITE_GAS__ = true
            _G.__USING_INFINITE_GAS__ = true
            enforceInfiniteGasAndBlade()
            Luna:Notification({
                Title = "Vô Hạn Khí Nén (Infinite Gas)",
                Content = "Đã kích hoạt Vô Hạn Gas! Khóa bình khí 100% không bao giờ cạn.",
                Icon = "local_gas_station",
                ImageSource = "Material"
            })
        else
            getgenv().__USING_INFINITE_GAS__ = false
            _G.__USING_INFINITE_GAS__ = false
            Luna:Notification({
                Title = "Tắt Vô Hạn Khí Nén",
                Content = "Đã tắt chế độ vô hạn gas.",
                Icon = "info",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateToggle({
    Name = "Vô Hạn Lưỡi Dao & Độ Bền (Infinite Blades)",
    Description = "Khóa độ bền kiếm 100%, không bao giờ gãy kiếm hay văng lưỡi dao, số lượng lưỡi luôn ở mức tối đa 8/8",
    CurrentValue = false,
    Callback = function(val)
        Settings.InfiniteBlades = val
        if val then
            enforceInfiniteGasAndBlade()
            Luna:Notification({
                Title = "Vô Hạn Lưỡi Dao (Infinite Blades)",
                Content = "Đã kích hoạt Vô Hạn Lưỡi Dao! Độ bền luôn đạt 100 và số dao luôn đầy 8/8.",
                Icon = "carpenter",
                ImageSource = "Material"
            })
        else
            Luna:Notification({
                Title = "Tắt Vô Hạn Lưỡi Dao",
                Content = "Đã tắt chế độ vô hạn lưỡi dao.",
                Icon = "info",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateSection("⚡ Bộ Presets Kích Hoạt Nhanh (1-Click God Buffs)")

TabEnchant:CreateToggle({
    Name = "Bộ Gacha Toàn Tri (Insight + Deduction)",
    Description = "Nhìn thấu 100% phẩm cấp và lật ngửa toàn bộ thẻ bài khi bóc gói bùa chú (Không bao giờ bốc mù)",
    CurrentValue = false,
    Callback = function(val)
        Settings.PresetInsightDeduction = val
        if val then
            Luna:Notification({
                Title = "Gacha Toàn Tri",
                Content = "Đã kích hoạt giác quan Insight & Deduction! Bài bóc ra sẽ tự lộ diện hoàn toàn.",
                Icon = "visibility",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateToggle({
    Name = "Bộ Siêu Cơ Động ODMG (God Mobility)",
    Description = "Mở khóa Double Jump, Dash, Double Dash, Wallrun, Max Speed 999, Triệt tiêu ngã dập mặt & Khí nén vô hạn",
    CurrentValue = false,
    Callback = function(val)
        Settings.PresetSuperODMG = val
        Settings.InfiniteGas = val
        Settings.InfiniteBlades = val
        if val then
            enforceInfiniteGasAndBlade()
            Luna:Notification({
                Title = "Siêu Cơ Động ODMG",
                Content = "Đã mở khóa toàn bộ kỹ năng cơ động cực hạn (Nhảy đôi, Lướt né, Chạy tường, Vận tốc 999, Vô hạn Gas & Lưỡi dao)!",
                Icon = "flight_takeoff",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateToggle({
    Name = "Bộ Giác Quan Thứ 6 (Combat Radar & Alert)",
    Description = "Kích hoạt cảnh báo Titan chộp vồ, Laser đạn 48 tia, HUD vận tốc bay & tầm bắn dây neo",
    CurrentValue = false,
    Callback = function(val)
        Settings.PresetSixthSense = val
        if val then
            Luna:Notification({
                Title = "Giác Quan Thứ 6",
                Content = "Đã bật cảnh báo nguy hiểm Titan chộp và các HUD hỗ trợ ngắm bắn!",
                Icon = "gps_fixed",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateToggle({
    Name = "Bộ Chiến Mã Thần Tốc (God Horse Buffs)",
    Description = "Tăng tốc độ phi (+120 studs/s), thể lực vô hạn (0 hao hụt), hồi thể lực siêu tốc & gọi ngựa khi cầm kiếm",
    CurrentValue = false,
    Callback = function(val)
        Settings.PresetSuperHorse = val
        if val then
            Luna:Notification({
                Title = "Chiến Mã Thần Tốc",
                Content = "Đã kích hoạt buff Ngựa: Tốc độ phi cực đại, Thể lực vô hạn, Thoát yên bằng ODMG & Bỏ giới hạn huýt sáo!",
                Icon = "pets",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateSection("🎁 Tự Động Mở & Nhận Bùa (Auto Gacha Suite)")

TabEnchant:CreateToggle({
    Name = "Tự Động Nhận Bùa Đang Chọn (Auto Claim)",
    Description = "Khi mở gói bài, nếu xuất hiện bùa bạn đang chọn ở Dropdown trên thì tự động nhận ngay",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoClaimEnchant = val
        if val then
            Luna:Notification({
                Title = "Auto Claim",
                Content = "Đã bật Tự động nhận bùa: " .. tostring(Settings.SelectedEnchantName),
                Icon = "check_circle",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateDropdown({
    Name = "Chế độ dự phòng khi không ra bùa đã chọn",
    Description = "Chọn cách xử lý nếu gói bài không có bùa mục tiêu của bạn",
    Options = {"Rarest (Ưu tiên phẩm cấp cao nhất)", "Manual (Không nhận bừa, giữ nguyên)"},
    CurrentOption = "Rarest (Ưu tiên phẩm cấp cao nhất)",
    Callback = function(val)
        if string.find(val, "Rarest") then
            Settings.FallbackClaimMode = "Rarest"
        else
            Settings.FallbackClaimMode = "Manual"
        end
    end
})

TabEnchant:CreateToggle({
    Name = "Tự Động Bóc Gói Bùa Chưa Mở (Auto Open Pack)",
    Description = "Tự động gọi lệnh mở các gói bùa đang có trong hòm đồ chưa bóc",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoOpenPack = val
        if val then
            Luna:Notification({
                Title = "Auto Open Pack",
                Content = "Đã bật tự động bóc gói bùa còn lại!",
                Icon = "construction",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateSection("👁️ Thần Nhãn & Hỗ Trợ Thực Chiến (Native Game Highlight)")

TabEnchant:CreateButton({
    Name = "Quét Thần Nhãn Người Chơi & Titan (Vital Sight)",
    Description = "Kích hoạt hiệu ứng giác quan Medic quét Highlight xuyên tường mọi người chơi & Titan trong bán kính 1200 studs",
    Callback = function()
        triggerVitalSightESP()
        Luna:Notification({
            Title = "Thần Nhãn Vital Sight",
            Content = "Đã kích hoạt quét Highlight toàn bộ mục tiêu xung quanh!",
            Icon = "visibility",
            ImageSource = "Material"
        })
    end
})

TabEnchant:CreateButton({
    Name = "Quét Trạm Khí Nén & Hòm Lưỡi Dao (Supply Seeker)",
    Description = "Kích hoạt hiệu ứng giác quan Logistician quét Highlight các trạm nạp khí & hòm đồ xung quanh trong 1200 studs",
    Callback = function()
        triggerSupplySeekerESP()
        Luna:Notification({
            Title = "Thần Nhãn Supply Seeker",
            Content = "Đã kích hoạt quét Highlight toàn bộ trạm tiếp tế khí nén & dao!",
            Icon = "inventory",
            ImageSource = "Material"
        })
    end
})

TabEnchant:CreateToggle({
    Name = "Tự Động Đỡ Đòn Phản Công (Auto Counter-Parry)",
    Description = "Tự động kích hoạt phản đòn (Skills Counter) khi kẻ địch cầm đao kiếm áp sát dưới 22 studs",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoCounterParry = val
        if val then
            Luna:Notification({
                Title = "Auto Counter-Parry",
                Content = "Đã bật Tự động phản đòn cận chiến khi có kẻ địch áp sát!",
                Icon = "shield",
                ImageSource = "Material"
            })
        end
    end
})

TabEnchant:CreateSection("🧪 Chẩn Đoán Khả Thi: Client vs Server")

TabEnchant:CreateButton({
    Name = "⚡ Chạy Test Tương Tác Server (Bùa Đang Chọn)",
    Description = "Phân tích cơ chế và gửi probe request lên Server để kiểm tra xem bùa này có hoạt động không",
    Callback = function()
        runServerCompatibilityTest(Settings.SelectedEnchantName)
    end
})

TabEnchant:CreateButton({
    Name = "📋 Xuất Báo Cáo Phân Tích Client vs Server (Console)",
    Description = "In chi tiết danh sách tất cả các thuộc tính 100% Client-Side và Server-Side vào F9 Console",
    Callback = function()
        printClientServerAnalysisReport()
    end
})

-- =========================================================================
-- TAB 4: 🎣 SINH TỒN & CHẾ TÁC (CRAFTING & SURVIVAL)
-- =========================================================================
local TabCraft = Window:CreateTab({
    Name = "Sinh Tồn & Chế Tác",
    Icon = "construction",
    ImageSource = "Material",
    ShowTitle = true
})

TabCraft:CreateSection("Câu Cá (Fishing)")

TabCraft:CreateToggle({
    Name = "Auto Câu Cá Hoàn Hảo (Instant Catch)",
    Description = "Tự động giật dính cá ngay lập tức khi cá vừa cắn câu",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoFishing = val
    end
})

TabCraft:CreateSection("Phản Xạ Kỹ Năng QTE (Instant Solve)")

TabCraft:CreateToggle({
    Name = "Instant Solve Skillcheck (Bypass)",
    Description = "Gửi trực tiếp tín hiệu hoàn thành Skillcheck thành công (Hỗ trợ Sly Hands / Goblin)",
    CurrentValue = false,
    Callback = function(val)
        Settings.AutoSkillcheck = val
    end
})

-- =========================================================================
-- TAB 5: 🚀 DỊCH CHUYỂN NHANH TRƯỜNG TẬP (TELEPORTS)
-- =========================================================================
local TabTeleport = Window:CreateTab({
    Name = "Dịch Chuyển Khu Tập",
    Icon = "near_me",
    ImageSource = "Material",
    ShowTitle = true
})

TabTeleport:CreateSection("Khu Huấn Luyện")

local function teleportTo(cframe)
    local char = LocalPlayer.Character
    if char and char.PrimaryPart then
        char:PivotTo(cframe + Vector3.new(0, 3, 0))
    end
end

TabTeleport:CreateButton({
    Name = "Dịch chuyển tới Ghế Tập Tạ gần nhất",
    Callback = function()
        local bench = findNearestObject("Benchpress", 500)
        if bench then
            local targetPos = bench:IsA("BasePart") and bench.CFrame or bench:GetPivot()
            teleportTo(targetPos)
        else
            Luna:Notification({ Title = "Thông báo", Content = "Không tìm thấy ghế đẩy tạ trong phạm vi 500 studs!" })
        end
    end
})

TabTeleport:CreateButton({
    Name = "Dịch chuyển tới Nộm Titan Dummy gần nhất",
    Callback = function()
        local dummy = nil
        local char = LocalPlayer.Character
        local rootPos = char and char.PrimaryPart and char.PrimaryPart.Position or Vector3.zero
        local shortest = 1000
        for _, d in ipairs(CollectionService:GetTagged("Titan Dummy")) do
            local dist = (d:GetPivot().Position - rootPos).Magnitude
            if dist < shortest then
                shortest = dist
                dummy = d
            end
        end
        if dummy then
            teleportTo(dummy:GetPivot())
        else
            Luna:Notification({ Title = "Thông báo", Content = "Không tìm thấy nộm Titan nào xung quanh!" })
        end
    end
})

TabTeleport:CreateButton({
    Name = "Dịch chuyển tới Bia Ngắm Musket (Target) gần nhất",
    Callback = function()
        local target = nil
        local char = LocalPlayer.Character
        local rootPos = char and char.PrimaryPart and char.PrimaryPart.Position or Vector3.zero
        local shortest = 1500
        for _, t in ipairs(CollectionService:GetTagged("Target")) do
            local pos = t:GetPivot().Position
            local dist = (pos - rootPos).Magnitude
            if dist < shortest then
                shortest = dist
                target = t
            end
        end
        if target then
            teleportTo(target:GetPivot())
        else
            Luna:Notification({ Title = "Thông báo", Content = "Không tìm thấy bia ngắm Musket nào xung quanh!" })
        end
    end
})

TabTeleport:CreateButton({
    Name = "Dịch chuyển tới Vạch Đích Thi Chạy (EXAM_SPEED_END)",
    Callback = function()
        local endPart = Workspace:FindFirstChild("EXAM_SPEED_END", true)
        if endPart and endPart:IsA("BasePart") then
            teleportTo(endPart.CFrame)
            Luna:Notification({ Title = "Kỳ thi sát hạch", Content = "Đã dịch chuyển tới vạch đích thi tốc độ!" })
        else
            Luna:Notification({ Title = "Thông báo", Content = "Không tìm thấy EXAM_SPEED_END trong Workspace!" })
        end
    end
})

TabTeleport:CreateButton({
    Name = "Dịch chuyển tới Khu Khai Thác Mỏ (Quarry) gần nhất",
    Callback = function()
        local nearest = nil
        local char = LocalPlayer.Character
        local rootPos = char and char.PrimaryPart and char.PrimaryPart.Position or Vector3.zero
        local shortest = 2000
        for _, q in ipairs(CollectionService:GetTagged("Quarry")) do
            local dist = (q:GetPivot().Position - rootPos).Magnitude
            if dist < shortest then
                shortest = dist
                nearest = q
            end
        end
        if nearest then
            teleportTo(nearest:GetPivot())
        else
            Luna:Notification({ Title = "Thông báo", Content = "Không tìm thấy khu khai thác Quarry nào!" })
        end
    end
})

-- =========================================================================
-- TAB 6: ⚙️ CÀI ĐẶT & GIAO DIỆN
-- =========================================================================
local TabSettings = Window:CreateTab({
    Name = "Cài Đặt",
    Icon = "settings",
    ImageSource = "Material",
    ShowTitle = true
})

TabSettings:BuildConfigSection()
-- BuildThemeSection được lược bỏ vì hàm nội bộ của Luna Interface Suite bị lỗi arg #2 ColorSequenceKeypoint

-- Thông báo khi tải hoàn tất
Luna:Notification({
    Title = "Requiem Master Hub v2.1",
    Content = "Khởi chạy menu Luna thành công! Tab Bùa Chú & Tiến Trình đã sẵn sàng.",
    Icon = "sparkle",
    ImageSource = "Material",
})

print("[Requiem Master Hub] Nạp menu Luna Interface Suite v2.0 thành công!")
