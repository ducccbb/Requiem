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
--                       File: ReplicatedStorage.Common.Chunk.Prop
--                              Dumped in 0.000997 seconds
--                          Bytecode version 9  |  6 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local function getRaycastExcludeList(p1, p2) -- Line: 45 -- upvalues: CollectionService (val)
    local v1 = {p1}
    for i, j in CollectionService:GetTagged("Alive") do
        table.insert(v1, j)
    end
    if p2 then
        table.insert(v1, p2)
    end
    local Zones = workspace:FindFirstChild("Zones")
    if Zones then
        table.insert(v1, Zones)
    end
    return v1
end
local function getFourModelCorners(p1) -- Line: 82
    local BoundingBox, BoundingBox_2, v1
    BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
    local v2 = -BoundingBox_2.Y / 2
    local v3 = {}
    local v4 = Vector3.new(-BoundingBox_2.X / 2, v2, BoundingBox_2.Z / 2)
    local v5 = Vector3.new(BoundingBox_2.X / 2, v2, BoundingBox_2.Z / 2)
    local v6 = Vector3.new(-BoundingBox_2.X / 2, v2, -BoundingBox_2.Z / 2)
    local v7 = BoundingBox_2.X / 2
    v3[1] = v4
    v3[2] = v5
    v3[3] = v6
    v3[4] = (Vector3.new(v7, v2, -BoundingBox_2.Z / 2))
    v4 = {}
    v5 = v3
    v6 = nil
    local v8 = nil
    for i, j in v5, v6, v8 do
        v1 = BoundingBox:PointToWorldSpace(j)
        table.insert(v4, v1)
    end
    return v4
end
local function synthesizeFloorCornerPoints(p1, p2) -- Line: 111
    local BoundingBox, BoundingBox_2, v1
    BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
    local v2 = -BoundingBox_2.Y / 2
    local v3 = {}
    local v4 = Vector3.new(-BoundingBox_2.X / 2, v2, BoundingBox_2.Z / 2)
    local v5 = Vector3.new(BoundingBox_2.X / 2, v2, BoundingBox_2.Z / 2)
    local v6 = Vector3.new(-BoundingBox_2.X / 2, v2, -BoundingBox_2.Z / 2)
    local v7 = BoundingBox_2.X / 2
    v3[1] = v4
    v3[2] = v5
    v3[3] = v6
    v3[4] = (Vector3.new(v7, v2, -BoundingBox_2.Z / 2))
    v4 = {}
    v5 = v3
    v6 = nil
    local v8 = nil
    for i, j in v5, v6, v8 do
        v1 = BoundingBox:PointToWorldSpace(j)
        table.insert(v4, (Vector3.new(v1.X, p2, v1.Z)))
    end
    return v4
end
v1 = {
    getIdFromVector3 = function(p1) -- Line: 64
        local v1 = math.floor(p1.X * 10 + 0.5)
        local v2 = math.floor(p1.Y * 10 + 0.5)
        return (bit32.band(bit32.bxor(v1 * 73856093, v2 * 19349663, math.floor(p1.Z * 10 + 0.5) * 83492791), 4294967295))
    end,
    getFourModelCorners = getFourModelCorners,
}
function v1.getHighestFloorPoint(p1, p2, p3) -- Line: 140 -- upvalues: getFourModelCorners (val), getRaycastExcludeList (val), synthesizeFloorCornerPoints (val)
    local BoundingBox_2, Position_2, v1, v2, v3, v4, v5, v6
    local v7 = getFourModelCorners(p1)
    local v8 = RaycastParams.new()
    v8.FilterType = Enum.RaycastFilterType.Exclude
    v8.FilterDescendantsInstances = getRaycastExcludeList(p1, p2)
    v8.RespectCanCollide = true
    local Y = -math.huge
    local huge = math.huge
    local v9 = {}
    local Position = p1:GetPivot().Position
    table.insert(v7, Position)
    local v10 = v7
    local v11 = nil
    local v12 = nil
    v1, v6 = p1, p3
    for i, j in v10, v11, v12 do
        v4 = j + Vector3.new(0, 5000, 0)
        v5 = Vector3.new(0, -6000, 0)
        v3 = workspace:Raycast(v4, v5, v8)
        if v3 and v3.Position then
            if Y < v3.Position.Y then
                Y = v3.Position.Y
            end
            if v3.Position.Y < huge then
                huge = v3.Position.Y
            end
        end
        if j ~= Position then
            if not v3 then
                Position_2 = j
            elseif v3.Position then
                Position_2 = v3.Position
            end
            table.insert(v9, Position_2)
        end
    end
    _, BoundingBox_2 = v1:GetBoundingBox()
    local floorHeightOverride = v1:GetPivot().Position.Y - BoundingBox_2.Y / 2
    if v6 and v6.floorHeightOverride then
        floorHeightOverride = v6.floorHeightOverride
    end
    if Y == -math.huge then
        return floorHeightOverride, 0, synthesizeFloorCornerPoints(v1, floorHeightOverride)
    end
    if #v9 < 4 then
        v2 = synthesizeFloorCornerPoints(v1, floorHeightOverride)
        if not (v9[1]) then
            v9[1] = v2[1]
        end
        if not (v9[2]) then
            v9[2] = v2[2]
        end
        if not (v9[3]) then
            v9[3] = v2[3]
        end
        if not (v9[4]) then
            v9[4] = v2[4]
        end
    end
    v2 = math.abs(Y - huge)
    return Y, v2, v9
end
return v1