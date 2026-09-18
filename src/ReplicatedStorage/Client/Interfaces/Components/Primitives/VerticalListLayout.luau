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
--  File: ReplicatedStorage.Client.Interfaces.Components.Primitives.VerticalListLayout
--                              Dumped in 0.000271 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
return react.memo(function(p1) -- Line: 18 -- upvalues: useRem (val), react (val)
    local v1 = {Padding = UDim.new(0, useRem()(p1.Spacing or 0))}
    local HorizontalAlignment = p1.HorizontalAlignment
    if not HorizontalAlignment then
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    end
    v1.HorizontalAlignment = HorizontalAlignment
    local VerticalAlignment = p1.VerticalAlignment
    if not VerticalAlignment then
        VerticalAlignment = Enum.VerticalAlignment.Bottom
    end
    v1.VerticalAlignment = VerticalAlignment
    v1.SortOrder = Enum.SortOrder.LayoutOrder
    return react.createElement("UIListLayout", v1)
end)