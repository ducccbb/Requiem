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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.concat
--                              Dumped in 0.000560 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, ...) -- Line: 13 -- upvalues: isArray (val), __DEV__ (val)
    local v1, v2, v3, v4, v5
    if not (isArray(p1)) then
        v1 = {}
        v1[0 + 1] = p1
    else
        v1 = table.clone(p1)
        v2 = #p1
    end
    local v6 = select("#", ...)
    local v7 = 1
    for i = 1, v6, v7 do
        v3 = select(i, ...)
        if v3 ~= nil then
            if typeof(v3) ~= "table" then
                v2 = v2 + 1
                v1[v2] = v3
            else
                if __DEV__ and not (isArray(v3)) then
                    error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`")
                end
                v4 = #v3
                v5 = 1
                for j = 1, v4, v5 do
                    v2 = v2 + 1
                    v1[v2] = v3[j]
                end
            end
        end
    end
    return v1
end