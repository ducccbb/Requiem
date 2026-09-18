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
--    File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set.intersection
--                              Dumped in 0.000188 seconds
--                          Bytecode version 9  |  2 functions

return function(...) -- Line: 20
    local v1, v2, v3
    local v4 = select("#", ...)
    local v5 = select(1, ...)
    local v6 = {}
    for k, v in pairs(v5) do
        v2 = true
        v3 = v4
        v1 = 1
        for i = 2, v3, v1 do
            if select(i, ...)[k] ~= true then
                v2 = false
                break
            end
        end
        if v2 then
            v6[k] = true
        end
    end
    return v6
end