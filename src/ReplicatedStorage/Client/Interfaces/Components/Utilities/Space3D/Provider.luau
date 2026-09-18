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
--    File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Space3D.Provider
--                              Dumped in 0.000670 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u46 = require(Packages_2:WaitForChild("react-roblox"))
local Screen = require(v1.Parent.Screen)
require(v1.Parent.Types)
local u57 = react.createContext(nil)
return {
    Provider = function(p1) -- Line: 41 -- upvalues: react (val), Screen (val), Players (val), u57 (val), u46 (val)
        local u2 = p1.Distance or 10
        local Offset = p1.Offset
        if not Offset then
            Offset = CFrame.new()
        end
        local u11 = react.useMemo(function() -- Line: 45 -- upvalues: p1 (val)
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "Space3D"
            ScreenGui.ResetOnSpawn = false
            local v1 = p1.IgnoreGuiInset ~= false
            ScreenGui.IgnoreGuiInset = v1
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ScreenGui.DisplayOrder = p1.DisplayOrder or 0
            v1 = p1.Enabled ~= false
            ScreenGui.Enabled = v1
            return ScreenGui
        end, {})
        local u19 = react.useMemo(function() -- Line: 56 -- upvalues: Screen (upval), u11 (val), u2 (val)
            return Screen.new(u11, u2)
        end, {u11, u2})
        react.useEffect(function() -- Line: 60 -- upvalues: u19 (val), Offset (val)
            u19.rootOffset = Offset
        end, {u19, Offset})
        react.useEffect(function() -- Line: 64 -- upvalues: u11 (val), p1 (val)
            local v1 = p1.Enabled ~= false
            u11.Enabled = v1
        end, {u11, p1.Enabled})
        react.useEffect(function() -- Line: 68 -- upvalues: Players (upval), u11 (val)
            local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
            u11.Parent = PlayerGui
            return function() -- Line: 72 -- upvalues: u11 (upval)
                u11.Parent = nil
            end
        end, {u11})
        react.useEffect(function() -- Line: 77 -- upvalues: u11 (val)
            return function() -- Line: 78 -- upvalues: u11 (upval)
                u11:Destroy()
            end
        end, {u11})
        local v1 = react.useMemo(function() -- Line: 83 -- upvalues: u19 (val), u11 (val)
            return {
                screen = u19,
                root = u11,
                getComponent = function(p1) -- Line: 87 -- upvalues: u19 (upval)
                    return u19:GetComponent(p1)
                end,
            }
        end, {u19, u11})
        return react.createElement(u57.Provider, {value = v1}, u46.createPortal(p1.children, u11))
    end,
    Context = u57,
}