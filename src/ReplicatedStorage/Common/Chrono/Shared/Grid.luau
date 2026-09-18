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
--                   File: ReplicatedStorage.Common.Chrono.Shared.Grid
--                               Dumped in 0.00116 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local u13 = {}
local u14 = 0
local u15 = {}
local u16 = {}
local function HashPosition(p1) -- Line: 24
    local v1 = p1.x // 50 + 0.5
    return (vector.create(v1, 0, p1.z // 50 + 0.5))
end
local function DotMagnitude(p1) -- Line: 28
    return (vector.dot(p1, p1))
end
local function RemoveOld(p1, p2, p3) -- Line: 32 -- upvalues: u15 (val)
    local v1 = u15[p3]
    if not v1 then
        return
    end
    local v2 = table.find(v1[p2], p1)
    if not v2 then
        return
    end
    table.remove(v1[p2], v2)
    if #v1[p2] == 0 then
        v1[p2] = nil
    end
    if next(v1) == nil then
        u15[p3] = nil
    end
end
local function AddNew(p1, p2, p3) -- Line: 52 -- upvalues: u15 (val), u13 (val)
    local v1 = u15[p3]
    if not v1 then
        v1 = {}
    end
    local v2 = v1[p2]
    if not v2 then
        v2 = {}
    end
    v1[p2] = v2
    u15[p3] = v1
    table.insert(v1[p2], p1)
    u13[p1] = p3
end
function u12.UpdateGrid() -- Line: 61 -- upvalues: u14 (ref), u16 (val), HashPosition (val), u13 (val), RemoveOld (val), AddNew (val)
    local v1, v2
    local v3 = os.clock()
    local v4 = v3 - u14
    if v4 < 2 then
        return
    end
    v4 = u16
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = HashPosition(i:GetPivot().Position)
        v2 = u13[i]
        if v2 ~= v1 then
            if v2 then
                RemoveOld(i, j, v2)
            end
            AddNew(i, j, v1)
        end
    end
    u14 = v3
end
local function ProcessEntities(p1, p2, p3, p4) -- Line: 84 -- upvalues: DotMagnitude (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if DotMagnitude(j:GetPivot().Position - p2) <= p3 then
            table.insert(p4, j)
        end
    end
end
local function ProcessCell(p1, p2, p3, p4, p5) -- Line: 98 -- upvalues: ProcessEntities (val)
    local v1, v2, v3, v4
    if not p2 then
        v2 = p1
        v3 = nil
        v4 = nil
        for i, j in v2, v3, v4 do
            ProcessEntities(j, p3, p4, p5)
        end
        return
    end
    v2 = p2
    v3 = nil
    v4 = nil
    for k, n in v2, v3, v4 do
        v1 = p1[n]
        if v1 then
            ProcessEntities(v1, p3, p4, p5)
        end
    end
end
function u12.QueryGrid(p1, p2, p3) -- Line: 119 -- upvalues: u12 (val), HashPosition (val), u15 (val), ProcessCell (val)
    local v1, v2, v3, v4, v5, v6
    u12.UpdateGrid()
    local v7 = math.ceil(p2 / 50)
    local v8 = HashPosition(p1)
    local v9 = v8.x - v7
    local v10 = v8.z - v7
    local v11 = v8.z + v7
    local v12 = {}
    local v13 = p2 * p2
    local v14 = v8.x + v7
    local v15 = 1
    v1, v6 = p1, p3
    for i = v9, v14, v15 do
        v2 = v11
        v3 = 1
        for j = v10, v2, v3 do
            v4 = vector.create(i, 0, j)
            v5 = u15[v4]
            if v5 then
                ProcessCell(v5, v6, v1, v13, v12)
            end
        end
    end
    return v12
end
function u12.AddEntity(p1, p2) -- Line: 143 -- upvalues: u16 (val)
    u16[p1] = p2
end
function u12.RemoveEntity(p1) -- Line: 147 -- upvalues: u13 (val), RemoveOld (val), u16 (val)
    if not p1 then
        return
    end
    if u13[p1] then
        RemoveOld(p1, u16[p1], u13[p1])
    end
    u16[p1] = nil
    u13[p1] = nil
end
function u12.GetNearbyEntities(p1, p2, p3) -- Line: 158 -- upvalues: u12 (val)
    if not p1 then
        return {}
    end
    return u12.QueryGrid(p1:GetPivot().Position, p2, p3)
end
return u12