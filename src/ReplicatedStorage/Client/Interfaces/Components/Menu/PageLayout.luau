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
--         File: ReplicatedStorage.Client.Interfaces.Components.Menu.PageLayout
--                              Dumped in 0.000327 seconds
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
return function(p1) -- Line: 26 -- upvalues: useRem (val), react (val)
    local Top
    local v1 = useRem()
    if p1.Ratio == nil then
        p1.Ratio = true
    end
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v2 = {}
    local createElement_2 = react.createElement
    local v3 = {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder}
    if not p1.AlignTop then
        Top = Enum.VerticalAlignment.Center
    else
        Top = Enum.VerticalAlignment.Top
        if not Top then
            Top = Enum.VerticalAlignment.Center
        end
    end
    v3.VerticalAlignment = Top
    v3.Padding = UDim.new(0, 10)
    v2.Layout = createElement_2("UIListLayout", v3)
    v2.Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v1(p1.TopMargin or 15))})
    return createElement(Fragment, {}, v2)
end