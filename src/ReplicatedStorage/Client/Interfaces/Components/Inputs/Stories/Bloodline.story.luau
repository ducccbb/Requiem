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
--  File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Bloodline.story
--                              Dumped in 0.000809 seconds
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
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Primitives_2 = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Image = require(Primitives_2:WaitForChild("Image"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local Universal_3 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local Primitives_3 = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_3:WaitForChild("HorizontalListLayout"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Theme = require(Utilities_2:WaitForChild("Theme"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local function BloodlineForm() -- Line: 37 -- upvalues: useOrder (val), useRem (val), react (val), Form (val), Frame (val), Image (val), HeaderBodyComponent (val), HorizontalListLayout (val), Badge (val)
    local v1 = useOrder()
    local v2 = useRem()
    local v3 = {
        Darken = false,
        Height = "Large",
        Native = {LayoutOrder = v1()},
    }
    local v4 = {}
    local v5 = {}
    local v6 = {BackgroundTransparency = 1}
    local v7 = v2(90)
    v6.Size = UDim2.fromOffset(v7, v2(160))
    v6.Position = UDim2.fromScale(0.025, 0.5)
    v6.AnchorPoint = Vector2.new(0, 0.5)
    v6.LayoutOrder = v1()
    local v8 = {}
    local v9 = {Image = "rbxassetid://100512912092589"}
    local v10 = v2(90)
    v9.Size = UDim2.fromOffset(v10, v2(90))
    v8.Image = react.createElement(Image, v9, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v5.Icon = react.createElement(Frame, v6, v8)
    v6 = {BackgroundTransparency = 1}
    v7 = v2(300)
    v6.Size = UDim2.fromOffset(v7, v2(90))
    v6.LayoutOrder = v1()
    v8 = {}
    v9 = {Header = "Vitalis Bloodline", Body = "You are currently part of the bloodline Vitalis.", Wrap = false}
    v10 = UDim2.fromScale(0, 0.5)
    v9.Position = v10 + UDim2.fromOffset(0, -v2(25))
    v8.Label = react.createElement(HeaderBodyComponent, v9)
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(0, 0.5)
    v9.Position = v10 + UDim2.fromOffset(0, v2(5))
    v9.Size = UDim2.fromScale(1, 0.5)
    v9.AnchorPoint = Vector2.new(0, 0)
    v8.Tags = react.createElement(Frame, v9, {Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}), Head = react.createElement(Badge, {
        Text = "Testing",
        Outline = true,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v1()},
    }), Location = react.createElement(Badge, {
        Text = "Originated from Shiganshina",
        Outline = true,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v1()},
    })})
    v5.Frame = react.createElement(Frame, v6, v8)
    v4.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, v5)
    v4.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Head = react.createElement(Badge, {
        Text = "Testing",
        Outline = true,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v1()},
    }), Location = react.createElement(Badge, {
        Text = "Originated from Shiganshina",
        Outline = true,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v1()},
    })})
    return react.createElement(Form.Form, v3, v4)
end
return QuickStory(Theme.getStoryControls(), function(p1) -- Line: 145 -- upvalues: react (val), BloodlineForm (val)
    return react.createElement(BloodlineForm)
end)