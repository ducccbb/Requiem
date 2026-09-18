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
--   File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Stories.Damage.story
--                              Dumped in 0.000348 seconds
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
local Button = require(v1.Parent.Parent:WaitForChild("Button"))
local Screen = v1.Parent.Parent.Parent:WaitForChild("Screen")
local Damage = require(Screen:WaitForChild("Damage"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Theme = require(Utilities_2:WaitForChild("Theme"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
return QuickStory(Theme.getStoryControls(), function(p1) -- Line: 31 -- upvalues: react (val), Damage (val), Button (val), Signals (val)
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {Damage = react.createElement(Damage), Primary = react.createElement(Button, {
        Text = "Damage",
        Padding = "Large",
        Type = 1,
        Clicked = function() -- Line: 45 -- upvalues: Signals (upval)
            Signals.Damage:Fire("Titan Nape", 100)
        end,
        Native = {Position = UDim2.fromScale(0.5, 0.5)},
    })})
end)