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
--                   File: ReplicatedStorage.Common.Types.Accessories
--                              Dumped in 0.000892 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u24 = {
    {
        name = "Gaspack",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.3, modifier = "subtract", opposite = "add"},
            {attribute = "CanCarryPlayer", value = 1, modifier = "subtract", opposite = "add"},
        },
    },
    {
        name = "HayesArmor",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.2, modifier = "subtract", opposite = "add"},
            {attribute = "GearConsumptionDrainMultiplier", value = 0.15, modifier = "add", opposite = "subtract"},
            {attribute = "GearVelocityDecayRateMultiplier", value = 0.5, modifier = "add", opposite = "subtract"},
            {attribute = "BasePlayerRunMultiplier", value = 0.1, modifier = "subtract", opposite = "add"},
            {attribute = "GearVelocityTimeMultiplier", value = 0.6, modifier = "add", opposite = "subtract"},
            {attribute = "GearMaxVelocityMultiplier", value = 0.1, modifier = "subtract", opposite = "add"},
            {attribute = "BladeResistanceMultiplier", value = 0.25, modifier = "add", opposite = "subtract"},
            {attribute = "MusketResistanceMultiplier", value = 0.25, modifier = "add", opposite = "subtract"},
            {attribute = "CombatResistanceMultiplier", value = 0.2, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "LightArmor",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.1, modifier = "subtract", opposite = "add"},
            {attribute = "GearConsumptionDrainMultiplier", value = 0.05, modifier = "add", opposite = "subtract"},
            {attribute = "GearVelocityDecayRateMultiplier", value = 0.25, modifier = "add", opposite = "subtract"},
            {attribute = "BasePlayerRunMultiplier", value = 0.05, modifier = "subtract", opposite = "add"},
            {attribute = "GearVelocityTimeMultiplier", value = 0.3, modifier = "add", opposite = "subtract"},
            {attribute = "GearMaxVelocityMultiplier", value = 0.05, modifier = "subtract", opposite = "add"},
            {attribute = "BladeResistanceMultiplier", value = 0.1, modifier = "add", opposite = "subtract"},
            {attribute = "MusketResistanceMultiplier", value = 0.15, modifier = "add", opposite = "subtract"},
            {attribute = "CombatResistanceMultiplier", value = 0.1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "Parka",
        attributes = {
            {attribute = "GearConsumptionDrainMultiplier", value = 0.05, modifier = "add", opposite = "subtract"},
            {attribute = "GearMaxVelocityMultiplier", value = 0.05, modifier = "subtract", opposite = "add"},
            {attribute = "HotTemperatureResistanceMultiplier", value = 0.1, modifier = "subtract", opposite = "add"},
            {attribute = "ColdTemperatureResistanceMultiplier", value = 0.1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "BodyArmor",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.25, modifier = "subtract", opposite = "add"},
            {attribute = "GearConsumptionDrainMultiplier", value = 0.2, modifier = "add", opposite = "subtract"},
            {attribute = "GearVelocityDecayRateMultiplier", value = 0.75, modifier = "add", opposite = "subtract"},
            {attribute = "BasePlayerRunMultiplier", value = 0.15, modifier = "subtract", opposite = "add"},
            {attribute = "GearVelocityTimeMultiplier", value = 0.75, modifier = "add", opposite = "subtract"},
            {attribute = "GearMaxVelocityMultiplier", value = 0.15, modifier = "subtract", opposite = "add"},
            {attribute = "BladeResistanceMultiplier", value = 0.2, modifier = "add", opposite = "subtract"},
            {attribute = "MusketResistanceMultiplier", value = 0.4, modifier = "add", opposite = "subtract"},
            {attribute = "CombatResistanceMultiplier", value = 0.2, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "Thorne Backpack",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.15, modifier = "subtract", opposite = "add"},
            {attribute = "MaximumWeight", value = 100, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "HayesPoncho",
        attributes = {
            {attribute = "CanHideArmorAccessory", value = 1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "Short Cloak",
        attributes = {
            {attribute = "CanHideArmorAccessory", value = 1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "ScarletCloakBlue",
        attributes = {
            {attribute = "CanHideArmorAccessory", value = 1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "ScarletCloakRed",
        attributes = {
            {attribute = "CanHideArmorAccessory", value = 1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "ScarletCloakGreen",
        attributes = {
            {attribute = "CanHideArmorAccessory", value = 1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "AmetrineCloakPurple",
        attributes = {
            {attribute = "CanHideArmorAccessory", value = 1, modifier = "add", opposite = "subtract"},
        },
    },
    {
        name = "Padpack",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.15, modifier = "subtract", opposite = "add"},
        },
    },
    {
        name = "Bladepack",
        attributes = {
            {attribute = "GearSwiftnessMultiplier", value = 0.3, modifier = "subtract", opposite = "add"},
            {attribute = "CanCarryPlayer", value = 1, modifier = "subtract", opposite = "add"},
        },
    },
    {
        name = "MedicalBackpack",
        attributes = {
            {attribute = "BandageCarryAmount", value = 20, modifier = "add", opposite = "subtract"},
            {attribute = "MaximumWeight", value = 15, modifier = "add", opposite = "subtract"},
            {attribute = "GearSwiftnessMultiplier", value = 0.15, modifier = "subtract", opposite = "add"},
        },
    },
}
local function getAccessory(p1) -- Line: 494 -- upvalues: Table (val), u24 (val)
    local v1
    v1 = Table.find(u24, function(a1) -- Line: 495 -- upvalues: p1 (val)
        local v1 = a1.name == p1
        return v1
    end)
    if not v1 then
        return nil
    end
    return u24[v1]
end
return {
    getAccessory = getAccessory,
    getAccessoryAttributes = function(p1) -- Line: 512 -- upvalues: getAccessory (val)
        local v1 = getAccessory(p1)
        if not v1 then
            return nil
        end
        return v1.attributes
    end,
    getAccessories = function() -- Line: 525 -- upvalues: Table (val), u24 (val)
        return Table.values(u24)
    end,
}