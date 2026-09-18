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
--        File: ReplicatedStorage.Client.Interfaces.Components.Universal.Checkbox
--                               Dumped in 0.00178 seconds
--                          Bytecode version 9  |  3 functions

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
return function(p1) -- Line: 47 -- upvalues: useTextScale (val), react (val), useTheme (val), FillProps (val), Label (val), Color (val), Hitbox (val), Stroke (val)
    local X, u7, u8
    local v1 = useTextScale()
    u7, u8 = react.useState(p1.Default or false)
    local v2 = useTheme()
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v3 = FillProps(Native, {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v1(15)), AutomaticSize = Enum.AutomaticSize.X})
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
        Clicked = function() -- Line: 88 -- upvalues: u8 (val), u7 (val), p1 (val)
            u8(not u7)
            if p1.Toggled then
                p1.Toggled(not u7)
            end
        end,
    })}
    local v8 = {BackgroundColor3 = v2.Secondary, Position = UDim2.fromScale(0, 0.5)}
    local v9 = v1(15)
    v8.Size = UDim2.fromOffset(v9, v1(15))
    v8.AnchorPoint = Vector2.new(0, 0.5)
    v8.Visible = u7
    local v10 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})}
    local v11 = {BackgroundTransparency = 1, Image = "rbxassetid://98099571144354", ImageColor3 = v2.Primary, Position = UDim2.fromScale(0.5, 0.5)}
    local v12 = UDim2.fromScale(1, 1)
    local v13 = -v1(6)
    v11.Size = v12 + UDim2.new(0, v13, 0, -v1(6))
    v11.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.Image = react.createElement("ImageLabel", v11)
    v7.Fill = react.createElement("Frame", v8, v10)
    v7.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})
    v7.Stroke = react.createElement(Stroke)
    v4[1] = createElement_2("Frame", v5, v7)
    return createElement("Frame", v3, v4)
end