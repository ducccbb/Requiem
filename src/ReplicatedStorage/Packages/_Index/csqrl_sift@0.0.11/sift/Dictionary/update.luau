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
--   File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.update
--                              Dumped in 0.000137 seconds
--                          Bytecode version 9  |  2 functions

local copy = require(script.Parent.copy)
return function(p1, p2, p3, p4) -- Line: 30 -- upvalues: copy (val)
    local v1 = copy(p1)
    if not (v1[p2]) then
        if typeof(p4) == "function" then
            v1[p2] = p4(p2)
        end
        return v1
    end
    if not p3 then
        return v1
    end
    v1[p2] = p3(v1[p2], p2)
    return v1
end