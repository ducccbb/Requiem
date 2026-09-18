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
--  File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Accordion.story
--                              Dumped in 0.000703 seconds
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
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Badge = require(Universal_2:WaitForChild("Badge"))
local Button = require(v1.Parent.Parent:WaitForChild("Button"))
local TextInput = require(v1.Parent.Parent:WaitForChild("TextInput"))
local Universal_3 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local Universal_4 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Form = require(Universal_4:WaitForChild("Form"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
return QuickStory(require(Utilities_2:WaitForChild("Theme")).getStoryControls(), function(p1) -- Line: 35 -- upvalues: react (val), Accordion (val), HeaderBodyComponent (val), Form (val), Button (val), Badge (val), TextInput (val)
    local v1 = {Top = react.createElement(Accordion.AccordionItem, {Header = "Top"}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 15),
    }), Label = react.createElement(HeaderBodyComponent, {Header = "Accordion", Body = "Accordions are dynamic, meaning regardless of the components you add, they will automatically size.", Wrap = true, Position = UDim2.fromScale(0, 0.5)}), Form = react.createElement(Form.Form, {
        Width = "None",
        Native = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0)},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Form", Body = "Here is a form inside of an accordion.", Wrap = true, Position = UDim2.fromScale(0, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Label = react.createElement(Button, {Text = "This is a button.", Ratio = -0.1, Padding = "Large"})})})})}
    local v2 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 30),
    }), Form = react.createElement(Form.Form, {
        Width = "None",
        Native = {BackgroundTransparency = 1, Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromScale(1, 0.03)},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Header", Body = "This is the description of the header.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Label = react.createElement(Button, {Text = "This is a button.", Ratio = -0.1, Padding = "Large"}), Badge = react.createElement(Badge, {Text = "This is a badge.", Outline = true})})})}
    local v3 = {Header = "Let's add a text input.", Layout = 3, Width = "None"}
    local v4 = {}
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, 30)
    v3.Native = v4
    v2.Text = react.createElement(TextInput, v3)
    v1.Middle = react.createElement(Accordion.AccordionItem, {Header = "Middle"}, v2)
    v2 = {}
    v3 = {Text = "Whatcha' doin down here?", BackgroundTransparency = 1, TextSize = 9, TextTransparency = 0.5}
    local v6 = UDim2.fromScale(1, 0)
    v3.Size = v6 + UDim2.fromOffset(0, 30)
    v3.TextColor3 = Color3.new(1, 1, 1)
    v2.Text = react.createElement("TextLabel", v3)
    v1.Bottom = react.createElement(Accordion.AccordionItem, {Header = "Bottom"}, v2)
    return react.createElement(Accordion.Accordion, {MaxSize = 300}, v1)
end)