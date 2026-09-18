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
--                       File: ReplicatedStorage.Common.Spring.Eq
--                              Dumped in 0.000806 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
function OverDamping(p1, p2, p3, p4, p5, p6) -- Line: 40
    local v1 = p2 * p2 - p3 * 4 / p1
    local v2 = p2 + math.sqrt(v1)
    local v3 = p2 - math.sqrt(v1)
    local u18 = v2 * -0.5
    local u19 = v3 * -0.5
    local u23 = (u19 * p4 - p5) / (u19 - u18)
    local u27 = (u18 * p4 - p5) / (u18 - u19)
    local u28 = p6 / p3
    return {
        Offset = function(p1) -- Line: 57 -- upvalues: u23 (val), u18 (val), u27 (val), u19 (val), u28 (val)
            local v1 = u23 * math.exp(u18 * p1)
            local v2 = v1 + u27 * math.exp(u19 * p1)
            return v2 + u28
        end,
        Velocity = function(p1) -- Line: 60 -- upvalues: u23 (val), u18 (val), u27 (val), u19 (val)
            local v1 = u23 * u18 * math.exp(u18 * p1)
            return v1 + u27 * u19 * math.exp(u19 * p1)
        end,
        Acceleration = function(p1) -- Line: 63 -- upvalues: u23 (val), u18 (val), u27 (val), u19 (val)
            local v1 = u23 * u18 * u18 * math.exp(u18 * p1)
            return v1 + u27 * u19 * u19 * math.exp(u19 * p1)
        end,
    }
end
function CriticalDamping(p1, p2, p3, p4, p5, p6) -- Line: 69
    local u7 = -p2 / 2
    local u8 = p4
    local u10 = p5 - u7 * p4
    local u11 = p6 / p3
    return {
        Offset = function(p1) -- Line: 82 -- upvalues: u7 (val), u8 (val), u10 (val), u11 (val)
            local v1 = math.exp(u7 * p1)
            return v1 * (u8 + u10 * p1) + u11
        end,
        Velocity = function(p1) -- Line: 85 -- upvalues: u7 (val), u10 (val), u8 (val)
            local v1 = math.exp(u7 * p1)
            return v1 * (u10 * u7 * p1 + u8 * u7 + u10)
        end,
        Acceleration = function(p1) -- Line: 88 -- upvalues: u7 (val), u10 (val), u8 (val)
            local v1 = u7 * math.exp(u7 * p1)
            return v1 * (u10 * u7 * p1 + u8 * u7 + u10 * 2)
        end,
    }
end
function UnderDamping(p1, p2, p3, p4, p5, p6) -- Line: 94
    local u11 = -p2 / 2
    local u14 = math.sqrt(-(p2 * p2 - p3 * 4 / p1))
    local u15 = p4
    local u18 = (p5 - u11 * p4) / u14
    local u19 = p6 / p3
    return {
        Offset = function(p1) -- Line: 109 -- upvalues: u11 (val), u15 (val), u14 (val), u18 (val), u19 (val)
            local v1 = math.exp(u11 * p1)
            local v2 = u15 * math.cos(u14 * p1)
            local v3 = v1 * (v2 + u18 * math.sin(u14 * p1))
            return v3 + u19
        end,
        Velocity = function(p1) -- Line: 112 -- upvalues: u11 (val), u15 (val), u14 (val), u18 (val)
            local v1 = -math.exp(u11 * p1)
            local v2 = (u15 * u14 - u18 * u11) * math.sin(u14 * p1)
            return v1 * (v2 + (-u18 * u14 - u15 * u11) * math.cos(u14 * p1))
        end,
        Acceleration = function(p1) -- Line: 115 -- upvalues: u11 (val), u18 (val), u14 (val), u15 (val)
            local v1 = -math.exp(u11 * p1)
            local v2 = (u18 * u14 * u14 + u15 * 2 * u11 * u14 - u18 * u11 * u11) * math.sin(u14 * p1)
            return v1 * (v2 + (u15 * u14 * u14 - u18 * 2 * u11 * u14 - u15 * u11 * u11) * math.cos(u14 * p1))
        end,
    }
end
function v1.F(p1) -- Line: 125
    local InitialOffset = p1.InitialOffset
    local InitialVelocity = p1.InitialVelocity
    local ExternalForce = p1.ExternalForce
    local Mass = p1.Mass
    local Damping = p1.Damping
    local Constant = p1.Constant
    local v1 = Damping * Damping - Constant * 4 / Mass
    if 0 < v1 then
        return OverDamping(Mass, Damping, Constant, InitialOffset, InitialVelocity, ExternalForce)
    end
    if v1 == 0 then
        return CriticalDamping(Mass, Damping, Constant, InitialOffset, InitialVelocity, ExternalForce)
    end
    return UnderDamping(Mass, Damping, Constant, InitialOffset, InitialVelocity, ExternalForce)
end
return v1