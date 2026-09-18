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
--              File: ReplicatedStorage.Common.Effects.Types.Tools.TrapCart
--                               Dumped in 0.00220 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local STRW = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Tools"):WaitForChild("STRW")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Miscellaneous = require(Namespaces:WaitForChild("Miscellaneous"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local TrapCart = require(Tools:WaitForChild("TrapCart"))
local u113 = {
    speed = 250,
    t_dropoff = 0.1,
    timeStep = 0.01,
    maxTime = 5,
    minTimeBeforeCollision = 0.1,
    maxDistance = 350,
    sphereRadius = 0.5,
    spread = 0.08,
    gravity = Vector3.new(0, -19.62, 0),
}
local u119 = {}
local u120 = {}
local function computePosition(p1, p2, p3) -- Line: 47 -- upvalues: u113 (val)
    local v1
    local look = p1.look
    if p1.dropPosition then
        v1 = (p1.dropTime or 0) + p3
        p1.dropTime = v1
        return p1.dropPosition + 0.5 * u113.gravity * (v1 * v1)
    end
    if p2 < u113.t_dropoff then
        return p1.startPosition + look * (u113.speed * p2)
    end
    v1 = p2 - u113.t_dropoff
    return p1.startPosition + look * (u113.speed * u113.t_dropoff) + look * (u113.speed * v1) + 0.5 * u113.gravity * (v1 * v1)
end
local function resolveHumanoidRootPart(p1) -- Line: 78
    local HumanoidRootPart
    local Parent = p1:FindFirstAncestorWhichIsA("Model")
    while Parent do
        if Parent:IsA("Model") then
            HumanoidRootPart = Parent:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
                if not (Parent:HasTag("Shifter")) and not (HumanoidRootPart:GetAttribute("id")) then
                    Parent = Parent.Parent
                    continue
                end
                return HumanoidRootPart
            end
        end
    end
    return nil
end
return function(p1, p2) -- Line: 101 -- upvalues: STRW (val), u113 (val), CollectionService (val), Sounds (val), TrapCart (val), RunService (val), computePosition (val), Workspace (val), resolveHumanoidRootPart (val), Miscellaneous (val), u119 (val), u120 (val)
    local Attachment, Beam, LookVector, WorldPosition, u145, v1, v2, v3
    local u146 = {}
    local Base = p1:FindFirstChild("Base")
    if not Base then
        return
    end
    for i, j in Base:GetChildren() do
        if j:IsA("Attachment") then
            table.insert(u146, j)
        end
    end
    local u135 = {}
    local u154 = false
    local zero = Vector3.zero
    local v4 = u146
    local v5 = nil
    local v6 = nil
    for k, n in v4, v5, v6 do
        zero = zero + n.WorldPosition
    end
    if 0 < #u146 then
        zero = zero / #u146
    end
    v4 = u146
    v5 = nil
    v6 = nil
    v1, u145 = p1, p2
    for m, i5 in v4, v5, v6 do
        v2 = STRW:Clone()
        v2.Parent = Base
        Beam = v2:FindFirstChildWhichIsA("Beam")
        if Beam then
            Attachment = Instance.new("Attachment")
            Attachment.Parent = Base
            Attachment.Name = "MovementAttachment"
            WorldPosition = i5.WorldPosition
            Beam.Attachment0 = i5
            Beam.Attachment1 = Attachment
            Beam.Enabled = true
            Attachment.WorldPosition = WorldPosition
            LookVector = i5.WorldCFrame.LookVector
            v3 = WorldPosition - zero
            if 0 < v3.Magnitude then
                LookVector = (LookVector + v3.Unit * u113.spread).Unit
            end
            table.insert(u135, {attachment = Attachment, look = LookVector, startPosition = WorldPosition, previousPosition = WorldPosition})
        end
    end
    local Tagged = CollectionService:GetTagged("Ungrappleable")
    local Tagged_2 = CollectionService:GetTagged("Collider")
    local u61 = RaycastParams.new()
    u61.FilterType = Enum.RaycastFilterType.Exclude
    u61.CollisionGroup = "Blades"
    local v7 = {}
    v2 = table.unpack(Tagged)
    v7[1] = v1
    v7[2] = v2
    v7[3] = table.unpack(Tagged_2)
    u61.FilterDescendantsInstances = v7
    local u73 = 0
    local playRangedSoundEffect = Sounds.playRangedSoundEffect
    local Position = Base.Position
    local v8 = math.random(0.9, 1.1)
    playRangedSoundEffect(TrapCart.Fire, Position, 600, 1.6, v8, 1)
    local u88 = nil
    u88 = RunService.RenderStepped:Connect(function(p1) -- Line: 188 -- upvalues: u73 (ref), u135 (ref), computePosition (upval), u113 (upval), Workspace (upval), u61 (val), resolveHumanoidRootPart (upval), u145 (val), Miscellaneous (upval), u154 (ref), u88 (ref), Sounds (upval), TrapCart (upval), Base (val), u119 (upval), u120 (upval)
        local v1, v2, v3, v4, v5
        u73 = u73 + p1
        local u163 = {}
        local v6 = u135
        local v7 = nil
        local v8 = nil
        local v9 = p1
        for i, j in v6, v7, v8 do
            v4 = computePosition(j, u73, v9)
            if not j.dropPosition and u113.maxDistance < (v4 - j.startPosition).Magnitude then
                v5 = j.startPosition + (v4 - j.startPosition).Unit * u113.maxDistance
                j.dropPosition = v5
                j.dropTime = 0
                v4 = v5
            end
            u163[i] = v4
        end
        v6 = nil
        if u113.minTimeBeforeCollision <= u73 then
            local previousPosition
            v7 = u135
            v8 = nil
            v3 = nil
            for k, n in v7, v8, v3 do
                previousPosition = n.previousPosition
                v5 = u163[k]
                if v5 then
                    v1 = v5 - previousPosition
                    if 0 < v1.Magnitude then
                        v2 = Workspace:Spherecast(previousPosition, u113.sphereRadius, v1, u61)
                        if v2 then
                            v6 = v2
                            break
                        end
                    end
                end
            end
        end
        local function applyPendingPositions() -- Line: 234 -- upvalues: u135 (upval), u163 (val)
            local v1
            local v2 = u135
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1 = u163[i]
                if v1 then
                    j.previousPosition = v1
                    j.attachment.WorldPosition = v1
                end
            end
        end
        if not v6 or not v6.Instance then
            applyPendingPositions()
            return
        end
        v8 = resolveHumanoidRootPart(v6.Instance)
        if not v8 then
            applyPendingPositions()
            return
        end
        local Parent = v8.Parent
        if not Parent then
            return
        end
        if u145 then
            Miscellaneous.TrapCart.post(v8, u145)
        end
        u154 = true
        u88:Disconnect()
        local playRangedSoundEffect = Sounds.playRangedSoundEffect
        v2 = math.random(0.9, 1.1)
        playRangedSoundEffect(TrapCart.Hit, Base.Position, 1000, 2, v2, 1)
        local v10 = u135
        v4 = nil
        local v11 = nil
        for m, i5 in v10, v4, v11 do
            v2 = u163[m]
            if v2 then
                i5.attachment.Parent = Parent
                i5.attachment.WorldPosition = v2
            end
        end
        if Parent:HasTag("Shifter") then
            local Name = Parent.Name
            v4 = u119[Name]
            if not v4 then
                v4 = {}
            end
            v11 = u135
            v5 = nil
            v1 = nil
            for i6, i7 in v11, v5, v1 do
                table.insert(v4, i7.attachment)
            end
            u119[Name] = v4
            v11 = u120[Name]
            if v11 then
                task.cancel(v11)
            end
            u120[Name] = task.delay(35, function() -- Line: 298 -- upvalues: u119 (upval), Name (val), u120 (upval)
                local v1 = u119[Name]
                if v1 then
                    local v2 = v1
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        j:Destroy()
                    end
                    u119[Name] = nil
                end
                u120[Name] = nil
            end)
        end
    end)
    task.delay(u113.maxTime, function() -- Line: 311 -- upvalues: u88 (ref), u154 (ref), u135 (ref), u146 (ref)
        u88:Disconnect()
        if not u154 then
            local v1 = u135
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j.attachment:Destroy()
            end
            u135 = {}
            u146 = {}
        end
    end)
end