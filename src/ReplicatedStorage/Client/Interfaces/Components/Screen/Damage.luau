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
--          File: ReplicatedStorage.Client.Interfaces.Components.Screen.Damage
--                               Dumped in 0.00381 seconds
--                          Bytecode version 9  |  38 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Gear = require(Sounds_2:WaitForChild("Gear"))
local u163 = Color3.fromRGB(255, 255, 255)
local u168 = Color3.fromRGB(87, 96, 255)
local u173 = Color3.fromRGB(255, 255, 255)
local function IndicatorVersionOne(p1) -- Line: 47 -- upvalues: useMotion (val), react (val), useAsyncEffect (val), Promise (val), u168 (val), u163 (val), u173 (val)
    local u12, u16, u4, u8, v1, v2, v3, v4
    v1, u4 = useMotion(0)
    v2, u8 = useMotion(1)
    v3, u12 = useMotion(0)
    v4, u16 = useMotion(1)
    react.useEffect(function() -- Line: 55 -- upvalues: u4 (val), u16 (val)
        u4:spring(1, {damping = 2, frequency = 0.1})
        u16:spring(0, {damping = 2, frequency = 0.1})
    end, {})
    useAsyncEffect(function() -- Line: 67 -- upvalues: Promise (upval), u8 (val), u12 (val)
        local v1 = {}
        local v2 = Promise.delay(0.01):andThen(function() -- Line: 69 -- upvalues: u8 (upval)
            u8:spring(0, {damping = 2})
        end)
        local v3 = Promise.delay(0.2):andThen(function() -- Line: 75 -- upvalues: u12 (upval)
            u12:spring(0, {frequency = 0.1, damping = 1})
        end)
        v1[1] = v2
        v1[2] = v3
        v1[3] = Promise.delay(2):andThen(function() -- Line: 82 -- upvalues: u8 (upval), u12 (upval)
            u8:linear(1, {speed = 5})
            u12:linear(1, {speed = 5})
        end)
        return Promise.all(v1)
    end, {p1.amount})
    local createElement = react.createElement
    local v5 = {BackgroundTransparency = 1, Size = v4:map(function(p1) -- Line: 95
        local v1 = UDim2.fromOffset(200, 200)
        return v1 + UDim2.fromOffset(p1 * 50, p1 * 50)
    end), Position = UDim2.fromScale(0.1, 0.8), AnchorPoint = Vector2.new(0, 0.5)}
    local v6 = {}
    local createElement_2 = react.createElement
    local v7 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2.4, 1.2),
        GroupTransparency = v3:map(function(p1) -- Line: 107
            return p1
        end),
    }
    local v8 = {Gradient = react.createElement("UIGradient", {Transparency = v1:map(function(p1) -- Line: 112
        local v1 = {}
        local v2 = NumberSequenceKeypoint.new(0, 0)
        local v3 = math.clamp(p1 - 0.01, 0.01, 0.98)
        local v4 = NumberSequenceKeypoint.new(v3, 0)
        local v5 = math.clamp(p1, 0.02, 0.99)
        v3 = NumberSequenceKeypoint.new(v5, 1)
        v1[1] = v2
        v1[2] = v4
        v1[3] = v3
        v1[4] = NumberSequenceKeypoint.new(1, 1)
        return NumberSequence.new(v1)
    end)})}
    local v9 = {
        Image = "rbxassetid://111442469293891",
        BackgroundTransparency = 1,
        ZIndex = -1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(106, 7, 7),
        ImageTransparency = v2:map(function(p1) -- Line: 127
            return p1
        end),
    }
    local v10 = {}
    v8.Blood = react.createElement("ImageLabel", v9, v10)
    local createElement_3 = react.createElement
    v9 = {TextSize = 45, BackgroundTransparency = 1, Text = p1.label, FontFace = Font.new("rbxasset://fonts/families/GrenzeGotisch.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)}
    if not p1.critical then
        v10 = u163
    else
        v10 = u168
    end
    v9.TextColor3 = v10
    v9.Size = UDim2.fromScale(1, 0.5)
    v9.AnchorPoint = Vector2.new(0.5, 0.5)
    v9.Position = UDim2.fromScale(0.7, 0.4)
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextYAlignment = Enum.TextYAlignment.Center
    v10 = {Stroke = react.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)})}
    v8.Header = createElement_3("TextLabel", v9, v10)
    local createElement_4 = react.createElement
    v9 = {TextSize = 30, BackgroundTransparency = 1, Text = tostring(p1.amount) .. " Damage Dealt", FontFace = Font.new("rbxasset://fonts/families/RomanAntique.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)}
    if not p1.critical then
        v10 = u163
    else
        v10 = u173
        if not v10 then
            v10 = u163
        end
    end
    v9.TextColor3 = v10
    v9.Size = UDim2.fromScale(1, 0.5)
    v9.AnchorPoint = Vector2.new(0.5, 0.5)
    v9.Position = UDim2.fromScale(0.7, 0.55)
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextYAlignment = Enum.TextYAlignment.Center
    v8.Body = createElement_4("TextLabel", v9, {Stroke = react.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0), Transparency = v3:map(function(p1) -- Line: 179
        return p1
    end)})})
    v6.Container = createElement_2("CanvasGroup", v7, v8)
    return createElement("Frame", v5, v6)
end
local function IndicatorVersionTwo(p1) -- Line: 188 -- upvalues: useMotion (val), react (val), useAsyncEffect (val), Promise (val), u168 (val), u163 (val), u173 (val)
    local u4, u8, v1, v2, v3
    v1, u4 = useMotion(0)
    v3, u8 = useMotion(-1)
    local v4 = react.useMemo(function() -- Line: 192
        local v1
        if 0.5 >= math.random() then
            v1 = -1
        else
            v1 = 1
        end
        local v2 = UDim2.new(0.5, 0, 0.5, 0)
        local v3 = math.random(10, 30) / 100 * v1
        local v4 = v2 + UDim2.fromScale(v3, math.random(-30, 30) / 100)
        return v4, math.random(-20, 20)
    end, {})
    react.useEffect(function() -- Line: 202 -- upvalues: u4 (val)
        u4:spring(1, {damping = 1, speed = 10})
    end, {})
    useAsyncEffect(function() -- Line: 209 -- upvalues: Promise (upval), u8 (val), u4 (val)
        local v1 = {}
        local v2 = Promise.delay(0.05):andThen(function() -- Line: 211 -- upvalues: u8 (upval)
            u8:spring(0, {damping = 1, speed = 10})
        end)
        v1[1] = v2
        v1[2] = Promise.delay(1):andThen(function() -- Line: 217 -- upvalues: u4 (upval)
            u4:linear(0, {speed = 10})
        end)
        return Promise.all(v1)
    end, {p1.amount})
    local createElement = react.createElement
    local v5 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(200, 200), Position = v4, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v6 = {}
    local v7 = {
        BorderSizePixel = 0,
        Size = v1:map(function(p1) -- Line: 232
            return UDim2.fromOffset(p1 * 500, 1)
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v8 = {}
    local v9 = {}
    local v10 = {}
    local v11 = NumberSequenceKeypoint.new(0, 1)
    local v12 = NumberSequenceKeypoint.new(0.5, 0)
    v10[1] = v11
    v10[2] = v12
    v10[3] = NumberSequenceKeypoint.new(1, 1)
    v9.Transparency = NumberSequence.new(v10)
    v8.Gradient = react.createElement("UIGradient", v9)
    v6.Line = react.createElement("Frame", v7, v8)
    local createElement_2 = react.createElement
    v7 = {
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 0.2),
    }
    v8 = {}
    local createElement_3 = react.createElement
    v9 = {TextSize = 28, BackgroundTransparency = 1, Text = p1.label, FontFace = Font.new("rbxasset://fonts/families/RomanAntique.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)}
    if not p1.critical then
        v2 = u163
    else
        v2 = u168
    end
    v9.TextColor3 = v2
    v9.Size = UDim2.fromScale(1, 0.5)
    v9.AnchorPoint = Vector2.new(0.5, 0)
    v9.Position = v3:map(function(p1) -- Line: 270
        return UDim2.fromScale(0.5, -p1)
    end)
    v9.TextXAlignment = Enum.TextXAlignment.Center
    v9.TextYAlignment = Enum.TextYAlignment.Center
    v9.TextTransparency = v1:map(function(p1) -- Line: 275
        return 1 - p1
    end)
    v2 = {Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(0, 0, 0), Transparency = v1:map(function(p1) -- Line: 282
        return 1 - p1
    end)})}
    v8.Header = createElement_3("TextLabel", v9, v2)
    v6.Top = createElement_2("Frame", v7, v8)
    local createElement_4 = react.createElement
    v7 = {
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 0.2),
    }
    v8 = {}
    local createElement_5 = react.createElement
    v9 = {TextSize = 17, BackgroundTransparency = 1, Text = tostring(p1.amount) .. " Damage Dealt", FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)}
    if not p1.critical then
        v2 = u163
    else
        v2 = u173
        if not v2 then
            v2 = u163
        end
    end
    v9.TextColor3 = v2
    v9.Size = UDim2.fromScale(1, 0.1)
    v9.AnchorPoint = Vector2.new(0.5, 1)
    v9.Position = v3:map(function(p1) -- Line: 308
        return UDim2.fromScale(0.5, p1 + 0.7)
    end)
    v9.TextXAlignment = Enum.TextXAlignment.Center
    v9.TextYAlignment = Enum.TextYAlignment.Center
    v9.TextTransparency = v1:map(function(p1) -- Line: 313
        return 1 - p1
    end)
    v8.Header = createElement_5("TextLabel", v9, {Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(0, 0, 0), Transparency = v1:map(function(p1) -- Line: 320
        return 1 - p1
    end)})})
    v6.Bottom = createElement_4("Frame", v7, v8)
    return createElement("Frame", v5, v6)
end
local function IndicatorVersionThree(p1) -- Line: 329 -- upvalues: useMotion (val), react (val), useAsyncEffect (val), Promise (val), u168 (val), u163 (val), u173 (val)
    local u4, u8, v1, v2, v3
    v1, u4 = useMotion(1)
    v3, u8 = useMotion(0)
    react.useEffect(function() -- Line: 333 -- upvalues: u4 (val)
        u4:spring(0, {damping = 1, speed = 10})
    end, {})
    useAsyncEffect(function() -- Line: 340 -- upvalues: Promise (upval), u8 (val)
        return Promise.delay(1.5):andThen(function() -- Line: 341 -- upvalues: u8 (upval)
            u8:spring(1, {damping = 1, frequency = 0.7})
        end)
    end, {})
    local createElement = react.createElement
    local v4 = {ClipsDescendants = true, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v5 = UDim2.fromScale(0.5, 0.675)
    v4.Position = v5 + UDim2.fromOffset(0, p1.offset * -50 + 50)
    v4.Size = UDim2.fromOffset(500, 200)
    local v6 = {}
    local createElement_2 = react.createElement
    local v7 = {TextSize = 28, BackgroundTransparency = 1, Text = p1.label, FontFace = Font.new("rbxasset://fonts/families/GrenzeGotisch.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)}
    if not p1.critical then
        v2 = u163
    else
        v2 = u168
    end
    v7.TextColor3 = v2
    v7.Size = UDim2.fromScale(1, 0.5)
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.Position = v1:map(function(p1) -- Line: 369
        return UDim2.fromScale(1 - (0.5 - p1), 0.45)
    end)
    v7.TextTransparency = v3
    v7.TextXAlignment = Enum.TextXAlignment.Center
    v7.TextYAlignment = Enum.TextYAlignment.Center
    v2 = {Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(0, 0, 0), Transparency = v3})}
    v6.Header = createElement_2("TextLabel", v7, v2)
    local createElement_3 = react.createElement
    v7 = {TextSize = 17, BackgroundTransparency = 1, Text = tostring(p1.amount) .. " Damage Dealt", FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)}
    if not p1.critical then
        v2 = u163
    else
        v2 = u173
        if not v2 then
            v2 = u163
        end
    end
    v7.TextColor3 = v2
    v7.Size = UDim2.fromScale(1, 0.1)
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.Position = v1:map(function(p1) -- Line: 394
        return UDim2.fromScale(0.5 - p1, 0.6)
    end)
    v7.TextTransparency = v3
    v7.TextXAlignment = Enum.TextXAlignment.Center
    v7.TextYAlignment = Enum.TextYAlignment.Center
    v6.Body = createElement_3("TextLabel", v7, {Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(0, 0, 0), Transparency = v3})})
    return createElement("Frame", v4, v6)
end
return function() -- Line: 410 -- upvalues: react (val), Signals (val), Players (val), TweenService (val), Sounds (val), Gear (val), Lighting (val), ClientSettingsHandler (val), IndicatorVersionThree (val), IndicatorVersionOne (val), IndicatorVersionTwo (val)
    local u3, u4, v1, v2, v3
    u3, u4 = react.useState({})
    local v4 = {u3}
    react.useEffect(function() -- Line: 413 -- upvalues: Signals (upval), u3 (val), Players (upval), TweenService (upval), Sounds (upval), Gear (upval), Lighting (upval), u4 (val)
        local u5 = Signals.Damage:Connect(function(p1, p2, p3) -- Line: 414 -- upvalues: u3 (upval), Players (upval), TweenService (upval), Sounds (upval), Gear (upval), Lighting (upval), u4 (upval)
            local v1, v2
            local v3 = table.clone(u3)
            for k, v in pairs(v3) do
                v2 = tick() - v.created
                if 3 < v2 then
                    v3[k] = nil
                end
            end
            if p3 then
                local Character = Players.LocalPlayer.Character
                if Character then
                    local Highlight = Instance.new("Highlight")
                    Highlight.FillTransparency = 1
                    Highlight.OutlineTransparency = 1
                    Highlight.FillColor = Color3.fromRGB(40, 79, 220)
                    Highlight.Adornee = Character
                    Highlight.Parent = Character
                    v2 = TweenInfo.new(0.1)
                    TweenService:Create(Highlight, v2, {FillTransparency = 0.3}):Play()
                    task.delay(0.5, function() -- Line: 438 -- upvalues: TweenService (upval), Highlight (val)
                        local v1 = TweenInfo.new(0.3)
                        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
                    end)
                end
                Sounds.playGlobalSoundEffect(Gear.TitanCritical, 0.05, 0.6, 5, NumberRange.new(0.9, 1.2))
                Sounds.playGlobalSoundEffect(Gear.TitanCritical2, 0.05, 1.15, 10, NumberRange.new(0.9, 1.1))
                local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
                ColorCorrectionEffect.Parent = Lighting
                v2 = TweenInfo.new(0.05)
                TweenService:Create(ColorCorrectionEffect, v2, {Saturation = 0.5, Brightness = 0.15, Contrast = 0.3}):Play()
                task.delay(0.05, function() -- Line: 457 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
                    local v1 = TweenInfo.new(0.3)
                    TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0, Contrast = 0}):Play()
                    task.delay(0.2, function() -- Line: 464 -- upvalues: ColorCorrectionEffect (upval)
                        ColorCorrectionEffect:Destroy()
                    end)
                end)
            end
            local v4 = math.random(0, 1000000)
            local offset = 0
            for k2, i in pairs(v3) do
                v1 = tick() - i.created
                if v1 < 3 and offset < i.offset then
                    offset = i.offset
                end
            end
            v3[v4] = {
                label = p1,
                amount = p2,
                created = tick(),
                offset = offset + 1,
                critical = p3,
            }
            u4(v3)
        end)
        return function() -- Line: 490 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, v4)
    local v5 = {}
    for k, v in pairs(u3) do
        v2 = ClientSettingsHandler.getSettingFromName("Kill Indicator")
        if v2 == 1 then
            v3 = IndicatorVersionThree
        elseif v2 ~= 2 then
            v3 = IndicatorVersionTwo
        else
            v3 = IndicatorVersionOne
        end
        v1 = tostring(k)
        v5[v1] = react.createElement(v3, {label = v.label, amount = v.amount, offset = v.offset, critical = v.critical})
    end
    return react.createElement(react.Fragment, {}, v5)
end