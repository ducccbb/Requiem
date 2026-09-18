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
--      File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.zipAll
--                              Dumped in 0.000262 seconds
--                          Bytecode version 9  |  3 functions

local reduce = require(script.Parent.reduce)
local None = require(script.Parent.Parent.None)
return function(...) -- Line: 24 -- upvalues: reduce (val), None (val)
    local v1, v2, v3
    local v4 = select("#", ...)
    local v5 = {...}
    local v6 = {}
    if v4 == 0 then
        return v6
    end
    local v7 = reduce(v5, function(p1, p2) -- Line: 33
        return (math.max(p1, #p2))
    end, #v5[1])
    local v8 = v7
    local v9 = 1
    for i = 1, v8, v9 do
        v3 = {}
        for i2, v in ipairs(v5) do
            v1 = v[i]
            if v1 ~= nil then
                v2 = v1
            else
                v2 = None
            end
            table.insert(v3, v2)
        end
        table.insert(v6, v3)
    end
    return v6
end