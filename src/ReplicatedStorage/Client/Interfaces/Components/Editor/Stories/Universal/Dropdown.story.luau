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
--File: ReplicatedStorage.Client.Interfaces.Components.Editor.Stories.Universal.Dropdown.story
--                              Dumped in 0.000296 seconds
--                          Bytecode version 9  |  4 functions

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
local Dropdown = require(Universal:WaitForChild("Dropdown"))
local Utilities = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local function Story() -- Line: 23 -- upvalues: react (val), Dropdown (val)
    return react.createElement(react.Fragment, {}, {Dropdown = react.createElement(Dropdown, {
        Default = "Muddy",
        Header = "Dropdown",
        Divider = 100,
        Options = {"Muddy", "Green", "Blue", "Red"},
        Toggleable = {
            Visible = true,
            Default = true,
            Changed = function(p1) -- Line: 34
                print(p1)
            end,
        },
    })})
end
return QuickStory({}, function(p1) -- Line: 46 -- upvalues: react (val), Story (val)
    return react.createElement(Story)
end)