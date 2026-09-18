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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Object.values
--                              Dumped in 0.000239 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1) -- Line: 6
    if p1 == nil then
        error("cannot extract values from a nil value")
    end
    local v1 = typeof(p1)
    local v2 = nil
    if v1 == "table" then
        v2 = {}
        for k, v in pairs(p1) do
            table.insert(v2, v)
        end
        return v2
    end
    if v1 == "string" then
        local v3 = p1:len()
        v2 = table.create(v3)
        local v4 = v3
        local v5 = 1
        for i = 1, v4, v5 do
            v2[i] = p1:sub(i, i)
        end
    end
    return v2
end