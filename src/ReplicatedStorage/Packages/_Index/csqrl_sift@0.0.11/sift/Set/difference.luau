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
--     File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set.difference
--                              Dumped in 0.000178 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Types)
return function(p1, ...) -- Line: 21
    local v1, v2, v3
    local v4 = table.clone(p1)
    local v5 = {...}
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        if typeof(j) == "table" then
            v1 = j
            v2 = nil
            v3 = nil
            for k in v1, v2, v3 do
                v4[k] = nil
            end
        end
    end
    return v4
end