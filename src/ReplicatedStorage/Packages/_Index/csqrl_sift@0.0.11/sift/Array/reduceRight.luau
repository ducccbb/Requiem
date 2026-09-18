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
--   File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.reduceRight
--                              Dumped in 0.000176 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 28
    local v1 = p3
    local v2 = #p1
    if v1 == nil then
        v1 = p1[v2]
        v2 = v2 - 1
    end
    local v3 = 1
    local v4 = -1
    for i = v2, v3, v4 do
        v1 = p2(v1, p1[i], i, p1)
    end
    return v1
end