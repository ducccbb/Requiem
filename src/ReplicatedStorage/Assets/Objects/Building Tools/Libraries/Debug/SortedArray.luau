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
--   File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Debug.SortedArray
--                              Dumped in 0.000964 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local sort = table.sort
local insert = table.insert
local u14 = {}
local v2 = {__mode = "k"}
local u18 = setmetatable({}, v2)
local v3 = {Unpack = unpack, Concat = table.concat, RemoveIndex = table.remove}
u14.__index = v3
function u14.new(p1, p2) -- Line: 23 -- upvalues: sort (val), u18 (val), u14 (val)
    local v1
    if not p1 then
        v1 = {}
    else
        sort(p1, p2)
        v1 = p1
    end
    u18[v1] = p2
    return (setmetatable(v1, u14))
end
local function FindClosest(p1, p2, p3, p4, p5, p6) -- Line: 34 -- upvalues: u18 (val)
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = p3 + p4
    local v9 = (v8 - v8 % 2) / 2
    if v9 == 0 then
        return nil
    end
    v8 = p6
    if not v8 then
        v8 = u18[p1]
    end
    local v10 = p1[v9]
    v5, v6, v2, v1, v4 = p4, p5, p2, p1, p3
    while v9 ~= v5 do
        if not v6 then
            if v2 == v10 then
                return v9
            end
            if not v8 then
                v7 = v2 < v10
            else
                v7 = v8(v2, v10)
            end
            if not v7 then
                v4 = v9 + 1
            else
                v5 = v9 - 1
            end
            v3 = v4 + v5
            v10 = v1[(v3 - v3 % 2) / 2]
        elseif v6(v2, v10) then
            return v9
        end
    end
    return v9
end
function u14.__index:Insert(p2) -- Line: 78 -- upvalues: FindClosest (val), u18 (val), insert (val)
    local v1 = FindClosest(self, p2, 1, #self)
    local v2 = self[v1]
    if not v2 then
        v1 = 1
    else
        local v3, v4
        local v5 = u18[self]
        if not v5 then
            v3 = p2 < v2
        else
            v3 = v5(p2, v2)
        end
        if not v3 then
            v4 = v1 + 1
        else
            v4 = v1
            if not v4 then
                v4 = v1 + 1
            end
        end
        v1 = v4
    end
    insert(self, v1, p2)
    return v1
end
function u14.__index:Find(p2, p3, p4, p5, p6) -- Line: 104 -- upvalues: FindClosest (val)
    local v1
    local v2 = p6
    if not v2 then
        v2 = #self
    end
    local v3 = FindClosest(self, p2, p5 or 1, v2, p3, p4)
    local v4 = nil
    if v3 then
        if not p3 then
            v4 = p2 == self[v3]
        else
            v4 = p3(p2, self[v3])
        end
    end
    if not v4 then
        v1 = nil
    else
        v1 = v3
        if not v1 then
            v1 = nil
        end
    end
    return v1
end
function u14.__index.Copy(p1) -- Line: 122
    local v1 = {}
    local v2 = #p1
    local v3 = 1
    for i = 1, v2, v3 do
        v1[i] = p1[i]
    end
    return v1
end
function u14.__index.Clone(p1) -- Line: 132 -- upvalues: u18 (val), u14 (val)
    local v1 = {}
    local v2 = #p1
    local v3 = 1
    for i = 1, v2, v3 do
        v1[i] = p1[i]
    end
    u18[v1] = u18[p1]
    return (setmetatable(v1, u14))
end
function u14.__index:RemoveElement(p2, p3, p4) -- Line: 143
    local v1 = self:Find(p2, p3, p4)
    if v1 then
        return self:RemoveIndex(v1)
    end
end
function u14.__index.Sort(p1) -- Line: 151 -- upvalues: sort (val), u18 (val)
    sort(p1, u18[p1])
end
function u14.__index.SortIndex(p1, p2) -- Line: 155
    return p1:Insert(p1:RemoveIndex(p2))
end
function u14.__index.SortElement(p1, p2, p3, p4) -- Line: 162
    return p1:Insert(p1:RemoveElement(p2, p3, p4))
end
function u14.__index.GetIntersection(p1, p2, p3, p4) -- Line: 169 -- upvalues: u14 (val), u18 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    if u14 ~= getmetatable(p2) then
        v7 = typeof(p2)
        error("bad argument #2 to GetIntersection: expected SortedArray, got " .. v7 .. " " .. tostring(p2))
    end
    local v9 = u14.new(nil, u18[p1])
    local v10 = 0
    local v11 = 1
    v7 = #p1
    local v12 = #p2
    if v12 >= v7 then
        v1, v2 = p1, p2
    else
        v8 = v12
        v12 = v7
        v7 = v8
        v2 = p1
        v1 = p2
    end
    v8 = v7
    local v13 = 1
    v5, v6 = p3, p4
    for i = 1, v8, v13 do
        v3 = v1[i]
        v4 = v2:Find(v3, v5, v6, v11, v12)
        if v4 then
            v11 = v4
            v10 = v10 + 1
            v9[v10] = v3
        end
    end
    return v9
end
return u14