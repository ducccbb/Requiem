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
--               File: ReplicatedStorage.Common.Effects.ScreenShakePresets
--                              Dumped in 0.000270 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    None = {
        amplitude = 0,
        sustainTime = 0,
        fadeOutTime = 0,
        frequency = 0,
        rotationInfluence = 0,
    },
    Small = {
        amplitude = 1,
        sustainTime = 0.4,
        fadeOutTime = 0.8,
        frequency = 0.14,
        rotationInfluence = 0.1,
    },
    Medium = {
        amplitude = 3,
        sustainTime = 0.4,
        fadeOutTime = 0.8,
        frequency = 0.14,
        rotationInfluence = 0.15,
    },
    Large = {
        amplitude = 6,
        sustainTime = 0.4,
        fadeOutTime = 0.8,
        frequency = 0.14,
        rotationInfluence = 0.2,
    },
    Explosion = {
        amplitude = 6,
        sustainTime = 0.1,
        fadeOutTime = 0.8,
        frequency = 0.1,
        rotationInfluence = 0.2,
    },
    Earthquake = {
        amplitude = 3,
        sustainTime = 3,
        fadeOutTime = 0.8,
        frequency = 0.1,
        rotationInfluence = 0.1,
    },
}
return {
    getPreset = function(p1) -- Line: 63 -- upvalues: u12 (val)
        if u12[p1] then
            return u12[p1]
        end
        return u12.None
    end,
    getAllPresets = function() -- Line: 71 -- upvalues: u12 (val)
        return u12
    end,
}