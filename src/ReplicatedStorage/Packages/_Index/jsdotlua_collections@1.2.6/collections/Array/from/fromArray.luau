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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.from.fromArray
--                              Dumped in 0.000232 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 9
    local v1, v2, v3
    local v4 = {}
    if not p2 then
        v4 = table.clone(p1)
        return v4
    end
    local v5 = #p1
    v4 = table.create(v5)
    local v6 = v5
    local v7 = 1
    v3, v2, v1 = p3, p2, p1
    for i = 1, v6, v7 do
        if v3 == nil then
            v4[i] = v2(v1[i], i)
        else
            v4[i] = v2(v3, v1[i], i)
        end
    end
    return v4
end