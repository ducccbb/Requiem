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
--          File: ReplicatedStorage.Common.Utilities.Lightning.PartCache.Table
--                              Dumped in 0.000483 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u13 = Random.new()
local u14 = {}
for k, v in pairs(table) do
    u14[k] = v
end
function u14.contains(p1, p2) -- Line: 37 -- upvalues: u14 (val)
    local v1 = u14.indexOf(p1, p2) ~= nil
    return v1
end
function u14.indexOf(p1, p2) -- Line: 42 -- upvalues: u14 (val)
    local v1 = table.find(p1, p2)
    if v1 then
        return v1
    end
    return u14.keyOf(p1, p2)
end
function u14.keyOf(p1, p2) -- Line: 53
    for k, v in pairs(p1) do
        if v == p2 then
            return k
        end
    end
    return nil
end
function u14.skip(p1, p2) -- Line: 63
    return table.move(p1, p2 + 1, #p1, 1, table.create(#p1 - p2))
end
function u14.take(p1, p2) -- Line: 68
    return table.move(p1, 1, p2, 1, table.create(p2))
end
function u14.range(p1, p2, p3) -- Line: 73
    return table.move(p1, p2, p3, 1, table.create(p3 - p2 + 1))
end
function u14.skipAndTake(p1, p2, p3) -- Line: 78
    return table.move(p1, p2 + 1, p2 + p3, 1, table.create(p3))
end
function u14.random(p1) -- Line: 83 -- upvalues: u13 (val)
    return p1[u13:NextInteger(1, #p1)]
end
function u14.join(p1, p2) -- Line: 88
    local v1 = table.create(#p1 + #p2)
    return table.move(p2, 1, #p2, #p1 + 1, v1)
end
function u14.removeObject(p1, p2) -- Line: 95 -- upvalues: u14 (val)
    local v1 = u14.indexOf(p1, p2)
    if v1 then
        table.remove(p1, v1)
    end
end
function u14.expand(p1, p2) -- Line: 104
    if p2 < 0 then
        error("Cannot expand a table by a negative amount of objects.")
    end
    local v1 = table.create(#p1 + p2)
    local v2 = #p1
    local v3 = 1
    for i = 1, v2, v3 do
        v1[i] = p1[i]
    end
    return v1
end
return u14