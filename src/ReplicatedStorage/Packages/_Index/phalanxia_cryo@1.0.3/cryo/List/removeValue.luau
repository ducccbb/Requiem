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
--  File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.removeValue
--                              Dumped in 0.000150 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2) -- Line: 4
    local v1, v2
    local v3 = {}
    local v4 = 1
    local v5 = #p1
    local v6 = 1
    v1, v2 = p1, p2
    for i = 1, v5, v6 do
        if v1[i] ~= v2 then
            v3[v4] = v1[i]
            v4 = v4 + 1
        end
    end
    return v3
end