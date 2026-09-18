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
--File: ReplicatedStorage.Client.Interfaces.Components.Editor.Stories.Universal.Slider.story
--                              Dumped in 0.000301 seconds
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
local Utilities = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Slider = require(Universal:WaitForChild("Slider"))
local function Story() -- Line: 21 -- upvalues: react (val), Slider (val)
    local v1 = {Normal = react.createElement(Slider, {
        Default = 50,
        Native = {Position = UDim2.fromScale(0.5, 0.5)},
    })}
    local v2 = {Default = 50, Divider = 150, Header = "Slider with Divider"}
    local v3 = {}
    local v4 = UDim2.fromScale(0.5, 0.5)
    v3.Position = v4 + UDim2.fromOffset(0, 100)
    v2.Native = v3
    v1.SliderWithDivider = react.createElement(Slider, v2)
    return react.createElement(react.Fragment, {}, v1)
end
return QuickStory({}, function(p1) -- Line: 46 -- upvalues: react (val), Story (val)
    return react.createElement(Story)
end)