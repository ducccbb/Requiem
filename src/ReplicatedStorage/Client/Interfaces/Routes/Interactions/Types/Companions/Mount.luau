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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Companions.Mount
--                              Dumped in 0.000464 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local u41 = 0
return {
    interacted = function(...) -- Line: 29 -- upvalues: u41 (ref), Players (val), Interaction (val)
        local v1 = tick()
        local v2 = v1 - u41
        if v2 < 0.5 then
            return
        end
        local Character = Players.LocalPlayer.Character
        if not Character then
            u41 = v1
            Interaction.Event.post(...)
            return
        end
        if Character:GetAttribute("Mounted") then
            return
        end
        u41 = v1
        Interaction.Event.post(...)
    end,
    display = {header = "Mount", body = "Press \"%s\" to mount companion."},
}