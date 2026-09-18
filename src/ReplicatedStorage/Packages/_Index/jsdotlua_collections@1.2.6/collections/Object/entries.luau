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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Object.entries
--                              Dumped in 0.000290 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1) -- Line: 7
    local v1 = p1 ~= nil
    assert(v1, "cannot get entries from a nil value")
    local v2 = typeof(p1)
    v1 = {}
    if v2 == "table" then
        for k, v in pairs(p1) do
            table.insert(v1, {k, v})
        end
        return v1
    end
    if v2 == "string" then
        local v3, v4
        local v5 = string.len(p1)
        local v6 = 1
        for i = 1, v5, v6 do
            v3 = {}
            v4 = tostring(i)
            v3[1] = v4
            v3[2] = (string.sub(p1, i, i))
            v1[i] = v3
        end
    end
    return v1
end