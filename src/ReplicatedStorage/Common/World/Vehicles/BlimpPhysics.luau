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
--              File: ReplicatedStorage.Common.World.Vehicles.BlimpPhysics
--                               Dumped in 0.00100 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u14 = math.rad(15)
local v2 = Vector3.new(1000000000, 1000000000, 1000000000)
local function onGetAltitudeMaxSpeed(p1) -- Line: 65
    if p1 <= 300 then
        return 150
    end
    if 2048 <= p1 then
        return 100
    end
    return (p1 - 300) / 1748 * -50 + 150
end
local function onGetHorizontalYaw(p1) -- Line: 83
    local v1
    local LookVector = p1.CFrame.LookVector
    local v2 = Vector3.new(LookVector.X, 0, LookVector.Z)
    if v2.Magnitude < 0.001 then
        _, v1 = p1.CFrame:ToOrientation()
        return v1
    end
    v1 = -v2.X
    return (math.atan2(v1, -v2.Z))
end
local function onGetForwardDirection(p1) -- Line: 99
    local v1 = -math.sin(p1)
    return (Vector3.new(v1, 0, -math.cos(p1)))
end
local function onGetLinearVelocity(p1, p2) -- Line: 109 -- upvalues: onGetHorizontalYaw (val), onGetForwardDirection (val)
    local v1 = onGetForwardDirection((onGetHorizontalYaw(p2)))
    return v1 * p1.forwardSpeed + Vector3.yAxis * p1.verticalSpeed
end
local function onApproachExponential(p1, p2, p3, p4) -- Line: 122
    return p1 + (p2 - p1) * (1 - math.exp(-p3 * p4))
end
local function onUpdateRoll(p1, p2, p3) -- Line: 134 -- upvalues: u14 (val), onApproachExponential (val)
    local v1 = math.clamp(p2 * 4.5, -u14, u14)
    return onApproachExponential(p1, v1, 0.55, p3)
end
local function onUpdateForwardSpeed(p1, p2, p3, p4, p5) -- Line: 178
    local v1
    if not p3 then
        if p2 then
            if p4 <= p1 then
                return p4
            end
            v1 = p1 + p5 * 5
            return (math.min(v1, p4))
        end
        return p1
    end
    if 0 < p1 then
        v1 = p1 - p5 * 30
        return (math.max(v1, 0))
    end
    if p1 <= -p4 then
        return -p4
    end
    v1 = p1 - p5 * 5
    return (math.max(v1, -p4))
end
local function onUpdateVerticalSpeed(p1, p2, p3) -- Line: 215 -- upvalues: onApproachExponential (val)
    if 0 < p2 then
        return onApproachExponential(p1, 30, 0.35, p3)
    end
    if p2 < 0 then
        return onApproachExponential(p1, -30, 0.35, p3)
    end
    return onApproachExponential(p1, 0, 0.6, p3)
end
local function onUpdateYawSpeed(p1, p2, p3) -- Line: 234 -- upvalues: onApproachExponential (val)
    return onApproachExponential(p1, p2 * 0.1, 0.85, p3)
end
return {
    MAX_HORIZONTAL_SPEED = 150,
    ACCELERATION_SECONDS = 30,
    BRAKE_SECONDS = 5,
    ALTITUDE_LOW = 300,
    ALTITUDE_HIGH = 2048,
    ALTITUDE_LOW_MAX_SPEED = 150,
    ALTITUDE_HIGH_MAX_SPEED = 100,
    FORWARD_ACCEL = 5,
    BRAKE_RATE = 30,
    MAX_VERTICAL_SPEED = 30,
    VERTICAL_SPEED = 30,
    VERTICAL_SMOOTHING = 0.35,
    VERTICAL_DECAY = 0.6,
    ROTATION_SPEED = 0.1,
    YAW_SMOOTHING = 0.85,
    ROLL_MAX = u14,
    ROLL_PER_YAW_SPEED = 4.5,
    ROLL_SMOOTHING = 0.55,
    ENGINE_OFF_SMOOTHING = 0.75,
    LINEAR_MAX_AXES_FORCE = v2,
    ANGULAR_MAX_TORQUE = 1000000000,
    ROLL_ALIGN_MAX_TORQUE = 1000000000,
    REST_LINEAR_SPEED = 2,
    REST_ANGULAR_SPEED = 0.15,
    REST_SECONDS = 2,
    getAltitudeMaxSpeed = onGetAltitudeMaxSpeed,
    getHorizontalYaw = onGetHorizontalYaw,
    approachExponential = onApproachExponential,
    updateForwardSpeed = onUpdateForwardSpeed,
    updateVerticalSpeed = onUpdateVerticalSpeed,
    updateYawSpeed = onUpdateYawSpeed,
    stepMotion = function(p1, p2, p3, p4) -- Line: 247 -- upvalues: onGetAltitudeMaxSpeed (val), onUpdateForwardSpeed (val), onUpdateVerticalSpeed (val), onUpdateYawSpeed (val), onUpdateRoll (val), onGetLinearVelocity (val)
        local v1 = math.clamp(p4, 0.004166666666666667, 0.05)
        local v2 = onGetAltitudeMaxSpeed(p2.Position.Y)
        p1.forwardSpeed = onUpdateForwardSpeed(p1.forwardSpeed, p3.holdingForward, p3.holdingBrake, v2, v1)
        p1.forwardSpeed = math.clamp(p1.forwardSpeed, -v2, v2)
        p1.verticalSpeed = onUpdateVerticalSpeed(p1.verticalSpeed, p3.verticalInput, v1)
        p1.yawSpeed = onUpdateYawSpeed(p1.yawSpeed, p3.yawInput, v1)
        p1.roll = onUpdateRoll(p1.roll, p1.yawSpeed, v1)
        local v3 = onGetLinearVelocity(p1, p2)
        return v3, (Vector3.new(0, p1.yawSpeed, 0))
    end,
    stepRetainedMotion = function(p1, p2, p3) -- Line: 277 -- upvalues: onUpdateRoll (val), onGetLinearVelocity (val)
        local v1 = math.clamp(p3, 0.004166666666666667, 0.05)
        p1.roll = onUpdateRoll(p1.roll, p1.yawSpeed, v1)
        local v2 = onGetLinearVelocity(p1, p2)
        return v2, (Vector3.new(0, p1.yawSpeed, 0))
    end,
    stepEngineOff = function(p1, p2, p3) -- Line: 294 -- upvalues: onApproachExponential (val), onUpdateRoll (val), onGetLinearVelocity (val)
        local v1 = math.clamp(p3, 0.004166666666666667, 0.05)
        p1.forwardSpeed = onApproachExponential(p1.forwardSpeed, 0, 0.75, v1)
        p1.verticalSpeed = onApproachExponential(p1.verticalSpeed, 0, 0.75, v1)
        p1.yawSpeed = onApproachExponential(p1.yawSpeed, 0, 0.75, v1)
        p1.roll = onUpdateRoll(p1.roll, p1.yawSpeed, v1)
        local v2 = onGetLinearVelocity(p1, p2)
        return v2, (Vector3.new(0, p1.yawSpeed, 0))
    end,
    getLinearVelocity = onGetLinearVelocity,
    createRollAlign = function(p1) -- Line: 144
        local AlignOrientation = Instance.new("AlignOrientation")
        AlignOrientation.Name = "BlimpRollAlignOrientation"
        AlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
        AlignOrientation.Attachment0 = p1
        AlignOrientation.RigidityEnabled = true
        AlignOrientation.MaxTorque = 1000000000
        AlignOrientation.ReactionTorqueEnabled = false
        AlignOrientation.Parent = p1.Parent
        return AlignOrientation
    end,
    updateRollAlign = function(p1, p2, p3, p4) -- Line: 165
        local v1 = CFrame.new(p2.Position)
        local v2 = v1 * CFrame.Angles(0, p3, 0)
        p1.CFrame = v2 * CFrame.Angles(0, 0, p4)
    end,
    getCoastInput = function() -- Line: 312
        return {holdingForward = false, holdingBrake = false, verticalInput = 0, yawInput = 0}
    end,
    isAtRest = function(p1) -- Line: 326
        local v1 = math.abs(p1.forwardSpeed)
        local v2 = math.abs(p1.verticalSpeed)
        local v3 = math.abs(p1.yawSpeed)
        local v4 = if v1 <= 2 then if v2 <= 2 then v3 <= 0.15 else false else false
        return v4
    end,
}