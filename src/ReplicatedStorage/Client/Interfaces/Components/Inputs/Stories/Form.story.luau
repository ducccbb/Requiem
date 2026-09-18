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
--    File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Form.story
--                              Dumped in 0.000441 seconds
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
local Badge = require(Universal:WaitForChild("Badge"))
local Button = require(v1.Parent.Parent:WaitForChild("Button"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Checkbox = require(Universal_2:WaitForChild("Checkbox"))
local Universal_3 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Switch = require(Universal_3:WaitForChild("Switch"))
local Universal_4 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Form = require(Universal_4:WaitForChild("Form"))
local Universal_5 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_5:WaitForChild("HeaderBodyComponent"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
return QuickStory(require(Utilities_2:WaitForChild("Theme")).getStoryControls(), function(p1) -- Line: 34 -- upvalues: react (val), Form (val), HeaderBodyComponent (val), Button (val), Badge (val), Switch (val), Checkbox (val)
    return react.createElement(Form.Form, {
        Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromScale(0.417, 0.06)},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Header", Body = "This is the description of the header.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Label = react.createElement(Button, {Text = "This is a button.", Ratio = -0.1, Padding = "Large"}), Badge = react.createElement(Badge, {Text = "This is a badge.", Outline = true}), Switch = react.createElement(Switch, {}), Checkbox = react.createElement(Checkbox, {})})})
end)