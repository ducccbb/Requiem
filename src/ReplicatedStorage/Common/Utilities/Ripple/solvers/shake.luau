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
--             File: ReplicatedStorage.Common.Utilities.Ripple.solvers.shake
--                              Dumped in 0.000493 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local intermediate = require(v1.Parent.Parent.utils.intermediate)
require(v1.Parent.Parent.types)
local function configure(p1) -- Line: 18
    local amplitude, decay, duration, frequency
    if not p1 then
        amplitude = 10
    else
        amplitude = p1.amplitude
    end
    if not p1 then
        frequency = 20
    else
        frequency = p1.frequency
    end
    if not p1 then
        duration = 0.5
    else
        duration = p1.duration
    end
    if not p1 then
        decay = 0.95
    else
        decay = p1.decay
        if not decay then
            decay = 0.95
        end
    end
    return {amplitude = amplitude, frequency = frequency, duration = duration, decay = decay}
end
return function(p1, p2) -- Line: 32 -- upvalues: configure (val), intermediate (val)
    local u4 = configure(p2)
    local u8 = intermediate.to(p1)
    local u9 = true
    local u10 = 0
    local u12 = Random.new()
    return function(p1, p2, p3) -- Line: 39 -- upvalues: intermediate (upval), u8 (val), u9 (ref), u10 (ref), u4 (val), u12 (val)
        local v1 = intermediate.index(u8, p1)
        if not v1 then
            return false
        end
        if u9 then
            u9 = false
            p2.value = p2.value or 0
            p2.velocity = 0
        end
        u10 = u10 + p3
        local v2 = math.exp(-u4.decay * (u10 / u4.duration) * 5)
        if u4.duration <= u10 or v2 < 0.01 then
            p2.complete = true
            p2.value = v1
            p2.velocity = 0
            return
        end
        local v3 = math.sin(u10 * u4.frequency * math.pi * 2)
        local v4 = 0 + v3 * u4.amplitude
        local v5 = math.sin(u10 * u4.frequency * math.pi * 4)
        v4 = v4 + v5 * u4.amplitude * 0.5
        v5 = u12:NextNumber(-1, 1)
        p2.value = v1 + (v4 + v5 * u4.amplitude * 0.3) * v2
        p2.complete = false
    end
end