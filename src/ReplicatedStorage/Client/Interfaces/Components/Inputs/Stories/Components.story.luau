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
-- File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Components.story
--                               Dumped in 0.00136 seconds
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
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Badge = require(Universal_2:WaitForChild("Badge"))
local Button = require(v1.Parent.Parent:WaitForChild("Button"))
local ColorPickerInput = require(v1.Parent.Parent:WaitForChild("ColorPickerInput"))
local ColorSliderInput = require(v1.Parent.Parent:WaitForChild("ColorSliderInput"))
local DropdownInput = require(v1.Parent.Parent:WaitForChild("DropdownInput"))
local ErrorInput = require(v1.Parent.Parent:WaitForChild("ErrorInput"))
local NumberSliderInput = require(v1.Parent.Parent:WaitForChild("NumberSliderInput"))
local TextInput = require(v1.Parent.Parent:WaitForChild("TextInput"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
return QuickStory(require(Utilities_2:WaitForChild("Theme")).getStoryControls(), function(p1) -- Line: 36 -- upvalues: react (val), ErrorInput (val), Accordion (val), NumberSliderInput (val), DropdownInput (val), ColorSliderInput (val), ColorPickerInput (val), TextInput (val), Button (val), Badge (val)
    local v1 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v2 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(-0.5, 0),
    })}
    local v3 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v4 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    }), Success = react.createElement(ErrorInput, {Header = "Success Output", Body = "A basic success output. This is used to display correct actions.", Visible = true, Color = Color3.fromRGB(0, 155, 0)}), Errors = react.createElement(ErrorInput, {Header = "Error Input", Body = "A basic error input. This is used to display errors to the user.", Visible = true})}
    local v5 = {}
    local v6 = {}
    local v7 = {Text = "Top", BackgroundTransparency = 1, TextSize = 24}
    local v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, 30)
    v7.TextColor3 = Color3.new(1, 1, 1)
    v6.Text = react.createElement("TextLabel", v7)
    v5.Top = react.createElement(Accordion.AccordionItem, {Header = "Top"}, v6)
    v6 = {}
    v7 = {Text = "Middle", BackgroundTransparency = 1, TextSize = 24}
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, 30)
    v7.TextColor3 = Color3.new(1, 1, 1)
    v6.Text = react.createElement("TextLabel", v7)
    v5.Middle = react.createElement(Accordion.AccordionItem, {Header = "Middle"}, v6)
    v6 = {}
    v7 = {Text = "Bottom", BackgroundTransparency = 1, TextSize = 24}
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, 30)
    v7.TextColor3 = Color3.new(1, 1, 1)
    v6.Text = react.createElement("TextLabel", v7)
    v5.Bottom = react.createElement(Accordion.AccordionItem, {Header = "Bottom"}, v6)
    v4[1] = react.createElement(Accordion.Accordion, {}, v5)
    v2.Other = react.createElement("Frame", v3, v4)
    v2.Collumn = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        Number = react.createElement(NumberSliderInput, {
            Header = "Slider Input",
            Body = "A basic slider input option.",
            Initial = 0.5,
            Update = function(p1) -- Line: 133
                print(p1)
            end,
        }),
        Dropdown = react.createElement(DropdownInput, {
            Header = "Dropdown Input",
            Body = "A basic dropdown input option.",
            Visible = true,
            Options = {
                "Red",
                "Green",
                "Blue",
                "Yellow",
                "Purple",
                "Orange",
                "Black",
                "White",
                "Gray",
                "Brown",
                "Teal",
            },
            Selected = function(...) -- Line: 156
                print("Selected", ...)
            end,
            Native = {ZIndex = 5},
        }),
        ColorSlider = react.createElement(ColorSliderInput, {
            Header = "Color Slider",
            Body = "A basic color gradient slider input.",
            Initial = Color3.fromRGB(200, 0, 0),
            Update = function(...) end,
        }),
        ColorPicker = react.createElement(ColorPickerInput, {
            Header = "Color Picker",
            Body = "This is a color picker input.",
            Default = Color3.fromRGB(9, 240, 213),
            Updated = function(...) end,
        }),
    })
    v2.Collumn2 = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        TextInputA = react.createElement(TextInput, {
            Header = "Style 3",
            Layout = 3,
            Native = {LayoutOrder = 2},
        }),
        TextInputB = react.createElement(TextInput, {Header = "Style 2", Body = "This is a input body that you type in.", Placeholder = "Placeholder", Layout = 2}),
        TextInputC = react.createElement(TextInput, {Header = "Style 1", Body = "This is a input body that you type in.", Placeholder = "Placeholder", Layout = 1}),
        Buttons = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 4, Size = UDim2.fromScale(0.3, 0.15)}, {
            Layout = react.createElement("UIGridLayout", {
                CellSize = UDim2.fromScale(0.3, 0.3),
                CellPadding = UDim2.fromOffset(5, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Primary = react.createElement(Button, {Text = "Primary", Padding = "ExtraLarge", Ratio = 0.2, Bounce = 5}),
            Secondary = react.createElement(Button, {
                Text = "Secondary",
                Padding = "ExtraLarge",
                Ratio = 0.2,
                Type = 2,
                Brightness = 0.5,
                Bounce = 5,
            }),
            Danger = react.createElement(Button, {
                Text = "Danger",
                Padding = "ExtraLarge",
                Ratio = 0.2,
                Type = 4,
                Bounce = 5,
                Weight = Enum.FontWeight.Bold,
            }),
            Outlined = react.createElement(Button, {
                Text = "Outlined",
                Padding = "ExtraLarge",
                Ratio = 0.2,
                Type = 3,
                Bounce = 5,
                Color = Color3.fromRGB(109, 109, 109),
            }),
            Diabled = react.createElement(Button, {Text = "Disabled", Padding = "ExtraLarge", Disabled = true, Ratio = 0.2}),
            Animated = react.createElement(Button, {
                Text = "Hover!",
                Padding = "ExtraLarge",
                Type = 1,
                Bounce = 5,
                Hover = 5,
                Enlarge = 5,
                Ratio = 0.2,
                Brightness = 0.7,
            }),
            Custom = react.createElement(Button, {
                Text = "Custom",
                Padding = "ExtraLarge",
                Corner = 15,
                Type = 1,
                Bounce = 5,
                Hover = 5,
                Enlarge = 5,
                Ratio = 0.2,
                Brightness = 0.7,
                Color = Color3.fromRGB(1, 66, 0),
                TextColor = Color3.fromRGB(154, 208, 142),
                Outline = Color3.fromRGB(43, 79, 36),
                Native = {LayoutOrder = 6},
            }),
        }),
        Badges = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 4, Size = UDim2.fromScale(0.3, 0.15)}, {Layout = react.createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(30, 5),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }), Outlined = react.createElement(Badge, {
            Text = "Outlined",
            Outline = true,
            Color = Color3.fromRGB(255, 255, 255),
            Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)},
        }), Filled = react.createElement(Badge, {
            Text = "Filled",
            Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)},
        }), Colored = react.createElement(Badge, {
            Text = "Custom Colored",
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)},
        })}),
    })
    return react.createElement("Frame", v1, v2)
end)