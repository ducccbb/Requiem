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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Move.FreeDragging
--                               Dumped in 0.00346 seconds
--                          Bytecode version 9  |  17 functions

local new
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")
local Core = require(Parent.Core)
local Selection = Core.Selection
local Security = Core.Security
local Snapping = require(Parent.Core.Snapping)
local BoundingBox = require(Parent.Core.BoundingBox)
local Libraries = Parent:WaitForChild("Libraries")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Util = require(v1.Parent:WaitForChild("Util"))
local u60 = {}
u60.__index = u60
function u60.new(p1) -- Line: 29 -- upvalues: u60 (val)
    local v1 = {IsDragging = false, Tool = p1}
    setmetatable(v1, u60)
    v1:InstallDragEndListener()
    return v1
end
function u60.EnableDragging(p1) -- Line: 61 -- upvalues: Core (val), Selection (val), UserInputService (val), BoundingBox (val), Snapping (val), ContextActionService (val)
    ContextActionService:BindAction("BT: Start dragging", function(a1, p2, p3) -- Line: 64 -- upvalues: Core (upval), Selection (upval), UserInputService (upval), p1 (val), BoundingBox (upval), Snapping (upval), ContextActionService (upval)
        if p2.Name ~= "Begin" then
            return Enum.ContextActionResult.Pass
        end
        local Target = Core.Mouse.Target
        if not Target or Selection.Multiselecting then
            return Enum.ContextActionResult.Pass
        end
        local v1 = UserInputService:IsKeyDown(Enum.KeyCode.R)
        if v1 then
            local v2 = #Selection.Items
            v1 = 0 < v2
        end
        local v3 = {Target}
        if Core.IsSelectable(v3) then
            p1.StartTarget = Target
            p1.StartScreenPoint = Vector2.new(Core.Mouse.X, Core.Mouse.Y)
            _, v3 = Core.Targeting:UpdateTarget()
            if not (Selection.IsSelected(v3)) and not v1 then
                Core.Targeting.SelectTarget(true)
                Core.Targeting.CancelSelecting()
            end
            ContextActionService:BindAction("BT: Watch for dragging", function(a1, p2, p3) -- Line: 92 -- upvalues: p1 (upval), Core (upval), BoundingBox (upval), Snapping (upval), ContextActionService (upval)
                if p2.Name ~= "Change" then
                    return Enum.ContextActionResult.Pass
                end
                local StartScreenPoint = p1.StartScreenPoint
                if StartScreenPoint then
                    local v1 = Vector2.new(Core.Mouse.X, Core.Mouse.Y)
                    StartScreenPoint = (v1 - p1.StartScreenPoint).Magnitude
                end
                if 2 <= StartScreenPoint then
                    local SnappedPoint
                    BoundingBox.ClearBoundingBox()
                    local StartTarget = p1.StartTarget
                    if not Snapping.Enabled then
                        SnappedPoint = nil
                    else
                        SnappedPoint = p1.Tool.SnappedPoint
                        if not SnappedPoint then
                            SnappedPoint = nil
                        end
                    end
                    p1:SetUpDragging(StartTarget, SnappedPoint)
                    ContextActionService:UnbindAction("BT: Watch for dragging")
                end
                if p3.UserInputType.Name ~= "Touch" then
                    return Enum.ContextActionResult.Pass
                end
            end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
            return
        end
        if not v1 then
            return Enum.ContextActionResult.Pass
        end
        p1.StartTarget = Target
        p1.StartScreenPoint = Vector2.new(Core.Mouse.X, Core.Mouse.Y)
        _, v3 = Core.Targeting:UpdateTarget()
        if not (Selection.IsSelected(v3)) and not v1 then
            Core.Targeting.SelectTarget(true)
            Core.Targeting.CancelSelecting()
        end
        ContextActionService:BindAction("BT: Watch for dragging", function(a1, p2, p3) -- Line: 92 -- upvalues: p1 (upval), Core (upval), BoundingBox (upval), Snapping (upval), ContextActionService (upval)
            if p2.Name ~= "Change" then
                return Enum.ContextActionResult.Pass
            end
            local StartScreenPoint = p1.StartScreenPoint
            if StartScreenPoint then
                local v1 = Vector2.new(Core.Mouse.X, Core.Mouse.Y)
                StartScreenPoint = (v1 - p1.StartScreenPoint).Magnitude
            end
            if 2 <= StartScreenPoint then
                local SnappedPoint
                BoundingBox.ClearBoundingBox()
                local StartTarget = p1.StartTarget
                if not Snapping.Enabled then
                    SnappedPoint = nil
                else
                    SnappedPoint = p1.Tool.SnappedPoint
                    if not SnappedPoint then
                        SnappedPoint = nil
                    end
                end
                p1:SetUpDragging(StartTarget, SnappedPoint)
                ContextActionService:UnbindAction("BT: Watch for dragging")
            end
            if p3.UserInputType.Name ~= "Touch" then
                return Enum.ContextActionResult.Pass
            end
        end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
    end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch)
end
function u60:SetUpDragging(p2, p3) -- Line: 132 -- upvalues: Core (val)
    local v1, v2
    Core.Targeting.CancelSelecting()
    v1, v2 = self.Tool:PrepareSelectionForDragging()
    self.InitialPartStates = v1
    self.InitialModelStates = v2
    self:StartDragging(p2, self.InitialPartStates, self.InitialModelStates, p3)
end
function u60:StartDragging(p2, p3, p4, p5) -- Line: 144 -- upvalues: BoundingBox (val), Core (val), Security (val), Selection (val), Util (val), Snapping (val), ContextActionService (val)
    local u102, u34, v1, v2, v3, v4, v5, v6
    if self.IsDragging then
        return
    end
    self.IsDragging = true
    self.Tool:TrackChange()
    BoundingBox.ClearBoundingBox()
    local u27 = nil
    if Core.Mode == "Tool" then
        local GetPermissions = Security.GetPermissions
        local v7 = Security.GetSelectionAreas(Selection.Parts)
        u27 = GetPermissions(v7, Core.Player)
    end
    if p3[p2] then
        u34 = p2
        v4 = -u34.CFrame:pointToObjectSpace(Core.Mouse.Hit.p)
        v6 = Util.GetIncrementMultiple(v4.X, self.Tool.Increment)
        v5 = math.clamp(v6, -u34.Size.X / 2, u34.Size.X / 2)
        v1 = Util.GetIncrementMultiple(v4.Y, self.Tool.Increment)
        v6 = math.clamp(v1, -u34.Size.Y / 2, u34.Size.Y / 2)
        v2 = Util.GetIncrementMultiple(v4.Z, self.Tool.Increment)
        v3 = -u34.Size.Z / 2
        u102 = if p5 then -u34.CFrame:pointToObjectSpace(p5) else Vector3.new(v5, v6, (math.clamp(v2, v3, u34.Size.Z / 2)))
        Snapping.TargetBlacklist = Selection.Items
        self.Tool.Maid.DragSnapping = self.Tool.PointSnapped:Connect(function(p1) -- Line: 192 -- upvalues: self (val), p3 (val), u34 (ref), u102 (ref), Util (upval), p4 (val), Core (upval), Security (upval), Selection (upval), u27 (ref)
            local SurfaceAlignment = self.SurfaceAlignment
            if not SurfaceAlignment then
                SurfaceAlignment = p3[u34].CFrame - p3[u34].CFrame.p
            end
            local v1 = CFrame.new(p1) * SurfaceAlignment
            u34.CFrame = v1 * CFrame.new(u102)
            Util.TranslatePartsRelativeToPart(u34, p3, p4)
            if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, u27) then
                u34.CFrame = p3[u34].CFrame
                Util.TranslatePartsRelativeToPart(u34, p3, p4)
            end
        end)
        self.CornerOffsets = GetCornerOffsets(p3[u34].CFrame, p3)
        function self.TriggerAlignment() -- Line: 211 -- upvalues: self (val), u34 (ref), u102 (ref), p3 (val), p4 (val), u27 (ref), Snapping (upval)
            self:DragToMouse(u34, u102, p3, p4, u27)
            if Snapping.Enabled then
                self.Tool.PointSnapped:Fire(self.Tool.SnappedPoint)
            end
        end
        ContextActionService:BindAction("BT: Dragging", function(p1, p2, a3) -- Line: 223 -- upvalues: self (val), u34 (ref), u102 (ref), p3 (val), p4 (val), u27 (ref)
            if p2.Name == "Change" then
                self:DragToMouse(u34, u102, p3, p4, u27)
            end
            return Enum.ContextActionResult.Pass
        end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
        return
    end
    u34 = next(p3)
    if not u34 then
        return
    end
    v4 = -u34.CFrame:pointToObjectSpace(Core.Mouse.Hit.p)
    v6 = Util.GetIncrementMultiple(v4.X, self.Tool.Increment)
    v5 = math.clamp(v6, -u34.Size.X / 2, u34.Size.X / 2)
    v1 = Util.GetIncrementMultiple(v4.Y, self.Tool.Increment)
    v6 = math.clamp(v1, -u34.Size.Y / 2, u34.Size.Y / 2)
    v2 = Util.GetIncrementMultiple(v4.Z, self.Tool.Increment)
    v3 = -u34.Size.Z / 2
    u102 = if p5 then -u34.CFrame:pointToObjectSpace(p5) else Vector3.new(v5, v6, (math.clamp(v2, v3, u34.Size.Z / 2)))
    Snapping.TargetBlacklist = Selection.Items
    self.Tool.Maid.DragSnapping = self.Tool.PointSnapped:Connect(function(p1) -- Line: 192 -- upvalues: self (val), p3 (val), u34 (ref), u102 (ref), Util (upval), p4 (val), Core (upval), Security (upval), Selection (upval), u27 (ref)
        local SurfaceAlignment = self.SurfaceAlignment
        if not SurfaceAlignment then
            SurfaceAlignment = p3[u34].CFrame - p3[u34].CFrame.p
        end
        local v1 = CFrame.new(p1) * SurfaceAlignment
        u34.CFrame = v1 * CFrame.new(u102)
        Util.TranslatePartsRelativeToPart(u34, p3, p4)
        if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, u27) then
            u34.CFrame = p3[u34].CFrame
            Util.TranslatePartsRelativeToPart(u34, p3, p4)
        end
    end)
    self.CornerOffsets = GetCornerOffsets(p3[u34].CFrame, p3)
    function self.TriggerAlignment() -- Line: 211 -- upvalues: self (val), u34 (ref), u102 (ref), p3 (val), p4 (val), u27 (ref), Snapping (upval)
        self:DragToMouse(u34, u102, p3, p4, u27)
        if Snapping.Enabled then
            self.Tool.PointSnapped:Fire(self.Tool.SnappedPoint)
        end
    end
    ContextActionService:BindAction("BT: Dragging", function(p1, p2, a3) -- Line: 223 -- upvalues: self (val), u34 (ref), u102 (ref), p3 (val), p4 (val), u27 (ref)
        if p2.Name == "Change" then
            self:DragToMouse(u34, u102, p3, p4, u27)
        end
        return Enum.ContextActionResult.Pass
    end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
end
function u60:DragToMouse(p2, p3, p4, p5, p6) -- Line: 238 -- upvalues: SupportLibrary (val), Selection (val), Core (val), Workspace (val), Snapping (val), Util (val), Security (val)
    local SurfaceAlignment, TargetNormal, v1, v2
    local v3 = SupportLibrary.CloneTable(Selection.Items)
    local Player = Core.Player
    if Player then
        Player = Core.Player.Character
    end
    table.insert(v3, Player)
    local v4 = Ray.new(Core.Mouse.UnitRay.Origin, Core.Mouse.UnitRay.Direction * 5000)
    v1, v2, v4 = Workspace:FindPartOnRayWithIgnoreList(v4, v3)
    self.Target = v1
    self.TargetPoint = v2
    self.TargetNormal = v4
    if self.LastTargetNormal ~= self.TargetNormal then
        self.SurfaceAlignment = nil
        self.CrossthroughCorrection = nil
    end
    if self.LastSelection ~= Selection.Items then
        self.CrossthroughCorrection = nil
    elseif self.LastBasePartOffset == p3 and self.LastSurfaceAlignment == self.SurfaceAlignment then
    end
    self.LastSelection = Selection.Items
    self.LastBasePartOffset = p3
    self.LastSurfaceAlignment = self.SurfaceAlignment
    self.LastTargetNormal = self.TargetNormal
    if Snapping.Enabled then
        return
    end
    self.TargetPoint = self:GetAlignedTargetPoint(self.Target, self.TargetPoint, self.TargetNormal, self.Tool.Increment)
    SurfaceAlignment = self.SurfaceAlignment
    if not SurfaceAlignment then
        SurfaceAlignment = p4[p2].CFrame - p4[p2].CFrame.p
    end
    local v5 = CFrame.new(self.TargetPoint) * SurfaceAlignment
    local v6 = v5 * CFrame.new(p3)
    if not self.CrossthroughCorrection then
        local v7
        self.CrossthroughCorrection = 0
        for k, v in pairs(self.CornerOffsets) do
            v7 = -(self.TargetPoint - v6 * v):Dot(self.TargetNormal)
            if v7 < self.CrossthroughCorrection then
                self.CrossthroughCorrection = v7
            end
        end
    end
    p2.CFrame = v6 - self.TargetNormal * self.CrossthroughCorrection
    Util.TranslatePartsRelativeToPart(p2, p4, p5)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, p6) then
        p2.CFrame = p4[p2].CFrame
        Util.TranslatePartsRelativeToPart(p2, p4, p5)
    end
end
function u60.AlignSelectionToTarget(p1) -- Line: 336
    local Target, TargetNormal
    if not p1.IsDragging or not p1.TargetNormal then
        return
    end
    local v1 = CFrame.new(Vector3.new(), p1.TargetNormal)
    if p1.Target then
        local unit, unit_2
        TargetNormal = p1.TargetNormal
        Target = p1.Target
        local TargetNormal_2 = p1.TargetNormal
        if TargetNormal_2:isClose(Target.CFrame.lookVector, 1e-06) then
            unit_2 = TargetNormal_2:Cross(Target.CFrame.rightVector).unit
            unit = unit_2:Cross(TargetNormal_2).unit
        else
            local v2 = -Target.CFrame.lookVector
            if not (TargetNormal_2:isClose(v2, 1e-06)) then
                unit = Target.CFrame.lookVector:Cross(TargetNormal_2).unit
                unit_2 = TargetNormal_2:Cross(unit).unit
            else
                unit_2 = TargetNormal_2:Cross(Target.CFrame.rightVector).unit
                unit = unit_2:Cross(TargetNormal_2).unit
            end
        end
        p1.SurfaceAlignment = CFrame.new(0, 0, 0, unit.X, TargetNormal.X, -unit_2.X, unit.Y, TargetNormal.Y, -unit_2.Y, unit.Z, TargetNormal.Z, -unit_2.Z)
    else
        p1.SurfaceAlignment = v1 * CFrame.Angles(-math.pi / 2, 0, 0)
    end
    p1:TriggerAlignment()
end
function u60.GetAlignedTargetPoint(p1, p2, p3, p4, p5) -- Line: 384 -- upvalues: Util (val)
    local v1, v2, v3, v4
    local v5 = CFrame.new()
    local v6 = Vector3.new(1, 1, 1)
    if not p2 or not (p2:IsA("BasePart")) or p2.ClassName == "Terrain" then
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    v3 = p2.Size / 2
    local v7 = p2.CFrame - p2.CFrame.p
    v1 = Vector3.FromAxis(Enum.Axis.X)
    v4 = v7 * CFrame.fromAxisAngle(v1, (math.atan(p2.Size.Z / p2.Size.Y)))
    local v8 = p2.CFrame - p2.CFrame.p
    v2 = Vector3.FromAxis(Enum.Axis.X)
    v7 = v8 * CFrame.fromAxisAngle(v2, math.pi - math.atan(p2.Size.Z / p2.Size.Y))
    local v9 = p2.CFrame - p2.CFrame.p
    local v10 = Vector3.FromAxis(Enum.Axis.Z)
    v2 = v9 * CFrame.fromAxisAngle(v10, (math.atan(p2.Size.Y / p2.Size.X)))
    local v11 = Vector3.FromAxis(Enum.Axis.X)
    v1 = v2 * CFrame.fromAxisAngle(v11, math.pi / 2)
    v9 = Vector3.FromAxis(Enum.Axis.Z)
    v8 = v1 * CFrame.fromAxisAngle(v9, -math.pi / 2)
    if p4:isClose(p2.CFrame.lookVector, 1e-06) then
        v5 = p2.CFrame * CFrame.new(v3.X, v3.Y, -v3.Z)
        v6 = Vector3.new(1, 1, 0)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    v9 = -p2.CFrame.lookVector
    if p4:isClose(v9, 1e-06) then
        v5 = p2.CFrame * CFrame.new(-v3.X, v3.Y, v3.Z)
        v6 = Vector3.new(1, 1, 0)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    v9 = -p2.CFrame.rightVector
    if p4:isClose(v9, 1e-06) then
        v5 = p2.CFrame * CFrame.new(-v3.X, v3.Y, -v3.Z)
        v6 = Vector3.new(0, 1, 1)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    if p4:isClose(p2.CFrame.rightVector, 1e-06) then
        v5 = p2.CFrame * CFrame.new(v3.X, v3.Y, v3.Z)
        v6 = Vector3.new(0, 1, 1)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    if p4:isClose(p2.CFrame.upVector, 1e-06) then
        v5 = p2.CFrame * CFrame.new(v3.X, v3.Y, v3.Z)
        v6 = Vector3.new(1, 0, 1)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    v9 = -p2.CFrame.upVector
    if p4:isClose(v9, 1e-06) then
        v5 = p2.CFrame * CFrame.new(v3.X, -v3.Y, -v3.Z)
        v6 = Vector3.new(1, 0, 1)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    if p4:isClose(v4.lookVector, 1e-06) then
        v9 = Vector3.FromAxis(Enum.Axis.X)
        v1 = v4 * CFrame.fromAxisAngle(v9, -math.pi / 2)
        v5 = v1 + p2.CFrame * Vector3.new(v3.X, v3.Y, v3.Z)
        v6 = Vector3.new(1, 0, 1)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    if p4:isClose(v7.lookVector, 1e-06) then
        v9 = Vector3.FromAxis(Enum.Axis.X)
        v1 = v7 * CFrame.fromAxisAngle(v9, -math.pi / 2)
        v5 = v1 + p2.CFrame * Vector3.new(-v3.X, v3.Y, -v3.Z)
        v6 = Vector3.new(1, 0, 1)
        v4 = v5:inverse()
        v3 = v4 * CFrame.new(p3)
        v1 = Util.GetIncrementMultiple(v3.X, p5)
        v2 = Util.GetIncrementMultiple(v3.Y, p5)
        return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
    end
    if not (p4:isClose(v8.lookVector, 1e-06)) then
        return p3
    end
    v9 = Vector3.FromAxis(Enum.Axis.X)
    v1 = v8 * CFrame.fromAxisAngle(v9, -math.pi / 2)
    v5 = v1 + p2.CFrame * Vector3.new(v3.X, v3.Y, -v3.Z)
    v6 = Vector3.new(1, 0, 1)
    v4 = v5:inverse()
    v3 = v4 * CFrame.new(p3)
    v1 = Util.GetIncrementMultiple(v3.X, p5)
    v2 = Util.GetIncrementMultiple(v3.Y, p5)
    return v5 * (Vector3.new(v1, v2, Util.GetIncrementMultiple(v3.Z, p5)) * v6)
end
function u60:FinishDragging() -- Line: 502 -- upvalues: ContextActionService (val), Snapping (val), Core (val)
    if not self.IsDragging then
        return
    end
    self.IsDragging = false
    self.SurfaceAlignment = nil
    ContextActionService:UnbindAction("BT: Dragging")
    Snapping.StopTracking()
    self.Tool.Maid.DragSnapping = nil
    for k, v in pairs(self.InitialPartStates) do
        k:MakeJoints()
        Core.RestoreJoints(v.Joints)
        k.CanCollide = v.CanCollide
        k.Anchored = v.Anchored
    end
    self.Tool:RegisterChange()
end
local insert = table.insert
new = Vector3.new
function GetCornerOffsets(self, p2) -- Line: 540 -- upvalues: new (val), insert (val)
    local CFrame, v1, v2, v3
    local v4 = {}
    local v5 = self:inverse()
    for k, v in pairs(p2) do
        CFrame = v.CFrame
        v1 = k.Size.X / 2
        v2 = k.Size.Y / 2
        v3 = k.Size.Z / 2
        insert(v4, v5 * (CFrame * new(v1, v2, v3)))
        insert(v4, v5 * (CFrame * new(-v1, v2, v3)))
        insert(v4, v5 * (CFrame * new(v1, -v2, v3)))
        insert(v4, v5 * (CFrame * new(v1, v2, -v3)))
        insert(v4, v5 * (CFrame * new(-v1, v2, -v3)))
        insert(v4, v5 * (CFrame * new(-v1, -v2, v3)))
        insert(v4, v5 * (CFrame * new(v1, -v2, -v3)))
        insert(v4, v5 * (CFrame * new(-v1, -v2, -v3)))
    end
    return v4
end
function u60.InstallDragEndListener(p1) -- Line: 569 -- upvalues: SupportLibrary (val), ContextActionService (val)
    SupportLibrary.AddUserInputListener("Ended", {"Touch", "MouseButton1"}, true, function(a1) -- Line: 570 -- upvalues: p1 (val), ContextActionService (upval)
        p1.StartScreenPoint = nil
        p1.StartTarget = nil
        ContextActionService:UnbindAction("BT: Watch for dragging")
        if p1.IsDragging then
            p1.Tool:SetAxes(p1.Tool.Axes)
            p1:FinishDragging()
        end
    end)
end
return u60