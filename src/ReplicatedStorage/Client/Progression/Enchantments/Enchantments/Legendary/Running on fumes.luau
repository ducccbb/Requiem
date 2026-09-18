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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Legendary.Running on fumes
--                              Dumped in 0.000500 seconds
--                          Bytecode version 9  |  5 functions

local u0 = script
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
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear_2 = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u77 = nil
local u85 = nil
local function hasRunningOnFumes() -- Line: 27 -- upvalues: u77 (ref), u0 (val)
    local ClientEnchantmentsHandler = u77
    if not ClientEnchantmentsHandler then
        ClientEnchantmentsHandler = require(u0.Parent.Parent.Parent:WaitForChild("ClientEnchantmentsHandler"))
    end
    u77 = ClientEnchantmentsHandler
    return u77.hasEnchantment("Running on Fumes")
end
local function tryRefillGasReserves(p1) -- Line: 33 -- upvalues: hasRunningOnFumes (val), ClientGearHandler (val), Signals (val)
    if not (hasRunningOnFumes()) then
        return
    end
    local v1 = ClientGearHandler.getGearState()
    if p1 == nil then
        Signals.GasReservesRefilled:Fire()
        return
    end
    if not v1 or v1.gas <= p1 then
        return
    end
    Signals.GasReservesRefilled:Fire()
end
Gear_2.Refill.listen(function(p1) -- Line: 48 -- upvalues: ClientGearHandler (val), u85 (ref), tryRefillGasReserves (val)
    if p1 ~= 0 then
        if p1 == 1 then
            tryRefillGasReserves(u85)
            u85 = nil
        end
        return
    end
    local v1 = ClientGearHandler.getGearState()
    local gas = v1
    if gas then
        gas = v1.gas
    end
    u85 = gas
end)
Gear_2.Refilled.listen(function() -- Line: 58 -- upvalues: u85 (ref), tryRefillGasReserves (val)
    if u85 ~= nil then
        return
    end
    tryRefillGasReserves(nil)
end)
return {
    settings = {
        description = "Your gas reserves are refilled after refilling.",
        passive = true,
        upgradable = false,
        prerequisites = {
            wall = "Maria",
            enchantments = {"Emergency Gas"},
        },
    },
}