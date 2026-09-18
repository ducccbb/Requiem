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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.filter
--                              Dumped in 0.000381 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 11 -- upvalues: __DEV__ (val)
    local v1, v2, v3, v4, v5, v6
    if __DEV__ then
        if typeof(p1) ~= "table" then
            error(string.format("Array.filter called on %s", (typeof(p1))))
        end
        if typeof(p2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v7 = #p1
    local v8 = {}
    local v9 = 1
    if p3 == nil then
        v4 = v7
        v5 = 1
        v1, v2 = p1, p2
        for j = 1, v4, v5 do
            v6 = v1[j]
            if v6 ~= nil and v2(v6, j, v1) then
                v8[v9] = v6
                v9 = v9 + 1
            end
        end
        return v8
    end
    v4 = v7
    v5 = 1
    v1, v2, v3 = p1, p2, p3
    for i = 1, v4, v5 do
        v6 = v1[i]
        if v6 ~= nil and v2(v3, v6, i, v1) then
            v8[v9] = v6
            v9 = v9 + 1
        end
    end
    return v8
end