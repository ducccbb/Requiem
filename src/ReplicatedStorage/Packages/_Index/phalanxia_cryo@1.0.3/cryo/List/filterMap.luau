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
--   File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.filterMap
--                              Dumped in 0.000156 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2) -- Line: 7
    local v1, v2, v3
    local v4 = {}
    local v5 = 1
    local v6 = #p1
    local v7 = 1
    v2, v1 = p2, p1
    for i = 1, v6, v7 do
        v3 = v2(v1[i], i)
        if v3 ~= nil then
            v4[v5] = v3
            v5 = v5 + 1
        end
    end
    return v4
end