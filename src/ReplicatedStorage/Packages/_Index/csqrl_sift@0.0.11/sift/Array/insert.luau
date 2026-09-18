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
--      File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.insert
--                              Dumped in 0.000242 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, ...) -- Line: 21
    local v1
    local v2 = #p1
    if p2 >= 1 then
        v1 = p2
    else
        v1 = p2 + (v2 + 1)
    end
    if v2 >= v1 then
        local v3
        local v4 = {}
        local v5 = v2
        local v6 = 1
        local v7 = p1
        for i = 1, v5, v6 do
            if i == v1 then
                v3 = {...}
                for i2, v in ipairs(v3) do
                    table.insert(v4, v)
                end
            end
            table.insert(v4, v7[i])
        end
        return v4
    else
        if v2 + 1 < v1 then
            return p1
        end
        v1 = v2 + 1
        v2 = v2 + 1
    end
end