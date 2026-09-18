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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Uncommon.Dead Weight
--                              Dumped in 0.000293 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local u45 = false
return {
    activated = function(p1) -- Line: 28 -- upvalues: u45 (ref), ClientGearHandler (val)
        u45 = not u45
        p1(u45)
        local v1 = ClientGearHandler.getGearState()
        if v1 and u45 then
            v1.signals.ungrapple:Fire("Left")
            v1.signals.ungrapple:Fire("Right")
        end
    end,
    settings = {
        description = "Play dead, and have your body fall to the ground.",
        passive = false,
        upgradable = false,
        prerequisites = {wall = "Maria", enchantments = {}},
    },
}