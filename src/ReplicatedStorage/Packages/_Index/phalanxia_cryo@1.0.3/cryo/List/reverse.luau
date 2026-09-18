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
--    File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.reverse
--                              Dumped in 0.000118 seconds
--                          Bytecode version 9  |  2 functions

return function(p1) -- Line: 5
    local v1 = {}
    local v2 = #p1
    local v3 = v2
    local v4 = 1
    for i = 1, v3, v4 do
        v1[i] = p1[v2 + 1 - i]
    end
    return v1
end