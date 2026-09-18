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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Anger.LongRangeBite
--                               Dumped in 0.00132 seconds
--                          Bytecode version 9  |  15 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local DetectionBoxTitanClient = require(Utilities_3:WaitForChild("DetectionBoxTitanClient"))
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_4:WaitForChild("HitboxTitanClient"))
local Utilities_5 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_5:WaitForChild("KinematicTitanClient"))
local v3 = {
    debounce = 0,
    distance = 1.28,
    indicate = false,
    useClosestBodyPart = true,
    facingFrom = "Head",
    facingPlane = "horizontal",
}
local u153 = {
    box = "LongRangeBite",
    impactAt = 0.17798,
    activeWindow = 0.14,
    innerBoxScale = 0.88,
    proximityDistance = 60,
    proximityBoxScale = 1.4,
    proximityPlane = "horizontal",
    proximityUsePrediction = false,
    proximityFirst = true,
    mouthReachDistance = 2.1,
    mouthReachUseClosestBodyPart = true,
    mouthReachAtImpactSample = true,
    mouthReachBestWindowSample = true,
    grappleImpactWhileOnGear = true,
    grappleHorizontalInner = true,
    grappleHorizontalInnerScale = 1.32,
    grappleHorizontalLateralScale = 2.1,
    grappleImpactCenterOnly = true,
    playerSpeedMin = 15,
    playerSpeedMax = 240,
    animSpeedMin = 0.75,
    animSpeedMax = 1.05,
}
local function safeCancelThread(p1) -- Line: 78
    if not p1 or coroutine.running() == p1 then
        return
    end
    pcall(task.cancel, p1)
end
local function getBiteAnimSpeed() -- Line: 95 -- upvalues: Character (val), u153 (val)
    local Magnitude
    local v1 = Character.getCharacter()
    local HumanoidRootPart = v1
    if HumanoidRootPart then
        HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        Magnitude = 100
    else
        Magnitude = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
    end
    local v2 = u153.playerSpeedMin or 15
    local v3 = u153.animSpeedMin or 0.75
    local v4 = u153.animSpeedMax or 1.05
    local v5 = v3 + (Magnitude - v2) * (v4 - v3) / ((u153.playerSpeedMax or 240) - v2)
    return (math.clamp(v5, v3, v4))
end
local function getGrappleMouthStudsBonus(p1) -- Line: 111
    return math.max(0, 27 - p1.scale) * 0.65
end
local function isOnGearGrapple() -- Line: 120 -- upvalues: ClientGearHandler (val)
    local v1 = ClientGearHandler.getGearState()
    local enabled = false
    if v1 ~= nil then
        enabled = v1.enabled
        if enabled then
            enabled = v1.grapples.left.active
            if not enabled then
                enabled = v1.grapples.right.active
            end
        end
    end
    return enabled
end
local function getExecuteMouthHitboxDistance(p1) -- Line: 130 -- upvalues: isOnGearGrapple (val), getGrappleMouthStudsBonus (val)
    if not (isOnGearGrapple()) then
        return 1.28
    end
    local v1 = getGrappleMouthStudsBonus(p1)
    return 1.28 + v1 / p1.scale
end
local function getBiteHitboxDelay() -- Line: 142 -- upvalues: getBiteAnimSpeed (val)
    return 0.3 / getBiteAnimSpeed()
end
local function getBiteHitboxMissDelay() -- Line: 150 -- upvalues: getBiteHitboxDelay (val)
    return getBiteHitboxDelay() + 0.5
end
local function predictClosestMouthApproach(p1) -- Line: 160 -- upvalues: Character (val), getBiteHitboxDelay (val)
    local v1
    local client = p1.model.client
    local Mouth = client
    if Mouth then
        Mouth = client:FindFirstChild("Mouth")
    end
    if not Mouth then
        return nil
    end
    local v2 = Character.getCharacter()
    local HumanoidRootPart = v2
    if HumanoidRootPart then
        HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return nil
    end
    local Position = HumanoidRootPart.Position
    local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
    local v3 = Mouth.Position - Position
    local v4 = AssemblyLinearVelocity:Dot(AssemblyLinearVelocity)
    if 1 >= v4 then
        v1 = 0
    else
        local v5 = v3:Dot(AssemblyLinearVelocity) / v4
        v1 = math.clamp(v5, 0, (getBiteHitboxDelay()))
    end
    return (Mouth.Position - (Position + AssemblyLinearVelocity * v1)).Magnitude
end
return {
    priority = 1,
    detection = u153,
    attempt = function(p1) -- Line: 297 -- upvalues: DetectionBoxTitanClient (val), u153 (val), CooldownTitanClient (val), predictClosestMouthApproach (val), getExecuteMouthHitboxDistance (val)
        local v1, v2
        v1, v2 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u153)
        local v3 = {"LongRangeBiteAttempt", "LongRangeBite"}
        if CooldownTitanClient.isOnCooldown(p1, v3) or not v1 or not v2 then
            return false
        end
        local v4 = predictClosestMouthApproach(p1)
        local v5 = getExecuteMouthHitboxDistance(p1)
        if not v4 or v5 * p1.scale * 1.08 < v4 or CooldownTitanClient.isOnCooldown(p1, "Bite") or math.random() < 0.9 then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, "LongRangeBiteAttempt", 1)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 1)
        return true, v2
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 195 -- upvalues: CooldownTitanClient (val), getBiteHitboxDelay (val), getBiteAnimSpeed (val), getExecuteMouthHitboxDistance (val), KinematicTitanClient (val), HitboxTitanClient (val), safeCancelThread (val), getBiteHitboxMissDelay (val)
        CooldownTitanClient.addClientCooldown(p1, "LongRangeBite", 2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 4)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 1.5)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 1.5)
        local v1 = getBiteHitboxDelay()
        local v2 = getExecuteMouthHitboxDistance(p1)
        local v3 = KinematicTitanClient.createBiteAimInfluence(p1, p3, {
            lookAtWeight = 0.95,
            delay = 0,
            targetYOffsetStuds = 0,
            maxYawDeg = 128,
            maxPitchDownDeg = 62,
            maxPitchUpDeg = 32,
            pitchDownBiasDeg = 10,
            goalSmoothing = 13,
            leadTimeSec = 0.24,
            lowerTorsoWeight = 0.85,
            lifetime = 0.833 / getBiteAnimSpeed(),
            ikTuning = {
                waistYawFraction = 0.98,
                waistPitchFraction = 0.78,
                neckLookAtMix = 0.97,
                waistCommitPitchDeg = 22,
                rootYawFraction = 1,
                rootPitchFraction = 0,
                maxRootYawDeg = 90,
                maxRootPitchDeg = 0,
                angleDamping = 10.5,
                angleMaxSpeedDeg = 180,
                aimDirDamping = 29,
                neckC0Damping = 23,
                correctionStrength = 0.95,
                maxCorrectionPull = 1,
            },
            easing = {easeInTime = 0.07, easeOutTime = 0.3},
        })
        if v3 then
            p2:Add(v3)
        end
        local u56 = HitboxTitanClient.createMouthHitbox(p1, {
            debounce = 0,
            indicate = false,
            useClosestBodyPart = true,
            facingFrom = "Head",
            facingPlane = "horizontal",
            distance = v2,
            delayed = v1,
        })
        local u57 = false
        local u58 = nil
        local function finish() -- Line: 264 -- upvalues: u57 (ref), safeCancelThread (upval), u58 (ref)
            if u57 then
                return
            end
            u57 = true
            safeCancelThread(u58)
            u58 = nil
        end
        u56.touched:Connect(function(p1) -- Line: 273 -- upvalues: finish (val), p4 (val), u56 (val)
            finish()
            p4(p1)
            u56.destroy()
        end)
        p2:Add(function() -- Line: 284 -- upvalues: finish (val), u56 (val)
            finish()
            u56.destroy()
        end)
        return true
    end,
}