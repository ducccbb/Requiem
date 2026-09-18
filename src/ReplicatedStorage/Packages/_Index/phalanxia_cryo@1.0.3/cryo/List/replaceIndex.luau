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
--  File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.replaceIndex
--                              Dumped in 0.000172 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 5
    local v1, v2, v3
    local v4 = {}
    local v5 = #p1
    local v6 = p2 <= v5
    assert(v6, "index must be less or equal than the list length")
    local v7 = v5
    v6 = 1
    v2, v3, v1 = p2, p3, p1
    for i = 1, v7, v6 do
        if i ~= v2 then
            v4[i] = v1[i]
        else
            v4[i] = v3
        end
    end
    return v4
end