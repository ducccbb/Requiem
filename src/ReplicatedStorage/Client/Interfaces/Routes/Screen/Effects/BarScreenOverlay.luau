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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Effects.BarScreenOverlay
--                              Dumped in 0.000577 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function(p1) -- Line: 23 -- upvalues: useMotion (val), react (val), Signals (val), Frame (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(0)
    v2, u8 = useMotion(0)
    react.useEffect(function() -- Line: 27 -- upvalues: Signals (upval), u4 (val), u8 (val)
        Signals.Bars:Connect(function(p1, p2, p3) -- Line: 28 -- upvalues: u4 (upval), u8 (upval)
            u4:tween(p1, {time = p3 or 0.15, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.InOut})
            u8:spring(p2)
        end)
    end, {})
    return react.createElement(Frame, {
        BackgroundTransparency = 1,
        ZIndex = 150,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Visible = v1:map(function(p1) -- Line: 44
            local v1 = p1 == 0
            return not v1
        end),
        Rotation = v2,
    }, {Top = react.createElement(Frame, {
        BackgroundTransparency = 0,
        ZIndex = 150,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(3, 3),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = v1:map(function(p1) -- Line: 55
            return UDim2.fromScale(0.5, p1 / 2)
        end),
    }), Bottom = react.createElement(Frame, {
        BackgroundTransparency = 0,
        ZIndex = 150,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(3, 3),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = v1:map(function(p1) -- Line: 65
            return UDim2.fromScale(0.5, 1 - p1 / 2)
        end),
    })})
end