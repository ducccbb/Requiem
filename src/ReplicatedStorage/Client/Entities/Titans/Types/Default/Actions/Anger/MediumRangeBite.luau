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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Anger.MediumRangeBite
--                               Dumped in 0.00120 seconds
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
local v3 = {
    debounce = 0,
    distance = 1.22,
    indicate = true,
    useClosestBodyPart = true,
    requireFacingDot = 0.15,
    facingFrom = "Head",
    facingPlane = "horizontal",
    debugLabel = "MediumRangeBite",
}
local u138 = {
    box = "MediumRangeBite",
    impactAt = 0.20225,
    activeWindow = 0.14,
    innerBoxScale = 0.88,
    proximityDistance = 58,
    proximityBoxScale = 1.5,
    proximityPlane = "horizontal",
    proximityUsePrediction = false,
    proximityFirst = true,
    mouthReachDistance = 1.95,
    mouthReachUseClosestBodyPart = true,
    mouthReachAtImpactSample = true,
    mouthReachBestWindowSample = true,
    grappleImpactWhileOnGear = true,
    grappleHorizontalInner = true,
    grappleHorizontalInnerScale = 1.25,
    grappleHorizontalLateralScale = 1.8,
    grappleImpactCenterOnly = true,
    playerSpeedMin = 15,
    playerSpeedMax = 240,
    animSpeedMin = 0.75,
    animSpeedMax = 1.05,
    debugHistory = false,
    debug = false,
}
local function getBiteAnimSpeed() -- Line: 85 -- upvalues: Character (val), u138 (val)
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
    local v2 = u138.playerSpeedMin or 15
    local v3 = u138.animSpeedMin or 0.75
    local v4 = u138.animSpeedMax or 1.05
    local v5 = v3 + (Magnitude - v2) * (v4 - v3) / ((u138.playerSpeedMax or 240) - v2)
    return (math.clamp(v5, v3, v4))
end
local function getGrappleMouthStudsBonus(p1) -- Line: 103
    return math.max(0, 27 - p1.scale) * 0.65
end
local function isOnGearGrapple() -- Line: 112 -- upvalues: ClientGearHandler (val)
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
local function getExecuteMouthHitboxDistance(p1) -- Line: 122 -- upvalues: isOnGearGrapple (val), getGrappleMouthStudsBonus (val)
    if not (isOnGearGrapple()) then
        return 1.22
    end
    local v1 = getGrappleMouthStudsBonus(p1)
    return 1.22 + v1 / p1.scale
end
local function getBiteHitboxDelay() -- Line: 134 -- upvalues: getBiteAnimSpeed (val)
    return 0.3 / getBiteAnimSpeed()
end
local function getBiteHitboxMissDelay() -- Line: 142 -- upvalues: getBiteHitboxDelay (val)
    return getBiteHitboxDelay() + 0.5
end
local function safeCancelThread(p1) -- Line: 151
    if not p1 or coroutine.running() == p1 then
        return
    end
    pcall(task.cancel, p1)
end
local function predictClosestMouthApproach(p1) -- Line: 168 -- upvalues: Character (val), getBiteHitboxDelay (val)
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
    detection = u138,
    attempt = function(p1) -- Line: 269 -- upvalues: DetectionBoxTitanClient (val), u138 (val), CooldownTitanClient (val), predictClosestMouthApproach (val), getExecuteMouthHitboxDistance (val)
        local v1, v2
        v1, v2 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u138)
        local v3 = {"MediumRangeBiteAttempt", "MediumRangeBite"}
        if CooldownTitanClient.isOnCooldown(p1, v3) or not v1 or not v2 then
            return false
        end
        local v4 = predictClosestMouthApproach(p1)
        local v5 = getExecuteMouthHitboxDistance(p1)
        if not v4 or v5 * p1.scale * 1.08 < v4 or CooldownTitanClient.isOnCooldown(p1, "Bite") or math.random() < 0.9 then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, "MediumRangeBiteAttempt", 1)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 1)
        return true, v2
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 202 -- upvalues: CooldownTitanClient (val), getBiteHitboxDelay (val), getExecuteMouthHitboxDistance (val), HitboxTitanClient (val), safeCancelThread (val), getBiteHitboxMissDelay (val)
        CooldownTitanClient.addClientCooldown(p1, "MediumRangeBite", 2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 4)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 1.5)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 1.5)
        local v1 = getExecuteMouthHitboxDistance(p1)
        local u38 = HitboxTitanClient.createMouthHitbox(p1, {
            debounce = 0,
            indicate = true,
            useClosestBodyPart = true,
            requireFacingDot = 0.15,
            facingFrom = "Head",
            facingPlane = "horizontal",
            debugLabel = "MediumRangeBite",
            monologue = true,
            ragdoll = true,
            distance = v1,
            delayed = getBiteHitboxDelay(),
        })
        local u39 = false
        local u40 = nil
        local function finish() -- Line: 236 -- upvalues: u39 (ref), safeCancelThread (upval), u40 (ref)
            if u39 then
                return
            end
            u39 = true
            safeCancelThread(u40)
            u40 = nil
        end
        u38.touched:Connect(function(p1) -- Line: 245 -- upvalues: finish (val), p4 (val), u38 (val)
            finish()
            p4(p1)
            u38.destroy()
        end)
        p2:Add(function() -- Line: 256 -- upvalues: finish (val), u38 (val)
            finish()
            u38.destroy()
        end)
        return true
    end,
}