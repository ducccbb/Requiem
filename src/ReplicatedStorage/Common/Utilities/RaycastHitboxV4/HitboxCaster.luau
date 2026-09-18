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
--         File: ReplicatedStorage.Common.Utilities.RaycastHitboxV4.HitboxCaster
--                               Dumped in 0.00161 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Heartbeat = game:GetService("RunService").Heartbeat
local CollectionService = game:GetService("CollectionService")
local VisualizerCache = require(v1.Parent.VisualizerCache)
local u27 = {}
local Solvers = v1.Parent:WaitForChild("Solvers")
local u33 = {}
u33.__index = u33
u33.__type = "RaycastHitbox"
local v3 = {LinkAttachments = 1, Attachment = 2, Vector3 = 3, Bone = 4}
u33.CastModes = v3
function u33.HitStart(p1, p2) -- Line: 62
    if p1.HitboxActive then
        p1:HitStop()
    end
    if p2 then
        p1.HitboxStopTime = os.clock() + math.max(0.016666666666666666, p2)
    end
    p1.HitboxActive = true
end
function u33:HitStop() -- Line: 76
    self.HitboxActive = false
    self.HitboxStopTime = 0
    table.clear(self.HitboxHitList)
end
function u33:Destroy() -- Line: 83 -- upvalues: CollectionService (val)
    self.HitboxPendingRemoval = true
    if self.HitboxObject then
        CollectionService:RemoveTag(self.HitboxObject, self.Tag)
    end
    self:HitStop()
    self.OnHit:Destroy()
    self.OnUpdate:Destroy()
    self.HitboxRaycastPoints = nil
    self.HitboxObject = nil
end
function u33.AddAttachment(p1, p2) -- Line: 97 -- upvalues: u33 (val)
    local v1 = p1:_CreatePoint(p2:GetAttribute("Group"), u33.CastModes.Attachment, p2.WorldPosition)
    table.insert(v1.Instances, p2)
    table.insert(p1.HitboxRaycastPoints, v1)
end
function u33.RemoveAttachment(p1, p2) -- Line: 105
    local v1, v2
    local v3 = 1
    local v4 = -1
    v1, v2 = p1, p2
    for i = #p1.HitboxRaycastPoints, v3, v4 do
        if v1.HitboxRaycastPoints[i].Instances[1] == v2 then
            table.remove(v1.HitboxRaycastPoints, i)
        end
    end
end
function u33:Recalibrate() -- Line: 114 -- upvalues: u33 (val)
    local v1
    local Descendants = self.HitboxObject:GetDescendants()
    local v2 = 0
    local v3 = 1
    local v4 = -1
    local v5 = self
    for i = #self.HitboxRaycastPoints, v3, v4 do
        if v5.HitboxRaycastPoints[i].CastMode == u33.CastModes.Attachment then
            table.remove(v5.HitboxRaycastPoints, i)
        end
    end
    for i2, v in ipairs(Descendants) do
        if v:IsA("Attachment") and v.Name == "DmgPoint" then
            v1 = v5:_CreatePoint(v:GetAttribute("Group"), u33.CastModes.Attachment, v.WorldPosition)
            table.insert(v1.Instances, v)
            table.insert(v5.HitboxRaycastPoints, v1)
            v2 = v2 + 1
        end
    end
    if v5.DebugLog then
        local v6
        v3 = print
        local format = string.format
        if 0 >= v2 then
            v6 = string.format("No attachments found in object: %s. Can be safely ignored if using SetPoints.", v5.HitboxObject.Name)
        else
            v6 = string.format("%s attachments found in object: %s.", v2, v5.HitboxObject.Name)
            if not v6 then
                v6 = string.format("No attachments found in object: %s. Can be safely ignored if using SetPoints.", v5.HitboxObject.Name)
            end
        end
        v3(format("%s%s", "[ Raycast Hitbox V4 ]\n", v6))
    end
end
function u33.LinkAttachments(p1, p2, p3) -- Line: 155 -- upvalues: u33 (val)
    local v1 = p1:_CreatePoint(p2:GetAttribute("Group"), u33.CastModes.LinkAttachments)
    v1.Instances[1] = p2
    v1.Instances[2] = p3
    table.insert(p1.HitboxRaycastPoints, v1)
end
function u33.UnlinkAttachments(p1, p2) -- Line: 166
    local v1, v2, v3
    local v4 = 1
    local v5 = -1
    v1, v2 = p1, p2
    for i = #p1.HitboxRaycastPoints, v4, v5 do
        v3 = #v1.HitboxRaycastPoints[i].Instances
        if 2 <= v3 then
            if v1.HitboxRaycastPoints[i].Instances[1] == v2 then
                table.remove(v1.HitboxRaycastPoints, i)
            elseif v1.HitboxRaycastPoints[i].Instances[2] ~= v2 then
            end
        end
    end
end
function u33.SetPoints(p1, p2, p3, p4) -- Line: 183 -- upvalues: u33 (val)
    local v1, v2, v3, v4
    v3, v1 = p4, p2
    for i, v in ipairs(p3) do
        if not (v1:IsA("Bone")) then
            v2 = "Vector3"
        else
            v2 = "Bone"
        end
        v4 = v5:_CreatePoint(v3, u33.CastModes[v2])
        v4.Instances[1] = v1
        v4.Instances[2] = v
        table.insert(v5.HitboxRaycastPoints, v4)
    end
end
function u33.RemovePoints(p1, p2, p3) -- Line: 196
    local v1, v2, v3
    local v4 = 1
    local v5 = -1
    v1, v2, v3 = p1, p2, p3
    for i = #p1.HitboxRaycastPoints, v4, v5 do
        if v1.HitboxRaycastPoints[i].Instances[1] == v2 then
            for i2, v in ipairs(v3) do
                if v == v1.HitboxRaycastPoints[i].Instances[2] then
                    table.remove(v1.HitboxRaycastPoints, i)
                    break
                end
            end
        end
    end
end
function u33._CreatePoint(p1, p2, p3, p4) -- Line: 217
    return {Group = p2, CastMode = p3, LastPosition = p4, Instances = {}}
end
function u33._FindHitbox(p1, p2) -- Line: 229 -- upvalues: u27 (val)
    for i, v in ipairs(u27) do
        if not v.HitboxPendingRemoval and v.HitboxObject == p2 then
            return v
        end
    end
end
function u33._Init(p1) -- Line: 241 -- upvalues: u27 (val), CollectionService (val)
    local HitboxObject
    if not p1.HitboxObject then
        return
    end
    local u2 = nil
    p1:Recalibrate()
    table.insert(u27, p1)
    CollectionService:AddTag(p1.HitboxObject, p1.Tag)
    local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal(p1.Tag)
end
;(function() -- Line: 262 -- upvalues: Solvers (val), Heartbeat (val), u27 (val), VisualizerCache (val), u33 (val)
    local v1
    local u6 = table.create(#Solvers:GetChildren())
    Heartbeat:Connect(function(p1) -- Line: 266 -- upvalues: u27 (upval), u6 (val), VisualizerCache (upval)
        local Adornment, Instance, v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = 1
        local v10 = -1
        for i = #u27, v9, v10 do
            if not (u27[i].HitboxPendingRemoval) then
                for i2, v in ipairs(u27[i].HitboxRaycastPoints) do
                    if u27[i].HitboxActive then
                        v8 = u6[v.CastMode]
                        v1, v2 = v8:Solve(v)
                        v3 = workspace:Raycast(v1, v2, u27[i].RaycastParams)
                        if u27[i].Visualizer then
                            Adornment = VisualizerCache:GetAdornment()
                            if Adornment then
                                v4 = v8:Visualize(v)
                                Adornment.Adornment.Length = v2.Magnitude
                                Adornment.Adornment.CFrame = v4
                            end
                        end
                        v.LastPosition = v8:UpdateToNextPosition(v)
                        if not v3 then
                            if 0 < u27[i].HitboxStopTime and u27[i].HitboxStopTime <= os.clock() then
                                u27[i]:HitStop()
                            end
                            u27[i].OnUpdate:Fire(v.LastPosition)
                            if u27[i].OnUpdate._signalType ~= u27[i].SignalType then
                                u27[i].OnUpdate._signalType = u27[i].SignalType
                                u27[i].OnHit._signalType = u27[i].SignalType
                            end
                        else
                            Instance = v3.Instance
                            v5 = nil
                            if u27[i].DetectionMode ~= 1 then
                                v6 = Instance
                            else
                                v4 = Instance:FindFirstAncestorOfClass("Model")
                                if v4 then
                                    v5 = v4:FindFirstChildOfClass("Humanoid")
                                end
                                v6 = v5
                            end
                            if v6 then
                                if u27[i].DetectionMode > 2 then
                                    u27[i].OnHit:Fire(Instance, v5, v3, v.Group)
                                elseif not (u27[i].HitboxHitList[v6]) then
                                    u27[i].HitboxHitList[v6] = true
                                end
                            end
                        end
                    else
                        v.LastPosition = nil
                    end
                end
            else
                v7 = table.remove(u27, i)
                table.clear(v7)
                setmetatable(v7, nil)
            end
        end
        v9 = #VisualizerCache._AdornmentInUse
        if 0 < v9 then
            local v11
            v10 = 1
            local v12 = -1
            for j = v9, v10, v12 do
                v11 = os.clock() - VisualizerCache._AdornmentInUse[j].LastUse
                if 0.25 <= v11 then
                    v11 = table.remove(VisualizerCache._AdornmentInUse, j)
                    if v11 then
                        VisualizerCache:ReturnAdornment(v11)
                    end
                end
            end
        end
    end)
    for k, v in pairs(u33.CastModes) do
        v1 = Solvers:FindFirstChild(k)
        if v1 then
            u6[v] = require(v1)
        end
    end
end)()
return u33