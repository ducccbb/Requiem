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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Core.Snapping
--                               Dumped in 0.00110 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
Core = require(script.Parent)
Support = Core.Support
v1 = {}
SnapTracking = v1
SnapTracking.Enabled = false
SnapTracking.TrackCorners = true
SnapTracking.TrackFaceCentroids = true
SnapTracking.TrackEdgeMidpoints = true
function SnapTracking.StartTracking(p1) -- Line: 18
    if SnapTracking.Enabled then
        SnapTracking.StopTracking()
    end
    SnapTracking.Enabled = true
    Core.Targeting.CancelSelecting()
    SnapTracking.StartUI()
    SnapTracking.SetCallback(p1)
    function UpdateTrackingTarget(p1) -- Line: 39
        local v1, v2
        local v3 = {}
        local Character = Player
        if Character then
            Character = Player.Character
        end
        v3[1] = Character
        local TargetBlacklist = SnapTracking.TargetBlacklist
        if not TargetBlacklist then
            TargetBlacklist = {}
        end
        local v4 = Support.ConcatTable(v3, TargetBlacklist)
        v3 = Workspace.CurrentCamera:ScreenPointToRay(p1.Position.X, p1.Position.Y)
        local v5 = Ray.new(v3.Origin, v3.Direction * 5000)
        v1, v2 = Workspace:FindPartOnRayWithIgnoreList(v5, v4)
        if not v1 then
            return
        end
        if not SnapTracking.TargetFilter then
            SnapTracking.MousePoint = v2
            SnapTracking.SetTrackingTarget(v1)
            return
        end
        if not (SnapTracking.TargetFilter(v1)) then
            return
        end
        SnapTracking.MousePoint = v2
        SnapTracking.SetTrackingTarget(v1)
    end
    if not SnapTracking.CustomMouseTracking then
        SnapTracking.MouseTracking = Support.AddUserInputListener("Changed", "MouseMovement", false, UpdateTrackingTarget)
        UpdateTrackingTarget({Position = Vector2.new(Core.Mouse.X, Core.Mouse.Y)})
        SnapTracking.Update()
    end
end
function SnapTracking.SetCallback(p1) -- Line: 79
    SnapTracking.Callback = p1
end
function SnapTracking.StartUI() -- Line: 84
    SnapTracking.PointMarker = Core.Tool.Interfaces.PointMarker:Clone()
    SnapTracking.PointMarker.Parent = Core.UI
end
function SnapTracking.ClearUI() -- Line: 90
    if not SnapTracking.Enabled then
        return
    end
    SnapTracking.PointMarker:Destroy()
    SnapTracking.PointMarker = nil
end
function SnapTracking.Update() -- Line: 104
    if not SnapTracking.Enabled then
        return
    end
    local v1 = SnapTracking.GetClosestPoint()
    SnapTracking.Callback(v1)
    SnapTracking.UpdateUI(v1)
end
function SnapTracking.UpdateUI(p1) -- Line: 123
    local v1, v2
    if not SnapTracking.Enabled or not SnapTracking.PointMarker then
        return
    end
    if not p1 then
        SnapTracking.PointMarker.Visible = false
        return
    end
    v1, v2 = Workspace.CurrentCamera:WorldToScreenPoint(p1.p)
    SnapTracking.PointMarker.Visible = v2
    SnapTracking.PointMarker.Position = UDim2.new(0, v1.X, 0, v1.Y)
end
function SnapTracking.SetTrackingTarget(p1) -- Line: 146
    SnapTracking.Target = p1
    SnapTracking.Update()
end
function SnapTracking.GetClosestPoint() -- Line: 152
    if not SnapTracking.Target or not SnapTracking.MousePoint then
        return nil
    end
    local v1 = {}
    local v2 = {}
    local CFrame = SnapTracking.Target.CFrame
    local v3 = SnapTracking.Target.Size / 2
    local X = v3.X
    local Y = v3.Y
    local Z = v3.Z
    if SnapTracking.TrackCorners then
        table.insert(v1, CFrame * CFrame.new(X, Y, Z))
        table.insert(v1, CFrame * CFrame.new(-X, Y, Z))
        table.insert(v1, CFrame * CFrame.new(X, -Y, Z))
        table.insert(v1, CFrame * CFrame.new(X, Y, -Z))
        table.insert(v1, CFrame * CFrame.new(-X, Y, -Z))
        table.insert(v1, CFrame * CFrame.new(-X, -Y, Z))
        table.insert(v1, CFrame * CFrame.new(X, -Y, -Z))
        table.insert(v1, CFrame * CFrame.new(-X, -Y, -Z))
    end
    if SnapTracking.TrackEdgeMidpoints then
        table.insert(v1, CFrame * CFrame.new(X, Y, 0))
        table.insert(v1, CFrame * CFrame.new(X, 0, Z))
        table.insert(v1, CFrame * CFrame.new(0, Y, Z))
        table.insert(v1, CFrame * CFrame.new(-X, Y, 0))
        table.insert(v1, CFrame * CFrame.new(-X, 0, Z))
        table.insert(v1, CFrame * CFrame.new(0, -Y, Z))
        table.insert(v1, CFrame * CFrame.new(X, -Y, 0))
        table.insert(v1, CFrame * CFrame.new(X, 0, -Z))
        table.insert(v1, CFrame * CFrame.new(0, Y, -Z))
        table.insert(v1, CFrame * CFrame.new(-X, -Y, 0))
        table.insert(v1, CFrame * CFrame.new(-X, 0, -Z))
        table.insert(v1, CFrame * CFrame.new(0, -Y, -Z))
    end
    if SnapTracking.TrackFaceCentroids then
        table.insert(v1, CFrame * CFrame.new(X, 0, 0))
        table.insert(v1, CFrame * CFrame.new(0, 0, Z))
        table.insert(v1, CFrame * CFrame.new(0, Y, 0))
        table.insert(v1, CFrame * CFrame.new(-X, 0, 0))
        table.insert(v1, CFrame * CFrame.new(0, -Y, 0))
        table.insert(v1, CFrame * CFrame.new(0, 0, -Z))
    end
    for i, v in ipairs(v1) do
        v2[i] = (SnapTracking.MousePoint - v.p).magnitude
    end
    local v4 = 1
    for k, i2 in pairs(v2) do
        if i2 < v2[v4] then
            v4 = k
        end
    end
    return v1[v4]
end
function SnapTracking.StopTracking() -- Line: 219
    SnapTracking.Target = nil
    SnapTracking.Callback = nil
    SnapTracking.TrackFaceCentroids = true
    SnapTracking.TrackEdgeMidpoints = true
    SnapTracking.TrackCorners = true
    SnapTracking.TargetFilter = nil
    SnapTracking.TargetBlacklist = {}
    if not SnapTracking.Enabled then
        return
    end
    SnapTracking.MouseTracking:Disconnect()
    SnapTracking.MouseTracking = nil
    SnapTracking.ClearUI()
    SnapTracking.Enabled = false
end
return SnapTracking