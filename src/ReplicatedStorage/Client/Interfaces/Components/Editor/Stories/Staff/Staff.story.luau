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
-- File: ReplicatedStorage.Client.Interfaces.Components.Editor.Stories.Staff.Staff.story
--                              Dumped in 0.000340 seconds
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
local Universal = v1.Parent.Parent.Parent.Parent:WaitForChild("Universal")
local Storybox = require(Universal:WaitForChild("Storybox"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Routes = Interfaces:WaitForChild("Routes")
local Editor = Routes:WaitForChild("Editor")
local Staff = Editor:WaitForChild("Staff")
local Root = require(Staff:WaitForChild("Root"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Routes_2 = Interfaces_2:WaitForChild("Routes")
local Editor_2 = Routes_2:WaitForChild("Editor")
local Providers = Editor_2:WaitForChild("Providers")
local EditorProvider = require(Providers:WaitForChild("EditorProvider"))
local function Story() -- Line: 25 -- upvalues: react (val), EditorProvider (val), Root (val)
    return react.createElement(EditorProvider.EditorProvider, {}, {Staff = react.createElement(Root)})
end
return QuickStory({}, function(p1) -- Line: 32 -- upvalues: react (val), Storybox (val), Story (val)
    return react.createElement(Storybox, {Size = 1}, {react.createElement(Story)})
end)