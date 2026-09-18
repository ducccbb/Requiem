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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Mythic.Eradicate
--                               Dumped in 0.00377 seconds
--                          Bytecode version 9  |  29 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Draw = require(Utilities:WaitForChild("Draw"))
local u47 = -math.huge
local v2 = {description = "Eradicate a titan's arm.", passive = true, upgradable = false}
local function closestPointOnSegment(p1, p2, p3) -- Line: 57
    local v1 = p2 - p1
    local v2 = v1:Dot(v1)
    if v2 < 1e-08 then
        return p1
    end
    local v3 = (p3 - p1):Dot(v1) / v2
    return p1 + v1 * math.clamp(v3, 0, 1)
end
local function flatHorizontal(p1) -- Line: 67
    return (Vector3.new(p1.X, 0, p1.Z))
end
local function smoothstep01(p1) -- Line: 71
    local v1 = math.clamp(p1, 0, 1)
    return v1 * v1 * (3 - v1 * 2)
end
local function newPolylineCurve(p1) -- Line: 76
    local Magnitude
    if #p1 == 0 then
        return {
            Get = function(p1, p2) -- Line: 80
                return Vector3.zero
            end,
            GetPathBySegmentLength = function(p1, p2) -- Line: 83
                return {}
            end,
        }
    end
    if #p1 == 1 then
        local u6 = p1[1]
        return {
            Get = function(p1, p2) -- Line: 91 -- upvalues: u6 (val)
                return u6
            end,
            GetPathBySegmentLength = function(p1, p2) -- Line: 94 -- upvalues: u6 (val)
                return {u6}
            end,
        }
    end
    local u10 = {}
    local u31 = 0
    local v1 = #p1 - 1
    local v2 = 1
    for i = 1, v1, v2 do
        Magnitude = (p1[i + 1] - p1[i]).Magnitude
        table.insert(u10, Magnitude)
        u31 = u31 + Magnitude
    end
    local u36 = {
        _pts = p1,
        _segLen = u10,
        _totalLen = u31,
        Get = function(a1, p2) -- Line: 113 -- upvalues: u31 (ref), p1 (val), u10 (val)
            local v1, v2
            local v3 = math.clamp(p2, 0, 1)
            if u31 < 1e-08 then
                return p1[1]
            end
            local v4 = v3 * u31
            local v5 = 0
            local v6 = #u10
            local v7 = 1
            for i = 1, v6, v7 do
                v1 = u10[i]
                if v4 <= v5 + v1 + 1e-06 then
                    if 1e-08 >= v1 then
                        v2 = 0
                    else
                        v2 = (v4 - v5) / v1
                    end
                    return p1[i]:Lerp(p1[i + 1], (math.clamp(v2, 0, 1)))
                end
                v5 = v5 + v1
            end
            return p1[#p1]
        end,
    }
    function u36.GetPathBySegmentLength(a1, p2) -- Line: 131 -- upvalues: u31 (ref), p1 (val), u36 (val)
        if u31 < 1e-08 then
            return {p1[1]}
        end
        local v1 = math.max(2, (math.ceil(u31 / math.max(p2, 0.01))))
        local v2 = {}
        local v3 = v1
        local v4 = 1
        for i = 0, v3, v4 do
            table.insert(v2, u36:Get(i / v1))
        end
        return v2
    end
    return u36
end
local function closestPointOnPolyline(p1, p2) -- Line: 146 -- upvalues: closestPointOnSegment (val)
    local Magnitude, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local huge = math.huge
    local v10 = p1[1]
    local v11 = p1[2] - p1[1]
    local v12 = 0
    local v13 = 0
    local v14 = #p1 - 1
    local v15 = 1
    v1, v2 = p1, p2
    for i = 1, v14, v15 do
        v3 = v1[i]
        v4 = v1[i + 1]
        v5 = v4 - v3
        Magnitude = v5.Magnitude
        v6 = closestPointOnSegment(v3, v4, v2)
        v7 = (v6 - v2).Magnitude ^ 2
        if v7 < huge then
            huge = v7
            v10 = v6
            if 1e-06 < Magnitude then
                v11 = v5
            end
            if 1e-08 >= Magnitude then
                v8 = 0
            else
                v9 = (v6 - v3):Dot(v5)
                v8 = v9 / (Magnitude * Magnitude)
            end
            v12 = v13 + Magnitude * math.clamp(v8, 0, 1)
        end
        v13 = v13 + Magnitude
    end
    if v11.Magnitude < 1e-06 then
        v11 = Vector3.new(0, 1, 0)
    end
    return v10, v12, v11
end
local function polylineTotalLength(p1) -- Line: 178
    local v1 = 0
    local v2 = #p1 - 1
    local v3 = 1
    for i = 1, v2, v3 do
        v1 = v1 + (p1[i + 1] - p1[i]).Magnitude
    end
    return v1
end
local function pointAndTangentAtArcLength(p1, p2) -- Line: 186 -- upvalues: polylineTotalLength (val)
    local Magnitude, v1, v2, v3, v4
    local v5 = math.clamp(p2, 0, (polylineTotalLength(p1)))
    local v6 = #p1 - 1
    local v7 = 1
    local v8 = p1
    for i = 1, v6, v7 do
        v2 = v8[i]
        v3 = v8[i + 1]
        v4 = v3 - v2
        Magnitude = v4.Magnitude
        if Magnitude >= 1e-08 then
            if v5 <= Magnitude + 1e-06 then
                v1 = v2:Lerp(v3, v5 / Magnitude)
                return v1, v4.Unit
            end
            v5 = v5 - Magnitude
        end
    end
    v6 = v8[#v8]
    return v6, (v6 - v8[#v8 - 1]).Unit
end
local function basisPerpendicular(p1) -- Line: 206
    local Unit = p1.Unit
    local v1 = Vector3.yAxis:Cross(Unit)
    if v1.Magnitude < 0.0001 then
        v1 = Vector3.xAxis:Cross(Unit)
    end
    local Unit_2 = v1.Unit
    return Unit_2, Unit:Cross(Unit_2).Unit
end
local function projectOntoPlanePerpT(p1, p2) -- Line: 218 -- upvalues: basisPerpendicular (val)
    local Unit = p2.Unit
    local v1 = p1 - Unit * p1:Dot(Unit)
    if v1.Magnitude >= 1e-05 then
        return v1.Unit
    end
    local v2 = basisPerpendicular(Unit)
    return v2
end
local function slerpUnitVectors(p1, p2, p3) -- Line: 228
    local v1 = math.clamp(p3, 0, 1)
    local v2 = p1:Dot(p2)
    v2 = math.acos((math.clamp(v2, -1, 1)))
    if v2 < 0.0001 then
        return p1
    end
    if math.pi - 0.02 >= v2 then
        local v3 = p1 * math.sin((1 - v1) * v2)
        return (v3 + p2 * math.sin(v1 * v2)) / math.sin(v2)
    end
    local v4 = p1:Cross(Vector3.yAxis)
    if v4.Magnitude < 0.0001 then
        v4 = p1:Cross(Vector3.xAxis)
    end
    local v5 = p1 * math.cos(v1 * math.pi)
    return (v5 + v4.Unit * math.sin(v1 * math.pi)).Unit
end
local function outwardDirClimbThenNape(p1, p2, p3, p4, p5, p6) -- Line: 249 -- upvalues: projectOntoPlanePerpT (val), slerpUnitVectors (val), smoothstep01 (val)
    local Unit_2, Unit_3
    local Unit = p2.Unit
    local v1 = p3 - p1
    v1 = v1 - Unit * v1:Dot(Unit)
    local v2 = p4 - p1
    v2 = v2 - Unit * v2:Dot(Unit)
    if v1.Magnitude >= 1e-05 then
        Unit_2 = v1.Unit
    else
        Unit_2 = projectOntoPlanePerpT(-p5.CFrame.LookVector, Unit)
    end
    if v2.Magnitude >= 1e-05 then
        Unit_3 = v2.Unit
    else
        Unit_3 = Unit_2
    end
    if p6 < 0.82 then
        return Unit_2
    end
    return slerpUnitVectors(Unit_2, Unit_3, smoothstep01((p6 - 0.82) / 0.18000000000000005))
end
local function buildArmChain(p1, p2) -- Line: 286
    local v1 = p2:FindFirstChild(p1 .. "Hand")
    local v2 = p2:FindFirstChild(p1 .. "LowerArm")
    local v3 = p2:FindFirstChild(p1 .. "UpperArm")
    if not v1 or not v3 then
        return nil
    end
    local v4 = {}
    table.insert(v4, (v1.CFrame * CFrame.new(0, -v1.Size.Y / 2, 0)).Position)
    if not v2 then
        table.insert(v4, (v1.CFrame * CFrame.new(0, v1.Size.Y / 2, 0)).Position)
        table.insert(v4, (v3.CFrame * CFrame.new(0, -v3.Size.Y / 2, 0)).Position)
    else
        table.insert(v4, (v2.CFrame * CFrame.new(0, -v2.Size.Y / 2, 0)).Position)
        table.insert(v4, (v2.CFrame * CFrame.new(0, v2.Size.Y / 2, 0)).Position)
    end
    table.insert(v4, (v3.CFrame * CFrame.new(0, v3.Size.Y / 2, 0)).Position)
    return v4
end
local function estimateRadiusFromPart(p1) -- Line: 310
    return math.max(p1.Size.X, p1.Size.Z) * 0.5 + 2
end
local function snapToArmSurface(p1, p2, p3, p4, p5, p6, p7) -- Line: 315 -- upvalues: Workspace (val)
    local ClosestPointOnSurface, Magnitude, Unit, Unit_2
    local v1 = nil
    local huge = math.huge
    if #p3 == 0 then
        return p2 + p4 * (p5 + 4)
    end
    local v2 = p3
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        ClosestPointOnSurface = j:GetClosestPointOnSurface(p1)
        Magnitude = (ClosestPointOnSurface - p1).Magnitude
        if Magnitude < huge then
            huge = Magnitude
            v1 = ClosestPointOnSurface
        end
    end
    if not v1 then
        v2 = p2 + p4 * p5
    else
        v2 = v1
    end
    v3 = v2 - p2
    if v3.Magnitude >= 0.0001 then
        Unit = v3.Unit
    else
        Unit = p4
    end
    v4 = v2 + Unit * 4
    if v1 then
        return v4
    end
    local v5 = p2 - p4 * math.clamp(p5 * 0.5, 3, 12)
    local v6 = Workspace:Raycast(v5, p4 * 120, p6)
    if not v6 or not (v6.Instance:IsDescendantOf(p7)) then
        return v4
    end
    local Normal = v6.Normal
    if 1e-06 >= Normal.Magnitude then
        Unit_2 = p4
    else
        Unit_2 = Normal.Unit
    end
    return v6.Position + Unit_2 * 4
end
local function buildNapeBridgeWaypoints(p1, p2, p3) -- Line: 371
    local v1 = p2.Position - p2.CFrame.LookVector * (p2.Size.Z * 0.5 + 4) + p2.CFrame.UpVector * (p2.Size.Y * 0.5 * 0.35)
    local v2 = v1:Lerp(p1, 0.5)
    return {v1, v2, p1}
end
local function debugDrawEradicatePath(p1, p2, p3) -- Line: 381 -- upvalues: Workspace (val), Draw (val)
    local Folder = Instance.new("Folder")
    Folder.Name = "EradicateDebug"
    Folder.Parent = Workspace
    task.delay(12, function() -- Line: 390 -- upvalues: Folder (val)
        if Folder.Parent then
            Folder:Destroy()
        end
    end)
    local function mark(p1, p2, p3) -- Line: 396 -- upvalues: Draw (upval), Folder (val)
        local v1 = Draw.point(p1, p2)
        v1.Size = Vector3.new(p3, p3, p3)
        v1.Parent = Folder
    end
    local v1 = Color3.fromRGB(220, 200, 80)
    local v2 = Color3.fromRGB(255, 90, 90)
    local v3 = Color3.fromRGB(255, 255, 255)
    local v4 = #p1 - 1
    local v5 = 1
    for i = 1, v4, v5 do
        Draw.line(p1[i], p1[i + 1], v1, 0.35, 0.35).Parent = Folder
    end
    mark(p2, v2, 5)
    local PathBySegmentLength = p3:GetPathBySegmentLength(2.5)
    v5 = #PathBySegmentLength - 1
    local v6 = 1
    for j = 1, v5, v6 do
        Draw.line(PathBySegmentLength[j], PathBySegmentLength[j + 1], v3, 0.55, 0.15).Parent = Folder
    end
end
local function slideCharacterAlongCurve(p1, p2, p3, p4) -- Line: 420 -- upvalues: RunService (val), flatHorizontal (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    local Humanoid = p1:FindFirstChildOfClass("Humanoid")
    if not HumanoidRootPart or not Humanoid then
        return
    end
    local HumanoidRootPart_2 = p4:FindFirstChild("HumanoidRootPart")
    HumanoidRootPart.Anchored = true
    Humanoid.AutoRotate = false
    Humanoid.PlatformStand = true
    HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    local function tangentAtCurveAlpha(p1) -- Line: 436 -- upvalues: p2 (val), HumanoidRootPart (val)
        local v1 = p2:Get((math.min(p1 + 0.04, 1)))
        local v2 = v1 - p2:Get((math.max(p1 - 0.04, 0)))
        if v2.Magnitude < 1e-05 then
            return HumanoidRootPart.CFrame.LookVector
        end
        return v2.Unit
    end
    local u23 = os.clock()
    local u24 = nil
end
local v3 = {}
function v3.activated(p1, p2, p3) -- Line: 490 -- upvalues: u47 (ref), buildArmChain (val), Players (val), closestPointOnPolyline (val), polylineTotalLength (val), estimateRadiusFromPart (val), pointAndTangentAtArcLength (val), outwardDirClimbThenNape (val), snapToArmSurface (val), buildNapeBridgeWaypoints (val), newPolylineCurve (val), debugDrawEradicatePath (val), slideCharacterAlongCurve (val)
    local Position, WorldPosition, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local v13 = os.clock() - u47
    if v13 < 3 then
        return false
    end
    if not (p2.Name:match("^Left")) then
        v13 = "Right"
    else
        v13 = "Left"
    end
    local v14 = buildArmChain(v13, p1)
    if not v14 then
        return false
    end
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    local UpperTorso = p1:FindFirstChild("UpperTorso")
    if not HumanoidRootPart or not UpperTorso then
        return false
    end
    local Character = Players.LocalPlayer.Character
    local HumanoidRootPart_2 = Character
    if HumanoidRootPart_2 then
        HumanoidRootPart_2 = Character:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart_2 then
        return false
    end
    if not p3 then
        Position = p2:GetClosestPointOnSurface(HumanoidRootPart_2.Position)
    else
        Position = p3.Position
    end
    _, v2 = closestPointOnPolyline(v14, Position)
    local v15 = polylineTotalLength(v14)
    if v15 < 0.001 then
        return false
    end
    local v16 = estimateRadiusFromPart(p2)
    local Nape = UpperTorso:FindFirstChild("Nape")
    local v17 = UpperTorso.Size.Z * 0.5
    local v18 = UpperTorso.Size.Y * 0.5
    if not Nape then
        WorldPosition = UpperTorso.Position - UpperTorso.CFrame.LookVector * (v17 + 14) + UpperTorso.CFrame.UpVector * v18
    else
        WorldPosition = Nape.WorldPosition
    end
    local v19 = math.max(v15 - v2, 0)
    local v20 = math.max(8, (math.ceil(math.max(v19, 0.001) / 3))) + 1
    local v21 = {}
    local v22 = {}
    local v23 = v20
    local v24 = 1
    for i = 1, v23, v24 do
        if 1 >= v20 then
            v3 = math.min(v2, v15)
        else
            v3 = v2 + v19 * ((i - 1) / (v20 - 1))
        end
        v4, v5 = pointAndTangentAtArcLength(v14, v3)
        v21[i] = v4
        v22[i] = v5.Unit
    end
    v23 = {}
    v24 = {}
    v4 = v13 .. "Hand"
    v24[1] = v4
    v24[2] = v13 .. "LowerArm"
    v24[3] = v13 .. "UpperArm"
    local v25 = nil
    v3 = nil
    for j, k in v24, v25, v3 do
        v6 = v1:FindFirstChild(k)
        if v6 and v6:IsA("BasePart") then
            table.insert(v23, v6)
        end
    end
    v24 = RaycastParams.new()
    v24.IgnoreWater = true
    v24.FilterType = Enum.RaycastFilterType.Include
    v24.FilterDescendantsInstances = v23
    v24.CollisionGroup = "Blades"
    v25 = {}
    if v19 >= 0.001 then
        v3 = v20
        v4 = 1
        for n = 1, v3, v4 do
            v7 = outwardDirClimbThenNape(v21[n], v22[n], Position, WorldPosition, HumanoidRootPart, (n - 1) / (v20 - 1))
            table.insert(v25, snapToArmSurface(v21[n] + v7 * (v16 * 2.2), v21[n], v23, v7, v16 + 4, v24, v1))
        end
    else
        v3 = outwardDirClimbThenNape(v21[1], v22[1], Position, WorldPosition, HumanoidRootPart, 1)
        table.insert(v25, snapToArmSurface(v21[1] + v3 * (v16 * 2.2), v21[1], v23, v3, v16 + 4, v24, v1))
    end
    v4 = buildNapeBridgeWaypoints(WorldPosition, UpperTorso, HumanoidRootPart)
    v5 = {}
    v6 = v25
    v7 = nil
    local v26 = nil
    for m, i5 in v6, v7, v26 do
        table.insert(v5, i5)
    end
    v6 = {v25[#v25]}
    v7 = v4
    v26 = nil
    local v27 = nil
    for i6, i7 in v7, v26, v27 do
        table.insert(v6, i7)
    end
    v7 = #v6
    v26 = 1
    for i8 = 2, v7, v26 do
        v8 = v6[i8 - 1]
        v9 = v6[i8]
        v10 = math.max(2, (math.ceil((v9 - v8).Magnitude / 6)))
        v11 = v10 - 1
        v12 = 1
        for i9 = 1, v11, v12 do
            table.insert(v5, v8:Lerp(v9, i9 / v10))
        end
        table.insert(v5, v9)
    end
    v7 = newPolylineCurve(v5)
    debugDrawEradicatePath(v14, Position, v7)
    for i10, i11 in v1:GetDescendants() do
        if i11:IsA("BasePart") then
            i11.CanCollide = false
        end
    end
    slideCharacterAlongCurve(Character, v7, 0.8, v1)
    u47 = os.clock()
    return true
end
v3.settings = v2
return v3