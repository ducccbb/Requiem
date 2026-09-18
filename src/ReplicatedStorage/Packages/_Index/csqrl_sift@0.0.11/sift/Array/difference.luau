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
--    File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.difference
--                              Dumped in 0.000216 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Types)
local toSet = require(script.Parent.toSet)
local toArray = require(script.Parent.Parent.Set.toArray)
local difference = require(script.Parent.Parent.Set.difference)
return function(p1, ...) -- Line: 25 -- upvalues: toSet (val), difference (val), toArray (val)
    local v1 = toSet(p1)
    local v2 = {}
    local v3 = {...}
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if typeof(j) == "table" then
            table.insert(v2, toSet(j))
        end
    end
    v3 = difference(v1, unpack(v2))
    return toArray(v3)
end