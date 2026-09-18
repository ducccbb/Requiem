--[[
    ================================================================================
    AUTO-AIMLABS & PUNCHING BAG AUTO-FARM SCRIPT (REQUIEM)
    ================================================================================
    Mục đích: 
    1. Tự động tương tác với Bao Cát (Punching Bag) liên tục để AFK cày chỉ số / EXP.
    2. Tự động giải quyết và hoàn thành mini-game Aimlabs Reflex (Legit hoặc Instant).
    ================================================================================
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- =========================================================================
-- CẤU HÌNH SCRIPT (CONFIG)
-- =========================================================================
local CONFIG = {
    -- Chế độ hoàn thành Aimlabs:
    -- "Legit"   : Click chuột nhanh và chuẩn xác vào các vòng tròn (mượt mà, đầy đủ âm thanh, an toàn).
    -- "Instant" : Hoàn thành ngay tức khắc (0.001s) qua State Callback.
    AimlabsMode = "Legit",

    -- Độ trễ click ở chế độ Legit (giây)
    ClickDelay = 0.03,

    -- Tự động tương tác lặp lại với Bao Cát (Auto-Farm Punching Bag)
    AutoPunchingBag = true,

    -- Khoảng cách tối đa để tìm bao cát gần nhất (studs)
    MaxInteractDistance = 30,

    -- Thời gian nghỉ giữa 2 lần đấm bao cát (giây)
    FarmLoopDelay = 0.8,

    -- In log ra Output console
    PrintLogs = true,
}

local function log(...)
    if CONFIG.PrintLogs then
        print("[Requiem Auto]", ...)
    end
end

-- =========================================================================
-- KHỞI TẠO CÁC MODULE LIÊN QUAN TRONG GAME
-- =========================================================================
local StateModule = nil
local PunchingBagModule = nil

pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Utilities = Common:WaitForChild("Utilities")
    StateModule = require(Utilities:WaitForChild("State"))
end)

pcall(function()
    local Client = ReplicatedStorage:WaitForChild("Client")
    local Interfaces = Client:WaitForChild("Interfaces")
    local Routes = Interfaces:WaitForChild("Routes")
    local Interactions = Routes:WaitForChild("Interactions")
    local Types = Interactions:WaitForChild("Types")
    local Other = Types:WaitForChild("Other")
    PunchingBagModule = require(Other:WaitForChild("Punching Bag"))
end)

-- =========================================================================
-- PHẦN 1: GIẢI QUYẾT MINI-GAME AIMLABS (AUTO-CLICK / INSTANT)
-- =========================================================================
local isAimlabsActive = false
local clickedCircleIds = {}

-- 1A. Chế độ Instant Win qua State Manager
local function setupInstantAimlabs()
    if not StateModule then
        return false
    end

    local setAimlabsState, _, subscribeAimlabs = StateModule("aimlabs")
    subscribeAimlabs(function(state)
        if typeof(state) == "table" and state.visible == true and typeof(state.success) == "function" then
            isAimlabsActive = true
            log("🎯 Aimlabs mở -> Kích hoạt Instant Win...")
            task.wait(0.05)
            
            local successCallback = state.success
            setAimlabsState({
                visible = false,
                success = function() end,
                fail = function() end,
            })
            
            successCallback()
            isAimlabsActive = false
            log("✅ Hoàn thành Aimlabs (Instant)!")
        else
            isAimlabsActive = false
        end
    end)
    return true
end

-- 1B. Chế độ Legit Auto-Clicker qua giao diện UI
local function clickButton(button)
    if not button or not button:IsDescendantOf(game) then
        return
    end

    if typeof(firesignal) == "function" then
        pcall(function()
            firesignal(button.Activated)
        end)
        return
    end

    local absPos = button.AbsolutePosition
    local absSize = button.AbsoluteSize
    local centerX = absPos.X + absSize.X / 2
    local centerY = absPos.Y + absSize.Y / 2

    VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
    task.wait(0.01)
    VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
end

local function scanAndClickAimlabsCircles()
    local aimlabsGui = PlayerGui:FindFirstChild("Aimlabs") or PlayerGui:FindFirstChild("App")
    if not aimlabsGui then
        for _, gui in ipairs(PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui:FindFirstChild("Circle_1", true) then
                aimlabsGui = gui
                break
            end
        end
    end

    if not aimlabsGui then
        table.clear(clickedCircleIds)
        isAimlabsActive = false
        return
    end

    local foundAnyCircle = false
    for _, desc in ipairs(aimlabsGui:GetDescendants()) do
        if desc:IsA("Frame") and string.sub(desc.Name, 1, 7) == "Circle_" then
            foundAnyCircle = true
            isAimlabsActive = true
            local circleId = desc.Name
            if not clickedCircleIds[circleId] then
                local clickBtn = desc:FindFirstChild("ClickButton")
                if clickBtn and clickBtn:IsA("TextButton") then
                    clickedCircleIds[circleId] = true
                    task.spawn(function()
                        if CONFIG.ClickDelay > 0 then
                            task.wait(CONFIG.ClickDelay)
                        end
                        clickButton(clickBtn)
                    end)
                end
            end
        end
    end

    if not foundAnyCircle then
        table.clear(clickedCircleIds)
    end
end

-- =========================================================================
-- PHẦN 2: TỰ ĐỘNG TƯƠNG TÁC VỚI BAO CÁT (PUNCHING BAG AUTO-FARM)
-- =========================================================================
local function findNearestPunchingBag()
    local character = LocalPlayer.Character
    if not character or not character.PrimaryPart then
        return nil
    end

    local rootPos = character.PrimaryPart.Position
    local nearestBag = nil
    local shortestDist = CONFIG.MaxInteractDistance

    -- Cách 1: Tìm qua CollectionService Tag "Interaction"
    for _, part in ipairs(CollectionService:GetTagged("Interaction")) do
        if part:IsA("BasePart") and part:GetAttribute("Type") == "Punching Bag" then
            local dist = (part.Position - rootPos).Magnitude
            if dist < shortestDist then
                shortestDist = dist
                nearestBag = part
            end
        end
    end

    -- Cách 2: Tìm quét trong Workspace nếu tag chưa load
    if not nearestBag then
        for _, desc in ipairs(Workspace:GetDescendants()) do
            if desc:IsA("BasePart") and (desc:GetAttribute("Type") == "Punching Bag" or desc.Name == "Punching Bag" or desc.Name == "PunchingBag") then
                local dist = (desc.Position - rootPos).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    nearestBag = desc
                end
            end
        end
    end

    return nearestBag, shortestDist
end

local function interactWithPunchingBag(bagPart)
    if not bagPart then
        return false
    end

    -- Phương thức A: Sử dụng trực tiếp module tương tác Punching Bag của game
    if PunchingBagModule and typeof(PunchingBagModule.interacted) == "function" then
        log("🥊 Đang tương tác với Bao Cát:", bagPart:GetFullName())
        task.spawn(function()
            PunchingBagModule.interacted(bagPart)
        end)
        return true
    end

    -- Phương thức B: Mô phỏng phím tương tác "Interact" (mặc định 'E')
    log("🥊 Đang kích hoạt tương tác (phím E)...")
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    return true
end

-- =========================================================================
-- VÒNG LẶP AUTO-FARM CHÍNH
-- =========================================================================
local function startPunchingBagFarmLoop()
    task.spawn(function()
        log("🚀 Vòng lặp Auto-Farm Bao Cát đã bắt đầu!")
        
        while CONFIG.AutoPunchingBag do
            task.wait(0.2)

            -- Nếu mini-game Aimlabs đang mở, đợi nó hoàn thành trước
            if isAimlabsActive then
                task.wait(0.5)
                continue
            end

            -- Kiểm tra nhân vật còn sống không
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
            if not humanoid or humanoid.Health <= 0 then
                task.wait(1)
                continue
            end

            -- Tìm bao cát gần nhất
            local nearestBag, dist = findNearestPunchingBag()
            if nearestBag then
                log(string.format("Tìm thấy bao cát cách %.1f studs. Bắt đầu đấm...", dist))
                interactWithPunchingBag(nearestBag)

                -- Đợi Aimlabs xuất hiện và hoàn thành
                local timeout = tick() + 6
                while tick() < timeout do
                    task.wait(0.2)
                    if isAimlabsActive then
                        -- Chờ cho đến khi Aimlabs kết thúc
                        while isAimlabsActive do
                            task.wait(0.1)
                        end
                        break
                    end
                end

                -- Thời gian nghỉ giữa các hiệp đấm
                task.wait(CONFIG.FarmLoopDelay)
            else
                -- Không tìm thấy bao cát trong bán kính
                task.wait(2)
            end
        end
    end)
end

-- =========================================================================
-- KHỞI ĐỘNG HỆ THỐNG
-- =========================================================================
if CONFIG.AimlabsMode == "Instant" then
    local ok = setupInstantAimlabs()
    if not ok then
        CONFIG.AimlabsMode = "Legit"
    end
end

if CONFIG.AimlabsMode == "Legit" then
    RunService.RenderStepped:Connect(function()
        scanAndClickAimlabsCircles()
    end)
    log("Đã bật chế độ Legit Auto-Clicker cho Aimlabs!")
end

if CONFIG.AutoPunchingBag then
    startPunchingBagFarmLoop()
end

log("✅ SCRIPT AUTO-FARM BAO CÁT & AIMLABS ĐÃ SẴN SÀNG!")
