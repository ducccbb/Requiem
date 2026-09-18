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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Objective
--                               Dumped in 0.00176 seconds
--                          Bytecode version 9  |  25 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Ripple = require(Utilities:WaitForChild("Ripple"))
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
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local stiff = Ripple.config.spring.stiff
local gentle = Ripple.config.spring.gentle
return function() -- Line: 41 -- upvalues: react (val), useMotion (val), Sounds (val), Universal (val), gentle (val), stiff (val), Signals (val)
    local u21, u25, u29, u33, u4, u9, v1, v2, v3, v4, v5, v6
    v1, u4 = react.useState(false)
    v4, u9 = react.useState("")
    local u13 = react.useRef(false)
    local u17 = react.useRef(0)
    v5, u21 = useMotion(0)
    v6, u25 = useMotion(0)
    v2, u29 = useMotion(0)
    v3, u33 = useMotion(0)
    react.useEffect(function() -- Line: 52 -- upvalues: u21 (val), u25 (val), u29 (val), u33 (val), u17 (val), Sounds (upval), Universal (upval), gentle (upval), u13 (val), u4 (val), stiff (upval), Signals (upval), u9 (val)
        local function resetMotions() -- Line: 53 -- upvalues: u21 (upval), u25 (upval), u29 (upval), u33 (upval)
            u21:immediate(0)
            u25:immediate(0)
            u29:immediate(0)
            u33:immediate(0)
        end
        local function playIntro(p1) -- Line: 60 -- upvalues: u17 (upval), u33 (upval), Sounds (upval), Universal (upval), gentle (upval), resetMotions (val), u13 (upval), u4 (upval), u21 (upval), stiff (upval), u25 (upval), u29 (upval)
            local u3 = u17.current + 1
            u17.current = u3
            if p1 then
                u33:immediate(0)
                Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 0.35, 2)
                task.delay(0.42, function() -- Line: 68 -- upvalues: u17 (upval), u3 (val), u33 (upval), gentle (upval)
                    if u17.current ~= u3 then
                        return
                    end
                    u33:spring(1, gentle)
                end)
                return
            end
            resetMotions()
            u13.current = true
            u4(true)
            task.delay(0, function() -- Line: 83 -- upvalues: u17 (upval), u3 (val), Sounds (upval), Universal (upval), u21 (upval), stiff (upval)
                if u17.current ~= u3 then
                    return
                end
                Sounds.playGlobalSoundEffect(Universal.WoodBlockRattle, 0.1, 0.45, 2)
                u21:spring(1, stiff)
            end)
            task.delay(0.12, function() -- Line: 92 -- upvalues: u17 (upval), u3 (val), Sounds (upval), Universal (upval), u25 (upval), gentle (upval)
                if u17.current ~= u3 then
                    return
                end
                Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 0.5, 2, nil, 3)
                u25:spring(1, gentle)
            end)
            task.delay(0.28, function() -- Line: 101 -- upvalues: u17 (upval), u3 (val), u29 (upval), gentle (upval)
                if u17.current ~= u3 then
                    return
                end
                u29:spring(1, gentle)
            end)
            task.delay(0.42, function() -- Line: 109 -- upvalues: u17 (upval), u3 (val), u33 (upval), gentle (upval)
                if u17.current ~= u3 then
                    return
                end
                u33:spring(1, gentle)
            end)
        end
        local function playOutro() -- Line: 118 -- upvalues: u17 (upval), Sounds (upval), Universal (upval), u33 (upval), stiff (upval), u29 (upval), u25 (upval), u21 (upval), resetMotions (val), u13 (upval), u4 (upval)
            local u2 = u17.current + 1
            u17.current = u2
            Sounds.playGlobalSoundEffect(Universal.WoodBlockRattle, 0.1, 0.35, 2)
            task.delay(0, function() -- Line: 124 -- upvalues: u17 (upval), u2 (val), u33 (upval), stiff (upval)
                if u17.current ~= u2 then
                    return
                end
                u33:spring(0, stiff)
            end)
            task.delay(0.08, function() -- Line: 132 -- upvalues: u17 (upval), u2 (val), u29 (upval), stiff (upval)
                if u17.current ~= u2 then
                    return
                end
                u29:spring(0, stiff)
            end)
            task.delay(0.16, function() -- Line: 140 -- upvalues: u17 (upval), u2 (val), Sounds (upval), Universal (upval), u25 (upval), stiff (upval)
                if u17.current ~= u2 then
                    return
                end
                Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 0.3, 2, nil, 3)
                u25:spring(0, stiff)
            end)
            task.delay(0.28, function() -- Line: 149 -- upvalues: u17 (upval), u2 (val), u21 (upval), stiff (upval)
                if u17.current ~= u2 then
                    return
                end
                u21:spring(0, stiff)
            end)
            task.delay(0.58, function() -- Line: 157 -- upvalues: u17 (upval), u2 (val), resetMotions (upval), u13 (upval), u4 (upval)
                if u17.current ~= u2 then
                    return
                end
                resetMotions()
                u13.current = false
                u4(false)
            end)
        end
        local u8 = Signals.Objective:Connect(function(p1, p2) -- Line: 168 -- upvalues: u9 (upval), playIntro (val), u13 (upval), playOutro (val)
            if p1 ~= "set" then
                if p1 == "clear" then
                    if not u13.current then
                        return
                    end
                    playOutro()
                    return
                end
                return
            end
            if type(p2) ~= "string" or p2 == "" then
                return
            end
            u9(p2)
            playIntro(u13.current)
        end)
        return function() -- Line: 185 -- upvalues: u17 (upval), u8 (val)
            local v1 = u17
            v1.current = v1.current + 1
            u8:Disconnect()
        end
    end, {u21, u25, u29, u33})
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(15, 170),
        Size = UDim2.fromOffset(436, 74),
        Visible = v1,
    }
    local v8 = {}
    local v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = v6:map(function(p1) -- Line: 207
            return UDim2.fromScale(p1 * 0.821, 1)
        end),
    }
    local v10 = {}
    local v11 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = v6:map(function(p1) -- Line: 220
            if p1 <= 0 then
                return UDim2.fromScale(1, 1)
            end
            return UDim2.fromScale(1 / p1, 1)
        end),
    }
    local v12 = {}
    local v13 = {}
    local v14 = {}
    local v15 = NumberSequenceKeypoint.new(0, 0)
    local v16 = NumberSequenceKeypoint.new(0.371, 0.0409)
    local v17 = NumberSequenceKeypoint.new(0.518, 0.0975)
    local v18 = NumberSequenceKeypoint.new(0.707, 0.248)
    local v19 = NumberSequenceKeypoint.new(0.811, 0.387)
    local v20 = NumberSequenceKeypoint.new(0.904, 0.616)
    local v21 = NumberSequenceKeypoint.new(0.958, 0.755)
    v14[1] = v15
    v14[2] = v16
    v14[3] = v17
    v14[4] = v18
    v14[5] = v19
    v14[6] = v20
    v14[7] = v21
    v14[8] = NumberSequenceKeypoint.new(1, 1)
    v13.Transparency = NumberSequence.new(v14)
    v12.UIGradient = react.createElement("UIGradient", v13)
    v12.Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 1.03e-07),
        Size = UDim2.fromScale(1, 1),
    }, {Header = react.createElement("TextLabel", {
        Text = "Objective",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        TextColor3 = Color3.fromRGB(255, 223, 169),
        TextTransparency = v2:map(function(p1) -- Line: 257
            return (1 - p1) * 0.7 + 0.3
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2:map(function(p1) -- Line: 267
            return UDim2.fromScale(0.48, (1 - p1) * 0.06 + 0.323)
        end),
        Size = UDim2.fromScale(0.863, 0.256),
    }), Label = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        Text = v4,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v3:map(function(p1) -- Line: 279
            return 1 - p1
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v3:map(function(p1) -- Line: 289
            return UDim2.fromScale(0.455, (1 - p1) * 0.1 + 0.666)
        end),
        Size = UDim2.fromScale(0.814, 0.268),
    })})
    v10.Body = react.createElement("Frame", v11, v12)
    v8.BodyClip = react.createElement("Frame", v9, v10)
    v8.Sidebar = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = v5:map(function(p1) -- Line: 304
            return UDim2.new(0, 3, p1, 0)
        end),
    })
    return react.createElement("Frame", v7, v8)
end