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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.BoneTree
--                               Dumped in 0.00236 seconds
--                          Bytecode version 9  |  17 functions

local u2 = Random.new(1029410295159813)
local Lighting = game:GetService("Lighting")
local Dependencies = script.Parent.Parent:WaitForChild("Dependencies")
require(script.Parent:WaitForChild("Bone"))
local Config = require(Dependencies:WaitForChild("Config"))
local DefaultObjectSettings = require(Dependencies:WaitForChild("DefaultObjectSettings"))
local Gizmo = require(Dependencies:WaitForChild("Gizmo"))
local Utilities = require(Dependencies:WaitForChild("Utilities"))
if game:GetService("RunService"):IsStudio() then
    Gizmo.Init()
elseif Config.ALLOW_LIVE_GAME_DEBUG then
    Gizmo.Init()
end
local SB_VERBOSE_LOG = Utilities.SB_VERBOSE_LOG
local function SafeUnit(p1) -- Line: 49
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
local function map(p1, p2, p3, p4, p5, p6) -- Line: 58
    local v1
    local v2 = (p1 - p2) / (p3 - p2)
    local v3 = v2 * (p5 - p4) + p4
    if not p6 then
        return v3
    end
    if p4 < p5 then
        if v3 >= p5 then
            v2 = p5
        else
            v2 = v3
        end
        if p4 >= v2 then
            v1 = p4
        elseif v3 >= p5 then
            v1 = p5
            if not v1 then
                v1 = p4
            end
        else
            v1 = v3
            if not v1 then
                v1 = p5
                if not v1 then
                    v1 = p4
                end
            end
        end
        return v1
    end
    if v3 >= p4 then
        v2 = p4
    else
        v2 = v3
    end
    if p5 >= v2 then
        v1 = p5
    elseif v3 >= p4 then
        v1 = p4
        if not v1 then
            v1 = p5
        end
    else
        v1 = v3
        if not v1 then
            v1 = p4
            if not v1 then
                v1 = p5
            end
        end
    end
    return v1
end
local u64 = {}
u64.__index = u64
function u64.new(p1, p2) -- Line: 160 -- upvalues: u2 (val), u64 (val), DefaultObjectSettings (val)
    local v1
    local v2 = {
        UpdateRate = 0,
        InView = true,
        AccumulatedDelta = 0,
        Destroyed = false,
        FirstSkipUpdate = false,
        Force = Vector3.new(0, 0, 0),
        ObjectMove = Vector3.new(0, 0, 0),
        ObjectVelocity = Vector3.new(0, 0, 0),
        ObjectAcceleration = Vector3.new(0, 0, 0),
        WindOffset = u2:NextNumber(0, 1000000),
    }
    if not (p1:IsA("Bone")) then
        v1 = nil
    else
        v1 = p1
        if not v1 then
            v1 = nil
        end
    end
    v2.Root = v1
    v2.RootPart = p2
    v2.RootPartSize = p2.Size
    v2.Bones = {}
    v2.Settings = {}
    v2.BoundingBoxCFrame = p2.CFrame
    v2.BoundingBoxSize = p2.Size
    v2.ObjectPreviousPosition = p2.Position
    local u28 = setmetatable(v2, u64)
    u28.DestroyConnection = p2.AncestryChanged:Connect(function() -- Line: 184 -- upvalues: p2 (val), u28 (val)
        if not (p2:IsDescendantOf(game)) then
            u28.Destroyed = true
        end
    end)
    u28.AttributeConnection = p2.AttributeChanged:Connect(function(p1) -- Line: 190 -- upvalues: u28 (val), p2 (val), DefaultObjectSettings (upval)
        local Attribute = p2:GetAttribute(p1)
        if not Attribute then
            Attribute = DefaultObjectSettings[p1]
        end
        u28.Settings[p1] = Attribute
    end)
    return u28
end
function u64:UpdateBoundingBox() -- Line: 201
    local Position
    debug.profilebegin("BoneTree::UpdateBoundingBox")
    if not self.InView then
        self.BoundingBoxCFrame = self.RootPart.CFrame
        self.BoundingBoxSize = self.RootPart.Size
        debug.profileend()
        return
    end
    local v1 = Vector3.new((1 / 0), (1 / 0), (1 / 0))
    local v2 = Vector3.new((-1 / 0), (-1 / 0), (-1 / 0))
    debug.profilebegin("Max Min Bones")
    local Bones = self.Bones
    local v3 = nil
    local v4 = nil
    for i, j in Bones, v3, v4 do
        debug.profilebegin("Max Min Bone")
        Position = j.Position
        v1 = v1:Min(Position)
        v2 = v2:Max(Position)
        debug.profileend()
    end
    debug.profileend()
    self.BoundingBoxCFrame = CFrame.new((v1 + v2) / 2)
    self.BoundingBoxSize = self.RootPartSize:Max(v2 - v1)
    debug.profileend()
end
function u64:UpdateThrottling(p2) -- Line: 237
    local v1, v2
    debug.profilebegin("BoneTree::UpdateThrottling")
    local Settings = self.Settings
    local Magnitude = (p2 - workspace.CurrentCamera.CFrame.Position).Magnitude
    if Settings.ActivationDistance < Magnitude then
        self.UpdateRate = 0
        debug.profileend()
        return
    end
    local ThrottleDistance = Settings.ThrottleDistance
    local v3 = (Magnitude - ThrottleDistance) / (Settings.ActivationDistance - ThrottleDistance) * 1 + 0
    if v3 >= 1 then
        v1 = 1
    else
        v1 = v3
    end
    if 0 >= v1 then
        v2 = 0
    elseif v3 >= 1 then
        v2 = 1
    else
        v2 = v3
        if not v2 then
            v2 = 1
        end
    end
    self.UpdateRate = Settings.UpdateRate * (1 - v2)
    debug.profileend()
end
function u64:PreUpdate(p2) -- Line: 258
    debug.profilebegin("BoneTree::PreUpdate")
    local Position = self.RootPart.CFrame.Position
    local ObjectVelocity = self.ObjectVelocity
    self.ObjectMove = Position - self.ObjectPreviousPosition
    self.ObjectVelocity = self.ObjectVelocity:Lerp(self.ObjectMove / p2 / 4, (math.min(p2 * 10, 1)))
    self.ObjectAcceleration = (ObjectVelocity - self.ObjectVelocity) * p2
    self.ObjectPreviousPosition = Position
    self.RootPartSize = self.RootPart.Size
    self:UpdateThrottling(Position)
    self:UpdateBoundingBox()
    local Bones = self.Bones
    local v1 = nil
    local v2 = nil
    for i, j in Bones, v1, v2 do
        j:PreUpdate(self)
    end
    debug.profileend()
end
function u64:StepPhysics(p2) -- Line: 283 -- upvalues: Lighting (val), DefaultObjectSettings (val)
    debug.profilebegin("BoneTree::StepPhysics")
    local Settings = self.Settings
    local v1 = (Settings.Gravity + Settings.Force) * p2
    if Settings.MatchWorkspaceWind ~= true then
        local Unit_2
        local Attribute = Lighting:GetAttribute("WindDirection")
        if not Attribute then
            Attribute = DefaultObjectSettings.WindDirection
        end
        local Attribute_2 = Lighting:GetAttribute("WindSpeed")
        if not Attribute_2 then
            Attribute_2 = DefaultObjectSettings.WindSpeed
        end
        if Attribute.Magnitude ~= 0 then
            Unit_2 = Attribute.Unit
        else
            Unit_2 = Vector3.new(0, 0, 0)
        end
        Settings.WindDirection = Unit_2
        Settings.WindSpeed = Attribute_2
    else
        local Unit
        local GlobalWind = workspace.GlobalWind
        if GlobalWind.Magnitude ~= 0 then
            Unit = GlobalWind.Unit
        else
            Unit = Vector3.new(0, 0, 0)
        end
        Settings.WindDirection = Unit
        Settings.WindSpeed = GlobalWind.Magnitude
    end
    local Attribute_3 = Lighting:GetAttribute("WindStrength")
    if not Attribute_3 then
        Attribute_3 = DefaultObjectSettings.WindStrength
    end
    Settings.WindStrength = Attribute_3
    local Bones = self.Bones
    local v2 = nil
    local v3 = nil
    for i, j in Bones, v2, v3 do
        j:StepPhysics(self, v1, p2)
    end
    debug.profileend()
end
function u64:Constrain(p2, p3) -- Line: 315
    debug.profilebegin("BoneTree::Constrain")
    local Bones = self.Bones
    local v1 = nil
    local v2 = nil
    for i, j in Bones, v1, v2 do
        j:Constrain(self, p2, p3)
    end
    debug.profileend()
end
function u64:SkipUpdate() -- Line: 325
    debug.profilebegin("BoneTree::SkipUpdate")
    local Bones = self.Bones
    local v1 = nil
    local v2 = nil
    for i, j in Bones, v1, v2 do
        j:SkipUpdate()
    end
    self.FirstSkipUpdate = true
    debug.profileend()
end
function u64:SolveTransform(p2) -- Line: 337
    debug.profilebegin("BoneTree::SolveTransform")
    local Bones = self.Bones
    local v1 = nil
    local v2 = nil
    for i, j in Bones, v1, v2 do
        j:SolveTransform(self, p2)
    end
    self.FirstSkipUpdate = false
    debug.profileend()
end
function u64:ApplyTransform() -- Line: 349
    debug.profilebegin("BoneTree::ApplyTransform")
    local Bones = self.Bones
    local v1 = nil
    local v2 = nil
    for i, j in Bones, v1, v2 do
        j:ApplyTransform(self)
    end
    debug.profileend()
end
function u64:DrawDebug(p2, p3, p4, p5, p6, p7, p8, p9) -- Line: 367 -- upvalues: Gizmo (val)
    local v1
    debug.profilebegin("BoneTree::DrawDebug")
    local v2 = Color3.fromRGB(248, 168, 20)
    local v3 = Color3.fromRGB(76, 208, 223)
    local v4 = Color3.fromRGB(255, 89, 89)
    local v5 = Color3.new(1, 0, 0)
    local v6 = Color3.new(0, 1, 0)
    local v7 = Color3.new(0, 0, 1)
    if p9 then
        local v8 = self.RootPart.Position + Vector3.new(0, self.RootPart.Size.Y / 2 + 1, 0)
        Gizmo.SetStyle(v5, 0, true)
        Gizmo.Arrow:Draw(v8, v8 + self.ObjectMove, 0.025, 0.1, 6)
        Gizmo.SetStyle(v6, 0, true)
        Gizmo.Arrow:Draw(v8, v8 + self.ObjectVelocity, 0.025, 0.1, 6)
        Gizmo.SetStyle(v7, 0, true)
        Gizmo.Arrow:Draw(v8, v8 + self.ObjectAcceleration, 0.025, 0.1, 6)
    end
    Gizmo.PushProperty("AlwaysOnTop", false)
    if p7 then
        Gizmo.PushProperty("Color3", v3)
        Gizmo.Box:Draw(self.BoundingBoxCFrame, self.BoundingBoxSize, true)
    end
    if p6 then
        Gizmo.PushProperty("Color3", v3)
        Gizmo.Box:Draw(self.RootPart.CFrame, self.RootPart.Size, true)
        Gizmo.SetStyle(v4, 0.75, false)
        Gizmo.VolumeBox:Draw(self.RootPart.CFrame, self.RootPart.Size)
        Gizmo.PushProperty("Transparency", 0)
    end
    local Bones = self.Bones
    local v9 = nil
    local v10 = nil
    for i, j in Bones, v9, v10 do
        v1 = self.Bones[j.ParentIndex]
        j:DrawDebug(self, p2, p3, p4, p5, p8)
        if p3 and i ~= 1 then
            Gizmo.PushProperty("Color3", v2)
            Gizmo.Ray:Draw(v1.Bone.TransformedWorldCFrame.Position, j.Bone.TransformedWorldCFrame.Position)
        end
    end
    debug.profileend()
end
function u64:DrawOverlay(p2) -- Line: 432 -- upvalues: Config (val)
    if Config.DEBUG_OVERLAY_TREE_INFO then
        p2.Text((("Root Part: %*"):format(self.RootPart.Name)))
        p2.Text((("Root Bone: %*"):format(self.Root.Name)))
        p2.Text((("Root Part Size: %*"):format((string.format("%.3f, %.3f, %.3f", self.RootPart.Size.X, self.RootPart.Size.Y, self.RootPart.Size.Z)))))
    elseif not Config.DEBUG_OVERLAY_TREE_OBJECTS then
    end
    if Config.DEBUG_OVERLAY_TREE_INFO then
        p2.Text((("Update Rate: %*"):format((string.format("%.3f", self.UpdateRate)))))
        p2.Text((("In View: %*"):format(self.InView)))
        p2.Text((("Accumulated Delta: %*"):format((string.format("%.3f", self.AccumulatedDelta)))))
        p2.Text((("Force: %*"):format((string.format("%.3f, %.3f, %.3f", self.Force.X, self.Force.Y, self.Force.Z)))))
    elseif not Config.DEBUG_OVERLAY_TREE_NUMERICS then
    end
    local v1 = Color3.new(0.486275, 0.431373, 1)
    local v2 = Color3.new(1, 1, 1)
    if Config.DEBUG_OVERLAY_BONE then
        local v3
        local Bones = self.Bones
        local v4 = nil
        local v5 = nil
        for i, j in Bones, v4, v5 do
            if 0 < Config.DEBUG_OVERLAY_MAX_BONES and Config.DEBUG_OVERLAY_BONE_OFFSET + Config.DEBUG_OVERLAY_MAX_BONES <= i then
                break
            end
            if i >= Config.DEBUG_OVERLAY_BONE_OFFSET then
                v3 = ("Bone %*"):format(i)
                v6.Begin(v3, v1, v2)
                j:DrawOverlay(v6)
                v6.End()
            end
        end
    end
end
function u64:Destroy() -- Line: 468 -- upvalues: SB_VERBOSE_LOG (val)
    SB_VERBOSE_LOG("Destroy BoneTree")
    task.synchronize()
    self.DestroyConnection:Disconnect()
    self.AttributeConnection:Disconnect()
    local Bones = self.Bones
    local v1 = nil
    local v2 = nil
    for i, j in Bones, v1, v2 do
        j:Destroy()
    end
    setmetatable(self, nil)
    task.desynchronize()
end
return u64