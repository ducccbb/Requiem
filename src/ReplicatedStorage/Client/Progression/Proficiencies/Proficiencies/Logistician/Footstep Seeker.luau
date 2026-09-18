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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Logistician.Footstep Seeker
--                               Dumped in 0.00225 seconds
--                          Bytecode version 9  |  19 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Miscellaneous = User:WaitForChild("Miscellaneous")
local ClientSenseRunner = require(Miscellaneous:WaitForChild("ClientSenseRunner"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Footsteps = require(Types:WaitForChild("Footsteps"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Miscellaneous_2 = require(Namespaces:WaitForChild("Miscellaneous"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types_2 = Common_4:WaitForChild("Types")
require(Types_2:WaitForChild("Sense"))
local u129 = Vector3.new(1, 0.01, 1)
local u134 = Color3.fromRGB(128, 128, 128)
local SmoothPlastic = Enum.Material.SmoothPlastic
local u140 = Vector3.new(0, -4, 0)
local u145 = Vector3.new(0, 2, 0)
local u146 = {Transparency = 1}
local u147 = {Transparency = 0}
local u148 = {Transparency = 1}
local u153 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u158 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local u163 = Color3.fromRGB(255, 255, 255)
local u166 = RaycastParams.new()
u166.FilterType = Enum.RaycastFilterType.Exclude
u166.IgnoreWater = true
local u169 = nil
local function getVisualsFolder() -- Line: 111 -- upvalues: u169 (ref), Workspace (val)
    local Folder
    if not u169 then
        Folder = Instance.new("Folder")
        Folder.Name = "FootstepSeekerVisuals"
        Folder.Parent = Workspace
        u169 = Folder
        return Folder
    end
    if u169.Parent then
        return u169
    end
    Folder = Instance.new("Folder")
    Folder.Name = "FootstepSeekerVisuals"
    Folder.Parent = Workspace
    u169 = Folder
    return Folder
end
local function collectPlates(p1) -- Line: 128
    local v1 = {}
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            table.insert(v1, j)
        end
    end
    return v1
end
local function animateBatch(p1) -- Line: 143 -- upvalues: collectPlates (val), TweenService (val), u153 (val), u147 (val), u158 (val), u148 (val)
    local u3 = collectPlates(p1)
    task.spawn(function() -- Line: 146 -- upvalues: u3 (val), TweenService (upval), u153 (upval), u147 (upval), p1 (val), u158 (upval), u148 (upval)
        local v1 = u3
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            TweenService:Create(j, u153, u147):Play()
        end
        task.wait(u153.Time + 5)
        if not p1.Parent then
            return
        end
        v1 = u3
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            if n.Parent then
                TweenService:Create(n, u158, u148):Play()
            end
        end
        task.wait(u158.Time)
        if p1.Parent then
            p1:Destroy()
        end
    end)
end
local function centripetalCatmullRom(p1, p2, p3, p4, p5) -- Line: 177
    local v1 = math.sqrt((p2 - p1).Magnitude)
    local v2 = v1 + math.sqrt((p3 - p2).Magnitude)
    local v3 = v2 + math.sqrt((p4 - p3).Magnitude)
    if v1 - 0 < 1e-06 or v2 - v1 < 1e-06 or v3 - v2 < 1e-06 then
        return p2:Lerp(p3, p5)
    end
    local v4 = v1 + p5 * (v2 - v1)
    local v5 = p2 * ((v2 - v4) / (v2 - v1)) + p3 * ((v4 - v1) / (v2 - v1))
    return ((p1 * ((v1 - v4) / (v1 - 0)) + p2 * ((v4 - 0) / (v1 - 0))) * ((v2 - v4) / (v2 - 0)) + v5 * ((v4 - 0) / (v2 - 0))) * ((v2 - v4) / (v2 - v1)) + (v5 * ((v3 - v4) / (v3 - v1)) + (p3 * ((v3 - v4) / (v3 - v2)) + p4 * ((v4 - v2) / (v3 - v2))) * ((v4 - v1) / (v3 - v1))) * ((v4 - v1) / (v2 - v1))
end
local function buildPlateCFrame(p1, p2, p3) -- Line: 204
    local Unit_3, v1
    local Unit = p2.Unit
    local Unit_2 = nil
    if p3 then
        local v2 = p3 - p1
        v1 = v2 - Unit * v2:Dot(Unit)
        if 0.0001 < v1.Magnitude then
            Unit_2 = v1.Unit
        end
    end
    if not Unit_2 then
        local yAxis
        v1 = math.abs(Unit.Y)
        if v1 >= 0.99 then
            yAxis = Vector3.xAxis
        else
            yAxis = Vector3.yAxis
        end
        Unit_3 = (yAxis - Unit * yAxis:Dot(Unit)).Unit
    else
        Unit_3 = Unit_2
    end
    return CFrame.fromMatrix(p1, Unit_3:Cross(Unit).Unit, Unit, -Unit_3)
end
local function createPlate(p1, p2, p3, p4) -- Line: 236 -- upvalues: u129 (val), u146 (val)
    local Part = Instance.new("Part")
    Part.Name = "Footstep"
    Part.Size = u129
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.BottomSurface = Enum.SurfaceType.Smooth
    Part.Material = p3
    Part.Color = p2
    Part.CFrame = p1
    local v1 = u146
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        Part[i] = j
    end
    Part.Parent = p4
    return Part
end
local function spawnFootstepPair(p1, p2, p3, p4) -- Line: 267 -- upvalues: createPlate (val)
    local v1 = p1 * CFrame.new(-0.6, 0, 0)
    createPlate(v1, p2, p3, p4)
    v1 = p1 * CFrame.new(0.6, 0, -0.5)
    createPlate(v1, p2, p3, p4)
end
local function getGroundAppearance(p1) -- Line: 277 -- upvalues: u134 (val), SmoothPlastic (val)
    local v1, v2
    local Instance = p1.Instance
    local Material = p1.Material
    if not Instance or not (Instance:IsA("Terrain")) then
        if Instance then
            if Instance:IsA("BasePart") then
                return Instance.Color, Material
            end
            return u134, SmoothPlastic
        end
        return u134, SmoothPlastic
    end
    v1, v2 = pcall(function() -- Line: 283 -- upvalues: Instance (val), Material (val)
        return Instance:GetMaterialColor(Material)
    end)
    if not v1 then
        return u134, Material
    end
    if v2 then
        return v2, Material
    end
    return u134, Material
end
local function placeSample(p1, p2, p3) -- Line: 306 -- upvalues: Workspace (val), u140 (val), u166 (val), getGroundAppearance (val), spawnFootstepPair (val), buildPlateCFrame (val)
    local v1, v2
    local v3 = Workspace:Raycast(p1, u140, u166)
    if not v3 then
        return false
    end
    v1, v2 = getGroundAppearance(v3)
    local v4 = Color3.new(v1.R * 0.9, v1.G * 0.9, v1.B * 0.9)
    local v5 = buildPlateCFrame(v3.Position, v3.Normal, p2)
    spawnFootstepPair(v5, v4, v2, p3)
    return true
end
local function isTrailClear(p1, p2) -- Line: 326 -- upvalues: u145 (val), Workspace (val), u166 (val)
    local v1 = p1 + u145
    local v2 = Workspace:Raycast(v1, p2 - p1, u166) == nil
    return v2
end
local function computeGroupSize(p1) -- Line: 337
    return (math.clamp(math.ceil(p1 / 12), 2, 48))
end
local function groupPlatesIntoModels(p1) -- Line: 347 -- upvalues: computeGroupSize (val)
    local Model, v1, v2, v3, v4, v5, zero
    local Children = p1:GetChildren()
    local v6 = {}
    local v7 = computeGroupSize(#Children)
    local v8 = #Children
    local v9 = v7
    local v10 = p1
    for i = 1, v8, v9 do
        v4 = math.min(i + v7 - 1, #Children)
        zero = Vector3.zero
        v5 = v4
        v1 = 1
        for j = i, v5, v1 do
            zero = zero + Children[j].Position
        end
        Model = Instance.new("Model")
        Model.Name = "FootstepGroup"
        v2 = v4
        v3 = 1
        for k = i, v2, v3 do
            Children[k].Parent = Model
        end
        Model.WorldPivot = CFrame.new(zero / (v4 - i + 1))
        Model.Parent = v10
        table.insert(v6, Model)
    end
    return v6
end
local function clearAllVisuals() -- Line: 491 -- upvalues: u169 (ref)
    if not u169 or not u169.Parent then
        return
    end
    for i, j in u169:GetChildren() do
        j:Destroy()
    end
end
Miscellaneous_2.Footstep.listen(function(p1) -- Line: 507 -- upvalues: clearAllVisuals (val)
    if p1 == 1 then
        clearAllVisuals()
    end
end)
return {
    activated = function() end,
    requested = function(p1) -- Line: 390 -- upvalues: Footsteps (val), Character (val), u166 (val), getVisualsFolder (val), isTrailClear (val), placeSample (val), centripetalCatmullRom (val), groupPlatesIntoModels (val), u163 (val), animateBatch (val), ClientSenseRunner (val)
        local position, position_2, position_3, position_4, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = Footsteps.decodeFootstepBuffer(p1)
        local v11 = Character.getCharacter()
        if not v11 then
            return
        end
        u166.FilterDescendantsInstances = {v11}
        local v12 = {}
        local v13 = v10
        local v14 = nil
        local v15 = nil
        for i, j in v13, v14, v15 do
            v12[j.id] = j
        end
        v13 = {}
        v14 = v10
        v15 = nil
        local v16 = nil
        for k, n in v14, v15, v16 do
            if n.nextId ~= Footsteps.NO_ID then
                v13[n.nextId] = n.id
            end
        end
        local Folder = Instance.new("Folder")
        Folder.Name = "Batch"
        Folder.Parent = getVisualsFolder()
        v15 = 150 < #v10
        v16 = v10
        local v17 = nil
        local v18 = nil
        for m, i5 in v16, v17, v18 do
            if i5.nextId == Footsteps.NO_ID then
                v1 = nil
            else
                v1 = v12[i5.nextId]
            end
            v2 = v12[v13[i5.id] or -1]
            v3 = not v15
            if v3 then
                v3 = if v1 ~= nil then if (i5.position - v1.position).Magnitude <= 300 then isTrailClear(i5.position, v1.position) else false else false
            end
            if v3 then
                position = i5.position
                position_2 = v1.position
                if not v2 then
                    position_3 = position + (position - position_2)
                else
                    position_3 = v2.position
                end
                if v1.nextId == Footsteps.NO_ID then
                    v5 = nil
                else
                    v5 = v12[v1.nextId]
                end
                if not v5 then
                    position_4 = position_2 + (position_2 - position)
                else
                    position_4 = v5.position
                end
                v6 = math.max(1, (math.min(13, (math.round((position_2 - position).Magnitude / 4)))))
                v7 = table.create(v6 + 1)
                v8 = v6 - 1
                v9 = 1
                for i6 = 0, v8, v9 do
                    v7[i6 + 1] = centripetalCatmullRom(position_3, position, position_2, position_4, i6 / v6)
                end
                v7[v6 + 1] = position_2
                v8 = v6
                v9 = 1
                for i7 = 1, v8, v9 do
                    placeSample(v7[i7], v7[i7 + 1], Folder)
                end
            else
                if not v2 then
                    v4 = nil
                else
                    v4 = i5.position + (i5.position - v2.position)
                end
                placeSample(i5.position, v4, Folder)
            end
        end
        v16 = groupPlatesIntoModels(Folder)
        v17 = table.create(#v16)
        v18 = v16
        local v19 = nil
        local v20 = nil
        for i8, i9 in v18, v19, v20 do
            v17[i8] = {instance = i9}
        end
        animateBatch(Folder)
        ClientSenseRunner.onRevealSense({
            radius = 100,
            duration = 1.5,
            indicator = false,
            objects = v17,
            color = u163,
        })
    end,
    settings = {},
}