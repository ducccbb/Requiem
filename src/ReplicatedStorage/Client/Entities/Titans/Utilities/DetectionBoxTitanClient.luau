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
--   File: ReplicatedStorage.Client.Entities.Titans.Utilities.DetectionBoxTitanClient
--                               Dumped in 0.0114 seconds
--                          Bytecode version 9  |  51 functions

local evaluateDetection, getCachedTransformedBoxes
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Detections = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Titans"):WaitForChild("Hitboxes"):WaitForChild("Detections")
local Lookup = Detections:WaitForChild("Lookup")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Draw = require(Utilities_2:WaitForChild("Draw"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterPredictionRunner = require(Character_2:WaitForChild("CharacterPredictionRunner"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local __TITAN_DEBUGGING__ = _G.__TITAN_DEBUGGING__
local u156 = {}
local u157 = {}
local u158 = {}
local u159 = {}
local u160 = {}
local u161 = nil
local u162 = {frameNumber = 0, transformedBoxes = {}, impactWindows = {}}
local v2 = {}
u162.detectionPredictions = v2
local u166 = 0
local u167 = {0, 0, 0}
local function isMoveDebugEnabled(p1) -- Line: 203
    if p1.debug then
        return true
    end
    local __TITAN_GRAB_DEBUG__ = _G.__TITAN_GRAB_DEBUG__
    if __TITAN_GRAB_DEBUG__ == true then
        return true
    end
    if typeof(__TITAN_GRAB_DEBUG__) ~= "string" then
        return false
    end
    local v1 = if __TITAN_GRAB_DEBUG__ ~= p1.box then if __TITAN_GRAB_DEBUG__ == "SidewaysGrab" then p1.box == "SidewaysGrab" else false else true
    return v1
end
local function formatVector3(p1) -- Line: 225
    return string.format("(%.1f, %.1f, %.1f)", p1.X, p1.Y, p1.Z)
end
local function isMoveDebugHistoryEnabled(p1) -- Line: 234
    local v1 = p1.debugHistory == true
    return v1
end
local function pushDebugHistory(p1, p2) -- Line: 244 -- upvalues: u157 (val)
    local v1 = u157[p1]
    if not v1 then
        u157[p1] = {}
    end
    table.insert(v1, p2)
    while 60 < #v1 do
        table.remove(v1, 1)
    end
end
local function setDebugHistoryPassReport(p1, p2) -- Line: 263 -- upvalues: u158 (val), u159 (val)
    u158[p1] = p2
    u159[p1] = nil
end
local function setDebugHistoryFailReport(p1, p2) -- Line: 274 -- upvalues: u159 (val)
    u159[p1] = p2
end
local function setLastEvaluationReport(p1, p2, p3, p4) -- Line: 286 -- upvalues: u160 (val)
    u160[p1] = {outcome = p2, side = p3, report = p4, at = os.clock()}
end
local function recordMoveDetectionHistory(p1, p2, p3, p4, p5, p6) -- Line: 370 -- upvalues: pushDebugHistory (val)
    local v1
    if not p6 then
        v1 = ""
    elseif not (string.find(p6, "FAIL")) then
        v1 = (" %*"):format(p6)
    else
        v1 = (" %*"):format(p6)
    end
    local v2 = tostring(p5)
    pushDebugHistory(p1, string.format("[%0.2fs] %s distRoot=%.1f spd=%.0f grapple=%s%s", os.clock(), p2, p3, p4, v2, v1))
end
local function shouldEmitDebugLog(p1, p2, p3) -- Line: 403 -- upvalues: u156 (val)
    local v1
    if p2 then
        return true
    end
    local v2 = os.clock()
    if not p3 then
        v1 = 0.35
    else
        v1 = 0.1
    end
    if v2 - (u156[p1] or 0) < v1 then
        return false
    end
    u156[p1] = v2
    return true
end
local function getSampleBoxDiagnostics(p1, p2, p3, p4) -- Line: 427 -- upvalues: formatVector3 (val)
    local v1 = p2.cFrame:PointToObjectSpace(p1)
    local v2 = p2.size / 2
    local v3 = p2.size * p4 / 2
    local v4 = false
    local v5 = math.abs(v1.X)
    if v5 <= v2.X then
        v4 = false
        v5 = math.abs(v1.Y)
        if v5 <= v2.Y then
            v5 = math.abs(v1.Z)
            v4 = v5 <= v2.Z
        end
    end
    v5 = false
    local v6 = math.abs(v1.X)
    if v6 <= v3.X then
        v5 = false
        v6 = math.abs(v1.Y)
        if v6 <= v3.Y then
            v6 = math.abs(v1.Z)
            v5 = v6 <= v3.Z
        end
    end
    v6 = v3.X - math.abs(v1.X)
    local v7 = v3.Y - math.abs(v1.Y)
    local v8 = v3.Z - math.abs(v1.Z)
    local v9 = formatVector3(p1)
    local v10 = formatVector3(v1)
    local v11 = tostring(v4)
    local v12 = tostring(v5)
    return string.format("    %s world=%s local=%s outer=%s inner=%s innerMargin=(%.1f, %.1f, %.1f)", p3, v9, v10, v11, v12, v6, v7, v8)
end
local function logMoveDetection(p1, p2, p3, p4, p5) -- Line: 470 -- upvalues: shouldEmitDebugLog (val)
    if not (shouldEmitDebugLog(p1, p2, p5)) then
        return
    end
    print((("[Titan Grab Detection] [%*] %*\n%*"):format(p1, p3, p4)))
end
local function getDetectionBoxes(p1) -- Line: 487 -- upvalues: u161 (ref), Detections (val), Lookup (val)
    local v1
    if u161 then
        v1 = p1
    else
        local v2, v3, v4, v5
        local v6 = {}
        local HumanoidRootPart = Detections:WaitForChild("HumanoidRootPart")
        v1 = p1
        for i, j in Lookup:GetChildren() do
            v5 = string.split(j.Name, ".")
            v2 = HumanoidRootPart.CFrame:ToObjectSpace(j.CFrame)
            v4 = v6[v5[1]]
            if not v4 then
                v4 = {}
            end
            v6[v5[1]] = v4
            v3 = v6[v5[1]]
            v3[v5[2] or "Universal"] = {cFrame = v2, size = j.Size}
        end
        u161 = v6
    end
    return u161[v1]
end
local function transformDetectionBoxes(p1, p2) -- Line: 518
    local v1, v2
    local v3 = {}
    for k, v in pairs(p2) do
        v2 = v.size * p1.scale
        v1 = p1.root.CFrame * CFrame.new(v.cFrame.Position * p1.scale) * (v.cFrame - v.cFrame.Position)
        v3[k] = {cFrame = v1, size = v2}
    end
    return v3
end
local function clearCacheIfNeeded() -- Line: 543 -- upvalues: u166 (ref), u162 (val)
    if u166 ~= u162.frameNumber then
        u162.frameNumber = u166
        u162.transformedBoxes = {}
        u162.impactWindows = {}
        u162.detectionPredictions = {}
    end
end
function getCachedTransformedBoxes(p1, p2) -- Line: 558 -- upvalues: clearCacheIfNeeded (val), u162 (val), getDetectionBoxes (val), transformDetectionBoxes (val)
    debug.profilebegin((("DetectionBoxTitanClient.getCachedTransformedBoxes:%*"):format(p2)))
    clearCacheIfNeeded()
    local v1 = tostring(p1.root)
    local v2 = ("%*:%*"):format(v1, p2)
    if u162.transformedBoxes[v2] then
        debug.profileend()
        return u162.transformedBoxes[v2]
    end
    local v3 = getDetectionBoxes(p2)
    if not v3 then
        debug.profileend()
        return nil
    end
    v1 = transformDetectionBoxes(p1, v3)
    u162.transformedBoxes[v2] = v1
    debug.profileend()
    return v1
end
local function isPositionInBox(p1, p2, p3) -- Line: 593
    local v1 = p2.cFrame:PointToObjectSpace(p1)
    local v2 = p2.size * (p3 or 1) / 2
    local v3 = false
    local v4 = math.abs(v1.X)
    if v4 <= v2.X then
        v3 = false
        v4 = math.abs(v1.Y)
        if v4 <= v2.Y then
            v4 = math.abs(v1.Z)
            v3 = v4 <= v2.Z
        end
    end
    return v3
end
local function isPositionInHorizontalBiteLane(p1, p2, p3, p4) -- Line: 611
    local v1 = p2.cFrame:PointToObjectSpace(p1)
    local v2 = p2.size * p3 / 2
    local v3 = p2.size * p4 / 2
    local v4 = false
    local v5 = math.abs(v1.X)
    if v5 <= v2.X then
        v5 = math.abs(v1.Z)
        v4 = v5 <= v3.Z
    end
    return v4
end
local function areAllPositionsInInnerBox(p1, p2, p3) -- Line: 631 -- upvalues: isPositionInBox (val)
    local v1 = #p1
    local v2 = 1
    for i = 1, v1, v2 do
        if not (isPositionInBox(p1[i], p2, p3)) then
            return false
        end
    end
    return true
end
local function passesProximityPlaneCheck(p1, p2, p3, p4, p5) -- Line: 654 -- upvalues: isPositionInHorizontalBiteLane (val), isPositionInBox (val), areAllPositionsInInnerBox (val)
    if p5 == "horizontal" then
        return isPositionInHorizontalBiteLane(p1, p2, p4, p3)
    end
    if not (isPositionInBox(p1, p2, p3)) then
        return false
    end
    return areAllPositionsInInnerBox({p1, p1, p1}, p2, p4)
end
local function passesGrappleImpactWindow(p1, p2, p3) -- Line: 684 -- upvalues: isPositionInBox (val)
    if not (isPositionInBox(p1[2], p2, p3)) then
        return false
    end
    local v1 = isPositionInBox(p1[1], p2, 1)
    if v1 then
        v1 = isPositionInBox(p1[3], p2, 1)
    end
    return v1
end
local function passesGrappleImpactWindowHorizontal(p1, p2, p3, p4, p5, p6) -- Line: 706 -- upvalues: isPositionInHorizontalBiteLane (val)
    local v1
    if not p6 then
        if not (isPositionInHorizontalBiteLane(p1[2], p2, p3, p4)) then
            return false
        end
        if p5 then
            return true
        end
        v1 = isPositionInHorizontalBiteLane(p1[1], p2, 1, p4)
        if v1 then
            v1 = isPositionInHorizontalBiteLane(p1[3], p2, 1, p4)
        end
        return v1
    end
    if p5 then
        return isPositionInHorizontalBiteLane(p1[1], p2, p3, p4)
    end
    if not (isPositionInHorizontalBiteLane(p1[2], p2, p3, p4)) then
        return false
    end
    if p5 then
        return true
    end
    v1 = isPositionInHorizontalBiteLane(p1[1], p2, 1, p4)
    if v1 then
        v1 = isPositionInHorizontalBiteLane(p1[3], p2, 1, p4)
    end
    return v1
end
local function passesImpactWindowCheck(p1, p2, p3) -- Line: 737 -- upvalues: passesGrappleImpactWindowHorizontal (val), passesGrappleImpactWindow (val), areAllPositionsInInnerBox (val)
    local innerBoxScale
    if not p3 then
        innerBoxScale = 0.85
    elseif p3.innerBoxScale then
        innerBoxScale = p3.innerBoxScale
    end
    if not p3 or not p3.useGrappleMode then
        return areAllPositionsInInnerBox(p1, p2, innerBoxScale)
    end
    if not p3.grappleHorizontalInner then
        return passesGrappleImpactWindow(p1, p2, innerBoxScale)
    end
    local v1 = innerBoxScale * (p3.grappleHorizontalInnerScale or 1)
    local v2 = p3.grappleHorizontalLateralScale or v1
    local v3 = p3.grappleImpactCenterOnly == true
    local v4 = p3.grappleImpactLeadingWindow == true
    return passesGrappleImpactWindowHorizontal(p1, p2, v1, v2, v3, v4)
end
local function getSideDiagnostics(p1, p2, p3) -- Line: 770 -- upvalues: getSampleBoxDiagnostics (val), passesImpactWindowCheck (val), formatVector3 (val)
    local innerBoxScale, v1, v2, v3, v4
    if not p3.innerBoxScale then
        innerBoxScale = 0.85
    else
        innerBoxScale = p3.innerBoxScale
    end
    local v5 = {"windowStart", "impact", "windowEnd"}
    local v6 = {}
    local v7 = p1
    local v8 = nil
    local v9 = nil
    v1, v2, v4 = p1, p2, p3
    for i, j in v7, v8, v9 do
        v3 = v5[i]
        if not v3 then
            v3 = ("sample%*"):format(i)
        end
        table.insert(v6, getSampleBoxDiagnostics(j, v2, v3, innerBoxScale))
    end
    v7 = passesImpactWindowCheck(v1, v2, v4)
    if not v4.useGrappleMode then
        v8 = "strict (all inner)"
    elseif not v4.grappleHorizontalInner then
        v8 = "grapple (center inner, edges outer)"
    elseif not v4.grappleHorizontalLateralScale then
        v8 = "grapple (center inner XZ, edges outer)"
    else
        v8 = "grapple (inner depth X, wide Z lane)"
    end
    local v10 = tostring(v7)
    table.insert(v6, 1, string.format("  mode=%s pass=%s boxSize=%s", v8, v10, formatVector3(v2.size)))
    return v7, table.concat(v6, "\n")
end
local function predictGearPositionAt(p1, p2, p3, p4) -- Line: 816
    local v1
    if not p4 then
        return p2 + p3 * p1
    end
    local v2 = p4 - p2
    if v2.Magnitude < 0.1 then
        return p2 + p3 * p1
    end
    local v3 = p2
    local v4 = p3
    local v5 = p1
    while 0 < v5 do
        v1 = math.min(p1 / 4, v5)
        v4 = v4:Lerp(v2.Unit * math.max(p3.Magnitude, v2.Magnitude / math.max(p1, 0.05)), (math.min(v1 * 49.5, 1)))
        v3 = v3 + v4 * v1
        v5 = v5 - v1
    end
    return v3
end
local function isOnGearGrapple() -- Line: 855 -- upvalues: ClientGearHandler (val)
    local v1 = ClientGearHandler.getGearState()
    if not v1 or not v1.enabled then
        return false
    end
    local active = v1.grapples.left.active
    if not active then
        active = v1.grapples.right.active
    end
    return active
end
local function predictPlayerPositionForDetection(p1) -- Line: 869 -- upvalues: ClientGearHandler (val), Character (val), u162 (val), predictGearPositionAt (val), CharacterPredictionRunner (val)
    local v1, v2
    local v3 = math.clamp(p1, 0, 2)
    local v4 = ClientGearHandler.getGearState()
    if not v4 or not v4.enabled then
        return CharacterPredictionRunner.predictPlayerPositionCurved(v3)
    end
    local v5 = Character.getCharacter()
    local HumanoidRootPart = v5
    if HumanoidRootPart then
        HumanoidRootPart = v5:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return CharacterPredictionRunner.predictPlayerPositionCurved(v3)
    end
    local Position = HumanoidRootPart.Position
    local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
    local active = v4.grapples.left.active
    if not active then
        active = v4.grapples.right.active
    end
    local v6 = v4.reeling == true
    if not active then
        if not active then
            v2 = "gear_linear"
        else
            v2 = "gear_orbit"
        end
    elseif v6 then
        v2 = "gear_reel"
    end
    local v7 = ("detect_%*_%*"):format(v2, v3)
    local v8 = u162.detectionPredictions[v7]
    if v8 then
        return v8
    end
    if not active then
        if not active then
            v1 = Position + AssemblyLinearVelocity * v3
        else
            local v9 = CharacterPredictionRunner.predictPlayerPositionCurved(v3)
            if not v9 then
                v9 = Position + AssemblyLinearVelocity * v3
            end
            v1 = v9
        end
    elseif v6 then
        v1 = predictGearPositionAt(v3, Position, AssemblyLinearVelocity, v4.goal)
    end
    u162.detectionPredictions[v7] = v1
    return v1
end
local function getLocalPlayerSpeed() -- Line: 915 -- upvalues: Character (val), CharacterPredictionRunner (val)
    local v1
    local v2 = Character.getCharacter()
    if not v2 then
        v1 = CharacterPredictionRunner.getCurrentVelocity()
        if v1 then
            return v1.Magnitude
        end
        return 0
    end
    local HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        return HumanoidRootPart.AssemblyLinearVelocity.Magnitude
    end
    v1 = CharacterPredictionRunner.getCurrentVelocity()
    if v1 then
        return v1.Magnitude
    end
    return 0
end
local function getNetworkLatencyBuffer() -- Line: 932 -- upvalues: Players (val)
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        return 0
    end
    local v1 = LocalPlayer:GetNetworkPing() * 0.5
    return (math.min(v1, 0.15))
end
local function shouldUseGrappleImpactMode(p1) -- Line: 946 -- upvalues: isOnGearGrapple (val), getLocalPlayerSpeed (val)
    local v1
    if not (isOnGearGrapple()) then
        return false
    end
    if not p1 then
        v1 = 60 <= getLocalPlayerSpeed()
        return v1
    end
    if p1.grappleImpactWhileOnGear then
        return true
    end
    v1 = 60 <= getLocalPlayerSpeed()
    return v1
end
local function getCachedImpactWindowPositions(p1, p2, p3) -- Line: 965 -- upvalues: clearCacheIfNeeded (val), u162 (val), CharacterPredictionRunner (val), getLocalPlayerSpeed (val), predictPlayerPositionForDetection (val), u167 (val)
    local v1, v2, v3, v4
    clearCacheIfNeeded()
    if not p3 then
        v3 = "default"
    elseif p3.useGrappleMode then
        v3 = "grapple"
    end
    local v5 = ("%*:%*:%*"):format(p1, p2, v3)
    local v6 = u162.impactWindows[v5]
    if v6 then
        return v6
    end
    local v7 = CharacterPredictionRunner.getMovementHistory()
    if #v7 == 0 then
        return nil
    end
    local position = v7[#v7].position
    if getLocalPlayerSpeed() < 0.5 then
        v1 = predictPlayerPositionForDetection(p1) or position
        v4 = {v1, v1, v1}
        u162.impactWindows[v5] = v4
        return v4
    end
    v1 = p2 / 2
    local v8 = math.max(0, p1 - v1)
    local v9 = p1 + v1
    u167[1] = v8
    u167[2] = p1
    u167[3] = v9
    CharacterPredictionRunner.beginPredictionSampleBatch()
    if v8 > 0 then
        v2 = predictPlayerPositionForDetection(v8)
    else
        v2 = position
    end
    local v10 = predictPlayerPositionForDetection(p1)
    local v11 = predictPlayerPositionForDetection(v9)
    CharacterPredictionRunner.endPredictionSampleBatch()
    if not v2 or not v10 or not v11 then
        return nil
    end
    v4 = {v2, v10, v11}
    u162.impactWindows[v5] = v4
    return v4
end
local function showDebugHitbox(p1, p2) -- Line: 1030
    local Part = Instance.new("Part")
    Part.Size = p1.size
    Part.CFrame = p1.cFrame
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Transparency = 0.5
    local v1 = p2
    if not v1 then
        v1 = Color3.fromRGB(255, 0, 0)
    end
    Part.Color = v1
    Part.Parent = workspace
    task.delay(0.1, function() -- Line: 1042 -- upvalues: Part (val)
        Part:Destroy()
    end)
end
local function showDebugInnerHitbox(p1, p2) -- Line: 1053
    local Part = Instance.new("Part")
    Part.Size = p1.size * (p2 or 0.85)
    Part.CFrame = p1.cFrame
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Transparency = 0.65
    Part.Color = Color3.fromRGB(0, 120, 255)
    Part.Parent = workspace
    task.delay(0.1, function() -- Line: 1065 -- upvalues: Part (val)
        Part:Destroy()
    end)
end
local function computeAnimSpeed(p1, p2) -- Line: 1080
    local v1 = p2.playerSpeedMin or 60
    local v2 = p2.animSpeedMin or 0.7
    local v3 = p2.animSpeedMax or 1
    local v4 = v2 + (p1 - v1) * (v3 - v2) / ((p2.playerSpeedMax or 280) - v1)
    return (math.clamp(v4, v2, v3))
end
local function getDistanceToTitanRoot(p1) -- Line: 1098 -- upvalues: Character (val)
    local v1 = Character.getCharacter()
    local HumanoidRootPart = v1
    if HumanoidRootPart then
        HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return math.huge
    end
    return (HumanoidRootPart.Position - p1.root.Position).Magnitude
end
local function computeImpactHorizon(p1, p2, p3) -- Line: 1115 -- upvalues: computeAnimSpeed (val)
    local v1 = p1.impactAt / computeAnimSpeed(p2, p1)
    if p1.proximityDistance and p3 and p3 <= p1.proximityDistance and 0.5 < p2 then
        v1 = math.min(v1, p3 / p2 * 0.4 + 0.05)
    end
    return v1
end
local function getCharacterToMouthDistance(p1, p2, p3, p4) -- Line: 1144
    local v1
    if not p4 then
        return (p1 - p3).Magnitude
    end
    local Magnitude = (p1 - p3).Magnitude
    local v2 = {"Head", "UpperTorso", "Torso"}
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = p2:FindFirstChild(j)
        if v1 and v1:IsA("BasePart") then
            Magnitude = math.min(Magnitude, (p1 - v1.Position).Magnitude)
        end
    end
    return Magnitude
end
local function passesMouthReachCheck(p1, p2, p3, p4) -- Line: 1173 -- upvalues: Character (val), getCharacterToMouthDistance (val), formatVector3 (val)
    local mouthReachGrappleScale, mouthReachHitboxSlack, v1, v2, v3
    local mouthReachDistance = p3.mouthReachDistance
    if not mouthReachDistance then
        return true, nil
    end
    local client = p1.model.client
    if not client then
        return false, "mouthReach FAIL no client model"
    end
    local Mouth = client:FindFirstChild("Mouth")
    if not Mouth then
        return false, "mouthReach FAIL Mouth part missing"
    end
    local v4 = Character.getCharacter()
    if not v4 then
        return false, "mouthReach FAIL no character"
    end
    local v5 = p3.mouthReachUseClosestBodyPart == true
    local v6 = getCharacterToMouthDistance(Mouth.Position, v4, p2, v5)
    local Magnitude = (Mouth.Position - p2).Magnitude
    if not p3.mouthReachAtImpactSample then
        v1 = v6
    else
        v1 = math.min(v6, Magnitude)
    end
    if not p4 then
        v2 = 0
    else
        v2 = p3.mouthReachLungeAllowance or 0
    end
    local v7 = (mouthReachDistance + v2) * p1.scale * (p3.mouthReachScale or 1)
    if not p4 then
        mouthReachGrappleScale = nil
    else
        mouthReachGrappleScale = p3.mouthReachGrappleScale
    end
    if mouthReachGrappleScale then
        v7 = v7 * mouthReachGrappleScale
    end
    local mouthReachGrappleStudsBonus = 0
    if p4 then
        if not p3.mouthReachGrappleStudsPerScaleDeficit then
            if p3.mouthReachGrappleStudsBonus then
                mouthReachGrappleStudsBonus = p3.mouthReachGrappleStudsBonus
            end
        elseif p3.mouthReachGrappleStudsBonusMaxScale then
            local v8 = math.max(0, p3.mouthReachGrappleStudsBonusMaxScale - p1.scale)
            mouthReachGrappleStudsBonus = v8 * p3.mouthReachGrappleStudsPerScaleDeficit
        end
        v7 = v7 + mouthReachGrappleStudsBonus
    end
    if p3.mouthReachHitboxSlack then
        v7 = math.min(v7, mouthReachDistance * p1.scale * p3.mouthReachHitboxSlack)
    end
    mouthReachHitboxSlack = p3.mouthReachHitboxSlack
    if mouthReachHitboxSlack then
        v3 = mouthReachDistance * p1.scale
        mouthReachHitboxSlack = v1 <= v3 * p3.mouthReachHitboxSlack
    end
    if not p4 then
        local v9, v10
        if v7 >= v1 then
            if not mouthReachGrappleScale then
                v9 = ""
            else
                v9 = (" grapple x%*"):format((string.format("%.2f", mouthReachGrappleScale)))
            end
            if 0 >= mouthReachGrappleStudsBonus then
                v10 = ""
            else
                v10 = (" +%*studs"):format((string.format("%.1f", mouthReachGrappleStudsBonus)))
            end
            return true, string.format("mouthReach PASS dist=%.1f threshold=%.1f (live=%.1f sample=%.1f base=%.2f lunge=%.2f scale=%.3f%s%s)", v1, v7, v6, Magnitude, mouthReachDistance, v2, p1.scale, v9, v10)
        end
        if not mouthReachGrappleScale then
            v9 = ""
        else
            v9 = (" grapple x%*"):format((string.format("%.2f", mouthReachGrappleScale)))
        end
        if 0 >= mouthReachGrappleStudsBonus then
            v10 = ""
        else
            v10 = (" +%*studs"):format((string.format("%.1f", mouthReachGrappleStudsBonus)))
        end
        local v11 = formatVector3(Mouth.Position)
        return false, string.format("mouthReach FAIL dist=%.1f threshold=%.1f (live=%.1f sample=%.1f base=%.2f lunge=%.2f scale=%.3f%s%s) mouth=%s player=%s", v1, v7, v6, Magnitude, mouthReachDistance, v2, p1.scale, v9, v10, v11, formatVector3(p2))
    elseif p3.grappleMouthApproachMinSpeed and not mouthReachHitboxSlack then
        local HumanoidRootPart = v4:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            v3 = Mouth.Position - HumanoidRootPart.Position
            local v12 = Vector3.new(v3.X, 0, v3.Z)
            if 1 < v12.Magnitude then
                local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                local v13 = Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z)
                local v14 = v13:Dot(v12.Unit)
                if v14 < p3.grappleMouthApproachMinSpeed then
                    return false, string.format("mouthReach FAIL approach=%.1f min=%.1f dist=%.1f threshold=%.1f mouth=%s", v14, p3.grappleMouthApproachMinSpeed, v1, v7, formatVector3(Mouth.Position))
                end
            end
        end
    end
end
local function passesMouthReachWindowCheck(p1, p2, p3, p4) -- Line: 1293 -- upvalues: passesMouthReachCheck (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    if not p3.mouthReachDistance then
        return true, nil
    end
    if not p3.mouthReachBestWindowSample then
        local v12, v13
        v9 = {"windowStart", "impact", "windowEnd"}
        local v14 = p2
        v10 = nil
        v11 = nil
        for i, j in v14, v10, v11 do
            v2, v12 = passesMouthReachCheck(p1, j, p3, p4)
            if not v2 then
                v13 = v9[i]
                if not v13 then
                    v13 = ("sample%*"):format(i)
                end
                if v12 then
                    return false, (("%*: %*"):format(v13, v12))
                end
                return false, (("%*: mouthReach FAIL"):format(v13))
            end
        end
        _, v10 = passesMouthReachCheck(p1, p2[2], p3, p4)
        return true, v10
    end
    v9 = {"windowStart", "impact", "windowEnd"}
    local huge = math.huge
    v10 = "impact"
    v11 = nil
    local v15 = p2
    local v16 = nil
    v2 = nil
    v1, v7, v8 = p1, p3, p4
    for k, n in v15, v16, v2 do
        v3, v4 = passesMouthReachCheck(v1, n, v7, v8)
        if v3 then
            return true, v4
        end
        if v4 then
            v5 = tonumber(string.match(v4, "dist=(%d+%.?%d*)"))
            if v5 and v5 < huge then
                huge = v5
                v6 = v9[k]
                if not v6 then
                    v6 = ("sample%*"):format(k)
                end
                v10 = v6
                v11 = v4
            end
        end
    end
    if v11 then
        return false, (("%*: %*"):format(v10, v11))
    end
    return false, "mouthReach FAIL all window samples"
end
local function tryGrappleOrbitNowSide(p1, p2, p3, p4) -- Line: 1359 -- upvalues: isOnGearGrapple (val), Character (val), isPositionInHorizontalBiteLane (val), passesMouthReachCheck (val), getSampleBoxDiagnostics (val)
    local v1, v2, v3, v4
    if not p3.grappleOrbitNow or not (isOnGearGrapple()) then
        return nil, nil
    end
    local v5 = Character.getCharacter()
    local HumanoidRootPart = v5
    if HumanoidRootPart then
        HumanoidRootPart = v5:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return nil, nil
    end
    local v6 = p4 * (p3.grappleHorizontalInnerScale or 1)
    local Position = HumanoidRootPart.Position
    local v7 = p2
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        if isPositionInHorizontalBiteLane(Position, j, v6, p3.grappleHorizontalLateralScale or v6) then
            v1, v2 = passesMouthReachCheck(p1, Position, p3, true)
            if v1 then
                v3 = getSampleBoxDiagnostics(Position, j, "hrpNow", v6)
                if not v2 then
                    v4 = ""
                else
                    v4 = ("\n    %*"):format(v2)
                end
                return i, ((" side=%* (grapple orbit now)\n%*%*"):format(i, v3, v4))
            end
        end
    end
    return nil, nil
end
local function tryProximitySide(p1, p2, p3, p4) -- Line: 1405 -- upvalues: getDistanceToTitanRoot (val), isOnGearGrapple (val), Character (val), getLocalPlayerSpeed (val), computeImpactHorizon (val), getNetworkLatencyBuffer (val), predictPlayerPositionForDetection (val), passesProximityPlaneCheck (val), passesMouthReachCheck (val), getSideDiagnostics (val), getSampleBoxDiagnostics (val)
    if not p3.proximityDistance then
        return nil, nil
    end
    local v1 = getDistanceToTitanRoot(p1)
    if p3.proximityDistance < v1 then
        return nil, nil
    end
    if isOnGearGrapple() then
        local v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = Character.getCharacter()
        local HumanoidRootPart = v10
        if HumanoidRootPart then
            HumanoidRootPart = v10:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return nil, nil
        end
        local v11 = p3.proximityBoxScale or 1
        local Position = HumanoidRootPart.Position
        if p3.proximityUsePrediction then
            v3 = computeImpactHorizon(p3, getLocalPlayerSpeed(), v1)
            v2 = v3 + getNetworkLatencyBuffer()
            v3 = predictPlayerPositionForDetection(v2)
            if v3 then
                Position = v3
            end
        end
        local v12 = p3.proximityPlane or "full"
        v2 = p4 * math.min(v11, 1.12)
        v3 = {useGrappleMode = false, innerBoxScale = v2}
        local v13 = p2
        local v14 = nil
        local v15 = nil
        for i, j in v13, v14, v15 do
            if passesProximityPlaneCheck(Position, j, v11, v2, v12) then
                v4 = ""
                if p3.mouthReachDistance then
                    v5, v6 = passesMouthReachCheck(p1, Position, p3, isOnGearGrapple())
                    if not v5 then
                        continue
                    end
                    if v6 then
                        v4 = ("\n    %*"):format(v6)
                    end
                end
                _, v7 = getSideDiagnostics({Position, Position, Position}, j, v3)
                if v12 ~= "horizontal" then
                    v8 = "proximity hrpNow in outer box"
                elseif not p3.proximityUsePrediction then
                    v8 = "proximity hrpNow in horizontal bite lane"
                else
                    v8 = "proximity predicted hrp in horizontal bite lane"
                end
                v9 = getSampleBoxDiagnostics(Position, j, "hrpNow", v2)
                return i, ((" side=%* (%*)\n%*\n%*%*"):format(i, v8, v9, v7, v4))
            end
        end
        return nil, nil
    elseif p3.proximityDistance * 0.55 < v1 then
        return nil, nil
    end
end
function evaluateDetection(p1, p2, p3, p4, p5) -- Line: 1495 -- upvalues: getCachedTransformedBoxes (val), isMoveDebugEnabled (val), isMoveDebugHistoryEnabled (val), setLastEvaluationReport (val), setDebugHistoryFailReport (val), logMoveDetection (val), isOnGearGrapple (val), tryGrappleOrbitNowSide (val), recordMoveDetectionHistory (val), getDistanceToTitanRoot (val), getLocalPlayerSpeed (val), setDebugHistoryPassReport (val), tryProximitySide (val), shouldUseGrappleImpactMode (val), getCachedImpactWindowPositions (val), __TITAN_DEBUGGING__ (val), showDebugHitbox (val), showDebugInnerHitbox (val), Draw (val), Character (val), getSideDiagnostics (val), passesMouthReachWindowCheck (val), passesMouthReachCheck (val), ClientGearHandler (val), computeAnimSpeed (val), getNetworkLatencyBuffer (val), formatVector3 (val)
    local innerBoxScale, v1, v2, v3, v4, v5, v6, v7
    debug.profilebegin((("DetectionBoxTitanClient.evaluateDetection:%*"):format(p2)))
    local v8 = getCachedTransformedBoxes(p1, p2)
    if not v8 then
        local v9 = if p5 ~= nil then isMoveDebugEnabled(p5) else false
        v5 = if p5 ~= nil then isMoveDebugHistoryEnabled(p5) else false
        if p5 then
            if v9 then
                v6 = ("FAIL no detection boxes baked for this name\nbox=%*"):format(p2)
                setLastEvaluationReport(p2, "FAIL", nil, v6)
                if v5 then
                    setDebugHistoryFailReport(p2, v6)
                end
            elseif not v5 then
            end
        end
        if p5 and v9 then
            v2 = ("box=%*"):format(p2)
            logMoveDetection(p2, false, "FAIL no detection boxes baked for this name", v2, true)
        end
        debug.profileend()
        return false, nil
    end
    if not p5 then
        innerBoxScale = 0.85
    elseif p5.innerBoxScale then
        innerBoxScale = p5.innerBoxScale
    end
    v5 = if p5 ~= nil then isMoveDebugEnabled(p5) else false
    v6 = if p5 ~= nil then isMoveDebugHistoryEnabled(p5) else false
    if not p5 then
        local v10
        if not p5 then
            local grappleHorizontalInnerScale, grappleHorizontalLateralScale, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25
            v7 = {useGrappleMode = shouldUseGrappleImpactMode(p5), innerBoxScale = innerBoxScale}
            v1 = if p5 ~= nil then p5.grappleHorizontalInner == true else false
            v7.grappleHorizontalInner = v1
            if not p5 then
                grappleHorizontalInnerScale = 1
            elseif p5.grappleHorizontalInnerScale then
                grappleHorizontalInnerScale = p5.grappleHorizontalInnerScale
            end
            v7.grappleHorizontalInnerScale = grappleHorizontalInnerScale
            if not p5 then
                grappleHorizontalLateralScale = nil
            elseif p5.grappleHorizontalLateralScale then
                grappleHorizontalLateralScale = p5.grappleHorizontalLateralScale
            end
            v7.grappleHorizontalLateralScale = grappleHorizontalLateralScale
            v1 = if p5 ~= nil then p5.grappleImpactCenterOnly == true else false
            v7.grappleImpactCenterOnly = v1
            v1 = if p5 ~= nil then p5.grappleImpactLeadingWindow == true else false
            v7.grappleImpactLeadingWindow = v1
            v1 = getCachedImpactWindowPositions(p3, p4, v7)
            if not v1 then
                if p5 then
                    if v5 then
                        setLastEvaluationReport(p2, "FAIL", nil, "FAIL no movement history / prediction\nCharacterPredictionRunner history empty or prediction failed")
                        if v6 then
                            v4 = getDistanceToTitanRoot(p1)
                            v13 = getLocalPlayerSpeed()
                            v14 = v7.useGrappleMode == true
                            recordMoveDetectionHistory(p2, "FAIL no prediction", v4, v13, v14, nil)
                            setDebugHistoryFailReport(p2, "FAIL no movement history / prediction\nCharacterPredictionRunner history empty or prediction failed")
                        end
                    elseif not v6 then
                    end
                end
                if p5 and v5 then
                    logMoveDetection(p2, false, "FAIL no movement history / prediction", "CharacterPredictionRunner history empty or prediction failed", true)
                end
                debug.profileend()
                return false, nil
            end
            v10 = __TITAN_DEBUGGING__ == true
            if not v10 then
                v11, v12, v16, v24, v25 = p1, p2, p3, p4, p5
            else
                v2 = v8
                v3 = nil
                v4 = nil
                for i, j in v2, v3, v4 do
                    showDebugHitbox(j)
                    showDebugInnerHitbox(j, innerBoxScale)
                end
                v2 = 3
                v3 = 1
                for k = 1, v2, v3 do
                    if k ~= 2 then
                        v13 = Color3.fromRGB(255, 255, 0)
                    else
                        v13 = Color3.fromRGB(30, 255, 0)
                    end
                    Draw.point(v1[k], v13)
                end
                v2 = Character.getCharacter()
                local HumanoidRootPart = v2
                if HumanoidRootPart then
                    HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
                end
                if HumanoidRootPart then
                    Draw.point(HumanoidRootPart.Position, Color3.fromRGB(255, 80, 255))
                end
            end
            v2 = nil
            v3 = {}
            v4 = v8
            v13 = nil
            v14 = nil
            for n, m in v4, v13, v14 do
                v15, v17 = getSideDiagnostics(v1, m, v7)
                v18 = nil
                if v15 and v25 and v25.mouthReachDistance then
                    v21 = v7.useGrappleMode == true
                    if v25.mouthReachAllWindowSamples then
                        v22, v23 = passesMouthReachWindowCheck(v11, v1, v25, v21)
                        v19 = v22
                        v20 = v23
                    elseif not v25.mouthReachBestWindowSample then
                        v22, v23 = passesMouthReachCheck(v11, v1[2], v25, v21)
                        v19 = v22
                        v20 = v23
                    end
                    v18 = v20
                    if not v19 then
                        v15 = false
                    end
                end
                v19 = (" side=%*\n%*"):format(n, v17)
                if v18 then
                    v19 = v19 .. ("\n    %*"):format(v18)
                end
                table.insert(v3, v19)
                if v15 then
                    v2 = n
                end
            end
            v4 = nil
            if not v2 and v25 and not v25.requireImpactWindow then
                local v26
                v14, v26 = tryProximitySide(v11, v8, v25, innerBoxScale)
                v4 = v14
                v13 = v26
                if v4 then
                    v2 = v4
                    if v13 then
                        table.insert(v3, v13)
                    end
                end
            end
            if v25 then
                if v5 then
                    local v27, v28, v29
                    v14 = Character.getCharacter()
                    local HumanoidRootPart_2 = v14
                    if HumanoidRootPart_2 then
                        HumanoidRootPart_2 = v14:FindFirstChild("HumanoidRootPart")
                    end
                    local v30 = ClientGearHandler.getGearState()
                    v15 = getLocalPlayerSpeed()
                    v17 = computeAnimSpeed(v15, v25)
                    v18 = getNetworkLatencyBuffer()
                    v19 = getDistanceToTitanRoot(v11)
                    v20 = v25.impactAt / v17
                    v21 = nil
                    if v25.mouthReachDistance and v1 then
                        v27 = v7.useGrappleMode == true
                        _, v23 = passesMouthReachCheck(v11, v1[2], v25, v27)
                        v21 = v23
                    end
                    local concat = table.concat
                    v23 = {}
                    local v31 = (" titanId=%* scale=%*"):format(v11.id, v11.scale)
                    local v32 = string.format("%.1f", v15)
                    local v33 = (" playerSpeed=%* animSpeed=%*"):format(v32, (string.format("%.3f", v17)))
                    local v34 = string.format("%.3f", v16 - v18)
                    local v35 = string.format("%.3f", v18)
                    local v36 = math.abs(v20 - (v16 - v18))
                    if 0.001 >= v36 then
                        v28 = ""
                    else
                        v28 = (" (capped from %*)"):format((string.format("%.3f", v20)))
                    end
                    v27 = (" impactAt=%* impactHorizon=%* + ping=%* => total=%*"):format(v25.impactAt, v34, v35, (string.format("%.3f", v16))) .. v28
                    local v37 = tostring(v7.useGrappleMode)
                    v34 = tostring(isOnGearGrapple())
                    local v38 = v30
                    if v38 then
                        v38 = v30.reeling == true
                    end
                    v32 = (" activeWindow=%* innerBoxScale=%* grappleMode=%* onGearGrapple=%* gearReeling=%*"):format(v24, innerBoxScale, v37, v34, (tostring(v38)))
                    if not HumanoidRootPart_2 then
                        v28 = " hrp=missing"
                    else
                        v29 = formatVector3(HumanoidRootPart_2.Position)
                        v28 = (" hrpNow=%* hrpVel=%*"):format(v29, (formatVector3(HumanoidRootPart_2.AssemblyLinearVelocity)))
                    end
                    if not v30 then
                        v36 = " gear=off"
                    elseif v30.enabled then
                        v37 = formatVector3(v30.goal)
                        v34 = tostring(v30.grapples.left.active)
                        v36 = (" gearGoal=%* leftActive=%* rightActive=%*"):format(v37, v34, (tostring(v30.grapples.right.active)))
                    end
                    v29 = (" distanceToTitanRoot=%*"):format((string.format("%.1f", v19)))
                    v35 = formatVector3(v1[1])
                    v38 = formatVector3(v1[2])
                    v37 = (" windowStart=%* impact=%* windowEnd=%*"):format(v35, v38, (formatVector3(v1[3])))
                    v23[1] = v31
                    v23[2] = v33
                    v23[3] = v27
                    v23[4] = v32
                    v23[5] = v28
                    v23[6] = v36
                    v23[7] = v29
                    v23[8] = v37
                    v23[9] = table.concat(v3, "\n")
                    v22 = concat(v23, "\n")
                    if v6 then
                        if not v2 then
                            v33 = "FAIL"
                        else
                            v33 = "PASS"
                        end
                        setLastEvaluationReport(v12, v33, v2, v22)
                    elseif not v5 then
                    end
                    if not v6 then
                        if not v2 then
                            logMoveDetection(v12, false, "FAIL no side passed impact window", v22, v5)
                        else
                            if not v4 then
                                v23 = ("PASS side=%*"):format(v2)
                            else
                                v23 = ("PASS side=%* (proximity)"):format(v2)
                            end
                            logMoveDetection(v12, true, v23, v22, v5)
                        end
                    elseif not v2 then
                        v28 = v7.useGrappleMode == true
                        recordMoveDetectionHistory(v12, "FAIL", v19, v15, v28, v21)
                        setDebugHistoryFailReport(v12, v22)
                    else
                        if not v4 then
                            v23 = ("PASS side=%*"):format(v2)
                        else
                            v23 = ("PASS side=%* (proximity)"):format(v2)
                        end
                        v36 = v7.useGrappleMode == true
                        recordMoveDetectionHistory(v12, v23, v19, v15, v36, v21)
                        setDebugHistoryPassReport(v12, v22)
                    end
                elseif not v6 then
                end
            end
            if not v2 then
                debug.profileend()
                return false, nil
            end
            if v10 and v8[v2] then
                showDebugInnerHitbox(v8[v2], innerBoxScale)
            end
            debug.profileend()
            return true, v2
        elseif p5.proximityFirst and p5.proximityDistance and isOnGearGrapple() then
            v7, v1 = tryProximitySide(p1, v8, p5, innerBoxScale)
            if v7 then
                if v6 then
                    if v1 then
                        setLastEvaluationReport(p2, "PASS", v7, v1)
                    end
                elseif not v5 then
                end
                if not v6 then
                    if v5 and p5 then
                        v4 = ("PASS side=%* (proximity-first)"):format(v7)
                        logMoveDetection(p2, true, v4, v1 or "", v5)
                    end
                elseif p5 then
                    v10 = getDistanceToTitanRoot(p1)
                    v4 = ("PASS side=%* (proximity-first)"):format(v7)
                    recordMoveDetectionHistory(p2, v4, v10, getLocalPlayerSpeed(), true, nil)
                    if v1 then
                        setDebugHistoryPassReport(p2, v1)
                    end
                elseif v5 and p5 then
                    v4 = ("PASS side=%* (proximity-first)"):format(v7)
                    logMoveDetection(p2, true, v4, v1 or "", v5)
                end
                debug.profileend()
                return true, v7
            end
        end
    elseif p5.grappleOrbitNow and isOnGearGrapple() then
        v7, v1 = tryGrappleOrbitNowSide(p1, v8, p5, innerBoxScale)
        if v7 then
            if v6 then
                if v1 then
                    setLastEvaluationReport(p2, "PASS", v7, v1)
                end
            elseif not v5 then
            end
            if not v6 then
                if v5 and p5 then
                    v4 = ("PASS side=%* (orbit-now)"):format(v7)
                    logMoveDetection(p2, true, v4, v1 or "", v5)
                end
            elseif p5 then
                v3 = ("PASS side=%* (orbit-now)"):format(v7)
                v4 = getDistanceToTitanRoot(p1)
                recordMoveDetectionHistory(p2, v3, v4, getLocalPlayerSpeed(), true, nil)
                if v1 then
                    setDebugHistoryPassReport(p2, v1)
                end
            elseif v5 and p5 then
                v4 = ("PASS side=%* (orbit-now)"):format(v7)
                logMoveDetection(p2, true, v4, v1 or "", v5)
            end
            debug.profileend()
            return true, v7
        end
    end
end
RunService.Heartbeat:Connect(function() -- Line: 1875 -- upvalues: u166 (ref)
    u166 = u166 + 1
end)
return {
    DEFAULT_ACTIVE_WINDOW = 0.06,
    INNER_BOX_SCALE = 0.85,
    isClientExpectedToBeWithin = function(p1, p2, p3, p4) -- Line: 1835 -- upvalues: getNetworkLatencyBuffer (val), evaluateDetection (val)
        local v1, v2
        debug.profilebegin((("DetectionBoxTitanClient.isClientExpectedToBeWithin:%*"):format(p2)))
        local v3 = (p3 or 0.15) + getNetworkLatencyBuffer()
        v1, v2 = evaluateDetection(p1, p2, v3, p4 or 0.06, nil)
        debug.profileend()
        return v1, v2
    end,
    isClientExpectedToBeWithinForMove = function(p1, p2) -- Line: 1808 -- upvalues: getLocalPlayerSpeed (val), getDistanceToTitanRoot (val), computeImpactHorizon (val), isOnGearGrapple (val), getNetworkLatencyBuffer (val), evaluateDetection (val)
        local v1, v2
        debug.profilebegin((("DetectionBoxTitanClient.isClientExpectedToBeWithinForMove:%*"):format(p2.box)))
        local v3 = getDistanceToTitanRoot(p1)
        local v4 = computeImpactHorizon(p2, getLocalPlayerSpeed(), v3)
        if p2.grappleImpactHorizonScale and isOnGearGrapple() then
            v4 = v4 * p2.grappleImpactHorizonScale
        end
        local v5 = v4 + getNetworkLatencyBuffer()
        v1, v2 = evaluateDetection(p1, p2.box, v5, p2.activeWindow or 0.06, p2)
        debug.profileend()
        return v1, v2
    end,
    computeImpactHorizon = computeImpactHorizon,
    flushDebugHistory = function(p1) -- Line: 309 -- upvalues: u157 (val), u158 (val), u159 (val), u160 (val)
        local v1, v2
        local v3 = {"--- detection history ---"}
        local v4 = u157[p1]
        if not v4 then
            table.insert(v3, "(empty)")
        elseif 0 < #v4 then
            v1 = v4
            v2 = nil
            local v5 = nil
            for i, j in v1, v2, v5 do
                table.insert(v3, j)
            end
        end
        v1 = u158[p1]
        if not v1 then
            v2 = u159[p1]
            if v2 then
                table.insert(v3, "--- nearest fail frame ---")
                table.insert(v3, v2)
            end
        else
            table.insert(v3, "--- trigger frame ---")
            table.insert(v3, v1)
        end
        v2 = u160[p1]
        if v2 then
            table.insert(v3, (("--- last evaluation (%* @ %*s) ---"):format(v2.outcome, (string.format("%.2f", v2.at)))))
            if v2.side then
                table.insert(v3, (("side=%*"):format(v2.side)))
            end
            table.insert(v3, v2.report)
        end
        u157[p1] = nil
        u158[p1] = nil
        u159[p1] = nil
        return table.concat(v3, "\n")
    end,
    clearDebugHistory = function(p1) -- Line: 354 -- upvalues: u157 (val), u158 (val), u159 (val)
        u157[p1] = nil
        u158[p1] = nil
        u159[p1] = nil
    end,
    getLastEvaluationReport = function(p1) -- Line: 300 -- upvalues: u160 (val)
        return u160[p1]
    end,
    getTransformedDetectionBoxes = function(p1, p2) -- Line: 1856 -- upvalues: getDetectionBoxes (val), transformDetectionBoxes (val)
        debug.profilebegin((("DetectionBoxTitanClient.getTransformedDetectionBoxes:%*"):format(p2)))
        local v1 = getDetectionBoxes(p2)
        if not v1 then
            debug.profileend()
            return nil
        end
        local v2 = transformDetectionBoxes(p1, v1)
        debug.profileend()
        return v2
    end,
}