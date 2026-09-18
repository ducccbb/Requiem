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
--     File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.findLast
--                              Dumped in 0.000193 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 20
    local v1, v2, v3
    local v4 = #p1
    if type(p3) ~= "number" then
        v3 = v4
        v1, v2 = p1, p2
    elseif p3 >= 1 then
        v3, v1, v2 = p3, p1, p2
    else
        v3 = v4 + p3
        v1, v2 = p1, p2
    end
    local v5 = 1
    local v6 = -1
    for i = v3, v5, v6 do
        if v1[i] == v2 then
            return i
        end
    end
end