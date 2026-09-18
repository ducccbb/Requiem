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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Effects.BlackScreenOverlay
--                              Dumped in 0.000482 seconds
--                          Bytecode version 9  |  4 functions

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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
return function(p1) -- Line: 23 -- upvalues: useInterfaceState (val), useMotion (val), react (val), Frame (val)
    local black, u13, v1, v2
    _, black = useInterfaceState("black")
    if not black then
        v2 = 1
    elseif not black.enabled then
        v2 = 1
    else
        v2 = 0
    end
    v1, u13 = useMotion(v2)
    react.useEffect(function() -- Line: 27 -- upvalues: black (val), u13 (val)
        local v1
        if not black then
            return
        end
        if black.instant then
            if not black.enabled then
                v1 = 1
            else
                v1 = 0
            end
            u13:immediate(v1)
            return
        end
        if not black.tween then
            return
        end
        if not black.enabled then
            v1 = 1
        else
            v1 = 0
        end
        u13:tween(v1, {time = black.tween.Time, style = black.tween.EasingStyle, direction = black.tween.EasingDirection})
    end, {black})
    return react.createElement(Frame, {
        ZIndex = 150,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v1,
        Size = UDim2.new(1.5, 0, 1.5, 0),
        Visible = v1:map(function(p1) -- Line: 51
            local v1 = p1 == 1
            return not v1
        end),
    })
end