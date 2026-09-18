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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.Sacraments.story
--                               Dumped in 0.00148 seconds
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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components:WaitForChild("Utilities")
local QuickStory = require(Utilities_2:WaitForChild("QuickStory"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Progress = require(Universal_2:WaitForChild("Progress"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Storybox = require(Universal_3:WaitForChild("Storybox"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local Charts = Universal_4:WaitForChild("Charts")
local Radar = require(Charts:WaitForChild("Radar"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_8:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local u209 = {
    Strength = Color3.fromRGB(255, 255, 255),
    Dexterity = Color3.fromRGB(255, 255, 255),
    Ingenuity = Color3.fromRGB(255, 255, 255),
    Precision = Color3.fromRGB(255, 255, 255),
    Resilience = Color3.fromRGB(255, 255, 255),
}
local u235 = {}
local v3 = {Name = "Strength", Value = 0, Max = 8, Description = "Strength is a measure of your physical power and endurance."}
local v4 = {Name = "Precision", Value = 0, Max = 8, Description = "Precision is a measure of your ability to hit targets."}
local v5 = {Name = "Resilience", Value = 0, Max = 8, Description = "Resilience is a measure of your ability to withstand damage."}
u235[1] = v3
u235[2] = {Name = "Dexterity", Value = 0, Max = 8, Description = "Dexterity is a measure of your agility and reflexes."}
u235[3] = {Name = "Ingenuity", Value = 0, Max = 8, Description = "Ingenuity is a measure of your medical, crafting, and intellectual skills."}
u235[4] = v4
u235[5] = v5
local function SacramentsComponent() -- Line: 95 -- upvalues: useOrder (val), react (val), u235 (val), u209 (val), Form (val), Progress (val), Button (val), Table (val), Frame (val), Radar (val), VerticalListLayout (val)
    local u185, u6, v1, v2, v3, v4, v5, v6
    local v7 = useOrder()
    u185, u6 = react.useState(u235)
    local v8 = {}
    local v9 = u185
    local v10 = nil
    local v11 = nil
    for i, j in v9, v10, v11 do
        local Name = j.Name
        v1 = j.Value < j.Max
        v2 = u209[Name]
        if not v2 then
            v2 = Color3.fromRGB(255, 255, 255)
        end
        v3 = {
            Native = {LayoutOrder = v7()},
        }
        v4 = {}
        v5 = {Side = "Left"}
        if not v1 then
            v6 = 1
        else
            v6 = 0.85
        end
        v5.Width = v6
        v4.Left = react.createElement(Form.Divider, v5, {Progress = react.createElement(Progress, {
            Padding = "None",
            Header = Name,
            Body = j.Description,
            Value = j.Value,
            Color = v2,
            Segments = j.Max,
            Native = {BackgroundTransparency = 1},
        })})
        v4.Right = react.createElement(Form.Divider, {
            Side = "Right",
            Width = 0.1,
            Native = {Visible = v1},
        }, {Button = react.createElement(Button, {
            Text = "Add",
            Clicked = function() -- Line: 141 -- upvalues: u6 (val), Table (upval), u185 (val), Name (val)
                u6(Table.map(u185, function(p1) -- Line: 142 -- upvalues: Name (upval)
                    if p1.Name == Name then
                        return {Name = p1.Name, Value = p1.Value + 1, Max = p1.Max, Description = p1.Description}
                    end
                    return p1
                end))
            end,
        })})
        v8[Name] = react.createElement(Form.Form, v3, v4)
    end
    return react.createElement(react.Fragment, {}, {Left = react.createElement(Frame, {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(0.5, 1)}, {Tree = react.createElement(Frame, {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0.025), Size = UDim2.fromScale(0.95, 1)}, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1}), Radar = react.createElement(Radar, {Visible = true, Maximum = 9, Data = Table.map(u185, function(p1) -- Line: 179 -- upvalues: u209 (upval)
        return {value = p1.Value + 1, color = u209[p1.Name]}
    end)})})}), Right = react.createElement(Frame, {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.75, 0), Size = UDim2.fromScale(0.5, 1)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top}), Allocation = react.createElement(Progress, {
        Header = "Allocation",
        Body = "You have <b>five</b> points remaining to allocate to your sacraments.",
        Display = true,
        RichText = true,
        Value = 5,
        Range = {Min = 0, Max = 10},
    })}, v8)})
end
return QuickStory({}, function(p1) -- Line: 215 -- upvalues: react (val), Storybox (val), SacramentsComponent (val)
    return react.createElement(Storybox, {Size = 0.9}, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.75, 0.865), AnchorPoint = Vector2.new(0.5, 0.5)}, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.241})}, {Sacraments = react.createElement(SacramentsComponent, {})})})
end)