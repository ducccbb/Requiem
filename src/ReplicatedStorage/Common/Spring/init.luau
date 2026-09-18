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
--                         File: ReplicatedStorage.Common.Spring
--                               Dumped in 0.00100 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Eq = require(script:WaitForChild("Eq"))
local sqrt = math.sqrt
local pi = math.pi
local v2 = {
    OFFSET = "Offset",
    VELOCITY = "Velocity",
    ACCELERATION = "Acceleration",
    GOAL = "Goal",
    FREQUENCY = "Frequency",
}
local v3 = {}
local u22 = {}
function u22.__index(p1, p2) -- Line: 139 -- upvalues: sqrt (val), pi (val), u22 (val)
    local v1
    local v2 = {
        Offset = function() -- Line: 141 -- upvalues: p1 (val)
            local v1 = tick() - p1.StartTick
            return (p1.F.Offset(v1))
        end,
        Velocity = function() -- Line: 147 -- upvalues: p1 (val)
            local v1 = tick() - p1.StartTick
            return (p1.F.Velocity(v1))
        end,
        Acceleration = function() -- Line: 153 -- upvalues: p1 (val)
            local v1 = tick() - p1.StartTick
            return (p1.F.Acceleration(v1))
        end,
        Goal = function() -- Line: 159 -- upvalues: p1 (val)
            return p1.ExternalForce / p1.Constant
        end,
        Frequency = function() -- Line: 164 -- upvalues: p1 (val), sqrt (upval), pi (upval)
            local Damping = p1.Damping
            local v1 = sqrt(-Damping * Damping + 4 * p1.Constant / p1.Mass)
            return v1 / (2 * pi)
        end,
    }
    local v3 = rawget(p1, p2)
    if v3 ~= nil then
        return v3
    end
    v1 = v2[p2]
    if v1 ~= nil then
        return v1()
    end
    return u22[p2]
end
function u22.__tostring(p1) -- Line: 182
    local v1 = tick() - p1.StartTick
    local F = p1.F
    local AdvancedObjectStringEnabled = p1.AdvancedObjectStringEnabled
    local v2 = nil
    if AdvancedObjectStringEnabled == false then
        local v3 = F.Offset(v1)
        local v4 = F.Velocity(v1)
        return (string.format(".\n------------------------\nSPRING PROPERTIES BASIC:\n------------------------\n[DELTA PROPERTIES]:\n\t--> [OFFSET]: %.3f\n\t--> [VELOCITY]: %.3f\n\t--> [ACCELERATION]: %.3f\n", v3, v4, F.Acceleration(v1)))
    end
    if AdvancedObjectStringEnabled == true then
        local v5 = F.Offset(v1)
        local v6 = F.Velocity(v1)
        v2 = string.format(".\n---------------------------\nSPRING PROPERTIES ADVANCED:\n---------------------------\n[BASE PROPERTIES]:\n\t--> MASS: %.3f\n\t--> DAMPING: %.3f\n\t--> STIFFNESS: %.3f\n\t--> GOAL: %.3f\n\t--> FREQUENCY: %.3f\n\t--> INITIAL OFFSET: %.3f\n\t--> INITIAL VELOCITY: %.3f\n\t--> EXTERNAL FORCE: %.3f\n\t--> START TICK: %f\n[DELTA PROPERTIES]:\n\t--> [OFFSET]: %.3f\n\t--> [VELOCITY]: %.3f\n\t--> [ACCELERATION]: %.3f\n", p1.Mass, p1.Damping, p1.Constant, p1.Goal, p1.Frequency, p1.InitialOffset, p1.InitialVelocity, p1.ExternalForce, p1.StartTick, v5, v6, F.Acceleration(v1))
    end
    return v2
end
function v3.new(p1, p2, p3, p4, p5, p6) -- Line: 214 -- upvalues: u22 (val)
    local v1 = 0 < p1
    assert(v1, "Mass for spring system cannot be less than or equal to 0")
    v1 = 0 < p3
    assert(v1, "Spring constant for spring system cannot be less than or equal to 0")
    local v2 = p6 or 0
    v1 = {
        AdvancedObjectStringEnabled = false,
        StartTick = 0,
        Mass = p1,
        Damping = p2,
        Constant = p3,
        InitialOffset = (p4 or 0) - v2,
        InitialVelocity = p5 or 0,
        ExternalForce = v2 * p3,
    }
    setmetatable(v1, u22)
    v1:Reset()
    return v1
end
function v3.fromFrequency(p1, p2, p3, p4, p5, p6) -- Line: 260 -- upvalues: pi (val), u22 (val)
    local v1 = 0 < p1
    assert(v1, "Mass for spring system cannot be less than or equal to 0")
    v1 = 0 < p3
    assert(v1, "Spring frequency for spring system cannot be less than or equal to 0")
    local v2 = p1 * 0.25 * (4 * pi * pi * p3 * p3 + p2 * p2)
    local v3 = p6 or 0
    local v4 = {
        AdvancedObjectStringEnabled = false,
        StartTick = 0,
        Mass = p1,
        Damping = p2,
        Constant = v2,
        InitialOffset = (p4 or 0) - v3,
        InitialVelocity = p5 or 0,
        ExternalForce = v3 * v2,
    }
    setmetatable(v4, u22)
    v4:Reset()
    return v4
end
function u22:Reset() -- Line: 304 -- upvalues: Eq (val)
    self.F = Eq.F(self)
    self.StartTick = tick()
end
function u22.SetExternalForce(p1, p2) -- Line: 313
    p1.ExternalForce = p2
    p1.InitialOffset = p1.Offset - p2 / p1.Constant
    p1.InitialVelocity = p1.Velocity
    p1:Reset()
end
function u22.SetGoal(p1, p2) -- Line: 325
    p1.ExternalForce = p2 * p1.Constant
    p1.InitialOffset = p1.Offset - p2
    p1.InitialVelocity = p1.Velocity
    p1:Reset()
end
function u22.SetFrequency(p1, p2) -- Line: 338 -- upvalues: pi (val)
    p1.Constant = 0.25 * p1.Mass * (4 * pi * pi * p2 * p2 + p1.Damping * p1.Damping)
    p1.InitialOffset = p1.Offset
    p1.InitialVelocity = p1.Velocity
    p1:Reset()
end
function u22.SnapToCriticalDamping(p1) -- Line: 351 -- upvalues: sqrt (val)
    p1.Damping = sqrt(p1.Constant / p1.Mass) * 2
    p1.InitialOffset = p1.Offset
    p1.InitialVelocity = p1.Velocity
    p1:Reset()
end
function u22.SetOffset(p1, p2, p3) -- Line: 362
    local Velocity
    p1.InitialOffset = p2 - p1.Goal
    if not p3 then
        Velocity = p1.Velocity
    else
        Velocity = 0
    end
    p1.InitialVelocity = Velocity
    p1:Reset()
end
function u22.AddOffset(p1, p2) -- Line: 372
    p1.InitialOffset = p1.Offset + p2
    p1.InitialVelocity = p1.Velocity
    p1:Reset()
end
function u22.SetVelocity(p1, p2) -- Line: 382
    p1.InitialOffset = p1.Offset
    p1.InitialVelocity = p2
    p1:Reset()
end
function u22.AddVelocity(p1, p2) -- Line: 392
    p1.InitialOffset = p1.Offset
    p1.InitialVelocity = p1.Velocity + p2
    p1:Reset()
end
function u22.Print(p1) -- Line: 400
    local v1 = tostring(p1)
    print(v1)
end
return v3