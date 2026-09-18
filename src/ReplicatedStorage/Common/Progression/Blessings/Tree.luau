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
--               File: ReplicatedStorage.Common.Progression.Blessings.Tree
--                              Dumped in 0.000447 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {Maria = "Maria", Rose = "Rose", Sina = "Sina"}
local v2 = {}
v2[v1.Maria] = {
    {
        id = "Maria's Origin",
        description = "Begin your journey within the Path of Maria",
        unlocks = {"Vein of Blood I", "Marias Luck I", "Loyalty of Maria I"},
    },
    {
        id = "Vein of Blood I",
        description = "Increase all blade damage by 0.4%",
        unlocks = {"Vein of Blood II", "Titans Adversary I"},
    },
    {
        id = "Vein of Blood II",
        description = "Increase all blade damage by 0.6%",
        unlocks = {"Vein of Blood III"},
    },
    {id = "Vein of Blood III", description = "Increase all critical hit chances by 2%", unlocks = {}},
    {
        id = "Titans Adversary I",
        description = "Increase all titan damage by 5%",
        unlocks = {"Titans Adversary II"},
    },
    {id = "Titans Adversary II", description = "Increase all titan damage by 5%", unlocks = {}},
    {
        id = "Marias Journey",
        description = "Begin testing your luck against that of Maria",
        unlocks = {"Marias Luck I"},
    },
    {
        id = "Marias Luck I",
        description = "Gain a 5% higher chance to recieve an epic enchantment of Maria.",
        unlocks = {"Marias Luck II", "Marias Approval I"},
    },
    {
        id = "Marias Luck II",
        description = "Gain a 3% higher chance to recieve a legendary enchantment of Maria.",
        unlocks = {"Marias Luck III", "Marias Approval II"},
    },
    {id = "Marias Luck III", description = "Gain a 1% higher chance to recieve a mythic enchantment of Maria.", unlocks = {}},
    {id = "Marias Approval I", description = "Unlock the ability to use legendary enchants of Maria.", unlocks = {}},
    {id = "Marias Approval II", description = "Unlock the ability to use mythic enchants of Maria.", unlocks = {}},
    {
        id = "Loyalty of Maria I",
        description = "Vow your loyalty to Maria and gain a 5% higher chance to recieve a Maria enchantment.",
        unlocks = {"Loyalty of Maria II"},
    },
    {
        id = "Loyalty of Maria II",
        description = "Increase all experience gain for Maria progression by 1%.",
        unlocks = {"Loyalty of Maria III", "Maria's Will"},
    },
    {
        id = "Loyalty of Maria III",
        description = "Increase all experience gain for Maria progression by 2%.",
        unlocks = {"Loyalty of Maria IV", "Ascendant of Maria I"},
    },
    {id = "Loyalty of Maria IV", description = "Increase all experience gain for Maria progression by 3%.", unlocks = {}},
    {id = "Maria's Will", description = "Upon discarding an enchantment of Maria have a 20% chance to get a different one.", unlocks = {}},
    {
        id = "Ascendant of Maria I",
        description = "Unlock the ability to recieve an ascendant enchant of Maria. Cannot use until Maria's Approval II is unlocked.",
        unlocks = {"Silent Bloodseeker I", "Shield of Maria I"},
    },
    {
        id = "Silent Bloodseeker I",
        description = "For every word spoken, lose 20% of your remaining health.",
        unlocks = {"Silent Bloodseeker II"},
    },
    {
        id = "Silent Bloodseeker II",
        description = "In your vow of silence, you seek blood. Gain 5% more titan damage for every word spoken, up to 20%, for 1 minute.",
        unlocks = {"Vow of Silence"},
    },
    {id = "Vow of Silence", description = "In your vow of silence, speaking is no more, gain a permanent 25% titan damage increase, and a permanent 10% overall damage increase.", unlocks = {}},
    {
        id = "Shield of Maria I",
        description = "For every titan killed in an event, gain a 0.25% overall damage reduction for the remainder of the event.",
        unlocks = {"Shield of Maria II"},
    },
    {
        id = "Shield of Maria II",
        description = "For every human killed in an event, gain a 1% overall damage reduction for the remainder of the event.",
        unlocks = {"Selfless Sacrifice"},
    },
    {id = "Selfless Sacrifice", description = "For every titan killed, while below 20% health, gain 10% of health back.", unlocks = {}},
}
return {Categories = v1, Tree = v2}