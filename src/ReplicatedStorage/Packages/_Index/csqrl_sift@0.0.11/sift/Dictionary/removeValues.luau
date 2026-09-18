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
--File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.removeValues
--                              Dumped in 0.000132 seconds
--                          Bytecode version 9  |  2 functions

local toSet = require(script.Parent.Parent.Array.toSet)
return function(p1, ...) -- Line: 23 -- upvalues: toSet (val)
    local v1 = toSet({...})
    local v2 = {}
    for k, v in pairs(p1) do
        if not (v1[v]) then
            v2[k] = v
        end
    end
    return v2
end