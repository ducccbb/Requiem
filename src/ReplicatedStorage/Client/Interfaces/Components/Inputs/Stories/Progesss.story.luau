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
--  File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Progesss.story
--                              Dumped in 0.000360 seconds
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
local Progress = require(Universal:WaitForChild("Progress"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
return QuickStory(require(Utilities_2:WaitForChild("Theme")).getStoryControls(), function(p1) -- Line: 27 -- upvalues: react (val), Progress (val)
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 15),
        }),
        ExampleA = react.createElement(Progress, {Header = "Progress Bar", Body = "This is a description, it can be relatively long and it automatically flexes. We also can animate it!", Value = 0.3, Animated = true}),
        ExampleB = react.createElement(Progress, {Header = "Segmented Progress", Body = "Segments can be used to show progress in a more granular way.", Value = 2, Segments = 5}),
        Colored = react.createElement(Progress, {
            Header = "Custom Colors",
            Body = "You can customize the colors of the progress bar.",
            Value = 6,
            Segments = 8,
            Animated = true,
            Color = Color3.fromRGB(0, 63, 32),
        }),
        NoBody = react.createElement(Progress, {
            Value = 0.8,
            Color = Color3.fromRGB(0, 174, 255),
            Native = {Size = UDim2.fromScale(0.417, 0.05)},
        }),
    })
end)