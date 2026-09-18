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
--             File: ReplicatedStorage.Common.Utilities.Ripple.utils.assign
--                              Dumped in 0.000205 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1, ...) -- Line: 8
    local v1, v2, v3, v4
    local v5 = type(p1) == "table"
    assert(v5, (("Expected a table for first argument, got $%*"):format((type(p1)))))
    local v6 = select("#", ...)
    v5 = 1
    for i = 1, v6, v5 do
        v2 = select(i, ...)
        v3 = nil
        v4 = nil
        for j, k in v2, v3, v4 do
            v1[j] = k
        end
    end
    return v1
end