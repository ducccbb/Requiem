-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--[[
__________                   __               __    __________              .__
\______   \_______  ____    |__| ____   _____/  |_  \______   \ ____ _____  |  |
 |     ___/\_  __ \/  _ \   |  |/ __ \_/ ___\   __\  |       _// __ \\__  \ |  |
 |    |     |  | \(  <_> )  |  \  ___/\  \___|  |    |    |   \  ___/ / __ \|  |__
 |____|     |__|   \____/\__|  |\___  >\___  >__|    |____|_  /\___  >____  /____/
                        \______|    \/     \/               \/     \/     \/
]]
--                           Project Real  |  Luau Decompiler
--                                   Made by @zinvera
--     File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Examination.Nape.Nape
--                               Dumped in 0.00567 seconds
--                          Bytecode version 9  |  46 functions

local u516
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Exam = require(Namespaces:WaitForChild("Exam"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Interactions = script.Parent.Parent.Parent.Parent:WaitForChild("Interactions")
local Types = Interactions:WaitForChild("Types")
local Gear = Types:WaitForChild("Gear")
local Trainer = require(Gear:WaitForChild("Trainer"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Training = require(Sounds_2:WaitForChild("Training"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Screen = Components_2:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Menu = Components_6:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_12:WaitForChild("Common")
local Promise = require(Common_5:WaitForChild("Promise"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives_2 = Components_7:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Utilities_2 = Components_8:WaitForChild("Utilities")
local Scaler = require(Utilities_2:WaitForChild("Scaler"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Utilities_3 = Components_9:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useInterfaceState = require(Hooks_2:WaitForChild("useInterfaceState"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_20:WaitForChild("Common")
local Statistics = Common_6:WaitForChild("Statistics")
_, u516 = require(Statistics:WaitForChild("useWalkSpeed"))()
local u517 = {
    SPEED = {MAX_SCORE = 15, MIN_SCORE = 0, PERFECT_TIME = 34, FAIL_TIME = 60},
    NAPES = {MAX_SCORE = 15, MIN_SCORE = 0, MAX_NAPES = 20},
    MUSKET = {MAX_SCORE = 10, MIN_SCORE = 0, MAX_SHOTS = 5},
}
local v2 = {MAX_SCORE = 10, MIN_SCORE = 0, BASE_OFFSET = 3500, DIVISOR = 3000}
u517.BALANCE = v2
local u522 = {}
local v3 = {"Balance Evaluation", "Balance is detramental to your success with manuevering gear. You will be tested on your ability to use the gear trainer, your score will be based on how long you can stay afloat."}
local v4 = {"Musket Evaluation", "You will be tested on your ability to use the musket, your score will be based on how many targets you can hit."}
u522[1] = {"Nape Evalulation", "You will have one minute and thirty seconds to complete the exam. Your objective will be to get as many titan napes as possible within this timeframe. Good luck!"}
u522[2] = {"Speed Evaluation", "In the fastest time possible, go from the beginning of the path to the end. You will be timed and your score will be based on how quickly you can complete the course."}
u522[3] = v3
u522[4] = v4
local function SpeedExamTimer(p1) -- Line: 112 -- upvalues: react (val), Workspace (val), RunService (val), Players (val), Frame (val)
    local u4, u5
    u4, u5 = react.useBinding(0)
    react.useEffect(function() -- Line: 115 -- upvalues: p1 (val), Workspace (upval), u5 (val), RunService (upval), Players (upval), u4 (val)
        if not p1.Enabled then
            return
        end
        local EXAM_SPEED_END = Workspace:WaitForChild("EXAM_SPEED_END")
        u5(0)
        local u11 = tick()
        local u12 = nil
        u12 = RunService.RenderStepped:Connect(function() -- Line: 127 -- upvalues: u5 (upval), u11 (val), Players (upval), EXAM_SPEED_END (val), p1 (upval), u4 (upval), u12 (ref)
            u5(math.floor((tick() - u11) * 100) / 100)
            local Character = Players.LocalPlayer.Character
            local PrimaryPart = Character
            if PrimaryPart then
                PrimaryPart = Character.PrimaryPart
            end
            if not PrimaryPart or 40 < (PrimaryPart.Position - EXAM_SPEED_END.Position).Magnitude then
                return
            end
            p1.Completed(u4:getValue())
            u12:Disconnect()
        end)
        return function() -- Line: 146 -- upvalues: u12 (ref)
            u12:Disconnect()
        end
    end, {p1.Enabled})
    local v1 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(300, 2),
        Position = UDim2.fromScale(0.5, 0.075),
        Visible = p1.Enabled,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local v2 = {}
    local v3 = {
        BackgroundTransparency = 1,
        Text = "Recorded Time",
        TextSize = 30,
        Size = UDim2.fromScale(1, 1),
        Font = Enum.Font.SourceSansSemibold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, 30)
    v2.Napes = react.createElement("TextLabel", v3)
    v3 = {
        BackgroundTransparency = 1,
        TextSize = 50,
        Size = UDim2.fromScale(1, 1),
        Text = u4:map(function(p1) -- Line: 173
            local v1 = math.floor(p1 / 60)
            local v2 = math.floor(p1 % 60)
            local v3 = math.floor(p1 % 1 * 100)
            return string.format("%02d:%02d:%02d", v1, v2, v3)
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, -30)
    v2.Time = react.createElement("TextLabel", v3)
    return react.createElement(Frame, v1, v2)
end
local function NapeExamCountdown(p1) -- Line: 189 -- upvalues: react (val), Workspace (val), u517 (val), Frame (val)
    local u10, u4, u5, u9
    u4, u5 = react.useBinding(90)
    u9, u10 = react.useBinding(0)
    react.useEffect(function() -- Line: 193 -- upvalues: p1 (val), u5 (val), u10 (val), Workspace (upval), u4 (val), u9 (val), u517 (upval)
        if not p1.Enabled then
            return
        end
        u5(90)
        u10(0)
        workspace:SetAttribute("Napes", 0)
        local AttributeChangedSignal = Workspace:GetAttributeChangedSignal("Napes")
        local u22 = AttributeChangedSignal:Connect(function() -- Line: 207 -- upvalues: u10 (upval), Workspace (upval)
            u10(Workspace:GetAttribute("Napes"))
        end)
        local u25 = coroutine.create(function() -- Line: 211 -- upvalues: u5 (upval), u4 (upval), u9 (upval), u517 (upval), p1 (upval), u22 (val)
            local v1, v2
            while task.wait(1) do
                u5(u4:getValue() - 1)
                v1 = u4:getValue()
                if v1 <= 0 then
                    v2 = u9:getValue()
                    v1 = math.clamp(v2, u517.NAPES.MIN_SCORE, u517.NAPES.MAX_NAPES)
                    p1.Completed(v1 / u517.NAPES.MAX_NAPES * u517.NAPES.MAX_SCORE)
                    u22:Disconnect()
                    return
                end
            end
        end)
        coroutine.resume(u25)
        return function() -- Line: 230 -- upvalues: u25 (val), u22 (val)
            coroutine.close(u25)
            u22:Disconnect()
        end
    end, {p1.Enabled})
    local v1 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(300, 2),
        Position = UDim2.fromScale(0.5, 0.075),
        Visible = p1.Enabled,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local v2 = {}
    local v3 = {
        BackgroundTransparency = 1,
        TextSize = 30,
        Size = UDim2.fromScale(1, 1),
        Text = u9:map(function(p1) -- Line: 247
            return p1 .. " Napes"
        end),
        Font = Enum.Font.SourceSansSemibold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, 30)
    v2.Napes = react.createElement("TextLabel", v3)
    v3 = {
        BackgroundTransparency = 1,
        TextSize = 50,
        Size = UDim2.fromScale(1, 1),
        Text = u4:map(function(p1) -- Line: 259
            local v1 = math.floor(p1 / 60)
            return string.format("%02d:%02d", v1, p1 % 60)
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, -30)
    v2.Time = react.createElement("TextLabel", v3)
    return react.createElement(Frame, v1, v2)
end
local function MusketCountdownTimer(p1) -- Line: 271 -- upvalues: react (val), Exam (val), u516 (val), Workspace (val), u517 (val), Frame (val)
    local u10, u4, u5, u9
    u4, u5 = react.useBinding(75)
    u9, u10 = react.useBinding(0)
    react.useEffect(function() -- Line: 275 -- upvalues: p1 (val), Exam (upval), u5 (val), u516 (upval), Workspace (upval), u10 (val), u4 (val), u9 (val), u517 (upval)
        if not p1.Enabled then
            return
        end
        if not p1.Enabled then
            Exam.GiveMusket.post(1)
        else
            Exam.GiveMusket.post(0)
            u5(75)
        end
        local u22 = u516("musketExamMinigame", 0, "set", 9999)
        Workspace:SetAttribute("Muskets", 0)
        u10(0)
        local AttributeChangedSignal = Workspace:GetAttributeChangedSignal("Muskets")
        local u40 = AttributeChangedSignal:Connect(function() -- Line: 295 -- upvalues: u10 (upval), Workspace (upval)
            u10(Workspace:GetAttribute("Muskets"))
        end)
        local u43 = coroutine.create(function() -- Line: 299 -- upvalues: u5 (upval), u4 (upval), u9 (upval), u517 (upval), p1 (upval), Exam (upval), u40 (val), u22 (val)
            local v1, v2
            while task.wait(1) do
                u5(u4:getValue() - 1)
                v1 = u4:getValue()
                if v1 <= 0 then
                    v2 = u9:getValue()
                    v1 = math.clamp(v2, u517.MUSKET.MIN_SCORE, u517.MUSKET.MAX_SHOTS)
                    p1.Completed(v1 / u517.MUSKET.MAX_SHOTS * u517.MUSKET.MAX_SCORE)
                    Exam.GiveMusket.post(1)
                    u40:Disconnect()
                    u22()
                    return
                end
            end
        end)
        coroutine.resume(u43)
        return function() -- Line: 324 -- upvalues: u43 (val), u40 (val)
            coroutine.close(u43)
            u40:Disconnect()
        end
    end, {p1.Enabled})
    local v1 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(300, 2),
        Position = UDim2.fromScale(0.5, 0.075),
        Visible = p1.Enabled,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local v2 = {}
    local v3 = {
        BackgroundTransparency = 1,
        TextSize = 30,
        Size = UDim2.fromScale(1, 1),
        Text = u9:map(function(p1) -- Line: 341
            return p1 .. " Shots Landed"
        end),
        Font = Enum.Font.SourceSansSemibold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, 30)
    v2.Napes = react.createElement("TextLabel", v3)
    v3 = {
        BackgroundTransparency = 1,
        TextSize = 50,
        Size = UDim2.fromScale(1, 1),
        Text = u4:map(function(p1) -- Line: 353
            local v1 = math.floor(p1 / 60)
            return string.format("%02d:%02d", v1, p1 % 60)
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, -30)
    v2.Time = react.createElement("TextLabel", v3)
    return react.createElement(Frame, v1, v2)
end
local function ExamCountdownTimer(p1) -- Line: 365 -- upvalues: react (val), useMotion (val), useRem (val), Workspace (val), Players (val), useAsyncEffect (val), Promise (val), Frame (val)
    local u13, u5, u9, v1, v2, v3
    v1, u5 = react.useState(4)
    v2, u9 = useMotion(100)
    v3, u13 = useMotion(1)
    local v4 = useRem()
    local u21 = react.useMemo(function() -- Line: 373 -- upvalues: p1 (val), Workspace (upval)
        if p1.Exam == "Musket Evaluation" then
            return (Workspace:WaitForChild("EXAM_MUSKET_SPAWN_POINT"))
        end
        return (Workspace:WaitForChild("EXAM_SPAWN_POINT"))
    end, {p1.Exam})
    react.useEffect(function() -- Line: 381 -- upvalues: Players (upval), p1 (val), u21 (val)
        task.spawn(function() -- Line: 382 -- upvalues: Players (upval), p1 (upval), u21 (upval)
            local v1 = Players.LocalPlayer.Character
            if not v1 then
                v1 = Players.LocalPlayer.CharacterAdded:Wait()
            end
            local v2 = v1
            local PrimaryPart = v2.PrimaryPart
            if not PrimaryPart then
                PrimaryPart = v2:WaitForChild("HumanoidRootPart")
            end
            if not p1.Enabled then
                PrimaryPart.Anchored = false
                return
            end
            PrimaryPart.Anchored = true
            PrimaryPart.CFrame = u21.CFrame
        end)
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 396 -- upvalues: p1 (val), u5 (val), u9 (val), u13 (val), Promise (upval)
        if not p1.Enabled then
            u5(4)
            return
        end
        local function incrementTimer() -- Line: 402 -- upvalues: u5 (upval), u9 (upval), u13 (upval)
            u5(function(p1) -- Line: 403 -- upvalues: u9 (upval), u13 (upval)
                u9:immediate(100)
                u13:immediate(0)
                u9:spring(40, {frequency = 1})
                u13:spring(1, {frequency = 1})
                return p1 - 1
            end)
        end
        local v1 = {}
        local v2 = Promise.delay(1):andThen(incrementTimer)
        local v3 = Promise.delay(2):andThen(incrementTimer)
        local v4 = Promise.delay(3):andThen(incrementTimer)
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        v1[4] = Promise.delay(4):andThen(incrementTimer)
        return Promise.all(v1)
    end, {p1.Enabled})
    local v5 = {BackgroundTransparency = 1}
    local v6 = v4(300)
    v5.Size = UDim2.fromOffset(v6, v4(300))
    return react.createElement(Frame, v5, {Label = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = v1,
        Font = Enum.Font.SourceSansBold,
        TextSize = v2,
        TextTransparency = v3,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })})
end
return function() -- Line: 445 -- upvalues: useRem (val), react (val), Workspace (val), useInterfaceState (val), useMotion (val), Sounds (val), Training (val), useAsyncEffect (val), Promise (val), Exam (val), Players (val), u522 (val), TeleportService (val), Constants (val), Form (val), HeaderBodyComponent (val), Button (val), Trainer (val), u517 (val), Frame (val), NapeExamCountdown (val), MusketCountdownTimer (val), SpeedExamTimer (val), TransparencyGroup (val), DynamicPage (val), Ratio (val), Scaler (val), PageLayout (val), ExamCountdownTimer (val)
    local none, none_2, u21, u22, u48, u480, u481, u484, u485, u488, u512, u513, u514, u515, u517, u518, u520, u521, u6, u7, v1, v2, v3, v4, v5
    local v6 = useRem()
    local v7 = {}
    u6, u7 = react.useMemo(function() -- Line: 448 -- upvalues: Workspace (upval)
        local EXAM_SPAWN_POINT = Workspace:WaitForChild("EXAM_SPAWN_POINT")
        return EXAM_SPAWN_POINT, (Workspace:WaitForChild("Gear Trainer Exam"))
    end, v7)
    none, none_2 = react.useState("none")
    u512, u513 = react.useState({})
    u21, u22 = react.useState({})
    local black = useInterfaceState("black")
    local teleporting = useInterfaceState("teleporting")
    u514, u481 = react.useState(true)
    u515, u480 = react.useState(false)
    v1, u517 = react.useState(false)
    u485, u48 = react.useBinding(false)
    u518, u484 = react.useState(false)
    v2, u488 = useMotion(0)
    u520, u521 = react.useBinding(0)
    react.useEffect(function() -- Line: 469 -- upvalues: Sounds (upval), Training (upval)
        local v1 = Sounds.playGlobalSoundEffect(Training.Music, 5, 0.5)
        v1.Looped = true
    end, {})
    useAsyncEffect(function() -- Line: 474 -- upvalues: u515 (val), Promise (upval), u481 (val), u480 (val), u517 (val), Exam (upval)
        if not u515 then
            return
        end
        return Promise.delay(5):andThen(function() -- Line: 479 -- upvalues: u481 (upval), u480 (upval), u517 (upval), Exam (upval)
            u481(false)
            u480(false)
            u517(true)
            Exam.Gear.unreliablePost(0)
        end)
    end, {u515})
    react.useEffect(function() -- Line: 488 -- upvalues: Players (upval), u514 (val), u6 (val)
        task.spawn(function() -- Line: 489 -- upvalues: Players (upval), u514 (upval), u6 (upval)
            local v1 = Players.LocalPlayer.Character
            if not v1 then
                v1 = Players.LocalPlayer.CharacterAdded:Wait()
            end
            local v2 = v1
            local PrimaryPart = v2.PrimaryPart
            if not PrimaryPart then
                PrimaryPart = v2:WaitForChild("HumanoidRootPart")
            end
            if not u514 then
                PrimaryPart.Anchored = false
                return
            end
            PrimaryPart.Anchored = true
            PrimaryPart.CFrame = u6.CFrame
        end)
    end, {u514})
    react.useEffect(function() -- Line: 503 -- upvalues: u512 (val), u522 (upval), u481 (val), black (val), Promise (upval), teleporting (val), TeleportService (upval), Constants (upval), Players (upval)
        local v1 = #u512
        if v1 == #u522 then
            u481(false)
            black({enabled = true, tween = TweenInfo.new(1)})
            Promise.delay(1):andThen(function() -- Line: 508 -- upvalues: teleporting (upval), black (upval), TeleportService (upval), Constants (upval), Players (upval)
                teleporting(true)
                black({enabled = false, tween = TweenInfo.new(0.5)})
                TeleportService:Teleport(Constants.Places.Lobby, Players.LocalPlayer)
            end)
        end
    end, {u512})
    local v8 = {}
    for k, v in pairs(u522) do
        v3 = {Height = "P_30"}
        v4 = {}
        v5 = not u515
        if v5 then
            v5 = u514
            if v5 then
                v5 = not table.find(u512, v[1])
            end
        end
        v4.Visible = v5
        v4.AnchorPoint = Vector2.new(0.5, 0.5)
        v4.Position = UDim2.fromScale(0.5, 0.5)
        v3.Native = v4
        v8[v[1]] = react.createElement(Form.Form, v3, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = v[1], Body = v[2]})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
            Text = "Begin",
            Clicked = function() -- Line: 544 -- upvalues: v (val), u480 (val), u481 (val), Trainer (upval), u7 (val), Workspace (upval), u517 (upval), u484 (val), u485 (val), Exam (upval), u48 (val), u488 (val), none_2 (val)
                if v[1] == "Balance Evaluation" then
                    u481(false)
                    local Interaction = u7:FindFirstChild("Interaction")
                    Trainer.interacted(Interaction, function() -- Line: 550 -- upvalues: Workspace (upval), u517 (upval), u484 (upval), u485 (upval), Exam (upval), u48 (upval), u488 (upval)
                        local v1 = Workspace:GetAttribute("Balancer") + u517.BALANCE.BASE_OFFSET
                        v1 = math.floor((math.clamp(v1 / u517.BALANCE.DIVISOR, u517.BALANCE.MIN_SCORE, u517.BALANCE.MAX_SCORE)))
                        u484(true)
                        if not (u485:getValue()) then
                            Exam.Balance.post((math.ceil((math.clamp(v1, u517.BALANCE.MIN_SCORE, u517.BALANCE.MAX_SCORE)))))
                        end
                        u48(false)
                        u488:immediate(0)
                        u488:tween(v1, {time = 3, style = Enum.EasingStyle.Sine, direction = Enum.EasingDirection.Out})
                    end)
                else
                    u480(true)
                end
                u48(false)
                none_2(v[1])
            end,
        }), Practice = react.createElement(Button, {
            Text = "Practice",
            Visible = not u21[v[1]],
            Clicked = function() -- Line: 594 -- upvalues: v (val), u480 (val), u481 (val), Trainer (upval), u7 (val), Workspace (upval), u517 (upval), u484 (val), u488 (val), u22 (val), u21 (val), u48 (val), none_2 (val)
                if v[1] == "Balance Evaluation" then
                    u481(false)
                    local Interaction = u7:FindFirstChild("Interaction")
                    Trainer.interacted(Interaction, function() -- Line: 600 -- upvalues: Workspace (upval), u517 (upval), u484 (upval), u488 (upval)
                        local v1 = Workspace:GetAttribute("Balancer") + u517.BALANCE.BASE_OFFSET
                        v1 = math.floor((math.clamp(v1 / u517.BALANCE.DIVISOR, u517.BALANCE.MIN_SCORE, u517.BALANCE.MAX_SCORE)))
                        u484(true)
                        u488:immediate(0)
                        u488:tween(v1, {time = 3, style = Enum.EasingStyle.Sine, direction = Enum.EasingDirection.Out})
                    end)
                else
                    u480(true)
                end
                u22((table.clone(u21)))
                u21[v[1]] = true
                u22(u21)
                u48(true)
                none_2(v[1])
            end,
        })})})
    end
    local v9 = {}
    local v10 = {}
    v3 = v1
    if v3 then
        v3 = not u518
        if v3 then
            v3 = none == "Nape Evalulation"
        end
    end
    v10.Enabled = v3
    function v10.Completed(p1) -- Line: 637 -- upvalues: u485 (val), Exam (upval), u517 (upval), u484 (val), u488 (val)
        if not (u485:getValue()) then
            Exam.Napes.post((math.ceil((math.clamp(p1, u517.NAPES.MIN_SCORE, u517.NAPES.MAX_SCORE)))))
        end
        u484(true)
        u488:immediate(0)
        u488:tween(p1, {time = 3, style = Enum.EasingStyle.Sine, direction = Enum.EasingDirection.Out})
    end
    v9.NapeTimer = react.createElement(NapeExamCountdown, v10)
    v10 = {}
    v3 = v1
    if v3 then
        v3 = not u518
        if v3 then
            v3 = none == "Musket Evaluation"
        end
    end
    v10.Enabled = v3
    function v10.Completed(p1) -- Line: 657 -- upvalues: u485 (val), Exam (upval), u517 (upval), u484 (val), u488 (val)
        if not (u485:getValue()) then
            Exam.Musket.post((math.ceil((math.clamp(p1, u517.MUSKET.MIN_SCORE, u517.MUSKET.MAX_SCORE)))))
        end
        u484(true)
        u488:immediate(0)
        u488:tween(p1, {time = 3, style = Enum.EasingStyle.Sine, direction = Enum.EasingDirection.Out})
    end
    v9.MusketTimer = react.createElement(MusketCountdownTimer, v10)
    v10 = {}
    v3 = v1
    if v3 then
        v3 = not u518
        if v3 then
            v3 = none == "Speed Evaluation"
        end
    end
    v10.Enabled = v3
    function v10.Completed(p1) -- Line: 677 -- upvalues: u517 (upval), u485 (val), Exam (upval), u484 (val), u488 (val)
        local v1 = math.clamp(u517.SPEED.MAX_SCORE * ((u517.SPEED.FAIL_TIME - p1) / (u517.SPEED.FAIL_TIME - u517.SPEED.PERFECT_TIME)), u517.SPEED.MIN_SCORE, u517.SPEED.MAX_SCORE)
        if not (u485:getValue()) then
            Exam.Speed.post((math.ceil((math.clamp(v1, u517.SPEED.MIN_SCORE, u517.SPEED.MAX_SCORE)))))
        end
        u484(true)
        u488:immediate(0)
        u488:tween(v1, {time = 3, style = Enum.EasingStyle.Sine, direction = Enum.EasingDirection.Out})
    end
    v9.SpeedTimer = react.createElement(SpeedExamTimer, v10)
    local createElement = react.createElement
    local v11 = {BackgroundTransparency = 1}
    v3 = v6(300)
    v11.Size = UDim2.fromOffset(v3, v6(300))
    v11.Visible = u518
    v10 = {Label = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 100,
        Size = UDim2.fromScale(1, 1),
        Text = v2:map(function(p1) -- Line: 710 -- upvalues: u518 (val), u520 (val), Sounds (upval), Training (upval), u521 (val)
            if not u518 then
                return 0
            end
            local v1 = math.floor(p1)
            if v1 == u520:getValue() then
                return u520:getValue()
            end
            local u19 = Sounds.playGlobalSoundEffect(Training.Hit, 0.05)
            u19.Pitch = p1 / 30 + 1
            task.delay(3, function() -- Line: 723 -- upvalues: u19 (val)
                u19:Destroy()
            end)
            u521(v1)
            return v1
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })}
    v5 = {BackgroundTransparency = 1, Text = "Points Scored", TextSize = 30, Size = UDim2.fromScale(1, 1)}
    local v12 = UDim2.fromScale(0.5, 0.5)
    v5.Position = v12 + UDim2.fromOffset(0, 60)
    v5.Font = Enum.Font.SourceSansSemibold
    v5.TextColor3 = Color3.fromRGB(255, 255, 255)
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.Bottom = react.createElement("TextLabel", v5)
    v5 = {
        Enabled = u518,
        Tween = TweenInfo.new(0.5),
        Delays = {Enabled = 4},
    }
    local v13 = {}
    local v14 = {
        Text = "Return to Tasks",
        Clicked = function() -- Line: 755 -- upvalues: u485 (val), u512 (val), none (val), u513 (val), none_2 (val), u480 (val), u517 (val), u484 (val), u481 (val)
            if not (u485:getValue()) then
                table.insert(u512, none)
                u513(table.clone(u512))
            end
            none_2("none")
            u480(false)
            u517(false)
            u484(false)
            u481(true)
        end,
    }
    local v15 = {AnchorPoint = Vector2.new(0.5, 0.5)}
    local v16 = UDim2.fromScale(0.5, 0.5)
    v15.Position = v16 + UDim2.fromOffset(0, 120)
    v14.Native = v15
    v13.Return = react.createElement(Button, v14)
    v10.Transparency = react.createElement(TransparencyGroup, v5, v13)
    v9[1] = (createElement(Frame, v11, v10))
    v9.Page = react.createElement(DynamicPage, {Enabled = u514 or u518})
    v10 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v3 = {Ratio = react.createElement(Ratio, {Ratio = 1.241})}
    v12 = {Layout = react.createElement(PageLayout)}
    v15 = {Size = UDim2.fromScale(1, 1)}
    local v17 = {}
    local v18 = {}
    local v19 = u515
    if v19 then
        v19 = u514
        if v19 then
            v19 = not u518
        end
    end
    v18.Enabled = v19
    v18.Exam = none
    v17.Countdown = react.createElement(ExamCountdownTimer, v18)
    v17.List = react.createElement(Frame, {}, {Layout = react.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, v6(20)),
    })}, v8)
    v12.Content = react.createElement(Frame, v15, v17)
    v3.Scaler = react.createElement(Scaler, {
        Enabled = u514 or u518,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, v12)
    v9.Content = react.createElement("Frame", v10, v3)
    return react.createElement(Frame, {}, v9)
end