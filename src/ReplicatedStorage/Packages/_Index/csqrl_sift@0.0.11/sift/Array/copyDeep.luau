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
--     File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.copyDeep
--                              Dumped in 0.000160 seconds
--                          Bytecode version 9  |  2 functions

local copyDeep
function copyDeep(p1) -- Line: 20 -- upvalues: copyDeep (val)
    local v1 = table.clone(p1)
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if type(j) == "table" then
            v1[i] = copyDeep(j)
        end
    end
    return v1
end
return copyDeep