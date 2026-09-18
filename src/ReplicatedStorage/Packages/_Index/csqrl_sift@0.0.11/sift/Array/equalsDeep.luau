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
--    File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.equalsDeep
--                              Dumped in 0.000276 seconds
--                          Bytecode version 9  |  3 functions

local compareDeep
local Util = require(script.Parent.Parent.Util)
function compareDeep(p1, p2) -- Line: 6 -- upvalues: compareDeep (val)
    local v1
    if type(p1) ~= "table" or type(p2) ~= "table" then
        v1 = p1 == p2
        return v1
    end
    v1 = #p1
    if #p2 ~= v1 then
        return false
    end
    local v2 = v1
    local v3 = 1
    for i = 1, v2, v3 do
        if not (compareDeep(p1[i], p2[i])) then
            return false
        end
    end
    return true
end
return function(...) -- Line: 44 -- upvalues: Util (val), compareDeep (val)
    local v1
    if Util.equalObjects(...) then
        return true
    end
    local v2 = select("#", ...)
    local v3 = select(1, ...)
    local v4 = v2
    local v5 = 1
    for i = 2, v4, v5 do
        v1 = select(i, ...)
        if not (compareDeep(v3, v1)) then
            return false
        end
    end
    return true
end