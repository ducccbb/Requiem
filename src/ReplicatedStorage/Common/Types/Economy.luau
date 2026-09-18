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
--                     File: ReplicatedStorage.Common.Types.Economy
--                              Dumped in 0.000599 seconds
--                          Bytecode version 9  |  2 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local u12 = {
    timeMultiplier = 0.01,
    Inflation = {GlobalInflationRate = 0.02, HorseInflationRate = 0.05, GearInflationRate = 0.4},
}
local function calculateTotalCost(p1, p2, p3) -- Line: 23 -- upvalues: u12 (val)
    local resource
    local v1 = 0
    for k, v in pairs(p1) do
        resource = v.resource
        v1 = v1 + resource.price / resource.amount * (1 + resource.time * u12.timeMultiplier) * v.amount
    end
    v1 = v1 / p2 * (1 + p3 * u12.timeMultiplier)
    return {price = v1 * u12.Inflation.GlobalInflationRate, amount = p2, time = p3}
end
v1 = {
    Resources = {
        Wood = {price = 2, amount = 1, time = 1},
        IronOre = {price = 8, amount = 1, time = 1},
        SilverOre = {price = 8, amount = 1, time = 1},
        CopperOre = {price = 8, amount = 1, time = 1},
        GoldOre = {price = 15, amount = 1, time = 1},
        MythrilOre = {price = 50, amount = 1, time = 1},
        PlatinumOre = {price = 25, amount = 1, time = 1},
        Coal = {price = 5, amount = 1, time = 1},
    },
    Food = {
        Wheat = {price = 2, amount = 1, time = 1},
        Beef = {price = 5, amount = 1, time = 1},
        Fish = {price = 5, amount = 1, time = 1},
        Apple = {price = 2, amount = 1, time = 1},
        Carrot = {price = 2, amount = 1, time = 1},
        Potato = {price = 2, amount = 1, time = 1},
    },
    Miscellanious = {
        Cloth = {price = 2, amount = 1, time = 1},
        WolfPelt = {price = 8, amount = 1, time = 1},
        BearPelt = {price = 13, amount = 1, time = 1},
    },
}
return {
    Price = {
        Basic = v1,
        Intermediate = {
            Resources = {
                WoodPlank = calculateTotalCost({
                    {amount = 1, resource = v1.Resources.Wood},
                }, 4, 2),
                IronIngot = calculateTotalCost({
                    {amount = 2, resource = v1.Resources.IronOre},
                }, 1, 5),
                SilverIngot = calculateTotalCost({
                    {amount = 2, resource = v1.Resources.SilverOre},
                }, 1, 5),
                CopperIngot = calculateTotalCost({
                    {amount = 2, resource = v1.Resources.CopperOre},
                }, 1, 5),
                GoldIngot = calculateTotalCost({
                    {amount = 2, resource = v1.Resources.GoldOre},
                }, 1, 5),
                MythrilIngot = calculateTotalCost({
                    {amount = 2, resource = v1.Resources.MythrilOre},
                }, 1, 5),
                PlatinumIngot = calculateTotalCost({
                    {amount = 2, resource = v1.Resources.PlatinumOre},
                }, 1, 5),
            },
            Food = {CookedBeef = calculateTotalCost({
                {amount = 1, resource = v1.Food.Beef},
            }, 1, 8), CookedFish = calculateTotalCost({
                {amount = 1, resource = v1.Food.Fish},
            }, 1, 8)},
        },
        Advanced = {},
    },
    Constant = u12,
}