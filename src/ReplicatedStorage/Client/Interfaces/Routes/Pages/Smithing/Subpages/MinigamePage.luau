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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Smithing.Subpages.MinigamePage
--                               Dumped in 0.00236 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local AssetService = game:GetService("AssetService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Ingots = require(Types:WaitForChild("Ingots"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network = Common_5:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_7:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Trainer = script.Parent.Parent.Parent:WaitForChild("Trainer")
local Components_2 = Trainer:WaitForChild("Components")
local GearTrainerKeyNode = require(Components_2:WaitForChild("BalancerMinigameHard")).GearTrainerKeyNode
local u208 = CFrame.new(-0.478628159, -0.514423132, -0.734725952, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local function createEditableMeshAsset() -- Line: 71 -- upvalues: AssetService (val)
    local Magnitude, Position, Position_2, Position_3, huge, v1, v2, v3, v4, v5, v6, v7
    local v8 = AssetService:CreateEditableMeshAsync(Content.fromAssetId(134575419415916))
    local v9 = AssetService:CreateEditableMeshAsync(Content.fromAssetId(92523533879481))
    local v10 = AssetService:CreateMeshPartAsync(Content.fromObject(v8))
    local MeshPart = Instance.new("MeshPart")
    MeshPart.Anchored = true
    MeshPart.Material = Enum.Material.Metal
    MeshPart.Position = Vector3.new(0, 10, 0)
    MeshPart.Size = Vector3.new(0.406, 0.125, 3.257)
    MeshPart.Parent = workspace
    local Vertices = v9:GetVertices()
    local Vertices_2 = v8:GetVertices()
    local v11 = Vector3.new(math.huge, math.huge, math.huge)
    local v12 = Vector3.new(-math.huge, -math.huge, -math.huge)
    local v13 = Vertices
    local v14 = nil
    local v15 = nil
    for i, j in v13, v14, v15 do
        Position_3 = v9:GetPosition(j)
        v1 = math.min(v11.X, Position_3.X)
        v2 = math.min(v11.Y, Position_3.Y)
        v11 = Vector3.new(v1, v2, (math.min(v11.Z, Position_3.Z)))
        v1 = math.max(v12.X, Position_3.X)
        v2 = math.max(v12.Y, Position_3.Y)
        v12 = Vector3.new(v1, v2, (math.max(v12.Z, Position_3.Z)))
    end
    v13 = {}
    v14 = {}
    v15 = {}
    local v16 = Vertices_2
    local v17 = nil
    local v18 = nil
    for k, n in v16, v17, v18 do
        Position = v8:GetPosition(n)
        v15[n] = Position
        v3 = Vector3.new((Position.X - v11.X) / (v12.X - v11.X), (Position.Y - v11.Y) / (v12.Y - v11.Y), (Position.Z - v11.Z) / (v12.Z - v11.Z))
        huge = math.huge
        v4 = nil
        v5 = Vertices
        v6 = nil
        v7 = nil
        for m, i5 in v5, v6, v7 do
            Position_2 = v9:GetPosition(i5)
            Magnitude = (v3 - Vector3.new((Position_2.X - v11.X) / (v12.X - v11.X), (Position_2.Y - v11.Y) / (v12.Y - v11.Y), (Position_2.Z - v11.Z) / (v12.Z - v11.Z))).Magnitude
            if Magnitude < huge then
                huge = Magnitude
                v4 = i5
            end
        end
        v13[n] = v4
    end
    v16 = v13
    v17 = nil
    v18 = nil
    for i6, i7 in v16, v17, v18 do
        v14[i6] = v9:GetPosition(i7)
        v8:SetPosition(i6, v14[i6])
    end
    MeshPart:ApplyMesh(v10)
    return MeshPart, v8, v14, v15
end
local function updateEditableMeshAnimation(p1, p2, p3, p4) -- Line: 142
    local v1 = p2
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        p1:SetPosition(i, j:Lerp(p3[i], p4))
    end
end
return function(p1) -- Line: 154 -- upvalues: react (val), GearTrainerKeyNode (val), Assets (val), createEditableMeshAsset (val), u208 (val), Ingots (val), Workspace (val), TweenService (val), useAnimatorObserver (val), Cinematics (val), Particles (val), updateEditableMeshAnimation (val), Frame (val)
    local u5, v1, v2
    local v3 = {}
    v1, u5 = react.useState(v3)
    local v4 = {}
    for k, v in pairs(v1) do
        v2 = tostring(k)
        v4[v2] = react.createElement(GearTrainerKeyNode, {Enabled = p1.Enabled, Node = v})
    end
    react.useEffect(function() -- Line: 166 -- upvalues: p1 (val), Assets (upval), createEditableMeshAsset (upval), u208 (upval), Ingots (upval), Workspace (upval), TweenService (upval), u5 (val), useAnimatorObserver (upval), Cinematics (upval), Particles (upval), updateEditableMeshAnimation (upval)
        local u41, u43, u44, u45, v1, v2, v3, v4, v5, v6
        if not p1.Root or not p1.Smithing or not p1.Smithing.requirements then
            return
        end
        local u7 = {}
        local v7 = p1.Smithing.requirements[1]
        if not v7 then
            return
        end
        local item = v7.item
        local u162 = nil
        local u14 = 0
        local u115 = nil
        local u118 = nil
        local u17 = nil
        if not (string.find(item, "Ingot")) then
            return function() -- Line: 327 -- upvalues: u7 (val), TweenService (upval), u162 (ref), u115 (ref), u118 (ref), u17 (ref)
                local v1
                local v2 = u7
                local v3 = nil
                local v4 = nil
                for i, j in v2, v3, v4 do
                    v1 = TweenInfo.new(0.05)
                    TweenService:Create(i, v1, {Position = j}):Play()
                end
                if u162 then
                    task.cancel(u162)
                end
                if u115 then
                    u115:Destroy()
                end
                if u118 then
                    u118:Destroy()
                end
                if u17 then
                    u17:Stop(0)
                end
            end
        end
        local Tools = Assets:WaitForChild("Tools")
        local Ingots_2 = Tools:WaitForChild("Ingots")
        v6 = Ingots_2:FindFirstChild(item)
        if not v6 then
            return
        end
        local BasePart = v6:FindFirstChildWhichIsA("BasePart")
        if not BasePart then
            return
        end
        u41, v1, u43, u44, u45 = pcall(createEditableMeshAsset)
        if not u41 then
            v2 = u208
        else
            local v8 = math.rad(90)
            v2 = u208 * CFrame.Angles(0, v8, 0)
        end
        if u41 then
            v3 = v1
            v3.Color = BasePart.Color
        else
            v3 = BasePart:Clone()
        end
        if p1.Smithing.merge_tags then
            Ingots.colorObjectFromTags(v3, Ingots.INGOT_COLORS, p1.Smithing.tags)
        end
        v3.Anchored = true
        v3.CanCollide = false
        v3.Parent = Workspace
        v3.CFrame = p1.Root.CFrame * v2 * CFrame.new(0, 5, 0)
        local Particles_2 = Assets:WaitForChild("Particles")
        local Other = Particles_2:WaitForChild("Other")
        u115 = Other:WaitForChild("Hammer"):Clone()
        u115.Parent = p1.Root
        u118 = v3
        for i, j in p1.Root.Parent:GetChildren() do
            if j:IsA("BasePart") and j ~= p1.Root then
                v4 = Vector3.new(p1.Root.Position.X, j.Position.Y, p1.Root.Position.Z)
                u7[j] = j.Position
                v5 = TweenInfo.new(0.3)
                TweenService:Create(j, v5, {Position = j.Position + (j.Position - v4).Unit * 5}):Play()
            end
        end
        local v9 = TweenInfo.new(0.5)
        TweenService:Create(v3, v9, {CFrame = p1.Root.CFrame * v2}):Play()
        u162 = coroutine.create(function() -- Line: 253 -- upvalues: u5 (upval), u14 (ref), u17 (ref), useAnimatorObserver (upval), Cinematics (upval), Particles (upval), u115 (ref), u41 (val), updateEditableMeshAnimation (upval), u43 (val), u44 (val), u45 (val), p1 (upval)
            task.wait(1)
            local v1 = 1.5
            local u4 = 0
            local u5 = false
            while task.wait(v1 * 1) do
                if u5 then
                    break
                end
                u5(function(a1) -- Line: 265 -- upvalues: u4 (ref), u14 (upval), u17 (upval), useAnimatorObserver (upval), Cinematics (upval), Particles (upval), u115 (upval), u41 (upval), updateEditableMeshAnimation (upval), u43 (upval), u44 (upval), u45 (upval), u5 (upval), p1 (upval), u5 (ref)
                    local v1 = table.clone(a1)
                    local v2 = math.random(40, 60) / 100
                    table.insert(v1, {
                        Angle = 0,
                        Length = 0,
                        Speed = 0,
                        Position = Vector2.new(v2, math.random(40, 60) / 100),
                        Count = u4,
                        Scored = function(a1) -- Line: 278 -- upvalues: u14 (upval), u17 (upval), useAnimatorObserver (upval), Cinematics (upval), Particles (upval), u115 (upval), u41 (upval), updateEditableMeshAnimation (upval), u43 (upval), u44 (upval), u45 (upval), u5 (upval), p1 (upval), u5 (upval)
                            if a1 <= 0 then
                                return
                            end
                            u14 = u14 + a1
                            if u17 then
                                u17:Stop(0)
                            end
                            local v1 = useAnimatorObserver.play(Cinematics.SmithingHammerAction, 0.2)
                            if not v1 then
                                return
                            end
                            u17 = v1
                            task.wait(0.19)
                            Particles.deepEmitParticles(u115)
                            local v2 = math.clamp(u14 / 7, 0, 1)
                            if u41 then
                                updateEditableMeshAnimation(u43, u44, u45, v2)
                            end
                            if 7 <= u14 then
                                u5({})
                                p1.Completed(true)
                                u5 = true
                            end
                        end,
                        Spawned = tick(),
                    })
                    u4 = u4 + 1
                    return v1
                end)
                v1 = math.clamp(v1 - 0.02, 0.7, 1.5)
            end
        end)
        coroutine.resume(u162)
        return function() -- Line: 327 -- upvalues: u7 (val), TweenService (upval), u162 (ref), u115 (ref), u118 (ref), u17 (ref)
            local v1
            local v2 = u7
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1 = TweenInfo.new(0.05)
                TweenService:Create(i, v1, {Position = j}):Play()
            end
            if u162 then
                task.cancel(u162)
            end
            if u115 then
                u115:Destroy()
            end
            if u118 then
                u118:Destroy()
            end
            if u17 then
                u17:Stop(0)
            end
        end
    end, {p1.Enabled, p1.Root})
    return react.createElement(Frame, {Visible = p1.Enabled}, v4)
end