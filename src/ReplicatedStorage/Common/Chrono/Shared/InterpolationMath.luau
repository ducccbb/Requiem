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
--            File: ReplicatedStorage.Common.Chrono.Shared.InterpolationMath
--                              Dumped in 0.000786 seconds
--                          Bytecode version 9  |  7 functions

local v1
local v2 = script
script = nil
local v3 = getfenv(0)
v3.script = nil
_G.script = nil
v3 = getfenv(0)
v3.getfenv = nil
local Config = require(v2.Parent.Config)
require(v2.Parent.Snapshots)
local function Hermite(p1, p2, p3, p4, p5, p6) -- Line: 11
    local zero = p3
    if not zero then
        zero = Vector3.zero
    end
    local zero_2 = p4
    if not zero_2 then
        zero_2 = Vector3.zero
    end
    local v1 = zero_2
    if not p6 or p6 == 0 then
        return p1:Lerp(p2, p5)
    end
    local v2 = p5 * p5
    local v3 = v2 * p5
    return p1 * (v3 * 2 - v2 * 3 + 1) + zero * p6 * (v3 - v2 * 2 + p5) + p2 * (v3 * -2 + v2 * 3) + v1 * p6 * (v3 - v2)
end
v1 = {
    Hermite = Hermite,
    Linear = function(p1, p2, p3, p4, p5, p6) -- Line: 45
        return p1:Lerp(p2, p5)
    end,
    VelocityAt = function(p1, p2, p3) -- Line: 28 -- upvalues: Config (val)
        if not p1 then
            return Vector3.zero
        end
        local v1 = p2 - p1.t
        if v1 <= 1e-06 then
            return Vector3.zero
        end
        if 0.1 < v1 and Config.FLAGS and Config.FLAGS.SNAPSHOT_INTERPOLATION_FIX then
            v1 = 0.05
        end
        return (p3.Position - p1.value.Position) / v1
    end,
}
function v1.HybridHermite(p1, p2, p3, p4, p5, p6) -- Line: 49 -- upvalues: Config (val), Hermite (val)
    local Magnitude
    local zero = p3
    if not zero then
        zero = Vector3.zero
    end
    local zero_2 = p4
    if not zero_2 then
        zero_2 = Vector3.zero
    end
    if not p6 or p6 == 0 then
        return p1:Lerp(p2, p5)
    end
    local v1 = p2 - p1
    if v1.Magnitude <= 1e-06 then
        return p1
    end
    local u20 = v1 / p6
    Magnitude = u20.Magnitude
    if Magnitude <= 1e-06 then
        return p1:Lerp(p2, p5)
    end
    local HERMITE_MAX_VELOCITY_MULTIPLIER = Config.HERMITE_MAX_VELOCITY_MULTIPLIER
    local HERMITE_BLEND_THRESHOLD = Config.HERMITE_BLEND_THRESHOLD
    local function clampVelocity(p1) -- Line: 71 -- upvalues: Magnitude (val), HERMITE_MAX_VELOCITY_MULTIPLIER (val)
        local Magnitude_2 = p1.Magnitude
        if Magnitude_2 <= 1e-06 then
            return p1
        end
        local v1 = Magnitude * HERMITE_MAX_VELOCITY_MULTIPLIER
        if v1 < Magnitude_2 then
            return p1.Unit * v1
        end
        return p1
    end
    local function angleMismatch(p1) -- Line: 83 -- upvalues: u20 (val), Magnitude (val)
        local Magnitude_2 = p1.Magnitude
        if Magnitude_2 <= 1e-06 then
            return 1
        end
        local v1 = p1:Dot(u20)
        local v2 = v1 / (Magnitude_2 * Magnitude)
        local v3 = math.acos((math.clamp(v2, -1, 1))) / math.pi
        return (math.clamp(v3, 0, 1))
    end
    local v2 = clampVelocity(zero)
    local v3 = clampVelocity(zero_2)
    local v4 = angleMismatch(v2)
    local v5 = angleMismatch(v3)
    local v6 = v3.Magnitude / Magnitude
    local v7 = math.max(0, v2.Magnitude / Magnitude - HERMITE_MAX_VELOCITY_MULTIPLIER) / HERMITE_MAX_VELOCITY_MULTIPLIER
    local v8 = math.max(v4, v5, v7, math.max(0, v6 - HERMITE_MAX_VELOCITY_MULTIPLIER) / HERMITE_MAX_VELOCITY_MULTIPLIER)
    local v9 = math.clamp(v8, 0, 1)
    v8 = Hermite(p1, p2, v2, v3, p5, p6)
    local v10 = p1:Lerp(p2, p5)
    if v9 <= HERMITE_BLEND_THRESHOLD then
        return v8
    end
    local v11 = math.clamp((v9 - HERMITE_BLEND_THRESHOLD) / (1 - HERMITE_BLEND_THRESHOLD), 0, 1)
    return v8:Lerp(v10, v11)
end
return v1