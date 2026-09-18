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
--          File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Flow
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
require(script.Parent.Parent:WaitForChild("Proficiencies"))
local v2 = {}
local v3 = {
    Name = "Flow",
    Label = "I",
    Description = "In a moment of calamity, your senses become heightened; your mind as a whole sharpens.",
    Unlocked = false,
    Unlocks = {"Sustainability I", "Verge I", "Peacekeeper I", "Sentinel I"},
    Position = Vector2.new(0.5, 0.8),
}
local v4 = {
    Name = "Sustainability I",
    Label = "I",
    Description = "You can now sustain your flow for longer, increasing your flow duration by thirty percent.",
    Unlocked = false,
    Unlocks = {"Sustainability II"},
    Position = Vector2.new(0.4, 1),
}
local v5 = {
    Name = "Sustainability II",
    Label = "II",
    Description = "You can now sustain your flow for even longer, increasing your flow duration by an additional thirty percent.",
    Unlocked = false,
    Unlocks = {"Sustainability III"},
    Position = Vector2.new(0.25, 1),
}
local v6 = {
    Name = "Sustainability III",
    Label = "III",
    Description = "You can now sustain your flow for even longer, increasing your flow duration by an additional fourty percent.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.1, 1),
}
local v7 = {
    Name = "Verge I",
    Label = "I",
    Description = "You are now ten percent more prone to entering your flow state.",
    Unlocked = false,
    Unlocks = {"Verge II"},
    Position = Vector2.new(0.6, 1),
}
local v8 = {
    Name = "Verge II",
    Label = "II",
    Description = "You are now an additional ten percent more prone to entering your flow state.",
    Unlocked = false,
    Unlocks = {"Verge III"},
    Position = Vector2.new(0.75, 1),
}
local v9 = {
    Name = "Verge III",
    Label = "III",
    Description = "You are now an additional ten percent more prone to entering your flow state.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.9, 1),
}
local v10 = {
    Name = "Peacekeeper I",
    Label = "I",
    Description = "Upon entering your flow state, your bullets will now move thirty percent faster.",
    Unlocked = false,
    Unlocks = {"Peacekeeper II"},
    Blocks = {"Sentinel I", "Sentinel II", "Sentinel III", "Saturated Rage"},
    Position = Vector2.new(0.4, 0.6),
}
local v11 = {
    Name = "Peacekeeper II",
    Label = "II",
    Description = "Upon entering your flow state, your bullets will not apply gravity for thirty percent longer.",
    Unlocked = false,
    Unlocks = {"Peacekeeper III", "Absolute Calamity"},
    Position = Vector2.new(0.4, 0.4),
}
local v12 = {
    Name = "Peacekeeper III",
    Label = "III",
    Description = "Upon entering your flow state, your blades will now do five percent more damage to humans.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.4, 0.2),
}
local v13 = {
    Name = "Absolute Calamity",
    Label = "I",
    Description = "Upon entering your flow state, you're now ten-percent more likely to hit a critical hit on a human.\n\nOnce every three minutes, upon aiming, your adrenaline will be triggered, resulting your firearms having perfect accuracy.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.4),
}
local v14 = {
    Name = "Sentinel I",
    Label = "I",
    Description = "Upon entering your flow state, your velocity gain is now ten percent stronger.",
    Unlocked = false,
    Unlocks = {"Sentinel II"},
    Blocks = {"Peacekeeper I", "Peacekeeper II", "Peacekeeper III", "Absolute Calamity"},
    Position = Vector2.new(0.6, 0.6),
}
local v15 = {
    Name = "Sentinel II",
    Label = "II",
    Description = "Upon entering your flow state, your gas reduction will now be fifteen percent stronger.",
    Unlocked = false,
    Unlocks = {"Sentinel III", "Saturated Rage"},
    Position = Vector2.new(0.6, 0.4),
}
local v16 = {
    Name = "Sentinel III",
    Label = "III",
    Description = "Upon entering your flow state, your maximum velocity cap will be ten percent higher.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 0.2),
}
local v17 = {
    Name = "Saturated Rage",
    Label = "I",
    Description = "Upon entering your flow state, you're now thirty-percent more likely to hit a critical hit on a titan.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.4),
}
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
return v2