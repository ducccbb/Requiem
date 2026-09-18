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
--             File: ReplicatedStorage.Client.User.Editor.Builder.Tools.Move
--                               Dumped in 0.00164 seconds
--                          Bytecode version 9  |  14 functions

local getRootFromInstance
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Chunk = Common_3:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local Select = require(script.Parent:WaitForChild("Select"))
local u107 = trove.new()
local u109 = trove.new()
function getRootFromInstance(p1) -- Line: 40 -- upvalues: getRootFromInstance (val)
    if p1:GetAttribute("root") then
        return p1
    end
    if not p1.Parent then
        return nil
    end
    return getRootFromInstance(p1.Parent)
end
local function createModelBoundingBox(p1) -- Line: 67 -- upvalues: Workspace (val)
    local BoundingBox_2
    _, BoundingBox_2 = p1:GetBoundingBox()
    local Part = Instance.new("Part")
    Part.Size = BoundingBox_2 * Vector3.new(1.2, 1.2, 1.2)
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Transparency = 1
    Part.CFrame = p1:GetPivot()
    Part.Parent = Workspace:WaitForChild("Terrain")
    return Part
end
local function onShowMoveGizmos(p1, p2, p3) -- Line: 89 -- upvalues: createModelBoundingBox (val), Players (val), u109 (val), Signals (val), CollectionService (val), Workspace (val), getRootFromInstance (val), Zone (val), Building (val), u107 (val)
    local Handles, Pivot, isColliding, v1, v2, v3, v4, v5, v6, v7
    local u5 = createModelBoundingBox(p1)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    u109:Clean()
    local Attribute = p1:GetAttribute("category")
    if p2 then
        Pivot = p1:GetPivot()
        Handles = Instance.new("Handles")
        Handles.Visible = true
        Handles.Style = Enum.HandlesStyle.Movement
        Handles.Adornee = u5
        Handles.Color3 = Color3.fromRGB(255, 0, 0)
        Handles.Faces = Faces.new(Enum.NormalId.Left, Enum.NormalId.Right)
        Handles.Parent = PlayerGui
        v6 = Handles:Clone()
        v6.Color3 = Color3.fromRGB(0, 0, 255)
        v6.Faces = Faces.new(Enum.NormalId.Front, Enum.NormalId.Back)
        v6.Parent = PlayerGui
        u109:Add(u5)
        u109:Add(Handles)
        u109:Add(v6)
        v7 = Handles.MouseButton1Down:Connect(function() -- Line: 127 -- upvalues: Pivot (ref), p1 (val)
            Pivot = p1:GetPivot()
        end)
        v1 = v6.MouseButton1Down:Connect(function() -- Line: 131 -- upvalues: Pivot (ref), p1 (val)
            Pivot = p1:GetPivot()
        end)
        function isColliding(a1, a2) -- Line: 137 -- upvalues: p2 (val), CollectionService (upval), Attribute (val), Workspace (upval), getRootFromInstance (upval), p1 (val)
            local v1
            if p2 then
                return false
            end
            local v2 = OverlapParams.new()
            v2.FilterType = Enum.RaycastFilterType.Include
            v2.FilterDescendantsInstances = {CollectionService:GetTagged(Attribute)}
            local PartBoundsInBox = Workspace:GetPartBoundsInBox(a1, a2, v2)
            local v3 = false
            if 0 >= #PartBoundsInBox then
                return v3
            end
            local v4 = PartBoundsInBox
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                v1 = getRootFromInstance(j)
                if v1 ~= p1 then
                    return true
                end
            end
            return v3
        end
        v2 = Handles.MouseDrag:Connect(function(a1, p2) -- Line: 163 -- upvalues: Pivot (ref), p1 (val), Zone (upval), p3 (val), isColliding (val), u5 (val)
            local BoundingBox_2, v1
            if a1 ~= Enum.NormalId.Left then
                v1 = 1
            else
                v1 = -1
            end
            local v2 = Pivot * CFrame.new(v1 * p2, 0, 0)
            _, BoundingBox_2 = p1:GetBoundingBox()
            local v3 = Zone.clampBoundingBoxToZones(v2, BoundingBox_2, p3, nil)
            if isColliding(v3, BoundingBox_2) then
                return
            end
            p1:PivotTo(v3)
            u5.CFrame = p1:GetPivot()
        end)
        v3 = v6.MouseDrag:Connect(function(a1, p2) -- Line: 178 -- upvalues: Pivot (ref), p1 (val), Zone (upval), p3 (val), isColliding (val), u5 (val)
            local BoundingBox_2, v1
            if a1 ~= Enum.NormalId.Front then
                v1 = 1
            else
                v1 = -1
            end
            local v2 = Pivot * CFrame.new(0, 0, v1 * p2)
            _, BoundingBox_2 = p1:GetBoundingBox()
            local v3 = Zone.clampBoundingBoxToZones(v2, BoundingBox_2, p3, nil)
            if isColliding(v3, BoundingBox_2) then
                return
            end
            p1:PivotTo(v3)
            u5.CFrame = p1:GetPivot()
        end)
        v4 = Handles.MouseButton1Up:Connect(function() -- Line: 193 -- upvalues: Pivot (ref), p1 (val), Building (upval)
            Pivot = p1:GetPivot()
            Building.Relocate.post({id = p1:GetAttribute("id"), location = p1:GetPivot()})
        end)
        v5 = v6.MouseButton1Up:Connect(function() -- Line: 200 -- upvalues: Pivot (ref), p1 (val), Building (upval)
            Pivot = p1:GetPivot()
            Building.Relocate.post({id = p1:GetAttribute("id"), location = p1:GetPivot()})
        end)
        u107:Add(v7)
        u107:Add(v1)
        u107:Add(v2)
        u107:Add(v3)
        u107:Add(v4)
        u107:Add(v5)
        return
    end
    if Attribute == "Blueprints" then
        return Signals.Toast:Fire({message = "You cannot move blueprints, you must destroy and replace them.", type = "error"})
    end
    Pivot = p1:GetPivot()
    Handles = Instance.new("Handles")
    Handles.Visible = true
    Handles.Style = Enum.HandlesStyle.Movement
    Handles.Adornee = u5
    Handles.Color3 = Color3.fromRGB(255, 0, 0)
    Handles.Faces = Faces.new(Enum.NormalId.Left, Enum.NormalId.Right)
    Handles.Parent = PlayerGui
    v6 = Handles:Clone()
    v6.Color3 = Color3.fromRGB(0, 0, 255)
    v6.Faces = Faces.new(Enum.NormalId.Front, Enum.NormalId.Back)
    v6.Parent = PlayerGui
    u109:Add(u5)
    u109:Add(Handles)
    u109:Add(v6)
    v7 = Handles.MouseButton1Down:Connect(function() -- Line: 127 -- upvalues: Pivot (ref), p1 (val)
        Pivot = p1:GetPivot()
    end)
    v1 = v6.MouseButton1Down:Connect(function() -- Line: 131 -- upvalues: Pivot (ref), p1 (val)
        Pivot = p1:GetPivot()
    end)
    function isColliding(a1, a2) -- Line: 137 -- upvalues: p2 (val), CollectionService (upval), Attribute (val), Workspace (upval), getRootFromInstance (upval), p1 (val)
        local v1
        if p2 then
            return false
        end
        local v2 = OverlapParams.new()
        v2.FilterType = Enum.RaycastFilterType.Include
        v2.FilterDescendantsInstances = {CollectionService:GetTagged(Attribute)}
        local PartBoundsInBox = Workspace:GetPartBoundsInBox(a1, a2, v2)
        local v3 = false
        if 0 >= #PartBoundsInBox then
            return v3
        end
        local v4 = PartBoundsInBox
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v1 = getRootFromInstance(j)
            if v1 ~= p1 then
                return true
            end
        end
        return v3
    end
    v2 = Handles.MouseDrag:Connect(function(a1, p2) -- Line: 163 -- upvalues: Pivot (ref), p1 (val), Zone (upval), p3 (val), isColliding (val), u5 (val)
        local BoundingBox_2, v1
        if a1 ~= Enum.NormalId.Left then
            v1 = 1
        else
            v1 = -1
        end
        local v2 = Pivot * CFrame.new(v1 * p2, 0, 0)
        _, BoundingBox_2 = p1:GetBoundingBox()
        local v3 = Zone.clampBoundingBoxToZones(v2, BoundingBox_2, p3, nil)
        if isColliding(v3, BoundingBox_2) then
            return
        end
        p1:PivotTo(v3)
        u5.CFrame = p1:GetPivot()
    end)
    v3 = v6.MouseDrag:Connect(function(a1, p2) -- Line: 178 -- upvalues: Pivot (ref), p1 (val), Zone (upval), p3 (val), isColliding (val), u5 (val)
        local BoundingBox_2, v1
        if a1 ~= Enum.NormalId.Front then
            v1 = 1
        else
            v1 = -1
        end
        local v2 = Pivot * CFrame.new(0, 0, v1 * p2)
        _, BoundingBox_2 = p1:GetBoundingBox()
        local v3 = Zone.clampBoundingBoxToZones(v2, BoundingBox_2, p3, nil)
        if isColliding(v3, BoundingBox_2) then
            return
        end
        p1:PivotTo(v3)
        u5.CFrame = p1:GetPivot()
    end)
    v4 = Handles.MouseButton1Up:Connect(function() -- Line: 193 -- upvalues: Pivot (ref), p1 (val), Building (upval)
        Pivot = p1:GetPivot()
        Building.Relocate.post({id = p1:GetAttribute("id"), location = p1:GetPivot()})
    end)
    v5 = v6.MouseButton1Up:Connect(function() -- Line: 200 -- upvalues: Pivot (ref), p1 (val), Building (upval)
        Pivot = p1:GetPivot()
        Building.Relocate.post({id = p1:GetAttribute("id"), location = p1:GetPivot()})
    end)
    u107:Add(v7)
    u107:Add(v1)
    u107:Add(v2)
    u107:Add(v3)
    u107:Add(v4)
    u107:Add(v5)
end
return {
    onToolSelected = function(p1, p2, p3) -- Line: 220 -- upvalues: u107 (val), u109 (val), Select (val), onShowMoveGizmos (val)
        u107:Clean()
        u109:Clean()
        local v1 = Select.getSelectedModel()
        if v1 then
            onShowMoveGizmos(v1, p2, p3)
        end
        u107:Add(Select.onSelectedModelUpdated:Connect(function(p1) -- Line: 230 -- upvalues: u109 (upval), onShowMoveGizmos (upval), p2 (val), p3 (val)
            if not p1 then
                u109:Clean()
                return
            end
            onShowMoveGizmos(p1, p2, p3)
        end))
        local v2 = Select.onToolSelected(p1)
        u107:Add(v2)
        u107:Add(u109)
        return u107
    end,
    onToolStepped = function(p1, p2) -- Line: 58 -- upvalues: Select (val)
        Select.onToolStepped(p1, p2)
    end,
}