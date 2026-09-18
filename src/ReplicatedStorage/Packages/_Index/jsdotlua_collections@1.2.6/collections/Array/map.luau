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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.map
--                              Dumped in 0.000266 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 11 -- upvalues: __DEV__ (val)
    local v1, v2, v3, v4, v5
    if __DEV__ then
        if typeof(p1) ~= "table" then
            error(string.format("Array.map called on %s", (typeof(p1))))
        end
        if typeof(p2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v6 = #p1
    local v7 = {}
    local v8 = 1
    v1, v3, v2 = p1, p3, p2
    while v8 <= v6 do
        v4 = v1[v8]
        if v4 ~= nil then
            if v3 == nil then
                v5 = v2(v4, v8, v1)
            else
                v5 = v2(v3, v4, v8, v1)
            end
            v7[v8] = v5
        end
        v8 = v8 + 1
    end
    return v7
end