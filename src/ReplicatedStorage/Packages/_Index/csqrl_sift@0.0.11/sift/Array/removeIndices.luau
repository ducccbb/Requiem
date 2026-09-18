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
--  File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.removeIndices
--                              Dumped in 0.000191 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, ...) -- Line: 19
    local v1 = #p1
    local v2 = {}
    local v3 = {}
    local v4 = {...}
    local v5 = p1
    for i, v in ipairs(v4) do
        if v < 1 then
            v = v + v1
        end
        v2[v] = true
    end
    for i2, i3 in ipairs(v5) do
        if not (v2[i2]) then
            table.insert(v3, i3)
        end
    end
    return v3
end