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
--      File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Peacekeeper
--                              Dumped in 0.000671 seconds
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
    Name = "Peacekeeper",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {"Musketeer I", "Quick Shake I", "Yank I"},
    Position = Vector2.new(0.5, 1),
}
local v4 = {
    Name = "Musketeer I",
    Label = "I",
    Description = "You're becoming more well versed in the use of firearms, allowing you to reload them faster.",
    Unlocked = false,
    Unlocks = {"Musketeer II"},
    Position = Vector2.new(0.5, 0.8),
}
local v5 = {
    Name = "Musketeer II",
    Label = "II",
    Description = "As you continue your musket training, you've become more accurate with your shots, the bullet will now drop off fifty percent later.",
    Unlocked = false,
    Unlocks = {"Musketeer III"},
    Position = Vector2.new(0.5, 0.6),
}
local v6 = {
    Name = "Musketeer III",
    Label = "III",
    Description = "You've become a master of the musket, your bullets will now do twenty percent more damage, and travel twenty percent faster.",
    Unlocked = false,
    Unlocks = {"Stun Shot", "Runaway Bullet", "Crossguard Stance"},
    Position = Vector2.new(0.5, 0.4),
}
local v7 = {
    Name = "Stun Shot",
    Label = "I",
    Description = "Upon shooting a target in which is grappling, they will have their velocity reduced for a short duration.",
    Unlocked = false,
    Unlocks = {"Quick Feet"},
    Position = Vector2.new(0.6, 0.4),
}
local v8 = {
    Name = "Quick Feet",
    Label = "I",
    Description = "Upon activating, you will now run twice as fast for ten seconds, however you will then be exhausted for five seconds.",
    Unlocked = false,
    Unlocks = {"Fresh Pair", "Juggernaut", "Guillotine"},
    Position = Vector2.new(0.7, 0.6),
}
local v9 = {
    Name = "Fresh Pair",
    Label = "I",
    Description = "Upon taking out your blades, for the first ten seconds, you will deal ten percent more damage. Upon losing the effect, a cooldown of one minute will be applied.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.8),
}
local v10 = {
    Name = "Juggernaut",
    Label = "I",
    Description = "The blade of my enemy, now fuels my own rage. For every hit recieved from another human, over twenty damage, you will now deal twenty percent more damage.\n\nStacks up to five times, at a maximum stack your damage is doubled. Upon losing the window it enters a ten minute cooldown.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.4),
}
local v11 = {
    Name = "Guillotine",
    Label = "I",
    Description = "Thrust upwards in to the air, and then launch forward towards where you're facing, or your grappled target.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.4),
}
local v12 = {
    Name = "Quick Shake I",
    Label = "I",
    Description = "You will now shake off grapples ten percent faster.",
    Unlocked = false,
    Unlocks = {"Quick Shake II"},
    Position = Vector2.new(0.4, 1),
}
local v13 = {
    Name = "Quick Shake II",
    Label = "II",
    Description = "You will now shake off grapples twenty percent faster.",
    Unlocked = false,
    Unlocks = {"Quick Shake III"},
    Position = Vector2.new(0.4, 0.8),
}
local v14 = {
    Name = "Quick Shake III",
    Label = "III",
    Description = "You will now shake off grapples thirty percent faster.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.4, 0.6),
}
local v15 = {
    Name = "Yank I",
    Label = "I",
    Description = "You will now yank your opponents with ten percent more strength.",
    Unlocked = false,
    Unlocks = {"Yank II"},
    Position = Vector2.new(0.6, 1),
}
local v16 = {
    Name = "Yank II",
    Label = "II",
    Description = "Targets will now be yanked for an additional second longer.",
    Unlocked = false,
    Unlocks = {"Yank III"},
    Position = Vector2.new(0.6, 0.8),
}
local v17 = {
    Name = "Yank III",
    Label = "III",
    Description = "You will now be twenty percent more resistant to being yanked.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 0.6),
}
local v18 = {
    Name = "Runaway Bullet",
    Label = "I",
    Description = "Upon being grazed by a bullet, a moment of clarity will pass over you, allowing you to run twice as fast for five seconds.\n\nUpon activating, it will have a five minute cooldown.",
    Unlocked = false,
    Unlocks = {"Sweet Blood"},
    Position = Vector2.new(0.4, 0.4),
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
v2[16] = v18
v3 = {
    Name = "Sweet Blood",
    Label = "I",
    Description = "Killing a human in which has hit you in the past two minutes, will now heal you for half the amount of damage they dealt.",
    Unlocked = false,
    Price = 3,
    Unlocks = {"Sweet Blood II", "Payback", "Cut the Hook"},
    Position = Vector2.new(0.3, 0.6),
}
v4 = {
    Name = "Sweet Blood II",
    Label = "II",
    Description = "Damaging a human in which has hit you in the past minute, will now heal you for twenty five percent of the amount of damage they dealt. Will stack up to three times, and max out at fifty percent health.",
    Unlocked = false,
    Price = 3,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.4),
}
v5 = {
    Name = "Payback",
    Label = "I",
    Description = "Upon being hit by another human, for ten seconds, you will now deal twenty percent more damage to humans.\n\nUpon taking more damage, this effect will be extended. Upon losing the effect, a cooldown of two minutes will be applied.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.4),
}
v6 = {
    Name = "Cut the Hook",
    Label = "I",
    Description = "Upon activating, if you are being grappled on to, you will now slash the hooks off.\n\nYou must be within the air with your blades out in order to activate this proficiency.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.8),
}
v7 = {
    Name = "Crossguard Stance",
    Label = "X",
    Description = "Upon activating, you will now change your stance to the crossguard stance, all damage dealt by blades will now be increased by fifteen percent.\n\nRequires the entire tree to be unlocked.",
    Unlocked = false,
    RequiresEntireTree = true,
    Price = 3,
    Unlocks = {},
    Position = Vector2.new(0.5, 0.2),
}
v2[17] = v3
v2[18] = v4
v2[19] = v5
v2[20] = v6
v2[21] = v7
return v2