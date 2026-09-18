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
--   File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Button.story
--                              Dumped in 0.000316 seconds
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
local Button = require(v1.Parent.Parent:WaitForChild("Button"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
return QuickStory(require(Utilities_2:WaitForChild("Theme")).getStoryControls(), function(p1) -- Line: 27 -- upvalues: react (val), Button (val)
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 15),
        }),
        Hover = react.createElement(Button, {
            Text = "Hover me!",
            Padding = "Large",
            Type = 1,
            Bounce = 5,
            Hover = 5,
            Enlarge = 12,
            Brightness = 1,
        }),
        Primary = react.createElement(Button, {Text = "Primary", Padding = "Large", Type = 1}),
        Secondary = react.createElement(Button, {Text = "Secondary", Padding = "Large", Type = 2}),
        Outlined = react.createElement(Button, {Text = "Outlined", Padding = "Large", Type = 3}),
        Dangerous = react.createElement(Button, {Text = "Danger!", Padding = "Large", Type = 4}),
    })
end)