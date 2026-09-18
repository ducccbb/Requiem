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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.SyncAPI.SyncModule
--                               Dumped in 0.00670 seconds
--                          Bytecode version 9  |  46 functions

local v1
local v2 = script
script = nil
local v3 = getfenv(0)
v3.script = nil
_G.script = nil
v3 = getfenv(0)
v3.getfenv = nil
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
SyncAPI = v2.Parent
Tool = SyncAPI.Parent
Player = nil
Security = require(Tool.Core.Security)
RegionModule = require(Tool.Libraries.Region)
Support = require(Tool.Libraries.SupportLibrary)
Serialization = require(Tool.Libraries.SerializationV3)
Support.ImportServices()
Options = {DisallowLocked = false, StreamingCloneTagLifetime = 2}
CreatedInstances = {}
local v4 = {}
LastParents = v4
local u57 = {}
if not (Tool.Parent:IsA("Plugin")) then
    v1 = "Tool"
else
    v1 = "Plugin"
end
ToolMode = v1
local u67 = nil
local v5 = {
    RecolorHandle = function(p1) end,
    Clone = function(p1, p2) -- Line: 57 -- upvalues: Workspace (val), u57 (val)
        local v1, v2
        local v3 = type(p1) == "table"
        assert(v3, "Invalid items")
        v3 = typeof(p2) == "Instance"
        assert(v3, "Invalid parent")
        v3 = Security.IsLocationAllowed(p2, Player)
        assert(v3, "Permission denied for client")
        if not (CanModifyItems(p1)) then
            return {}
        end
        local v4 = GetPartsFromSelection(p1)
        if Security.ArePartsViolatingAreas(v4, Player, false) then
            return {}
        end
        local u96 = {}
        if not Player then
            v2 = nil
        elseif Workspace.StreamingEnabled then
            v2 = math.random(-1073741824, 1073741824)
        end
        for k, v in pairs(p1) do
            v1 = v:Clone()
            if v2 then
                v1:SetAttribute("BTStreamingCloneID", v2)
                v1:AddTag("BTStreamingClone")
                u57[v1] = true
            end
            v1.Parent = v5
            table.insert(u96, v1)
            CreatedInstances[v] = v
        end
        if not v2 then
            return u96
        end
        task.delay(Options.StreamingCloneTagLifetime, function() -- Line: 102 -- upvalues: u96 (val), u57 (upval)
            local v1 = u96
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j:RemoveTag("BTStreamingClone")
                j:SetAttribute("BTStreamingCloneID", nil)
                u57[j] = nil
            end
        end)
        return nil, v2, #u96
    end,
}
function v5.CreatePart(p1, p2, p3) -- Line: 116 -- upvalues: Workspace (val)
    local v1 = typeof(p3) == "Instance"
    assert(v1, "Invalid parent")
    v1 = Security.IsLocationAllowed(p3, Player)
    assert(v1, "Permission denied for client")
    local v2 = CreatePart(p1)
    v2.CFrame = p2
    local v3 = Security.GetSelectionAreas({v2})
    v1 = Security.GetPermissions(v3, Player)
    local v4 = {v2}
    if Security.ArePartsViolatingAreas(v4, Player, false, v1) then
        return
    end
    if Player and Workspace.StreamingEnabled then
        v2.Parent = Player
    end
    v2.Parent = p3
    CreatedInstances[v2] = v2
    return v2
end
function v5.CreateGroup(p1, p2, p3) -- Line: 153
    assert(({Model = true, Folder = true})[p1], "Invalid group type")
    local v1 = typeof(p2) == "Instance"
    assert(v1, "Invalid parent")
    v1 = Security.IsLocationAllowed(p2, Player)
    assert(v1, "Permission denied for client")
    if not (CanModifyItems(p3)) then
        return
    end
    local v2 = GetPartsFromSelection(p3)
    local v3 = Security.GetSelectionAreas(v2)
    v1 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v1) then
        return
    end
    v3 = Instance.new(p1)
    for k, v in pairs(p3) do
        v.Parent = v3
    end
    v3.Parent = p2
    if p1 == "Model" then
        v3:MakeJoints()
        return v3
    end
    if p1 == "Folder" then
        local v4 = Support.GetDescendantsWhichAreA(v3, "BasePart")
        for k2, i in pairs(v4) do
            i:MakeJoints()
        end
    end
    return v3
end
function v5.Ungroup(p1) -- Line: 204
    local Parent, v1, v2, v3
    local v4 = type(p1) == "table"
    assert(v4, "Invalid groups")
    if not (CanModifyItems(p1)) then
        return
    end
    local v5 = GetPartsFromSelection(p1)
    local v6 = Security.GetSelectionAreas(v5)
    v4 = Security.GetPermissions(v6, Player)
    if Security.ArePartsViolatingAreas(v5, Player, true, v4) then
        return
    end
    v6 = {}
    for i, v in ipairs(p1) do
        v1 = typeof(v) == "Instance"
        assert(v1, "Invalid group")
        v3 = {}
        v6[i] = v3
        Parent = v.Parent
        for k, i2 in pairs(v:GetChildren()) do
            LastParents[i2] = v
            v3[#v3 + 1] = i2
            i2.Parent = Parent
            if i2:IsA("BasePart") then
                i2:MakeJoints()
            elseif i2:IsA("Folder") then
                v2 = Support.GetDescendantsWhichAreA(i2, "BasePart")
                for k2, j in pairs(v2) do
                    j:MakeJoints()
                end
            end
        end
        LastParents[v] = v.Parent
        CreatedInstances[v] = v
        v.Parent = nil
    end
    return v6
end
function v5.SetParent(p1, p2) -- Line: 258
    local v1, v2
    local v3 = type(p1) == "table"
    assert(v3, "Invalid items")
    v3 = if type(p2) ~= "table" then typeof(p2) == "Instance" else true
    assert(v3, "Invalid parent")
    if not (CanModifyItems(p1)) then
        return
    end
    local v4 = GetPartsFromSelection(p1)
    local v5 = Security.GetSelectionAreas(v4)
    v3 = Security.GetPermissions(v5, Player)
    if Security.ArePartsViolatingAreas(v4, Player, true, v3) then
        return
    end
    if type(p2) == "table" then
        local v6, v7
        v1 = p2
        for k3, j in pairs(p1) do
            v2 = v1[k3]
            v7 = Security.IsLocationAllowed(v2, Player)
            assert(v7, "Permission denied for client")
            j.Parent = v2
            if j:IsA("BasePart") then
                j:MakeJoints()
            elseif j:IsA("Folder") then
                v6 = Support.GetDescendantsWhichAreA(j, "BasePart")
                for k4, k5 in pairs(v6) do
                    k5:MakeJoints()
                end
            end
        end
        return
    end
    if typeof(p2) == "Instance" then
        local v8 = Security.IsLocationAllowed(p2, Player)
        assert(v8, "Permission denied for client")
        v1 = p2
        for k, v in pairs(p1) do
            v.Parent = v1
            if v:IsA("BasePart") then
                v:MakeJoints()
            elseif v:IsA("Folder") then
                v2 = Support.GetDescendantsWhichAreA(v, "BasePart")
                for k2, i in pairs(v2) do
                    i:MakeJoints()
                end
            end
        end
    end
end
function v5.SetName(p1, p2) -- Line: 316
    local v1 = type(p1) == "table"
    assert(v1, "Invalid items")
    v1 = if type(p2) ~= "table" then type(p2) == "string" else true
    assert(v1, "Invalid name")
    if not (CanModifyItems(p1)) then
        return
    end
    local v2 = GetPartsFromSelection(p1)
    local v3 = Security.GetSelectionAreas(v2)
    v1 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v1) then
        return
    end
    if type(p2) == "table" then
        for k2, i in pairs(p1) do
            i.Name = p2[k2]
        end
        return
    end
    if type(p2) == "string" then
        for k, v in pairs(p1) do
            v.Name = p2
        end
    end
end
function v5.Remove(p1) -- Line: 350
    local v1 = {}
    local v2 = p1
    for k, v in pairs(p1) do
        if v then
            if v:IsA("BasePart") then
                table.insert(v1, v)
            elseif v:IsA("Smoke") then
                table.insert(v1, v.Parent)
            elseif not (v:IsA("Fire")) and not (v:IsA("Sparkles")) and not (v:IsA("DataModelMesh")) and not (v:IsA("Decal")) and not (v:IsA("Texture")) and not (v:IsA("Light")) then
                if v:IsA("Model") then
                    Support.ConcatTable(v1, Support.GetDescendantsWhichAreA(v, "BasePart"))
                elseif not (v:IsA("Folder")) then
                end
            end
        end
    end
    if not (CanModifyItems(v2)) or Security.ArePartsViolatingAreas(v1, Player, true) then
        return
    end
    for k2, i in pairs(v2) do
        LastParents[i] = i.Parent
        CreatedInstances[i] = i
        i.Parent = nil
    end
end
function v5.UndoRemove(p1) -- Line: 402
    local v1, v2
    local v3 = {}
    local v4 = p1
    for k, v in pairs(p1) do
        if v and LastParents[v] then
            if v:IsA("BasePart") then
                table.insert(v3, v)
            elseif v:IsA("Smoke") then
                table.insert(v3, v.Parent)
            elseif not (v:IsA("Fire")) and not (v:IsA("Sparkles")) and not (v:IsA("DataModelMesh")) and not (v:IsA("Decal")) and not (v:IsA("Texture")) and not (v:IsA("Light")) then
                if v:IsA("Model") then
                    Support.ConcatTable(v3, Support.GetDescendantsWhichAreA(v, "BasePart"))
                elseif not (v:IsA("Folder")) then
                end
            end
        end
    end
    if not (CanModifyItems(v4)) or Security.ArePartsViolatingAreas(v3, Player, false) then
        return
    end
    for k2, i in pairs(v4) do
        v1 = LastParents[i]
        LastParents[i] = i.Parent
        CreatedInstances[i] = i
        i.Parent = v1
        if not (i:IsA("BasePart")) then
            v2 = Support.GetDescendantsWhichAreA(i, "BasePart")
            for k3, j in pairs(v2) do
                j:MakeJoints()
            end
        else
            i:MakeJoints()
        end
    end
end
function v5.SyncMove(p1) -- Line: 465
    local v1 = {}
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        elseif v.Model then
            table.insert(v2, v.Model)
        end
    end
    if not (CanModifyItems(v1)) or not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v1)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v4) then
        return
    end
    v3 = {}
    local v5 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            i.InitialState = {Anchored = i.Part.Anchored, CFrame = i.Part.CFrame}
            v3[i.Part] = i
        elseif i.Model then
            v5[i.Model] = i.Pivot
        end
    end
    for k3, j in pairs(v3) do
        j.Joints = PreserveJoints(k3, v3)
    end
    for k4, k5 in pairs(v3) do
        k4.Anchored = true
        k4:BreakJoints()
        k4.Velocity = Vector3.new()
        k4.RotVelocity = Vector3.new()
        k4.CFrame = k5.CFrame
    end
    for k6, n in pairs(v5) do
        k6.WorldPivot = n
    end
    if Security.ArePartsViolatingAreas(v1, Player, false, v4) then
        for k7, m in pairs(v3) do
            k7.CFrame = m.InitialState.CFrame
        end
    end
    for k8, i5 in pairs(v3) do
        k8:MakeJoints()
        RestoreJoints(i5.Joints)
        k8.Anchored = i5.InitialState.Anchored
    end
end
function v5.SyncResize(p1) -- Line: 548
    local v1 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        end
    end
    if not (CanModifyItems(v1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(v1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v3) then
        return
    end
    v2 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            i.InitialState = {Anchored = i.Part.Anchored, Size = i.Part.Size, CFrame = i.Part.CFrame}
            v2[i.Part] = i
        end
    end
    for k3, j in pairs(v2) do
        k3.Anchored = true
        k3:BreakJoints()
        k3.Velocity = Vector3.new()
        k3.RotVelocity = Vector3.new()
        k3.Size = j.Size
        k3.CFrame = j.CFrame
    end
    if Security.ArePartsViolatingAreas(v1, Player, false, v3) then
        for k4, k5 in pairs(v2) do
            k4.Size = k5.InitialState.Size
            k4.CFrame = k5.InitialState.CFrame
        end
    end
    for k6, n in pairs(v2) do
        k6:MakeJoints()
        k6.Anchored = n.InitialState.Anchored
    end
end
function v5.SyncRotate(p1) -- Line: 615
    local v1 = {}
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        elseif v.Model then
            table.insert(v2, v.Model)
        end
    end
    if not (CanModifyItems(v1)) or not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v1)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v4) then
        return
    end
    v3 = {}
    local v5 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            i.InitialState = {Anchored = i.Part.Anchored, CFrame = i.Part.CFrame}
            v3[i.Part] = i
        elseif i.Model then
            v5[i.Model] = i.Pivot
        end
    end
    for k3, j in pairs(v3) do
        j.Joints = PreserveJoints(k3, v3)
    end
    for k4, k5 in pairs(v3) do
        k4.Anchored = true
        k4:BreakJoints()
        k4.Velocity = Vector3.new()
        k4.RotVelocity = Vector3.new()
        k4.CFrame = k5.CFrame
    end
    for k6, n in pairs(v5) do
        k6.WorldPivot = n
    end
    if Security.ArePartsViolatingAreas(v1, Player, false, v4) then
        for k7, m in pairs(v3) do
            k7.CFrame = m.InitialState.CFrame
        end
    end
    for k8, i5 in pairs(v3) do
        k8:MakeJoints()
        RestoreJoints(i5.Joints)
        k8.Anchored = i5.InitialState.Anchored
    end
end
function v5.SyncColor(p1) -- Line: 698
    local v1 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        end
    end
    if not (CanModifyItems(v1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(v1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v3) then
        return
    end
    v2 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v2[i.Part] = i
        end
    end
    for k3, j in pairs(v2) do
        k3.Color = j.Color
        if k3.ClassName == "UnionOperation" then
            k3.UsePartColor = j.UnionColoring
        end
    end
end
function v5.SyncSurface(p1) -- Line: 745
    local Surfaces, v1, v2, v3
    local v4 = {}
    local v5 = p1
    for k, v in pairs(p1) do
        if v.Part then
            v2 = if typeof(v.Part) == "Instance" then v.Part:IsA("BasePart") else false
            assert(v2, "Invalid part")
            v2 = typeof(v.Surfaces) == "table"
            assert(v2, "Invalid surface dictionary")
            Surfaces = v.Surfaces
            v2 = nil
            v3 = nil
            for i, j in Surfaces, v2, v3 do
                v1 = typeof(i) == "string"
                assert(v1, "Invalid surface")
                v1 = typeof(Enum.NormalId[i]) == "EnumItem"
                assert(v1, "Invalid surface")
                v1 = typeof(j) == "EnumItem"
                assert(v1, "Invalid surface type")
                v1 = j.EnumType == Enum.SurfaceType
                assert(v1, "Invalid surface type")
            end
            table.insert(v4, v.Part)
        end
    end
    if not (CanModifyItems(v4)) then
        return
    end
    local v6 = Security.GetSelectionAreas(v4)
    local v7 = Security.GetPermissions(v6, Player)
    if Security.ArePartsViolatingAreas(v4, Player, true, v7) then
        return
    end
    v6 = {}
    for k2, k3 in pairs(v5) do
        if k3.Part then
            v6[k3.Part] = k3
        end
    end
    for k4, n in pairs(v6) do
        for k5, m in pairs(n.Surfaces) do
            k4[k5 .. "Surface"] = m
        end
    end
end
function v5.CreateLights(p1) -- Line: 800
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    local v5 = {PointLight = true, SurfaceLight = true, SpotLight = true}
    local v6 = {}
    for k3, j in pairs(v3) do
        if v5[j.LightType] then
            v1 = Instance.new(j.LightType, k3)
            table.insert(v6, v1)
            CreatedInstances[v1] = v1
        end
    end
    return v6
end
function v5.SyncLighting(p1) -- Line: 860
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    local v5 = {PointLight = true, SurfaceLight = true, SpotLight = true}
    for k3, j in pairs(v3) do
        if v5[j.LightType] then
            v1 = Support.GetChildOfClass(k3, j.LightType)
            if v1 then
                if j.Range ~= nil then
                    v1.Range = j.Range
                end
                if j.Brightness ~= nil then
                    v1.Brightness = j.Brightness
                end
                if j.Color ~= nil then
                    v1.Color = j.Color
                end
                if j.Shadows ~= nil then
                    v1.Shadows = j.Shadows
                end
                if j.Face ~= nil then
                    v1.Face = j.Face
                end
                if j.Angle ~= nil then
                    v1.Angle = j.Angle
                end
            end
        end
    end
end
function v5.CreateDecorations(p1) -- Line: 935
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    local v5 = {Smoke = true, Fire = true, Sparkles = true}
    local v6 = {}
    for k3, j in pairs(v3) do
        if v5[j.DecorationType] then
            v1 = Instance.new(j.DecorationType, k3)
            table.insert(v6, v1)
            CreatedInstances[v1] = v1
        end
    end
    return v6
end
function v5.SyncDecorate(p1) -- Line: 995
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    local v5 = {Smoke = true, Fire = true, Sparkles = true}
    for k3, j in pairs(v3) do
        if v5[j.DecorationType] then
            v1 = Support.GetChildOfClass(k3, j.DecorationType)
            if v1 then
                if j.Color ~= nil then
                    v1.Color = j.Color
                end
                if j.Opacity ~= nil then
                    v1.Opacity = j.Opacity
                end
                if j.RiseVelocity ~= nil then
                    v1.RiseVelocity = j.RiseVelocity
                end
                if j.Size ~= nil then
                    v1.Size = j.Size
                end
                if j.Heat ~= nil then
                    v1.Heat = j.Heat
                end
                if j.SecondaryColor ~= nil then
                    v1.SecondaryColor = j.SecondaryColor
                end
                if j.SparkleColor ~= nil then
                    v1.SparkleColor = j.SparkleColor
                end
            end
        end
    end
end
function v5.CreateMeshes(p1) -- Line: 1073
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    local v5 = {}
    for k3, j in pairs(v3) do
        v1 = Instance.new("SpecialMesh", k3)
        table.insert(v5, v1)
        CreatedInstances[v1] = v1
    end
    return v5
end
function v5.SyncMesh(p1) -- Line: 1125
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    for k3, j in pairs(v3) do
        v1 = Support.GetChildOfClass(k3, "SpecialMesh")
        if v1 then
            if j.VertexColor ~= nil then
                v1.VertexColor = j.VertexColor
            end
            if j.MeshType ~= nil then
                v1.MeshType = j.MeshType
            end
            if j.Scale ~= nil then
                v1.Scale = j.Scale
            end
            if j.Offset ~= nil then
                v1.Offset = j.Offset
            end
            if j.MeshId ~= nil then
                v1.MeshId = j.MeshId
            end
            if j.TextureId ~= nil then
                v1.TextureId = j.TextureId
            end
        end
    end
end
function v5.CreateTextures(p1) -- Line: 1192
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v2, v.Part)
        end
    end
    if not (CanModifyItems(v2)) then
        return
    end
    local v3 = Security.GetSelectionAreas(v2)
    local v4 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v4) then
        return
    end
    v3 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v3[i.Part] = i
        end
    end
    local v5 = {Texture = true, Decal = true}
    local v6 = {}
    for k3, j in pairs(v3) do
        if v5[j.TextureType] then
            v1 = Instance.new(j.TextureType, k3)
            v1.Face = j.Face
            table.insert(v6, v1)
            CreatedInstances[v1] = v1
        end
    end
    return v6
end
function v5.SyncTexture(p1) -- Line: 1253
    local v1 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        end
    end
    if not (CanModifyItems(v1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(v1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v3) then
        return
    end
    v2 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v2[i.Part] = i
        end
    end
    local v4 = {Texture = true, Decal = true}
    for k3, j in pairs(v2) do
        if v4[j.TextureType] then
            for k4, k5 in pairs(k3:GetChildren()) do
                if k5.ClassName == j.TextureType and k5.Face == j.Face then
                    if j.Texture ~= nil then
                        k5.Texture = j.Texture
                    end
                    if j.Transparency ~= nil then
                        k5.Transparency = j.Transparency
                    end
                    if j.StudsPerTileU ~= nil then
                        k5.StudsPerTileU = j.StudsPerTileU
                    end
                    if j.StudsPerTileV ~= nil then
                        k5.StudsPerTileV = j.StudsPerTileV
                    end
                end
            end
        end
    end
end
function v5.SyncAnchor(p1) -- Line: 1321
    local v1 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        end
    end
    if not (CanModifyItems(v1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(v1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v3) then
        return
    end
    v2 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v2[i.Part] = i
        end
    end
    for k3, j in pairs(v2) do
        k3.Anchored = j.Anchored
    end
end
function v5.SyncCollision(p1) -- Line: 1360
    local v1 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        end
    end
    if not (CanModifyItems(v1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(v1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v3) then
        return
    end
    v2 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v2[i.Part] = i
        end
    end
    for k3, j in pairs(v2) do
        k3.CanCollide = j.CanCollide
    end
end
function v5.SyncMaterial(p1) -- Line: 1399
    local v1 = {}
    for k, v in pairs(p1) do
        if v.Part then
            table.insert(v1, v.Part)
        end
    end
    if not (CanModifyItems(v1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(v1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(v1, Player, true, v3) then
        return
    end
    v2 = {}
    for k2, i in pairs(p1) do
        if i.Part then
            v2[i.Part] = i
        end
    end
    for k3, j in pairs(v2) do
        if j.Material ~= nil then
            k3.Material = j.Material
        end
        if j.Transparency ~= nil then
            k3.Transparency = j.Transparency
        end
        if j.Reflectance ~= nil then
            k3.Reflectance = j.Reflectance
        end
    end
end
function v5.CreateWelds(p1, p2) -- Line: 1446
    local Weld, v1
    if not (CanModifyItems(p1)) then
        return
    end
    local v2 = Security.GetSelectionAreas(p1)
    local v3 = Security.GetPermissions(v2, Player)
    if Security.ArePartsViolatingAreas(p1, Player, true, v3) then
        return
    end
    v2 = {}
    for k, v in pairs(p1) do
        if v ~= p2 then
            v1 = v.CFrame:toObjectSpace(p2.CFrame)
            Weld = Instance.new("Weld")
            Weld.Name = "BTWeld"
            Weld.Part0 = p2
            Weld.Part1 = v
            Weld.C1 = v1
            Weld.Archivable = true
            Weld.Parent = p2
            CreatedInstances[Weld] = Weld
            table.insert(v2, Weld)
        end
    end
    return v2
end
function v5.RemoveWelds(p1) -- Line: 1494
    local v1, v2
    local v3 = {}
    for k, v in pairs(p1) do
        if v.ClassName ~= "Weld" then
            return
        end
        table.insert(v3, v.Part0)
        table.insert(v3, v.Part1)
    end
    if not (CanModifyItems(v3)) then
        return
    end
    local v4 = 0
    local v5 = Security.GetSelectionAreas(v3)
    local v6 = Security.GetPermissions(v5, Player)
    for k2, i in pairs(p1) do
        v2 = Security.ArePartsViolatingAreas({i.Part0}, Player, true, v6)
        v1 = {i.Part1}
        if not v2 then
            CreatedInstances[i] = i
            LastParents[i] = i.Parent
            v4 = v4 + 1
            i.Parent = nil
        elseif Security.ArePartsViolatingAreas(v1, Player, true, v6) then
        end
    end
    return v4
end
function v5.UndoRemovedWelds(p1) -- Line: 1549
    local v1, v2
    local v3 = {}
    for k, v in pairs(p1) do
        if v.ClassName ~= "Weld" or not (LastParents[v]) then
            return
        end
        table.insert(v3, v.Part0)
        table.insert(v3, v.Part1)
    end
    if not (CanModifyItems(v3)) then
        return
    end
    local v4 = Security.GetSelectionAreas(v3)
    local v5 = Security.GetPermissions(v4, Player)
    for k2, i in pairs(p1) do
        v2 = Security.ArePartsViolatingAreas({i.Part0}, Player, false, v5)
        v1 = {i.Part0}
        if not v2 then
            v1 = LastParents[i]
            LastParents[i] = i.Parent
            CreatedInstances[i] = i
            i.Parent = v1
        elseif Security.ArePartsViolatingAreas(v1, Player, false, v5) then
        end
    end
end
function v5.Export(p1) -- Line: 1607 -- upvalues: RunService (val), HttpService (val)
    if not (RunService:IsClient()) then
        local v1 = type(p1) == "table"
        assert(v1, "Invalid item table")
        if #p1 == 0 or not (CanModifyItems(p1)) then
            return
        end
        v1 = Security.GetSelectionAreas(p1)
        local v2 = Security.GetPermissions(v1, Player)
        if Security.ArePartsViolatingAreas(p1, Player, true, v2) then
            return
        end
        v1 = Support.CloneTable(p1)
        for k, v in pairs(p1) do
            Support.ConcatTable(v1, v:GetDescendants())
        end
        local v3 = Serialization.SerializeModel(v1)
        local v4 = {version = 3, data = v3}
        local UserId = Player
        if UserId then
            UserId = Player.UserId
        end
        v4.userId = UserId
        local v5 = HttpService:JSONEncode(v4)
        local v6 = HttpService:JSONDecode(HttpService:PostAsync("http://f3xteam.com/bt/export", v5, Enum.HttpContentType.ApplicationJson, true))
        if v6.success then
            return v6.id
        end
        error("Export failed due to server-side error", 2)
        return
    elseif not (RunService:IsStudio()) then
        return SyncAPI.ServerEndpoint:InvokeServer("Export", p1)
    end
end
function v5.IsHttpServiceEnabled() -- Line: 1664 -- upvalues: RunService (val), u67 (ref), HttpService (val)
    local v1, v2
    if RunService:IsClient() then
        return SyncAPI.ServerEndpoint:InvokeServer("IsHttpServiceEnabled")
    end
    if u67 ~= nil then
        return u67
    end
    v1, v2 = pcall(function() -- Line: 1678 -- upvalues: HttpService (upval)
        return HttpService:GetAsync("https://google.com")
    end)
    if v1 then
        u67 = true
    elseif not v1 and v2:match("Http requests are not enabled") then
        u67 = false
    end
    return u67 or false
end
function v5.ExtractMeshFromAsset(p1) -- Line: 1692 -- upvalues: RunService (val), HttpService (val)
    local v1
    if not (RunService:IsClient()) then
        v1 = type(p1) == "number"
        assert(v1, "Invalid asset ID")
        return HttpService:JSONDecode(HttpService:GetAsync("http://f3xteam.com/bt/getFirstMeshData/" .. p1))
    end
    if not (RunService:IsStudio()) then
        return SyncAPI.ServerEndpoint:InvokeServer("ExtractMeshFromAsset", p1)
    end
    v1 = type(p1) == "number"
    assert(v1, "Invalid asset ID")
    return HttpService:JSONDecode(HttpService:GetAsync("http://f3xteam.com/bt/getFirstMeshData/" .. p1))
end
function v5.ExtractImageFromDecal(p1) -- Line: 1710 -- upvalues: RunService (val), HttpService (val)
    if not (RunService:IsClient()) then
        return HttpService:GetAsync("http://f3xteam.com/bt/getDecalImageID/" .. p1)
    end
    if not (RunService:IsStudio()) then
        return SyncAPI.ServerEndpoint:InvokeServer("ExtractImageFromDecal", p1)
    end
    return HttpService:GetAsync("http://f3xteam.com/bt/getDecalImageID/" .. p1)
end
function v5.SetMouseLockEnabled(p1) -- Line: 1723 -- upvalues: RunService (val)
    if not (RunService:IsClient()) then
        Player.DevEnableMouseLock = p1
        return
    end
    if not (RunService:IsStudio()) then
        return SyncAPI.ServerEndpoint:InvokeServer("SetMouseLockEnabled", p1)
    end
    Player.DevEnableMouseLock = p1
end
function v5.SetLocked(p1, p2) -- Line: 1736
    local v1 = type(p1) == "table"
    assert(v1, "Invalid items")
    v1 = if type(p2) ~= "table" then type(p2) == "boolean" else true
    assert(v1, "Invalid lock state")
    if not (CanModifyItems(p1)) then
        return
    end
    local v2 = GetPartsFromSelection(p1)
    local v3 = Security.GetSelectionAreas(v2)
    v1 = Security.GetPermissions(v3, Player)
    if Security.ArePartsViolatingAreas(v2, Player, true, v1) then
        return
    end
    if type(p2) == "table" then
        for k2, i in pairs(p1) do
            i.Locked = p2[k2]
        end
        return
    end
    if type(p2) == "boolean" then
        for k, v in pairs(p1) do
            v.Locked = p2
        end
    end
end
Actions = v5
function CanModifyItems(p1) -- Line: 1773
    local v1
    for k, v in pairs(p1) do
        v1 = Security.IsItemAllowed(v, Player)
        if not v1 and not (LastParents[v]) then
            return false
        end
        if Options.DisallowLocked and v:IsA("BasePart") and v.Locked then
            return false
        end
    end
    return true
end
function GetPartsFromSelection(p1) -- Line: 1798
    local v1 = {}
    for k, v in pairs(p1) do
        if not (v:IsA("BasePart")) then
            for k2, i in pairs(v:GetDescendants()) do
                if i:IsA("BasePart") then
                    v1[#v1 + 1] = i
                end
            end
        else
            v1[#v1 + 1] = v
        end
    end
    return v1
end
local GetConnectedParts = Instance.new("Part").GetConnectedParts
local GetChildren = v2.GetChildren
function GetPartJoints(p1, p2) -- Line: 1824 -- upvalues: GetConnectedParts (val)
    local v1, v2
    local v3 = {}
    for k, v in pairs(SearchJoints(p1, p1, p2)) do
        v3[k] = v
    end
    v1, v2 = p1, p2
    for k2, i in pairs(GetConnectedParts(p1)) do
        for k3, j in pairs(SearchJoints(i, v1, v2)) do
            v3[k3] = j
        end
    end
    return v3
end
local u124 = Support.FlipTable({
    "Weld",
    "ManualWeld",
    "ManualGlue",
    "Motor",
    "Motor6D",
})
function SearchJoints(p1, p2, p3) -- Line: 1849 -- upvalues: GetChildren (val), u124 (val)
    local v1 = {}
    for k, v in pairs(GetChildren(p1)) do
        if u124[v.ClassName] and p3[v.Part0] and p3[v.Part1] then
            v1[v] = v.Parent
        end
    end
    return v1
end
function RestoreJoints(p1) -- Line: 1873
    for k, v in pairs(p1) do
        k.Parent = v
    end
end
function PreserveJoints(p1, p2) -- Line: 1883
    local v1 = GetPartJoints(p1, p2)
    for k in pairs(v1) do
        k.Parent = nil
    end
    return v1
end
function CreatePart(p1) -- Line: 1899
    local v1 = nil
    if p1 == "Normal" then
        v1 = Instance.new("Part")
        v1.Size = Vector3.new(4, 1, 2)
    elseif p1 == "Truss" then
        v1 = Instance.new("TrussPart")
    elseif p1 == "Wedge" then
        v1 = Instance.new("WedgePart")
        v1.Size = Vector3.new(4, 1, 2)
    elseif p1 == "Corner" then
        v1 = Instance.new("CornerWedgePart")
    elseif p1 == "Cylinder" then
        v1 = Instance.new("Part")
        v1.Shape = "Cylinder"
        v1.Size = Vector3.new(2, 2, 2)
    elseif p1 == "Ball" then
        v1 = Instance.new("Part")
        v1.Shape = "Ball"
    elseif p1 == "Seat" then
        v1 = Instance.new("Seat")
        v1.Size = Vector3.new(4, 1, 2)
    elseif p1 == "Vehicle Seat" then
        v1 = Instance.new("VehicleSeat")
        v1.Size = Vector3.new(4, 1, 2)
    elseif p1 == "Spawn" then
        v1 = Instance.new("SpawnLocation")
        v1.Size = Vector3.new(4, 1, 2)
    end
    v1.TopSurface = Enum.SurfaceType.Smooth
    v1.BottomSurface = Enum.SurfaceType.Smooth
    v1.Anchored = true
    return v1
end
if ToolMode == "Tool" then
    if not Tool.Parent then
        if not Tool.Parent then
            Player = nil
        elseif not (Tool.Parent:IsA("Model")) then
            Player = nil
        else
            Player = Players:GetPlayerFromCharacter(Tool.Parent)
        end
    elseif Tool.Parent:IsA("Backpack") then
        Player = Tool.Parent.Parent
    end
    Tool.AncestryChanged:Connect(function(p1, p2) -- Line: 1967 -- upvalues: u57 (val)
        if p1 ~= Tool then
            return
        end
        if not p2 then
            if not p2 then
                Player = nil
                local v1 = u57
                local v2 = nil
                local v3 = nil
                for i in v1, v2, v3 do
                    i:RemoveTag("BTStreamingClone")
                    i:SetAttribute("BTStreamingCloneID", nil)
                    u57[i] = nil
                end
                return
            elseif p2:IsA("Model") then
                Player = Players:GetPlayerFromCharacter(p2)
                return
            end
        elseif p2:IsA("Backpack") then
            Player = p2.Parent
            return
        end
    end)
end
return {
    Options = Options,
    PerformAction = function(p1, p2, ...) -- Line: 2005
        local v1 = Actions[p2]
        if not v1 then
            return
        end
        if ToolMode == "Tool" then
            local v2 = Player
            if v2 then
                v2 = p1 == Player
            end
            assert(v2, "Permission denied for client")
        end
        return v1(...)
    end,
}