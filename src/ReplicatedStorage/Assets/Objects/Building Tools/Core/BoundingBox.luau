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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.Core.BoundingBox
--                               Dumped in 0.00172 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent)
local Support = Parent.Support
local u16 = {}
local u17 = {}
local u18 = {}
local u19 = {}
local u20 = true
local u21 = {}
local u22 = {}
function u16.StartBoundingBox(p1) -- Line: 23 -- upvalues: Parent (val), u20 (ref), u16 (val), Support (val)
    if BoundingBoxEnabled then
        return
    end
    BoundingBoxEnabled = true
    local Part = Parent.Make("Part")
    BoundingBox = Part({
        Name = "BTBoundingBox",
        CanCollide = false,
        Transparency = 1,
        Anchored = true,
        Locked = true,
        Parent = Parent.UI,
    })
    Parent.Mouse.TargetFilter = BoundingBox
    u20 = true
    StartAggregatingStaticParts()
    BoundingBoxHandleCallback = p1
    u16.UpdateBoundingBox()
    BoundingBoxUpdater = Support.ScheduleRecurringTask(u16.UpdateBoundingBox, 0.05)
    if BoundingBoxHandleCallback then
        BoundingBoxHandleCallback(BoundingBox)
    end
end
function u16.GetBoundingBox() -- Line: 65
    return BoundingBox
end
function IsPhysicsStatic() -- Line: 73 -- upvalues: Parent (val)
    if _IsPhysicsStatic == nil then
        local v1 = if Parent.Mode == "Plugin" then Workspace.DistributedGameTime == 0 else false
        _IsPhysicsStatic = v1
    end
    return _IsPhysicsStatic
end
function u16.UpdateBoundingBox() -- Line: 86 -- upvalues: Parent (val), u20 (ref), u16 (val), u17 (ref)
    local v1, v2
    if not BoundingBoxEnabled then
        return
    end
    if not InactiveBoundingBox then
        if not BoundingBox then
            if #Parent.Selection.Parts == 0 then
                return
            end
            if u20 then
                u16.StaticExtents = u16.CalculateExtents(u17, nil, true)
                u20 = false
            end
            v1, v2 = u16.CalculateExtents(Parent.Selection.Parts, u16.StaticExtents)
            BoundingBox.Size = v1
            BoundingBox.CFrame = v2
            return
        end
        if #Parent.Selection.Parts == 0 then
            InactiveBoundingBox = BoundingBox
            BoundingBox = nil
            BoundingBoxHandleCallback(BoundingBox)
            return
        end
        if #Parent.Selection.Parts == 0 then
            return
        end
        if u20 then
            u16.StaticExtents = u16.CalculateExtents(u17, nil, true)
            u20 = false
        end
        v1, v2 = u16.CalculateExtents(Parent.Selection.Parts, u16.StaticExtents)
        BoundingBox.Size = v1
        BoundingBox.CFrame = v2
        return
    else
        v1 = #Parent.Selection.Parts
        if 0 < v1 then
            BoundingBox = InactiveBoundingBox
            InactiveBoundingBox = nil
            BoundingBoxHandleCallback(BoundingBox)
            if u20 then
                u16.StaticExtents = u16.CalculateExtents(u17, nil, true)
                u20 = false
            end
            v1, v2 = u16.CalculateExtents(Parent.Selection.Parts, u16.StaticExtents)
            BoundingBox.Size = v1
            BoundingBox.CFrame = v2
            return
        end
    end
end
function u16.ClearBoundingBox() -- Line: 125
    if not BoundingBoxEnabled then
        return
    end
    if BoundingBoxUpdater then
        BoundingBoxUpdater:Stop()
        BoundingBoxUpdater = nil
    end
    StopAggregatingStaticParts()
    if BoundingBox then
        BoundingBox:Destroy()
        BoundingBox = nil
    elseif InactiveBoundingBox then
        InactiveBoundingBox:Destroy()
        InactiveBoundingBox = nil
    end
    BoundingBoxEnabled = false
    BoundingBoxHandleCallback(nil)
    BoundingBoxHandleCallback = nil
end
function AddStaticParts(p1) -- Line: 160 -- upvalues: u18 (ref), u17 (ref), Support (val), u20 (ref)
    for k, v in pairs(p1) do
        if not (u18[v]) then
            if IsPhysicsStatic() then
                u18[v] = true
                AddStaticPartMonitor(v)
            elseif not v.Anchored then
            end
        end
    end
    u17 = Support.Keys(u18)
    u20 = true
end
function AddStaticPartMonitor(p1) -- Line: 187 -- upvalues: u18 (ref), u19 (val), u20 (ref)
    if not (u18[p1]) or u19[p1] then
        return
    end
    u19[p1] = p1.Changed:Connect(function(a1) -- Line: 196 -- upvalues: u20 (upval), p1 (val)
        if a1 == "CFrame" or a1 == "Size" then
            u20 = true
            return
        end
        if a1 == "Anchored" and not (IsPhysicsStatic()) and not p1.Anchored then
            RemoveStaticParts({p1})
        end
    end)
end
function RemoveStaticParts(p1) -- Line: 211 -- upvalues: u18 (ref), u19 (val), u17 (ref), Support (val), u20 (ref)
    for k, v in pairs(p1) do
        u18[v] = nil
        if u19[v] then
            u19[v]:Disconnect()
            u19[v] = nil
        end
    end
    u17 = Support.Keys(u18)
    u20 = true
end
function StartAggregatingStaticParts() -- Line: 236 -- upvalues: Parent (val), u21 (val), u22 (val)
    AddStaticParts(Parent.Selection.Parts)
    for i, v in ipairs(Parent.Selection.Parts) do
        AddPotentialPartMonitor(v)
    end
    table.insert(u21, Parent.Selection.PartsAdded:Connect(function(p1) -- Line: 248
        AddStaticParts(p1)
        for k, v in pairs(p1) do
            AddPotentialPartMonitor(v)
        end
    end))
    table.insert(u21, Parent.Selection.PartsRemoved:Connect(function(p1) -- Line: 261 -- upvalues: u22 (upval)
        RemoveStaticParts(p1)
        for k, v in pairs(p1) do
            if u22[v] then
                u22[v]:Disconnect()
                u22[v] = nil
            end
        end
    end))
end
function u16.RecalculateStaticExtents() -- Line: 273 -- upvalues: u20 (ref)
    u20 = true
end
function AddPotentialPartMonitor(p1) -- Line: 281 -- upvalues: u22 (val)
    if u22[p1] then
        return
    end
    u22[p1] = p1.Changed:Connect(function(a1) -- Line: 290 -- upvalues: p1 (val)
        if a1 == "Anchored" and p1.Anchored then
            AddStaticParts({p1})
        end
    end)
end
function u16.PauseMonitoring() -- Line: 298 -- upvalues: u22 (val), u19 (val)
    for k, v in pairs(u22) do
        v:Disconnect()
        u22[k] = nil
    end
    for k2, i in pairs(u19) do
        i:Disconnect()
        u19[k2] = nil
    end
    if BoundingBoxUpdater then
        BoundingBoxUpdater:Stop()
        BoundingBoxUpdater = nil
    end
end
function u16.ResumeMonitoring() -- Line: 321 -- upvalues: u18 (ref), Parent (val), Support (val), u16 (val)
    if not BoundingBoxEnabled then
        return
    end
    for k in pairs(u18) do
        AddStaticPartMonitor(k)
    end
    for i, v in ipairs(Parent.Selection.Parts) do
        AddPotentialPartMonitor(v)
    end
    if not BoundingBoxUpdater then
        BoundingBoxUpdater = Support.ScheduleRecurringTask(u16.UpdateBoundingBox, 0.05)
    end
end
function StopAggregatingStaticParts() -- Line: 346 -- upvalues: u21 (val), u19 (val), u22 (val), u17 (ref), u18 (ref), u16 (val)
    for k, v in pairs(u21) do
        v:Disconnect()
        u21[k] = nil
    end
    for k2, i in pairs(u19) do
        i:Disconnect()
        u19[k2] = nil
    end
    for k3, j in pairs(u22) do
        j:Disconnect()
        u22[k3] = nil
    end
    u17 = {}
    u18 = {}
    u16.StaticExtents = nil
end
local new = CFrame.new
local insert = table.insert
local min = math.min
local max = math.max
local u44 = unpack
function u16.CalculateExtents(p1, p2, p3) -- Line: 382 -- upvalues: new (val), insert (val), u44 (val), min (val), max (val)
    local CFrame, Max, Min, X_3, Y, Z, v1, v2, v3, v4, v5, v6, v7
    if #p1 == 0 then
        return
    end
    if not p2 then
        Min = p1[1].Position
    else
        Min = p2.Min
    end
    if not p2 then
        Max = p1[1].Position
    else
        Max = p2.Max
    end
    local X = Min.X
    local Y_2 = Min.Y
    local Z_2 = Min.Z
    local X_2 = Max.X
    local Y_3 = Max.Y
    local Z_3 = Max.Z
    v3, v1 = p3, p2
    for k, v in pairs(p1) do
        if IsPhysicsStatic() then
            if not v1 then
                CFrame = v.CFrame
                v2 = v.Size / 2
                X_3 = v2.X
                Y = v2.Y
                Z = v2.Z
                v5 = {}
                v6 = {}
                v7 = {}
                v4 = CFrame * new(X_3, Y, Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(-X_3, Y, Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(X_3, -Y, Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(X_3, Y, -Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(-X_3, Y, -Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(-X_3, -Y, Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(X_3, -Y, -Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                v4 = CFrame * new(-X_3, -Y, -Z)
                insert(v5, v4.x)
                insert(v6, v4.y)
                insert(v7, v4.z)
                X = min(X, u44(v5))
                Y_2 = min(Y_2, u44(v6))
                Z_2 = min(Z_2, u44(v7))
                X_2 = max(X_2, u44(v5))
                Y_3 = max(Y_3, u44(v6))
                Z_3 = max(Z_3, u44(v7))
            end
        elseif not v.Anchored then
        end
    end
    local v8 = {Min = Vector3.new(X, Y_2, Z_2), Max = Vector3.new(X_2, Y_3, Z_3)}
    if v3 then
        return v8
    end
    local v9 = Vector3.new(X_2 - X, Y_3 - Y_2, Z_3 - Z_2)
    local v10 = X + (X_2 - X) / 2
    local v11 = Y_2 + (Y_3 - Y_2) / 2
    return v9, (CFrame.new(v10, v11, Z_2 + (Z_3 - Z_2) / 2))
end
return u16