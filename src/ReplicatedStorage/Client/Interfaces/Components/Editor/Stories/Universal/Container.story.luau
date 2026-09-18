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
--File: ReplicatedStorage.Client.Interfaces.Components.Editor.Stories.Universal.Container.story
--                              Dumped in 0.000724 seconds
--                          Bytecode version 9  |  5 functions

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
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local Universal_3 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Layouts = Universal_3:WaitForChild("Layouts")
local Divider = require(Layouts:WaitForChild("Divider"))
local Universal_4 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Dropdown = require(Universal_4:WaitForChild("Dropdown"))
local Universal_5 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Icon = require(Universal_5:WaitForChild("Icon"))
local Universal_6 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Number = require(Universal_6:WaitForChild("Number"))
local Universal_7 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Slider = require(Universal_7:WaitForChild("Slider"))
local Utilities = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local function Story() -- Line: 34 -- upvalues: useOrder (val), react (val), Container (val), Icon (val), Checkbox (val), Number (val), Divider (val), Dropdown (val), Slider (val)
    local u6, v1
    local v2 = useOrder()
    v1, u6 = react.useState(nil)
    local v3 = {}
    local v4 = {
        Padding = "Large",
        Layout = "Horizontal",
        Spacing = 20,
        Native = {Position = UDim2.fromScale(0.5, 0.2)},
    }
    local v5 = {}
    local v6 = {Image = "rbxassetid://12967714846"}
    local v7 = v1 == "Icon1"
    v6.Selected = v7
    function v6.Clicked() -- Line: 52 -- upvalues: u6 (val)
        u6("Icon1")
    end
    v5.Icon = react.createElement(Icon, v6)
    v6 = {Image = "rbxassetid://12967714846"}
    v7 = v1 == "Icon2"
    v6.Selected = v7
    function v6.Clicked() -- Line: 61 -- upvalues: u6 (val)
        u6("Icon2")
    end
    v5.Icon2 = react.createElement(Icon, v6)
    v3.Buttons = react.createElement(Container, v4, v5)
    v3.Inputs = react.createElement(Container, {Padding = "Large", Layout = "Vertical"}, {
        CheckboxNoLabel = react.createElement(Checkbox, {
            Default = true,
            Native = {LayoutOrder = v2()},
        }),
        CheckboxWithLabel = react.createElement(Checkbox, {
            Default = true,
            Label = "Checkbox 2",
            Native = {LayoutOrder = v2()},
        }),
        NumberNoLabel = react.createElement(Number, {
            Default = 10,
            Native = {LayoutOrder = v2()},
        }),
        Divider = react.createElement(Divider, {
            Size = 20,
            Native = {LayoutOrder = v2()},
        }),
        NumberWithLabel = react.createElement(Number, {
            Default = 10,
            Header = "Number 3",
            Divider = 200,
            Native = {LayoutOrder = v2()},
        }),
        NumberWithCheckbox = react.createElement(Number, {
            Default = 10,
            Header = "Number 3",
            Divider = 200,
            Toggleable = {Visible = true, Default = true},
            Native = {LayoutOrder = v2()},
        }),
        Divider2 = react.createElement(Divider, {
            Size = 20,
            Native = {LayoutOrder = v2()},
        }),
        Dropdown = react.createElement(Dropdown, {
            Default = "Muddy",
            Header = "Dropdown 4",
            Divider = 200,
            Options = {"Muddy", "Green", "Blue", "Red"},
            Native = {ZIndex = 10, LayoutOrder = v2()},
        }),
        Divider3 = react.createElement(Divider, {
            Size = 20,
            Native = {LayoutOrder = v2()},
        }),
        Slider = react.createElement(Slider, {
            Default = 50,
            Divider = 160,
            Header = "Slider",
            Native = {LayoutOrder = v2()},
        }),
    })
    return react.createElement(react.Fragment, {}, v3)
end
return QuickStory({}, function(p1) -- Line: 150 -- upvalues: react (val), Story (val)
    return react.createElement(Story)
end)