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
--       File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.find
--                              Dumped in 0.000145 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 25
    local v1, v2, v3
    if type(p3) ~= "number" then
        v3 = 1
        v1, v2 = p1, p2
    elseif p3 >= 1 then
        v1, v2, v3 = p1, p2, p3
    else
        v3 = #p1 + p3
        v1, v2 = p1, p2
    end
    return table.find(v1, v2, v3)
end