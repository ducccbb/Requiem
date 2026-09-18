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
--               File: ReplicatedStorage.Common.Economy.Merchant.Templates
--                              Dumped in 0.000857 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local v2 = {}
local v3 = {item = "Axe", weight = 18, fallbackUnitCost = 5, amount = NumberRange.new(1, 2)}
local v4 = {item = "Bandage", weight = 35, fallbackUnitCost = 2, amount = NumberRange.new(3, 9)}
local v5 = {item = "Bow", weight = 8, fallbackUnitCost = 12, amount = NumberRange.new(1, 2)}
local v6 = {item = "Bread", weight = 28, fallbackUnitCost = 4, amount = NumberRange.new(2, 6)}
local v7 = {item = "Canteen", weight = 14, fallbackUnitCost = 8, amount = NumberRange.new(1, 2)}
local v8 = {item = "Carrot", weight = 10, fallbackUnitCost = 2, amount = NumberRange.new(2, 5)}
local v9 = {item = "Carrot Seed", weight = 34, fallbackUnitCost = 2, amount = NumberRange.new(6, 14)}
local v10 = {item = "Clay", weight = 24, fallbackUnitCost = 3, amount = NumberRange.new(10, 16)}
local v11 = {item = "Cooked Fish", weight = 18, fallbackUnitCost = 7, amount = NumberRange.new(2, 6)}
local v12 = {item = "Cooked Meat", weight = 18, fallbackUnitCost = 7, amount = NumberRange.new(2, 6)}
local v13 = {item = "Coal Ore", weight = 12, fallbackUnitCost = 2, amount = NumberRange.new(14, 24)}
local v14 = {item = "Compass", weight = 12, fallbackUnitCost = 3, amount = NumberRange.new(1, 2)}
local v15 = {item = "Copper Ingot", weight = 12, fallbackUnitCost = 10, amount = NumberRange.new(10, 18)}
local v16 = {item = "Copper Ore", weight = 24, fallbackUnitCost = 2, amount = NumberRange.new(12, 22)}
local v17 = {item = "Fabric", weight = 20, fallbackUnitCost = 4, amount = NumberRange.new(8, 14)}
local v18 = {item = "Farming Tool", weight = 16, fallbackUnitCost = 18, amount = NumberRange.new(1, 2)}
v2[1] = v3
v2[2] = v4
v2[3] = v5
v2[4] = v6
v2[5] = v7
v2[6] = v8
v2[7] = v9
v2[8] = v10
v2[9] = v11
v2[10] = v12
v2[11] = v13
v2[12] = v14
v2[13] = v15
v2[14] = v16
v2[15] = v17
v2[16] = v18
v3 = {item = "Fishing Rod", weight = 10, fallbackUnitCost = 10, amount = NumberRange.new(1, 2)}
v4 = {item = "Gold Ingot", weight = 3, fallbackUnitCost = 33, amount = NumberRange.new(8, 14)}
v5 = {item = "Gold Ore", weight = 9, fallbackUnitCost = 4, amount = NumberRange.new(10, 18)}
v6 = {item = "Hammer", weight = 18, fallbackUnitCost = 5, amount = NumberRange.new(1, 2)}
v7 = {item = "Iron Ingot", weight = 12, fallbackUnitCost = 11, amount = NumberRange.new(12, 22)}
v8 = {item = "Iron Ore", weight = 23, fallbackUnitCost = 2, amount = NumberRange.new(14, 26)}
v9 = {item = "Musket", weight = 3, fallbackUnitCost = 50, amount = NumberRange.new(1, 1)}
v10 = {item = "Mythril Ingot", weight = 1, fallbackUnitCost = 110, amount = NumberRange.new(1, 3)}
v11 = {item = "Mythril Ore", weight = 1, fallbackUnitCost = 15, amount = NumberRange.new(2, 5)}
v12 = {item = "Onion", weight = 10, fallbackUnitCost = 3, amount = NumberRange.new(2, 4)}
v13 = {item = "Onion Seed", weight = 34, fallbackUnitCost = 2, amount = NumberRange.new(6, 14)}
v14 = {item = "Pickaxe", weight = 18, fallbackUnitCost = 5, amount = NumberRange.new(1, 2)}
v15 = {item = "Potato", weight = 10, fallbackUnitCost = 2, amount = NumberRange.new(2, 5)}
v16 = {item = "Potato Seed", weight = 34, fallbackUnitCost = 2, amount = NumberRange.new(6, 14)}
v17 = {item = "Platinum Ingot", weight = 1, fallbackUnitCost = 56, amount = NumberRange.new(1, 3)}
v18 = {item = "Platinum Ore", weight = 3, fallbackUnitCost = 15, amount = NumberRange.new(2, 5)}
v2[17] = v3
v2[18] = v4
v2[19] = v5
v2[20] = v6
v2[21] = v7
v2[22] = v8
v2[23] = v9
v2[24] = v10
v2[25] = v11
v2[26] = v12
v2[27] = v13
v2[28] = v14
v2[29] = v15
v2[30] = v16
v2[31] = v17
v2[32] = v18
v3 = {item = "Sabre", weight = 6, fallbackUnitCost = 15, amount = NumberRange.new(1, 2)}
v4 = {item = "Silver Ingot", weight = 9, fallbackUnitCost = 10, amount = NumberRange.new(10, 16)}
v5 = {item = "Silver Ore", weight = 17, fallbackUnitCost = 5, amount = NumberRange.new(12, 20)}
v6 = {item = "Spyglass", weight = 8, fallbackUnitCost = 8, amount = NumberRange.new(1, 2)}
v7 = {item = "Stone", weight = 30, fallbackUnitCost = 3, amount = NumberRange.new(10, 18)}
v8 = {item = "String", weight = 22, fallbackUnitCost = 2, amount = NumberRange.new(8, 14)}
v9 = {item = "Tomato", weight = 10, fallbackUnitCost = 3, amount = NumberRange.new(2, 4)}
v10 = {item = "Tomato Seed", weight = 34, fallbackUnitCost = 2, amount = NumberRange.new(6, 14)}
v11 = {item = "Torch", weight = 20, fallbackUnitCost = 2, amount = NumberRange.new(1, 4)}
v12 = {item = "Wheat", weight = 12, fallbackUnitCost = 2, amount = NumberRange.new(2, 5)}
v13 = {item = "Wheat Seed", weight = 34, fallbackUnitCost = 2, amount = NumberRange.new(6, 14)}
v14 = {item = "Wooden Log", weight = 42, fallbackUnitCost = 3, amount = NumberRange.new(12, 20)}
v15 = {item = "Wooden Planks", weight = 16, fallbackUnitCost = 4, amount = NumberRange.new(3, 7)}
v2[33] = v3
v2[34] = v4
v2[35] = v5
v2[36] = v6
v2[37] = v7
v2[38] = v8
v2[39] = v9
v2[40] = v10
v2[41] = v11
v2[42] = v12
v2[43] = v13
v2[44] = v14
v2[45] = v15
u12.lootPool = v2
u12.offerCountRange = NumberRange.new(60, 100)
u12.merchantCurrencyRange = NumberRange.new(500, 2000)
local u247 = {Default = u12}
return {
    Default = u12,
    get = function(p1) -- Line: 84 -- upvalues: u247 (val), u12 (val)
        local v1 = p1
        if not v1 then
            v1 = "Default"
        elseif v1 == "" then
            v1 = "Default"
        end
        local v2 = u247[v1]
        if not v2 then
            v2 = u12
        end
        return v2
    end,
    register = function(p1, p2) -- Line: 97 -- upvalues: u247 (val)
        u247[p1] = p2
    end,
}