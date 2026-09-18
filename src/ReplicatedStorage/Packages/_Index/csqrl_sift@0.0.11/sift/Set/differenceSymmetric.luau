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
--File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set.differenceSymmetric
--                              Dumped in 0.000221 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Types)
return function(p1, ...) -- Line: 21
    local v1, v2, v3, v4
    local v5 = table.clone(p1)
    local v6 = {...}
    local v7 = nil
    local v8 = nil
    for i, j in v6, v7, v8 do
        if typeof(j) == "table" then
            v2 = j
            v3 = nil
            v4 = nil
            for k in v2, v3, v4 do
                v1 = not (v5[k] ~= nil)
                v5[k] = v1
            end
        end
    end
    v6 = v5
    v7 = nil
    v8 = nil
    for n, m in v6, v7, v8 do
        if not m then
            v2 = nil
        else
            v2 = true
        end
        v5[n] = v2
    end
    return v5
end