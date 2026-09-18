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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Health
--                               Dumped in 0.00481 seconds
--                          Bytecode version 9  |  40 functions

local u462
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Quotes = require(Utilities_2:WaitForChild("Quotes"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useKeyPress = require(Hooks_2:WaitForChild("useKeyPress"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics_2 = Common_8:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics_3 = Common_9:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_3:WaitForChild("useWalkSpeed"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_11:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_12:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_4 = Common_10:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_14:WaitForChild("Common")
local Sounds_2 = Common_11:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_15:WaitForChild("Common")
local Animations = Common_12:WaitForChild("Animations")
local Injured = require(Animations:WaitForChild("Injured"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_16:WaitForChild("Common")
local Observers = Common_13:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
ColorCorrectionEffect.Name = "Damage"
ColorCorrectionEffect.Parent = Lighting
local u455 = Sounds.createSoundFromId(Universal.Heartbeat)
u455.Parent = Workspace
u455.Looped = true
local u459 = Sounds.createSoundFromId(Universal.Death)
u455.Parent = Workspace
_, u462 = useBlurEffect()
local u463 = nil
local u464 = nil
return function(p1) -- Line: 88 -- upvalues: useKeyPress (val), react (val), useMotion (val), Quotes (val), useStore (val), Vitality (val), Server (val), useAsyncEffect (val), Signals (val), Sounds (val), Universal (val), Promise (val), u463 (ref), ColorCorrectionEffect (val), TweenService (val), u464 (ref), ClientStateHandler (val), u462 (val), UserInputService (val), u459 (val), u455 (val), ClientAttributesHandler (val), Players (val), useFieldOfView (val), useWalkSpeed (val), useAnimatorObserver (val), Injured (val), Number (val), Frame (val), TransparencyGroup (val), Button (val), TeleportService (val)
    local u12, u16, u20, u24, u28, u32, u36, u37, u42, u69, u7, u70, u8, v1, v2, v3, v4, v5, v6, v7
    local u3 = useKeyPress(Enum.KeyCode.J)
    u7, u8 = react.useState(0)
    v5, u12 = useMotion(0)
    v6, u16 = useMotion(1)
    v7, u20 = useMotion(1)
    v1, u24 = useMotion(1)
    v2, u28 = useMotion(1)
    v3, u32 = useMotion(1)
    u36, u37 = react.useState(false)
    v4, u42 = react.useState(false)
    local v8 = react.useState(Quotes.Death[math.random(1, #Quotes.Death)])
    local u59 = useStore(Vitality.Store, function(p1) -- Line: 108
        return p1
    end)
    local u64 = useStore(Server.Store, function(p1) -- Line: 112
        return p1
    end)
    u69, u70 = react.useState(u59.health or 100)
    useAsyncEffect(function() -- Line: 118 -- upvalues: u59 (val), u69 (val), Signals (upval), u70 (val), u16 (val), Sounds (upval), Universal (upval), Promise (upval)
        if u59.health >= u69 then
            u70(u59.health)
            return
        end
        Signals.OnHealthChanged:Fire(u59.health, u69)
        u70(u59.health)
        u16:spring(0.2, {frequency = 0.15})
        Sounds.playGlobalSoundEffect(Universal.ImpactHeartbeat, 0.1, 1, 10)
        return Promise.delay(0.3):andThen(function() -- Line: 132 -- upvalues: u16 (upval)
            u16:spring(1)
        end)
    end, {u59.health})
    local u81 = react.useCallback(function() -- Line: 142 -- upvalues: u42 (val), u463 (upval), u20 (val), u24 (val), u28 (val), ColorCorrectionEffect (upval), TweenService (upval), u32 (val)
        u42(false)
        if u463 then
            u463()
            u463 = nil
        end
        u20:immediate(1)
        u24:immediate(1)
        u28:immediate(1)
        if ColorCorrectionEffect then
            ColorCorrectionEffect.Saturation = 1
            ColorCorrectionEffect.Brightness = 1
            local v1 = TweenInfo.new(2)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0}):Play()
        end
        u32:spring(1, {frequency = 1.3})
    end, {u36})
    useAsyncEffect(function() -- Line: 169 -- upvalues: u36 (val), Promise (upval), Vitality (upval), u81 (val)
        if u36 then
            return Promise.delay(2):andThen(function() -- Line: 171 -- upvalues: Vitality (upval)
                Vitality.Respawn.post(1)
            end)
        end
        u81()
    end, {u36})
    useAsyncEffect(function() -- Line: 181 -- upvalues: u464 (upval), u59 (val), ClientStateHandler (upval), u20 (val), u463 (upval), u462 (upval), TweenService (upval), ColorCorrectionEffect (upval), Sounds (upval), Universal (upval), u64 (val), Promise (upval), u42 (val), u24 (val), u28 (val), UserInputService (upval), u37 (val), u32 (val), u81 (val)
        local u37
        if u464 then
            u464:Disconnect()
        end
        if u59.dead ~= 1 then
            u37 = u37
            u37(false)
            u42(false)
            u81()
            return
        end
        ClientStateHandler.resetStates()
        u20:spring(0, {frequency = 4})
        u463 = u462("death", 60, "set", 6, TweenInfo.new(3))
        local v1 = TweenInfo.new(3)
        local v2 = {Saturation = -1}
        TweenService:Create(ColorCorrectionEffect, v1, v2):Play()
        u37 = false
        Sounds.playGlobalSoundEffect(Universal.Death, 1, 0.75)
        if u64.event == 1 then
            return Promise.all({Promise.delay(3.5):andThen(function() -- Line: 208 -- upvalues: u42 (upval)
                u42(true)
            end)})
        end
        local v3 = {}
        v1 = Promise.delay(3):andThen(function() -- Line: 215 -- upvalues: u24 (upval), u28 (upval)
            u24:immediate(1)
            u24:linear(0, {speed = 0.1})
            u28:spring(0, {frequency = 4})
        end)
        v2 = Promise.delay(3.5):andThen(function() -- Line: 226 -- upvalues: u464 (upval), UserInputService (upval), u37 (upval), u32 (upval), u37 (ref)
            u464 = UserInputService.InputBegan:Connect(function(p1) -- Line: 227 -- upvalues: u37 (upval), u32 (upval), u37 (upval), u464 (upval)
                local v1 = if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Keyboard else true
                if not v1 then
                    return
                end
                u37(true)
                u32:spring(0, {frequency = 1.3})
                u37 = true
                u464:Disconnect()
            end)
        end)
        v3[1] = v1
        v3[2] = v2
        v3[3] = Promise.delay(13):andThen(function() -- Line: 246 -- upvalues: u464 (upval), u37 (ref), u37 (upval)
            if u464 then
                u464:Disconnect()
            end
            if u37 then
                return
            end
            u37(true)
        end)
        return Promise.all(v3)
    end, {u59.dead})
    react.useEffect(function() -- Line: 270 -- upvalues: u59 (val), TweenService (upval), ColorCorrectionEffect (upval), u12 (val), u459 (upval), u455 (upval)
        if u59.dead then
            return
        end
        local v1 = math.clamp((25 - u59.health) / 25, 0, 1)
        local v2 = TweenInfo.new(2)
        TweenService:Create(ColorCorrectionEffect, v2, {Brightness = 0.1, Saturation = v1 * -0.3}):Play()
        v2 = {frequency = 3}
        u12:spring(1 - v1, v2)
        if u59.health == 0 then
            u459:Play()
            v2 = TweenInfo.new(2)
            TweenService:Create(u455, v2, {Volume = 0}):Play()
            task.delay(2, function() -- Line: 295 -- upvalues: u455 (upval)
                u455:Stop()
            end)
        elseif u59.health < 25 and not u455.IsPlaying then
            u455:Play()
        end
        v2 = TweenInfo.new(2)
        TweenService:Create(u455, v2, {Volume = v1 * 0.6}):Play()
    end, {u59.health, u59.dead})
    react.useEffect(function() -- Line: 307 -- upvalues: ClientAttributesHandler (upval), u3 (val), u7 (val), Players (upval), u8 (val), useFieldOfView (upval), useWalkSpeed (upval), useAnimatorObserver (upval), Injured (upval), u59 (val), TweenService (upval), Promise (upval), Signals (upval), Number (upval)
        local v1
        local u5 = ClientAttributesHandler.getAttribute("HasInAHurry") == 1
        if not u5 then
            v1 = 2.5
        else
            v1 = 2
        end
        if not u3 then
            return
        else
            local v2 = tick() - u7
            if 3.5 >= v2 then
                return
            else
                local Character = Players.LocalPlayer.Character
                if not Character then
                    local u49, u64, v3, v4
                    u8(tick())
                    _, v3 = useFieldOfView()
                    _, v4 = useWalkSpeed()
                    if not u5 then
                        u49 = v3("health_check", -10, "subtract", 2, TweenInfo.new(v1))
                        if ClientAttributesHandler.getAttribute("HasFieldAssessment") ~= 1 then
                            u64 = v4("health_check", 3, "set", 10, TweenInfo.new(0.3))
                        else
                            function u64() end
                        end
                    else
                        function u49() end
                        function u64() end
                    end
                    useAnimatorObserver.play(Injured.Check, 0.2)
                    local function createLimbHighlights() -- Line: 343 -- upvalues: Players (upval), u59 (upval), TweenService (upval)
                        local v1, v2
                        local Character = Players.LocalPlayer.Character
                        if not Character then
                            return
                        end
                        local limbs = u59.limbs
                        local v3 = nil
                        local v4 = nil
                        for i, j in limbs, v3, v4 do
                            v1 = Character:FindFirstChild(j.name)
                            if j then
                                v2 = math.clamp(j.health / 100, 0, 1)
                                local Highlight = Instance.new("Highlight")
                                Highlight.Parent = v1
                                Highlight.Adornee = v1
                                Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                                Highlight.FillTransparency = v2
                                Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
                                Highlight.OutlineTransparency = 1
                                task.delay(0.3, function() -- Line: 366 -- upvalues: TweenService (upval), Highlight (val)
                                    local v1 = TweenInfo.new(1)
                                    TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
                                    task.delay(1, function() -- Line: 371 -- upvalues: Highlight (upval)
                                        Highlight:Destroy()
                                    end)
                                end)
                            end
                        end
                    end
                    local v5 = Promise.delay(v1):andThen(function() -- Line: 379 -- upvalues: u5 (val), u49 (ref), u64 (ref), createLimbHighlights (val), u59 (upval), Signals (upval), ClientAttributesHandler (upval), Number (upval), Promise (upval)
                        local v1
                        if not u5 then
                            u49(0.3, function(p1) -- Line: 381
                                local v1 = math.pow(p1 - 1, 3) * 7 + 1
                                return v1 + math.pow(p1 - 1, 2) * 6
                            end)
                            u64(TweenInfo.new(0.2))
                        end
                        createLimbHighlights()
                        local u132 = u59.limbs[1]
                        local limbs = u59.limbs
                        v1 = nil
                        local v2 = nil
                        for i, j in limbs, v1, v2 do
                            if j.health < u132.health then
                                u132 = j
                            end
                        end
                        if u132.health < 90 then
                            task.delay(0.2, function() -- Line: 399 -- upvalues: Signals (upval), u132 (ref)
                                Signals.Monologue:Fire("However, there are underlying problems with my " .. u132.name .. ".")
                            end)
                        end
                        local v3 = ClientAttributesHandler.getAttribute("HasDetailedHealthChecking") == 1
                        v1 = ClientAttributesHandler.getAttribute("HasExactHealthChecking") == 1
                        if v1 then
                            v2 = "I currently feel " .. Number.NumberToText((math.floor(u59.health / u59.maxHealth * 100))) .. " percent healthy."
                        elseif not v3 then
                            local v4
                            if u59.health == u59.maxHealth then
                                v4 = "I currently feel perfectly healthy."
                            elseif 90 < u59.health then
                                v4 = "I currently feel nearly perfect."
                            elseif 70 < u59.health then
                                v4 = "I currently feel quite decent."
                            elseif 50 < u59.health then
                                v4 = "My current injures are beginning to hurt."
                            elseif 30 < u59.health then
                                v4 = "At this rate I will perish."
                            elseif 10 >= u59.health then
                                v4 = "I currently feel terrible."
                            else
                                v4 = "I am currently near the end."
                            end
                            v2 = v4
                        else
                            local v5 = math.floor((u59.health / u59.maxHealth * 100 + 5) / 10) * 10
                            local v6 = math.clamp(v5, 0, 100)
                            if 100 <= v6 then
                                v2 = "I currently feel almost perfectly healthy."
                            elseif v6 > 0 then
                                v2 = "I currently feel around " .. Number.NumberToText(v6) .. " percent healthy."
                            else
                                v2 = "I currently feel terrible."
                            end
                        end
                        Signals.Monologue:Fire(v2)
                        return Promise.delay(0.2)
                    end)
                    v5:finally(function() end)
                    return
                elseif Character:FindFirstChildOfClass("Tool") then
                    return
                end
            end
        end
    end, {u3, u59})
    local v9 = {Respawn = react.createElement("Frame", {
        ZIndex = 100,
        BackgroundTransparency = v3,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }), PermDeath = react.createElement(TransparencyGroup, {ZIndex = 100, Enabled = v4, Tween = TweenInfo.new(3)}, {Background = react.createElement("Frame", {
        BackgroundTransparency = 0,
        ZIndex = 100,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }), View = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        ImageTransparency = 0.85,
        BackgroundTransparency = 0,
        ZIndex = 101,
        ImageColor3 = Color3.fromRGB(82, 134, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 2),
    }), Body = react.createElement(TransparencyGroup, {
        ZIndex = 102,
        Enabled = v4,
        Tween = TweenInfo.new(2, Enum.EasingStyle.Linear),
        Delays = {Enabled = 3},
    }, {Header = react.createElement("TextLabel", {
        Text = "You have died.",
        TextSize = 50,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(196, 196, 196),
        Size = UDim2.fromScale(1, 0.05),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 1),
    }), Body = react.createElement("TextLabel", {
        TextSize = 20,
        BackgroundTransparency = 1,
        TextTransparency = 0.5,
        Font = Enum.Font.SourceSans,
        Text = v8,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0.015),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 0),
    }), Stats = react.createElement(TransparencyGroup, {
        ZIndex = 2,
        Enabled = v4,
        Tween = TweenInfo.new(2, Enum.EasingStyle.Linear),
        Delays = {Enabled = 5},
    }, {Button = react.createElement(Button, {
        Text = "Return to Lobby",
        Color = Color3.fromRGB(24, 59, 136),
        Native = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.55)},
        Clicked = function() -- Line: 538 -- upvalues: TeleportService (upval), Players (upval)
            TeleportService:Teleport(18126170981, Players.LocalPlayer)
        end,
    })})})})}
    local v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 95,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v7:map(function(p1) -- Line: 555 -- upvalues: u59 (val)
            if not u59.dead then
                return false
            end
            local v1 = p1 < 1
            return v1
        end),
    }
    local v11 = {
        View = react.createElement("ImageLabel", {
            Image = "rbxassetid://6891912132",
            ZIndex = 0,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v7:map(function(p1) -- Line: 566
                return 0.5 + 0.5 * p1
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v7:map(function(p1) -- Line: 572
                return 0.5 + 0.5 * p1
            end),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }),
        Skull = react.createElement("ImageLabel", {
            Image = "rbxassetid://17811425099",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(14, 14, 16),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(30, 31, 35),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v7:map(function(p1) -- Line: 591
                local v1 = UDim2.fromScale(0.5, 0.5)
                return v1 + UDim2.fromScale(0, p1 * 0.1)
            end),
            Size = v7:map(function(p1) -- Line: 596
                local v1 = UDim2.fromScale(0.35, 0.35)
                return v1 - UDim2.fromScale(p1 * 0.1, p1 * 0.1)
            end),
            ImageTransparency = v7:map(function(p1) -- Line: 601
                return 0 + 1 * p1
            end),
        }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}),
        Continue = react.createElement("TextLabel", {
            Text = "Press any key to continue...",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(163, 163, 163),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.725),
            Size = UDim2.new(0.5, 0, -0.0207, 50),
            TextTransparency = v2:map(function(p1) -- Line: 627
                return 0 + 1 * p1
            end),
        }, {uIAspectRatioConstraint1 = react.createElement("UIAspectRatioConstraint", {AspectRatio = 34.3})}),
        Bar = react.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(14, 14, 16),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.691),
            Size = UDim2.fromScale(0.294, 0.00345),
            BackgroundTransparency = v2:map(function(p1) -- Line: 644
                return 0 + 1 * p1
            end),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Fill = react.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(130, 130, 156),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.5),
            Size = v1:map(function(p1) -- Line: 659
                return UDim2.fromScale(p1, 1)
            end),
            BackgroundTransparency = v2:map(function(p1) -- Line: 662
                return 0 + 1 * p1
            end),
        }, {uICorner1 = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}), Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 131})}),
        Glow = react.createElement("ImageLabel", {
            Image = "rbxassetid://17812826389",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ImageColor3 = Color3.fromRGB(137, 142, 173),
            ImageTransparency = v7:map(function(p1) -- Line: 680
                return 0.8 + 0.19999999999999996 * p1
            end),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.199, 0.0484),
            Size = UDim2.fromOffset(1073, 1073),
        }),
    }
    v9.Death = react.createElement("Frame", v10, v11)
    v10 = {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.7, 1.7),
    }
    v11 = u59.health < 25
    v10.Visible = v11
    v9.Vignette = react.createElement("ImageLabel", v10)
    v10 = {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(98, 12, 12),
        ImageTransparency = v5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.6, 1.6),
    }
    v11 = u59.health < 25
    v10.Visible = v11
    v9.Blood = react.createElement("ImageLabel", v10)
    v9.Damaged = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(98, 12, 12),
        ImageTransparency = v6,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.4, 1.4),
    })
    return react.createElement(Frame, {}, v9)
end