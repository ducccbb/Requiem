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
--      File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.join
--                              Dumped in 0.000203 seconds
--                          Bytecode version 9  |  2 functions

local None = require(script.Parent.Parent.None)
return function(...) -- Line: 6 -- upvalues: None (val)
    local v1, v2, v3, v4
    local v5 = {}
    local v6 = select("#", ...)
    local v7 = 1
    for i = 1, v6, v7 do
        v1 = select(i, ...)
        v2 = #v5
        v3 = #v1
        v4 = 1
        for j = 1, v3, v4 do
            if v1[j] ~= None then
                v5[v2 + j] = v1[j]
            else
                v2 = v2 - 1
            end
        end
    end
    return v5
end