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
--            File: ReplicatedStorage.Common.Economy.Merchant.FallbackPrices
--                              Dumped in 0.000372 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
u12["Iron Ore"] = 2
u12["Copper Ore"] = 2
u12["Silver Ore"] = 5
u12["Gold Ore"] = 4
u12["Mythril Ore"] = 15
u12["Platinum Ore"] = 15
u12["Coal Ore"] = 2
u12.Stone = 5
u12.Clay = 10
u12["Iron Ingot"] = 5
u12["Copper Ingot"] = 5
u12["Silver Ingot"] = 8
u12["Gold Ingot"] = 7
u12["Mythril Ingot"] = 25
u12["Platinum Ingot"] = 20
u12["Wooden Log"] = 5
u12["Wooden Planks"] = 6
u12["Wooden Handle"] = 5
u12["Reinforced Wooden Handle"] = 8
u12.Wheat = 2
u12["Wheat Seed"] = 2
u12.Carrot = 2
u12["Carrot Seed"] = 2
u12.Potato = 2
u12["Potato Seed"] = 2
u12.Onion = 3
u12["Onion Seed"] = 2
u12.Tomato = 3
u12["Tomato Seed"] = 2
u12.Hay = 10
u12.Meat = 5
u12["Raw Fish"] = 1
u12.String = 2
u12.Bread = 2
u12["Cooked Meat"] = 4
u12["Cooked Fish"] = 3
u12.Soup = 8
u12.Canteen = 8
u12.Bottle = 2
u12.Teacup = 3
u12.Cane = 15
u12.Duff = 100
u12.Fabric = 4
u12.Leather = 5
u12.Blade = 6
u12["Axe Head"] = 3
u12["Pickaxe Head"] = 3
u12["Hammer Head"] = 3
u12["Farming Tool Head"] = 4
u12["Gun Barrel"] = 8
u12["Firing Mechanism"] = 8
u12.Spring = 3
u12.Cuff = 3
u12["Bandage Pad"] = 2
u12["Musket Casing"] = 6
u12["Flintlock Casing"] = 5
u12["Flare Gun Casing"] = 5
u12.Axe = 15
u12.Pickaxe = 25
u12.Hammer = 15
u12["Farming Tool"] = 18
u12["Fishing Rod"] = 15
u12.Torch = 8
u12.Wrench = 15
u12.Handcuffs = 10
u12["Flare Gun"] = 20
u12.Bandage = 2
u12["Heat Pack"] = 5
u12.Medkit = 30
u12.Compass = 15
u12.Spyglass = 40
u12.Sabre = 40
u12["Combat Knife"] = 30
u12.Bow = 25
u12.Baton = 15
u12.Musket = 50
u12.Flintlock = 350
u12.Cannonball = 80
return {
    Prices = u12,
    get = function(p1) -- Line: 136 -- upvalues: u12 (val)
        if typeof(p1) ~= "string" or p1 == "" then
            return nil
        end
        local v1 = u12[p1]
        if v1 then
            return v1
        end
        local v2 = string.gsub(p1, "%s+", "")
        return u12[v2]
    end,
}