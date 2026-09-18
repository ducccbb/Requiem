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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.from.fromMap
--                              Dumped in 0.000212 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 9
    local v1, v2, v3
    local v4 = {}
    if not p2 then
        v4 = {}
        v1 = p1
        v2 = nil
        v3 = nil
        for i, j in v1, v2, v3 do
            v4[i] = j
        end
        return v4
    end
    v4 = {}
    v1 = p1
    v2 = nil
    v3 = nil
    for k, n in v1, v2, v3 do
        if p3 == nil then
            v4[k] = p2(n, k)
        else
            v4[k] = p2(p3, n, k)
        end
    end
    return v4
end