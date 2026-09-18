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
--       File: ReplicatedStorage.Client.User.Miscellaneous.ClientCompanionHandler
--                               Dumped in 0.0100 seconds
--                          Bytecode version 9  |  59 functions

local mount, mount_3
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Companions = require(Namespaces:WaitForChild("Companions"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common_2:WaitForChild("Alive"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Animals = require(Sounds_2:WaitForChild("Animals"))
local Workspace = game:GetService("Workspace")
local Progression = v1.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local State_2 = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local Categories = ClientStateHandler.Categories
local States = ClientStateHandler.States
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Animations = Common_8:WaitForChild("Animations")
local Horse = require(Animations:WaitForChild("Horse"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Observers = Common_9:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Observers_2 = Common_10:WaitForChild("Observers")
local useCharacterObserver = require(Observers_2:WaitForChild("useCharacterObserver"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Utilities_4 = Common_11:WaitForChild("Utilities")
local Draw = require(Utilities_4:WaitForChild("Draw"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_12:WaitForChild("Common")
local Statistics = Common_12:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_13:WaitForChild("Common")
local Statistics_2 = Common_13:WaitForChild("Statistics")
local useJumpPower = require(Statistics_2:WaitForChild("useJumpPower"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_14:WaitForChild("Common")
local Utilities_5 = Common_14:WaitForChild("Utilities")
local State_3 = require(Utilities_5:WaitForChild("State"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_15:WaitForChild("Common")
local Log = require(Common_15:WaitForChild("Log"))
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Profiling = require(ReplicatedFirst:WaitForChild("Profiling"))
local u364 = {0.45, 0.35, 0.28, 0.45}
local LocalPlayer = Players.LocalPlayer
local u370 = nil
local u371 = {animations = {}, riderAnimations = {}, connections = {}}
local u375 = {}
local u376 = {}
local u377 = nil
local u378 = nil
local u379 = {}
local u380 = {}
local u381 = false
local u382 = {}
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local Controls = require(PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local Sound = Instance.new("Sound")
Sound.SoundId = Animals.Horse.Step
Sound.Volume = 1
Sound.RollOffMinDistance = 5
Sound.RollOffMaxDistance = 100
Sound.PlaybackSpeed = 1
local function teardownCompanionHeightRayDebug() -- Line: 241 -- upvalues: u371 (val)
    if u371.heightRayDebug then
        u371.heightRayDebug.folder:Destroy()
        u371.heightRayDebug = nil
    end
end
local function teardownCompanionPitchRayDebug() -- Line: 252 -- upvalues: u371 (val)
    if u371.pitchRayDebug then
        u371.pitchRayDebug.folder:Destroy()
        u371.pitchRayDebug = nil
    end
end
local function ensureCompanionHeightRayDebug() -- Line: 263 -- upvalues: u371 (val), Workspace (val), Draw (val)
    local heightRayDebug = u371.heightRayDebug
    if heightRayDebug then
        return heightRayDebug
    end
    local Folder = Instance.new("Folder")
    Folder.Name = "CompanionHeightRayDebug"
    Folder.Parent = Workspace
    local v1 = table.create(9)
    local v2 = 9
    local v3 = 1
    for i = 1, v2, v3 do
        v1[i] = Draw.sphere({
            diameter = 0.35,
            transparency = 0.15,
            parent = Folder,
            name = "HeightSample_" .. i,
            color = Color3.fromRGB(255, 120, 40),
        })
    end
    v2 = {folder = Folder, markers = v1}
    u371.heightRayDebug = v2
    return v2
end
local function ensureCompanionPitchRayDebug() -- Line: 290 -- upvalues: u371 (val), Workspace (val), Draw (val)
    local pitchRayDebug = u371.pitchRayDebug
    if pitchRayDebug then
        return pitchRayDebug
    end
    local Folder = Instance.new("Folder")
    Folder.Name = "CompanionPitchRayDebug"
    Folder.Parent = Workspace
    local v1 = Draw.segmentBeam({
        name = "Chord",
        width = 0.12,
        transparency = 0.3,
        parent = Folder,
        color = Color3.fromRGB(120, 200, 255),
    })
    local v2 = {
        folder = Folder,
        chord = v1,
        hitFront = Draw.sphere({name = "_PitchHitFront", diameter = 0.4, parent = Folder, color = Color3.fromRGB(80, 180, 255)}),
        hitBack = Draw.sphere({name = "_PitchHitBack", diameter = 0.4, parent = Folder, color = Color3.fromRGB(255, 120, 220)}),
        sample = Draw.sphere({
            name = "_PitchChordSample",
            diameter = 0.38,
            transparency = 0.1,
            parent = Folder,
            color = Color3.new(1, 1, 1),
        }),
        normalBar = Draw.directionBar({
            name = "_PitchNormal",
            length = 2.5,
            thickness = 0.1,
            parent = Folder,
            color = Color3.fromRGB(120, 255, 140),
        }),
    }
    u371.pitchRayDebug = v2
    return v2
end
local function mountTerrainRaycastParams(p1, p2) -- Line: 345 -- upvalues: CollectionService (val)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    local v2 = {}
    local Tagged = CollectionService:GetTagged("Alive")
    local Tagged_2 = CollectionService:GetTagged("Companion")
    v2[1] = p1
    v2[2] = p2
    v2[3] = Tagged
    v2[4] = Tagged_2
    v2[5] = CollectionService:GetTagged("Water")
    v1.FilterDescendantsInstances = v2
    return v1
end
local function isMountGroundedForJump(p1, p2, p3) -- Line: 365 -- upvalues: mountTerrainRaycastParams (val), Workspace (val)
    local Y, v1, v2, v3, v4
    local v5 = mountTerrainRaycastParams(p2, p3)
    local v6 = Vector3.new(0, -1000, 0)
    local huge = math.huge
    local v7 = -math.huge
    local v8 = -math.huge
    local v9 = 1
    local v10 = 1
    local v11 = p1
    for i = -1, v9, v10 do
        v1 = 1
        v2 = 1
        for j = -1, v1, v2 do
            v3 = v11.Position + Vector3.new(i * 3, 0, j * 3)
            v4 = Workspace:Raycast(v3, v6, v5)
            if not v4 then
                return false
            end
            Y = v4.Position.Y
            if Y < huge then
                huge = Y
            end
            if v7 < Y then
                v7 = Y
            end
            if v8 < Y then
                v8 = Y
            end
        end
    end
    if 3 < v7 - huge then
        return false
    end
    v10 = math.abs(v11.Position.Y - (v8 + 5.5))
    if math.max(3, 4) < v10 then
        return false
    end
    return true
end
local function commitRemoteCompanionRegistration(p1) -- Line: 408 -- upvalues: u375 (val), CollectionService (val)
    if u375[p1] or not (CollectionService:HasTag(p1, "Companion")) then
        return
    end
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart or not (HumanoidRootPart:IsA("BasePart")) then
        return
    end
    u375[p1] = {lastProcessTime = 0}
end
local function playHorseAnimTrack(p1, p2) -- Line: 436
    if not p1 then
        return
    end
    if not p1.IsPlaying then
        p1:Play(p2)
    end
end
local function stopHorseAnimTrack(p1, p2) -- Line: 451
    if not p1 then
        return
    end
    if p1.IsPlaying then
        p1:Stop(p2)
    end
end
local function forceCompanionIdleOnly(p1) -- Line: 465 -- upvalues: stopHorseAnimTrack (val), playHorseAnimTrack (val)
    for k, v in pairs(p1) do
        if k ~= "Idle" then
            stopHorseAnimTrack(v, 0.3)
        end
    end
    playHorseAnimTrack(p1.Idle, 0.3)
end
local function hasCompanionRider(p1) -- Line: 480
    local Seat = p1:FindFirstChildWhichIsA("Seat", true)
    if not Seat then
        return false
    end
    local v1 = Seat.Occupant ~= nil
    return v1
end
local function getHorseGaitFromSpeed(p1, p2) -- Line: 492
    if p2 then
        return 4
    end
    if p1 < 1 then
        return 0
    end
    if p1 < 17 then
        return 1
    end
    if p1 <= 35 then
        return 2
    end
    return 3
end
local function sendHorseGaitToServer(p1, p2, p3) -- Line: 509 -- upvalues: Profiling (val), Companions (val)
    if not Profiling.IS_USING_SERVER_HORSE_ANIMATIONS or Profiling.IS_USING_LOCAL_HORSE_ANIMATIONS or p3[1] == p2 then
        return p2
    end
    p3[1] = p2
    Companions.HorseGait.unreliablePost(p1, p2)
    return p2
end
local function playServerModeHorseStepSound(p1, p2, p3, p4) -- Line: 525 -- upvalues: Profiling (val), u364 (val), Sound (val)
    if not Profiling.IS_USING_SERVER_HORSE_ANIMATIONS or Profiling.IS_USING_LOCAL_HORSE_ANIMATIONS or p2 < 1 then
        return
    end
    local v1 = u364[p1]
    if not v1 then
        return
    end
    p3[1] = p3[1] + p4
    if v1 <= p3[1] then
        p3[1] = 0
        Sound:Play()
    end
end
local function handleHorseGaitAnimations(p1, p2, p3) -- Line: 558 -- upvalues: stopHorseAnimTrack (val), playHorseAnimTrack (val)
    if not p3 then
        if p1 < 1 then
            stopHorseAnimTrack(p2.Backwards, 0.3)
            playHorseAnimTrack(p2.Idle, 0.3)
            stopHorseAnimTrack(p2.Walk, 0.3)
            stopHorseAnimTrack(p2.Canter, 0.3)
            stopHorseAnimTrack(p2.Run, 0.3)
            return
        end
        if p1 < 17 then
            stopHorseAnimTrack(p2.Backwards, 0.3)
            stopHorseAnimTrack(p2.Idle, 0.3)
            playHorseAnimTrack(p2.Walk, 0.3)
            stopHorseAnimTrack(p2.Canter, 0.3)
            stopHorseAnimTrack(p2.Run, 0.3)
            return
        end
        if p1 <= 35 then
            stopHorseAnimTrack(p2.Backwards, 0.3)
            stopHorseAnimTrack(p2.Idle, 0.3)
            stopHorseAnimTrack(p2.Walk, 0.3)
            playHorseAnimTrack(p2.Canter, 0.3)
            stopHorseAnimTrack(p2.Run, 0.3)
            return
        end
        stopHorseAnimTrack(p2.Backwards, 0.3)
        stopHorseAnimTrack(p2.Idle, 0.3)
        stopHorseAnimTrack(p2.Walk, 0.3)
        stopHorseAnimTrack(p2.Canter, 0.3)
        playHorseAnimTrack(p2.Run, 0.3)
        return
    end
    if p2.Backwards then
        stopHorseAnimTrack(p2.Idle, 0.3)
        stopHorseAnimTrack(p2.Walk, 0.3)
        stopHorseAnimTrack(p2.Canter, 0.3)
        stopHorseAnimTrack(p2.Run, 0.3)
        playHorseAnimTrack(p2.Backwards, 0.3)
        return
    end
    if p1 < 1 then
        stopHorseAnimTrack(p2.Backwards, 0.3)
        playHorseAnimTrack(p2.Idle, 0.3)
        stopHorseAnimTrack(p2.Walk, 0.3)
        stopHorseAnimTrack(p2.Canter, 0.3)
        stopHorseAnimTrack(p2.Run, 0.3)
        return
    end
    if p1 < 17 then
        stopHorseAnimTrack(p2.Backwards, 0.3)
        stopHorseAnimTrack(p2.Idle, 0.3)
        playHorseAnimTrack(p2.Walk, 0.3)
        stopHorseAnimTrack(p2.Canter, 0.3)
        stopHorseAnimTrack(p2.Run, 0.3)
        return
    end
    if p1 <= 35 then
        stopHorseAnimTrack(p2.Backwards, 0.3)
        stopHorseAnimTrack(p2.Idle, 0.3)
        stopHorseAnimTrack(p2.Walk, 0.3)
        playHorseAnimTrack(p2.Canter, 0.3)
        stopHorseAnimTrack(p2.Run, 0.3)
        return
    end
    stopHorseAnimTrack(p2.Backwards, 0.3)
    stopHorseAnimTrack(p2.Idle, 0.3)
    stopHorseAnimTrack(p2.Walk, 0.3)
    stopHorseAnimTrack(p2.Canter, 0.3)
    playHorseAnimTrack(p2.Run, 0.3)
end
local function horizontalDistanceXZ(p1, p2) -- Line: 605
    local v1 = p1 - p2
    return Vector3.new(v1.X, 0, v1.Z).Magnitude
end
local function horizontalSpeedFromHrp(p1) -- Line: 615
    return (p1.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
end
local function horizontalMotionSignFromHrp(p1) -- Line: 624
    local v1 = p1.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
    if v1.Magnitude < 0.05 then
        return 0
    end
    local v2 = p1.CFrame.LookVector * Vector3.new(1, 0, 1)
    if v2.Magnitude < 0.05 then
        return 1
    end
    local v3 = v1:Dot(v2.Unit)
    local v4 = math.abs(v3)
    if v4 < 0.01 then
        return 0
    end
    if 0 <= v3 then
        return 1
    end
    return -1
end
local function mountCartWheelSpinSign(p1, p2) -- Line: 646 -- upvalues: horizontalMotionSignFromHrp (val)
    if p2 then
        return -1
    end
    return horizontalMotionSignFromHrp(p1)
end
local function tryBuildCartWheelCache(p1) -- Line: 658
    local Cart = p1:FindFirstChild("Cart")
    if not Cart or not (Cart:IsA("ObjectValue")) then
        return nil
    end
    local Value = Cart.Value
    if not Value or not (Value:IsA("Model")) then
        return nil
    end
    local Cart_2 = Value:FindFirstChild("Cart")
    if not Cart_2 or not (Cart_2:IsA("Folder")) then
        return nil
    end
    local Rods = Cart_2:FindFirstChild("Rods")
    if not Rods then
        return nil
    end
    local v1 = {}
    for i, j in Rods:GetDescendants() do
        if j:IsA("Weld") then
            table.insert(v1, {joint = j, baseC0 = j.C0})
        elseif not (j:IsA("Motor6D")) then
        end
    end
    if #v1 == 0 then
        return nil
    end
    return {angle = 0, joints = v1, root = Value}
end
local function mergeCartWheelCache(p1, p2) -- Line: 700
    local v1
    if not p1 or p1.root ~= p2.root then
        return p2
    end
    for i, v in ipairs(p2.joints) do
        v1 = p1.joints[i]
        if v1 and v1.joint == v.joint then
            v.baseC0 = v1.baseC0
        end
    end
    p2.angle = p1.angle
    return p2
end
local function ensureRemoteCartWheelState(p1, p2) -- Line: 720 -- upvalues: tryBuildCartWheelCache (val), mergeCartWheelCache (val)
    local v1 = tryBuildCartWheelCache(p1)
    if not v1 then
        p2.cartWheelCache = nil
        return
    end
    p2.cartWheelCache = mergeCartWheelCache(p2.cartWheelCache, v1)
end
local function ensureMountedCartWheelCache(p1) -- Line: 734 -- upvalues: tryBuildCartWheelCache (val), u377 (ref), mergeCartWheelCache (val)
    local v1 = tryBuildCartWheelCache(p1)
    if not v1 then
        u377 = nil
        return
    end
    u377 = mergeCartWheelCache(u377, v1)
end
local function clearMountedCartWheelCache() -- Line: 747 -- upvalues: u377 (ref)
    u377 = nil
end
local function restoreMountedCartLocalOverrides() -- Line: 757 -- upvalues: u378 (ref)
    local v1 = u378
    if not v1 then
        return
    end
    for k, v in pairs(v1.parts) do
        if k.Parent then
            k.CanCollide = v.canCollide
            k.CanTouch = v.canTouch
            k.Massless = v.massless
        end
    end
    u378 = nil
end
local function applyMountedCartLocalOverrides(p1) -- Line: 788 -- upvalues: u378 (ref), restoreMountedCartLocalOverrides (val)
    if u378 then
        restoreMountedCartLocalOverrides()
    end
    local Cart = p1:FindFirstChild("Cart")
    if not Cart or not (Cart:IsA("ObjectValue")) then
        return
    end
    local Value = Cart.Value
    if not Value or not (Value:IsA("Model")) then
        return
    end
    local HumanoidRootPart = Value:FindFirstChild("HumanoidRootPart")
    local v1 = {}
    for i, j in Value:GetDescendants() do
        if j:IsA("BasePart") and j ~= HumanoidRootPart then
            v1[j] = {canCollide = j.CanCollide, canTouch = j.CanTouch, massless = j.Massless}
            j.CanCollide = false
            j.CanTouch = false
            j.Massless = true
        end
    end
    u378 = {cart = Value, parts = v1}
end
local function stepCartWheelCache(p1, p2, p3, p4) -- Line: 847
    local joint
    if p2 == 0 or p3 < 0.01 then
        return
    end
    p1.angle = p1.angle + p2 * p3 * 0.12 * p4
    local v1 = math.abs(p1.angle)
    if math.pi * 20 < v1 then
        p1.angle = p1.angle % (math.pi * 2)
    end
    v1 = CFrame.Angles(p1.angle, 0, 0)
    local joints = p1.joints
    local v2 = nil
    local v3 = nil
    for i, j in joints, v2, v3 do
        joint = j.joint
        if joint.Parent then
            joint.C0 = j.baseC0 * v1
        end
    end
end
local function getRemoteCompanionPollInterval(p1) -- Line: 869
    if p1 <= 675.84 then
        return 0
    end
    if p1 <= 1351.68 then
        return 0.1
    end
    if p1 <= 2048 then
        return 0.25
    end
    return 0.5
end
local function unloadRemoteCompanionAnimations(p1) -- Line: 886
    local animations = p1.animations
    if not animations then
        return
    end
    local v1 = p1
    for k, v in pairs(animations) do
        if v then
            if v.IsPlaying then
                v:Stop(0.3)
            end
            v:Destroy()
        end
    end
    v1.animations = nil
    v1.cartWheelCache = nil
end
local function loadRemoteCompanionHorseAnimations(p1) -- Line: 908 -- upvalues: useAnimatorObserver (val), Horse (val)
    return {Idle = useAnimatorObserver.playAnimationOnRig(p1, Horse.Idle), Walk = useAnimatorObserver.loadAnimationOnRig(p1, Horse.Walk), Canter = useAnimatorObserver.loadAnimationOnRig(p1, Horse.Canter), Run = useAnimatorObserver.loadAnimationOnRig(p1, Horse.Run)}
end
local function registerRemoteCompanionModel(p1) -- Line: 923 -- upvalues: commitRemoteCompanionRegistration (val), u375 (val), CollectionService (val), u376 (val)
    if not (p1:IsA("Model")) then
        return
    end
    commitRemoteCompanionRegistration(p1)
    if u375[p1] or not (CollectionService:HasTag(p1, "Companion")) or u376[p1] then
        return
    end
    u376[p1] = true
    task.spawn(function() -- Line: 944 -- upvalues: p1 (val), u376 (upval), CollectionService (upval), commitRemoteCompanionRegistration (upval)
        local v1, v2
        local v3 = nil
        v1, v2 = pcall(function() -- Line: 946 -- upvalues: p1 (upval)
            return p1:WaitForChild("HumanoidRootPart", 30)
        end)
        if v1 and v2 then
            v3 = v2
        end
        u376[p1] = nil
        if not v3 or not (v3:IsA("BasePart")) or p1.Parent == nil or not (CollectionService:HasTag(p1, "Companion")) then
            return
        end
        commitRemoteCompanionRegistration(p1)
    end)
end
local function unregisterRemoteCompanionModel(p1) -- Line: 973 -- upvalues: u376 (val), u375 (val), unloadRemoteCompanionAnimations (val)
    if not (p1:IsA("Model")) then
        return
    end
    u376[p1] = nil
    local v1 = u375[p1]
    if v1 then
        unloadRemoteCompanionAnimations(v1)
        u375[p1] = nil
    end
end
local function initRemoteCompanionHorseAnimations() -- Line: 992 -- upvalues: CollectionService (val), registerRemoteCompanionModel (val), unregisterRemoteCompanionModel (val), RunService (val), u376 (val), Character (val), u375 (val), u371 (val), horizontalDistanceXZ (val), unloadRemoteCompanionAnimations (val), ensureRemoteCartWheelState (val), horizontalSpeedFromHrp (val), horizontalMotionSignFromHrp (val), stepCartWheelCache (val), getRemoteCompanionPollInterval (val), loadRemoteCompanionHorseAnimations (val), hasCompanionRider (val), handleHorseGaitAnimations (val), forceCompanionIdleOnly (val)
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Companion")
    InstanceAddedSignal:Connect(registerRemoteCompanionModel)
    local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Companion")
    InstanceRemovedSignal:Connect(unregisterRemoteCompanionModel)
    for i, j in CollectionService:GetTagged("Companion") do
        registerRemoteCompanionModel(j)
    end
    RunService.Heartbeat:Connect(function(p1) -- Line: 1000 -- upvalues: u376 (upval), Character (upval), u375 (upval), u371 (upval), horizontalDistanceXZ (upval), unloadRemoteCompanionAnimations (upval), ensureRemoteCartWheelState (upval), horizontalSpeedFromHrp (upval), horizontalMotionSignFromHrp (upval), stepCartWheelCache (upval), getRemoteCompanionPollInterval (upval), loadRemoteCompanionHorseAnimations (upval), hasCompanionRider (upval), handleHorseGaitAnimations (upval), forceCompanionIdleOnly (upval)
        local HumanoidRootPart, HumanoidRootPart_3, animations, v1, v2, v3
        for k in pairs(u376) do
            if k.Parent == nil then
                u376[k] = nil
            end
        end
        local v4 = Character.getCharacter()
        if not v4 then
            HumanoidRootPart = nil
        else
            HumanoidRootPart = v4:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return
        end
        local v5 = os.clock()
        local v6 = workspace:GetAttribute("Optimize") == true
        local v7 = {}
        if not v6 then
            local HumanoidRootPart_2
            local v8 = {}
            for k2 in pairs(u375) do
                if k2.Parent ~= nil and u371.model ~= k2 then
                    HumanoidRootPart_2 = k2:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart_2 and HumanoidRootPart_2:IsA("BasePart") then
                        v2 = horizontalDistanceXZ(HumanoidRootPart_2.Position, HumanoidRootPart.Position)
                        if v2 <= 2048 then
                            table.insert(v8, {model = k2, distance = v2})
                        end
                    end
                end
            end
            table.sort(v8, function(p1, p2) -- Line: 1041
                local v1 = p1.distance < p2.distance
                return v1
            end)
            local v9 = math.min(#v8, 20)
            local v10 = 1
            for i = 1, v9, v10 do
                v7[v8[i].model] = true
            end
        end
        local v11 = p1
        for k3, v in pairs(u375) do
            if k3.Parent == nil then
                unloadRemoteCompanionAnimations(v)
                u375[k3] = nil
            elseif v6 then
                unloadRemoteCompanionAnimations(v)
            elseif u371.model ~= k3 then
                HumanoidRootPart_3 = k3:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart_3 then
                    v1 = horizontalDistanceXZ(HumanoidRootPart_3.Position, HumanoidRootPart.Position)
                    if 2048 >= v1 then
                        v.lastFarCheck = nil
                        if v7[k3] then
                            ensureRemoteCartWheelState(k3, v)
                            if v.cartWheelCache then
                                v2 = horizontalSpeedFromHrp(HumanoidRootPart_3)
                                v3 = horizontalMotionSignFromHrp(HumanoidRootPart_3)
                                stepCartWheelCache(v.cartWheelCache, v3, v2, v11)
                            end
                            v2 = getRemoteCompanionPollInterval(v1)
                            if v5 - v.lastProcessTime >= v2 then
                                v.lastProcessTime = v5
                                if not v.animations then
                                    v.animations = loadRemoteCompanionHorseAnimations(k3)
                                end
                                v3 = horizontalSpeedFromHrp(HumanoidRootPart_3)
                                animations = v.animations
                                assert(animations)
                                if not (hasCompanionRider(k3)) then
                                    forceCompanionIdleOnly(animations)
                                else
                                    handleHorseGaitAnimations(v3, animations, false)
                                end
                            end
                        else
                            unloadRemoteCompanionAnimations(v)
                        end
                    else
                        unloadRemoteCompanionAnimations(v)
                        if v5 - (v.lastFarCheck or 0) >= 1.5 then
                            v.lastFarCheck = v5
                        end
                    end
                else
                    unloadRemoteCompanionAnimations(v)
                    u375[k3] = nil
                end
            end
        end
    end)
end
mount, _, _, mount_3 = State_3("mount")
mount({enabled = false, stamina = 0, maxStamina = 100, speed = 0})
local function onDismountedRideableCompanion(p1, p2) -- Line: 1135 -- upvalues: useAnimatorObserver (val), Horse (val), u371 (val), teardownCompanionHeightRayDebug (val), teardownCompanionPitchRayDebug (val), u381 (ref), Controls (val), Sound (val), clearMountedCartWheelCache (val), restoreMountedCartLocalOverrides (val), mount_3 (val), u379 (val), u382 (val), mount (val), u370 (ref)
    local fovCleanup, maxStamina, stamina
    useAnimatorObserver.stop(Horse.Ride)
    for k, v in pairs(u371.animations) do
        v:Stop(0.3)
    end
    u371.animations = {}
    for k2, i in pairs(u371.riderAnimations) do
        i:Stop(0.3)
    end
    u371.riderAnimations = {}
    for i2, j in ipairs(u371.connections) do
        j:Disconnect()
    end
    if u371.mountedCleanup then
        u371.mountedCleanup:Disconnect()
        u371.mountedCleanup = nil
    end
    if u371.angular then
        if u371.angular.Attachment0 then
            u371.angular.Attachment0:Destroy()
        end
        u371.angular:Destroy()
    end
    if u371.orientation then
        u371.orientation:Destroy()
    end
    if u371.bodygyro then
        u371.bodygyro:Destroy()
    end
    if u371.velocity then
        u371.velocity:Destroy()
    end
    if u371.height then
        u371.height:Destroy()
    end
    teardownCompanionHeightRayDebug()
    teardownCompanionPitchRayDebug()
    if u371.jumpPowerCleanup then
        u371.jumpPowerCleanup()
        u371.jumpPowerCleanup = nil
    end
    if u371.fovCleanup then
        u371.fovCleanup(TweenInfo.new(1))
        u371.fovCleanup = nil
    end
    if u381 then
        Controls:Enable()
        u381 = false
    end
    u371.connections = {}
    Sound.Parent = nil
    if p2 then
        local HumanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        end
    end
    u371.model = nil
    clearMountedCartWheelCache()
    restoreMountedCartLocalOverrides()
    local u158 = mount_3()
    if p1 and u158 then
        u379[p1.id] = u158.stamina
    end
    u382[p1.id] = task.spawn(function() -- Line: 1243 -- upvalues: u158 (val), u379 (upval), p1 (val)
        task.wait(5)
        if u158 and u158.stamina < u158.maxStamina then
            while true do
                task.wait(0.3)
                u158.stamina = u158.stamina + 1
                u379[p1.id] = u158.stamina
                if u158.maxStamina <= u158.stamina then
                    break
                end
            end
        end
    end)
    local v1 = {enabled = false, speed = 0}
    if not u158 then
        stamina = 0
    else
        stamina = u158.stamina
    end
    v1.stamina = stamina
    if not u158 then
        maxStamina = 100
    else
        maxStamina = u158.maxStamina
        if not maxStamina then
            maxStamina = 100
        end
    end
    v1.maxStamina = maxStamina
    mount(v1)
    u370 = nil
end
local function onMountedRideableCompanion(p1, p2) -- Line: 1279 -- upvalues: u382 (val), u371 (val), Profiling (val), useAnimatorObserver (val), Horse (val), Sound (val), Character (val), applyMountedCartLocalOverrides (val), useJumpPower (val), useFieldOfView (val), u379 (val), mount (val), u380 (val), sendHorseGaitToServer (val), UserInputService (val), mount_3 (val), ClientAttributesHandler (val), u370 (ref), onDismountedRideableCompanion (val), Workspace (val), Alive (val), LocalPlayer (val), Companions (val), RunService (val), mountTerrainRaycastParams (val), teardownCompanionHeightRayDebug (val), teardownCompanionPitchRayDebug (val), horizontalSpeedFromHrp (val), ensureMountedCartWheelCache (val), u377 (ref), stepCartWheelCache (val), mountCartWheelSpinSign (val), getHorseGaitFromSpeed (val), playServerModeHorseStepSound (val), hasCompanionRider (val), handleHorseGaitAnimations (val), forceCompanionIdleOnly (val), isMountGroundedForJump (val), Log (val), Controls (val), u381 (ref)
    local u278, u306, v1, v2, v3, v4, v5, v6
    local HumanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart or not (HumanoidRootPart:IsA("BasePart")) then
        return
    end
    if u382[p1.id] then
        task.cancel(u382[p1.id])
        u382[p1.id] = nil
    end
    u371.model = p2
    local IS_USING_SERVER_HORSE_ANIMATIONS = Profiling.IS_USING_SERVER_HORSE_ANIMATIONS
    if IS_USING_SERVER_HORSE_ANIMATIONS then
        IS_USING_SERVER_HORSE_ANIMATIONS = not Profiling.IS_USING_LOCAL_HORSE_ANIMATIONS
    end
    if not IS_USING_SERVER_HORSE_ANIMATIONS then
        u371.animations = {
            Idle = useAnimatorObserver.playAnimationOnRig(p2, Horse.Idle),
            Walk = useAnimatorObserver.loadAnimationOnRig(p2, Horse.Walk),
            Canter = useAnimatorObserver.loadAnimationOnRig(p2, Horse.Canter),
            Run = useAnimatorObserver.loadAnimationOnRig(p2, Horse.Run),
            Backwards = useAnimatorObserver.loadAnimationOnRig(p2, Horse.Backwards),
            Jumping = useAnimatorObserver.loadAnimationOnRig(p2, Horse.Jumping),
        }
    else
        u371.animations = {}
    end
    Sound.Parent = HumanoidRootPart
    if not IS_USING_SERVER_HORSE_ANIMATIONS then
        local MarkerReachedSignal = u371.animations.Walk:GetMarkerReachedSignal("Step")
        v3 = MarkerReachedSignal:Connect(function() -- Line: 1313 -- upvalues: Sound (upval)
            Sound:Play()
        end)
        local MarkerReachedSignal_2 = u371.animations.Canter:GetMarkerReachedSignal("Step")
        v4 = MarkerReachedSignal_2:Connect(function() -- Line: 1317 -- upvalues: Sound (upval)
            Sound:Play()
        end)
        local MarkerReachedSignal_3 = u371.animations.Run:GetMarkerReachedSignal("Step")
        v5 = MarkerReachedSignal_3:Connect(function() -- Line: 1321 -- upvalues: Sound (upval)
            Sound:Play()
        end)
        local MarkerReachedSignal_4 = u371.animations.Backwards:GetMarkerReachedSignal("Step")
        v6 = MarkerReachedSignal_4:Connect(function() -- Line: 1325 -- upvalues: Sound (upval)
            Sound:Play()
        end)
        table.insert(u371.connections, v3)
        table.insert(u371.connections, v4)
        table.insert(u371.connections, v5)
        table.insert(u371.connections, v6)
    end
    local u141 = Character.getCharacter()
    if not u141 then
        return
    end
    if u141 then
        u371.riderAnimations = {
            Idle = useAnimatorObserver.loadAnimationOnRig(u141, Horse.Rider.Idle),
            Walk = useAnimatorObserver.loadAnimationOnRig(u141, Horse.Rider.Walk),
            Canter = useAnimatorObserver.loadAnimationOnRig(u141, Horse.Rider.Canter),
            Run = useAnimatorObserver.loadAnimationOnRig(u141, Horse.Rider.Run),
            Backwards = useAnimatorObserver.loadAnimationOnRig(u141, Horse.Rider.Backwards),
        }
    end
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "AngularVelocityAttachment"
    Attachment.Parent = HumanoidRootPart
    local AlignPosition = Instance.new("AlignPosition")
    AlignPosition.Attachment0 = Attachment
    AlignPosition.ForceLimitMode = Enum.ForceLimitMode.PerAxis
    AlignPosition.MaxAxesForce = Vector3.new(0, 10000000000, 0)
    AlignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
    AlignPosition.Position = Vector3.new(0, HumanoidRootPart.Position.Y, 0)
    AlignPosition.ForceRelativeTo = Enum.ActuatorRelativeTo.Attachment0
    AlignPosition.Responsiveness = 200
    AlignPosition.MaxVelocity = 100
    AlignPosition.Parent = HumanoidRootPart
    local LinearVelocity = Instance.new("LinearVelocity")
    LinearVelocity.Attachment0 = Attachment
    LinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
    LinearVelocity.ForceLimitMode = Enum.ForceLimitMode.PerAxis
    LinearVelocity.MaxAxesForce = Vector3.new(30000, 0, 30000)
    LinearVelocity.MaxForce = 30000
    LinearVelocity.Parent = HumanoidRootPart
    local AngularVelocity = Instance.new("AngularVelocity")
    AngularVelocity.Attachment0 = Attachment
    AngularVelocity.MaxTorque = 500000
    AngularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
    AngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
    AngularVelocity.Parent = HumanoidRootPart
    local LookVector = HumanoidRootPart.CFrame.LookVector
    local AlignOrientation = Instance.new("AlignOrientation")
    AlignOrientation.Attachment0 = Attachment
    AlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    AlignOrientation.MaxTorque = 50000
    AlignOrientation.Responsiveness = 10
    AlignOrientation.RigidityEnabled = false
    AlignOrientation.CFrame = CFrame.lookAt(Vector3.zero, Vector3.new(LookVector.X, 0, LookVector.Z).Unit)
    AlignOrientation.Parent = HumanoidRootPart
    local BodyGyro = Instance.new("BodyGyro")
    BodyGyro.MaxTorque = Vector3.new(50000, 0, 50000)
    BodyGyro.P = 10000
    BodyGyro.D = 1000
    BodyGyro.CFrame = HumanoidRootPart.CFrame
    BodyGyro.Parent = HumanoidRootPart
    u371.angular = AngularVelocity
    u371.orientation = AlignOrientation
    u371.bodygyro = BodyGyro
    u371.velocity = LinearVelocity
    u371.height = AlignPosition
    applyMountedCartLocalOverrides(p2)
    _, v1 = useJumpPower()
    u371.jumpPowerCleanup = v1("mounted_horse", 0, "set", 50)
    _, u278 = useFieldOfView()
    local u279 = "none"
    local v7 = u379[p1.id]
    if v7 == nil then
        v2 = 100
    else
        v2 = v7
    end
    mount({enabled = true, maxStamina = 100, speed = 0, stamina = v2})
    local u294 = 0
    local u295 = 0
    local u296 = nil
    local u297 = 0
    local u298 = 0
    local u299 = 0
    local v8 = u380[p1.id]
    if v8 == nil then
        u306 = 0
    else
        u306 = v8
        if not u306 then
            u306 = 0
        end
    end
    local u307 = nil
    local u308 = nil
    local u309 = false
    local u310 = {nil}
    local u312 = {0}
    if IS_USING_SERVER_HORSE_ANIMATIONS then
        sendHorseGaitToServer(p1.id, 0, u310)
    end
    local u332 = (p1.metadata[2] / 100 + 0.5) * 70
    local function updateGoalTargets(p1) -- Line: 1487 -- upvalues: UserInputService (upval), mount_3 (upval), ClientAttributesHandler (upval), u332 (val), u297 (ref), u309 (ref), u307 (ref), u308 (ref), HumanoidRootPart (val), u294 (ref)
        local stamina, v1
        local v2 = UserInputService:GetFocusedTextBox() ~= nil
        local v3 = mount_3()
        if not v3 then
            stamina = 100
        else
            stamina = v3.stamina
        end
        local v4 = u332 + ClientAttributesHandler.getAttribute("HorseMaxSpeedBonus")
        local v5 = v4
        if stamina <= 0 then
            v5 = 17
        elseif stamina < 10 then
            v5 = 17 + (v4 - 17) * (stamina / 10)
        end
        if v5 < u297 then
            u297 = v5
        end
        if v2 then
            if not v2 and u309 then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    u309 = false
                    u307 = nil
                    u308 = nil
                    u297 = 0
                elseif not (UserInputService:IsKeyDown(Enum.KeyCode.S)) then
                    u309 = false
                    u307 = nil
                    u308 = nil
                    u297 = 0
                end
            end
        elseif not u309 then
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                u297 = math.clamp(u297 + p1 * 40, 0, v5)
            elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
                u297 = math.clamp(u297 - p1 * 30, 0, v5)
            end
        end
        local v6 = tick()
        local Magnitude = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
        local v7 = not v2
        if v7 then
            v7 = UserInputService:IsKeyDown(Enum.KeyCode.S)
        end
        local v8 = not v2
        if v8 then
            v8 = UserInputService:IsKeyDown(Enum.KeyCode.W)
        end
        local v9 = if u297 < 0.1 then if Magnitude < 2 then not u309 else false else false
        if v8 then
            u307 = nil
            u308 = nil
            if u309 then
                u309 = false
            end
        elseif 2 > Magnitude and v9 then
            if not u307 then
                u307 = v6
            end
            if not v7 then
                u308 = nil
            else
                if not u308 then
                    u308 = v6
                end
                if u307 and u308 then
                    v1 = v6 - u307
                    local v10 = v6 - u308
                    if 0.2 <= v1 and 0.2 <= v10 and not u309 then
                        u309 = true
                    end
                end
            end
        end
        if v2 then
            u294 = 0
            return
        end
        if not (UserInputService:IsKeyDown(Enum.KeyCode.A)) then
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                v1 = 1
            elseif not (UserInputService:IsKeyDown(Enum.KeyCode.D)) then
                v1 = 0
            else
                v1 = -1
            end
        elseif UserInputService:IsKeyDown(Enum.KeyCode.D) then
            v1 = 0
        elseif UserInputService:IsKeyDown(Enum.KeyCode.A) then
            v1 = 1
        elseif not (UserInputService:IsKeyDown(Enum.KeyCode.D)) then
            v1 = 0
        else
            v1 = -1
        end
        u294 = v1
    end
    local AttributeChangedSignal = u141:GetAttributeChangedSignal("Mounted")
    u371.mountedCleanup = AttributeChangedSignal:Connect(function() -- Line: 1613 -- upvalues: u141 (val), u370 (upval), onDismountedRideableCompanion (upval), u371 (upval)
        if not (u141:GetAttribute("Mounted")) and u370 then
            onDismountedRideableCompanion(u370, u371.model)
        end
    end)
    local function onTrampleAttempt() -- Line: 1620 -- upvalues: u371 (upval), Character (upval), u299 (ref), Workspace (upval), Alive (upval), LocalPlayer (upval), Companions (upval), p1 (val)
        local HumanoidRootPart_2, v1, v2, v3
        if not u371.model then
            return
        end
        local v4 = Character.getCharacter()
        if not v4 then
            return
        end
        local HumanoidRootPart = v4:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        local v5 = tick() - u299
        if v5 < 1 then
            return
        end
        local v6 = HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
        local v7 = Workspace:GetPartBoundsInBox(v6, (Vector3.new(6, 6, 6)))
        v6 = nil
        local v8 = nil
        for i, j in v7, v6, v8 do
            v1 = j:FindFirstAncestorOfClass("Model")
            if v1 then
                v2 = Alive.getPlayerFromCharacter(v1)
                if v2 then
                    HumanoidRootPart_2 = v1:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart_2 and v2 ~= LocalPlayer and 20 >= (HumanoidRootPart_2.Position - HumanoidRootPart.Position).Magnitude then
                        v3 = tick() - u299
                        if v3 >= 1 then
                            Companions.Trample.post(p1.id, v2)
                            u299 = tick()
                        end
                    end
                end
            end
        end
    end
    local v9 = RunService.RenderStepped:Connect(function(a1) -- Line: 1684 -- upvalues: updateGoalTargets (val), u296 (ref), u371 (upval), p2 (val), HumanoidRootPart (val), u309 (ref), u297 (ref), LinearVelocity (val), u294 (ref), p1 (val), AngularVelocity (val), mountTerrainRaycastParams (upval), u141 (val), Workspace (upval), AlignPosition (val), teardownCompanionHeightRayDebug (upval), teardownCompanionPitchRayDebug (upval), AlignOrientation (val), horizontalSpeedFromHrp (upval), ensureMountedCartWheelCache (upval), u377 (upval), stepCartWheelCache (upval), mountCartWheelSpinSign (upval), onTrampleAttempt (val), u279 (ref), u278 (val), mount_3 (upval), ClientAttributesHandler (upval), u306 (ref), u380 (upval), mount (upval), u379 (upval), IS_USING_SERVER_HORSE_ANIMATIONS (val), getHorseGaitFromSpeed (upval), sendHorseGaitToServer (upval), u310 (val), playServerModeHorseStepSound (upval), u312 (val), hasCompanionRider (upval), handleHorseGaitAnimations (upval), forceCompanionIdleOnly (upval)
        local Magnitude, Position, Unit, v1, v2, v3, v4, v5, v6, v7, v8, v9
        updateGoalTargets(a1)
        if u296 and u296 <= tick() then
            u296 = nil
            local height = u371.height
            if height and height.Parent then
                height.Enabled = true
            end
        end
        if not (p2:HasTag("CompanionCarting")) then
            v1 = 1
        else
            v1 = 0.5
        end
        local v10 = 0 < HumanoidRootPart.AssemblyLinearVelocity.Magnitude
        if u309 then
            u297 = 9
            LinearVelocity.VectorVelocity = -HumanoidRootPart.CFrame.LookVector * u297 * Vector3.new(1, 0, 1)
            if u294 == 0 then
                AngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
            else
                AngularVelocity.AngularVelocity = Vector3.new(0, u294 * (5 * (p1.metadata[3] / 100 + 0.3)) * v1, 0)
            end
        elseif not v10 then
            AngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
        else
            LinearVelocity.VectorVelocity = HumanoidRootPart.CFrame.LookVector * u297 * Vector3.new(1, 0, 1)
            if u294 == 0 then
                AngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
            else
                AngularVelocity.AngularVelocity = Vector3.new(0, u294 * (8 * (p1.metadata[3] / 190 + 0.3)) * v1, 0)
            end
        end
        local v11 = mountTerrainRaycastParams(u141, p2)
        local v12 = Vector3.new(0, -1000, 0)
        local Y = -math.huge
        local v13 = table.create(9)
        local v14 = 0
        local v15 = 1
        local v16 = 1
        local v17 = a1
        for i = -1, v15, v16 do
            v2 = 1
            v3 = 1
            for j = -1, v2, v3 do
                v14 = v14 + 1
                v4 = HumanoidRootPart.Position + Vector3.new(i * 3, 0, j * 3)
                v5 = Workspace:Raycast(v4, v12, v11)
                if not v5 then
                    Position = nil
                else
                    Position = v5.Position
                end
                v13[v14] = Position
                if Position and Y < Position.Y then
                    Y = Position.Y
                end
            end
        end
        v15 = nil
        if -math.huge < Y then
            AlignPosition.Position = Vector3.new(HumanoidRootPart.Position.X, Y + 5.5, HumanoidRootPart.Position.Z)
        end
        if v15 and not AlignPosition.Enabled then
            v16 = HumanoidRootPart.Position.Y - v15
            if v16 <= 2 and HumanoidRootPart.AssemblyLinearVelocity.Y <= 0.3 then
                AlignPosition.Enabled = true
                u296 = nil
            end
        end
        teardownCompanionHeightRayDebug()
        local LookVector = HumanoidRootPart.CFrame.LookVector
        local v18 = Vector3.new(LookVector.X, 0, LookVector.Z)
        if 0.0001 >= v18.Magnitude then
            Unit = Vector3.new(0, 0, -1)
        else
            Unit = v18.Unit
        end
        local Unit_3 = Unit
        local v19 = nil
        if v15 and -math.huge < Y then
            v4 = Unit * 5
            v5 = HumanoidRootPart.Position.Y + 3
            local Position_2 = HumanoidRootPart.Position
            v6 = Vector3.new(Position_2.X + v4.X, v5, Position_2.Z + v4.Z)
            v7 = Vector3.new(Position_2.X - v4.X, v5, Position_2.Z - v4.Z)
            local v20 = Workspace:Raycast(v6, v12, v11)
            local v21 = Workspace:Raycast(v7, v12, v11)
            if v20 and v21 then
                local Position_3 = v20.Position
                local Position_4 = v21.Position
                v8 = Position_4.Y - Position_3.Y
                local v22 = math.abs(v8)
                if 0.0001 >= v22 then
                    v9 = 0.5
                else
                    v9 = (v15 - Position_3.Y) / v8
                end
                v9 = math.clamp(v9, 0, 1)
                Position_3:Lerp(Position_4, v9)
                local v23 = v20.Normal:Lerp(v21.Normal, v9)
                if 0.0001 < v23.Magnitude then
                    local Unit_2 = v23.Unit
                    v19 = Unit_2
                    local v24 = Unit - Unit_2 * Unit:Dot(Unit_2)
                    if 0.001 < v24.Magnitude then
                        Unit_3 = v24.Unit
                    end
                end
            end
        end
        teardownCompanionPitchRayDebug()
        if not v19 then
            AlignOrientation.CFrame = CFrame.lookAt(Vector3.zero, Unit)
        else
            AlignOrientation.CFrame = CFrame.lookAt(Vector3.zero, Unit_3, v19)
        end
        if u371.bodygyro then
            local Position_5 = HumanoidRootPart.CFrame.Position
            if not v19 then
                u371.bodygyro.CFrame = CFrame.lookAt(Position_5, Position_5 + Unit)
            else
                u371.bodygyro.CFrame = CFrame.lookAt(Position_5, Position_5 + Unit_3, v19)
            end
        end
        if not u309 then
            Magnitude = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
        else
            Magnitude = 9
        end
        v5 = horizontalSpeedFromHrp(HumanoidRootPart)
        ensureMountedCartWheelCache(p2)
        if u377 then
            v7 = mountCartWheelSpinSign(HumanoidRootPart, u309)
            stepCartWheelCache(u377, v7, v5, v17)
        end
        local v25 = "none"
        if 1 > Magnitude then
            if 17 > Magnitude then
                if 35 < Magnitude then
                    v25 = "run"
                end
            elseif Magnitude <= 35 then
                v25 = "canter"
            end
        elseif Magnitude < 17 then
            v25 = "walk"
        end
        if 85 <= Magnitude then
            onTrampleAttempt()
        end
        if v25 ~= u279 then
            if u371.fovCleanup then
                u371.fovCleanup(TweenInfo.new(1))
                u371.fovCleanup = nil
            end
            if v25 == "walk" then
                u371.fovCleanup = u278("companion_walk", 70, "set", 6, TweenInfo.new(1))
            elseif v25 == "canter" then
                u371.fovCleanup = u278("companion_canter", 15, "add", 7, TweenInfo.new(1))
            elseif v25 == "run" then
                u371.fovCleanup = u278("companion_run", 30, "add", 8, TweenInfo.new(1))
            end
            u279 = v25
        end
        v6 = mount_3()
        if v6 and v6.enabled then
            local stamina = v6.stamina
            local HorseStaminaDrainMultiplier = ClientAttributesHandler.getAttribute("HorseStaminaDrainMultiplier")
            local HorseStaminaRegenMultiplier = ClientAttributesHandler.getAttribute("HorseStaminaRegenMultiplier")
            local v26 = (1 - p1.metadata[5] / 100) * 5 + HorseStaminaDrainMultiplier * 2
            v8 = HorseStaminaRegenMultiplier * 10
            if 35 < Magnitude then
                stamina = math.max(0, stamina - v26 * v17)
                u306 = tick()
                u380[p1.id] = u306
            elseif Magnitude <= ClientAttributesHandler.getAttribute("HorseStaminaRegenMaxSpeedBonus") + 17 then
                v9 = tick() - u306
                if 5 <= v9 then
                    if Magnitude >= 1 then
                        v9 = v8
                    else
                        v9 = v8 * 1.25
                    end
                    stamina = math.min(v6.maxStamina, stamina + v9 * v17)
                end
            end
            mount({enabled = true, stamina = stamina, maxStamina = v6.maxStamina, speed = Magnitude})
            u379[p1.id] = stamina
        end
        if IS_USING_SERVER_HORSE_ANIMATIONS then
            v7 = getHorseGaitFromSpeed(Magnitude, u309)
            sendHorseGaitToServer(p1.id, v7, u310)
            playServerModeHorseStepSound(v7, Magnitude, u312, v17)
        elseif not (hasCompanionRider(p2)) then
            forceCompanionIdleOnly(u371.animations)
        else
            handleHorseGaitAnimations(Magnitude, u371.animations, u309)
        end
        if next(u371.riderAnimations) ~= nil then
            handleHorseGaitAnimations(Magnitude, u371.riderAnimations, u309)
        end
    end)
    local function attemptMountedHorseJump() -- Line: 1986 -- upvalues: UserInputService (upval), u295 (ref), isMountGroundedForJump (upval), HumanoidRootPart (val), u141 (val), p2 (val), u371 (upval), u296 (ref), IS_USING_SERVER_HORSE_ANIMATIONS (val), sendHorseGaitToServer (upval), p1 (val), u310 (val)
        if UserInputService:GetFocusedTextBox() ~= nil then
            return
        end
        local v1 = tick()
        local v2 = v1 - u295
        if v2 < 3 or not (isMountGroundedForJump(HumanoidRootPart, u141, p2)) then
            return
        end
        u295 = v1
        local height = u371.height
        if height then
            height.Enabled = false
        end
        u296 = tick() + 0.5
        local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
        local v3 = 45 + (AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude * 0.05
        HumanoidRootPart.AssemblyLinearVelocity = AssemblyLinearVelocity + Vector3.new(0, v3, 0)
        if u371.animations.Jumping then
            u371.animations.Jumping:Play(0.1)
            return
        end
        if IS_USING_SERVER_HORSE_ANIMATIONS then
            sendHorseGaitToServer(p1.id, 5, u310)
        end
    end
    local v10 = UserInputService.JumpRequest:Connect(attemptMountedHorseJump)
    local v11 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 2022 -- upvalues: attemptMountedHorseJump (val), u298 (ref), Log (upval), LocalPlayer (upval), Companions (upval)
        if p2 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Space then
            attemptMountedHorseJump()
            return
        end
        if p1.KeyCode ~= Enum.KeyCode.LeftControl then
            return
        end
        local v1 = tick()
        local v2 = v1 - u298
        if v2 < 0.35 then
            return
        end
        u298 = v1
        Log.cross(LocalPlayer, "Dismounting companion request sent")
        Companions.Dismount.post()
    end)
    Controls:Disable()
    u381 = true
    table.insert(u371.connections, v9)
    table.insert(u371.connections, v10)
    table.insert(u371.connections, v11)
end
;(function() -- Line: 2065 -- upvalues: Profiling (val), initRemoteCompanionHorseAnimations (val), ClientSettingsHandler (val), ClientAttributesHandler (val), States (val), ClientStateHandler (val), Categories (val), Signals (val), Character (val), useAnimatorObserver (val), Horse (val), Sounds (val), Animals (val), Companions (val), Log (val), LocalPlayer (val), u370 (ref), onMountedRideableCompanion (val), useCharacterObserver (val), onDismountedRideableCompanion (val), u371 (val)
    local u0 = nil
    local u1 = nil
    if Profiling.IS_USING_CLIENT_HORSE_ANIMATIONS and not Profiling.IS_USING_SERVER_HORSE_ANIMATIONS and not Profiling.IS_USING_LOCAL_HORSE_ANIMATIONS then
        initRemoteCompanionHorseAnimations()
    end
    ClientSettingsHandler.onKeybindPressed("Summon Companion"):Connect(function() -- Line: 2078 -- upvalues: ClientAttributesHandler (upval), States (upval), ClientStateHandler (upval), Categories (upval), Signals (upval), Character (upval), u0 (ref), useAnimatorObserver (upval), Horse (upval), Sounds (upval), Animals (upval), u1 (ref), Companions (upval)
        local v1
        local v2 = ClientAttributesHandler.getAttribute("HasDexterous") == 1
        if not v2 then
            v1 = nil
        else
            v1 = {States.HANDLES}
        end
        if ClientStateHandler.isCategoryBusy(Categories.STRICT, v1) then
            return Signals.Toast:Fire({message = "You cannot summon a companion right now.", type = "error"})
        end
        if not (Character.isGrounded()) then
            return Signals.Toast:Fire({message = "You must be on the ground to summon a companion.", type = "error"})
        end
        if Character.isUnderRoof() then
            return Signals.Toast:Fire({message = "You cannot summon a companion while indoors.", type = "error"})
        end
        u0 = useAnimatorObserver.play(Horse.Whistle, 0.1)
        Sounds.playGlobalSoundEffect(Animals.Horse.SummonWhistle, 0.1, 1)
        u1 = u0.KeyframeReached:Once(function() -- Line: 2100 -- upvalues: Signals (upval), Companions (upval)
            Signals.Toast:Fire({message = "Successfully sent a request to summon your companion.", type = "info"})
            Companions.Summon.post(1)
        end)
    end)
    ClientSettingsHandler.onKeybindReleased("Summon Companion"):Connect(function() -- Line: 2109 -- upvalues: u0 (ref), u1 (ref), Sounds (upval), Animals (upval)
        if u0 and u1 then
            u0:Stop(0.1)
            u1:Disconnect()
            Sounds.stopGlobalSoundEffect(Animals.Horse.SummonWhistle, 0.1)
        end
    end)
    Companions.Mounted.listen(function(p1, p2) -- Line: 2118 -- upvalues: Log (upval), LocalPlayer (upval), u370 (upval), onMountedRideableCompanion (upval)
        Log.cross(LocalPlayer, "Received mount confirmation from server")
        if u370 then
            Log.cross(LocalPlayer, "Already mounted, ignoring server mount confirmation")
            return
        end
        u370 = p1
        onMountedRideableCompanion(p1, p2)
    end)
    useCharacterObserver(function(p1) -- Line: 2132 -- upvalues: u370 (upval), Log (upval), LocalPlayer (upval), Companions (upval), onDismountedRideableCompanion (upval), u371 (upval)
        local u9 = p1:WaitForChild("Humanoid").Seated:Connect(function(p1, p2) -- Line: 2134 -- upvalues: u370 (upval), Log (upval), LocalPlayer (upval), Companions (upval)
            if not p1 and u370 then
                Log.cross(LocalPlayer, "Dismounting companion request sent from seated connection")
                Companions.Dismount.post()
            end
        end)
        return function() -- Line: 2147 -- upvalues: u9 (val), u370 (upval), Log (upval), LocalPlayer (upval), Companions (upval), onDismountedRideableCompanion (upval), u371 (upval)
            u9:Disconnect()
            if u370 then
                Log.cross(LocalPlayer, "Dismounting companion request sent from character observer")
                Companions.Dismount.post()
                onDismountedRideableCompanion(u370, u371.model)
            end
        end
    end)
end)()
return {}