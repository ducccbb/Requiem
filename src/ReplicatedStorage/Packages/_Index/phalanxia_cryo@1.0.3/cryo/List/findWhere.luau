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
--   File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.findWhere
--                              Dumped in 0.000121 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2) -- Line: 5
    local v1 = #p1
    local v2 = 1
    for i = 1, v1, v2 do
        if p2(p1[i], i) then
            return i
        end
    end
    return nil
end