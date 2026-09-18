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
--       File: ReplicatedStorage.Client.Interfaces.Components.Menu.Tabs.TabLayout
--                              Dumped in 0.000555 seconds
--                          Bytecode version 9  |  2 functions

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
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
return function(p1) -- Line: 37 -- upvalues: useRem (val), useTheme (val), react (val), FillProps (val)
    local v1
    local v2 = useTheme()
    local v3 = p1.Subtabs or false
    p1.Subtabs = nil
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 4,
        LayoutOrder = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.156),
    }
    local v5 = UDim2.fromScale(1, 0)
    if not v3 then
        v1 = 60
    else
        v1 = 50
    end
    v4.Size = v5 + UDim2.fromOffset(0, useRem()(v1))
    local v6 = FillProps(p1, v4)
    return react.createElement("Frame", v6, {Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, 1), PaddingLeft = UDim.new(0, 1), PaddingRight = UDim.new(0, 1), PaddingBottom = UDim.new(0, 0)}), Outer = react.createElement("Frame", {BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 7), BackgroundColor3 = v2.Container.Background}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 7)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v2.Container.Stroke, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}), Inner = react.createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Size = UDim2.new(1, 0, 1, -7)}, {Layout = react.createElement("UIListLayout", {
        Padding = UDim.new(0, 0),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        VerticalFlex = Enum.UIFlexAlignment.Fill,
    })}, p1.children)})})
end