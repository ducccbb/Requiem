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
--    File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Chart.story
--                              Dumped in 0.000492 seconds
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
local Charts = Universal:WaitForChild("Charts")
local Bar = require(Charts:WaitForChild("Bar"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Charts_2 = Universal_2:WaitForChild("Charts")
local Line = require(Charts_2:WaitForChild("Line"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
return QuickStory(require(Utilities_2:WaitForChild("Theme")).getStoryControls(), function(p1) -- Line: 28 -- upvalues: react (val), Bar (val), Line (val)
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.5, 1)}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 15),
    }), Bar = react.createElement(Bar, {
        Suffix = "ms",
        Data = {
            {
                name = "A",
                value = {10, 30},
            },
            {
                name = "B",
                value = {20, 40},
            },
            {
                name = "C",
                value = {30, 50},
            },
            {
                name = "D",
                value = {40, 60},
            },
            {
                name = "E",
                value = {50, 70},
            },
        },
        Tooltips = {
            {"Server Latency", "The server latency is %dms"},
            {"Average Ping", "The average player ping is %dms"},
        },
    }), Line = react.createElement(Line, {
        Suffix = "ms",
        Data = {
            {
                name = "A",
                value = {10, 30},
            },
            {
                name = "B",
                value = {20, 40},
            },
            {
                name = "C",
                value = {30, 50},
            },
            {
                name = "D",
                value = {40, 60},
            },
            {
                name = "E",
                value = {50, 100},
            },
            {
                name = "F",
                value = {50, 100},
            },
            {
                name = "G",
                value = {50, 100},
            },
        },
        Tooltips = {
            {"Server Latency", "The server latency is %dms"},
            {"Average Ping", "The average player ping is %dms"},
        },
    })})
end)