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
--      File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.slice
--                              Dumped in 0.000194 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 21
    local v1, v2
    local v3 = #p1
    local v4 = {}
    if type(p2) ~= "number" then
        v1 = 1
    else
        v1 = p2
    end
    if type(p3) ~= "number" then
        v2 = v3
    else
        v2 = p3
    end
    if v1 < 1 then
        v1 = v1 + v3
    end
    if v2 < 1 then
        v2 = v2 + v3
    end
    local v5 = v2
    local v6 = 1
    for i = v1, v5, v6 do
        table.insert(v4, p1[i])
    end
    return v4
end