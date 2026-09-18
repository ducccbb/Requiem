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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Bone
--                               Dumped in 0.00465 seconds
--                          Bytecode version 9  |  23 functions

local QueryTransformedWorldCFrame, QueryTransformedWorldCFrameNonSmartbone
local Dependencies = script.Parent.Parent:WaitForChild("Dependencies")
local Config = require(Dependencies:WaitForChild("Config"))
local Gizmo = require(Dependencies:WaitForChild("Gizmo"))
local Utilities = require(Dependencies:WaitForChild("Utilities"))
if game:GetService("RunService"):IsStudio() then
    Gizmo.Init()
elseif Config.ALLOW_LIVE_GAME_DEBUG then
    Gizmo.Init()
end
local Constraints = script.Parent:WaitForChild("Constraints")
local AxisConstraint = require(Constraints:WaitForChild("AxisConstraint"))
local CollisionConstraint = require(Constraints:WaitForChild("CollisionConstraint"))
local DistanceConstraint = require(Constraints:WaitForChild("DistanceConstraint"))
local FrictionConstraint = require(Constraints:WaitForChild("FrictionConstraint"))
local RopeConstraint = require(Constraints:WaitForChild("RopeConstraint"))
local RotationConstraint = require(Constraints:WaitForChild("RotationConstraint"))
local SpringConstraint = require(Constraints:WaitForChild("SpringConstraint"))
local SB_ASSERT_CB = Utilities.SB_ASSERT_CB
local SB_VERBOSE_LOG = Utilities.SB_VERBOSE_LOG
local function IsNaN(p1) -- Line: 73
    if p1 ~= p1 then
        return true
    end
    return false
end
local u90 = {}
function QueryTransformedWorldCFrameNonSmartbone(p1) -- Line: 86 -- upvalues: u90 (val), QueryTransformedWorldCFrameNonSmartbone (val)
    local CFrame, Parent, v1
    debug.profilebegin("QueryTransformedWorldCFrameNonSmartbone")
    local v2 = u90[p1]
    if not v2 then
        Parent = p1.Parent
        if not (Parent:IsA("Bone")) then
            CFrame = Parent.CFrame
        else
            CFrame = QueryTransformedWorldCFrameNonSmartbone(Parent)
        end
        v1 = CFrame * p1.TransformedCFrame
        u90[p1] = {Frame = shared.FrameCounter, CFrame = v1}
        debug.profileend()
        return v1
    end
    if v2.Frame == shared.FrameCounter then
        return v2.CFrame
    end
    Parent = p1.Parent
    if not (Parent:IsA("Bone")) then
        CFrame = Parent.CFrame
    else
        CFrame = QueryTransformedWorldCFrameNonSmartbone(Parent)
    end
    v1 = CFrame * p1.TransformedCFrame
    u90[p1] = {Frame = shared.FrameCounter, CFrame = v1}
    debug.profileend()
    return v1
end
function QueryTransformedWorldCFrame(p1, p2) -- Line: 113 -- upvalues: QueryTransformedWorldCFrameNonSmartbone (val), QueryTransformedWorldCFrame (val)
    debug.profilebegin("QueryTransformedWorldCFrame")
    p2.SolvedAnimatedCFrame = true
    local ParentIndex = p2.ParentIndex
    local Bone = p2.Bone
    if ParentIndex < 1 then
        debug.profileend()
        return (QueryTransformedWorldCFrameNonSmartbone(Bone))
    end
    local v1 = p1.Bones[ParentIndex]
    if not v1.SolvedAnimatedCFrame then
        v1.AnimatedWorldCFrame = QueryTransformedWorldCFrame(p1, v1)
    end
    debug.profileend()
    return v1.AnimatedWorldCFrame * Bone.TransformedCFrame
end
local function ClipVector(p1, p2, p3) -- Line: 135
    local v1 = p1 * (Vector3.new(1, 1, 1) - p3)
    return v1 + p2 * p3
end
local function GetFriction(p1, p2) -- Line: 141
    local CurrentPhysicalProperties = p1.CurrentPhysicalProperties
    local CurrentPhysicalProperties_2 = p2.CurrentPhysicalProperties
    local FrictionWeight = CurrentPhysicalProperties.FrictionWeight
    local FrictionWeight_2 = CurrentPhysicalProperties_2.FrictionWeight
    return (CurrentPhysicalProperties.Friction * FrictionWeight + CurrentPhysicalProperties_2.Friction * FrictionWeight_2) / (FrictionWeight + FrictionWeight_2)
end
local function SolveWind(p1, p2) -- Line: 154
    local GetNoise, SampleGust, SampleNoise, SampleSin, WindOffset, u24, v1, v2, v3, v4, v5, v6, v7, v8
    local Settings = p2.Settings
    local WindType = Settings.WindType
    if WindType == "Sine" or WindType == "Noise" then
        WindOffset = p2.WindOffset
        v8 = os.clock() - p1.HeirarchyLength * 0.2
        v7 = v8 + (p1.TransformOffset.Position - p2.Root.WorldPosition).Magnitude * 0.2
        u24 = WindOffset + v7 * Settings.WindInfluence
        v6 = nil
        function GetNoise(p1, p2, p3, p4) -- Line: 170
            local v1 = math.noise(p1, p2, p3)
            v1 = math.clamp(v1, -1, 1)
            if p4 then
                v1 = v1 ^ 2
            end
            return v1
        end
        function SampleGust() -- Line: 181 -- upvalues: u24 (val)
            return math.sin(u24 * 1) * 0.3 + 0.7
        end
        function SampleSin() -- Line: 187 -- upvalues: Settings (val), u24 (val)
            local v1 = Settings.WindStrength ^ 0.8
            local v2 = Settings.WindSpeed * 2
            local v3 = math.sin(u24 * v1) ^ 2
            local v4 = math.cos(u24 * v1) ^ 2
            return Settings.WindDirection * ((v3 + (v4 - v3) * v4) * v2)
        end
        function SampleNoise(p1, a2) -- Line: 196 -- upvalues: Settings (val), p2 (val)
            local v1 = p1 or 0
            local v2 = Settings.WindStrength ^ 0.8
            local v3 = Settings.WindSpeed * 2
            local WindOffset = p2.WindOffset
            local v4 = math.noise(v2, 0, WindOffset)
            v4 = math.clamp(v4, -1, 1)
            if a2 then
                v4 = v4 ^ 2
            end
            local v5 = v4
            local v6 = math.noise(0, v2, WindOffset)
            v6 = math.clamp(v6, -1, 1)
            if a2 then
                v6 = v6 ^ 2
            end
            v4 = v6
            local v7 = math.noise(WindOffset, 0, v2)
            v7 = math.clamp(v7, -1, 1)
            if a2 then
                v7 = v7 ^ 2
            end
            v4 = v7 * (v3 + v1)
            return Settings.WindDirection * Vector3.new(v5 * (v3 + v1), v4 * (v3 + v1), v4)
        end
        if Settings.WindType == "Sine" then
            v2 = Settings.WindStrength ^ 0.8
            v3 = Settings.WindSpeed * 2
            v4 = math.sin(u24 * v2) ^ 2
            v5 = math.cos(u24 * v2) ^ 2
            v6 = Settings.WindDirection * ((v4 + (v5 - v4) * v5) * v3) * (math.sin(u24 * 1) * 0.3 + 0.7)
        elseif Settings.WindType == "Noise" then
            v1 = SampleNoise(0, true)
            v6 = v1 * (math.sin(u24 * 1) * 0.3 + 0.7)
        elseif Settings.WindType == "Hybrid" then
            v2 = Settings.WindStrength ^ 0.8
            v3 = Settings.WindSpeed * 2
            v4 = math.sin(u24 * v2) ^ 2
            v5 = math.cos(u24 * v2) ^ 2
            v6 = Settings.WindDirection * ((v4 + (v5 - v4) * v5) * v3) * (math.sin(u24 * 1) * 0.3 + 0.7)
            v2 = SampleNoise(0.5, true)
            v6 = (v6 + v2 * (math.sin(u24 * 1) * 0.3 + 0.7)) * 0.5
        end
        v6 = v6 / math.max(p1.FreeLength, 0.01)
        v6 = v6 * (Settings.WindInfluence * (Settings.WindStrength * 0.01) * (math.clamp(p1.HeirarchyLength, 1, 10) * 0.1))
        return v6 * p1.Weight
    end
    if WindType ~= "Hybrid" then
        return (Vector3.new(0, 0, 0))
    end
    WindOffset = p2.WindOffset
    v8 = os.clock() - p1.HeirarchyLength * 0.2
    v7 = v8 + (p1.TransformOffset.Position - p2.Root.WorldPosition).Magnitude * 0.2
    u24 = WindOffset + v7 * Settings.WindInfluence
    v6 = nil
    function GetNoise(p1, p2, p3, p4) -- Line: 170
        local v1 = math.noise(p1, p2, p3)
        v1 = math.clamp(v1, -1, 1)
        if p4 then
            v1 = v1 ^ 2
        end
        return v1
    end
    function SampleGust() -- Line: 181 -- upvalues: u24 (val)
        return math.sin(u24 * 1) * 0.3 + 0.7
    end
    function SampleSin() -- Line: 187 -- upvalues: Settings (val), u24 (val)
        local v1 = Settings.WindStrength ^ 0.8
        local v2 = Settings.WindSpeed * 2
        local v3 = math.sin(u24 * v1) ^ 2
        local v4 = math.cos(u24 * v1) ^ 2
        return Settings.WindDirection * ((v3 + (v4 - v3) * v4) * v2)
    end
    function SampleNoise(p1, a2) -- Line: 196 -- upvalues: Settings (val), p2 (val)
        local v1 = p1 or 0
        local v2 = Settings.WindStrength ^ 0.8
        local v3 = Settings.WindSpeed * 2
        local WindOffset = p2.WindOffset
        local v4 = math.noise(v2, 0, WindOffset)
        v4 = math.clamp(v4, -1, 1)
        if a2 then
            v4 = v4 ^ 2
        end
        local v5 = v4
        local v6 = math.noise(0, v2, WindOffset)
        v6 = math.clamp(v6, -1, 1)
        if a2 then
            v6 = v6 ^ 2
        end
        v4 = v6
        local v7 = math.noise(WindOffset, 0, v2)
        v7 = math.clamp(v7, -1, 1)
        if a2 then
            v7 = v7 ^ 2
        end
        v4 = v7 * (v3 + v1)
        return Settings.WindDirection * Vector3.new(v5 * (v3 + v1), v4 * (v3 + v1), v4)
    end
    if Settings.WindType == "Sine" then
        v2 = Settings.WindStrength ^ 0.8
        v3 = Settings.WindSpeed * 2
        v4 = math.sin(u24 * v2) ^ 2
        v5 = math.cos(u24 * v2) ^ 2
        v6 = Settings.WindDirection * ((v4 + (v5 - v4) * v5) * v3) * (math.sin(u24 * 1) * 0.3 + 0.7)
    elseif Settings.WindType == "Noise" then
        v1 = SampleNoise(0, true)
        v6 = v1 * (math.sin(u24 * 1) * 0.3 + 0.7)
    elseif Settings.WindType == "Hybrid" then
        v2 = Settings.WindStrength ^ 0.8
        v3 = Settings.WindSpeed * 2
        v4 = math.sin(u24 * v2) ^ 2
        v5 = math.cos(u24 * v2) ^ 2
        v6 = Settings.WindDirection * ((v4 + (v5 - v4) * v5) * v3) * (math.sin(u24 * 1) * 0.3 + 0.7)
        v2 = SampleNoise(0.5, true)
        v6 = (v6 + v2 * (math.sin(u24 * 1) * 0.3 + 0.7)) * 0.5
    end
    v6 = v6 / math.max(p1.FreeLength, 0.01)
    v6 = v6 * (Settings.WindInfluence * (Settings.WindStrength * 0.01) * (math.clamp(p1.HeirarchyLength, 1, 10) * 0.1))
    return v6 * p1.Weight
end
local u96 = {}
u96.__index = u96
function u96.new(p1, p2, p3) -- Line: 321 -- upvalues: u96 (val), Utilities (val)
    local TransformedWorldCFrame
    if not (p1.Parent:IsA("Bone")) then
        TransformedWorldCFrame = p3.CFrame
    else
        TransformedWorldCFrame = p1.Parent.TransformedWorldCFrame
        if not TransformedWorldCFrame then
            TransformedWorldCFrame = p3.CFrame
        end
    end
    local u81 = setmetatable({
        Bone = p1,
        FreeLength = -1,
        Weight = 0.7,
        ParentIndex = -1,
        HeirarchyLength = 0,
        Transform = p1.TransformedWorldCFrame:ToObjectSpace(TransformedWorldCFrame):Inverse(),
        LocalTransform = p1.TransformedCFrame:ToObjectSpace(p2.TransformedCFrame):Inverse(),
        RootPart = p3,
        RootBone = p2,
        Radius = 0,
        Friction = 0,
        RotationLimit = 0,
        Force = nil,
        Gravity = nil,
        SolvedAnimatedCFrame = false,
        HasChild = false,
        AnimatedWorldCFrame = p1.TransformedWorldCFrame,
        StartingCFrame = p1.TransformedCFrame,
        TransformOffset = CFrame.identity,
        LocalTransformOffset = CFrame.identity,
        RestPosition = Vector3.new(0, 0, 0),
        CalculatedWorldCFrame = p1.TransformedWorldCFrame,
        Position = p1.TransformedWorldCFrame.Position,
        LastPosition = p1.TransformedWorldCFrame.Position,
        WeldPosition = Vector3.new(0, 0, 0),
        ActiveWeld = false,
        RigidWeld = false,
        Anchored = false,
        AxisLocked = {false, false, false},
        XAxisLimits = NumberRange.new((-1 / 0), (1 / 0)),
        YAxisLimits = NumberRange.new((-1 / 0), (1 / 0)),
        ZAxisLimits = NumberRange.new((-1 / 0), (1 / 0)),
        FirstSkipUpdate = false,
        CollisionHits = {},
        CollisionsData = {},
    }, u96)
    u81.AttributeConnection = p1.AttributeChanged:Connect(function(a1) -- Line: 371 -- upvalues: Utilities (upval), p1 (val), u81 (val)
        local v1, v2
        local v3 = Utilities.GatherBoneSettings(p1)
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            v1 = u81
            if j == "¬" then
                v2 = nil
            else
                v2 = j
            end
            v1[i] = v2
        end
    end)
    return u81
end
function u96.ClipVelocity(p1, p2, p3) -- Line: 388
    local v1 = p1.LastPosition * (Vector3.new(1, 1, 1) - p3)
    p1.LastPosition = v1 + p2 * p3
end
function u96.PreUpdate(p1, p2) -- Line: 394 -- upvalues: QueryTransformedWorldCFrame (val), QueryTransformedWorldCFrameNonSmartbone (val)
    debug.profilebegin("Bone::PreUpdate")
    local v1 = p2.Bones[1]
    local v2 = p2.Bones[p1.ParentIndex]
    p1.AnimatedWorldCFrame = QueryTransformedWorldCFrame(p2, p1)
    local SmartWeld = p1.Bone:FindFirstChild("SmartWeld")
    p1.ActiveWeld = false
    if SmartWeld and SmartWeld:IsA("ObjectValue") then
        local Value = SmartWeld.Value
        local v3 = not (SmartWeld:GetAttribute("Rigid") ~= true)
        p1.RigidWeld = v3
        if Value then
            if Value:IsA("Attachment") then
                p1.WeldPosition = Value.WorldPosition
                p1.ActiveWeld = true
            elseif Value:IsA("BasePart") then
                p1.WeldPosition = Value.Position
                p1.ActiveWeld = true
            end
        end
    end
    if p1.ParentIndex < 1 then
        p1.Anchored = true
    end
    if p1.Bone ~= p1.RootBone then
        p1.TransformOffset = v2.AnimatedWorldCFrame * p1.Transform
    else
        local CFrame
        if not (p1.Bone.Parent:IsA("Bone")) then
            CFrame = p1.RootPart.CFrame
        else
            CFrame = QueryTransformedWorldCFrameNonSmartbone(p1.Bone.Parent)
        end
        p1.TransformOffset = CFrame * p1.Transform
    end
    p1.LocalTransformOffset = v1.Bone.CFrame * p1.LocalTransform
    debug.profileend()
end
function u96.StepPhysics(p1, p2, p3, p4) -- Line: 451 -- upvalues: SolveWind (val)
    local Force, Gravity, v1
    debug.profilebegin("Bone::StepPhysics")
    if p1.Anchored then
        p1.LastPosition = p1.AnimatedWorldCFrame.Position
        p1.Position = p1.AnimatedWorldCFrame.Position
        debug.profileend()
        return
    end
    if p1.Force then
        Gravity = p1.Gravity
        if not Gravity then
            Gravity = p2.Settings.Gravity
        end
        Force = p1.Force
        if not Force then
            Force = p2.Settings.Force
        end
        v1 = (Gravity + Force) * p4
    elseif not p1.Gravity then
        v1 = p3
    end
    local Settings = p2.Settings
    local v2 = p1.Position - p1.LastPosition
    local v3 = p2.ObjectAcceleration * Settings.Inertia
    local v4 = SolveWind(p1, p2)
    p1.LastPosition = p1.Position
    p1.Position = p1.Position + (v2 * (1 - Settings.Damping) + v1 + v3 + v4)
    debug.profileend()
end
function u96.Constrain(p1, p2, p3, p4) -- Line: 484 -- upvalues: FrictionConstraint (val), CollisionConstraint (val), SpringConstraint (val), DistanceConstraint (val), RopeConstraint (val), AxisConstraint (val), RotationConstraint (val)
    local CurrentPhysicalProperties, CurrentPhysicalProperties_2, FrictionWeight, FrictionWeight_2, Position
    debug.profilebegin("Bone::Constrain")
    if p1.Anchored then
        debug.profileend()
        return
    end
    local v1 = FrictionConstraint(p1, p1.Position, p1.LastPosition)
    if #p3 ~= 0 then
        v1 = CollisionConstraint(p1, v1, p3)
    end
    if p2.Settings.Constraint == "Spring" then
        Position = SpringConstraint(p1, v1, nil, p2, p4)
    elseif p2.Settings.Constraint == "Distance" then
        Position = DistanceConstraint(p1, v1, p2)
    elseif p2.Settings.Constraint ~= "Rope" then
        Position = p1.AnimatedWorldCFrame.Position
    else
        Position = RopeConstraint(p1, v1, p2)
    end
    v1 = AxisConstraint(p1, Position, p1.LastPosition, p1.RootPart.CFrame)
    v1 = RotationConstraint(p1, v1, p2)
    if p1.ActiveWeld then
        if not p1.RigidWeld then
            v1 = SpringConstraint(p1, v1, p1.WeldPosition, p2, p4)
        else
            v1 = DistanceConstraint(p1, p1.WeldPosition, p2)
        end
    end
    p1.Friction = 0
    local CollisionHits = p1.CollisionHits
    local v2 = nil
    local v3 = nil
    for i, j in CollisionHits, v2, v3 do
        CurrentPhysicalProperties = p1.RootPart.CurrentPhysicalProperties
        CurrentPhysicalProperties_2 = j.CurrentPhysicalProperties
        FrictionWeight = CurrentPhysicalProperties.FrictionWeight
        FrictionWeight_2 = CurrentPhysicalProperties_2.FrictionWeight
        p1.Friction = math.max((CurrentPhysicalProperties.Friction * FrictionWeight + CurrentPhysicalProperties_2.Friction * FrictionWeight_2) / (FrictionWeight + FrictionWeight_2), p1.Friction)
    end
    p1.Position = v1
    debug.profileend()
end
function u96.SkipUpdate(p1) -- Line: 538 -- upvalues: Config (val), SB_VERBOSE_LOG (val)
    if p1.FirstSkipUpdate == false and Config.RESET_TRANSFORM_ON_SKIP then
        SB_VERBOSE_LOG("Skipping bone, resetting transform.")
        p1.CalculatedWorldCFrame = p1.AnimatedWorldCFrame
        p1.FirstSkipUpdate = true
    end
    p1.Position = p1.Bone.WorldPosition
    p1.LastPosition = p1.Position
end
function u96.SolveTransform(p1, p2, p3) -- Line: 553 -- upvalues: Utilities (val), SB_ASSERT_CB (val)
    debug.profilebegin("Bone::SolveTransform")
    if p1.ParentIndex < 1 then
        debug.profileend()
        return
    end
    p1.FirstSkipUpdate = false
    local v1 = p2.Bones[p1.ParentIndex]
    local Bone = v1.Bone
    if v1 and Bone then
        local v2
        local TransformOffset = v1.TransformOffset
        local v3 = Utilities.GetRotationBetween(TransformOffset.UpVector, p1.Position - v1.Position).Rotation * TransformOffset.Rotation
        local v4 = math.min(1 - 1e-05 ^ p3, 1)
        if not v1.ActiveWeld then
            v2 = CFrame.new(v1.Position) * v3
            v1.CalculatedWorldCFrame = Bone.WorldCFrame:Lerp(v2, v4)
        elseif v1.RigidWeld then
            v1.CalculatedWorldCFrame = CFrame.new(v1.Position) * v3
        end
        local Position = v1.CalculatedWorldCFrame.Position
        v2 = not (Position == Position)
        SB_ASSERT_CB(not v2, warn, "If you see this report this as a bug, (NaN Calc world cframe)")
    end
    debug.profileend()
end
function u96.ApplyTransform(p1, p2) -- Line: 587
    debug.profilebegin("Bone::ApplyTransform")
    p1.SolvedAnimatedCFrame = false
    if p1.ParentIndex < 1 then
        debug.profileend()
        return
    end
    local v1 = p2.Bones[p1.ParentIndex]
    local Bone = v1.Bone
    if not v1 then
        debug.profileend()
        return
    elseif not Bone then
        debug.profileend()
        return
    elseif not v1.Anchored then
        if not v1.Anchored then
            if v1.Anchored then
                Bone.WorldCFrame = v1.TransformOffset
                debug.profileend()
                return
            end
            Bone.WorldCFrame = v1.CalculatedWorldCFrame
            debug.profileend()
            return
        end
        if p2.Settings.AnchorsRotate == true then
            Bone.WorldCFrame = v1.TransformOffset * v1.CalculatedWorldCFrame.Rotation
            debug.profileend()
            return
        end
        if v1.Anchored then
            Bone.WorldCFrame = v1.TransformOffset
            debug.profileend()
            return
        end
        Bone.WorldCFrame = v1.CalculatedWorldCFrame
        debug.profileend()
        return
    elseif p2.Settings.AnchorsRotate == false then
        Bone.WorldCFrame = v1.TransformOffset
        debug.profileend()
        return
    end
end
function u96.DrawDebug(p1, p2, p3, p4, p5, p6, p7) -- Line: 628 -- upvalues: Gizmo (val)
    local v1, v2, v3
    debug.profilebegin("Bone::DrawDebug")
    local v4 = Color3.fromRGB(255, 0, 0)
    local v5 = Color3.fromRGB(255, 94, 0)
    local v6 = Color3.fromRGB(234, 1, 255)
    local v7 = Color3.fromRGB(0, 255, 255)
    local v8 = Color3.fromRGB(255, 0, 0)
    local v9 = Color3.fromRGB(0, 255, 0)
    local v10 = Color3.fromRGB(0, 0, 255)
    local v11 = Color3.fromRGB(0, 183, 255)
    local v12 = Color3.fromRGB(255, 0, 0)
    local v13 = Color3.fromRGB(0, 255, 0)
    local v14 = Color3.fromRGB(0, 0, 255)
    local v15 = Color3.fromRGB(28, 41, 224)
    local v16 = Color3.fromRGB(255, 27, 27)
    local v17 = 1
    local AnimatedWorldCFrame = p1.AnimatedWorldCFrame
    local Position = AnimatedWorldCFrame.Position
    local v18 = CFrame.new(p1.Position)
    local v19 = CFrame.new(p1.LastPosition)
    if p5 then
        Gizmo.PushProperty("AlwaysOnTop", false)
        Gizmo.PushProperty("Color3", v4)
        Gizmo.Sphere:Draw(v18, p1.Radius, 10, 360)
        Gizmo.PushProperty("Color3", v5)
        Gizmo.Sphere:Draw(v19, p1.Radius, 10, 360)
        Gizmo.PushProperty("Color3", v6)
        Gizmo.Ray:Draw(p1.Position, p1.LastPosition)
    end
    if p6 and not p1.Anchored then
        local v20
        v1 = p1.AxisLocked[1]
        local RootPart = p1.RootPart
        local v21 = RootPart.CFrame:PointToObjectSpace(Position)
        local RightVector = RootPart.CFrame.RightVector
        local UpVector = RootPart.CFrame.UpVector
        local LookVector = RootPart.CFrame.LookVector
        if not v1 then
            Gizmo.PushProperty("Color3", v12)
            Gizmo.Arrow:Draw(Position - RightVector * 2, Position + RightVector * 2, 0.05, 0.15, 9)
            v20 = p1.XAxisLimits.Max - v21.X
            Gizmo.Plane:Draw(Position + RightVector * (p1.XAxisLimits.Min - v21.X), RightVector, (Vector3.new(5, 5, 0)))
            Gizmo.Plane:Draw(Position + RightVector * v20, RightVector, (Vector3.new(5, 5, 0)))
        end
        if not (p1.AxisLocked[2]) then
            Gizmo.PushProperty("Color3", v13)
            Gizmo.Arrow:Draw(Position - UpVector * 2, Position + UpVector * 2, 0.05, 0.15, 9)
            v20 = p1.YAxisLimits.Max - v21.Y
            Gizmo.Plane:Draw(Position + UpVector * (p1.YAxisLimits.Min - v21.Y), UpVector, (Vector3.new(5, 5, 0)))
            Gizmo.Plane:Draw(Position + UpVector * v20, UpVector, (Vector3.new(5, 5, 0)))
        end
        if not (p1.AxisLocked[3]) then
            Gizmo.PushProperty("Color3", v14)
            Gizmo.Arrow:Draw(Position - LookVector * 2, Position + LookVector * 2, 0.05, 0.15, 9)
            v20 = p1.ZAxisLimits.Max - v21.Z
            Gizmo.Plane:Draw(Position - LookVector * (p1.ZAxisLimits.Min - v21.Z), LookVector, (Vector3.new(5, 5, 0)))
            Gizmo.Plane:Draw(Position - LookVector * v20, LookVector, (Vector3.new(5, 5, 0)))
        end
    end
    if p4 then
        Gizmo.PushProperty("Color3", v7)
        Gizmo.Sphere:Draw(AnimatedWorldCFrame, 0.08, 5, 360)
        Gizmo.PushProperty("Color3", v8)
        Gizmo.VolumeArrow:Draw(Position, Position + AnimatedWorldCFrame.LookVector * 0.25, 0.005, 0.015, 0.05, true)
        Gizmo.PushProperty("Color3", v9)
        Gizmo.VolumeArrow:Draw(Position, Position + AnimatedWorldCFrame.UpVector * 0.25, 0.005, 0.015, 0.05, true)
        Gizmo.PushProperty("Color3", v10)
        Gizmo.VolumeArrow:Draw(Position, Position + AnimatedWorldCFrame.RightVector * 0.25, 0.005, 0.015, 0.05, true)
    end
    if p3 and not p1.Anchored then
        local v22
        local CollisionsData = p1.CollisionsData
        v2 = nil
        v3 = nil
        for i, j in CollisionsData, v2, v3 do
            Gizmo.PushProperty("Color3", v15)
            v22 = CFrame.new(j.ClosestPoint)
            Gizmo.Sphere:Draw(v22, 0.08, 5, 360)
            Gizmo.PushProperty("Color3", v16)
            Gizmo.Arrow:Draw(j.ClosestPoint, j.ClosestPoint + j.Normal * 0.5, 0.05, 0.15, 9)
        end
    end
    if p7 and p1.RotationLimit < 180 and 0 < p1.RotationLimit and 0 < p1.ParentIndex and p1.HasChild then
        v2 = 1
        if p1.RotationLimit < 89.5 then
            v1 = v17 * math.tan((math.rad(p1.RotationLimit)))
        elseif 90 >= p1.RotationLimit then
            v17 = 0
            v1 = 5
        else
            v2 = -1
            v1 = v17 * math.tan((math.rad(180 - p1.RotationLimit)))
        end
        v1 = math.min(v1, 5)
        if v1 == 5 then
            v17 = 0
        end
        v3 = (p1.Position - p2.Bones[p1.ParentIndex].Position).Unit * v2
        local v23 = CFrame.lookAt(Position + v3 * (v17 / 2), Position + -v3 * 500, AnimatedWorldCFrame.LookVector)
        Gizmo.PushProperty("Color3", v11)
        Gizmo.Cone:Draw(v23, v1, v17, 8 + v1 * 2)
    end
    debug.profileend()
end
function u96.DrawOverlay(p1, p2) -- Line: 819 -- upvalues: Config (val)
    p2.Text((("Bone: %*"):format(p1.Bone.Name)))
    if Config.DEBUG_OVERLAY_BONE_INFO then
        p2.Text((("Free Length: %*"):format(p1.FreeLength)))
        p2.Text((("Weight: %*"):format(p1.Weight)))
        p2.Text((("Parent Index: %*"):format(p1.ParentIndex)))
        p2.Text((("Heirarchy Length: %*"):format(p1.HeirarchyLength)))
        p2.Text((("Radius: %*"):format(p1.Radius)))
        p2.Text((("Friction: %*"):format(p1.Friction)))
        p2.Text((("Rotation Limit: %*"):format(p1.RotationLimit)))
    elseif not Config.DEBUG_OVERLAY_BONE_NUMERICS then
    end
    if Config.DEBUG_OVERLAY_BONE_INFO then
        p2.Text((("Anchored: %*"):format(p1.Anchored)))
        local v1 = p1.AxisLocked[1]
        local v2 = p1.AxisLocked[2]
        p2.Text((("Axis Locked: %*, %*, %*"):format(v1, v2, p1.AxisLocked[3])))
        p2.Text((("X Axis Limit: %*"):format(p1.XAxisLimits)))
        p2.Text((("Y Axis Limit: %*"):format(p1.YAxisLimits)))
        p2.Text((("Z Axis Limit: %*"):format(p1.ZAxisLimits)))
    elseif not Config.DEBUG_OVERLAY_BONE_CONSTRAIN then
    end
    if Config.DEBUG_OVERLAY_BONE_INFO then
        p2.Text((("Active Weld: %*"):format(p1.ActiveWeld)))
        p2.Text((("Rigid Weld: %*"):format(p1.RigidWeld)))
        p2.Text((("Weld Position: %*"):format((string.format("%.3f, %.3f, %.3f", p1.WeldPosition.X, p1.WeldPosition.Y, p1.WeldPosition.Z)))))
    elseif not Config.DEBUG_OVERLAY_BONE_WELD then
    end
    if Config.DEBUG_OVERLAY_BONE_INFO then
        local v3, v4
        if not p1.Force then
            v3 = "-, -, -"
        else
            v3 = string.format("%.3f, %.3f, %.3f", p1.Force.X, p1.Force.Y, p1.Force.Z)
        end
        if not p1.Gravity then
            v4 = "-, -, -"
        else
            v4 = string.format("%.3f, %.3f, %.3f", p1.Gravity.X, p1.Gravity.Y, p1.Gravity.Z)
            if not v4 then
                v4 = "-, -, -"
            end
        end
        p2.Text((("Force: %*"):format(v3)))
        p2.Text((("Gravity: %*"):format(v4)))
    elseif not Config.DEBUG_OVERLAY_BONE_FORCES then
    end
end
function u96.Destroy(p1) -- Line: 855 -- upvalues: Config (val)
    if Config.RESET_BONE_ON_DESTROY then
        task.synchronize()
        p1.Bone.CFrame = p1.StartingCFrame
    end
    p1.AttributeConnection:Disconnect()
    setmetatable(p1, nil)
end
return u96