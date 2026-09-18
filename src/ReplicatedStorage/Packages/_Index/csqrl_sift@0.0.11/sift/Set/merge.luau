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
--       File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set.merge
--                              Dumped in 0.000176 seconds
--                          Bytecode version 9  |  2 functions

return function(...) -- Line: 20
    local v1
    local v2 = {}
    local v3 = select("#", ...)
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = select(i, ...)
        if type(v1) == "table" then
            for k, v in pairs(v1) do
                v2[k] = true
            end
        end
    end
    return v2
end