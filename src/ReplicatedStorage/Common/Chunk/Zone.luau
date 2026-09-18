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
--                       File: ReplicatedStorage.Common.Chunk.Zone
--                               Dumped in 0.00444 seconds
--                          Bytecode version 9  |  41 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local FullAreaLine = Objects:WaitForChild("FullAreaLine")
local AreaLine = Objects:WaitForChild("AreaLine")
local Chunk = require(v1.Parent:WaitForChild("Chunk"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Wireframe = require(Utilities:WaitForChild("Wireframe"))
local u80 = Vector2.new(256, 256)
local v3 = Vector2.new(8, 8)
local function getZoneRegionFolder() -- Line: 58 -- upvalues: RunService (val), Workspace (val)
    local v1
    if not (RunService:IsServer()) then
        v1 = Workspace:WaitForChild("Zones")
        return v1
    end
    v1 = Workspace:FindFirstChild("Zones")
    if v1 then
        return v1
    end
    local Folder = Instance.new("Folder")
    Folder.Name = "Zones"
    Folder.Parent = Workspace
    return Folder
end
local function worldToLocalPosition(p1, p2) -- Line: 178 -- upvalues: Chunk (val)
    return p1 - Chunk.getChunkCenterPosition(p2)
end
local function localToWorldPosition(p1, p2) -- Line: 189 -- upvalues: Chunk (val)
    return p1 + Chunk.getChunkCenterPosition(p2)
end
local function getZoneFromPosition(p1) -- Line: 199 -- upvalues: Chunk (val), worldToLocalPosition (val), u80 (val)
    local v1 = Chunk.getChunkFromPosition(p1)
    local v2 = worldToLocalPosition(p1, v1)
    local v3 = math.floor((v2.X + Chunk.CHUNK_SIZE.X / 2) / u80.X)
    local v4 = math.floor((v2.Z + Chunk.CHUNK_SIZE.Y / 2) / u80.Y)
    v3 = math.max(0, (math.min(7, v3)))
    v4 = math.max(0, (math.min(7, v4)))
    local v5 = Vector3.new(v3 * u80.X - Chunk.CHUNK_SIZE.X / 2 + u80.X / 2, 0, v4 * u80.Y - Chunk.CHUNK_SIZE.Y / 2 + u80.Y / 2)
    return {location = CFrame.new(v5), size = Vector2.new(u80.X, u80.Y), chunk = v1}
end
local function getZoneWorldPosition(p1) -- Line: 228 -- upvalues: localToWorldPosition (val)
    return localToWorldPosition(p1.location.Position, p1.chunk)
end
local function getZoneGridPosition(p1) -- Line: 239 -- upvalues: Chunk (val), u80 (val)
    local Position = p1.location.Position
    local v1 = math.floor((Position.X + Chunk.CHUNK_SIZE.X / 2) / u80.X)
    local v2 = math.floor((Position.Z + Chunk.CHUNK_SIZE.Y / 2) / u80.Y)
    return Vector2.new(v1, v2)
end
local function getZoneFromGridPosition(p1, p2) -- Line: 252 -- upvalues: u80 (val), Chunk (val)
    local v1 = Vector3.new(p2.X * u80.X - Chunk.CHUNK_SIZE.X / 2 + u80.X / 2, 0, p2.Y * u80.Y - Chunk.CHUNK_SIZE.Y / 2 + u80.Y / 2)
    return {location = CFrame.new(v1), size = Vector2.new(u80.X, u80.Y), chunk = p1}
end
local function getAllZonesFromChunk(p1) -- Line: 269 -- upvalues: getZoneFromGridPosition (val)
    local v1, v2, v3, v4
    local v5 = {}
    local v6 = 7
    local v7 = 1
    local v8 = p1
    for i = 0, v6, v7 do
        v1 = 7
        v2 = 1
        for j = 0, v1, v2 do
            v3 = Vector2.new(i, j)
            v4 = getZoneFromGridPosition(v8, v3)
            table.insert(v5, v4)
        end
    end
    return v5
end
local function getZoneFromWorldPosition(p1) -- Line: 304 -- upvalues: Chunk (val), worldToLocalPosition (val), u80 (val), getZoneFromGridPosition (val)
    local v1 = Chunk.getChunkFromPosition(p1)
    local v2 = worldToLocalPosition(p1, v1)
    local v3 = math.floor((v2.X + Chunk.CHUNK_SIZE.X / 2) / u80.X)
    local v4 = math.floor((v2.Z + Chunk.CHUNK_SIZE.Y / 2) / u80.Y)
    v3 = math.max(0, (math.min(7, v3)))
    v4 = math.max(0, (math.min(7, v4)))
    return getZoneFromGridPosition(v1, Vector2.new(v3, v4))
end
local function isPositionInZone(p1, p2) -- Line: 325 -- upvalues: getZoneWorldPosition (val), u80 (val)
    local v1 = getZoneWorldPosition(p2)
    local v2 = u80 / 2
    local v3 = false
    local v4 = math.abs(p1.X - v1.X)
    if v4 <= v2.X then
        v4 = math.abs(p1.Z - v1.Z)
        v3 = v4 <= v2.Y
    end
    return v3
end
local function getAdjacentZones(p1) -- Line: 338 -- upvalues: getZoneGridPosition (val), getZoneFromGridPosition (val)
    local v1, v2, v3, v4, v5
    local v6 = getZoneGridPosition(p1)
    local v7 = {}
    local v8 = 1
    local v9 = 1
    local v10 = p1
    for i = -1, v8, v9 do
        v3 = 1
        v4 = 1
        for j = -1, v3, v4 do
            if i ~= 0 then
                v5 = v6.X + i
                v1 = v6.Y + j
                if 0 <= v5 and v5 < 8 and 0 <= v1 and v1 < 8 then
                    v2 = getZoneFromGridPosition(v10.chunk, Vector2.new(v5, v1))
                    table.insert(v7, v2)
                end
            elseif j == 0 then
            end
        end
    end
    return v7
end
local function getZoneBounds(p1) -- Line: 431 -- upvalues: getZoneWorldPosition (val), u80 (val)
    local v1 = getZoneWorldPosition(p1)
    local v2 = u80 / 2
    return {min = Vector3.new(v1.X - v2.X, v1.Y - v2.Y, v1.Z - v2.Y), max = Vector3.new(v1.X + v2.X, v1.Y + v2.Y, v1.Z + v2.Y)}
end
local function getZoneCenter(p1) -- Line: 462 -- upvalues: getZoneWorldPosition (val)
    return getZoneWorldPosition(p1)
end
local function getZoneId(p1) -- Line: 471 -- upvalues: getZoneGridPosition (val)
    local v1 = getZoneGridPosition(p1)
    return string.format("chunk_%d_%d_zone_%d_%d", p1.chunk.X, p1.chunk.Y, v1.X, v1.Y)
end
local function zoneToWorldPosition(p1, p2) -- Line: 561 -- upvalues: getZoneWorldPosition (val)
    local v1 = getZoneWorldPosition(p2)
    local v2 = v1.X + p1.X
    local v3 = v1.Z + p1.Z
    return (Vector3.new(v2, p1.Y, v3))
end
getZoneRegionFolder()
return {
    ZONE_SIZE = u80,
    ZONES_PER_CHUNK = 8,
    ZONE_GRID_SIZE = v3,
    canAccessZone = function(p1, p2) -- Line: 638 -- upvalues: RunService (val), Players (val), getZoneRegionFolder (val), getZoneId (val), HttpService (val)
        local LocalPlayer, v1
        if p2 then
            LocalPlayer = p2
        elseif not (RunService:IsClient()) then
            LocalPlayer = p2
        else
            LocalPlayer = Players.LocalPlayer
        end
        if not LocalPlayer then
            return false, false
        end
        local UserId = LocalPlayer.UserId
        local v2 = getZoneRegionFolder():FindFirstChild(getZoneId(p1))
        if not v2 then
            return false, false
        end
        local v3 = HttpService:JSONDecode(v2:GetAttribute("zone"))
        if not v3 then
            return false, false
        end
        local v4 = v3.owner == UserId
        if v3.owner == UserId then
            v1 = true
        else
            v1 = not (not (table.find(v3.access, UserId)))
        end
        return v1, v4
    end,
    getChunkZoneIsWithin = function(p1) -- Line: 168
        return p1.chunk
    end,
    worldToLocalPosition = worldToLocalPosition,
    localToWorldPosition = localToWorldPosition,
    worldToZonePosition = function(p1, p2) -- Line: 545 -- upvalues: getZoneWorldPosition (val)
        local v1 = getZoneWorldPosition(p2)
        local v2 = p1.X - v1.X
        local v3 = p1.Z - v1.Z
        return (Vector3.new(v2, p1.Y, v3))
    end,
    zoneToWorldPosition = zoneToWorldPosition,
    zoneGridToWorldPosition = function(p1, p2, p3) -- Line: 578 -- upvalues: getZoneFromGridPosition (val), zoneToWorldPosition (val)
        local v1 = getZoneFromGridPosition(p1, p2)
        return zoneToWorldPosition(p3, v1)
    end,
    getZoneFromPosition = getZoneFromPosition,
    getZoneWorldPosition = getZoneWorldPosition,
    getZoneFolder = function(p1) -- Line: 588 -- upvalues: getZoneId (val)
        local World = workspace:WaitForChild("World")
        local v1 = getZoneId(p1)
        local v2 = World:FindFirstChild(v1)
        if not v2 then
            v2 = Instance.new("Folder")
            v2.Name = v1
            v2.Parent = World
        end
        return v2
    end,
    getZoneRegionFolder = getZoneRegionFolder,
    getZoneGridPosition = getZoneGridPosition,
    getZoneFromGridPosition = getZoneFromGridPosition,
    getAllZonesFromChunk = getAllZonesFromChunk,
    getAllZoneWorldPositionsFromChunk = function(p1) -- Line: 288 -- upvalues: getAllZonesFromChunk (val), getZoneWorldPosition (val)
        local v1 = getAllZonesFromChunk(p1)
        local v2 = {}
        local v3 = v1
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            table.insert(v2, getZoneWorldPosition(j))
        end
        return v2
    end,
    getZoneFromWorldPosition = getZoneFromWorldPosition,
    isPositionInZone = isPositionInZone,
    getAdjacentZones = getAdjacentZones,
    getZonesInRadius = function(p1, p2) -- Line: 367 -- upvalues: getZoneFromWorldPosition (val), Chunk (val), getAllZonesFromChunk (val), getZoneWorldPosition (val)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = getZoneFromWorldPosition(p1)
        local v10 = {}
        local v11 = math.ceil(p2 / Chunk.CHUNK_SIZE.X) + 1
        local chunk = v9.chunk
        local v12 = v11
        local v13 = 1
        v1, v2 = p1, p2
        for i = -v11, v12, v13 do
            v8 = v11
            v3 = 1
            for j = -v11, v8, v3 do
                v4 = Vector2.new(chunk.X + i, chunk.Y + j)
                v5 = getAllZonesFromChunk(v4)
                v6 = nil
                v7 = nil
                for k, n in v5, v6, v7 do
                    if (v1 - getZoneWorldPosition(n)).Magnitude <= v2 then
                        table.insert(v10, n)
                    end
                end
            end
        end
        return v10
    end,
    getChunksInRadius = function(p1, p2) -- Line: 402 -- upvalues: Chunk (val)
        local v1, v2, v3, v4, v5
        local v6 = Chunk.getChunkFromPosition(p1)
        local v7 = {}
        local v8 = math.ceil(p2 / Chunk.CHUNK_SIZE.X) + 1
        local v9 = v8
        local v10 = 1
        v1, v2 = p1, p2
        for i = -v8, v9, v10 do
            v4 = v8
            v5 = 1
            for j = -v8, v4, v5 do
                v3 = Vector2.new(v6.X + i, v6.Y + j)
                if (v1 - Chunk.getChunkCenterPosition(v3)).Magnitude <= v2 + Chunk.CHUNK_SIZE.X / 2 then
                    table.insert(v7, v3)
                end
            end
        end
        return v7
    end,
    getZoneBounds = getZoneBounds,
    zonesIntersect = function(p1, p2) -- Line: 447 -- upvalues: getZoneBounds (val)
        local v1 = getZoneBounds(p1)
        local v2 = getZoneBounds(p2)
        local v3 = if v1.min.X <= v2.max.X then if v2.min.X <= v1.max.X then if v1.min.Z <= v2.max.Z then v2.min.Z <= v1.max.Z else false else false else false
        return v3
    end,
    getZoneCenter = getZoneCenter,
    getZoneId = getZoneId,
    getZoneFromId = function(p1) -- Line: 481 -- upvalues: getZoneFromGridPosition (val)
        local v1, v2, v3, v4
        v1, v2, v3, v4 = string.match(p1, "chunk_(%-?%d+)_(%-?%d+)_zone_(%d+)_(%d+)")
        if not v1 or not v2 or not v3 or not v4 then
            return nil
        end
        local v5 = tonumber(v1)
        local v6 = Vector2.new(v5, (tonumber(v2)))
        local v7 = tonumber(v3)
        v5 = Vector2.new(v7, (tonumber(v4)))
        if v5.X < 0 or 8 <= v5.X or v5.Y < 0 or 8 <= v5.Y then
            return nil
        end
        return getZoneFromGridPosition(v6, v5)
    end,
    getZonesInChunkRange = function(p1, p2) -- Line: 510 -- upvalues: getAllZonesFromChunk (val)
        local Y, v1, v2, v3, v4, v5, v6, v7
        local v8 = {}
        local X = p2.X
        local v9 = 1
        v1, v2 = p1, p2
        for i = p1.X, X, v9 do
            Y = v2.Y
            v6 = 1
            for j = v1.Y, Y, v6 do
                v7 = Vector2.new(i, j)
                v3 = getAllZonesFromChunk(v7)
                v4 = nil
                v5 = nil
                for k, n in v3, v4, v5 do
                    table.insert(v8, n)
                end
            end
        end
        return v8
    end,
    getZoneDistance = function(p1, p2) -- Line: 533 -- upvalues: getZoneCenter (val)
        local v1 = getZoneCenter(p1)
        return (v1 - getZoneCenter(p2)).Magnitude
    end,
    clampBoundingBoxToZones = function(p1, p2, p3, p4) -- Line: 768 -- upvalues: isPositionInZone (val), getZoneGridPosition (val), getZoneBounds (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
        if #p3 == 0 then
            return p1, nil
        end
        local v17 = p2 / 2
        local Position = p1.Position
        local v18 = {}
        local v19 = Position + Vector3.new(-v17.X, 0, -v17.Z)
        local v20 = Position + Vector3.new(v17.X, 0, -v17.Z)
        local v21 = -v17.X
        local v22 = Position + Vector3.new(v21, 0, v17.Z)
        v18[1] = v19
        v18[2] = v20
        v18[3] = v22
        v18[4] = Position + Vector3.new(v17.X, 0, v17.Z)
        v19 = true
        v20 = v18
        v22 = nil
        local v23 = nil
        v9, v16, v1 = p3, p4, p1
        for i, j in v20, v22, v23 do
            v2 = false
            v3 = v9
            v4 = nil
            v5 = nil
            for k, n in v3, v4, v5 do
                if isPositionInZone(j, n) then
                    v2 = true
                    break
                end
            end
            if not v2 then
                v19 = false
                break
            end
        end
        if v19 then
            v20 = nil
            if v16 then
                v22 = v9
                v23 = nil
                v21 = nil
                for i12, i13 in v22, v23, v21 do
                    if i13.chunk == v16.chunk then
                        v3 = getZoneGridPosition(i13)
                        if v3 == getZoneGridPosition(v16) then
                            v20 = v16
                            break
                        end
                    end
                end
            end
            if not v20 then
                v22 = v9
                v23 = nil
                v21 = nil
                for i14, i15 in v22, v23, v21 do
                    if isPositionInZone(Position, i15) then
                        v20 = i15
                        break
                    end
                end
            end
            if not v20 then
                v20 = v9[1]
            end
            return v1, v20
        end
        v20 = 0
        v22 = 0
        v23 = 0
        v21 = 0
        local v24 = v18
        v2 = nil
        v3 = nil
        for m, i5 in v24, v2, v3 do
            v6 = false
            v7 = v9
            v8 = nil
            v10 = nil
            for i6, i7 in v7, v8, v10 do
                if isPositionInZone(i5, i7) then
                    v6 = true
                    break
                end
            end
            if not v6 then
                v7 = {x = 0, z = 0, distance = math.huge}
                v8 = v9
                v10 = nil
                v11 = nil
                for i8, i9 in v8, v10, v11 do
                    v12 = getZoneBounds(i9)
                    v13 = 0
                    v14 = 0
                    if i5.X < v12.min.X then
                        v13 = v12.min.X - i5.X
                    elseif v12.max.X < i5.X then
                        v13 = v12.max.X - i5.X
                    end
                    if i5.Z < v12.min.Z then
                        v14 = v12.min.Z - i5.Z
                    elseif v12.max.Z < i5.Z then
                        v14 = v12.max.Z - i5.Z
                    end
                    v15 = math.sqrt(v13 * v13 + v14 * v14)
                    if v15 < v7.distance then
                        v7 = {x = v13, z = v14, distance = v15}
                    end
                end
                if v7.x < 0 then
                    v20 = math.min(v20, v7.x)
                elseif 0 < v7.x then
                    v22 = math.max(v22, v7.x)
                end
                if v7.z < 0 then
                    v23 = math.min(v23, v7.z)
                elseif 0 < v7.z then
                    v21 = math.max(v21, v7.z)
                end
            end
        end
        v3 = Vector3.new(Position.X + v20 + v22, Position.Y, Position.Z + v23 + v21)
        v5 = CFrame.new(v3)
        v5 = nil
        v6 = v9
        v7 = nil
        v8 = nil
        for i10, i11 in v6, v7, v8 do
            if isPositionInZone(v3, i11) then
                v5 = i11
                break
            end
        end
        if not v5 then
            v5 = v9[1]
        end
        return v5 * (v1 - v1.Position), v5
    end,
    clampCFrameToZone = function(p1, p2) -- Line: 602 -- upvalues: getZoneBounds (val)
        local Position
        local v1 = RaycastParams.new()
        v1.RespectCanCollide = true
        local Y = 0
        local v2 = p1.Position + Vector3.new(0, 5000, 0)
        local v3 = Vector3.new(0, -6000, 0)
        local v4 = workspace:Raycast(v2, v3, v1)
        if v4 and v4.Position then
            Y = v4.Position.Y
        end
        local v5 = getZoneBounds(p2)
        Position = p1.Position
        v3 = math.max(v5.min.X, (math.min(v5.max.X, Position.X)))
        local v6 = math.max(v5.min.Z, (math.min(v5.max.Z, Position.Z)))
        local v7 = math.clamp(Position.Y, Y - 5, Y + 300)
        local v8 = Vector3.new(v3, v7, v6)
        local v9 = CFrame.new(v8)
        return v9 * (p1 - p1.Position)
    end,
    getConnectedZones = function(p1) -- Line: 672 -- upvalues: getZoneGridPosition (val), getAdjacentZones (val)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        local v10 = {}
        local function zonesEqual(p1, p2) -- Line: 677 -- upvalues: getZoneGridPosition (upval)
            local v1 = false
            if p1.chunk == p2.chunk then
                local v2 = getZoneGridPosition(p1)
                v1 = v2 == getZoneGridPosition(p2)
            end
            return v1
        end
        local function isZoneInList(p1, p2) -- Line: 682 -- upvalues: zonesEqual (val)
            local v1 = p2
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if zonesEqual(p1, j) then
                    return true
                end
            end
            return false
        end
        local v11 = p1
        local v12 = nil
        local v13 = nil
        for i, j in v11, v12, v13 do
            if not (isZoneInList(j, v9)) then
                table.insert(v9, j)
            end
        end
        v11 = true
        local v14 = p1
        while v11 do
            v11 = false
            v12 = {}
            v13 = v9
            v7 = nil
            v8 = nil
            for k, n in v13, v7, v8 do
                if not (isZoneInList(n, v10)) then
                    table.insert(v10, n)
                    v1 = getAdjacentZones(n)
                    v2 = nil
                    v3 = nil
                    for m, i5 in v1, v2, v3 do
                        v4 = v14
                        v5 = nil
                        v6 = nil
                        for i6, i7 in v4, v5, v6 do
                            if zonesEqual(i5, i7) and not (isZoneInList(i5, v9)) then
                                table.insert(v12, i5)
                                v11 = true
                            end
                        end
                    end
                end
            end
            v13 = v12
            v7 = nil
            v8 = nil
            for i8, i9 in v13, v7, v8 do
                table.insert(v9, i9)
            end
        end
        return v9
    end,
    getMergedZoneBounds = function(p1) -- Line: 738 -- upvalues: getZoneBounds (val)
        local v1
        if #p1 == 0 then
            return {min = Vector3.new(0, 0, 0), max = Vector3.new(0, 0, 0)}
        end
        local huge = math.huge
        local v2 = -math.huge
        local huge_2 = math.huge
        local v3 = -math.huge
        local v4 = p1
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v1 = getZoneBounds(j)
            huge = math.min(huge, v1.min.X)
            v2 = math.max(v2, v1.max.X)
            huge_2 = math.min(huge_2, v1.min.Z)
            v3 = math.max(v3, v1.max.Z)
        end
        return {min = Vector3.new(huge, 0, huge_2), max = Vector3.new(v2, 0, v3)}
    end,
    showZoneFullBoundingBox = function(p1, p2) -- Line: 95 -- upvalues: Wireframe (val), CollectionService (val), getZoneRegionFolder (val), FullAreaLine (val), u80 (val)
        local v1 = Wireframe.getModelEdges(p1)
        local v2 = v1[5]
        local v3 = v1[6]
        local v4 = v1[7]
        local v5 = v1[8]
        local CFrame = p1.CFrame
        local v6 = v2[1]:Lerp(v3[1], 0.5)
        local v7 = v3[1]:Lerp(v4[1], 0.5)
        local v8 = v4[1]:Lerp(v5[1], 0.5)
        local v9 = v5[1]:Lerp(v2[1], 0.5)
        local function createLineAloneEdge(a1) -- Line: 110 -- upvalues: p1 (val), CollectionService (upval), getZoneRegionFolder (upval), CFrame (val), FullAreaLine (upval), u80 (upval), p2 (val)
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Exclude
            local v2 = {}
            local Tagged = CollectionService:GetTagged("Alive")
            local World = workspace:WaitForChild("World")
            v2[1] = p1
            v2[2] = Tagged
            v2[3] = World
            v2[4] = getZoneRegionFolder()
            v1.FilterDescendantsInstances = v2
            local v3 = a1.Position + Vector3.new(0, p1.Size.Y / 2 + 5000, 0)
            local v4 = Vector3.new(0, -11000, 0)
            v2 = workspace:Raycast(v3, v4, v1)
            if not v2 then
                return
            end
            local Position = v2.Position
            v3 = CFrame.new(Position, (Vector3.new(CFrame.Position.X, Position.Y, CFrame.Position.Z)))
            v4 = FullAreaLine:Clone()
            v4.Size = Vector3.new(u80.X, 5, 5)
            v4.Anchored = true
            v4.CanCollide = false
            v4.CanTouch = false
            v4.CanQuery = false
            v4.CFrame = v3
            v4.B.Position = Vector3.new(u80.X / 2, 0, 0)
            v4.A.Position = Vector3.new(-u80.X / 2, 0, 0)
            if p2 then
                v4.Beam.Color = ColorSequence.new(p2)
            end
            v4.Parent = p1
        end
        createLineAloneEdge(v6)
        createLineAloneEdge(v7)
        createLineAloneEdge(v8)
        createLineAloneEdge(v9)
    end,
    hideZoneFullBoundingBox = function(p1) -- Line: 82
        for i, j in p1:GetChildren() do
            if j:IsA("BasePart") then
                j:Destroy()
            end
        end
    end,
    showZonePartialBoundingBox = function(p1, p2, p3) -- Line: 923 -- upvalues: Wireframe (val), getZoneGridPosition (val), u80 (val), getZoneFromPosition (val), CollectionService (val), getZoneRegionFolder (val), AreaLine (val)
        local v1 = Wireframe.getModelEdges(p1)
        local v2 = v1[5]
        local v3 = v1[6]
        local v4 = v1[7]
        local v5 = v1[8]
        local CFrame = p1.CFrame
        local v6 = v2[1]:Lerp(v3[1], 0.5)
        local v7 = v3[1]:Lerp(v4[1], 0.5)
        local v8 = v4[1]:Lerp(v5[1], 0.5)
        local v9 = v5[1]:Lerp(v2[1], 0.5)
        local u36 = {}
        local function isZoneAccessible(p1) -- Line: 939 -- upvalues: p3 (val), getZoneGridPosition (upval)
            local v1
            if not p3 then
                return false
            end
            local v2 = p3
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if j.chunk == p1.chunk then
                    v1 = getZoneGridPosition(j)
                    if v1 == getZoneGridPosition(p1) then
                        return true
                    end
                end
            end
            return false
        end
        local function shouldSkipEdge(p1, p2) -- Line: 956 -- upvalues: p3 (val), u80 (upval), getZoneFromPosition (upval), isZoneAccessible (val)
            if not p3 then
                return false
            end
            local v1 = getZoneFromPosition(p1.Position + p2 * (u80.X / 2))
            return isZoneAccessible(v1)
        end
        local function createLineAloneEdge(a1, a2) -- Line: 971 -- upvalues: p1 (val), CollectionService (upval), getZoneRegionFolder (upval), CFrame (val), AreaLine (upval), u80 (upval), p2 (val), u36 (val)
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Exclude
            local v2 = {}
            local Tagged = CollectionService:GetTagged("Alive")
            local World = workspace:WaitForChild("World")
            v2[1] = p1
            v2[2] = Tagged
            v2[3] = World
            v2[4] = getZoneRegionFolder()
            v1.FilterDescendantsInstances = v2
            local v3 = a1.Position + Vector3.new(0, p1.Size.Y / 2 + 5000, 0)
            local v4 = Vector3.new(0, -11000, 0)
            v2 = workspace:Raycast(v3, v4, v1)
            if not v2 then
                return
            end
            local Position = v2.Position
            v3 = CFrame.new(Position, (Vector3.new(CFrame.Position.X, Position.Y, CFrame.Position.Z)))
            v4 = AreaLine:Clone()
            v4.Size = Vector3.new(u80.X, 5, 5)
            v4.Anchored = true
            v4.CanCollide = false
            v4.CanTouch = false
            v4.CanQuery = false
            v4.CFrame = v3
            v4.B.Position = Vector3.new(u80.X / 2, 0, 0)
            v4.A.Position = Vector3.new(-u80.X / 2, 0, 0)
            if p2 then
                v4.Beam.Color = ColorSequence.new(p2)
            end
            v4.Parent = workspace
            table.insert(u36, v4)
        end
        if not (shouldSkipEdge(v6, (Vector3.new(0, 0, 1)))) then
            createLineAloneEdge(v6)
        end
        if not (shouldSkipEdge(v7, (Vector3.new(1, 0, 0)))) then
            createLineAloneEdge(v7)
        end
        if not (shouldSkipEdge(v8, (Vector3.new(0, 0, -1)))) then
            createLineAloneEdge(v8)
        end
        if not (shouldSkipEdge(v9, (Vector3.new(-1, 0, 0)))) then
            createLineAloneEdge(v9)
        end
        return u36
    end,
}