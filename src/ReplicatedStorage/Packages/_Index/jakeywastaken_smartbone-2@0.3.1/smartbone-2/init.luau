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
--  File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2
--                               Dumped in 0.00269 seconds
--                          Bytecode version 9  |  25 functions

local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Components = script:WaitForChild("Components")
local Dependencies = script:WaitForChild("Dependencies")
local CeiveImOverlay = require(Dependencies:WaitForChild("CeiveImOverlay"))
local Config = require(Dependencies:WaitForChild("Config"))
local Frustum = require(Dependencies:WaitForChild("Frustum"))
local Utilities = require(Dependencies:WaitForChild("Utilities"))
local u54 = nil
local Bone = require(Components:WaitForChild("Bone"))
local BoneTree = require(Components:WaitForChild("BoneTree"))
local Collision = Components:WaitForChild("Collision")
local ColliderObject = require(Collision:WaitForChild("ColliderObject"))
local Runtime = Dependencies:WaitForChild("Runtime")
local function CopyPasteAttributes(p1, p2) -- Line: 22
    for i, j in p1:GetAttributes() do
        p2:SetAttribute(i, j)
    end
end
local SB_INDENT_LOG = Utilities.SB_INDENT_LOG
local SB_UNINDENT_LOG = Utilities.SB_UNINDENT_LOG
local SB_VERBOSE_LOG = Utilities.SB_VERBOSE_LOG
local SB_VERBOSE_WARN = Utilities.SB_VERBOSE_WARN
local u86 = {}
u86.__index = u86
function u86.new() -- Line: 73 -- upvalues: HttpService (val), u86 (val)
    local v1 = {ShouldDestroy = false, ID = HttpService:GenerateGUID(false), BoneTrees = {}, ColliderObjects = {}}
    return (setmetatable(v1, u86))
end
function u86.m_AppendBone(p1, p2, p3, p4, p5) -- Line: 96 -- upvalues: Utilities (val), Bone (val), SB_VERBOSE_LOG (val)
    local v1, v2, v3, v4
    local v5 = Utilities.GatherBoneSettings(p3)
    local v6 = Bone.new(p3, p2.Root, p2.RootPart)
    local v7 = v5
    local v8 = nil
    local v9 = nil
    v1, v3, v4 = p2, p4, p5
    for i, j in v7, v8, v9 do
        if j == "¬" then
            v2 = nil
        else
            v2 = j
        end
        v6[i] = v2
    end
    v7 = v1.Bones[v3]
    if 0 < v3 then
        local Magnitude = (v7.Position - v6.Position).Magnitude
        v6.FreeLength = Magnitude
        v6.Weight = Magnitude * 0.7
        v6.HeirarchyLength = v4
        v7.HasChild = true
    end
    if v4 <= v1.Settings.AnchorDepth then
        SB_VERBOSE_LOG("Anchoring bone")
        v6.Anchored = true
    end
    v6.ParentIndex = v3
    table.insert(v1.Bones, v6)
end
function u86:m_CreateBoneTree(p2, p3) -- Line: 134 -- upvalues: Utilities (val), BoneTree (val), SB_VERBOSE_LOG (val), SB_INDENT_LOG (val), SB_UNINDENT_LOG (val)
    local AddChildren
    local v1 = Utilities.GatherObjectSettings(p2)
    local u11 = BoneTree.new(p3, p2)
    u11.Settings = v1
    SB_VERBOSE_LOG((("Creating bone tree %*; %*"):format(p2.Name, p3.Name)))
    SB_INDENT_LOG()
    function AddChildren(p1, p2, p3) -- Line: 143 -- upvalues: SB_VERBOSE_LOG (upval), SB_INDENT_LOG (upval), self (val), u11 (val), AddChildren (val), SB_UNINDENT_LOG (upval)
        local Bone
        SB_VERBOSE_LOG((("Adding bone: %*; %*; %*"):format(p1.Name, p2, p3)))
        SB_INDENT_LOG()
        local Children = p1:GetChildren()
        local v1 = Children
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j:IsA("Bone") then
                self:m_AppendBone(u11, j, p2, p3)
                AddChildren(j, #u11.Bones, p3 + 1)
            end
        end
        if #Children == 0 then
            local WorldPosition
            SB_VERBOSE_LOG("Adding tail bone")
            local Parent = p1.Parent
            if not (Parent:IsA("Bone")) then
                WorldPosition = Parent.Position
            else
                WorldPosition = Parent.WorldPosition
            end
            v3 = p1.WorldCFrame + p1.WorldCFrame.UpVector.Unit * (p1.WorldPosition - WorldPosition).Magnitude
            Bone = Instance.new("Bone")
            Bone.Parent = p1
            Bone.Name = p1.Name .. "_Tail"
            Bone.WorldCFrame = v3
            for k, n in p1:GetAttributes() do
                Bone:SetAttribute(k, n)
            end
            self:m_AppendBone(u11, Bone, #u11.Bones, p3)
        end
        SB_UNINDENT_LOG()
    end
    self:m_AppendBone(u11, p3, 0, 0)
    AddChildren(p3, 1, 1)
    table.insert(self.BoneTrees, u11)
    SB_UNINDENT_LOG()
end
function u86:m_UpdateViewFrustum() -- Line: 190 -- upvalues: Frustum (val), Config (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    debug.profilebegin("SmartBone2::m_UpdateViewFrustum")
    v1, v2, v3, v4, v5, v6, v7, v8, v9 = Frustum.GetCFrames(workspace.CurrentCamera, Config.FAR_PLANE)
    local BoneTrees = self.BoneTrees
    local v10 = nil
    local v11 = nil
    for i, j in BoneTrees, v10, v11 do
        debug.profilebegin("BoneTree::m_UpdateViewFrustum")
        j.InView = Frustum.ObjectInFrustum({CFrame = j.BoundingBoxCFrame, Size = j.BoundingBoxSize}, v1, v2, v3, v4, v5, v6, v7, v8, v9)
        debug.profileend()
    end
    debug.profileend()
end
function u86:m_CleanColliders() -- Line: 206 -- upvalues: SB_VERBOSE_WARN (val), SB_INDENT_LOG (val), SB_UNINDENT_LOG (val)
    local ColliderObjects
    debug.profilebegin("Clean Colliders")
    if #self.ColliderObjects ~= 0 then
        ColliderObjects = self.ColliderObjects
        local v1 = nil
        local v2 = nil
        local v3 = self
        for i, j in ColliderObjects, v1, v2 do
            if #j.Colliders == 0 then
                SB_VERBOSE_WARN("Deleting Collider Object")
                SB_INDENT_LOG()
                j:Destroy()
                SB_UNINDENT_LOG()
                table.remove(v3.ColliderObjects, i)
            elseif j.Destroyed ~= true then
            end
        end
    end
    debug.profileend()
end
function u86:m_ConstrainBoneTree(p2, p3) -- Line: 230
    debug.profilebegin("SmartBone2::m_ConstrainBoneTree")
    p2:Constrain(self.ColliderObjects, p3)
    debug.profileend()
end
function u86:m_UpdateBoneTree(p2, p3, p4) -- Line: 247 -- upvalues: SB_VERBOSE_LOG (val)
    debug.profilebegin("SmartBone2::m_UpdateBoneTree")
    if p2.Destroyed then
        p2:Destroy()
        table.remove(self.BoneTrees, p3)
        return
    end
    p2:PreUpdate(p4)
    if not p2.InView then
        local FirstSkipUpdate = p2.FirstSkipUpdate
        p2:SkipUpdate()
        if not FirstSkipUpdate then
            debug.profileend()
            task.synchronize()
            p2:ApplyTransform()
            local v1 = math.floor(p2.UpdateRate) == 0
            SB_VERBOSE_LOG((("Skipping BoneTree, InView: %*, Update Rate == 0: %*"):format(p2.InView, v1)))
        end
        return
    elseif math.floor(p2.UpdateRate) ~= 0 then
        debug.profilebegin("Step Colliders")
        local ColliderObjects = self.ColliderObjects
        local v2 = nil
        local v3 = nil
        for i, j in ColliderObjects, v2, v3 do
            j:Step()
        end
        debug.profileend()
        local v4 = 1 / p2.UpdateRate
        v2 = false
        p2.AccumulatedDelta = p2.AccumulatedDelta + p4
        while v4 < p2.AccumulatedDelta do
            p2.AccumulatedDelta = p2.AccumulatedDelta - v4
            v2 = true
            p2:StepPhysics(v4)
            self:m_ConstrainBoneTree(p2, p4)
            p2:SolveTransform(v4)
        end
        debug.profileend()
        if v2 then
            task.synchronize()
            p2:ApplyTransform()
        end
        return
    end
end
function u86:m_CheckDestroy() -- Line: 310
    self.ShouldDestroy = false
    if #self.BoneTrees ~= 0 then
        return false
    end
    self.ShouldDestroy = true
    return true
end
function u86.LoadObject(p1, p2) -- Line: 326
    local v1
    local Attribute = p2:GetAttribute("Roots")
    if not Attribute then
        warn((("[SmartBone2::LoadObject] Cannot load an object with no roots defined %*"):format(p2.Name)))
        return
    end
    local v2 = Attribute:split(",")
    local v3 = {}
    for i, j in p2:GetDescendants() do
        if j:IsA("Bone") then
            if not (v3[j.Name]) then
                v3[j.Name] = j
            else
                warn((("[SmartBone2::LoadObject] Duplicate bones of name: %* in RootPart: %*"):format(j.Name, p2.Name)))
            end
        end
    end
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for k, n in v4, v5, v6 do
        v1 = v3[n]
        if v1 then
            p1:m_CreateBoneTree(p2, v1)
        else
            warn((("[SmartBone2::LoadObject] Couldn't find Root Bone of name: %* in RootPart: %*"):format(n, p2.Name)))
        end
    end
end
function u86.LoadColliderModule(p1, p2, p3) -- Line: 367 -- upvalues: HttpService (val), ColliderObject (val)
    assert(p2, "[SmartBone2::LoadColliderModule] No collider module passed in")
    local v1 = require(p2)
    local v2 = HttpService:JSONDecode(v1)
    local v3 = ColliderObject.new(v2, p3)
    table.insert(p1.ColliderObjects, v3)
end
function u86.LoadRawCollider(p1, p2, p3) -- Line: 382 -- upvalues: ColliderObject (val)
    local v1 = ColliderObject.new(p2, p3)
    table.insert(p1.ColliderObjects, v1)
end
function u86:SkipUpdate() -- Line: 390
    debug.profilebegin("SmartBone2::SkipUpdate")
    local BoneTrees = self.BoneTrees
    local v1 = nil
    local v2 = nil
    for i, j in BoneTrees, v1, v2 do
        j:SkipUpdate()
    end
    debug.profileend()
end
function u86.StepBoneTrees(p1, p2) -- Line: 401 -- upvalues: SB_VERBOSE_WARN (val)
    if p1:m_CheckDestroy() then
        return
    end
    if p2 <= 0 then
        SB_VERBOSE_WARN("DeltaTime is zero or sub zero, not updating.")
        return
    end
    p1:m_CleanColliders()
    p1:m_UpdateViewFrustum()
    local BoneTrees = p1.BoneTrees
    local v1 = nil
    local v2 = nil
    for i, j in BoneTrees, v1, v2 do
        p1:m_UpdateBoneTree(j, i, p2)
    end
end
function u86:DrawDebug(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) -- Line: 434
    local BoneTrees = self.BoneTrees
    local v1 = nil
    local v2 = nil
    for i, j in BoneTrees, v1, v2 do
        j:DrawDebug(p3, p4, p5, p6, p7, p12, p13, p14)
    end
    if p2 then
        local ColliderObjects = self.ColliderObjects
        v1 = nil
        v2 = nil
        for k, n in ColliderObjects, v1, v2 do
            n:DrawDebug(p8, p9, p10, p11)
        end
    end
end
function u86:DrawOverlay(p2) -- Line: 473 -- upvalues: Config (val)
    local v1
    if not Config.DEBUG_OVERLAY_ENABLED then
        return
    end
    local v2 = Color3.new(1, 0.431373, 0.713725)
    local v3 = Color3.new(1, 1, 1)
    local v4 = Color3.new(0.486275, 0.431373, 1)
    local v5 = Color3.new(1, 1, 1)
    local v6 = ("SmartBone Instance ID: %*"):format(self.ID)
    p2.Begin(v6, v2, v3)
    p2.Text((("Frame Counter: %*"):format(shared.FrameCounter)))
    if not Config.DEBUG_OVERLAY_TREE then
        v1 = p2
    else
        local v7
        local BoneTrees = self.BoneTrees
        v6 = nil
        local v8 = nil
        v1 = p2
        for i, j in BoneTrees, v6, v8 do
            if 0 < Config.DEBUG_OVERLAY_MAX_TREES and Config.DEBUG_OVERLAY_TREE_OFFSET + Config.DEBUG_OVERLAY_MAX_TREES <= i then
                break
            end
            if i >= Config.DEBUG_OVERLAY_TREE_OFFSET then
                v7 = ("Bone Tree %*"):format(i)
                v1.Begin(v7, v4, v5)
                j:DrawOverlay(v1)
                v1.End()
            end
        end
    end
    v1.End()
end
function u86:Destroy() -- Line: 509 -- upvalues: SB_VERBOSE_LOG (val)
    SB_VERBOSE_LOG("Deleting SmartBone Object")
    local BoneTrees = self.BoneTrees
    local v1 = nil
    local v2 = nil
    for i, j in BoneTrees, v1, v2 do
        j:Destroy()
    end
    local ColliderObjects = self.ColliderObjects
    v1 = nil
    v2 = nil
    for k, n in ColliderObjects, v1, v2 do
        n:Destroy()
    end
    setmetatable(self, nil)
end
function u86.Start() -- Line: 527 -- upvalues: RunService (val), u86 (val), Config (val), Players (val), u54 (ref), CollectionService (val), SB_VERBOSE_LOG (val), SB_INDENT_LOG (val), Utilities (val), Runtime (val), SB_UNINDENT_LOG (val), CeiveImOverlay (val)
    if not (RunService:IsClient()) then
        warn("Smartbone.Start() can only be called in client context.")
        return
    end
    if u86.Running then
        warn("Cannot call Smartbone.Start() multiple times")
        return
    end
    if Config.STARTUP_PRINT_ENABLED then
        print((("SmartBone2 v%* Starting"):format(Config.VERSION)))
    elseif not Config.LOG_VERBOSE then
    end
    u86.Running = true
    local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts")
    local Folder = Instance.new("Folder")
    Folder.Name = "SmartBone-Actors"
    Folder.Parent = PlayerScripts
    local BindableEvent = Instance.new("BindableEvent")
    BindableEvent.Name = "OverlayEvent"
    BindableEvent.Parent = script
    BindableEvent.Event:Connect(function(p1, ...) -- Line: 555 -- upvalues: Config (upval), u54 (upval)
        if not Config.DEBUG_OVERLAY_ENABLED then
            return
        end
        if p1 == "Text" then
            u54:Text(...)
            return
        end
        if p1 == "Begin" then
            u54:Begin(...)
            return
        end
        if p1 == "End" then
            u54:End()
        end
    end)
    local function GatherColliders() -- Line: 569 -- upvalues: CollectionService (upval), SB_VERBOSE_LOG (upval), Config (upval)
        local Attribute
        local v1 = {Key = {}, Raw = {}}
        for i, j in CollectionService:GetTagged("SmartCollider") do
            if j:IsA("BasePart") then
                Attribute = j:GetAttribute("ColliderKey")
                if Attribute then
                    Attribute = tostring(Attribute)
                    if not (v1.Key[Attribute]) then
                        v1.Key[Attribute] = {}
                    end
                    table.insert(v1.Key[Attribute], j)
                end
                SB_VERBOSE_LOG((("Adding collider: %*, Collider Key: %*"):format(j.Name, Attribute)))
                table.insert(v1.Raw, j)
                if Config.YIELD_ON_COLLIDER_GATHER then
                    task.wait()
                end
            end
        end
        return v1
    end
    local function SetupObject(p1) -- Line: 603 -- upvalues: SB_VERBOSE_LOG (upval), SB_INDENT_LOG (upval), GatherColliders (val), Utilities (upval), Runtime (upval), Folder (val), SB_UNINDENT_LOG (upval)
        local v1, v2, v3, v4
        if not (p1:IsA("BasePart")) then
            return
        end
        SB_VERBOSE_LOG((("Setup Object: %*"):format(p1.Name)))
        SB_INDENT_LOG()
        local v5 = GatherColliders()
        local Attribute = p1:GetAttribute("ColliderKey")
        if not Attribute then
            local Raw = v5.Raw
            if not Raw then
                Raw = {}
            end
            v3 = Raw
        else
            v4 = v5.Key[tostring(Attribute)]
            if not v4 then
                v4 = {}
            end
            v3 = v4
        end
        v4 = {}
        local v6 = v3
        local v7 = nil
        local v8 = nil
        for i, j in v6, v7, v8 do
            v1 = {}
            v2 = Utilities.GetCollider(j)
            v1[1] = v2
            v1[2] = j
            table.insert(v4, v1)
        end
        local Actor = Instance.new("Actor")
        v7 = Runtime:Clone()
        v7.Parent = Actor
        v7.Enabled = true
        Actor.Parent = Folder
        task.wait()
        Actor:SendMessage("Setup", p1, v4, script)
        SB_VERBOSE_LOG("Runtime Started")
        SB_UNINDENT_LOG()
    end
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("SmartBone")
    InstanceAddedSignal:Connect(SetupObject)
    for i, j in CollectionService:GetTagged("SmartBone") do
        SetupObject(j)
    end
    if Config.DEBUG_OVERLAY_ENABLED then
        u54 = CeiveImOverlay.new()
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "SmartBoneDebugOverlay"
        ScreenGui.IgnoreGuiInset = true
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Parent = Players.LocalPlayer.PlayerGui
        u54.BackFrame.Parent = ScreenGui
        RunService.RenderStepped:Connect(function() -- Line: 663 -- upvalues: u54 (upval)
            u54:Render()
        end)
    end
    return {
        Stop = function() -- Line: 669 -- upvalues: Config (upval), Folder (val)
            if not Config.RESET_BONE_ON_DESTROY then
                Folder:Destroy()
                return
            end
            for i, j in Folder:GetChildren() do
                j:SendMessage("Destroy")
            end
        end,
    }
end
return u86