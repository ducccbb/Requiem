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
--                  File: ReplicatedStorage.Common.Equipment.StackMerge
--                              Dumped in 0.000278 seconds
--                          Bytecode version 9  |  4 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local function normalizeTagsForMergeKey(p1) -- Line: 10
    local v1 = {}
    local v2 = p1
    if not v2 then
        v2 = {}
    end
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        table.insert(v1, (tostring(j)))
    end
    table.sort(v1)
    return v1
end
local function getStackMergeKey(p1, p2) -- Line: 22 -- upvalues: normalizeTagsForMergeKey (val)
    local v1 = normalizeTagsForMergeKey(p2)
    return (("%*:%*"):format(p1, (table.concat(v1, ","))))
end
v1 = {getStackMergeKey = getStackMergeKey}
function v1.canStackItemsMerge(p1, p2, p3) -- Line: 27 -- upvalues: getStackMergeKey (val)
    local v1 = getStackMergeKey(p1, p2)
    local v2 = v1 == getStackMergeKey(p1, p3)
    return v2
end
return v1