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
--       File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set.delete
--                              Dumped in 0.000124 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, ...) -- Line: 20
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = true
    end
    local v2 = {...}
    for i, i2 in ipairs(v2) do
        v1[i2] = nil
    end
    return v1
end