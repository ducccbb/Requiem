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
--                 File: ReplicatedStorage.Common.Progression.Vows.Vows
--                              Dumped in 0.000303 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {Fortitude = "Fortitude", Perseverance = "Perseverance", Insight = "Insight", Restoration = "Restoration"}
local v2 = {}
local v3 = {}
v3["Vow of the Noble"] = {"Mankind is flawed, and only through the blood of devils can our sins be absolved. Increase blade damage by 2.5% per upgrade when facing titans.", "Loyalty and the cleansing of our spirits forge strength. All non-projectile damage is enhanced by 2% per upgrade.", "In the crucible of protection, we find purity. With every step in your journey, the damage that critical strike deal with charged blades grows by 2% per upgrade.", "Judgment awaits, and only through atonement can we find redemption. Gain a total 3% critical strike chance per level."}
v3["Vow of the Pentinent"] = {"Let your strength serve justice, avenging the fallen who lie slain in battle. Gain 2% more health for every progression made.", "A noble heart never falters in the shadow of death. You can avoid critical strikes by 2% per level.", "In the crucible of protection, we find purity. With every step in your journey, it seems like you're able to heal better, 2% per level.", "The weight of impending fate strengthens your resolve, reducing the damage you take in battle. Gain 2% damage reduction per level."}
v2[v1.Fortitude] = v3
v3 = {}
v3["Vow of the Unyielding"] = {"With unshaken resolve, you consume sustenance with unmatched efficiency. Gain a 5% boost to food and water consumption per upgrade.", "Your will is forged in fire, resisting even nature's fury. Gain 3% resistance to environmental hazards per upgrade.", "The chains of control cannot bind your spirit for long. Recover from crowd-control effects 5% faster per upgrade.", "When pushed to the brink, your body becomes an unbreakable fortress. Gain 5% increased damage resistance when below 25% health per upgrade."}
v3["Vow of the Marathoner"] = {"Endurance fuels your relentless stride. Increase velocity gain by 1% per upgrade.", "As you run, your body transcends its limits. Gain a 2% run boost per level.", "After being restrained, you surge forward with newfound speed. Your injuries are reduced by 2% per level.", "Your movements are swift, your gear light as a feather. Increase gear speed by 5% and use 2% less gas per upgrade."}
v2[v1.Perseverance] = v3
v3 = {}
v3["Vow of the Artificer"] = {"Mine and cut 5% faster.", "Improve crafting speed by 5%.", "Increase success rate of crafting by 5%.", "Increase quality of items crafted by 2%."}
v3["Vow of the Illuminator"] = {"Learn things 2% faster per level.", "You gain 2% more crafting experience per level.", "You gain 3% extra critical damage per level.", "You gain 2% more overall experience per level."}
v2[v1.Insight] = v3
v3 = {}
v3["Vow of the Caregiver"] = {"You're able to bandage others 5% more effectively per level.", "Your cooldown and time to heal others is reduced by 0.2 seconds per level.", "Everytime you fail an operation, gain a 2.5% chance to accidentally succeed per level.", "Have an easier time for each surgery minigame per level."}
v3["Vow of the Preservationist"] = {"You have an extra 5 seconds per level on operations.", "You're able to bandage yourself 5% more effectively per level.", "You resist operations that fail on you 3% more efficiently per level.", "Operations that you do to other players have an extra 5% chance to perfect it per level."}
v2[v1.Restoration] = v3
return {Vows = v2, Categories = v1}