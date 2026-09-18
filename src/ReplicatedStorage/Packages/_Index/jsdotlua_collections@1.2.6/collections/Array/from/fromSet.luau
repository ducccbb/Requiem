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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.from.fromSet
--                              Dumped in 0.000179 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 9
    local v1 = {}
    if not p2 then
        return (table.clone(p1._array))
    end
    v1 = {}
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if p3 == nil then
            v1[i] = p2(j, i)
        else
            v1[i] = p2(p3, j, i)
        end
    end
    return v1
end