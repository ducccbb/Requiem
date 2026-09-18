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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.from.fromString
--                              Dumped in 0.000318 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 9
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = {}
    local v9 = #p1
    v8 = table.create(v9)
    if not p2 then
        v5 = v9
        v6 = 1
        for i = 1, v5, v6 do
            v8[i] = string.sub(p1, i, i)
        end
        return v8
    end
    v5 = v9
    v6 = 1
    v4, v2, v1 = p3, p2, p1
    for j = 1, v5, v6 do
        if v4 == nil then
            v7 = string.sub(v1, j, j)
            v8[j] = v2(v7, j)
        else
            v3 = string.sub(v1, j, j)
            v8[j] = v2(v4, v3, j)
        end
    end
    return v8
end