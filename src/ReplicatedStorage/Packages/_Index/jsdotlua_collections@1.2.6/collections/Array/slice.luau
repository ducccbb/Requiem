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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.slice
--                              Dumped in 0.000299 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 7
    local v1, v2
    if typeof(p1) ~= "table" then
        error(string.format("Array.slice called on %s", (typeof(p1))))
    end
    local v3 = #p1
    local v4 = p2 or 1
    if p3 == nil then
        v1 = v3 + 1
    elseif v3 + 1 >= p3 then
        v1 = p3
    end
    if v3 + 1 < v4 then
        return {}
    end
    local v5 = {}
    if v4 < 1 then
        v2 = v3 - math.abs(v4)
        v4 = math.max(v2, 1)
    end
    if v1 < 1 then
        v2 = v3 - math.abs(v1)
        v1 = math.max(v2, 1)
    end
    local v6 = v4
    v2 = 1
    while v6 < v1 do
        v5[v2] = p1[v6]
        v6 = v6 + 1
        v2 = v2 + 1
    end
    return v5
end