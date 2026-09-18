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
-- File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.freezeDeep
--                              Dumped in 0.000138 seconds
--                          Bytecode version 9  |  2 functions

local freezeDeep
require(script.Parent.Parent.Types)
function freezeDeep(p1) -- Line: 22 -- upvalues: freezeDeep (val)
    local v1 = {}
    for k, v in pairs(p1) do
        if type(v) ~= "table" then
            v1[k] = v
        else
            v1[k] = freezeDeep(v)
        end
    end
    table.freeze(v1)
    return v1
end
return freezeDeep