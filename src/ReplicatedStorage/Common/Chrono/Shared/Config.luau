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
--                  File: ReplicatedStorage.Common.Chrono.Shared.Config
--                              Dumped in 0.000159 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    MIN_BUFFER = 0.06,
    MAX_BUFFER = 0.7,
    TICK_RATE = 0.05,
    PROXIMITY = 750,
    ENABLE_CUSTOM_CHARACTERS = false,
    DISABLE_DEFAULT_REPLICATION = false,
    SEND_FULL_ROTATION = true,
    SHOW_WARNINGS = false,
    MAX_SNAPSHOT_COUNT = 30,
    SEND_IDLE_PLAYER_SNAPSHOTS = false,
    LINEAR_ONLY_INTERPOLATION = false,
    USE_HYBRID_INTERPOLATION = false,
    HERMITE_MAX_VELOCITY_MULTIPLIER = 1.5,
    HERMITE_BLEND_THRESHOLD = 0.15,
    FIRST_MOVE_SMOOTHING_ENABLED = false,
    FIRST_MOVE_IDLE_VELOCITY_THRESHOLD = 0.05,
    FIRST_MOVE_EASE_EXPONENT = 2,
    NPC_MODELS = {},
    NPC_TYPES = {
        DEFAULT = {TICK_RATE = 0.03333333333333333, BUFFER = 0.1},
    },
    PLAYER_MODELS = {},
    FLAGS = {SNAPSHOT_INTERPOLATION_FIX = true},
}