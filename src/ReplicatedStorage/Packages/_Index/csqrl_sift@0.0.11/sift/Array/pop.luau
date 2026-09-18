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
--       File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.pop
--                              Dumped in 0.000161 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2) -- Line: 20
    local v1
    local v2 = {}
    if type(p2) ~= "number" then
        v1 = 1
    else
        v1 = p2
    end
    local v3 = #p1 - v1
    local v4 = 1
    for i = 1, v3, v4 do
        table.insert(v2, p1[i])
    end
    return v2
end