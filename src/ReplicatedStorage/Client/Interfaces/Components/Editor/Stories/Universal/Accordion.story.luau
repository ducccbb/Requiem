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
--File: ReplicatedStorage.Client.Interfaces.Components.Editor.Stories.Universal.Accordion.story
--                              Dumped in 0.000489 seconds
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
local Accordion = require(Universal:WaitForChild("Accordion"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Checkbox = require(Universal_2:WaitForChild("Checkbox"))
local Universal_3 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Number = require(Universal_3:WaitForChild("Number"))
local Utilities = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local v3 = {}
local function Story() -- Line: 23 -- upvalues: react (val), Accordion (val), Checkbox (val), Number (val)
    local v1 = {}
    local v2 = {Header = "Basic Settings", DefaultOpen = true}
    local v3 = {}
    local v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, -200)
    v2.Native = v3
    v1.Basic = react.createElement(Accordion, v2, {Option1 = react.createElement(Checkbox, {Label = "Enable Feature", Default = false})})
    v2 = {
        Header = "Advanced Options",
        Toggleable = {Visible = true, Default = true},
    }
    v3 = {}
    v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, -100)
    v2.Native = v3
    v1.WithCheckbox = react.createElement(Accordion, v2, {Option1 = react.createElement(Number, {Header = "Speed", Default = 10})})
    v1.WithDivider = react.createElement(Accordion, {
        Header = "Player Settings",
        Divider = 150,
        DefaultOpen = false,
        Native = {Position = UDim2.fromScale(0.5, 0.5)},
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder}), Health = react.createElement(Number, {Header = "Health", Default = 100, Divider = 150, Range = NumberRange.new(0, 200)}), Speed = react.createElement(Number, {
        Header = "Speed",
        Default = 16,
        Increment = 0.1,
        Divider = 150,
        Range = NumberRange.new(0, 50),
    }), JumpPower = react.createElement(Number, {Header = "Jump Power", Default = 50, Divider = 150, Range = NumberRange.new(0, 100)})})
    v2 = {
        Header = "Visual Effects",
        Upscale = 1.3,
        Divider = 180,
        Toggleable = {Visible = true, Default = true},
    }
    v3 = {}
    v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, 150)
    v2.Native = v3
    v1.WithUpscale = react.createElement(Accordion, v2, {Bloom = react.createElement(Checkbox, {Label = "Bloom Effect", Default = true, Upscale = 1.3})})
    return react.createElement(react.Fragment, {}, v1)
end
return QuickStory(v3, function(p1) -- Line: 118 -- upvalues: react (val), Story (val)
    return react.createElement(Story)
end)