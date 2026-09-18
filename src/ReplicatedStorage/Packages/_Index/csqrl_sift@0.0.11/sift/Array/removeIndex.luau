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
--   File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.removeIndex
--                              Dumped in 0.000155 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2) -- Line: 19
    local v1
    local v2 = {}
    if p2 >= 1 then
        v1 = p2
    else
        v1 = p2 + #p1
    end
    for i, v in ipairs(p1) do
        if i ~= v1 then
            table.insert(v2, v)
        end
    end
    return v2
end