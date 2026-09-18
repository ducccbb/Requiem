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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.splice
--                              Dumped in 0.000295 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3, ...) -- Line: 8
    local v1, v2, v3, v4, v5, v6
    if #p1 < p2 then
        v3 = select("#", ...)
        v4 = 1
        for k = 1, v3, v4 do
            v5 = select(k, ...)
            table.insert(p1, v5)
        end
        return {}
    end
    local v7 = #p1
    if p2 >= 1 then
        v1 = p2
    else
        v4 = v7 - math.abs(p2)
        v1 = math.max(v4, 1)
    end
    v3 = {}
    v4 = p3 or v7
    if 0 < v4 then
        v5 = math.min(v7, v1 + math.max(0, v4 - 1))
        v6 = 1
        for i = v1, v5, v6 do
            v2 = table.remove(p1, v1)
            table.insert(v3, v2)
        end
    end
    v5 = 1
    v6 = -1
    for j = select("#", ...), v5, v6 do
        v2 = select(j, ...)
        table.insert(p1, v1, v2)
    end
    return v3
end