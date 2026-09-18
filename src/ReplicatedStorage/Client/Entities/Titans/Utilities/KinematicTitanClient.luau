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
--     File: ReplicatedStorage.Client.Entities.Titans.Utilities.KinematicTitanClient
--                               Dumped in 0.00818 seconds
--                          Bytecode version 9  |  49 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local u61 = {
    maxYawDeg = 72,
    maxPitchUpDeg = 28,
    maxPitchDownDeg = 26,
    minWorldDistance = 2,
    waistYawFraction = 0.72,
    waistPitchFraction = 0.3,
    neckYawFraction = 0.44,
    neckPitchFraction = 0.32,
    angleDamping = 3.35,
    maxAngleSpeedDeg = 52,
    largeYawErrorBoost = 1.18,
    proximitySpeedFarStuds = 3000,
    proximitySpeedNearStuds = 220,
    proximitySpeedMaxMult = 1.08,
    largeYawErrorRefRad = math.rad(52),
}
local u65 = {
    Arm = {ChainRoot = "UpperArm", EndEffector = "Hand"},
}
local v2 = {ChainRoot = "UpperLeg", EndEffector = "Foot"}
u65.Leg = v2
local u68 = {}
local u69 = {}
local u70 = {}
local u71 = {}
local u72 = {
    maxWaistYawDeg = 72,
    maxWaistPitchDeg = 68,
    waistYawFraction = 0.72,
    waistPitchFraction = 0.65,
    waistCommitPitchDeg = 38,
    maxWaistBackPitchDeg = 5,
    neckLookAtMix = 0.78,
    neckAnchorAnimBlend = 0.52,
    aimDirDamping = 14,
    neckC0Damping = 11,
    maxNeckConeDeg = 78,
    maxNeckYawDeg = 68,
    maxNeckPitchDeg = 62,
    maxPitchUpDeg = 25,
    maxPitchDownDeg = 60,
    minWorldDistance = 2,
    correctionStrength = 0.72,
    maxCorrectionPull = 0.88,
    angleDamping = 5.5,
    angleMaxSpeedDeg = 82,
    maxRootYawDeg = 34,
    maxRootPitchDeg = 14,
    rootYawFraction = 0.85,
    rootPitchFraction = 0.4,
}
local function mergeBiteIkTuning(p1) -- Line: 235 -- upvalues: u72 (val)
    if not p1 then
        return u72
    end
    local v1 = {}
    local v2 = u72
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1[i] = j
    end
    v2 = p1
    v3 = nil
    v4 = nil
    for k, n in v2, v3, v4 do
        if n ~= nil then
            v1[k] = n
        end
    end
    return v1
end
local function resolveNeckMotor(p1, p2, p3) -- Line: 254
    for i, j in p1:GetDescendants() do
        if j:IsA("Motor6D") and j.Name == "Neck" and j.Part0 == p2 and j.Part1 == p3 then
            return j
        end
    end
    for k, n in p1:GetDescendants() do
        if n:IsA("Motor6D") and n.Name == "Neck" then
            return n
        end
    end
    return nil
end
local function flatXZUnit(p1) -- Line: 270
    local v1 = p1.X * p1.X
    local v2 = math.sqrt(v1 + p1.Z * p1.Z)
    if v2 < 1e-06 then
        return (Vector3.new(0, 0, -1))
    end
    v1 = p1.X / v2
    return (Vector3.new(v1, 0, p1.Z / v2))
end
local function bearingYawXZ(p1, p2) -- Line: 279
    local X = p1.X
    local Z = p1.Z
    local X_2 = p2.X
    local Z_2 = p2.Z
    local v1 = X * Z_2 - Z * X_2
    return (math.atan2(v1, X * X_2 + Z * Z_2))
end
local function pitchFromTorsoToward(p1, p2) -- Line: 287
    local Unit = p1.CFrame:VectorToObjectSpace(p2).Unit
    local v1 = Unit.X * Unit.X
    return (math.atan2(Unit.Y, (math.max(math.sqrt(v1 + Unit.Z * Unit.Z), 1e-05))))
end
local function proximityLookSpeedMultiplier(p1, p2) -- Line: 293
    if not p2 then
        return 1
    end
    local proximitySpeedFarStuds = p1.proximitySpeedFarStuds
    local proximitySpeedNearStuds = p1.proximitySpeedNearStuds
    local proximitySpeedMaxMult = p1.proximitySpeedMaxMult
    if proximitySpeedFarStuds <= proximitySpeedNearStuds or proximitySpeedMaxMult <= 1 or proximitySpeedFarStuds <= p2 then
        return 1
    end
    if p2 <= proximitySpeedNearStuds then
        return proximitySpeedMaxMult
    end
    return 1 + (proximitySpeedFarStuds - p2) / (proximitySpeedFarStuds - proximitySpeedNearStuds) * (proximitySpeedMaxMult - 1)
end
local function smoothstep01(p1) -- Line: 313
    local v1 = math.clamp(p1, 0, 1)
    return v1 * v1 * (3 - v1 * 2)
end
local function createEasedIKControl(p1, p2, p3) -- Line: 319 -- upvalues: TweenService (val)
    local u3 = false
    local u4 = nil
    local u5 = nil
    local u6 = nil
    local u7 = nil
    local u8 = nil
    local u9 = nil
    local function teardownIK() -- Line: 332 -- upvalues: u4 (ref)
        if u4 then
            u4.Enabled = false
            u4:Destroy()
            u4 = nil
        end
    end
    local function cancelScheduled() -- Line: 340 -- upvalues: u5 (ref), u6 (ref), u7 (ref)
        if u5 then
            pcall(task.cancel, u5)
            u5 = nil
        end
        if u6 then
            pcall(task.cancel, u6)
            u6 = nil
        end
        if u7 then
            pcall(task.cancel, u7)
            u7 = nil
        end
    end
    local function easeOutAndDestroy() -- Line: 355 -- upvalues: u4 (ref), p2 (val), u9 (ref), TweenService (upval), u7 (ref), teardownIK (val)
        if not u4 then
            return
        end
        local easeOutTime = p2.easing.easeOutTime
        if u9 then
            u9:Cancel()
            u9 = nil
        end
        if 0 >= easeOutTime then
            teardownIK()
            return
        end
        local v1 = TweenInfo.new(easeOutTime)
        local v2 = TweenService:Create(u4, v1, {Weight = 0})
        u9 = v2
        v2:Play()
        u7 = task.delay(easeOutTime + 0.05, function() -- Line: 370 -- upvalues: teardownIK (upval)
            teardownIK()
        end)
    end
    local v1 = p2.delay or 0
    return function() -- Line: 378 -- upvalues: u3 (ref), cancelScheduled (val), u8 (ref), u4 (ref), easeOutAndDestroy (val)
        if u3 then
            return
        end
        u3 = true
        cancelScheduled()
        if u8 then
            u8:Cancel()
            u8 = nil
        end
        if u4 then
            easeOutAndDestroy()
        end
    end
end
local function computeLookAtLayerBlend(p1) -- Line: 456 -- upvalues: u68 (val), smoothstep01 (val)
    local v1 = u68[p1]
    if not v1 then
        return 1
    end
    local v2 = os.clock() - v1.startTime
    local v3 = v1.easeIn + v1.hold
    if 0 >= v1.easeIn then
        if v2 < v3 then
            return 0
        end
        if 0 < v1.easeOut then
            if v2 < v3 + v1.easeOut then
                return smoothstep01((v2 - v3) / v1.easeOut)
            end
            u68[p1] = nil
            return 1
        end
        u68[p1] = nil
        return 1
    end
    if v2 < v1.easeIn then
        return 1 - smoothstep01(v2 / v1.easeIn)
    end
    if v2 < v3 then
        return 0
    end
    if 0 >= v1.easeOut then
        u68[p1] = nil
        return 1
    end
    if v2 < v3 + v1.easeOut then
        return smoothstep01((v2 - v3) / v1.easeOut)
    end
    u68[p1] = nil
    return 1
end
local function suppressLookAtFor(p1, p2) -- Line: 480 -- upvalues: u68 (val)
    local easeInSec, easeOutSec, holdSec
    if not p2 then
        easeInSec = 0.18
    else
        easeInSec = p2.easeInSec
    end
    local v1 = math.max(0, easeInSec)
    if not p2 then
        holdSec = 0.85
    else
        holdSec = p2.holdSec
    end
    local v2 = math.max(0, holdSec)
    if not p2 then
        easeOutSec = 0.32
    else
        easeOutSec = p2.easeOutSec
        if not easeOutSec then
            easeOutSec = 0.32
        end
    end
    local v3 = math.max(0, easeOutSec)
    u68[p1] = {startTime = os.clock(), easeIn = v1, hold = v2, easeOut = v3}
end
local function cancelLookAtSuppression(p1) -- Line: 492 -- upvalues: u68 (val)
    u68[p1] = nil
end
local function dampAngle(p1, p2, p3, p4, p5) -- Line: 521
    local v1
    local v2 = 1 - math.exp(-p3 * p4)
    local v3 = math.clamp(v2, 0, 1)
    v2 = p1 + (p2 - p1) * v3
    local v4 = p5 * p4
    local v5 = v2 - p1
    if v5 == 0 then
        v1 = 0
    elseif 0 >= v5 then
        v1 = -1
    else
        v1 = 1
    end
    if v4 < math.abs(v5) then
        v2 = p1 + v1 * v4
    end
    return v2
end
local function twistAndNodMotorCF(p1, p2) -- Line: 534
    return CFrame.Angles(p2, -p1, 0)
end
local function applyBiteCorrection(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 540 -- upvalues: u72 (val), twistAndNodMotorCF (val)
    local correctionStrength = p7
    if not correctionStrength then
        correctionStrength = u72.correctionStrength
    end
    local maxCorrectionPull = p8
    if not maxCorrectionPull then
        maxCorrectionPull = u72.maxCorrectionPull
    end
    local v1 = math.clamp(p4 * correctionStrength, 0, maxCorrectionPull)
    if v1 <= 0.0001 then
        return p1
    end
    local v2 = math.clamp(p2, -p5, p5)
    local v3 = math.clamp(p3, -p6, p6)
    local v4 = CFrame.new(p1.Position)
    local v5 = v4 * twistAndNodMotorCF(v2, v3)
    return p1:Lerp(v5 * p1.Rotation, v1)
end
local function yawRotateXZUnit(p1, p2) -- Line: 569
    local v1 = math.cos(p2)
    local v2 = math.sin(p2)
    local X = p1.X
    local Z = p1.Z
    local v3 = X * v1 - Z * v2
    local v4 = X * v2 + Z * v1
    local v5 = math.sqrt(v3 * v3 + v4 * v4)
    if v5 < 1e-06 then
        return p1
    end
    return (Vector3.new(v3 / v5, 0, v4 / v5))
end
local function clearBiteAimRuntime(p1) -- Line: 582 -- upvalues: u70 (val)
    u70[p1] = nil
end
local function stableHeadOrigin(p1, p2) -- Line: 588
    local CFrame = p1.CFrame
    return CFrame.Position + CFrame.UpVector * p2
end
local function clampDirectionToCone(p1, p2, p3) -- Line: 595
    if p1.Magnitude < 1e-05 or p2.Magnitude < 1e-05 then
        return p1
    end
    local Unit = p1.Unit
    local Unit_2 = p2.Unit
    local v1 = Unit:Dot(Unit_2)
    if math.acos((math.clamp(v1, -1, 1))) <= p3 then
        return Unit
    end
    local v2 = Unit_2:Cross(Unit)
    if v2.Magnitude < 1e-05 then
        return Unit
    end
    return CFrame.fromAxisAngle(v2.Unit, p3) * Unit_2
end
local function computeClampedBiteLookGoal(p1, p2, p3, p4, p5, p6, p7) -- Line: 614 -- upvalues: stableHeadOrigin (val), flatXZUnit (val), bearingYawXZ (val), yawRotateXZUnit (val)
    local v1
    local v2 = stableHeadOrigin(p1, p2)
    local v3 = p3 - v2
    local v4 = v3.X * v3.X
    local v5 = math.sqrt(v4 + v3.Z * v3.Z)
    if v5 < 1 then
        return p3
    end
    local v6 = flatXZUnit(p1.CFrame.LookVector)
    v4 = Vector3.new(v3.X / v5, 0, v3.Z / v5)
    local v7 = bearingYawXZ(v6, v4)
    local v8 = math.rad(p4)
    v7 = math.clamp(v7, -v8, v8)
    local v9 = yawRotateXZUnit(v6, v7)
    local v10 = math.atan2(v3.Y, v5)
    local v11 = math.rad(p5)
    v10 = math.clamp(v10, -v11, (math.rad(p6)))
    local v12 = p7 or 0
    if 0 < v12 and v3.Y < -2 then
        v1 = math.clamp((-v3.Y - 2) / 14, 0, 1)
        v10 = math.max(v10 - math.rad(v12) * v1, -v11)
    end
    v1 = math.max(v5, 8)
    local v13 = math.tan(v10) * v1
    return v2 + v9 * v1 + Vector3.new(0, v13, 0)
end
local function resolvePlayerAimPartForBite(p1) -- Line: 832
    local UpperTorso = p1:FindFirstChild("UpperTorso")
    if not UpperTorso then
        UpperTorso = p1:FindFirstChild("HumanoidRootPart")
        if not UpperTorso then
            UpperTorso = p1:FindFirstChild("Torso")
            if not UpperTorso then
                UpperTorso = p1:FindFirstChild("Head")
            end
        end
    end
    return UpperTorso
end
return {
    createEasedIKControl = createEasedIKControl,
    createKinematicInfluence = function(p1, p2, p3, p4, p5) -- Line: 851 -- upvalues: u65 (val), Alive (val), createEasedIKControl (val)
        debug.profilebegin("KinematicTitanClient.createKinematicInfluence")
        local client = p1.model.client
        local u17 = client:FindFirstChild(p4 .. u65[p3].ChainRoot)
        local u25 = client:FindFirstChild(p4 .. u65[p3].EndEffector)
        if not u17 or not u25 then
            debug.profileend()
            return
        end
        local v1 = Alive.getAliveCharacter(p2)
        if not v1 then
            debug.profileend()
            return
        end
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            debug.profileend()
            return
        end
        local animator = p1.animator
        if animator then
            animator = p1.animator.Parent
        end
        if not animator then
            debug.profileend()
            return
        end
        local v2 = createEasedIKControl(animator, {
            smoothTime = 2,
            easeInSmoothTime = 0.03,
            weight = p5.weight,
            lifetime = p5.lifetime,
            delay = p5.delay,
            easing = p5.easing,
        }, function(p1) -- Line: 895 -- upvalues: HumanoidRootPart (val), p5 (val), client (val), u17 (val), u25 (val)
            local UpperTorso
            p1.Target = HumanoidRootPart
            if not p5.useUpperTorso then
                UpperTorso = u17
            else
                UpperTorso = client:FindFirstChild("UpperTorso")
                if not UpperTorso then
                    UpperTorso = u17
                end
            end
            p1.ChainRoot = UpperTorso
            p1.EndEffector = u25
            p1.Type = Enum.IKControlType.Position
        end)
        debug.profileend()
        return v2
    end,
    createLookAtInfluence = function(p1, p2, p3) -- Line: 912 -- upvalues: Alive (val), createEasedIKControl (val)
        debug.profilebegin("KinematicTitanClient.createLookAtInfluence")
        local client = p1.model.client
        local UpperTorso = client:FindFirstChild("UpperTorso")
        local Head = client:FindFirstChild("Head")
        if not UpperTorso or not Head then
            debug.profileend()
            return nil
        end
        local v1 = Alive.getAliveCharacter(p2)
        if not v1 then
            debug.profileend()
            return nil
        end
        local UpperTorso_2 = v1:FindFirstChild("UpperTorso")
        if not UpperTorso_2 then
            UpperTorso_2 = v1:FindFirstChild("Torso")
            if not UpperTorso_2 then
                UpperTorso_2 = v1:FindFirstChild("HumanoidRootPart")
            end
        end
        if not UpperTorso_2 then
            debug.profileend()
            return nil
        end
        local animator = p1.animator
        if animator then
            animator = p1.animator.Parent
        end
        if not animator then
            debug.profileend()
            return nil
        end
        local v2 = createEasedIKControl(animator, {
            weight = p3.weight,
            lifetime = p3.lifetime,
            delay = p3.delay,
            smoothTime = p3.smoothTime or 0.175,
            easeInSmoothTime = p3.smoothTime or 0.12,
            easing = p3.easing,
        }, function(p1) -- Line: 958 -- upvalues: UpperTorso (val), Head (val), UpperTorso_2 (val)
            p1.Type = Enum.IKControlType.LookAt
            p1.ChainRoot = UpperTorso
            p1.EndEffector = Head
            p1.Target = UpperTorso_2
        end)
        debug.profileend()
        return v2
    end,
    createBiteIKInfluence = function(p1, p2, p3) -- Line: 975 -- upvalues: Players (val), Alive (val), resolvePlayerAimPartForBite (val), suppressLookAtFor (val), createEasedIKControl (val)
        debug.profilebegin("KinematicTitanClient.createBiteIKInfluence")
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer or p2 ~= LocalPlayer then
            debug.profileend()
            return nil
        end
        local client = p1.model.client
        local UpperTorso = client:FindFirstChild("UpperTorso")
        local Head = client:FindFirstChild("Head")
        if not UpperTorso or not Head then
            debug.profileend()
            return nil
        end
        local v1 = Alive.getAliveCharacter(p2)
        if not v1 then
            debug.profileend()
            return nil
        end
        local u27 = resolvePlayerAimPartForBite(v1)
        if not u27 then
            debug.profileend()
            return nil
        end
        local animator = p1.animator
        if animator then
            animator = p1.animator.Parent
        end
        if not animator then
            debug.profileend()
            return nil
        end
        local v2 = math.max(0, p3.easing.easeInTime)
        local v3 = math.max(0, p3.easing.easeOutTime)
        suppressLookAtFor(p1.id, {easeInSec = v2, holdSec = p3.lifetime, easeOutSec = v3})
        local v4 = createEasedIKControl(animator, {
            retainSmoothTimeOnEaseIn = true,
            weight = p3.weight,
            lifetime = p3.lifetime,
            delay = p3.delay,
            smoothTime = p3.smoothTime or 0.28,
            easing = p3.easing,
        }, function(p1) -- Line: 1026 -- upvalues: UpperTorso (val), Head (val), u27 (val)
            p1.Type = Enum.IKControlType.LookAt
            p1.ChainRoot = UpperTorso
            p1.EndEffector = Head
            p1.Target = u27
        end)
        debug.profileend()
        return v4
    end,
    createBiteAimInfluence = function(p1, p2, p3) -- Line: 1044 -- upvalues: Players (val), Alive (val), u72 (val), clearBiteAimRuntime (val), cancelLookAtSuppression (val), suppressLookAtFor (val), smoothstep01 (val), resolvePlayerAimPartForBite (val), computeClampedBiteLookGoal (val), RunService (val), resolveNeckMotor (val), stableHeadOrigin (val), u70 (val), u71 (val), mergeBiteIkTuning (val), flatXZUnit (val), bearingYawXZ (val), dampAngle (val), applyBiteCorrection (val), clampDirectionToCone (val)
        local C0, Root, root
        debug.profilebegin("KinematicTitanClient.createBiteAimInfluence")
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer or p2 ~= LocalPlayer then
            debug.profileend()
            return nil
        end
        local client = p1.model.client
        local UpperTorso = client:FindFirstChild("UpperTorso")
        local Head = client:FindFirstChild("Head")
        if not UpperTorso or not Head or not (UpperTorso:IsA("BasePart")) or not (Head:IsA("BasePart")) or not (Alive.getAliveCharacter(p2)) then
            debug.profileend()
            return nil
        end
        if typeof(p1.root) ~= "Instance" then
            root = UpperTorso
        elseif p1.root:IsA("BasePart") then
            root = p1.root
        end
        local v1 = Head.Position - root.Position
        local u54 = v1:Dot(root.CFrame.UpVector)
        local u55 = false
        local u56 = false
        local u57 = false
        local u58 = 0
        local u65 = ("BiteAimIK_%*"):format(p1.id)
        local u72 = math.clamp(p3.lookAtWeight, 0, 1)
        local u74 = p3.delay or 0
        local u76 = p3.targetYOffsetStuds or 0
        local v2 = u72.maxWaistYawDeg + u72.maxNeckYawDeg
        local v3 = p3.maxYawDeg or v2
        local u86 = math.min(v3, v2)
        local maxPitchDownDeg = p3.maxPitchDownDeg
        if not maxPitchDownDeg then
            maxPitchDownDeg = u72.maxPitchDownDeg
        end
        local maxPitchUpDeg = p3.maxPitchUpDeg
        if not maxPitchUpDeg then
            maxPitchUpDeg = u72.maxPitchUpDeg
        end
        local u96 = p3.pitchDownBiasDeg or 0
        local u98 = p3.goalSmoothing or 14
        local u100 = p3.leadTimeSec or 0
        local v4 = p3.lowerTorsoWeight or 0.2
        local u106 = math.clamp(v4, 0, 1)
        local u112 = (p3.closeFadeNearFrac or 0.4) * p1.scale
        local v5 = p3.closeFadeFarFrac or 0.8
        local u116 = v5 * p1.scale
        local LowerTorso = client:FindFirstChild("LowerTorso")
        if not LowerTorso then
            Root = nil
        else
            Root = LowerTorso:FindFirstChild("Root")
        end
        if not Root then
            C0 = nil
        else
            C0 = Root.C0
        end
        local u139 = math.max(0, p3.easing.easeInTime)
        local u144 = math.max(0, p3.easing.easeOutTime)
        local u146 = os.clock()
        local u147 = nil
        clearBiteAimRuntime(p1.id)
        cancelLookAtSuppression(p1.id)
        suppressLookAtFor(p1.id, {easeInSec = u139, holdSec = p3.lifetime + u144 + 0.1, easeOutSec = u144})
        local function computeActiveBlend(p1) -- Line: 1115 -- upvalues: u57 (ref), u144 (val), u58 (ref), u72 (val), smoothstep01 (upval), u74 (val), u139 (val), p3 (val)
            local v1
            if u57 then
                if u144 <= 0 then
                    return 0
                end
                local v2 = os.clock() - u58
                v1 = math.clamp(v2 / u144, 0, 1)
                return u72 * (1 - smoothstep01(v1))
            end
            if p1 < u74 then
                return 0
            end
            v1 = p1 - u74
            if 0 >= u139 then
                if v1 < p3.lifetime - u144 then
                    return u72
                end
                if 0 < u144 then
                    if v1 < p3.lifetime then
                        return u72 * (1 - smoothstep01((v1 - (p3.lifetime - u144)) / u144))
                    end
                    return 0
                end
                return 0
            end
            if v1 < u139 then
                return u72 * smoothstep01(v1 / u139)
            end
            if v1 < p3.lifetime - u144 then
                return u72
            end
            if 0 >= u144 then
                return 0
            end
            if v1 < p3.lifetime then
                return u72 * (1 - smoothstep01((v1 - (p3.lifetime - u144)) / u144))
            end
            return 0
        end
        local function resolveLookGoal() -- Line: 1143 -- upvalues: Alive (upval), p2 (val), resolvePlayerAimPartForBite (upval), client (val), u76 (val), u100 (val), computeClampedBiteLookGoal (upval), root (val), u54 (val), u86 (val), maxPitchDownDeg (val), maxPitchUpDeg (val), u96 (val)
            local v1 = Alive.getAliveCharacter(p2)
            if not v1 then
                return nil
            end
            local v2 = resolvePlayerAimPartForBite(v1)
            if not v2 then
                return nil
            end
            local Head = client:FindFirstChild("Head")
            if not Head or not (client:FindFirstChild("UpperTorso")) then
                return nil
            end
            local v3 = v2.Position + Vector3.new(0, u76, 0)
            if 0 < u100 then
                local v4 = v2.AssemblyLinearVelocity * u100
                if 3 < v4.Magnitude then
                    v4 = v4.Unit * 3
                end
                v3 = v3 + v4
            end
            return computeClampedBiteLookGoal(root, u54, v3, u86, maxPitchDownDeg, maxPitchUpDeg, u96)
        end
        local function finishBiteAim() -- Line: 1181 -- upvalues: u56 (ref), RunService (upval), u65 (val), Root (val), C0 (val), clearBiteAimRuntime (upval), p1 (val)
            if u56 then
                return
            end
            u56 = true
            pcall(function() -- Line: 1186 -- upvalues: RunService (upval), u65 (upval)
                RunService:UnbindFromRenderStep(u65)
            end)
            if Root and C0 then
                Root.C0 = C0
            end
            clearBiteAimRuntime(p1.id)
        end
        local function onDisableBiteAim() -- Line: 1195 -- upvalues: u55 (ref), u57 (ref), u72 (val), finishBiteAim (val), u58 (ref), u144 (val)
            if u55 then
                return
            end
            u55 = true
            if u57 or u72 <= 0 then
                finishBiteAim()
                return
            end
            u57 = true
            u58 = os.clock()
            task.delay(u144 + 0.08, function() -- Line: 1208 -- upvalues: finishBiteAim (upval)
                finishBiteAim()
            end)
        end
        RunService:BindToRenderStep(u65, Enum.RenderPriority.Last.Value, function(a1) -- Line: 1213 -- upvalues: u55 (ref), u57 (ref), Head (ref), UpperTorso (ref), onDisableBiteAim (val), resolveNeckMotor (upval), client (val), u146 (val), computeActiveBlend (val), resolveLookGoal (val), u147 (ref), u98 (val), u116 (val), u112 (val), stableHeadOrigin (upval), root (val), u54 (val), smoothstep01 (upval), u70 (upval), p1 (val), u71 (upval), mergeBiteIkTuning (upval), p3 (val), flatXZUnit (upval), bearingYawXZ (upval), dampAngle (upval), Root (val), C0 (val), u106 (val), applyBiteCorrection (upval), clampDirectionToCone (upval), u74 (val), u58 (ref), finishBiteAim (val)
            if not u55 then
                local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
                if not Head.Parent or not UpperTorso.Parent then
                    onDisableBiteAim()
                    return
                end
                local u11 = resolveNeckMotor(client, UpperTorso, Head)
                local Waist = UpperTorso:FindFirstChild("Waist")
                if not u11 then
                    return
                end
                local u25 = math.clamp(a1, 0.004166666666666667, 0.05)
                local v12 = os.clock() - u146
                local v13 = computeActiveBlend(v12)
                local v14 = resolveLookGoal()
                if v14 then
                    local v15 = 1 - math.exp(-u98 * u25)
                    local v16 = math.clamp(v15, 0, 1)
                    u147 = (u147 or v14):Lerp(v14, v16)
                end
                if 0 < v13 and u147 and u112 < u116 then
                    v1 = (u147 - stableHeadOrigin(root, u54)).Magnitude - u112
                    local v17 = v1 / (u116 - u112)
                    v13 = v13 * smoothstep01((math.clamp(v17, 0, 1)))
                end
                local u80 = u70[p1.id]
                if not u80 then
                    u70[p1.id] = {
                        waistYaw = 0,
                        waistPitch = 0,
                        rootYaw = 0,
                        rootPitch = 0,
                        neckYaw = 0,
                        neckPitch = 0,
                    }
                end
                local u87 = u71[p1.id]
                if not u87 then
                    return
                end
                local u91 = mergeBiteIkTuning(p3.ikTuning)
                v1 = stableHeadOrigin(root, u54):Lerp(Head.Position, u91.neckAnchorAnimBlend)
                local v18 = math.rad(u91.maxWaistYawDeg)
                local v19 = math.rad(u91.maxWaistPitchDeg)
                local v20 = if 0 < v13 then u147 ~= nil else false
                local v21 = 0
                local v22 = 0
                if v20 and u147 then
                    v2 = u147 - UpperTorso.Position
                    v5 = v2.X * v2.X
                    v3 = math.sqrt(v5 + v2.Z * v2.Z)
                    if 0.06 < v3 then
                        v4 = Vector3.new(v2.X / v3, 0, v2.Z / v3)
                        v5 = flatXZUnit(UpperTorso.CFrame.LookVector)
                        v6 = u80.waistYaw + bearingYawXZ(v5, v4) * u91.waistYawFraction
                        v21 = math.clamp(v6, -v18, v18)
                        local LookVector = UpperTorso.CFrame.LookVector
                        v7 = math.sqrt(LookVector.X * LookVector.X + LookVector.Z * LookVector.Z)
                        v6 = math.max(v7, 0.0001)
                        v7 = math.atan2(LookVector.Y, v6)
                        v8 = math.atan2(v2.Y, v3)
                        v9 = 0
                        if v8 < 0 then
                            v11 = -v8 / math.rad(40)
                            v10 = math.clamp(v11, 0.2, 1)
                            v9 = -math.rad(u91.waistCommitPitchDeg) * v10
                        end
                        v22 = math.clamp(u80.waistPitch + (v8 - v7) * u91.waistPitchFraction + v9, -v19, (math.rad(u91.maxWaistBackPitchDeg)))
                    end
                end
                v2 = math.rad(u91.angleMaxSpeedDeg)
                if not v20 then
                    v5 = 0
                else
                    v5 = v21
                end
                u80.waistYaw = dampAngle(u80.waistYaw, v5, u91.angleDamping, u25, v2)
                if not v20 then
                    v5 = 0
                else
                    v5 = v22
                end
                u80.waistPitch = dampAngle(u80.waistPitch, v5, u91.angleDamping, u25, v2)
                v3 = math.rad(u91.maxRootYawDeg)
                v4 = math.rad(u91.maxRootPitchDeg)
                v5 = 0
                local v23 = 0
                if v20 and u147 and Root and C0 then
                    local v24 = u147 - root.Position
                    v8 = v24.X * v24.X
                    v6 = math.sqrt(v8 + v24.Z * v24.Z)
                    if 0.06 < v6 then
                        v7 = Vector3.new(v24.X / v6, 0, v24.Z / v6)
                        v8 = flatXZUnit(root.CFrame.LookVector)
                        v10 = bearingYawXZ(v8, v7) * u91.rootYawFraction
                        v5 = math.clamp(v10, -v3, v3)
                        local LookVector_2 = root.CFrame.LookVector
                        v11 = math.sqrt(LookVector_2.X * LookVector_2.X + LookVector_2.Z * LookVector_2.Z)
                        v10 = math.max(v11, 0.0001)
                        v11 = math.atan2(LookVector_2.Y, v10)
                        local v25 = (math.atan2(v24.Y, v6) - v11) * u91.rootPitchFraction
                        v23 = math.clamp(v25, -v4, v4)
                    end
                end
                if not v20 then
                    v7 = 0
                else
                    v7 = v5
                end
                u80.rootYaw = dampAngle(u80.rootYaw, v7, u91.angleDamping, u25, v2)
                if not v20 then
                    v7 = 0
                else
                    v7 = v23
                end
                u80.rootPitch = dampAngle(u80.rootPitch, v7, u91.angleDamping, u25, v2)
                local function easeNeckC0ToBind() -- Line: 1358 -- upvalues: u80 (ref), u91 (val), u25 (ref), u87 (val), u11 (val)
                    if not u80.neckC0Smoothed then
                        u11.C0 = u87.neck
                        return
                    end
                    local v1 = 1 - math.exp(-u91.neckC0Damping * u25)
                    local v2 = math.clamp(v1, 0, 1)
                    v1 = u80.neckC0Smoothed:Lerp(u87.neck, v2)
                    u80.neckC0Smoothed = v1
                    u11.C0 = v1
                end
                if 0 >= v13 then
                    u80.neckC0Smoothed = nil
                    u80.aimDirSmoothed = nil
                    u11.C0 = u87.neck
                    if Waist then
                        Waist.C0 = u87.waist
                    end
                    if Root and C0 then
                        Root.C0 = C0
                    end
                else
                    if Root and C0 and 0 < u106 then
                        Root.C0 = applyBiteCorrection(C0, u80.rootYaw, u80.rootPitch, v13 * u106, v3, v4, u91.correctionStrength, u91.maxCorrectionPull)
                    end
                    if Waist then
                        Waist.C0 = applyBiteCorrection(u87.waist, u80.waistYaw, u80.waistPitch, v13, v18, v19, u91.correctionStrength, u91.maxCorrectionPull)
                    end
                    v7 = v13 * u91.neckLookAtMix
                    if not v20 then
                        u80.aimDirSmoothed = nil
                        easeNeckC0ToBind()
                    elseif u147 and 0.0001 < v7 then
                        v8 = u147 - v1
                        if 0.5 >= v8.Magnitude then
                            u80.aimDirSmoothed = nil
                            easeNeckC0ToBind()
                        else
                            local Unit = v8.Unit
                            v11 = 1 - math.exp(-u91.aimDirDamping * u25)
                            v9 = math.clamp(v11 * (0.45 + 0.55 * v7), 0, 1)
                            if not u80.aimDirSmoothed then
                                u80.aimDirSmoothed = Unit
                            else
                                u80.aimDirSmoothed = u80.aimDirSmoothed:Lerp(Unit, v9)
                                if 0.0001 >= u80.aimDirSmoothed.Magnitude then
                                    u80.aimDirSmoothed = Unit
                                else
                                    u80.aimDirSmoothed = u80.aimDirSmoothed.Unit
                                end
                            end
                            local CFrame = UpperTorso.CFrame
                            local v26 = clampDirectionToCone(u80.aimDirSmoothed or Unit, CFrame.LookVector, (math.rad(u91.maxNeckConeDeg)))
                            local Transform = u11.Transform
                            local v27 = CFrame.Rotation:Inverse() * CFrame.lookAt(Vector3.zero, v26).Rotation
                            local v28 = v27 * (Transform * u11.C1:Inverse()).Rotation:Inverse()
                            v27 = CFrame.new(u87.neck.Position) * v28
                            ;(function(p1, p2) -- Line: 1348 -- upvalues: u87 (val), u80 (ref), u91 (val), u25 (ref), u11 (val)
                                local v1 = u87.neck:Lerp(p1, p2)
                                local neckC0Smoothed = u80.neckC0Smoothed
                                if not neckC0Smoothed then
                                    neckC0Smoothed = u87.neck
                                end
                                local v2 = 1 - math.exp(-u91.neckC0Damping * u25)
                                local v3 = math.clamp(v2 * (p2 * 0.6 + 0.4), 0, 1)
                                local v4 = neckC0Smoothed:Lerp(v1, v3)
                                u80.neckC0Smoothed = v4
                                u11.C0 = v4
                            end)(v27, v7)
                        end
                    end
                end
                if not u57 and u74 + p3.lifetime <= v12 then
                    u55 = true
                    u57 = true
                    u58 = os.clock()
                end
                if u57 and v13 <= 0 then
                    finishBiteAim()
                end
                return
            elseif not u57 then
                return
            end
        end)
        debug.profileend()
        return onDisableBiteAim
    end,
    updateKinematicLookAt = function(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 700 -- upvalues: u71 (val), resolveNeckMotor (val), u61 (val), proximityLookSpeedMultiplier (val), flatXZUnit (val), bearingYawXZ (val), pitchFromTorsoToward (val), u69 (val), dampAngle (val), computeLookAtLayerBlend (val), twistAndNodMotorCF (val)
        local v1, v2, v3, v4, v5, v6, zero
        debug.profilebegin("KinematicTitanClient.updateKinematicLookAt")
        if not (u71[p1.id]) then
            debug.profileend()
            return
        end
        if p3 ~= p3 then
            v1 = 0.016666666666666666
        elseif p3 > 0 then
            v1 = p3
        end
        local client = p1.model.client
        local UpperTorso = client:FindFirstChild("UpperTorso")
        local Head = client:FindFirstChild("Head")
        if not UpperTorso or not Head or not (client:FindFirstChild("LowerTorso")) then
            debug.profileend()
            return
        end
        local v7 = resolveNeckMotor(client, UpperTorso, Head)
        local Waist = UpperTorso:FindFirstChild("Waist")
        if not v7 or not Waist then
            debug.profileend()
            return
        end
        local neck = u71[p1.id].neck
        local waist = u71[p1.id].waist
        local v8 = p6
        if not v8 then
            v8 = u61
        end
        local v9 = proximityLookSpeedMultiplier(v8, p4)
        local v10 = v8.angleDamping * v9
        local v11 = math.rad(v8.maxAngleSpeedDeg) * v9
        local v12 = if typeof(p2) == "Vector3" then 0 < p2.Magnitude else false
        if not v12 then
            zero = Vector3.zero
        else
            zero = p2 - Head.CFrame.Position
        end
        local v13 = math.rad(v8.maxYawDeg)
        local v14 = math.rad(v8.maxPitchUpDeg)
        local v15 = math.rad(v8.maxPitchDownDeg)
        local v16 = 0
        local v17 = 0
        local v18 = 0
        local v19 = 0
        if v12 and v8.minWorldDistance <= zero.Magnitude then
            local LookVector
            v2 = math.sqrt(zero.X * zero.X + zero.Z * zero.Z)
            if p8 then
                LookVector = Head.CFrame.LookVector
            elseif not p7 then
                LookVector = p1.root.CFrame.LookVector
            else
                LookVector = UpperTorso.CFrame.LookVector
            end
            v3 = flatXZUnit(LookVector)
            v4 = 0
            if 0.06 < v2 then
                v5 = Vector3.new(zero.X / v2, 0, zero.Z / v2)
                v4 = bearingYawXZ(v3, v5)
            end
            v4 = math.clamp(v4, -v13, v13)
            v5 = math.clamp(math.atan2(zero.Y, (math.max(v2, 1e-05))), -v15, v14)
            v18 = v4 * v8.waistYawFraction
            v19 = v5 * v8.waistPitchFraction
            v16 = v4 * v8.neckYawFraction
            if not p8 then
                v6 = pitchFromTorsoToward(UpperTorso, zero.Unit)
            else
                v6 = v5
            end
            v6 = math.clamp(v6, -v15, v14)
            v17 = v6 * v8.neckPitchFraction
        end
        v2 = u69[p1.id]
        if not v2 then
            u69[p1.id] = {localNeckYaw = 0, localNeckPitch = 0, localWaistYaw = 0, localWaistPitch = 0}
        end
        v3 = math.abs(v16 - v2.localNeckYaw)
        local v20 = math.max(v3, (math.abs(v18 - v2.localWaistYaw)))
        v3 = if 0 < v8.largeYawErrorRefRad and 1 < v8.largeYawErrorBoost then math.clamp(1 + v20 / v8.largeYawErrorRefRad * (v8.largeYawErrorBoost - 1), 1, v8.largeYawErrorBoost) else 1
        v4 = v10 * v3
        v5 = v11 * v3
        v2.localNeckYaw = dampAngle(v2.localNeckYaw, v16, v4, v1, v5)
        v2.localWaistYaw = dampAngle(v2.localWaistYaw, v18, v4, v1, v5)
        v2.localNeckPitch = dampAngle(v2.localNeckPitch, v17, v10, v1, v11)
        v2.localWaistPitch = dampAngle(v2.localWaistPitch, v19, v10, v1, v11)
        local v21 = computeLookAtLayerBlend(p1.id)
        v6 = v21 * math.clamp(p5 or 1, 0, 1)
        v21 = twistAndNodMotorCF(v2.localNeckYaw, v2.localNeckPitch)
        local v22 = twistAndNodMotorCF(v2.localWaistYaw, v2.localWaistPitch)
        v7.C0 = neck:Lerp(neck * v21, v6)
        Waist.C0 = waist:Lerp(waist * v22, v6)
        debug.profileend()
    end,
    setKinematicOrigins = function(p1, p2) -- Line: 662 -- upvalues: resolveNeckMotor (val), u71 (val)
        debug.profilebegin("KinematicTitanClient.setKinematicOrigins")
        local UpperTorso = p1:FindFirstChild("UpperTorso")
        local Head = p1:FindFirstChild("Head")
        if not UpperTorso or not Head then
            debug.profileend()
            return
        end
        local v1 = resolveNeckMotor(p1, UpperTorso, Head)
        local Waist = UpperTorso:FindFirstChild("Waist")
        if not v1 or not Waist then
            debug.profileend()
            return
        end
        u71[p2] = {neck = v1.C0, waist = Waist.C0}
        debug.profileend()
    end,
    clearLookAtStateForTitanId = function(p1) -- Line: 821 -- upvalues: u69 (val), u71 (val), u68 (val), u70 (val)
        debug.profilebegin("KinematicTitanClient.clearLookAtStateForTitanId")
        u69[p1] = nil
        u71[p1] = nil
        u68[p1] = nil
        u70[p1] = nil
        debug.profileend()
    end,
    suppressLookAtFor = suppressLookAtFor,
    cancelLookAtSuppression = cancelLookAtSuppression,
    snapLookAtMotorsToBindPose = function(p1) -- Line: 498 -- upvalues: cancelLookAtSuppression (val), u69 (val), u71 (val), resolveNeckMotor (val)
        cancelLookAtSuppression(p1.id)
        u69[p1.id] = nil
        local v1 = u71[p1.id]
        if not v1 then
            return
        end
        local client = p1.model.client
        local UpperTorso = client:FindFirstChild("UpperTorso")
        local Head = client:FindFirstChild("Head")
        if not UpperTorso or not Head then
            return
        end
        local v2 = resolveNeckMotor(client, UpperTorso, Head)
        local Waist = UpperTorso:FindFirstChild("Waist")
        if v2 then
            v2.C0 = v1.neck
        end
        if Waist then
            Waist.C0 = v1.waist
        end
    end,
    LookAtTuning = u61,
}