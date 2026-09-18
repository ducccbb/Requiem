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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Sentinel.Eradicate
--                               Dumped in 0.00787 seconds
--                          Bytecode version 9  |  44 functions

local u263, v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("Draw"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Proficiencies = require(Animations:WaitForChild("Proficiencies"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Network = Common_6:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Proficiencies_2 = require(Namespaces:WaitForChild("Proficiencies"))
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Profiling = require(ReplicatedFirst:WaitForChild("Profiling"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Proficiencies_3 = require(Sounds_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local v3 = {
    ACTIVATED_COOLDOWN = 1,
    CANDIDATE_RADIUS_SCALE = 2.2,
    ERADICATE_CHAIN_WINDOW_SEC = 10,
    ERADICATE_CHAIN_MAX_KILLS = 3,
    UPPER_ARM_TOP_POLE_PUSH_STUDS = 2,
    SHOULDER_NECK_BACK_HALF_Z_SCALE = 0.62,
    SHOULDER_NECK_MEDIAL_HALF_X_SCALE = 0.12,
    SHOULDER_NECK_UP_HALF_Y_SCALE = 0.32,
    SHOULDER_NECK_EXTRA_BACK_STUDS = 4,
    SHOULDER_NECK_EXTRA_UP_STUDS = 2.5,
    ERADICATE_NODE_CLEARANCE_STUDS = 3,
    ERADICATE_SLIDE_CATMULL_ALPHA = 0.5,
    ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT = 28,
    ERADICATE_SLIDE_PATH_SPEED_MIN_STUDS_PER_SEC = 120,
    ERADICATE_SLIDE_PATH_SPEED_SCALE_FACTOR = 0.8,
    ERADICATE_SLIDE_TRANSITION_IN_SEC = 0.4,
    ERADICATE_SLIDE_EXIT_LAUNCH_STUDS_PER_SEC = 400,
    ERADICATE_SLIDE_EXIT_LAUNCH_UP_BIAS = 1.5,
}
if not Profiling.IS_USING_NO_COOLDOWNS then
    v1 = 120
else
    v1 = 5
end
v3.ERADICATE_CHAIN_LOCKOUT_SEC = v1
local u231 = require(Common_9:WaitForChild("Config")).define(v3)
local u236 = Vector3.new(2, 2, 2)
local u241 = Vector3.new(0.65, 0.65, 0.9)
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics = Common_10:WaitForChild("Statistics")
_, u263 = require(Statistics:WaitForChild("useFieldOfView"))()
local u265 = -math.huge
local u267 = -math.huge
local u268 = 0
local u269 = nil
local u270 = nil
local function cancelEradicateChainFailureThread() -- Line: 130 -- upvalues: u269 (ref)
    if u269 then
        task.cancel(u269)
        u269 = nil
    end
end
local function scheduleEradicateChainFailureThread() -- Line: 141 -- upvalues: cancelEradicateChainFailureThread (val), Signals (val), u231 (val), u269 (ref), u268 (ref), u267 (ref)
    cancelEradicateChainFailureThread()
    Signals.Buff:Fire({id = "Eradicate Chain", length = u231.ERADICATE_CHAIN_WINDOW_SEC})
    u269 = task.delay(u231.ERADICATE_CHAIN_WINDOW_SEC, function() -- Line: 146 -- upvalues: u269 (upval), u268 (upval), u267 (upval), u231 (upval), Signals (upval)
        u269 = nil
        u268 = 0
        u267 = os.clock() + u231.ERADICATE_CHAIN_LOCKOUT_SEC
        Signals.Buff:Fire({id = "Eradicate", length = u231.ERADICATE_CHAIN_LOCKOUT_SEC})
    end)
end
local function closestPointOnSegment(p1, p2, p3) -- Line: 162
    local v1 = p2 - p1
    local v2 = v1:Dot(v1)
    if v2 < 1e-08 then
        return p1
    end
    local v3 = (p3 - p1):Dot(v1) / v2
    return p1 + v1 * math.clamp(v3, 0, 1)
end
local function closestPointOnPolyline(p1, p2) -- Line: 179 -- upvalues: closestPointOnSegment (val)
    local v1, v2, v3, v4
    local v5 = p1[1]
    local huge = math.huge
    local v6 = #p1 - 1
    local v7 = 1
    v1, v2 = p1, p2
    for i = 1, v6, v7 do
        v3 = closestPointOnSegment(v1[i], v1[i + 1], v2)
        v4 = (v3 - v2).Magnitude ^ 2
        if v4 < huge then
            huge = v4
            v5 = v3
        end
    end
    return v5
end
local function buildArmChain(p1, p2) -- Line: 201
    local v1 = p2:FindFirstChild(p1 .. "Hand")
    local v2 = p2:FindFirstChild(p1 .. "LowerArm")
    local v3 = p2:FindFirstChild(p1 .. "UpperArm")
    if not v1 or not v3 then
        return nil
    end
    local v4 = {}
    table.insert(v4, (v1.CFrame * CFrame.new(0, -v1.Size.Y / 2, 0)).Position)
    if not v2 then
        table.insert(v4, (v1.CFrame * CFrame.new(0, v1.Size.Y / 2, 0)).Position)
        table.insert(v4, (v3.CFrame * CFrame.new(0, -v3.Size.Y / 2, 0)).Position)
    else
        table.insert(v4, (v2.CFrame * CFrame.new(0, -v2.Size.Y / 2, 0)).Position)
        table.insert(v4, (v2.CFrame * CFrame.new(0, v2.Size.Y / 2, 0)).Position)
    end
    table.insert(v4, (v3.CFrame * CFrame.new(0, v3.Size.Y / 2, 0)).Position)
    return v4
end
local function collectR15ArmParts(p1, p2) -- Line: 228
    local v1
    local v2 = {}
    local v3 = {p1 .. "Hand", p1 .. "LowerArm", p1 .. "UpperArm"}
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p2:FindFirstChild(j)
        if v1 and v1:IsA("BasePart") then
            table.insert(v2, v1)
        end
    end
    return v2
end
local function estimateRadiusFromPart(p1) -- Line: 242
    return math.max(p1.Size.X, p1.Size.Z) * 0.5 + 2
end
local function closestSurfacePointFromCandidate(p1, p2) -- Line: 249
    local ClosestPointOnSurface, v1
    local v2 = nil
    local huge = math.huge
    local v3 = p1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        ClosestPointOnSurface = j:GetClosestPointOnSurface(p2)
        v1 = (ClosestPointOnSurface - p2).Magnitude ^ 2
        if v1 < huge then
            huge = v1
            v2 = ClosestPointOnSurface
        end
    end
    return v2
end
local function pushWorldPointOffLimbAxis(p1, p2, p3) -- Line: 266 -- upvalues: closestPointOnSegment (val)
    local RightVector
    local v1 = p2.Size.Y * 0.5
    local v2 = p1 - closestPointOnSegment((p2.CFrame * CFrame.new(0, -v1, 0)).Position, (p2.CFrame * CFrame.new(0, v1, 0)).Position, p1)
    if v2.Magnitude >= 0.0001 then
        RightVector = v2.Unit
    else
        RightVector = p2.CFrame.RightVector
    end
    return p1 + RightVector * p3
end
local function getNearestArmPartForPoint(p1, p2, p3) -- Line: 283
    local v1
    if 0 >= #p2 then
        return p3
    end
    local v2 = nil
    local huge = math.huge
    local v3 = p2
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = (j:GetClosestPointOnSurface(p1) - p1).Magnitude ^ 2
        if v1 < huge then
            huge = v1
            v2 = j
        end
    end
    if v2 then
        return v2
    end
    return p3
end
local function pushPointOffNearestArmLimb(p1, p2, p3, p4) -- Line: 305 -- upvalues: pushWorldPointOffLimbAxis (val), getNearestArmPartForPoint (val)
    local v1 = getNearestArmPartForPoint(p1, p2, p3)
    return pushWorldPointOffLimbAxis(p1, v1, p4)
end
local function pushWorldPointOffTorsoBulk(p1, p2, p3) -- Line: 317
    local Unit
    local v1 = p1 - p2.Position
    if v1.Magnitude >= 0.0001 then
        Unit = v1.Unit
    else
        Unit = -p2.CFrame.LookVector
    end
    return p1 + Unit * p3
end
local function surfacePointLimbTopRimTowardWorldPoint(p1, p2) -- Line: 331
    local Position = (p1.CFrame * CFrame.new(0, p1.Size.Y * 0.5, 0)).Position
    local UpVector = p1.CFrame.UpVector
    local v1 = p2 - Position
    local RightVector = v1 - UpVector * v1:Dot(UpVector)
    if RightVector.Magnitude < 0.0001 then
        RightVector = p1.CFrame.RightVector
    end
    return p1:GetClosestPointOnSurface(Position + RightVector.Unit * (math.max(p1.Size.X, p1.Size.Z) * 0.5))
end
local function projectedArmPointIsLowerAlongPoleThanUpperArmBottom(p1, p2, p3) -- Line: 354
    local v1
    local v2 = -p2.Size.Y * 0.5
    local Position = (p2.CFrame * CFrame.new(0, v2, 0)).Position
    if not p1 or 2 > #p1 then
        local v3 = (p3 - Position):Dot(p2.CFrame.UpVector)
        v1 = v3 < 0
        return v1
    end
    local v4 = p1[1]
    v1 = p1[#p1] - v4
    if v1.Magnitude < 1e-05 then
        return false
    end
    local Unit = v1.Unit
    v2 = (p3 - v4):Dot(Unit)
    local v5 = v2 < (Position - v4):Dot(Unit)
    return v5
end
local function surfacePointUpperBackShoulderNeckJunction(p1, p2, p3) -- Line: 386 -- upvalues: u231 (val)
    local WorldPosition, v1, v2
    local UpperTorso = p1:FindFirstChild("UpperTorso")
    if not UpperTorso then
        return nil
    end
    local CFrame = UpperTorso.CFrame
    local RightVector = CFrame.RightVector
    if p2 ~= "Left" then
        v1 = "RightShoulderRigAttachment"
    else
        v1 = "LeftShoulderRigAttachment"
    end
    local v3 = UpperTorso:FindFirstChild(v1)
    if not v3 then
        WorldPosition = (p3.CFrame * CFrame.new(0, p3.Size.Y * 0.5, 0)).Position
    else
        WorldPosition = v3.WorldPosition
    end
    if p2 ~= "Left" then
        v2 = -RightVector
    else
        v2 = RightVector
    end
    return UpperTorso:GetClosestPointOnSurface(WorldPosition + -CFrame.LookVector * (UpperTorso.Size.Z * 0.5 * u231.SHOULDER_NECK_BACK_HALF_Z_SCALE + u231.SHOULDER_NECK_EXTRA_BACK_STUDS) + v2 * (UpperTorso.Size.X * 0.5 * u231.SHOULDER_NECK_MEDIAL_HALF_X_SCALE) + CFrame.UpVector * (UpperTorso.Size.Y * 0.5 * u231.SHOULDER_NECK_UP_HALF_Y_SCALE + u231.SHOULDER_NECK_EXTRA_UP_STUDS))
end
local function surfacePointUpperTorsoNeckBack(p1) -- Line: 423
    local UpperTorso = p1:FindFirstChild("UpperTorso")
    if not UpperTorso then
        return nil
    end
    return UpperTorso:GetClosestPointOnSurface((UpperTorso.CFrame * CFrame.new(0, UpperTorso.Size.Y * 0.5, UpperTorso.Size.Z * 0.5)).Position)
end
local function createWeldedPathMarker(p1, p2, p3, p4) -- Line: 443 -- upvalues: u236 (val)
    local Part = Instance.new("Part")
    Part.Name = p2
    Part.Size = u236
    Part.CFrame = CFrame.new(p3)
    Part.Anchored = false
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Massless = true
    Part.CastShadow = false
    Part.Transparency = 1
    Part.Parent = p1
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = p4
    WeldConstraint.Part1 = Part
    WeldConstraint.Parent = Part
    return Part
end
local function replaceEradicateWeldedMarkers(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) -- Line: 485 -- upvalues: getNearestArmPartForPoint (val), createWeldedPathMarker (val)
    local EradicatePathMarkers = p1:FindFirstChild("EradicatePathMarkers")
    if EradicatePathMarkers then
        EradicatePathMarkers:Destroy()
    end
    local Folder = Instance.new("Folder")
    Folder.Name = "EradicatePathMarkers"
    Folder.Parent = p1
    local v1 = getNearestArmPartForPoint(p2, p7, p8)
    createWeldedPathMarker(Folder, "EradicateMarker_ProjectedArm", p2, v1)
    if p3 and p10 then
        createWeldedPathMarker(Folder, "EradicateMarker_LowerArmTop", p3, p10)
    end
    createWeldedPathMarker(Folder, "EradicateMarker_UpperArmTop", p4, p9)
    if p5 and p11 then
        createWeldedPathMarker(Folder, "EradicateMarker_ShoulderNeck", p5, p11)
    end
    if p6 and p11 then
        createWeldedPathMarker(Folder, "EradicateMarker_NeckBack", p6, p11)
    end
end
local function stopEradicatePathTraveler() -- Line: 529 -- upvalues: u270 (ref)
    local v1 = u270
    u270 = nil
    if v1 then
        v1()
    end
end
local function distPointToSegment(p1, p2, p3) -- Line: 545
    local v1 = p3 - p2
    local v2 = v1:Dot(v1)
    if v2 < 1e-08 then
        return (p1 - p2).Magnitude
    end
    local v3 = (p1 - p2):Dot(v1) / v2
    return (p1 - (p2 + v1 * math.clamp(v3, 0, 1))).Magnitude
end
local function buildEradicateSlideWaypoints(p1, p2, p3) -- Line: 563
    local v1
    local EradicatePathMarkers = p1:FindFirstChild("EradicatePathMarkers")
    if not EradicatePathMarkers then
        return nil
    end
    local EradicateMarker_UpperArmTop = EradicatePathMarkers:FindFirstChild("EradicateMarker_UpperArmTop")
    if not EradicateMarker_UpperArmTop or not (EradicateMarker_UpperArmTop:IsA("BasePart")) then
        return nil
    end
    local v2 = {p2}
    local EradicateMarker_LowerArmTop = EradicatePathMarkers:FindFirstChild("EradicateMarker_LowerArmTop")
    if not EradicateMarker_LowerArmTop then
        v1 = nil
    elseif EradicateMarker_LowerArmTop:IsA("BasePart") then
        v1 = EradicateMarker_LowerArmTop
    end
    if p3 and v1 then
        table.insert(v2, v1.Position)
    end
    table.insert(v2, EradicateMarker_UpperArmTop.Position)
    local EradicateMarker_ShoulderNeck = EradicatePathMarkers:FindFirstChild("EradicateMarker_ShoulderNeck")
    if EradicateMarker_ShoulderNeck and EradicateMarker_ShoulderNeck:IsA("BasePart") then
        table.insert(v2, EradicateMarker_ShoulderNeck.Position)
    end
    local EradicateMarker_NeckBack = EradicatePathMarkers:FindFirstChild("EradicateMarker_NeckBack")
    if EradicateMarker_NeckBack and EradicateMarker_NeckBack:IsA("BasePart") then
        table.insert(v2, EradicateMarker_NeckBack.Position)
    end
    if #v2 < 2 then
        return nil
    end
    return v2
end
local function catmullRomBarryGoldmanEval(p1, p2, p3, p4, p5, p6, p7, p8, p9) -- Line: 611
    local function mix(p1, p2, p3, p4, p5) -- Line: 622
        local v1 = math.abs(p4 - p3)
        if v1 < 1e-12 then
            return p1
        end
        return p1 + (p2 - p1) * ((p5 - p3) / (p4 - p3))
    end
    local v1 = mix(p1, p2, p5, p6, p9)
    local v2 = mix(p2, p3, p6, p7, p9)
    local v3 = mix(p3, p4, p7, p8, p9)
    local v4 = mix(v1, v2, p5, p7, p9)
    local v5 = mix(v2, v3, p6, p8, p9)
    return mix(v4, v5, p6, p7, p9)
end
local function catmullRomPos(p1, p2, p3, p4, p5) -- Line: 647 -- upvalues: u231 (val), catmullRomBarryGoldmanEval (val)
    local ERADICATE_SLIDE_CATMULL_ALPHA = u231.ERADICATE_SLIDE_CATMULL_ALPHA
    local function knotInc(p1, p2) -- Line: 649 -- upvalues: ERADICATE_SLIDE_CATMULL_ALPHA (val)
        local Magnitude = (p2 - p1).Magnitude
        if Magnitude < 1e-12 then
            return 1e-06
        end
        return Magnitude ^ ERADICATE_SLIDE_CATMULL_ALPHA
    end
    local v1 = knotInc(p1, p2) + 0
    local v2 = v1 + knotInc(p2, p3)
    local v3 = v2 + knotInc(p3, p4)
    return catmullRomBarryGoldmanEval(p1, p2, p3, p4, 0, v1, v2, v3, v1 + p5 * (v2 - v1))
end
local function catmullRomTan(p1, p2, p3, p4, p5) -- Line: 674 -- upvalues: catmullRomPos (val)
    local v1 = math.max(0, p5 - 0.000244140625)
    local v2 = math.min(1, p5 + 0.000244140625)
    local v3 = catmullRomPos(p1, p2, p3, p4, v1)
    local v4 = catmullRomPos(p1, p2, p3, p4, v2) - v3
    if v4.Magnitude >= 1e-12 then
        return v4.Unit
    end
    local v5 = p3 - p2
    if v5.Magnitude < 1e-12 then
        return (Vector3.new(0, 1, 0))
    end
    return v5.Unit
end
local function catmullRomSegmentControls(p1, p2) -- Line: 697
    local v1 = p1[math.max(1, p2 - 1)]
    return v1, p1[p2], p1[p2 + 1], p1[math.min(#p1, p2 + 2)]
end
local function catmullRomSegmentChordLength(p1, p2, p3, p4) -- Line: 715 -- upvalues: u231 (val), catmullRomPos (val)
    local v1
    local ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT = u231.ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT
    local v2 = 0
    local v3 = catmullRomPos(p1, p2, p3, p4, 0)
    local v4 = ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = catmullRomPos(p1, p2, p3, p4, i / ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT)
        v2 = v2 + (v1 - v3).Magnitude
        v3 = v1
    end
    return v2
end
local function catmullRomPathTotalLength(p1) -- Line: 733 -- upvalues: catmullRomSegmentControls (val), catmullRomSegmentChordLength (val)
    local v1, v2, v3, v4
    local v5 = #p1
    if v5 < 2 then
        return 0
    end
    local v6 = 0
    local v7 = v5 - 1
    local v8 = 1
    for i = 1, v7, v8 do
        v1, v2, v3, v4 = catmullRomSegmentControls(p1, i)
        v6 = v6 + catmullRomSegmentChordLength(v1, v2, v3, v4)
    end
    return v6
end
local function catmullRomPositionAndTangentAtArcLength(p1, p2) -- Line: 752 -- upvalues: catmullRomSegmentControls (val), catmullRomSegmentChordLength (val), catmullRomPos (val), catmullRomTan (val), u231 (val)
    local Magnitude, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20
    local v21 = #p1
    if v21 < 2 then
        return p1[1], (Vector3.new(0, 1, 0))
    end
    local v22 = table.create(v21 - 1)
    local v23 = 0
    local v24 = v21 - 1
    local v25 = 1
    for i = 1, v24, v25 do
        v19, v20, v1, v2 = catmullRomSegmentControls(p1, i)
        v3 = catmullRomSegmentChordLength(v19, v20, v1, v2)
        v22[i] = v3
        v23 = v23 + v3
    end
    v24 = math.clamp(p2, 0, (math.max(v23, 1e-09)))
    if v23 < 1e-08 then
        _, v18, v19 = catmullRomSegmentControls(p1, 1)
        v1 = v19 - v18
        if v1.Magnitude < 1e-06 then
            v1 = Vector3.new(0, 1, 0)
        end
        return v18, v1.Unit
    end
    if v24 <= 1e-06 then
        v25, v18, v19, v20 = catmullRomSegmentControls(p1, 1)
        v1 = catmullRomPos(v25, v18, v19, v20, 0)
        v2 = catmullRomTan(v25, v18, v19, v20, 0)
        if v2.Magnitude < 1e-06 then
            v2 = v19 - v18
        end
        return v1, v2.Unit
    end
    if v23 - 1e-06 <= v24 then
        v25, v18, v19, v20 = catmullRomSegmentControls(p1, v21 - 1)
        v1 = catmullRomPos(v25, v18, v19, v20, 1)
        v2 = catmullRomTan(v25, v18, v19, v20, 1)
        if v2.Magnitude < 1e-06 then
            v2 = v19 - v18
        end
        return v1, v2.Unit
    end
    v25 = v24
    local ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT = u231.ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT
    v19 = v21 - 1
    v20 = 1
    local v26 = p1
    for j = 1, v19, v20 do
        v2 = v22[j]
        if v2 >= 1e-08 then
            v3, v4, v5, v6 = catmullRomSegmentControls(v26, j)
            if v25 <= v2 + 1e-06 then
                if v25 <= 1e-06 then
                    v7 = catmullRomPos(v3, v4, v5, v6, 0)
                    v8 = catmullRomTan(v3, v4, v5, v6, 0)
                    if v8.Magnitude < 1e-06 then
                        v8 = v5 - v4
                    end
                    return v7, v8.Unit
                end
                v7 = 0
                v8 = catmullRomPos(v3, v4, v5, v6, 0)
                v9 = ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT
                v10 = 1
                for k = 1, v9, v10 do
                    v11 = k / ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT
                    v12 = catmullRomPos(v3, v4, v5, v6, v11)
                    Magnitude = (v12 - v8).Magnitude
                    if v25 - 1e-06 <= v7 + Magnitude then
                        v13 = (k - 1) / ERADICATE_SLIDE_CATMULL_LENGTH_SAMPLES_PER_SEGMENT
                        if 1e-09 >= Magnitude then
                            v14 = 0
                        else
                            v14 = (v25 - v7) / Magnitude
                        end
                        v15 = math.clamp(v13 + v14 * (v11 - v13), 0, 1)
                        v16 = catmullRomPos(v3, v4, v5, v6, v15)
                        v17 = catmullRomTan(v3, v4, v5, v6, v15)
                        if v17.Magnitude < 1e-06 then
                            v17 = v5 - v4
                        end
                        return v16, v17.Unit
                    end
                    v7 = v7 + Magnitude
                    v8 = v12
                end
                v9 = catmullRomPos(v3, v4, v5, v6, 1)
                v10 = catmullRomTan(v3, v4, v5, v6, 1)
                if v10.Magnitude < 1e-06 then
                    v10 = v5 - v4
                end
                return v9, v10.Unit
            end
            v25 = v25 - v2
        end
    end
    v19, v20, v1, v2 = catmullRomSegmentControls(v26, v21 - 1)
    v3 = catmullRomPos(v19, v20, v1, v2, 1)
    v4 = catmullRomTan(v19, v20, v1, v2, 1)
    if v4.Magnitude < 1e-06 then
        v4 = v1 - v20
    end
    return v3, v4.Unit
end
local function startEradicateAnchoredPathTraveler(p1, p2) -- Line: 862 -- upvalues: stopEradicatePathTraveler (val), Proficiencies_2 (val), u241 (val), useAnimatorObserver (val), Proficiencies (val), ClientStateHandler (val), u231 (val), distPointToSegment (val), buildEradicateSlideWaypoints (val), catmullRomPathTotalLength (val), catmullRomPositionAndTangentAtArcLength (val), u263 (val), RunService (val), u270 (ref), Sounds (val), Proficiencies_3 (val)
    local v1, v2, v3
    stopEradicatePathTraveler()
    local EradicatePathTraveler = p1:FindFirstChild("EradicatePathTraveler")
    if EradicatePathTraveler then
        EradicatePathTraveler:Destroy()
    end
    Proficiencies_2.Eradicate.unreliablePost(p1:GetAttribute("id"))
    local Folder = Instance.new("Folder")
    Folder.Name = "EradicatePathTraveler"
    Folder.Parent = p1
    local Part = Instance.new("Part")
    Part.Name = "EradicatePathTravelerPart"
    Part.Size = u241
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Color = Color3.fromRGB(255, 255, 255)
    Part.Transparency = 1
    Part.Parent = Folder
    local u47 = useAnimatorObserver.play(Proficiencies.Eradicate.Loop, 0, Enum.AnimationPriority.Action4)
    local HumanoidRootPart = p2
    if HumanoidRootPart then
        HumanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
    end
    local Humanoid = p2
    if Humanoid then
        Humanoid = p2:FindFirstChildOfClass("Humanoid")
    end
    ClientStateHandler.updateState(ClientStateHandler.States.ERADICATING, true)
    local u67 = {}
    local function setSlideRigAnchored(p1) -- Line: 903 -- upvalues: HumanoidRootPart (val), Humanoid (val), p2 (val), u67 (val)
        local part
        if not HumanoidRootPart or not Humanoid or not HumanoidRootPart.Parent or not Humanoid.Parent then
            return
        end
        if p1 then
            if p2 and #u67 == 0 then
                for k, n in p2:GetDescendants() do
                    if n:IsA("BasePart") then
                        table.insert(u67, {part = n, canCollide = n.CanCollide})
                        n.CanCollide = false
                    end
                end
            end
            HumanoidRootPart.Anchored = true
            Humanoid.AutoRotate = false
            Humanoid.PlatformStand = true
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
            return
        end
        HumanoidRootPart.Anchored = false
        Humanoid.AutoRotate = true
        Humanoid.PlatformStand = false
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        local v1 = u67
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            part = j.part
            if part.Parent then
                part.CanCollide = j.canCollide
            end
        end
        table.clear(u67)
    end
    if not HumanoidRootPart or not HumanoidRootPart.Parent then
        Folder:Destroy()
        return
    end
    local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
    local u82 = math.max(AssemblyLinearVelocity.Magnitude * u231.ERADICATE_SLIDE_PATH_SPEED_SCALE_FACTOR, u231.ERADICATE_SLIDE_PATH_SPEED_MIN_STUDS_PER_SEC)
    setSlideRigAnchored(true)
    local Position = HumanoidRootPart.Position
    local EradicatePathMarkers = p1:FindFirstChild("EradicatePathMarkers")
    if not EradicatePathMarkers then
        setSlideRigAnchored(false)
        Folder:Destroy()
        return
    end
    local EradicateMarker_UpperArmTop = EradicatePathMarkers:FindFirstChild("EradicateMarker_UpperArmTop")
    if not EradicateMarker_UpperArmTop or not (EradicateMarker_UpperArmTop:IsA("BasePart")) then
        setSlideRigAnchored(false)
        Folder:Destroy()
        return
    end
    local EradicateMarker_LowerArmTop = EradicatePathMarkers:FindFirstChild("EradicateMarker_LowerArmTop")
    if not EradicateMarker_LowerArmTop then
        v1 = nil
    elseif EradicateMarker_LowerArmTop:IsA("BasePart") then
        v1 = EradicateMarker_LowerArmTop
    end
    local u132 = false
    if v1 then
        v2 = distPointToSegment(v1.Position, Position, EradicateMarker_UpperArmTop.Position)
        u132 = 2.25 < v2
    end
    v2 = buildEradicateSlideWaypoints(p1, Position, u132)
    if not v2 or #v2 < 2 then
        setSlideRigAnchored(false)
        Folder:Destroy()
        return
    end
    local v4 = catmullRomPathTotalLength(v2)
    if v4 < 0.0001 then
        setSlideRigAnchored(false)
        Folder:Destroy()
        return
    end
    local function easeOutCubic01(p1) -- Line: 999
        local v1 = math.clamp(p1, 0, 1)
        return 1 - (1 - v1) * (1 - v1) * (1 - v1)
    end
    _, v3 = catmullRomPositionAndTangentAtArcLength(v2, 0)
    local v5 = math.max(0, AssemblyLinearVelocity:Dot(v3))
    local u179 = v5 * u231.ERADICATE_SLIDE_PATH_SPEED_SCALE_FACTOR
    local CFrame = HumanoidRootPart.CFrame
    Part.CFrame = CFrame
    HumanoidRootPart.CFrame = CFrame
    local UpperTorso = p1:FindFirstChild("UpperTorso")
    if not UpperTorso then
        stopEradicatePathTraveler()
        return
    end
    local u205 = u263("eradicate", 10, "subtract", 5, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    local u219 = CFrame.new((UpperTorso.CFrame * CFrame.new(0, UpperTorso.Size.Y / 2, 80)).Position, UpperTorso.CFrame.Position)
    local u220 = 0
    local u221 = 0
    local u235 = RunService.RenderStepped:Connect(function(a1) -- Line: 1040 -- upvalues: Part (val), p1 (val), stopEradicatePathTraveler (upval), buildEradicateSlideWaypoints (upval), Position (val), u132 (ref), catmullRomPathTotalLength (upval), u221 (ref), catmullRomPositionAndTangentAtArcLength (upval), easeOutCubic01 (val), u231 (upval), u220 (ref), CFrame (val), HumanoidRootPart (val), Humanoid (val), u219 (val), u179 (val), u82 (val)
        local v1, v2, v3
        if not Part.Parent or not p1.Parent then
            stopEradicatePathTraveler()
            return
        end
        local v4 = buildEradicateSlideWaypoints(p1, Position, u132)
        if not v4 or #v4 < 2 then
            stopEradicatePathTraveler()
            return
        end
        local v5 = catmullRomPathTotalLength(v4)
        if v5 < 0.0001 then
            stopEradicatePathTraveler()
            return
        end
        v1, v2 = catmullRomPositionAndTangentAtArcLength(v4, u221 * v5)
        local v6 = CFrame.lookAt(v1, v1 + v2, Vector3.yAxis)
        if 1e-06 >= u231.ERADICATE_SLIDE_TRANSITION_IN_SEC then
            v3 = 1
        else
            v3 = u220 / u231.ERADICATE_SLIDE_TRANSITION_IN_SEC
        end
        local v7 = easeOutCubic01(v3)
        v3 = CFrame:Lerp(v6, v7)
        local LookVector = v3.LookVector
        local v8 = math.abs((LookVector:Dot(Vector3.yAxis)))
        if 0.999 < v8 then
            LookVector = v2.Unit
        end
        v3 = CFrame.lookAt(v3.Position, v3.Position + LookVector, Vector3.yAxis)
        Part.CFrame = v3
        if HumanoidRootPart and Humanoid and HumanoidRootPart.Parent and Humanoid.Parent then
            HumanoidRootPart.CFrame = v3
        end
        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(u219, v7 * 0.02)
        u220 = u220 + a1
        local v9 = u221 + (u179 + (u82 - u179) * v7) * a1 / math.max(v5, 1e-06)
        u221 = math.min(v9, 1)
        if 1 <= u221 then
            stopEradicatePathTraveler()
        end
    end)
    function u270() -- Line: 1102 -- upvalues: u235 (ref), setSlideRigAnchored (val), Folder (val), HumanoidRootPart (val), Humanoid (val), p1 (val), u47 (val), useAnimatorObserver (upval), Proficiencies (upval), u231 (upval), RunService (upval), Sounds (upval), Proficiencies_3 (upval), Proficiencies_2 (upval), ClientStateHandler (upval), u205 (ref), u263 (upval)
        if u235.Connected then
            u235:Disconnect()
        end
        setSlideRigAnchored(false)
        if Folder.Parent then
            Folder:Destroy()
        end
        if not HumanoidRootPart or not HumanoidRootPart.Parent or not Humanoid or not Humanoid.Parent or not p1.Parent then
            return
        end
        local UpperTorso = p1:FindFirstChild("UpperTorso")
        if not UpperTorso then
            return
        end
        if u47 and u47.IsPlaying then
            u47:Stop(0.3)
        end
        useAnimatorObserver.play(Proficiencies.Eradicate.Ending, 0, Enum.AnimationPriority.Action4)
        local v1 = HumanoidRootPart.Position - p1:GetPivot().Position
        local zAxis = Vector3.new(v1.X, 0, v1.Z)
        if zAxis.Magnitude < 0.05 then
            zAxis = Vector3.new(-UpperTorso.CFrame.LookVector.X, 0, -UpperTorso.CFrame.LookVector.Z)
        end
        if zAxis.Magnitude < 0.0001 then
            zAxis = Vector3.zAxis
        end
        local Unit = (zAxis.Unit + Vector3.yAxis * u231.ERADICATE_SLIDE_EXIT_LAUNCH_UP_BIAS).Unit
        Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        local u89 = nil
        local u90 = 0
        Sounds.playGlobalSoundEffect(Proficiencies_3.Eradicate.Success, 0.1, 0.5, 10)
        Proficiencies_2.Eradicate.unreliablePost(p1:GetAttribute("id"))
        ClientStateHandler.updateState(ClientStateHandler.States.ERADICATING, false)
        u205()
        u205 = u263("eradicate", 100, "set", 5, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        task.delay(0.3, function() -- Line: 1193 -- upvalues: u205 (upval)
            u205(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
    end
end
local function debugDrawEradicatePointPath(p1, p2, p3, p4, p5) end
return {
    activated = function(p1, p2, p3) -- Line: 1273 -- upvalues: u267 (ref), u265 (ref), u231 (val), Sounds (val), Proficiencies_3 (val), stopEradicatePathTraveler (val), Character (val), buildArmChain (val), collectR15ArmParts (val), closestPointOnPolyline (val), estimateRadiusFromPart (val), closestSurfacePointFromCandidate (val), projectedArmPointIsLowerAlongPoleThanUpperArmBottom (val), surfacePointLimbTopRimTowardWorldPoint (val), surfacePointUpperBackShoulderNeckJunction (val), surfacePointUpperTorsoNeckBack (val), pushPointOffNearestArmLimb (val), pushWorldPointOffLimbAxis (val), pushWorldPointOffTorsoBulk (val), Signals (val), replaceEradicateWeldedMarkers (val), u268 (ref), cancelEradicateChainFailureThread (val), scheduleEradicateChainFailureThread (val), startEradicateAnchoredPathTraveler (val)
        local v1, v2, v3, v4
        local v5 = os.clock()
        if v5 < u267 then
            return false
        end
        local v6 = v5 - u265
        if v6 < u231.ACTIVATED_COOLDOWN then
            return false
        end
        Sounds.playGlobalSoundEffect(Proficiencies_3.Eradicate.Enabled, 0.1, 0.5, 10)
        stopEradicatePathTraveler()
        if not (p2.Name:match("^Left")) then
            v6 = "Right"
        else
            v6 = "Left"
        end
        local v7 = Character.getCharacter()
        if not v7 then
            return false
        end
        local HumanoidRootPart = v7.HumanoidRootPart
        local CFrame = HumanoidRootPart.CFrame
        local v8 = buildArmChain(v6, p1)
        local v9 = collectR15ArmParts(v6, p1)
        local v10 = if v8 and 1 <= #v8 then closestPointOnPolyline(v8, CFrame.Position) else nil
        if not v8 then
            v1 = p2:GetClosestPointOnSurface(CFrame.Position)
        elseif 0 < #v9 then
            v2 = v10
            local LookVector = CFrame.Position - v2
            if LookVector.Magnitude < 0.001 then
                LookVector = CFrame.Position - p2.Position
            end
            if LookVector.Magnitude < 0.001 then
                LookVector = HumanoidRootPart.CFrame.LookVector
            end
            local v11 = v2 + LookVector.Unit * (estimateRadiusFromPart(p2) * u231.CANDIDATE_RADIUS_SCALE)
            v3 = closestSurfacePointFromCandidate(v9, v11)
            if not v3 then
                v1 = p2:GetClosestPointOnSurface(CFrame.Position)
            else
                v1 = v3
            end
        end
        v2 = p1:FindFirstChild(v6 .. "UpperArm")
        local v12 = p1:FindFirstChild(v6 .. "LowerArm")
        local v13 = if v12 and projectedArmPointIsLowerAlongPoleThanUpperArmBottom(v8, v2, v1) then surfacePointLimbTopRimTowardWorldPoint(v12, v1) else nil
        v3 = surfacePointLimbTopRimTowardWorldPoint(v2, v13 or v1)
        local v14 = surfacePointUpperBackShoulderNeckJunction(p1, v6, v2)
        local v15 = surfacePointUpperTorsoNeckBack(p1)
        local v16 = pushPointOffNearestArmLimb(v1, v9, p2, u231.ERADICATE_NODE_CLEARANCE_STUDS)
        if not v13 then
            v4 = nil
        else
            v4 = pushWorldPointOffLimbAxis(v13, v12, u231.ERADICATE_NODE_CLEARANCE_STUDS)
        end
        local v17 = pushWorldPointOffLimbAxis(v3, v2, u231.ERADICATE_NODE_CLEARANCE_STUDS)
        local UpperTorso = p1:FindFirstChild("UpperTorso")
        if v14 and UpperTorso then
            v14 = pushWorldPointOffTorsoBulk(v14, UpperTorso, u231.ERADICATE_NODE_CLEARANCE_STUDS)
        end
        if v15 and UpperTorso then
            v15 = pushWorldPointOffTorsoBulk(v15, UpperTorso, u231.ERADICATE_NODE_CLEARANCE_STUDS)
        end
        Signals.Monologue:Fire({"Cut it apart. End it clean.", "First the arm. Always the nape.", "Too slow. Lost the arm.", "Reduced. Then erased."})
        replaceEradicateWeldedMarkers(p1, v16, v4, v17 + v2.CFrame.UpVector * u231.UPPER_ARM_TOP_POLE_PUSH_STUDS, v14, v15, v9, p2, v2, v12, UpperTorso)
        u268 = u268 + 1
        if u231.ERADICATE_CHAIN_MAX_KILLS > u268 then
            scheduleEradicateChainFailureThread()
        else
            cancelEradicateChainFailureThread()
            u268 = 0
            u267 = os.clock() + u231.ERADICATE_CHAIN_LOCKOUT_SEC
            Signals.Buff:Fire({id = "Eradicate", length = u231.ERADICATE_CHAIN_LOCKOUT_SEC})
        end
        startEradicateAnchoredPathTraveler(p1, v7)
        u265 = os.clock()
        return true
    end,
    settings = {},
}