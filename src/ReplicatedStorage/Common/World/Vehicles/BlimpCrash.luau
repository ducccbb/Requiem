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
--               File: ReplicatedStorage.Common.World.Vehicles.BlimpCrash
--                               Dumped in 0.00383 seconds
--                          Bytecode version 9  |  32 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local u19 = math.rad(36)
local u22 = math.rad(28)
local u25 = math.rad(36)
local u28 = math.rad(16)
local u31 = math.rad(48)
local u32 = {}
local v2 = Vector3.new(0, 0, 0)
local v3 = Vector3.new(0, 0, -32)
local v4 = Vector3.new(0, 0, 32)
local v5 = Vector3.new(-20, 0, 0)
local v6 = Vector3.new(20, 0, 0)
local v7 = Vector3.new(-14, 0, -22)
local v8 = Vector3.new(14, 0, -22)
local v9 = Vector3.new(-14, 0, 22)
u32[1] = v2
u32[2] = v3
u32[3] = v4
u32[4] = v5
u32[5] = v6
u32[6] = v7
u32[7] = v8
u32[8] = v9
u32[9] = (Vector3.new(14, 0, 22))
local function findHeadMotor(p1) -- Line: 144
    local Head = p1:FindFirstChild("Head", true)
    if not Head or not (Head:IsA("BasePart")) then
        return nil, nil
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("Motor6D") then
            if j.Part0 ~= Head and j.Part1 ~= Head then
                continue
            end
            return j, j.C0
        end
    end
    return nil, nil
end
local function getHeadMotorC0(p1, p2) -- Line: 165
    return p1 * CFrame.Angles(-p2, 0, 0)
end
local function smoothstep(p1) -- Line: 174
    local v1 = math.clamp(p1, 0, 1)
    return v1 * v1 * (3 - v1 * 2)
end
local function getTransitionAlpha(p1) -- Line: 184 -- upvalues: smoothstep (val)
    return smoothstep((math.clamp(p1 / 8, 0, 1)))
end
local function getForwardSpeedAt(p1, p2) -- Line: 194 -- upvalues: getTransitionAlpha (val)
    local v1 = getTransitionAlpha(p2)
    local v2 = math.abs(p1)
    local v3 = math.max(v2, 12)
    return v3 + (math.max(v3 * 0.85, 12) - v3) * v1
end
local function getVerticalSpeedAt(p1, p2) -- Line: 207 -- upvalues: getTransitionAlpha (val)
    return p1 + (-50.4 - p1) * getTransitionAlpha(p2)
end
local function getRaycastParams(p1) -- Line: 217
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.FilterDescendantsInstances = {p1}
    return v1
end
local function probeGround(p1, p2) -- Line: 231 -- upvalues: u32 (val), Workspace (val)
    local v1, v2, v3
    local v4 = math.ceil(#u32 * 0.55)
    local v5 = {}
    local v6 = {}
    local v7 = u32
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        v1 = p1 * j + Vector3.new(0, 4, 0)
        v3 = Vector3.new(0, -64, 0)
        v2 = Workspace:Raycast(v1, v3, p2)
        if v2 and (v2.Position - v1).Magnitude <= 36 then
            table.insert(v5, v2.Normal)
            table.insert(v6, v2.Position)
        end
    end
    if #v5 < v4 then
        return nil, nil
    end
    local zero = Vector3.zero
    local zero_2 = Vector3.zero
    for i2, v in ipairs(v5) do
        zero = zero + v
        zero_2 = zero_2 + v6[i2]
    end
    return zero.Unit, zero_2 / #v5
end
local function sampleMinimumGroundClearance(p1, p2) -- Line: 270 -- upvalues: Workspace (val), u32 (val)
    local Magnitude_2, v1, v2, v3
    local v4 = p1.Position + Vector3.new(0, 4, 0)
    local v5 = Vector3.new(0, -512, 0)
    local v6 = Workspace:Raycast(v4, v5, p2)
    if not v6 then
        return nil, nil
    end
    local Magnitude = (v6.Position - v4).Magnitude
    if 77 <= Magnitude then
        return Magnitude, v6.Normal
    end
    local v7 = Magnitude
    local Normal = v6.Normal
    for i, v in ipairs(u32) do
        if i ~= 1 then
            v1 = p1 * v + Vector3.new(0, 4, 0)
            v3 = Vector3.new(0, -512, 0)
            v2 = Workspace:Raycast(v1, v3, p2)
            if v2 then
                Magnitude_2 = (v2.Position - v1).Magnitude
                if Magnitude_2 < v7 then
                    v7 = Magnitude_2
                    Normal = v2.Normal
                end
            end
        end
    end
    return v7, Normal
end
local function getBobDampAlpha(p1) -- Line: 309 -- upvalues: smoothstep (val)
    if p1 == nil or 62 <= p1 then
        return 1
    end
    if p1 <= 28 then
        return 0
    end
    return smoothstep((p1 - 28) / 34)
end
local function softLiftAboveGround(p1, p2, p3, p4, p5) -- Line: 334 -- upvalues: u32 (val), Workspace (val)
    local v1, v2, v3
    local v4 = CFrame.new(p1)
    local v5 = v4 * CFrame.Angles(0, p2, 0)
    local v6 = v5 * CFrame.Angles(0, 0, p3)
    v5 = 0
    local yAxis = Vector3.yAxis
    if not p5 then
        v2 = v6 * u32[1] + Vector3.new(0, 4, 0)
        local v7 = Vector3.new(0, -512, 0)
        v3 = Workspace:Raycast(v2, v7, p4)
        if v3 then
            local v8 = 12 - (v3.Position - v2).Magnitude
            if 0 < v8 then
                v5 = v8
                yAxis = v3.Normal
            end
        end
    else
        local v9, v10, v11, v12
        v2 = u32
        v3 = nil
        local v13 = nil
        for i, j in v2, v3, v13 do
            v9 = v6 * j + Vector3.new(0, 4, 0)
            v12 = Vector3.new(0, -512, 0)
            v10 = Workspace:Raycast(v9, v12, p4)
            if v10 then
                v11 = 12 - (v10.Position - v9).Magnitude
                if v5 < v11 then
                    v5 = v11
                    yAxis = v10.Normal
                end
            end
        end
    end
    if 0 >= v5 then
        v1 = p1
    else
        v1 = p1 + yAxis * v5 * 0.42
    end
    return v1
end
local function getSlideDirection(p1, p2, p3) -- Line: 385
    local v1 = p1 - p2 * p1:Dot(p2)
    if v1.Magnitude < 0.01 then
        local v2 = -math.sin(p3)
        local v3 = Vector3.new(v2, 0, -math.cos(p3))
        v1 = v3 - p2 * v3:Dot(p2)
    end
    if v1.Magnitude < 0.01 then
        return (Vector3.new(1, 0, 0))
    end
    return v1.Unit
end
local function buildPoseState(p1, p2, p3, p4, p5) -- Line: 408
    local v1 = CFrame.Angles(0, p2, 0)
    local v2 = v1 * CFrame.Angles(0, 0, p3)
    v1 = CFrame.new(p1) * v2
    local v3 = v1 * CFrame.Angles(-p4, 0, 0)
    return {headPitch = p4, rootPivot = v1, pitchedPivot = v3, landed = p5}
end
local function createSimulation(p1, p2) -- Line: 433 -- upvalues: getRaycastParams (val)
    local v1
    local v2 = {
        time = 0,
        roll = 0,
        headPitch = 0,
        bobDamp = 1,
        slideSpeedAtContact = 0,
        rested = false,
        entry = p1,
    }
    if not p2 then
        v1 = nil
    else
        v1 = getRaycastParams(p2)
    end
    v2.raycastParams = v1
    v2.position = p1.startPivot.Position
    v2.yaw = p1.yaw
    return v2
end
local function getSimulationElapsedCap(p1) -- Line: 458
    if p1.contactTime then
        return p1.contactTime + 10
    end
    return 180
end
local function stepSimulation(p1, p2) -- Line: 489 -- upvalues: getTransitionAlpha (val), smoothstep (val), sampleMinimumGroundClearance (val), getBobDampAlpha (val), u19 (val), u22 (val), u25 (val), u28 (val), u31 (val), getForwardSpeedAt (val), getVerticalSpeedAt (val), softLiftAboveGround (val), probeGround (val), getSlideDirection (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    if p2 <= 0 or p1.rested then
        return
    end
    local entry = p1.entry
    local spiralSign = entry.spiralSign
    local v11 = p1.time + p2 * 0.5
    local v12 = getTransitionAlpha(v11)
    if not p1.contactTime then
        v8 = 0
    else
        v8 = p1.time - p1.contactTime
    end
    if not p1.contactTime then
        v9 = 0
    else
        v9 = math.min(v8, 10)
    end
    if not p1.contactTime then
        v10 = 0
    else
        v10 = smoothstep((math.clamp(v9 / 2.8, 0, 1)))
    end
    local v13 = false
    if p1.raycastParams then
        v3 = CFrame.new(p1.position)
        v2 = v3 * CFrame.Angles(0, p1.yaw, 0)
        v1 = v2 * CFrame.Angles(0, 0, p1.roll)
        v2 = sampleMinimumGroundClearance(v1, p1.raycastParams)
        if v2 then
            v13 = v2 <= 77
            v3 = getBobDampAlpha(v2)
            if p1.contactTime then
                v3 = math.min(v3, 1 - v10)
            end
            v4 = 1 - math.exp(p2 * -2)
            p1.bobDamp = p1.bobDamp + (v3 - p1.bobDamp) * v4
        end
    end
    v1 = u19 * smoothstep((math.clamp(v11 / 8, 0, 1)))
    p1.headPitch = v1 * (1 - v10)
    v3 = u22 * smoothstep((math.clamp(v11 / 10, 0, 1)))
    v2 = v3 * (1 - v10)
    v3 = v11 * 0.75
    v4 = u25 * math.sin(v3)
    local v14 = u28 * math.sin(v3 * 0.45)
    local v15 = spiralSign * (v4 + v14 + math.clamp(v2 * 5.5, -u25, u25)) * v12
    local v16 = v15 * p1.bobDamp
    local v17 = math.abs(v16)
    if 0.01 >= v17 then
        v15 = spiralSign
    else
        v15 = math.sign(v16)
    end
    if not p1.contactTime then
        v5 = 0
    else
        v5 = smoothstep((math.clamp(v9 / 5, 0, 1)))
    end
    local v18 = v16 * (1 - v5)
    p1.roll = v18 + v15 * u31 * 0.68 * v5
    local v19 = getForwardSpeedAt(entry.forwardSpeed, v11)
    if not p1.contactTime then
        v18 = getVerticalSpeedAt(entry.verticalSpeed, v11)
        v6 = CFrame.Angles(0, p1.yaw, 0)
        p1.position = p1.position + ((v6 * CFrame.Angles(0, 0, p1.roll)).LookVector * v19 + Vector3.new(0, v18, 0)) * p2
    elseif p1.slideDirection and p1.contactPosition and p1.restPosition then
        v18 = smoothstep((math.clamp(v9 / 2, 0, 1)))
        v7 = p1.contactPosition:Lerp(p1.restPosition, v18)
        v6 = v7 + p1.slideDirection * (p1.slideSpeedAtContact * (1 - math.exp(v9 * -0.28)) / 0.28)
        if 10 > v8 then
            v7 = 1 - math.exp(p2 * -5.5)
            p1.position = p1.position + (v6 - p1.position) * v7
        else
            p1.position = v6
        end
    end
    p1.yaw = p1.yaw + spiralSign * v2 * p2
    if p1.raycastParams then
        if v13 then
            if v9 < 10 then
                p1.position = softLiftAboveGround(p1.position, p1.yaw, p1.roll, p1.raycastParams, v13)
            end
        elseif p1.bobDamp >= 0.98 then
        end
    end
    if not p1.contactTime and p1.raycastParams and v13 then
        v6 = CFrame.new(p1.position)
        local v20 = v6 * CFrame.Angles(0, p1.yaw, 0)
        v18 = v20 * CFrame.Angles(0, 0, p1.roll)
        v20, v6 = probeGround(v18, p1.raycastParams)
        if v20 and v6 then
            v7 = p1.time + p2
            p1.contactTime = v7
            local position = p1.position
            local v21 = v6 + v20 * 8
            local v22 = (v21 - position):Dot(v20)
            if 0 < v22 then
                position = position + v20 * v22
                p1.position = position
            end
            p1.contactPosition = position
            p1.restPosition = v21
            local v23 = CFrame.Angles(0, p1.yaw, 0)
            local v24 = v23 * CFrame.Angles(0, 0, p1.roll)
            v23 = getSlideDirection(v24.LookVector, v20, p1.yaw)
            p1.slideDirection = v23
            p1.slideSpeedAtContact = v19 * 0.9
            p1.landingSnapshot = {
                landAt = entry.startTime + v7,
                position = position,
                restPosition = v21,
                normal = v20,
                yaw = p1.yaw,
                roll = p1.roll,
                headPitch = p1.headPitch,
                slideSpeed = p1.slideSpeedAtContact,
                slideDirection = v23,
            }
        end
    end
    p1.time = p1.time + p2
    if p1.contactTime and p1.contactTime + 10 <= p1.time then
        p1.rested = true
    end
end
local function advanceSimulation(p1, p2, p3) -- Line: 644 -- upvalues: getSimulationElapsedCap (val), stepSimulation (val)
    local v1, v2
    if p1.rested then
        return
    end
    local v3 = math.max(0, p2)
    local v4 = math.min(v3, getSimulationElapsedCap(p1))
    local v5 = p3 or 4
    v3 = 0
    local v6 = p1
    while v6.time < v4 do
        if v3 >= v5 then
            break
        end
        v1 = v4 - v6.time
        if 0.5 >= v1 then
            v2 = math.min(0.016666666666666666, v1)
        else
            v2 = math.min(0.05, v1)
        end
        if v2 <= 1e-06 then
            break
        end
        stepSimulation(v6, v2)
        v3 = v3 + 1
    end
end
local function getSimulationPose(p1) -- Line: 672 -- upvalues: buildPoseState (val)
    local v1 = p1.contactTime ~= nil
    return buildPoseState(p1.position, p1.yaw, p1.roll, p1.headPitch, v1)
end
local function storeLandingAttributes(p1, p2) -- Line: 732
    p1:SetAttribute("CrashLanded", true)
    p1:SetAttribute("CrashLandAt", p2.landAt)
    p1:SetAttribute("CrashLandNormal", p2.normal)
    p1:SetAttribute("CrashLandPosition", p2.position)
    p1:SetAttribute("CrashLandRestPosition", p2.restPosition)
    p1:SetAttribute("CrashLandYaw", p2.yaw)
    p1:SetAttribute("CrashLandRoll", p2.roll)
    p1:SetAttribute("CrashLandHeadPitch", p2.headPitch)
    p1:SetAttribute("CrashLandSlideSpeed", p2.slideSpeed)
    p1:SetAttribute("CrashLandSlideDirection", p2.slideDirection)
end
local function readEntryFromAttributes(p1) -- Line: 750
    if p1:GetAttribute("Crashing") ~= true then
        return nil
    end
    local Attribute = p1:GetAttribute("CrashStartAt")
    local Attribute_2 = p1:GetAttribute("CrashStartPivot")
    local Attribute_3 = p1:GetAttribute("CrashYaw")
    local Attribute_4 = p1:GetAttribute("CrashForwardSpeed")
    local Attribute_5 = p1:GetAttribute("CrashVerticalSpeed")
    local Attribute_6 = p1:GetAttribute("CrashSpiralSign")
    if typeof(Attribute) ~= "number" or typeof(Attribute_2) ~= "CFrame" or typeof(Attribute_3) ~= "number" or typeof(Attribute_4) ~= "number" or typeof(Attribute_5) ~= "number" or typeof(Attribute_6) ~= "number" or Attribute_6 == 0 then
        return nil
    end
    return {
        startPivot = Attribute_2,
        startTime = Attribute,
        yaw = Attribute_3,
        forwardSpeed = Attribute_4,
        verticalSpeed = Attribute_5,
        spiralSign = Attribute_6,
    }
end
local function readLandingFromAttributes(p1) -- Line: 801
    local v1
    if p1:GetAttribute("CrashLanded") ~= true then
        return nil
    end
    local Attribute = p1:GetAttribute("CrashLandAt")
    local Attribute_2 = p1:GetAttribute("CrashLandNormal")
    local Attribute_3 = p1:GetAttribute("CrashLandPosition")
    local Attribute_4 = p1:GetAttribute("CrashLandRestPosition")
    local Attribute_5 = p1:GetAttribute("CrashLandYaw")
    local Attribute_6 = p1:GetAttribute("CrashLandRoll")
    local Attribute_7 = p1:GetAttribute("CrashLandHeadPitch")
    local Attribute_8 = p1:GetAttribute("CrashLandSlideSpeed")
    local Attribute_9 = p1:GetAttribute("CrashLandSlideDirection")
    if typeof(Attribute) ~= "number" or typeof(Attribute_2) ~= "Vector3" or Attribute_2.Magnitude < 0.01 or typeof(Attribute_3) ~= "Vector3" then
        return nil
    end
    if typeof(Attribute_4) ~= "Vector3" then
        v1 = Attribute_3
    else
        v1 = Attribute_4
    end
    if typeof(Attribute_5) ~= "number" or typeof(Attribute_6) ~= "number" or typeof(Attribute_7) ~= "number" or typeof(Attribute_8) ~= "number" or typeof(Attribute_9) ~= "Vector3" or Attribute_9.Magnitude < 0.01 then
        return nil
    end
    return {
        landAt = Attribute,
        position = Attribute_3,
        restPosition = v1,
        normal = Attribute_2.Unit,
        yaw = Attribute_5,
        roll = Attribute_6,
        headPitch = Attribute_7,
        slideSpeed = Attribute_8,
        slideDirection = Attribute_9.Unit,
    }
end
local function storeRestAttributes(p1, p2) -- Line: 874
    p1:SetAttribute("CrashRestPivot", p2.rootPivot)
    p1:SetAttribute("CrashRestHeadPitch", p2.headPitch)
end
local function readRestFromAttributes(p1) -- Line: 884
    local v1
    if p1:GetAttribute("CrashRested") ~= true then
        return nil
    end
    local Attribute = p1:GetAttribute("CrashRestPivot")
    local Attribute_2 = p1:GetAttribute("CrashRestHeadPitch")
    if typeof(Attribute) ~= "CFrame" then
        return nil
    end
    if typeof(Attribute_2) ~= "number" then
        v1 = 0
    else
        v1 = Attribute_2
    end
    return {landed = true, headPitch = v1, rootPivot = Attribute, pitchedPivot = Attribute * CFrame.Angles(-v1, 0, 0)}
end
local u105 = {}
return {
    CRASHING_ATTRIBUTE = "Crashing",
    CRASH_START_AT_ATTRIBUTE = "CrashStartAt",
    CRASH_LANDED_ATTRIBUTE = "CrashLanded",
    CRASH_RESTED_ATTRIBUTE = "CrashRested",
    CRASH_PITCH_DURATION = 8,
    CRASH_TRANSITION_SECONDS = 8,
    CRASH_DESCENT_SPEED = 50.4,
    CRASH_MIN_FORWARD_SPEED = 12,
    LANDING_SEQUENCE_DURATION = 10,
    CRASH_MAX_HEAD_PITCH = u19,
    findHeadMotor = findHeadMotor,
    getHeadMotorC0 = getHeadMotorC0,
    buildEntry = function(p1, p2, p3, p4, p5, p6) -- Line: 692
        return {
            startPivot = p1:GetPivot(),
            startTime = p2,
            yaw = p3,
            forwardSpeed = p4,
            verticalSpeed = p5,
            spiralSign = p6,
        }
    end,
    storeEntryAttributes = function(p1, p2) -- Line: 716
        p1:SetAttribute("Crashing", true)
        p1:SetAttribute("CrashStartAt", p2.startTime)
        p1:SetAttribute("CrashStartPivot", p2.startPivot)
        p1:SetAttribute("CrashYaw", p2.yaw)
        p1:SetAttribute("CrashForwardSpeed", p2.forwardSpeed)
        p1:SetAttribute("CrashVerticalSpeed", p2.verticalSpeed)
        p1:SetAttribute("CrashSpiralSign", p2.spiralSign)
    end,
    readEntryFromAttributes = readEntryFromAttributes,
    readLandingFromAttributes = readLandingFromAttributes,
    createSimulation = createSimulation,
    advanceSimulation = advanceSimulation,
    getSimulationPose = getSimulationPose,
    isSequenceComplete = function(p1) -- Line: 471
        if p1.rested then
            return true
        end
        if not p1.contactTime then
            return false
        end
        local v1 = p1.contactTime + 10 <= p1.time
        return v1
    end,
    applyRestPose = function(p1, p2) -- Line: 912 -- upvalues: findHeadMotor (val), getHeadMotorC0 (val)
        local v1, v2
        v1, v2 = findHeadMotor(p1)
        if not v1 or not v2 then
            p1:PivotTo(p2.pitchedPivot)
            return
        end
        p1:PivotTo(p2.rootPivot)
        v1.C0 = getHeadMotorC0(v2, p2.headPitch)
    end,
    readRestFromAttributes = readRestFromAttributes,
    tryCommitLanding = function(p1, p2) -- Line: 932 -- upvalues: u105 (val), readLandingFromAttributes (val), readEntryFromAttributes (val), createSimulation (val), advanceSimulation (val), storeLandingAttributes (val)
        if p1:GetAttribute("CrashLanded") == true then
            u105[p1] = nil
            return readLandingFromAttributes(p1)
        end
        local v1 = readEntryFromAttributes(p1)
        if not v1 then
            return nil
        end
        local v2 = u105[p1]
        if not v2 then
            v2 = createSimulation(v1, p1)
            u105[p1] = v2
        end
        local v3 = math.max(0, p2 - v1.startTime)
        advanceSimulation(v2, v3, 4)
        local landingSnapshot = v2.landingSnapshot
        if not landingSnapshot then
            return nil
        end
        storeLandingAttributes(p1, landingSnapshot)
        u105[p1] = nil
        return landingSnapshot
    end,
    tryCompleteCrash = function(p1, p2) -- Line: 967 -- upvalues: u105 (val), readLandingFromAttributes (val), readEntryFromAttributes (val), createSimulation (val), advanceSimulation (val), getSimulationPose (val), storeRestAttributes (val)
        if p1:GetAttribute("CrashRested") == true then
            u105[p1] = nil
            return true
        end
        if p1:GetAttribute("Crashing") ~= true then
            return false
        end
        local v1 = readLandingFromAttributes(p1)
        if not v1 then
            return false
        end
        local v2 = p2 - v1.landAt
        if v2 < 10 then
            return false
        end
        v2 = readEntryFromAttributes(p1)
        if not v2 then
            return false
        end
        local v3 = u105[p1]
        if not v3 then
            v3 = createSimulation(v2, p1)
        end
        advanceSimulation(v3, v1.landAt - v2.startTime + 10, 10000)
        local v4 = getSimulationPose(v3)
        storeRestAttributes(p1, v4)
        p1:SetAttribute("Crashing", false)
        p1:SetAttribute("CrashRested", true)
        u105[p1] = nil
        return true
    end,
    getState = function(p1, p2, p3, p4) -- Line: 1016 -- upvalues: readRestFromAttributes (val), readLandingFromAttributes (val), createSimulation (val), advanceSimulation (val), getSimulationPose (val)
        local v1, v2, v3, v4
        if not p3 then
            v1 = createSimulation(p1, p3)
            v4 = math.max(0, p2 - p1.startTime)
            advanceSimulation(v1, v4, 10000)
            if p4 then
                v2 = getSimulationPose(v1)
                return v2, p4
            end
            if p3 then
                v2 = readLandingFromAttributes(p3)
                if v2 then
                    v3 = getSimulationPose(v1)
                    return v3, v2
                end
                v2 = getSimulationPose(v1)
                return v2, v1.landingSnapshot
            end
            v2 = getSimulationPose(v1)
            return v2, v1.landingSnapshot
        end
        v1 = readRestFromAttributes(p3)
        if v1 then
            return v1, readLandingFromAttributes(p3)
        end
        v1 = createSimulation(p1, p3)
        v4 = math.max(0, p2 - p1.startTime)
        advanceSimulation(v1, v4, 10000)
        if p4 then
            v2 = getSimulationPose(v1)
            return v2, p4
        end
        if not p3 then
            v2 = getSimulationPose(v1)
            return v2, v1.landingSnapshot
        end
        v2 = readLandingFromAttributes(p3)
        if v2 then
            v3 = getSimulationPose(v1)
            return v3, v2
        end
        v2 = getSimulationPose(v1)
        return v2, v1.landingSnapshot
    end,
    anchorBlimp = function(p1) -- Line: 1051
        for i, j in p1:GetDescendants() do
            if j:IsA("BasePart") then
                j.Anchored = true
            end
        end
    end,
}