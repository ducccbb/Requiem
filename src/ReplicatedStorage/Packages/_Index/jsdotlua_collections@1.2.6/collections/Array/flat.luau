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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.flat
--                              Dumped in 0.000358 seconds
--                          Bytecode version 9  |  2 functions

local flat
local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
function flat(p1, p2) -- Line: 5 -- upvalues: __DEV__ (val), isArray (val), flat (val)
    local v1, v2, v3, v4
    if __DEV__ then
        if typeof(p1) ~= "table" then
            error(string.format("Array.flat called on %s", (typeof(p1))))
        end
        if p2 ~= nil and typeof(p2) ~= "number" then
            error("depth is not a number or nil")
        end
    end
    local v5 = p2 or 1
    local v6 = {}
    local v7 = p1
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        if not (isArray(j)) then
            table.insert(v6, j)
        else
            if 1 >= v5 then
                v4 = j
            else
                v4 = flat(j, v5 - 1)
            end
            v1 = v4
            v2 = nil
            v3 = nil
            for k, n in v1, v2, v3 do
                table.insert(v6, n)
            end
        end
    end
    return v6
end
return flat