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
--            File: ReplicatedStorage.Common.Utilities.Ripple.solvers.spring
--                              Dumped in 0.000689 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
require(v1.Parent.Parent.types)
local config = require(v1.Parent.Parent.config)
local intermediate = require(v1.Parent.Parent.utils.intermediate)
local function configure(p1) -- Line: 15 -- upvalues: config (val)
    local v1
    local v2 = p1.mass or 1
    local tension = p1.tension
    if not tension then
        tension = config.spring.default.tension
    end
    local friction = p1.friction
    if not friction then
        friction = config.spring.default.friction
    end
    if p1.frequency then
        v1 = p1.frequency or 0.5
        tension = (2 * math.pi / v1) ^ 2 * v2
        friction = 4 * math.pi * (p1.damping or 1) * v2 / v1
    elseif p1.damping then
        v1 = p1.frequency or 0.5
        tension = (2 * math.pi / v1) ^ 2 * v2
        friction = 4 * math.pi * (p1.damping or 1) * v2 / v1
    end
    return {
        mass = v2,
        tension = tension,
        friction = friction,
        position = p1.position,
        velocity = p1.velocity,
        impulse = p1.impulse,
        restingVelocity = p1.restingVelocity or 0.001,
        restingPosition = p1.restingPosition or 0.0001,
    }
end
return function(p1, p2) -- Line: 39 -- upvalues: configure (val), intermediate (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    local u7 = configure(v1)
    local u12 = intermediate.to(p1)
    local u13 = true
    return function(p1, p2, p3) -- Line: 44 -- upvalues: intermediate (upval), u12 (val), u13 (ref), u7 (val)
        local v1 = intermediate.index(u12, p1)
        if not v1 then
            return false
        end
        if u13 then
            u13 = false
            local position = u7.position
            if not position then
                position = p2.value
                if not position then
                    position = 0
                end
            end
            p2.value = position
            local velocity = u7.velocity
            if not velocity then
                velocity = p2.velocity
                if not velocity then
                    velocity = 0
                end
            end
            p2.velocity = velocity + (u7.impulse or 0)
        end
        local value = p2.value
        local v2 = p2.velocity or 0
        local v3 = math.ceil(p3 * 1000 / 1)
        v3 = math.min(v3, 100)
        local v4 = 1
        for i = 1, v3, v4 do
            v2 = v2 + (-u7.tension * 1e-06 * (value - v1) + -u7.friction * 0.001 * v2) / u7.mass * 1
            value = value + v2 * 1
        end
        v3 = math.abs(v2)
        if v3 >= u7.restingVelocity then
            p2.value = value
            p2.velocity = v2
            return
        end
        v3 = math.abs(value - v1)
        if v3 >= u7.restingPosition then
            p2.value = value
            p2.velocity = v2
            return
        end
        p2.complete = true
        p2.value = v1
        p2.velocity = 0
    end
end