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
--       File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.zip
--                              Dumped in 0.000228 seconds
--                          Bytecode version 9  |  3 functions

local reduce = require(script.Parent.reduce)
return function(...) -- Line: 20 -- upvalues: reduce (val)
    local v1
    local v2 = select("#", ...)
    local v3 = {...}
    local v4 = {}
    if v2 == 0 then
        return v4
    end
    local v5 = reduce(v3, function(p1, p2) -- Line: 30
        return (math.min(p1, #p2))
    end, #v3[1])
    local v6 = v5
    local v7 = 1
    for i = 1, v6, v7 do
        v1 = {}
        for i2, v in ipairs(v3) do
            table.insert(v1, v[i])
        end
        table.insert(v4, v1)
    end
    return v4
end