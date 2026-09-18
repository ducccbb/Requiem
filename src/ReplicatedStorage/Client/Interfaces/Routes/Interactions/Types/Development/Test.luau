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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Development.Test
--                              Dumped in 0.000270 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
return {
    interacted = function(p1, p2) -- Line: 28 -- upvalues: Signals (val), Interaction (val)
        Signals.Toast:Fire({type = "info", message = "Selected: " .. p2.Name})
        Interaction.Event.unreliablePost(p1, p2)
    end,
    display = {
        header = "Test",
        body = "Press \"%s\" to test.",
        options = {
            {Image = "rbxassetid://135683891024467", Name = "Option 1", Default = true},
            {Image = "rbxassetid://135683891024467", Name = "Option 2", Default = false},
            {Image = "rbxassetid://135683891024467", Name = "Option 3", Default = false},
        },
    },
}