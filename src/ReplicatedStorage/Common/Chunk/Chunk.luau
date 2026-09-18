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
--                      File: ReplicatedStorage.Common.Chunk.Chunk
--                               Dumped in 0.00139 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u15 = Vector2.new(2048, 2048)
local function getChunkFromPosition(p1) -- Line: 19 -- upvalues: u15 (val)
    local v1 = math.floor(p1.X / u15.X)
    local v2 = math.floor(p1.Z / u15.Y)
    return Vector2.new(v1, v2)
end
local function getChunkCenterPosition(p1) -- Line: 30 -- upvalues: u15 (val)
    local v1 = p1.X * u15.X + u15.X / 2
    local v2 = p1.Y * u15.Y + u15.Y / 2
    return (Vector3.new(v1, 0, v2))
end
local function getChunkBounds(p1) -- Line: 41 -- upvalues: u15 (val)
    local v1 = p1.X * u15.X
    local v2 = p1.Y * u15.Y
    return {min = Vector3.new(v1, -math.huge, v2), max = Vector3.new(v1 + u15.X, math.huge, v2 + u15.Y)}
end
return {
    CHUNK_SIZE = u15,
    getChunkFromPosition = getChunkFromPosition,
    getChunkCenterPosition = getChunkCenterPosition,
    getChunkBounds = getChunkBounds,
    getChunkCorners = function(p1) -- Line: 58 -- upvalues: getChunkBounds (val)
        local v1 = getChunkBounds(p1)
        local v2 = {}
        local v3 = Vector3.new(v1.min.X, 0, v1.min.Z)
        local v4 = Vector3.new(v1.max.X, 0, v1.min.Z)
        local v5 = Vector3.new(v1.min.X, 0, v1.max.Z)
        v2[1] = v3
        v2[2] = v4
        v2[3] = v5
        v2[4] = (Vector3.new(v1.max.X, 0, v1.max.Z))
        return v2
    end,
    isPositionInChunk = function(p1, p2) -- Line: 74 -- upvalues: getChunkBounds (val)
        local v1 = getChunkBounds(p2)
        local v2 = if v1.min.X <= p1.X then if p1.X < v1.max.X then if v1.min.Z <= p1.Z then p1.Z < v1.max.Z else false else false else false
        return v2
    end,
    getChunkFromChunkCoordinates = function(p1, p2) -- Line: 88
        return Vector2.new(p1, p2)
    end,
    getChunkId = function(p1) -- Line: 97
        return string.format("chunk_%d_%d", p1.X, p1.Y)
    end,
    getChunkFromId = function(p1) -- Line: 106
        local v1, v2
        v1, v2 = string.match(p1, "chunk_(%-?%d+)_(%-?%d+)")
        if not v1 or not v2 then
            return nil
        end
        local v3 = tonumber(v1)
        return Vector2.new(v3, (tonumber(v2)))
    end,
    getChunksInRadius = function(p1, p2) -- Line: 120 -- upvalues: getChunkFromPosition (val), u15 (val), getChunkCenterPosition (val)
        local v1, v2, v3, v4, v5
        local v6 = getChunkFromPosition(p1)
        local v7 = {}
        local v8 = math.ceil(p2 / u15.X) + 1
        local v9 = v8
        local v10 = 1
        v1, v2 = p1, p2
        for i = -v8, v9, v10 do
            v4 = v8
            v5 = 1
            for j = -v8, v4, v5 do
                v3 = Vector2.new(v6.X + i, v6.Y + j)
                if (v1 - getChunkCenterPosition(v3)).Magnitude <= v2 + u15.X / 2 then
                    table.insert(v7, v3)
                end
            end
        end
        return v7
    end,
    getChunksInRange = function(p1, p2) -- Line: 150
        local Y, v1, v2, v3
        local v4 = {}
        local X = p2.X
        local v5 = 1
        v1, v2 = p1, p2
        for i = p1.X, X, v5 do
            Y = v2.Y
            v3 = 1
            for j = v1.Y, Y, v3 do
                table.insert(v4, Vector2.new(i, j))
            end
        end
        return v4
    end,
    getAdjacentChunks = function(p1) -- Line: 167
        local v1, v2
        local v3 = {}
        local v4 = 1
        local v5 = 1
        local v6 = p1
        for i = -1, v4, v5 do
            v1 = 1
            v2 = 1
            for j = -1, v1, v2 do
                if i ~= 0 then
                    table.insert(v3, Vector2.new(v6.X + i, v6.Y + j))
                elseif j == 0 then
                end
            end
        end
        return v3
    end,
    getChunkDistance = function(p1, p2) -- Line: 188
        local v1 = (p1.X - p2.X) ^ 2
        return (math.sqrt(v1 + (p1.Y - p2.Y) ^ 2))
    end,
    getChunkWorldDistance = function(p1, p2) -- Line: 198 -- upvalues: getChunkCenterPosition (val)
        local v1 = getChunkCenterPosition(p1)
        return (v1 - getChunkCenterPosition(p2)).Magnitude
    end,
    chunksIntersect = function(p1, p2) -- Line: 210
        local v1 = if p1.X == p2.X then p1.Y == p2.Y else false
        return v1
    end,
    getChunkArea = function(p1) -- Line: 219 -- upvalues: u15 (val)
        return u15.X * u15.Y
    end,
    getChunkPerimeter = function(p1) -- Line: 228 -- upvalues: u15 (val)
        return 2 * (u15.X + u15.Y)
    end,
}