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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Deadzone
--                               Dumped in 0.00635 seconds
--                          Bytecode version 9  |  59 functions

local u316, u319
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Shake = require(Utilities:WaitForChild("Shake"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Statistics_2 = Common_6:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local u170 = {"rbxassetid://268592485", "rbxassetid://268592462", "rbxassetid://268592427", "rbxassetid://268590007"}
local u175 = {
    "YMIR...",
    "MY SKULLBOUND...",
    "YOUR GRACE...",
    "OUR LADY...",
    "FORSAKEN.",
}
local u185 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local u189 = UDim2.fromOffset(320, 28)
local u190 = {}
local v2 = Color3.fromRGB(0, 0, 0)
local v3 = Color3.fromRGB(255, 25, 25)
u190[1] = v2
u190[2] = v3
u190[3] = Color3.fromRGB(245, 245, 245)
local u206 = {}
v3 = Color3.fromRGB(255, 30, 30)
u206[1] = v3
u206[2] = Color3.fromRGB(20, 190, 255)
local u219 = (function() -- Line: 95
    local v1 = {NumberSequenceKeypoint.new(0, 0.93)}
    local v2 = 8
    local v3 = 1
    for i = 0, v2, v3 do
        table.insert(v1, NumberSequenceKeypoint.new((i + 0.35) / 9, 0.68))
        table.insert(v1, NumberSequenceKeypoint.new((i + 1) / 9, 0.93))
    end
    return NumberSequence.new(v1)
end)()
local function scanlineLayerTransparency(p1, p2) -- Line: 112
    local v1 = p1 * 0.5 + 0.42 + p2 * 0.15
    return (math.clamp(v1, 0, 1))
end
local function heartbeatIntensity(p1) -- Line: 130
    local v1
    local function peak(p1, p2, p3) -- Line: 131
        local v1 = (p1 - p2) / p3
        return (math.exp(-v1 * v1))
    end
    v1 = peak(p1, 0.1, 0.07)
    return v1 + peak(p1, 0.35, 0.09) * 0.72
end
local u226 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
local u230 = UDim2.fromOffset(5, 6)
local u234 = UDim2.fromOffset(520, 96)
local function textTransparency(p1, p2) -- Line: 143
    local v1 = math.max(p1, p2)
    return (math.clamp(v1, 0, 1))
end
local function DeadzoneTitle(p1) -- Line: 155 -- upvalues: react (val), textTransparency (val), u226 (val), u234 (val), u230 (val)
    local v1 = react.joinBindings({p1.textFade, p1.textFlicker}):map(function(p1) -- Line: 156 -- upvalues: textTransparency (upval)
        return textTransparency(p1[1], p1[2])
    end)
    local v2 = p1.textJitter:map(function(p1) -- Line: 160
        return UDim2.fromScale(0.5 + p1.X * 0.018, 0.48 + p1.Y * 0.012)
    end)
    local v3 = p1.flashPhase:map(function(p1) -- Line: 164
        if p1 == 0 then
            return Color3.fromRGB(255, 40, 40)
        end
        return Color3.fromRGB(240, 240, 240)
    end)
    local v4 = {
        Text = "DEADZONE",
        TextScaled = true,
        BackgroundTransparency = 1,
        FontFace = u226,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v2,
        Size = u234,
    }, {Shadow = react.createElement("TextLabel", {
        ZIndex = 1,
        FontFace = v4.FontFace,
        Text = v4.Text,
        TextScaled = v4.TextScaled,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = v1:map(function(p1) -- Line: 194
            return (math.clamp(p1 + 0.08, 0, 1))
        end),
        AnchorPoint = v4.AnchorPoint,
        BackgroundTransparency = v4.BackgroundTransparency,
        Position = UDim2.new(0.5, u230.X.Offset, 0.5, u230.Y.Offset),
        Size = v4.Size,
    }), RedGhost = react.createElement("TextLabel", {
        ZIndex = 2,
        FontFace = v4.FontFace,
        Text = v4.Text,
        TextScaled = v4.TextScaled,
        TextColor3 = Color3.fromRGB(255, 20, 20),
        TextTransparency = react.joinBindings({v1, p1.textFlicker}):map(function(p1) -- Line: 209
            local v1 = p1[1] + 0.22 + p1[2] * 0.15
            return (math.clamp(v1, 0, 1))
        end),
        AnchorPoint = v4.AnchorPoint,
        BackgroundTransparency = v4.BackgroundTransparency,
        Position = p1.textGlitch:map(function(p1) -- Line: 214
            return UDim2.new(0.5, -5 + p1.X, 0.5, 1 + p1.Y)
        end),
        Size = v4.Size,
    }), CyanGhost = react.createElement("TextLabel", {
        ZIndex = 2,
        FontFace = v4.FontFace,
        Text = v4.Text,
        TextScaled = v4.TextScaled,
        TextColor3 = Color3.fromRGB(20, 180, 255),
        TextTransparency = react.joinBindings({v1, p1.textFlicker}):map(function(p1) -- Line: 226
            local v1 = p1[1] + 0.28 + p1[2] * 0.12
            return (math.clamp(v1, 0, 1))
        end),
        AnchorPoint = v4.AnchorPoint,
        BackgroundTransparency = v4.BackgroundTransparency,
        Position = p1.textGlitch:map(function(p1) -- Line: 231
            return UDim2.new(0.5, 5 - p1.X * 0.5, 0.5, -1 - p1.Y * 0.5)
        end),
        Size = v4.Size,
    }), Main = react.createElement("TextLabel", {
        ZIndex = 3,
        FontFace = v4.FontFace,
        Text = v4.Text,
        TextScaled = v4.TextScaled,
        TextColor3 = v3,
        TextTransparency = v1,
        AnchorPoint = v4.AnchorPoint,
        BackgroundTransparency = v4.BackgroundTransparency,
        Position = v4.Position,
        Size = v4.Size,
    })})
end
local function DeadzoneMicroText(p1) -- Line: 260 -- upvalues: react (val), u185 (val), u189 (val)
    local v1 = {p1.textFade, p1.microFlicker}
    local v2 = react.joinBindings(v1):map(function(p1) -- Line: 261
        local v1 = math.max(p1[1], p1[2])
        return (math.clamp(v1, 0, 1))
    end)
    v1 = p1.flashPhase:map(function(p1) -- Line: 265
        if p1 == 0 then
            return Color3.fromRGB(255, 70, 70)
        end
        return Color3.fromRGB(180, 180, 180)
    end)
    return react.createElement("TextLabel", {
        TextScaled = true,
        BackgroundTransparency = 1,
        ZIndex = 10,
        FontFace = u185,
        Text = p1.microText,
        TextColor3 = v1,
        TextTransparency = v2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.58),
        Size = u189,
    })
end
local function createStaticLayers(p1, p2) -- Line: 287 -- upvalues: u170 (val), react (val)
    local v1
    local v2 = {}
    local v3 = u170
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = ("Static%*"):format(i)
        v2[v1] = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 9,
            ref = function(p1) -- Line: 292 -- upvalues: p2 (val), i (val)
                p2.current[i] = p1
                if p1 then
                    local v1 = i == 1
                    p1.Visible = v1
                end
            end,
            Image = j,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = p1:map(function(p1) -- Line: 301
                return p1 * 0.5800000000000001 + 0.42
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        })
    end
    return v2
end
local function createTearBars(p1, p2) -- Line: 316 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 4
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Tear%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            ZIndex = 8,
            ref = function(a1) -- Line: 324 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.1, 0.004),
        })
    end
    v3 = 4
    v4 = 1
    for j = 1, v3, v4 do
        v1 = ("TearGhost%*"):format(j)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 0.45,
            BorderSizePixel = 0,
            ZIndex = 7,
            ref = function(p1) -- Line: 343 -- upvalues: p2 (val), j (val)
                p2.current[j] = p1
                if p1 then
                    p1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 30, 30),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.1, 0.004),
        })
    end
    return v2
end
local u240 = {
    TopLeft = {hAnchor = Vector2.new(0, 0), vAnchor = Vector2.new(0, 0), hPos = UDim2.fromScale(0.04, 0.05), vPos = UDim2.fromScale(0.04, 0.05)},
    TopRight = {hAnchor = Vector2.new(1, 0), vAnchor = Vector2.new(1, 0), hPos = UDim2.fromScale(0.96, 0.05), vPos = UDim2.fromScale(0.96, 0.05)},
    BottomLeft = {hAnchor = Vector2.new(0, 1), vAnchor = Vector2.new(0, 1), hPos = UDim2.fromScale(0.04, 0.95), vPos = UDim2.fromScale(0.04, 0.95)},
    BottomRight = {hAnchor = Vector2.new(1, 1), vAnchor = Vector2.new(1, 1), hPos = UDim2.fromScale(0.96, 0.95), vPos = UDim2.fromScale(0.96, 0.95)},
}
local function createCornerBrackets(p1) -- Line: 399 -- upvalues: u240 (val), react (val)
    local v1
    local v2 = {}
    local v3 = u240
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = ("%*H"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 0.25,
            BorderSizePixel = 0,
            ZIndex = 9,
            ref = function(a1) -- Line: 404 -- upvalues: p1 (val), i (val)
                local v1 = p1.current[i]
                if not v1 then
                    v1 = {}
                end
                p1.current[i] = v1
                p1.current[i].Horizontal = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = j.hAnchor,
            BackgroundColor3 = Color3.fromRGB(255, 40, 40),
            Position = j.hPos,
            Size = UDim2.new(0.09, 0, 0, 3),
        })
        v1 = ("%*V"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 0.25,
            BorderSizePixel = 0,
            ZIndex = 9,
            ref = function(a1) -- Line: 422 -- upvalues: p1 (val), i (val)
                local v1 = p1.current[i]
                if not v1 then
                    v1 = {}
                end
                p1.current[i] = v1
                p1.current[i].Vertical = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = j.vAnchor,
            BackgroundColor3 = Color3.fromRGB(255, 40, 40),
            Position = j.vPos,
            Size = UDim2.new(0, 3, 0.09, 0),
        })
    end
    return v2
end
local function createVerticalSlice(p1, p2) -- Line: 443 -- upvalues: react (val)
    return {VerticalSlice = react.createElement("Frame", {
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        ZIndex = 8,
        ref = function(a1) -- Line: 449 -- upvalues: p1 (val)
            p1.current = a1
            if a1 then
                a1.Visible = false
            end
        end,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.0025, 1.08),
    }), VerticalSliceGhost = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        ZIndex = 7,
        ref = function(p1) -- Line: 466 -- upvalues: p2 (val)
            p2.current = p1
            if p1 then
                p1.Visible = false
            end
        end,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 30, 30),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.0022, 1.08),
    })}
end
local function hideTearBars(p1, p2) -- Line: 484
    local v1 = p1.current[1]
    if v1 then
        v1.Visible = false
    end
    v1 = p1.current[2]
    if v1 then
        v1.Visible = false
    end
    v1 = p1.current[3]
    if v1 then
        v1.Visible = false
    end
    v1 = p1.current[4]
    if v1 then
        v1.Visible = false
    end
    v1 = p2.current[1]
    if v1 then
        v1.Visible = false
    end
    v1 = p2.current[2]
    if v1 then
        v1.Visible = false
    end
    v1 = p2.current[3]
    if v1 then
        v1.Visible = false
    end
    v1 = p2.current[4]
    if v1 then
        v1.Visible = false
    end
end
local function hideCornerBrackets(p1) -- Line: 500
    local current = p1.current
    local v1 = nil
    local v2 = nil
    for i, j in current, v1, v2 do
        if j.Horizontal then
            j.Horizontal.Visible = false
        end
        if j.Vertical then
            j.Vertical.Visible = false
        end
    end
end
local function hideVerticalSlice(p1, p2) -- Line: 512
    if p1.current then
        p1.current.Visible = false
    end
    if p2.current then
        p2.current.Visible = false
    end
end
_, u316 = useBlurEffect()
_, u319 = useFieldOfView()
local function startFovLinger(p1) -- Line: 525 -- upvalues: u319 (val), RunService (val), heartbeatIntensity (val)
    local u1 = 0
    local u2 = false
    local u8 = u319("deadzone_linger", 0, "add", 5)
    local u9 = nil
    local function stop() -- Line: 531 -- upvalues: u2 (ref), u9 (ref), u8 (val)
        if u2 then
            return
        end
        u2 = true
        if u9 then
            u9:Disconnect()
            u9 = nil
        end
        u8(TweenInfo.new(0.35))
    end
    return stop
end
return function() -- Line: 572 -- upvalues: react (val), useMotion (val), Signals (val), hideTearBars (val), hideCornerBrackets (val), hideVerticalSlice (val), u170 (val), Workspace (val), Shake (val), u316 (val), u319 (val), Lighting (val), TweenService (val), Sounds (val), Universal (val), RunService (val), u190 (val), u206 (val), u175 (val), startFovLinger (val), createStaticLayers (val), createTearBars (val), createCornerBrackets (val), createVerticalSlice (val), scanlineLayerTransparency (val), u219 (val), DeadzoneTitle (val), DeadzoneMicroText (val)
    local u102, u106, u110, u114, u118, u4, u46, u51, u56, u61, u66, u71, u76, u8, u81, u86, u9, u90, u94, u98, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    v1, u4 = react.useState(false)
    u8, u9 = react.useState(0)
    local u13 = react.useRef(nil)
    local u17 = react.useRef(nil)
    local v19 = {}
    local u21 = react.useRef(v19)
    local v20 = {}
    local u25 = react.useRef(v20)
    local v21 = {}
    local u29 = react.useRef(v21)
    local v22 = {}
    local u33 = react.useRef(v22)
    local u37 = react.useRef(nil)
    local u41 = react.useRef(nil)
    v2, u46 = react.useBinding(0)
    v3, u51 = react.useBinding(1)
    v4, u56 = react.useBinding(Vector2.zero)
    v5, u61 = react.useBinding(0)
    v6, u66 = react.useBinding(0)
    v7, u71 = react.useBinding(Vector2.zero)
    v8, u76 = react.useBinding(Vector2.zero)
    v9, u81 = react.useBinding("")
    v10, u86 = react.useBinding(1)
    v11, u90 = useMotion(1)
    v12, u94 = useMotion(3.2)
    v13, u98 = useMotion(0)
    v14, u102 = useMotion(1)
    v15, u106 = useMotion(1)
    v16, u110 = useMotion(1)
    v17, u114 = useMotion(1)
    v18, u118 = useMotion(0.6)
    react.useEffect(function() -- Line: 603 -- upvalues: Signals (upval), u13 (val), u17 (val), u9 (val)
        local u5 = Signals.Deadzone:Connect(function(p1) -- Line: 604 -- upvalues: u13 (upval), u17 (upval), u9 (upval)
            if not p1 then
                return
            end
            if u13.current then
                u13.current()
            end
            if u17.current then
                u17.current()
                u17.current = nil
            end
            u9(function(p1) -- Line: 618
                return p1 + 1
            end)
        end)
        return function() -- Line: 623 -- upvalues: u5 (val), u13 (upval), u17 (upval)
            u5:Disconnect()
            if u13.current then
                u13.current()
            end
            if u17.current then
                u17.current()
                u17.current = nil
            end
        end
    end, {})
    react.useEffect(function() -- Line: 637 -- upvalues: u8 (val), u17 (val), u4 (val), u90 (val), u94 (val), u98 (val), u102 (val), u106 (val), u110 (val), u114 (val), u118 (val), u46 (val), u51 (val), u66 (val), u71 (val), u76 (val), u81 (val), u86 (val), u61 (val), u56 (val), hideTearBars (upval), u25 (val), u29 (val), hideCornerBrackets (upval), u33 (val), hideVerticalSlice (upval), u37 (val), u41 (val), u170 (upval), u21 (val), Workspace (upval), Shake (upval), u316 (upval), u319 (upval), Lighting (upval), TweenService (upval), Sounds (upval), Universal (upval), RunService (upval), u190 (upval), u206 (upval), u175 (upval), u13 (val), startFovLinger (upval)
        local v1, v2
        if u8 == 0 then
            return
        end
        if u17.current then
            u17.current()
            u17.current = nil
        end
        u4(true)
        u90:immediate(1)
        u94:immediate(3.4)
        u98:immediate(0)
        u102:immediate(1)
        u106:immediate(0)
        u110:immediate(0)
        u114:immediate(0)
        u118:immediate(0.4)
        u46(1)
        u51(0.05)
        u66(1)
        u71(Vector2.zero)
        u76(Vector2.zero)
        u81("")
        u86(1)
        u61(0)
        u56(Vector2.zero)
        hideTearBars(u25, u29)
        hideCornerBrackets(u33)
        hideVerticalSlice(u37, u41)
        local v3 = #u170
        local v4 = 1
        for i = 1, v3, v4 do
            v1 = u21.current[i]
            if v1 then
                v2 = i == 1
                v1.Visible = v2
            end
        end
        local CurrentCamera = Workspace.CurrentCamera
        local u117 = Shake.new()
        u117.FadeInTime = 0
        u117.FadeOutTime = 0.6
        u117.SustainTime = 0.3
        u117.Frequency = 0.1
        u117.Amplitude = 4
        u117.RotationInfluence = Vector3.new(0.05, 0.05, 0.05)
        u117.PositionInfluence = Vector3.one
        u117:Start()
        u117:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 688 -- upvalues: CurrentCamera (val)
            if CurrentCamera then
                local v1 = CurrentCamera
                local v2 = CFrame.new(p1)
                v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
            end
        end)
        local u151 = u316("deadzone", 42, "set", 10, TweenInfo.new(0.08, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
        local u162 = u319("deadzone", 48, "set", 10, TweenInfo.new(0.08, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "Deadzone"
        ColorCorrectionEffect.Parent = Lighting
        ColorCorrectionEffect.Brightness = 1
        ColorCorrectionEffect.Contrast = 1
        ColorCorrectionEffect.Saturation = -0.8
        ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
        u114:linear(1, {speed = 5.555555555555555})
        u118:spring(1.8, {frequency = 5, damping = 0.4})
        u94:spring(1.45, {frequency = 9, damping = 0.45})
        u90:spring(0.05, {frequency = 10, damping = 0.4})
        u98:spring(1, {frequency = 9, damping = 0.45})
        local v5 = {frequency = 12, damping = 0.35}
        u102:spring(0, v5)
        task.delay(0.08, function() -- Line: 726 -- upvalues: u46 (upval), u51 (upval), TweenService (upval), ColorCorrectionEffect (val)
            u46(0)
            u51(0.2)
            local v1 = TweenInfo.new(0.06)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0.9, Contrast = 0.95, Brightness = -0.05, TintColor = Color3.fromRGB(230, 10, 10)}):Play()
        end)
        Sounds.playGlobalSoundEffect(Universal.Deadzone, 0.05, 3, 50)
        local u224 = false
        local u225 = 0
        local u226 = 0
        local u227 = false
        local u228 = false
        local u229 = false
        local u230 = 0
        local u231 = 1
        local u232 = 0
        local u238 = RunService.RenderStepped:Connect(function(p1) -- Line: 750 -- upvalues: u224 (ref), u225 (ref), u61 (upval), u230 (ref), u232 (ref), u231 (ref), u170 (upval), u21 (upval), u56 (upval), u71 (upval), u228 (ref), u110 (upval), u66 (upval), u76 (upval), u86 (upval), u227 (ref), hideTearBars (upval), u25 (upval), u29 (upval), hideCornerBrackets (upval), u33 (upval), hideVerticalSlice (upval), u37 (upval), u41 (upval), u51 (upval), u46 (upval), u90 (upval), u94 (upval), u98 (upval), u102 (upval), u118 (upval), u114 (upval), u151 (val), u162 (val), TweenService (upval), ColorCorrectionEffect (val), u229 (ref), u106 (upval), u226 (ref), u190 (upval), u206 (upval), u81 (upval), u175 (upval)
            local Horizontal, Vertical, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
            if u224 then
                return
            end
            u225 = u225 + p1
            u61(u225 * 28 % 1)
            u230 = u230 + 1
            if 3 <= u230 then
                u230 = 0
                if 0 >= u232 then
                    u231 = u231 % #u170 + 1
                    if math.random() < 0.22 then
                        u232 = math.random(1, 3)
                    end
                else
                    u232 = u232 - 1
                end
                v2 = #u170
                v6 = 1
                v1 = p1
                for i = 1, v2, v6 do
                    v8 = u21.current[i]
                    if v8 then
                        v9 = i == u231
                        v8.Visible = v9
                    end
                end
            end
            if u225 < 0.35 then
                v2 = (math.random() - 0.5) * 0.035
                u56(Vector2.new(v2, (math.random() - 0.5) * 0.035))
                v8 = math.random() - 0.5
                u71(Vector2.new(v8, math.random() - 0.5))
            elseif u225 >= 2 then
                u56(Vector2.zero)
                u71(Vector2.zero)
            else
                v7 = (math.random() - 0.5) * 0.012
                u56(Vector2.new(v7, (math.random() - 0.5) * 0.012))
                v7 = (math.random() - 0.5) * 0.35
                u71(Vector2.new(v7, (math.random() - 0.5) * 0.25))
            end
            if 1.72 <= u225 and not u228 then
                u228 = true
                u110:immediate(1)
                u66(1)
                u76(Vector2.zero)
                u71(Vector2.zero)
                u86(1)
            end
            if 2 <= u225 and not u227 then
                u227 = true
                hideTearBars(u25, u29)
                hideCornerBrackets(u33)
                hideVerticalSlice(u37, u41)
                u51(1)
                u46(0)
                u90:spring(1, {frequency = 2.5})
                u94:spring(2.4, {frequency = 2.5})
                u98:spring(0, {frequency = 2.5})
                u102:spring(1, {frequency = 2.5})
                u118:spring(0, {frequency = 3})
                u114:linear(1, {speed = 0.6666666666666666})
                u151(TweenInfo.new(1.5))
                u162(TweenInfo.new(1.5))
                v8 = TweenInfo.new(1.5)
                TweenService:Create(ColorCorrectionEffect, v8, {Saturation = 0, Contrast = 0, Brightness = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
            end
            if 2.5 <= u225 and not u229 then
                u229 = true
                u106:linear(1, {speed = 0.6666666666666666})
            end
            if 4 <= u225 or 2 < u225 then
                return
            end
            u226 = u226 + v1
            if u225 < 0.35 then
                v2 = 0.03
            elseif u225 >= 1.72 then
                v2 = 0.06
            else
                v2 = 0.032
            end
            if u226 < v2 then
                return
            end
            u226 = 0
            v6 = 0.4 < math.random()
            if not v6 then
                v8 = 0
            else
                v8 = 1
            end
            u46(v8)
            u51(math.random() * 0.2 + 0.15)
            v7 = 4
            v8 = 1
            for j = 1, v7, v8 do
                v10 = u25.current[j]
                v11 = u29.current[j]
                if v10 then
                    if v11 then
                        v11.Visible = false
                    end
                    if math.random() >= 0.34 then
                        v10.Visible = false
                    else
                        v12 = math.random() * 0.88 + 0.06
                        v13 = 0.5 + (math.random() - 0.5) * 0.1
                        v3 = math.random() * 0.004 + 0.002
                        v4 = u190[math.random(1, #u190)]
                        v10.Visible = true
                        v10.Position = UDim2.fromScale(v13, v12)
                        v10.Size = UDim2.fromScale(1.12, v3)
                        v10.BackgroundColor3 = v4
                        v10.BackgroundTransparency = 0.15 + math.random() * 0.45
                        if v11 and math.random() < 0.28 then
                            v5 = (math.random() - 0.5) * 0.04
                            v11.Visible = true
                            v11.Position = UDim2.fromScale(v13 + v5, v12)
                            v11.Size = UDim2.fromScale(1.12, v3)
                            v11.BackgroundColor3 = u206[math.random(1, #u206)]
                            v11.BackgroundTransparency = 0.35 + math.random() * 0.35
                        end
                    end
                end
            end
            if math.random() >= 0.26 then
                hideVerticalSlice(u37, u41)
            else
                local current = u37.current
                local current_2 = u41.current
                v9 = math.random() * 0.84 + 0.08
                v10 = math.random() * 0.003 + 0.001
                if current then
                    current.Visible = true
                    current.Position = UDim2.fromScale(v9, 0.5)
                    current.Size = UDim2.fromScale(v10, 1.08)
                    current.BackgroundTransparency = 0.08 + math.random() * 0.2
                end
                if current_2 then
                    current_2.Visible = true
                    current_2.Position = UDim2.fromScale(v9 + (math.random() - 0.5) * 0.035, 0.5)
                    current_2.Size = UDim2.fromScale(v10 * 0.85, 1.08)
                    current_2.BackgroundColor3 = u206[math.random(1, #u206)]
                    current_2.BackgroundTransparency = 0.3 + math.random() * 0.25
                end
            end
            v7 = math.random() < 0.2
            if not v6 then
                v8 = Color3.fromRGB(255, 45, 45)
            else
                v8 = Color3.fromRGB(240, 240, 240)
            end
            local current_3 = u33.current
            v10 = nil
            v11 = nil
            for k, n in current_3, v10, v11 do
                Horizontal = n.Horizontal
                Vertical = n.Vertical
                v5 = 0.2 + math.random() * 0.35
                if Horizontal then
                    Horizontal.Visible = v7
                    Horizontal.BackgroundColor3 = v8
                    Horizontal.BackgroundTransparency = v5
                end
                if Vertical then
                    Vertical.Visible = v7
                    Vertical.BackgroundColor3 = v8
                    Vertical.BackgroundTransparency = v5
                end
            end
            if 0.08 <= u225 and u225 < 1.72 then
                v9 = 0.4 < math.random()
                if not v9 then
                    v11 = 1
                else
                    v11 = 0
                end
                u66(v11)
                if not v9 then
                    u76(Vector2.zero)
                else
                    v12 = (math.random() - 0.5) * 14
                    u76(Vector2.new(v12, (math.random() - 0.5) * 4))
                end
                if not v9 then
                    u86(1)
                elseif 0.42 >= math.random() then
                    u86(1)
                else
                    u81(u175[math.random(1, #u175)])
                    u86(0)
                end
            end
            if not ColorCorrectionEffect.Parent then
                return
            end
            if v6 then
                ColorCorrectionEffect.TintColor = Color3.fromRGB(0, 0, 0)
                ColorCorrectionEffect.Brightness = -0.35
                ColorCorrectionEffect.Contrast = 1.1
                ColorCorrectionEffect.Saturation = -0.5
                return
            end
            ColorCorrectionEffect.TintColor = Color3.fromRGB(230, 10, 10)
            ColorCorrectionEffect.Brightness = 0
            ColorCorrectionEffect.Contrast = 1
            ColorCorrectionEffect.Saturation = 1
        end)
        local u239 = nil
        local function cleanup() -- Line: 977 -- upvalues: u224 (ref), u238 (val), u4 (upval), u51 (upval), u46 (upval), u66 (upval), u71 (upval), u76 (upval), u81 (upval), u86 (upval), u61 (upval), u56 (upval), hideTearBars (upval), u25 (upval), u29 (upval), hideCornerBrackets (upval), u33 (upval), hideVerticalSlice (upval), u37 (upval), u41 (upval), u117 (val), u90 (upval), u94 (upval), u98 (upval), u102 (upval), u106 (upval), u110 (upval), u114 (upval), u118 (upval), u151 (val), u162 (val), ColorCorrectionEffect (val), u13 (upval)
            if u224 then
                return
            end
            u224 = true
            u238:Disconnect()
            u4(false)
            u51(1)
            u46(0)
            u66(0)
            u71(Vector2.zero)
            u76(Vector2.zero)
            u81("")
            u86(1)
            u61(0)
            u56(Vector2.zero)
            hideTearBars(u25, u29)
            hideCornerBrackets(u33)
            hideVerticalSlice(u37, u41)
            u117:Destroy()
            u90:immediate(1)
            u94:immediate(2.4)
            u98:immediate(0)
            u102:immediate(1)
            u106:immediate(1)
            u110:immediate(1)
            u114:immediate(1)
            u118:immediate(0)
            u151()
            u162()
            if ColorCorrectionEffect.Parent then
                ColorCorrectionEffect:Destroy()
            end
            u13.current = nil
        end
        local function reset() -- Line: 1021 -- upvalues: u239 (ref), u17 (upval), cleanup (val)
            if u239 then
                pcall(task.cancel, u239)
                u239 = nil
            end
            if u17.current then
                u17.current()
                u17.current = nil
            end
            cleanup()
        end
        u13.current = reset
        return reset
    end, {u8})
    local v23 = {
        ImpactFlash = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 240, 240),
            BackgroundTransparency = v17,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.1, 1.1),
        }),
        Shockwave = react.createElement("ImageLabel", {
            Image = "rbxassetid://17812826389",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(255, 40, 40),
            ImageTransparency = react.joinBindings({v17, v14}):map(function(p1) -- Line: 1061
                local v1 = math.max(p1[1] * 0.5 + 0.05, p1[2])
                return (math.clamp(v1, 0, 1))
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v18:map(function(p1) -- Line: 1069
                return UDim2.fromScale(p1, p1)
            end),
        }),
        Vignette = react.createElement("ImageLabel", {
            Image = "rbxassetid://135589412519765",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 4,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v11,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v12:map(function(p1) -- Line: 1083
                return UDim2.fromScale(p1, p1)
            end),
        }),
        RedVignette = react.createElement("ImageLabel", {
            Image = "rbxassetid://135589412519765",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            ImageColor3 = Color3.fromRGB(140, 0, 0),
            ImageTransparency = v13:map(function(p1) -- Line: 1092
                return 1 - p1 * 0.65
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v12:map(function(p1) -- Line: 1099
                return UDim2.fromScale(p1 * 0.88, p1 * 0.88)
            end),
        }),
        RedFlash = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(200, 0, 0),
            BackgroundTransparency = react.joinBindings({v2, v3, v14}):map(function(p1) -- Line: 1109
                if p1[1] == 1 then
                    return 1
                end
                local v1 = p1[2] + p1[3] * 0.35
                return (math.clamp(v1, 0, 1))
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.05, 1.05),
        }),
        BlackFlash = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 8,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = react.joinBindings({v2, v3, v14}):map(function(p1) -- Line: 1127
                if p1[1] == 0 then
                    return 1
                end
                local v1 = p1[2] + p1[3] * 0.3
                return (math.clamp(v1, 0, 1))
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.05, 1.05),
        }),
    }
    for i, j in createStaticLayers(v15, u21) do
        v23[i] = j
    end
    for k, n in createTearBars(u25, u29) do
        v23[k] = n
    end
    for m, i5 in createCornerBrackets(u33) do
        v23[m] = i5
    end
    for i6, i7 in createVerticalSlice(u37, u41) do
        v23[i6] = i7
    end
    v23.Scanlines = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = react.joinBindings({v14, v17}):map(function(p1) -- Line: 1161 -- upvalues: scanlineLayerTransparency (upval)
            return scanlineLayerTransparency(p1[1], p1[2])
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.05, 1.05),
    }, {Lines = react.createElement("UIGradient", {Rotation = 0, Color = ColorSequence.new(Color3.fromRGB(0, 0, 0)), Offset = v5:map(function(p1) -- Line: 1171
        return Vector2.new(0, p1)
    end), Transparency = u219})})
    v23.Title = react.createElement(DeadzoneTitle, {
        textFade = v16,
        textFlicker = v6,
        textJitter = v7,
        textGlitch = v8,
        flashPhase = v2,
    })
    v23.MicroText = react.createElement(DeadzoneMicroText, {textFade = v16, microText = v9, microFlicker = v10, flashPhase = v2})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4:map(function(p1) -- Line: 1197
            return UDim2.fromScale(0.5 + p1.X, 0.5 + p1.Y)
        end),
        Size = UDim2.fromScale(1, 1),
        Visible = v1,
    }, v23)
end