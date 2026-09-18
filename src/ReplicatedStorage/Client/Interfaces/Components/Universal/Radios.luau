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
--         File: ReplicatedStorage.Client.Interfaces.Components.Universal.Radios
--                               Dumped in 0.00156 seconds
--                          Bytecode version 9  |  6 functions

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
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Hitbox = require(Primitives:WaitForChild("Hitbox"))
local Utilities_3 = v1.Parent.Parent:WaitForChild("Utilities")
local Stroke = require(Utilities_3:WaitForChild("Stroke"))
local Primitives_2 = v1.Parent.Parent:WaitForChild("Primitives")
local Label = require(Primitives_2:WaitForChild("Label"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks:WaitForChild("useTextScale"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local function Radio(p1) -- Line: 53 -- upvalues: useTextScale (val), useTheme (val), react (val), Label (val), Color (val), Hitbox (val), Stroke (val)
    local X
    local v1 = useTextScale()
    local v2 = useTheme()
    local createElement = react.createElement
    local v3 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v1(15)), AutomaticSize = Enum.AutomaticSize.X}
    local v4 = {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v1(10))})}
    local Label_2 = p1.Label
    if Label_2 then
        Label_2 = react.createElement(Label, {
            TextScaled = false,
            Text = p1.Label,
            TextSize = v1(14),
            TextColor3 = Color.Darken(v2.Primary, 0.8),
            Size = UDim2.fromOffset(0, v1(14)),
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
        })
    end
    v4.Label = Label_2
    local createElement_2 = react.createElement
    local v5 = {ClipsDescendants = true, BackgroundColor3 = v2.PageBackground, Position = UDim2.fromScale(0.5, 0.5)}
    local v6 = v1(15)
    v5.Size = UDim2.fromOffset(v6, v1(15))
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    if not p1.Label then
        X = Enum.AutomaticSize.None
    else
        X = Enum.AutomaticSize.X
        if not X then
            X = Enum.AutomaticSize.None
        end
    end
    v5.AutomaticSize = X
    local v7 = {Hitbox = react.createElement(Hitbox, {
        Enabled = true,
        Clicked = function() -- Line: 89 -- upvalues: p1 (val)
            if p1.Toggled then
                p1.Toggled(not p1.Selected)
            end
        end,
    })}
    local v8 = {BackgroundColor3 = v2.Secondary, Position = UDim2.fromScale(0.5, 0.5)}
    local v9 = v1(11)
    v8.Size = UDim2.fromOffset(v9, v1(11))
    v8.AnchorPoint = Vector2.new(0.5, 0.5)
    v8.Visible = p1.Selected
    v7.Fill = react.createElement("Frame", v8, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v7.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})
    v7.Stroke = react.createElement(Stroke)
    v4[1] = createElement_2("Frame", v5, v7)
    return createElement("Frame", v3, v4)
end
return function(p1) -- Line: 119 -- upvalues: useTextScale (val), react (val), Radio (val), FillProps (val)
    local u7, v1, v2, v3
    local v4 = useTextScale()
    v3, u7 = react.useState(p1.Selected)
    react.useEffect(function() -- Line: 123 -- upvalues: p1 (val), u7 (val)
        if p1.Selected then
            u7(p1.Selected)
        end
    end, {p1.Selected})
    local v5 = {}
    local u80 = p1
    for k, v in pairs(p1.Options) do
        v1 = {}
        v2 = v == v3
        v1.Selected = v2
        v1.Label = v
        function v1.Toggled() -- Line: 136 -- upvalues: u7 (val), v (val), u80 (val)
            u7(v)
            if u80.Toggled then
                u80.Toggled(v)
            end
        end
        v5[v] = react.createElement(Radio, v1)
    end
    local Native = u80.Native
    if not Native then
        Native = {}
    end
    local v6 = FillProps(Native, {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v4(15)), AutomaticSize = Enum.AutomaticSize.X})
    return react.createElement("Frame", v6, {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v4(30))})}, v5)
end