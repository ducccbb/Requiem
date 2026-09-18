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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Sentinel.Toggle Tank
--                              Dumped in 0.000305 seconds
--                          Bytecode version 9  |  3 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local u55 = false
return {
    activated = function() -- Line: 27 -- upvalues: u55 (ref), ClientGearHandler (val), Signals (val)
        u55 = true
        local v1 = ClientGearHandler.getGearState()
        if not v1 then
            return
        end
        Signals.Monologue:Fire("I'm using my reserves, I should find some gas soon.")
        v1.gas = math.clamp(v1.gas + v1.maxGas * 0.15, 0, v1.maxGas)
    end,
    verify = function() -- Line: 47 -- upvalues: u55 (ref), Signals (val), ClientGearHandler (val)
        if u55 then
            Signals.Monologue:Fire("I've already used my reserves, I don't have any left!")
            return false
        end
        if not (ClientGearHandler.getGearState()) then
            return false
        end
        return true
    end,
    settings = {},
}