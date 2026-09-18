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
--           File: ReplicatedStorage.Common.Progression.Enchantments.Rarities
--                              Dumped in 0.000378 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {
    Special = 8,
    Unique = 7,
    Mythic = 6,
    Legendary = 5,
    Epic = 4,
    Rare = 3,
    Uncommon = 2,
    Common = 1,
}
local v2 = {}
v2[v1.Special] = "Special"
v2[v1.Unique] = "Unique"
v2[v1.Mythic] = "Mythic"
v2[v1.Legendary] = "Legendary"
v2[v1.Epic] = "Epic"
v2[v1.Rare] = "Rare"
v2[v1.Uncommon] = "Uncommon"
v2[v1.Common] = "Common"
local v3 = {}
v3[v1.Special] = Color3.fromRGB(255, 200, 100)
v3[v1.Unique] = Color3.fromRGB(255, 165, 243)
v3[v1.Mythic] = Color3.fromRGB(255, 53, 56)
v3[v1.Legendary] = Color3.fromRGB(255, 186, 74)
v3[v1.Epic] = Color3.fromRGB(186, 74, 255)
v3[v1.Rare] = Color3.fromRGB(126, 175, 255)
v3[v1.Uncommon] = Color3.fromRGB(181, 255, 135)
v3[v1.Common] = Color3.fromRGB(255, 255, 255)
return {Rarities = v1, RarityNames = v2, Colors = v3}