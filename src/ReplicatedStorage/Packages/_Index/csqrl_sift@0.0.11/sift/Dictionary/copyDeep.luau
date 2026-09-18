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
--  File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.copyDeep
--                              Dumped in 0.000133 seconds
--                          Bytecode version 9  |  2 functions

local copyDeep
function copyDeep(p1) -- Line: 20 -- upvalues: copyDeep (val)
    local v1 = table.clone(p1)
    for k, v in pairs(p1) do
        if type(v) == "table" then
            v1[k] = copyDeep(v)
        end
    end
    return v1
end
return copyDeep