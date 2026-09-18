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
--           File: ReplicatedStorage.Common.Progression.Disciplines.Trees.Gear
--                              Dumped in 0.000488 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    {name = "Manuevering Gear", description = "You can now use your manuevering gear with decent capabilities.", icon = "rbxassetid://84319030405944"},
    {
        name = "Precise Slash",
        description = "You can now hold your blades and percisely slash.",
        icon = "rbxassetid://115560520059804",
        requirements = {"Manuevering Gear"},
    },
    {
        name = "Battle Instinct",
        description = "Slashing at the same time as an opponent will now initiate a clash.",
        icon = "rbxassetid://115560520059804",
        requirements = {"Precise Slash"},
    },
    {
        name = "Reelstrike",
        description = "If hooked on a target, and reeling, when in range, you will now lunge and attack.",
        icon = "rbxassetid://115560520059804",
        requirements = {"Battle Instinct"},
        secondary_requirement = {"Quick Recovery"},
    },
    {
        name = "Yanking",
        description = "Dashing backwards while grappling on a target, will now yank the target towards you.",
        icon = "rbxassetid://115560520059804",
        requirements = {"Reelstrike"},
    },
    {
        name = "Quickdraw",
        description = "Holding your handles key, while they are away, will now take them out and do a quick slash.",
        icon = "rbxassetid://115560520059804",
        requirements = {"Reelstrike"},
    },
    {
        name = "Quick Reflexes",
        description = "You can now dash with your manuevering gear, by double tapping movement keys.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Manuevering Gear"},
    },
    {
        name = "Quick Recovery",
        description = "You can now press 'shift' while sliding to come to a quick stop.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Quick Reflexes"},
    },
    {
        name = "Point Launch",
        description = "You can now press 'space' while sliding to launch yourself forward.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Quick Recovery"},
    },
    {
        name = "Downshift",
        description = "You can now double tap 'shift' in the air to launch downwards.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Quick Recovery"},
    },
    {
        name = "Wall Running",
        description = "If grappling along a wall, you will now run along the wall.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Downshift"},
    },
    {
        name = "Anchor Sliding",
        description = "You can now control the direction of your ground slide.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Wall Running"},
    },
    {
        name = "Aero Vault",
        description = "You can now double tap 'space' while falling to launch upwards.",
        icon = "rbxassetid://84319030405944",
        requirements = {"Point Launch"},
        secondary_requirement = {"Anchor Sliding"},
    },
}