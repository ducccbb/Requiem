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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Location
--                               Dumped in 0.00125 seconds
--                          Bytecode version 9  |  7 functions

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
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u92 = Color3.fromRGB(255, 255, 255)
local u97 = Color3.fromRGB(238, 240, 248)
local u102 = Color3.fromRGB(255, 255, 255)
return function(p1) -- Line: 33 -- upvalues: useMotion (val), react (val), Sounds (val), Universal (val), u92 (val), u102 (val), u97 (val)
    local u16, u25, u7, v1, v2, v3
    v1, u7 = useMotion(UDim2.fromOffset(0, 3))
    v2, u16 = useMotion(UDim2.new(0.5, 0, 1, 44))
    v3, u25 = useMotion(UDim2.new(0.5, 0, 0, -24))
    react.useEffect(function() -- Line: 38 -- upvalues: p1 (val), Sounds (upval), Universal (upval), u7 (val), u16 (val), u25 (val)
        if not p1.Visible then
            return
        end
        Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 0.6, 2, nil, 3)
        local u15 = task.delay(0.05, function() -- Line: 45 -- upvalues: u7 (upval)
            local v1 = UDim2.fromOffset(380, 3)
            u7:tween(v1, {time = 0.55})
        end)
        local u19 = task.delay(0.18, function() -- Line: 49 -- upvalues: u16 (upval), u25 (upval)
            u16:spring(UDim2.new(0.5, 0, 1, 0))
            u25:spring(UDim2.new(0.5, 0, 0, 0))
        end)
        local u23 = task.delay(4.5, function() -- Line: 54 -- upvalues: u16 (upval), u25 (upval), u7 (upval)
            local v1 = UDim2.new(0.5, 0, 1, 44)
            u16:tween(v1, {time = 0.35})
            v1 = UDim2.new(0.5, 0, 0, -24)
            u25:tween(v1, {time = 0.35})
            v1 = UDim2.fromOffset(0, 3)
            u7:tween(v1, {time = 0.4})
        end)
        return function() -- Line: 60 -- upvalues: u7 (upval), u16 (upval), u25 (upval), u15 (val), u19 (val), u23 (val)
            u7:immediate(UDim2.fromOffset(0, 3))
            u16:immediate(UDim2.new(0.5, 0, 1, 44))
            u25:immediate(UDim2.new(0.5, 0, 0, -24))
            pcall(task.cancel, u15)
            pcall(task.cancel, u19)
            pcall(task.cancel, u23)
        end
    end, {p1.Visible, p1.Header, p1.Body})
    local v4 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.09),
        Size = UDim2.fromOffset(560, 79),
        AnchorPoint = Vector2.new(0.5, 0),
        Visible = p1.Visible,
    }
    local v5 = {HeaderClip = react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = true, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(560, 44)}, {Header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        Text = string.upper(p1.Header),
        TextColor3 = u92,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = v2,
        Size = UDim2.fromOffset(560, 44),
    })})}
    local v6 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = u102,
        Position = UDim2.fromOffset(280, 44),
        Size = v1,
    }
    local v7 = {}
    local v8 = {Rotation = 90}
    local v9 = {}
    local v10 = NumberSequenceKeypoint.new(0, 1)
    local v11 = NumberSequenceKeypoint.new(0.5, 0.12)
    v9[1] = v10
    v9[2] = v11
    v9[3] = NumberSequenceKeypoint.new(1, 1)
    v8.Transparency = NumberSequence.new(v9)
    v7.Gradient = react.createElement("UIGradient", v8)
    v5.Bar = react.createElement("Frame", v6, v7)
    v5.BodyClip = react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = true, Position = UDim2.fromOffset(0, 55), Size = UDim2.fromOffset(560, 24)}, {Body = react.createElement("TextLabel", {
        TextScaled = false,
        TextSize = 18,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Body,
        TextColor3 = u97,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = v3,
        Size = UDim2.fromOffset(560, 24),
    })})
    return react.createElement("Frame", v4, v5)
end