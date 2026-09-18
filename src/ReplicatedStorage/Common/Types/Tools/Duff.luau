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
--                    File: ReplicatedStorage.Common.Types.Tools.Duff
--                              Dumped in 0.000179 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local v2 = require(script.Parent.Parent.Parent:WaitForChild("Config")).define({
    USAGE_AMOUNT = 4,
    WEIGHT = 5,
    EFFECT_DURATION = 600,
    CONSUMPTION_COOLDOWN = 5,
    CONSUMPTION_LIMIT = 3,
    CONSUMPTION_WINDOW = 3600,
    COLLAPSE_DOT_TICKS = 10,
    COLLAPSE_DOT_INTERVAL = 2,
    COLLAPSE_DOT_DAMAGE_PER_TICK = 5,
    CHEMICAL_ADDICTION_REQUIREMENT_TIMER = 604800,
    CHEMICAL_ADDICTION_REQUIREMENT_AMOUNT = 5,
    ANIM_PRIORITY = 4,
    ANIM_FADE = 0.1,
    POISONED_DURATION = 600,
})
return {Constants = v2}