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
--        File: ReplicatedStorage.Client.User.Character.CharacterSwimmingHandler
--                               Dumped in 0.0109 seconds
--                          Bytecode version 9  |  92 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local Audio = v1.Parent.Parent:WaitForChild("Audio")
local ClientMasterSoundGroup = require(Audio:WaitForChild("ClientMasterSoundGroup"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_4:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_6:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Observers_2 = Common_7:WaitForChild("Observers")
local useCharacterObserver = require(Observers_2:WaitForChild("useCharacterObserver"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_3 = Common_8:WaitForChild("Utilities")
local State = require(Utilities_3:WaitForChild("State"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_9:WaitForChild("Sounds")
local Swimming = require(Sounds_2:WaitForChild("Swimming"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Progression = Common_10:WaitForChild("Progression")
local Attributes = require(Progression:WaitForChild("Attributes"))
local v3 = v1.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(v3:WaitForChild("ClientAttributesHandler"))
local v4 = v1.Parent.Parent:WaitForChild("Equipment")
v4 = v4:WaitForChild("Gear")
local ClientGearHandler = require(v4:WaitForChild("ClientGearHandler"))
local v5 = v1.Parent.Parent:WaitForChild("Equipment")
v5 = v5:WaitForChild("Tools")
local ClientInventoryHandler = require(v5:WaitForChild("ClientInventoryHandler"))
local v6 = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(v6:WaitForChild("ClientSettingsHandler"))
local v7 = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(v7:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local u326 = Color3.fromRGB(17, 93, 187)
local u327 = {}
local u332 = Color3.fromRGB(17, 93, 187)
local u333 = {
    States.GRAPPLING,
    States.WALL_SLIDING,
    States.WALL_HANGING,
    States.SLIDING,
    States.TURBINE,
    States.GEAR_SWING,
}
local u340 = {
    States.RAGDOLLED,
    States.BEING_CARRIED,
    States.CUTSCENE,
    States.FREECAM,
    States.KNOCKED,
    States.TRANSFORMED,
    States.MOUNTED,
    States.LOCKED,
}
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
ColorCorrectionEffect.Name = "UnderwaterColorCorrection"
ColorCorrectionEffect.Parent = Lighting
local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
DepthOfFieldEffect.Name = "UnderwaterDepthOfField"
DepthOfFieldEffect.Parent = Lighting
local u360 = ClientMasterSoundGroup.getOrCreateEffect("UnderwaterEqualizer", "EqualizerSoundEffect")
local Sound = Instance.new("Sound")
Sound.Name = "UnderwaterAmbience"
Sound.SoundId = Swimming.Underwater
Sound.Looped = true
Sound:SetAttribute("BaseVolume", 1)
Sound:AddTag("WorldAmbienceSoundEffect")
Sound:AddTag("BypassMasterSoundGroup")
Sound.Parent = Workspace
local u380 = 0
local u381 = 0
local u382 = 0
local u383 = false
local oxygen = State("oxygen")
local function getAttributeDefault(p1) -- Line: 173 -- upvalues: Attributes (val)
    local v1
    local v2 = Attributes
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if typeof(j) == "table" then
            v1 = j[p1]
            if v1 then
                return v1[1]
            end
        end
    end
    return 0
end
local function getNumberAttribute(p1) -- Line: 186 -- upvalues: ClientAttributesHandler (val), getAttributeDefault (val)
    local v1 = ClientAttributesHandler.getAttribute(p1)
    if typeof(v1) == "number" then
        return v1
    end
    return getAttributeDefault(p1)
end
local function getMaxBreath() -- Line: 195 -- upvalues: getNumberAttribute (val)
    local MaxBreath = getNumberAttribute("MaxBreath")
    return (math.max(MaxBreath, 1))
end
local function getSwimSpeed() -- Line: 199 -- upvalues: getNumberAttribute (val)
    return getNumberAttribute("SwimSpeedMultiplier") * 18
end
local function getBreathDepletionRate() -- Line: 203 -- upvalues: getNumberAttribute (val), ClientGearHandler (val)
    local BreathDepletionRate = getNumberAttribute("BreathDepletionRate")
    local v1 = BreathDepletionRate * getNumberAttribute("BreathDepletionRateMultiplier")
    if ClientGearHandler.getGearState() then
        v1 = v1 * getNumberAttribute("GearBreathDepletionMultiplier")
    end
    return (math.max(v1, 0))
end
local function getBreathRegenRate() -- Line: 214 -- upvalues: getNumberAttribute (val)
    local BreathRegenRate = getNumberAttribute("BreathRegenRate")
    return (math.max(BreathRegenRate, 0))
end
local function getDrowningDamageInterval() -- Line: 218 -- upvalues: getNumberAttribute (val)
    local DrowningDamageInterval = getNumberAttribute("DrowningDamageInterval")
    return (math.max(DrowningDamageInterval, 0.1))
end
local function getInventoryWeightRatio() -- Line: 222 -- upvalues: Vitality (val)
    local v1 = Vitality.Store.client()
    if not v1 then
        return 0
    end
    local v2 = v1.maxWeight or 150
    if v2 <= 0 then
        return 0
    end
    local v3 = (v1.weight or 0) / v2
    return (math.clamp(v3, 0, 1))
end
local function publishOxygenState(p1) -- Line: 236 -- upvalues: getMaxBreath (val), oxygen (val), u381 (ref)
    oxygen({oxygen = u381, maxOxygen = getMaxBreath(), inWater = p1, visible = p1})
end
local function resetDrowningDamage() -- Line: 246 -- upvalues: u383 (ref), Vitality (val)
    if u383 then
        Vitality.Drown.post({reset = true})
    end
    u383 = false
end
local function resetOxygen() -- Line: 254 -- upvalues: u381 (ref), getMaxBreath (val), u382 (ref), resetDrowningDamage (val), publishOxygenState (val)
    u381 = getMaxBreath()
    u382 = 0
    resetDrowningDamage()
    publishOxygenState(false)
end
local function updateOxygen(p1, p2, p3) -- Line: 261 -- upvalues: getMaxBreath (val), u381 (ref), getBreathDepletionRate (val), u383 (ref), u382 (ref), getDrowningDamageInterval (val), Vitality (val), resetDrowningDamage (val), getBreathRegenRate (val), publishOxygenState (val)
    local v1, v2
    local v3 = getMaxBreath()
    u381 = math.min(u381, v3)
    if not p2 then
        if u383 then
            resetDrowningDamage()
        end
        u382 = 0
        v2 = u381 + getBreathRegenRate() * p1
        u381 = math.min(v2, v3)
        v1 = p3
    else
        v2 = u381 - getBreathDepletionRate() * p1
        u381 = math.max(v2, 0)
        if u381 > 0 then
            u382 = 0
            v1 = p3
        else
            u383 = true
            u382 = u382 + p1
            local v4 = getDrowningDamageInterval()
            while v4 <= u382 do
                u382 = u382 - v4
                Vitality.Drown.post()
            end
        end
    end
    publishOxygenState(v1)
end
local function isWaterTagged(p1) -- Line: 292 -- upvalues: CollectionService (val)
    return CollectionService:HasTag(p1, "Water")
end
local u400 = 0
local u401 = {}
local u403 = OverlapParams.new()
u403.FilterType = Enum.RaycastFilterType.Include
u403.FilterDescendantsInstances = u401
local u406 = RaycastParams.new()
u406.FilterType = Enum.RaycastFilterType.Exclude
local u408 = nil
local function refreshSwimRaycastFilter() -- Line: 307 -- upvalues: u401 (val), u408 (ref), u406 (val)
    local v1 = table.clone(u401)
    if u408 then
        table.insert(v1, u408)
    end
    u406.FilterDescendantsInstances = v1
end
local function addWaterPart(p1) -- Line: 315 -- upvalues: u401 (val), u403 (val), refreshSwimRaycastFilter (val)
    if p1:IsA("BasePart") and not (table.find(u401, p1)) then
        table.insert(u401, p1)
        u403.FilterDescendantsInstances = u401
        refreshSwimRaycastFilter()
    end
end
local function removeWaterPart(p1) -- Line: 323 -- upvalues: u401 (val), u403 (val), refreshSwimRaycastFilter (val)
    local v1 = table.find(u401, p1)
    if v1 then
        local v2 = #u401
        u401[v1] = u401[v2]
        u401[v2] = nil
        u403.FilterDescendantsInstances = u401
        refreshSwimRaycastFilter()
    end
end
local function addWaterInstance(p1) -- Line: 334 -- upvalues: addWaterPart (val), isWaterTagged (val)
    if p1:IsA("BasePart") then
        addWaterPart(p1)
        return
    end
    if isWaterTagged(p1) then
        for i, j in p1:GetDescendants() do
            if j:IsA("BasePart") then
                addWaterPart(j)
            end
        end
    end
end
for i, j in CollectionService:GetTagged("Water") do
    addWaterInstance(j)
end
local v8 = CollectionService:GetInstanceAddedSignal("Water")
v8:Connect(addWaterInstance)
v8 = CollectionService:GetInstanceRemovedSignal("Water")
v8:Connect(function(p1) -- Line: 349 -- upvalues: removeWaterPart (val)
    if p1:IsA("BasePart") then
        removeWaterPart(p1)
        return
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            removeWaterPart(j)
        end
    end
end)
local function isPositionInWater(p1, p2, p3) -- Line: 369 -- upvalues: u401 (val), Workspace (val), u403 (val)
    if #u401 == 0 then
        return nil
    end
    local v1 = Workspace:GetPartBoundsInRadius(p1, p3 or 2, u403)
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j:IsA("BasePart") then
            return j
        end
    end
    return nil
end
local function isWaterHitInstance(p1) -- Line: 385 -- upvalues: u401 (val), Workspace (val), isWaterTagged (val)
    if table.find(u401, p1) then
        return true
    end
    local Parent = p1
    while Parent do
        if Parent == Workspace then
            break
        end
        if isWaterTagged(Parent) then
            return true
        end
        Parent = Parent.Parent
    end
    return false
end
local function isLedgeHit(p1) -- Line: 401 -- upvalues: isWaterHitInstance (val)
    local v1 = if p1 ~= nil then not isWaterHitInstance(p1.Instance) else false
    return v1
end
local function getSwimRaycastParams(p1) -- Line: 405 -- upvalues: u408 (ref), refreshSwimRaycastFilter (val), u406 (val)
    if u408 ~= p1 then
        u408 = p1
        refreshSwimRaycastFilter()
    end
    return u406
end
local u460 = setmetatable({}, {__mode = "k"})
local function getCharacterHalfHeight(p1) -- Line: 419 -- upvalues: u460 (val)
    local v1 = u460[p1]
    if v1 then
        return v1
    end
    local v2 = p1:GetExtentsSize().Y / 2
    u460[p1] = v2
    return v2
end
local function getSurfaceCheckRadius(p1) -- Line: 430 -- upvalues: getCharacterHalfHeight (val)
    if not p1 then
        return 1
    end
    local v1 = getCharacterHalfHeight(p1) * 0.35
    return (math.max(v1, 1))
end
local function getBreathingCheckPosition(p1, p2) -- Line: 438 -- upvalues: getCharacterHalfHeight (val)
    local v1 = getCharacterHalfHeight(p2)
    return p1.Position + Vector3.new(0, v1, 0)
end
local function getFeetPosition(p1, p2) -- Line: 442 -- upvalues: getCharacterHalfHeight (val)
    local v1 = getCharacterHalfHeight(p2)
    return p1.Position - Vector3.new(0, v1, 0)
end
local function isCharacterInWater(p1, p2) -- Line: 446 -- upvalues: isPositionInWater (val), getFeetPosition (val)
    if isPositionInWater(p1.Position, p2, 0.65) then
        return true
    end
    local v1 = getFeetPosition(p1, p2)
    local v2 = isPositionInWater(v1, p2, 0.65) ~= nil
    return v2
end
local function isCharacterTouchingWater(p1, p2) -- Line: 454 -- upvalues: getCharacterHalfHeight (val), isPositionInWater (val)
    local v1
    local v2 = getCharacterHalfHeight(p2)
    local v3 = {}
    local v4 = -v2 * 0.7
    v3[1] = 0
    v3[2] = -v2 * 0.35
    v3[3] = v4
    v3[4] = -v2
    local v5 = nil
    local v6 = nil
    for i, j in v3, v5, v6 do
        v1 = p1.Position + Vector3.new(0, j, 0)
        v4 = isPositionInWater(v1, p2, 1.05)
        if v4 then
            return v4
        end
    end
    return nil
end
local function shouldPlayWaterEntrySound(p1, p2, p3) -- Line: 468 -- upvalues: isCharacterTouchingWater (val)
    if not (isCharacterTouchingWater(p1, p2)) then
        return false
    end
    local v1 = -p1.AssemblyLinearVelocity.Y
    local v2 = math.max(v1, p3)
    v1 = 6 <= v2
    return v1
end
local function getSurfaceFloatTargetY(p1, p2) -- Line: 477 -- upvalues: getCharacterHalfHeight (val)
    return p1 - getCharacterHalfHeight(p2) * 0.38
end
local function computeWaterSurfaceY(p1, p2) -- Line: 481 -- upvalues: isPositionInWater (val)
    local v1, v2
    local Y = p1.Y
    if isPositionInWater(p1, p2, 0.3) then
        local v3
        v1 = 6
        v2 = 0.25
        for i = 0.25, v1, v2 do
            v3 = Vector3.new(p1.X, Y + i, p1.Z)
            if not (isPositionInWater(v3, p2, 0.3)) then
                return Y + i - 0.3
            end
        end
        return nil
    else
        local v4
        v1 = false
        v2 = 6
        local v5 = 0.25
        for j = 0.25, v2, v5 do
            v4 = p1 - Vector3.new(0, j, 0)
            if isPositionInWater(v4, p2, 0.3) then
                Y = p1.Y - j
                v1 = true
                break
            end
        end
        if not v1 then
            return nil
        end
    end
end
local u470 = -1
local u471 = 0
local u472 = 0
local u473 = 0
local u474 = nil
local function getWaterSurfaceY(p1, p2) -- Line: 524 -- upvalues: u470 (ref), u400 (ref), u471 (ref), u472 (ref), u473 (ref), u474 (ref), computeWaterSurfaceY (val)
    local v1
    if u470 ~= u400 or u471 ~= p1.X or u472 ~= p1.Y then
        v1 = computeWaterSurfaceY(p1, p2)
        u470 = u400
        u471 = p1.X
        u472 = p1.Y
        u473 = p1.Z
        u474 = v1
        return v1
    end
    if u473 == p1.Z then
        return u474
    end
    v1 = computeWaterSurfaceY(p1, p2)
    u470 = u400
    u471 = p1.X
    u472 = p1.Y
    u473 = p1.Z
    u474 = v1
    return v1
end
local function getWaterColor(p1) -- Line: 545 -- upvalues: u326 (val)
    if p1 then
        return p1.Color
    end
    return u326
end
local function getWaterEntryPosition(p1, p2) -- Line: 553 -- upvalues: getWaterSurfaceY (val)
    local v1 = getWaterSurfaceY(p1.Position, p2)
    if not v1 then
        return nil
    end
    return (Vector3.new(p1.Position.X, v1, p1.Position.Z))
end
local function replicateWaterEntryEffect(p1, p2) -- Line: 562 -- upvalues: Vitality (val)
    Vitality.WaterEntry.unreliablePost({
        x = p1.X,
        y = p1.Y,
        z = p1.Z,
        r = math.round(p2.R * 255),
        g = math.round(p2.G * 255),
        b = math.round(p2.B * 255),
    })
end
local function isAtOrBelowWaterSurfaceLine(p1, p2) -- Line: 573 -- upvalues: getWaterSurfaceY (val)
    local v1 = getWaterSurfaceY(p1.Position, p2)
    if not v1 then
        return false
    end
    local v2 = p1.Position.Y <= v1 + 0.15
    return v2
end
local function getDistanceToWaterSurface(p1, p2) -- Line: 582 -- upvalues: getWaterSurfaceY (val)
    local v1 = getWaterSurfaceY(p1, p2)
    if not v1 then
        return nil
    end
    local v2 = v1 - p1.Y
    return (math.max(v2, 0))
end
local function getWalkableGroundBelow(p1, p2, p3) -- Line: 591 -- upvalues: Workspace (val), getSwimRaycastParams (val)
    local v1 = p1.Position + Vector3.new(0, 0.5, 0)
    local v2 = Vector3.new(0, -p3, 0)
    return Workspace:Raycast(v1, v2, getSwimRaycastParams(p2))
end
local function isInSurfaceFloatZone(p1, p2, p3) -- Line: 599 -- upvalues: isCharacterInWater (val), isAtOrBelowWaterSurfaceLine (val), getWaterSurfaceY (val), getSurfaceFloatTargetY (val), getDistanceToWaterSurface (val)
    local v1, v2, v3, v4, v5
    if not p3 then
        return false
    end
    if isCharacterInWater(p1, p2) then
        v1 = getWaterSurfaceY(p1.Position, p2)
        if not v1 then
            return false
        end
        v2 = getSurfaceFloatTargetY(v1, p2)
        v3 = p1.Position.Y - v2
        if 0.5 < v3 then
            return false
        end
        v4 = getDistanceToWaterSurface(p1.Position, p2)
        v5 = if v4 ~= nil then v4 <= 6 else false
        return v5
    end
    if not (isAtOrBelowWaterSurfaceLine(p1, p2)) then
        return false
    end
    v1 = getWaterSurfaceY(p1.Position, p2)
    if not v1 then
        return false
    end
    v2 = getSurfaceFloatTargetY(v1, p2)
    v3 = p1.Position.Y - v2
    if 0.5 < v3 then
        return false
    end
    v4 = getDistanceToWaterSurface(p1.Position, p2)
    v5 = if v4 ~= nil then v4 <= 6 else false
    return v5
end
local function getSurfaceFloatVelocity(p1, p2, p3, p4) -- Line: 623 -- upvalues: getWaterSurfaceY (val), isCharacterInWater (val), isAtOrBelowWaterSurfaceLine (val), getSurfaceFloatTargetY (val), getDistanceToWaterSurface (val), getCharacterHalfHeight (val)
    if not p4 then
        return Vector3.zero
    else
        if p3 then
            return Vector3.zero
        end
        local v1 = getWaterSurfaceY(p1.Position, p2)
        if not v1 then
            return Vector3.zero
        end
        if isCharacterInWater(p1, p2) then
            local v2, v3
            local v4 = getSurfaceFloatTargetY(v1, p2)
            local v5 = v4 - p1.Position.Y
            local v6 = p1.Position.Y - v4
            if 0.5 < v6 then
                return Vector3.zero
            end
            if 0.05 < v6 then
                return Vector3.yAxis * math.clamp(-v6 * 18, -12, -4)
            end
            local v7 = getDistanceToWaterSurface(p1.Position, p2)
            if not v7 then
                v3 = math.abs(v5)
                if v3 <= 0.4 then
                    return Vector3.zero
                end
                v2 = math.clamp(getCharacterHalfHeight(p2) * 1.5, 8, 14)
                return Vector3.yAxis * math.clamp(v5 * 5, -v2 * 0.4, v2 * 0.2)
            end
            if 6 < v7 then
                return Vector3.zero
            end
            v3 = math.abs(v5)
            if v3 <= 0.4 then
                return Vector3.zero
            end
            v2 = math.clamp(getCharacterHalfHeight(p2) * 1.5, 8, 14)
            return Vector3.yAxis * math.clamp(v5 * 5, -v2 * 0.4, v2 * 0.2)
        elseif not (isAtOrBelowWaterSurfaceLine(p1, p2)) then
            return Vector3.zero
        end
    end
end
local function isHeadUnderwater(p1, p2) -- Line: 669 -- upvalues: isPositionInWater (val), getBreathingCheckPosition (val), getSurfaceCheckRadius (val)
    if not p2 then
        return false
    end
    local v1 = getBreathingCheckPosition(p1, p2)
    local v2 = isPositionInWater(v1, p2, getSurfaceCheckRadius(p2)) ~= nil
    return v2
end
local function isCameraUnderwater(p1, p2) -- Line: 681 -- upvalues: isPositionInWater (val), getSurfaceCheckRadius (val)
    local v1 = isPositionInWater(p1.CFrame.Position, p2, getSurfaceCheckRadius(p2)) ~= nil
    return v1
end
local function getFlatDirection(p1, p2) -- Line: 685
    local v1 = Vector3.new(p1.X, 0, p1.Z)
    if 0.1 < v1.Magnitude then
        return v1.Unit
    end
    local v2 = Vector3.new(p2.CFrame.LookVector.X, 0, p2.CFrame.LookVector.Z)
    if 0.1 < v2.Magnitude then
        return v2.Unit
    end
    return nil
end
local function clampExitAssist(p1) -- Line: 699
    local v1 = Vector3.new(p1.X, 0, p1.Z)
    return v1 + Vector3.yAxis * math.max(math.min(p1.Y, 28), 0)
end
local function clampLedgeAssist(p1, p2) -- Line: 705
    local v1 = Vector3.new(p1.X, 0, p1.Z)
    if 8 < v1.Magnitude then
        v1 = v1.Unit * 8
    end
    return v1 * (p2 or 0.6) + Vector3.yAxis * math.max(math.min(p1.Y, 28), 0)
end
local function dampenSwimExitVelocity(p1) -- Line: 717
    local v1
    local AssemblyLinearVelocity = p1.AssemblyLinearVelocity
    local v2 = Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z)
    if v2.Magnitude > 8 then
        if 8 < v2.Magnitude then
            v2 = v2.Unit * 8
        end
        v1 = math.clamp(AssemblyLinearVelocity.Y, -6, 8)
        p1.AssemblyLinearVelocity = Vector3.new(v2.X, v1, v2.Z)
        return
    end
    if AssemblyLinearVelocity.Y <= 10 then
        return
    end
    if 8 < v2.Magnitude then
        v2 = v2.Unit * 8
    end
    v1 = math.clamp(AssemblyLinearVelocity.Y, -6, 8)
    p1.AssemblyLinearVelocity = Vector3.new(v2.X, v1, v2.Z)
end
local function isWalkableLedgeHit(p1) -- Line: 731 -- upvalues: isLedgeHit (val)
    local v1 = false
    if p1 ~= nil then
        v1 = isLedgeHit(p1)
        if v1 then
            v1 = 0.45 < p1.Normal.Y
        end
    end
    return v1
end
local function isNearWalkableShore(p1, p2) -- Line: 735 -- upvalues: getWalkableGroundBelow (val), isWalkableLedgeHit (val), getCharacterHalfHeight (val)
    local v1 = getWalkableGroundBelow(p1, p2, 5)
    if not (isWalkableLedgeHit(v1)) then
        return false
    end
    local v2 = p1.Position.Y - getCharacterHalfHeight(p2)
    local v3 = false
    local v4 = v1.Position.Y - v2
    if -0.25 <= v4 then
        v4 = v1.Position.Y - v2
        v3 = v4 <= 5
    end
    return v3
end
local function canUseVerticalSwimInput(p1, p2, p3) -- Line: 746 -- upvalues: isCharacterTouchingWater (val), getWaterSurfaceY (val), isPositionInWater (val)
    local v1
    if not (isCharacterTouchingWater(p1, p2)) then
        return false
    end
    if p3 then
        return true
    end
    local v2 = getWaterSurfaceY(p1.Position, p2)
    if not v2 then
        v1 = isPositionInWater(p1.Position, p2, 0.65) ~= nil
        return v1
    end
    v1 = p1.Position.Y <= v2 + 0.5
    return v1
end
local function isSwimmingDownward(p1, p2) -- Line: 763
    if p2 then
        return true
    end
    if p1.Magnitude <= 0.1 then
        return false
    end
    local v1 = Vector3.new(p1.X, 0, p1.Z)
    local v2 = if v1.Magnitude <= 0.1 then p1.Unit.Y < -0.4 else false
    return v2
end
local function wantsSwimExitAssist(p1, p2, p3) -- Line: 776 -- upvalues: isSwimmingDownward (val)
    if isSwimmingDownward(p3, p2) then
        return false
    end
    return p1
end
local function shouldApplyExitAssist(p1, p2, p3, p4, p5, p6) -- Line: 784 -- upvalues: isSwimmingDownward (val), canUseVerticalSwimInput (val), getDistanceToWaterSurface (val)
    if not p3 or isSwimmingDownward(p6, p5) or not p4 or not (canUseVerticalSwimInput(p1, p2, p3)) then
        return false
    end
    local v1 = getDistanceToWaterSurface(p1.Position, p2)
    local v2 = if v1 ~= nil then v1 <= 6 else false
    return v2
end
local function getLedgeWallAssist(p1, p2, p3, p4) -- Line: 808 -- upvalues: getDistanceToWaterSurface (val), Workspace (val), isLedgeHit (val), clampLedgeAssist (val)
    local v1, v2
    local v3 = getDistanceToWaterSurface(p1.Position, p3)
    if not v3 or 4 < v3 then
        return Vector3.zero
    end
    local v4 = {0, 0.5, 1.5}
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v2 = p1.Position + Vector3.new(0, j, 0)
        v1 = Workspace:Raycast(v2, p2 * 4, p4)
        if isLedgeHit(v1) and v1.Normal.Y < 0.4 then
            return clampLedgeAssist(p2 * 16 * 0.35 + Vector3.yAxis * 22 * 1.15, 0.35)
        end
    end
    return Vector3.zero
end
local function getLedgeExitAssist(p1, p2, p3) -- Line: 833 -- upvalues: getSwimRaycastParams (val), getCharacterHalfHeight (val), Workspace (val), isWalkableLedgeHit (val), clampLedgeAssist (val), isLedgeHit (val), getLedgeWallAssist (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = getSwimRaycastParams(p2)
    local Position = p1.Position
    local v10 = Position.Y - getCharacterHalfHeight(p2)
    local v11 = 4
    local v12 = 0.75
    local v13 = p3
    for i = 0.75, v11, v12 do
        v3 = Position + v13 * i + Vector3.new(0, 7, 0)
        v7 = Vector3.new(0, -11, 0)
        v4 = Workspace:Raycast(v3, v7, v9)
        if isWalkableLedgeHit(v4) then
            v5 = v4.Position.Y - v10
            if 0.25 <= v5 and v5 <= 5 then
                v6 = math.clamp(v5 / 5, 0.3, 0.65)
                v8 = math.max(v5, 0) * 0.1 + 1
                v7 = math.clamp(v8, 1, 1.25)
                v8 = clampLedgeAssist(v13 * 16 * v7 + Vector3.yAxis * (22 + v5 * 2) * v7, v6)
                return v8, true
            end
        end
    end
    v11 = Position + Vector3.new(0, -1.5, 0)
    v12 = Position + Vector3.new(0, 1, 0)
    local v14 = Workspace:Raycast(v11, v13 * 4, v9)
    if not (isLedgeHit(v14)) then
        v3 = getLedgeWallAssist(v1, v13, v2, v9)
        if 0 < v3.Magnitude then
            return v3, true
        end
        return Vector3.zero, false
    end
    v3 = Workspace:Raycast(v12, v13 * 4, v9)
    v4 = isLedgeHit(v3)
    if v4 then
        v4 = v3.Distance <= v14.Distance + 0.25
    end
    if v4 then
        v3 = getLedgeWallAssist(v1, v13, v2, v9)
        if 0 < v3.Magnitude then
            return v3, true
        end
        return Vector3.zero, false
    end
    v5 = v14.Position + v13 * 0.25 + Vector3.yAxis * 5
    local v15 = Vector3.new(0, -7, 0)
    v6 = Workspace:Raycast(v5, v15, v9)
    if not (isWalkableLedgeHit(v6)) then
        v3 = getLedgeWallAssist(v1, v13, v2, v9)
        if 0 < v3.Magnitude then
            return v3, true
        end
        return Vector3.zero, false
    end
    v7 = v6.Position.Y - v10
    if 0.25 > v7 then
        v3 = getLedgeWallAssist(v1, v13, v2, v9)
        if 0 < v3.Magnitude then
            return v3, true
        end
        return Vector3.zero, false
    end
    if v7 <= 5 then
        v8 = math.clamp(v7 / 5, 0.3, 0.65)
        v15 = clampLedgeAssist(v13 * 16 + Vector3.yAxis * (22 + v7 * 2), v8)
        return v15, true
    end
    v3 = getLedgeWallAssist(v1, v13, v2, v9)
    if 0 < v3.Magnitude then
        return v3, true
    end
    return Vector3.zero, false
end
local function getSwimExitAssist(p1, p2, p3, p4) -- Line: 889 -- upvalues: getFlatDirection (val), getLedgeExitAssist (val), getDistanceToWaterSurface (val), canUseVerticalSwimInput (val), clampExitAssist (val)
    local v1, v2
    local v3 = getFlatDirection(p3, p1)
    if not v3 then
        return Vector3.zero, false
    end
    v1, v2 = getLedgeExitAssist(p1, p2, v3)
    if v2 then
        return v1, true
    end
    local v4 = getDistanceToWaterSurface(p1.Position, p2)
    if not (canUseVerticalSwimInput(p1, p2, true)) or not v4 or v4 > 6 or -0.3 > p4.Y then
        return Vector3.zero, false
    end
    local v5 = math.clamp(1 + (6 - v4) * 0.08, 1, 1.3)
    local v6 = clampExitAssist(Vector3.yAxis * 22 * v5)
    return v6, false
end
local function getPassiveLedgeAssist(p1, p2, p3, p4, p5) -- Line: 920 -- upvalues: getDistanceToWaterSurface (val), getFlatDirection (val), getLedgeExitAssist (val)
    if not p5 then
        return Vector3.zero, false
    end
    local v1 = getDistanceToWaterSurface(p1.Position, p2)
    if not v1 or 4 < v1 then
        return Vector3.zero, false
    end
    local Unit = getFlatDirection(p3, p1)
    if not Unit then
        local v2 = Vector3.new(p4.X, 0, p4.Z)
        if 0.1 < v2.Magnitude then
            Unit = v2.Unit
        end
    end
    if not Unit then
        return Vector3.zero, false
    end
    return getLedgeExitAssist(p1, p2, Unit)
end
local function shouldExitSwimmingOntoGround(p1, p2, p3, p4) -- Line: 951 -- upvalues: getDistanceToWaterSurface (val), isNearWalkableShore (val)
    local v1 = getDistanceToWaterSurface(p2.Position, p1)
    local v2 = if v1 ~= nil then v1 <= 2.5 else false
    if not v2 then
        return false
    end
    if not (isNearWalkableShore(p2, p1)) then
        if 0 < p4.Magnitude then
            if isNearWalkableShore(p2, p1) then
                return true
            end
            return false
        end
        return false
    end
    if p3 then
        return true
    end
    if 0 >= p4.Magnitude then
        return false
    end
    if isNearWalkableShore(p2, p1) then
        return true
    end
    return false
end
local function isCharacterBreathingUnderwater(p1) -- Line: 975 -- upvalues: isHeadUnderwater (val)
    if not p1 then
        return false
    end
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false
    end
    return isHeadUnderwater(HumanoidRootPart, p1)
end
local function getCharacterInWaterSignal(p1) -- Line: 989 -- upvalues: isCharacterBreathingUnderwater (val), isCharacterInWater (val)
    if not p1 then
        return false
    end
    if isCharacterBreathingUnderwater(p1) then
        return true
    end
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false
    end
    if isCharacterInWater(HumanoidRootPart, p1) then
        return true
    end
    return false
end
local function computeEntryMomentum(p1, p2) -- Line: 1006 -- upvalues: getSwimSpeed (val)
    local AssemblyLinearVelocity = p1.AssemblyLinearVelocity
    local v1 = AssemblyLinearVelocity * 0.4
    local v2 = -math.min(math.max(-AssemblyLinearVelocity.Y, p2) * 0.4, 40)
    v1 = Vector3.new(v1.X, v2, v1.Z)
    local v3 = Vector3.new(v1.X, 0, v1.Z)
    local v4 = getSwimSpeed()
    if v4 < v3.Magnitude then
        v3 = v3.Unit * v4
    end
    v1 = Vector3.new(v3.X, v1.Y, v3.Z)
    if 40 < v1.Magnitude then
        v1 = v1.Unit * 40
    end
    return v1
end
local function applyPassiveWaterPhysics(p1, p2, p3) -- Line: 1038 -- upvalues: Character (val), isCharacterTouchingWater (val), getInventoryWeightRatio (val)
    if not (Character.isRagdolled(p2)) or not (isCharacterTouchingWater(p1, p2)) then
        return false
    end
    local v1 = (getInventoryWeightRatio() * 0.6 + 1) * 2.5
    local AssemblyLinearVelocity = p1.AssemblyLinearVelocity
    local v2 = math.clamp(p3 * 3.5, 0, 1)
    local v3 = math.clamp(p3 * 5, 0, 1)
    p1.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X * (1 - v2), AssemblyLinearVelocity.Y + (-v1 - AssemblyLinearVelocity.Y) * v3, AssemblyLinearVelocity.Z * (1 - v2))
    return true
end
local function isCharacterInSwimRange(p1, p2) -- Line: 1064 -- upvalues: isCharacterTouchingWater (val), isHeadUnderwater (val), isCharacterInWater (val)
    if isCharacterTouchingWater(p1, p2) or isHeadUnderwater(p1, p2) then
        return true
    end
    return isCharacterInWater(p1, p2)
end
local function isCharacterHalfSubmergedForSwim(p1, p2, p3) -- Line: 1076 -- upvalues: isCharacterInSwimRange (val), getWaterSurfaceY (val), isPositionInWater (val), isHeadUnderwater (val), isCharacterInWater (val), getFeetPosition (val)
    local v1
    if not (isCharacterInSwimRange(p1, p2)) then
        return false
    end
    local v2 = getWaterSurfaceY(p1.Position, p2)
    if not v2 then
        v1 = if isPositionInWater(p1.Position, p2, 0.65) == nil then isHeadUnderwater(p1, p2) else true
        return v1
    end
    if p3 then
        if p1.Position.Y <= v2 + 5 then
            return true
        end
        local v3 = getFeetPosition(p1, p2)
        v1 = isPositionInWater(v3, p2, 0.65) ~= nil
        return v1
    end
    if isHeadUnderwater(p1, p2) or isCharacterInWater(p1, p2) then
        return true
    end
    v1 = p1.Position.Y <= v2
    return v1
end
local function logSwimDebug(p1, p2, p3, p4, p5) end
local function shouldUseSwimPhysics(p1, p2, p3) -- Line: 1147 -- upvalues: getCharacterInWaterSignal (val), isCharacterHalfSubmergedForSwim (val)
    if getCharacterInWaterSignal(p2) then
        return true
    end
    if p3 then
        return isCharacterHalfSubmergedForSwim(p1, p2, true)
    end
    return false
end
local function getMoveInput() -- Line: 1159 -- upvalues: ClientStateHandler (val), States (val), UserInputService (val)
    if ClientStateHandler.isStateBusy(States.HANDCUFFED) then
        return false, false, false, false, false, false
    end
    local v1 = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
    if not v1 then
        v1 = UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
    end
    local v2 = UserInputService:IsKeyDown(Enum.KeyCode.W)
    local v3 = UserInputService:IsKeyDown(Enum.KeyCode.S)
    local v4 = UserInputService:IsKeyDown(Enum.KeyCode.A)
    local v5 = UserInputService:IsKeyDown(Enum.KeyCode.D)
    local v6 = UserInputService:IsKeyDown(Enum.KeyCode.Space)
    return v2, v3, v4, v5, v6, v1
end
local function canSwim() -- Line: 1175 -- upvalues: ClientStateHandler (val), u340 (val)
    return not ClientStateHandler.isAnyStateBusy(u340)
end
local function updateUnderwaterAmbience() -- Line: 1179 -- upvalues: ClientSettingsHandler (val), ClientAttributesHandler (val), Sound (val), u380 (ref)
    local v1, v2
    local v3 = ClientSettingsHandler.getSettingFromName("Ambience Volume")
    if typeof(v3) ~= "number" then
        v3 = 1
    end
    local CanHearAmbience = ClientAttributesHandler.getAttribute("CanHearAmbience")
    if typeof(CanHearAmbience) ~= "number" then
        v1 = 0
    elseif 0 < CanHearAmbience then
        v1 = 1
    end
    local Attribute = Sound:GetAttribute("BaseVolume")
    if typeof(Attribute) ~= "number" then
        v2 = 1
    elseif 0 <= Attribute then
        v2 = Attribute
    end
    local v4 = v2 * v3 * v1 * u380
    Sound.Volume = v4
    if 0 >= v4 then
        if v4 <= 0 and Sound.IsPlaying then
            Sound:Stop()
        end
        return
    end
    if not Sound.IsPlaying then
        Sound:Play()
        return
    end
    if v4 <= 0 and Sound.IsPlaying then
        Sound:Stop()
    end
end
local function updateUnderwaterTint(p1, p2, p3) -- Line: 1201 -- upvalues: isCameraUnderwater (val), isCharacterBreathingUnderwater (val), u380 (ref), ColorCorrectionEffect (val), u332 (val), DepthOfFieldEffect (val), u360 (val), updateUnderwaterAmbience (val), getCharacterInWaterSignal (val), updateOxygen (val)
    local v1
    local v2 = isCameraUnderwater(p2, p3)
    local v3 = isCharacterBreathingUnderwater(p3)
    if not v2 then
        v1 = 0
    else
        v1 = 1
    end
    u380 = math.lerp(u380, v1, (math.clamp(p1 * 6, 0, 1)))
    local v4 = Color3.new(1, 1, 1)
    ColorCorrectionEffect.TintColor = v4:Lerp(u332, u380)
    ColorCorrectionEffect.Saturation = u380 * -0.35
    ColorCorrectionEffect.Contrast = u380 * 0.15
    DepthOfFieldEffect.FocusDistance = u380 * 8
    DepthOfFieldEffect.InFocusRadius = u380 * 3
    DepthOfFieldEffect.FarIntensity = u380 * 1
    DepthOfFieldEffect.NearIntensity = u380 * 0
    u360.HighGain = u380 * -60
    u360.MidGain = u380 * -25
    u360.LowGain = u380 * 5
    updateUnderwaterAmbience()
    local v5 = getCharacterInWaterSignal(p3)
    updateOxygen(p1, v3, v5)
end
local function stopSwimTrack(p1) -- Line: 1227
    if p1 and p1.IsPlaying then
        p1:Stop(0.2)
    end
end
local function getSwimTargetCFrame(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 1233
    local Unit
    local v1 = p5
    if v1 then
        v1 = not p6
        if v1 then
            v1 = not p7
            if v1 then
                v1 = not p8
            end
        end
    end
    if 0.1 < p3.Magnitude then
        if not v1 then
            return CFrame.lookAt(p1, p1 + p3.Unit)
        end
        if 0.01 < p2.Magnitude then
            return CFrame.lookAt(p1, p1 + p2.Unit)
        end
        return CFrame.lookAt(p1, p1 + p3.Unit)
    end
    local v2 = Vector3.new(p2.X, 0, p2.Z)
    if 0.01 >= v2.Magnitude then
        Unit = Vector3.new(p4.X, 0, p4.Z)
    else
        Unit = v2.Unit
    end
    if 0.01 < Unit.Magnitude then
        return CFrame.lookAt(p1, p1 + Unit.Unit, Vector3.yAxis)
    end
    return nil
end
useCharacterObserver(function(p1) -- Line: 1267 -- upvalues: resetOxygen (val), logSwimDebug (val), ClientStateHandler (val), States (val), isCharacterTouchingWater (val), stopSwimTrack (val), dampenSwimExitVelocity (val), Character (val), useAnimatorObserver (val), Default (val), Inventory (val), Players (val), ClientInventoryHandler (val), u327 (val), ClientGearHandler (val), u333 (val), canSwim (val), getCharacterInWaterSignal (val), getMoveInput (val), Workspace (val), canUseVerticalSwimInput (val), wantsSwimExitAssist (val), shouldApplyExitAssist (val), getSwimExitAssist (val), getPassiveLedgeAssist (val), isNearWalkableShore (val), isHeadUnderwater (val), getCharacterHalfHeight (val), shouldExitSwimmingOntoGround (val), getInventoryWeightRatio (val), getSwimSpeed (val), isInSurfaceFloatZone (val), getSurfaceFloatVelocity (val), getWaterSurfaceY (val), getSurfaceFloatTargetY (val), isCharacterInWater (val), getSwimTargetCFrame (val), computeEntryMomentum (val), shouldPlayWaterEntrySound (val), getWaterEntryPosition (val), replicateWaterEntryEffect (val), getWaterColor (val), Sounds (val), Swimming (val), RunService (val), u400 (ref), isCharacterInSwimRange (val), shouldUseSwimPhysics (val), applyPassiveWaterPhysics (val), u460 (val), u408 (ref), refreshSwimRaycastFilter (val)
    local Humanoid = p1:WaitForChild("Humanoid")
    local HumanoidRootPart = p1:WaitForChild("HumanoidRootPart")
    resetOxygen()
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
    local u16 = false
    local u17 = nil
    local u18 = nil
    local u19 = nil
    local u20 = nil
    local zero = Vector3.zero
    local u22 = nil
    local u23 = true
    local u24 = 0
    local u25 = 0
    local u26 = 0
    local u27 = 0
    local u28 = false
    local u29 = 0
    local u32 = false
    local function destroySwimConstraints() -- Line: 1293 -- upvalues: u19 (ref), u20 (ref)
        if u19 then
            u19:Destroy()
            u19 = nil
        end
        if u20 then
            u20:Destroy()
            u20 = nil
        end
    end
    local function ensureSwimVelocity() -- Line: 1305 -- upvalues: u19 (ref), zero (ref), HumanoidRootPart (val)
        if not u19 then
            local AssemblyLinearVelocity, Velocity
            if not u19 then
                Velocity = nil
            else
                Velocity = u19.Velocity
            end
            local BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Name = "SwimVelocity"
            BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyVelocity.P = 1250
            if Velocity then
                AssemblyLinearVelocity = Velocity
            elseif 0 >= zero.Magnitude then
                AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
            else
                AssemblyLinearVelocity = zero
            end
            BodyVelocity.Velocity = AssemblyLinearVelocity
            BodyVelocity.Parent = HumanoidRootPart
            u19 = BodyVelocity
            return BodyVelocity
        elseif u19.Parent then
            return u19
        end
    end
    local function ensureSwimGyro() -- Line: 1326 -- upvalues: u20 (ref), HumanoidRootPart (val)
        local BodyGyro
        if not u20 then
            BodyGyro = Instance.new("BodyGyro")
            BodyGyro.Name = "SwimGyro"
            BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyGyro.P = 10000
            BodyGyro.D = 500
            BodyGyro.Parent = HumanoidRootPart
            u20 = BodyGyro
            return BodyGyro
        end
        if u20.Parent then
            return u20
        end
        BodyGyro = Instance.new("BodyGyro")
        BodyGyro.Name = "SwimGyro"
        BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        BodyGyro.P = 10000
        BodyGyro.D = 500
        BodyGyro.Parent = HumanoidRootPart
        u20 = BodyGyro
        return BodyGyro
    end
    local function clearSwimGyro() -- Line: 1342 -- upvalues: u20 (ref)
        if u20 then
            u20:Destroy()
            u20 = nil
        end
    end
    local function stopSwimming(a1) -- Line: 1349 -- upvalues: u16 (ref), logSwimDebug (upval), HumanoidRootPart (val), p1 (val), u23 (ref), ClientStateHandler (upval), States (upval), u28 (ref), isCharacterTouchingWater (upval), u29 (ref), stopSwimTrack (upval), u17 (ref), u18 (ref), destroySwimConstraints (val), zero (ref), dampenSwimExitVelocity (upval), Character (upval), Humanoid (val)
        if not u16 then
            return
        end
        logSwimDebug("exit", HumanoidRootPart, p1, true, {pendingEntryDampening = u23})
        u16 = false
        ClientStateHandler.updateState(States.SWIMMING, false)
        local v1 = isCharacterTouchingWater(HumanoidRootPart, p1) ~= nil
        u28 = v1
        u29 = 0
        stopSwimTrack(u17)
        stopSwimTrack(u18)
        u17 = nil
        u18 = nil
        destroySwimConstraints()
        zero = Vector3.zero
        if a1 then
            dampenSwimExitVelocity(HumanoidRootPart)
        end
        if not (Character.isRagdolled()) then
            Humanoid.PlatformStand = false
            Humanoid.AutoRotate = true
        end
    end
    local function playForwardAnimation() -- Line: 1380 -- upvalues: u18 (ref), stopSwimTrack (upval), u17 (ref), useAnimatorObserver (upval), Default (upval)
        if not u18 then
            stopSwimTrack(u17)
            u17 = nil
            u18 = useAnimatorObserver.play(Default.Swimming.Forwards, 0.2, Enum.AnimationPriority.Action)
            return
        end
        if u18.IsPlaying then
            return
        end
        stopSwimTrack(u17)
        u17 = nil
        u18 = useAnimatorObserver.play(Default.Swimming.Forwards, 0.2, Enum.AnimationPriority.Action)
    end
    local function playIdleAnimation() -- Line: 1390 -- upvalues: u17 (ref), stopSwimTrack (upval), u18 (ref), useAnimatorObserver (upval), Default (upval)
        if not u17 then
            stopSwimTrack(u18)
            u18 = nil
            u17 = useAnimatorObserver.play(Default.Swimming.Idle, 0.2, Enum.AnimationPriority.Action)
            return
        end
        if u17.IsPlaying then
            return
        end
        stopSwimTrack(u18)
        u18 = nil
        u17 = useAnimatorObserver.play(Default.Swimming.Idle, 0.2, Enum.AnimationPriority.Action)
    end
    local function unequipHeldItem(p1) -- Line: 1400 -- upvalues: Inventory (upval), Players (upval), ClientInventoryHandler (upval), u327 (upval)
        local value
        local v1 = Inventory.Tool.get(Players.LocalPlayer)
        if not v1 then
            value = v1
        else
            value = v1.value
        end
        if not value or value.hash == 0 then
            return
        end
        if not p1 then
            Inventory.Equip.post({hash = 0, offset = 0})
            return
        end
        local v2 = ClientInventoryHandler.getItemNameFromHash(value.hash)
        if not v2 then
            Inventory.Equip.post({hash = 0, offset = 0})
            return
        end
        if u327[v2] then
            return
        end
        Inventory.Equip.post({hash = 0, offset = 0})
    end
    local function releaseGrapples() -- Line: 1418 -- upvalues: ClientGearHandler (upval)
        local v1 = ClientGearHandler.getGearState()
        if not v1 then
            return
        end
        v1.signals.ungrapple:Fire("Left")
        v1.signals.ungrapple:Fire("Right")
    end
    local function clearGearMomentumForSwim() -- Line: 1428 -- upvalues: ClientGearHandler (upval)
        local v1 = ClientGearHandler.getGearState()
        if not v1 then
            return
        end
        v1.signals.clearMomentum:Fire()
    end
    local function clearPreemptedStatesForSwim() -- Line: 1437 -- upvalues: releaseGrapples (val), clearGearMomentumForSwim (val), u333 (upval), ClientStateHandler (upval)
        releaseGrapples()
        clearGearMomentumForSwim()
        local v1 = u333
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            ClientStateHandler.updateState(j, false)
        end
    end
    local function enforceSwimLocomotion() -- Line: 1446 -- upvalues: Humanoid (val)
        Humanoid.PlatformStand = true
        Humanoid.AutoRotate = false
    end
    local function stepSwimLocomotion(a1) -- Line: 1451 -- upvalues: u16 (ref), canSwim (upval), u24 (ref), getCharacterInWaterSignal (upval), p1 (val), enforceSwimLocomotion (val), getMoveInput (upval), Workspace (upval), canUseVerticalSwimInput (upval), HumanoidRootPart (val), ClientGearHandler (upval), wantsSwimExitAssist (upval), shouldApplyExitAssist (upval), getSwimExitAssist (upval), getPassiveLedgeAssist (upval), isNearWalkableShore (upval), u27 (ref), isHeadUnderwater (upval), getCharacterHalfHeight (upval), shouldExitSwimmingOntoGround (upval), stopSwimming (val), getInventoryWeightRatio (upval), getSwimSpeed (upval), isInSurfaceFloatZone (upval), getSurfaceFloatVelocity (upval), zero (ref), ensureSwimVelocity (val), getWaterSurfaceY (upval), getSurfaceFloatTargetY (upval), isCharacterInWater (upval), u25 (ref), getSwimTargetCFrame (upval), ensureSwimGyro (val), clearSwimGyro (val), playForwardAnimation (val), playIdleAnimation (val)
        if not u16 then
            return
        elseif not (canSwim()) then
            return
        else
            local v1, v2, v3, v4, v5, v6, v7, v8, v9, zero_3, zero_4
            if tick() < u24 or not (getCharacterInWaterSignal(p1)) then
                return
            end
            enforceSwimLocomotion()
            v1, v5, v6, v7, v8, v9 = getMoveInput()
            local CurrentCamera = Workspace.CurrentCamera
            if not CurrentCamera then
                return
            end
            local LookVector = CurrentCamera.CFrame.LookVector
            local RightVector = CurrentCamera.CFrame.RightVector
            local zero_2 = Vector3.zero
            if v1 then
                zero_2 = zero_2 + LookVector
            end
            if v5 then
                zero_2 = zero_2 - LookVector
            end
            if v6 then
                zero_2 = zero_2 - RightVector
            end
            if v7 then
                zero_2 = zero_2 + RightVector
            end
            local v10 = zero_2
            if v8 and canUseVerticalSwimInput(HumanoidRootPart, p1, u16) then
                v10 = v10 + Vector3.yAxis
            end
            if v9 then
                v10 = v10 - Vector3.yAxis
            end
            local v11 = ClientGearHandler.getGearState()
            local v12 = wantsSwimExitAssist(v8, v9, v10)
            local v13 = shouldApplyExitAssist(HumanoidRootPart, p1, u16, v8, v9, v10)
            local v14 = zero_2
            if v14.Magnitude <= 0.1 and v13 then
                v14 = Vector3.new(LookVector.X, 0, LookVector.Z)
            end
            if not v13 then
                v3, v4 = getPassiveLedgeAssist(HumanoidRootPart, p1, v14, LookVector, u16)
                zero_3 = v3
                v2 = v4
            else
                v3, v4 = getSwimExitAssist(HumanoidRootPart, p1, v14, LookVector)
                zero_3 = v3
                v2 = v4
            end
            if v2 and isNearWalkableShore(HumanoidRootPart, p1) then
                zero_3 = Vector3.new(0, zero_3.Y, 0)
            end
            if v2 then
                v3 = tick()
                v4 = v3 - u27
                if v4 >= 5 then
                    u27 = v3
                else
                    zero_3 = Vector3.zero
                    v2 = false
                end
            end
            v3 = isHeadUnderwater(HumanoidRootPart, p1)
            if not v8 then
                zero_4 = Vector3.zero
            elseif canUseVerticalSwimInput(HumanoidRootPart, p1, u16) and v3 and not v2 then
                local v15 = getCharacterHalfHeight(p1) * 1.2
                zero_4 = Vector3.yAxis * math.clamp(v15, 8, 14)
            end
            if not (shouldExitSwimmingOntoGround(p1, HumanoidRootPart, v12, zero_3)) then
                local huge, v16, v17, v18, zero_6
                local v19 = getInventoryWeightRatio()
                local v20 = getSwimSpeed() * (1 - v19 * 0.3)
                if v11 then
                    v20 = v20 * 0.78
                end
                local zero_5 = if 0.1 < v10.Magnitude then v10.Unit * v20 else Vector3.zero
                local v21 = isInSurfaceFloatZone(HumanoidRootPart, p1, u16)
                if v11 then
                    zero_6 = Vector3.zero
                elseif not v2 and 0 >= zero_3.Magnitude then
                    zero_6 = getSurfaceFloatVelocity(HumanoidRootPart, p1, v9, u16)
                end
                if 0 < v19 then
                    zero_6 = zero_6 * (1 - v19)
                end
                local v22 = v19 * 8
                if v11 then
                    v22 = v22 + 9
                end
                if 0 < v22 and zero_3.Magnitude <= 0 and not v2 then
                    zero_5 = zero_5 + Vector3.new(0, -v22, 0)
                end
                local v23 = zero.Y < -4
                local v24 = math.clamp(a1 * 2.5, 0, 1)
                local v25 = math.clamp(a1 * 1.1, 0, 1)
                if not v23 then
                    v16 = zero.Y * (1 - v24)
                else
                    v16 = zero.Y * (1 - v25)
                end
                zero = Vector3.new(zero.X * (1 - v24), v16, zero.Z * (1 - v24))
                local v26 = Vector3.new(zero.X, 0, zero.Z)
                if v20 < v26.Magnitude then
                    v26 = v26.Unit * v20
                    zero = Vector3.new(v26.X, zero.Y, v26.Z)
                end
                if v23 then
                    zero_6 = Vector3.zero
                end
                local v27 = ensureSwimVelocity()
                v16 = zero_5 + zero + zero_3 + zero_6 + zero_4
                local v28 = zero_2.Magnitude <= 0.1
                local v29 = getWaterSurfaceY(HumanoidRootPart.Position, p1)
                if not v29 then
                    v17 = nil
                else
                    v17 = getSurfaceFloatTargetY(v29, p1)
                end
                if not v17 then
                    huge = math.huge
                else
                    huge = v17 - HumanoidRootPart.Position.Y
                end
                if not v23 and v21 and v28 and not v9 and isCharacterInWater(HumanoidRootPart, p1) then
                    v18 = math.abs(huge)
                    if v18 <= 0.4 then
                        v16 = Vector3.new(v16.X, 0, v16.Z)
                    end
                end
                local v30 = tick() - u25
                v18 = v30 < 0.25
                if v2 then
                    v30 = math.clamp(a1 * 28, 0, 1)
                elseif v23 then
                    v30 = math.clamp(a1 * 1.1, 0, 1)
                elseif v18 then
                    v30 = math.clamp(a1 * 28, 0, 1)
                elseif 0 < zero_3.Magnitude then
                    v30 = math.clamp(a1 * 20, 0, 1)
                elseif not v21 and 0 >= zero_4.Magnitude then
                    v30 = math.clamp(a1 * 16, 0, 1)
                end
                v27.Velocity = v27.Velocity:Lerp(v16, v30)
                local v31 = getSwimTargetCFrame(HumanoidRootPart.Position, LookVector, zero_2, HumanoidRootPart.CFrame.LookVector, v1, v5, v6, v7)
                if not v31 then
                    clearSwimGyro()
                else
                    ensureSwimGyro().CFrame = v31
                    HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
                end
                if 0.1 < zero_2.Magnitude then
                    playForwardAnimation()
                    return
                end
                playIdleAnimation()
                return
            elseif zero_3.Magnitude <= 0 then
                u24 = tick() + 0.2
                stopSwimming(true)
                return
            end
        end
    end
    local function beginSwimming() -- Line: 1665 -- upvalues: u16 (ref), unequipHeldItem (val), u23 (ref), zero (ref), computeEntryMomentum (upval), HumanoidRootPart (val), u29 (ref), u25 (ref), ClientStateHandler (upval), States (upval), enforceSwimLocomotion (val), logSwimDebug (upval), p1 (val), playIdleAnimation (val)
        if u16 then
            return
        end
        unequipHeldItem(true)
        if not u23 then
            zero = Vector3.zero
        else
            zero = computeEntryMomentum(HumanoidRootPart, u29)
            HumanoidRootPart.AssemblyLinearVelocity = zero
            u23 = false
            u29 = 0
        end
        u16 = true
        u25 = tick()
        ClientStateHandler.updateState(States.SWIMMING, true)
        enforceSwimLocomotion()
        logSwimDebug("enter", HumanoidRootPart, p1, true, {pendingEntryDampening = u23})
        playIdleAnimation()
    end
    local function tryPlayWaterEntrySound() -- Line: 1694 -- upvalues: isCharacterTouchingWater (upval), HumanoidRootPart (val), p1 (val), u28 (ref), unequipHeldItem (val), shouldPlayWaterEntrySound (upval), u29 (ref), u26 (ref), getWaterEntryPosition (upval), replicateWaterEntryEffect (upval), getWaterColor (upval), Sounds (upval), Swimming (upval)
        local v1
        local v2 = isCharacterTouchingWater(HumanoidRootPart, p1)
        if v2 and not u28 then
            unequipHeldItem()
        end
        if v2 and not u28 and shouldPlayWaterEntrySound(HumanoidRootPart, p1, u29) then
            v1 = tick()
            local v3 = v1 - u26
            if 5 <= v3 then
                u26 = v1
                v3 = getWaterEntryPosition(HumanoidRootPart, p1)
                if v3 then
                    replicateWaterEntryEffect(v3, getWaterColor(v2))
                end
                Sounds.playRangedSoundEffect(Swimming.EnterWater, HumanoidRootPart, 80, 1, {min = 0.95, max = 1.05})
            end
        end
        v1 = v2 ~= nil
        u28 = v1
    end
    local u53 = RunService.PreSimulation:Connect(function(a1) -- Line: 1727 -- upvalues: u400 (upval), getWaterSurfaceY (upval), HumanoidRootPart (val), p1 (val), u29 (ref), tryPlayWaterEntrySound (val), isCharacterInSwimRange (upval), u22 (ref), u23 (ref), getCharacterInWaterSignal (upval), canSwim (upval), u32 (ref), clearPreemptedStatesForSwim (val), shouldUseSwimPhysics (upval), u16 (ref), stopSwimming (val), applyPassiveWaterPhysics (upval), u24 (ref), beginSwimming (val)
        u400 = u400 + 1
        local v1 = getWaterSurfaceY(HumanoidRootPart.Position, p1)
        if not v1 then
            local v2 = -HumanoidRootPart.AssemblyLinearVelocity.Y
            u29 = math.max(u29, (math.max(v2, 0)))
        elseif v1 >= HumanoidRootPart.Position.Y then
        end
        tryPlayWaterEntrySound()
        if isCharacterInSwimRange(HumanoidRootPart, p1) then
            u22 = nil
        elseif u22 ~= nil then
            local v3 = tick() - u22
            if 3 <= v3 then
                u23 = true
            end
        else
            u22 = tick()
        end
        if not (getCharacterInWaterSignal(p1)) then
            u32 = false
        elseif not (canSwim()) then
            u32 = false
        else
            if not u32 then
                clearPreemptedStatesForSwim()
            end
            u32 = true
        end
        if not (shouldUseSwimPhysics(HumanoidRootPart, p1, u16)) then
            stopSwimming(false)
            return
        end
        if not (canSwim()) then
            stopSwimming(false)
            applyPassiveWaterPhysics(HumanoidRootPart, p1, a1)
            return
        end
        if tick() < u24 then
            stopSwimming(false)
            return
        end
        beginSwimming()
    end)
    local u59 = RunService.RenderStepped:Connect(function(p1) -- Line: 1807 -- upvalues: stepSwimLocomotion (val)
        stepSwimLocomotion(p1)
    end)
    return function() -- Line: 1811 -- upvalues: u53 (val), u59 (val), stopSwimming (val), destroySwimConstraints (val), resetOxygen (upval), u460 (upval), p1 (val), u408 (upval), refreshSwimRaycastFilter (upval), Humanoid (val)
        u53:Disconnect()
        u59:Disconnect()
        stopSwimming()
        destroySwimConstraints()
        resetOxygen()
        u460[p1] = nil
        if u408 == p1 then
            u408 = nil
            refreshSwimRaycastFilter()
        end
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
    end
end, nil, "CharacterSwimming")
RunService.RenderStepped:Connect(function(p1) -- Line: 1827 -- upvalues: Workspace (val), Players (val), updateUnderwaterTint (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    updateUnderwaterTint(p1, CurrentCamera, Players.LocalPlayer.Character)
end)
return {}