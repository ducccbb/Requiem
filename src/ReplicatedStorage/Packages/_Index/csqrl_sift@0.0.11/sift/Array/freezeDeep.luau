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
--    File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.freezeDeep
--                              Dumped in 0.000204 seconds
--                          Bytecode version 9  |  2 functions

local freezeDeep
function freezeDeep(p1) -- Line: 21 -- upvalues: freezeDeep (val)
    local v1
    local v2 = {}
    local v3 = #p1
    local v4 = 1
    local v5 = p1
    for i = 1, v3, v4 do
        v1 = v5[i]
        if type(v1) ~= "table" then
            table.insert(v2, v1)
        else
            table.insert(v2, freezeDeep(v1))
        end
    end
    table.freeze(v2)
    return v2
end
return freezeDeep