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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.unshift
--                              Dumped in 0.000236 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, ...) -- Line: 7 -- upvalues: __DEV__ (val), isArray (val)
    if __DEV__ and not (isArray(p1)) then
        error(string.format("Array.unshift called on non-array %s", (typeof(p1))))
    end
    local v1 = select("#", ...)
    if 0 < v1 then
        local v2
        local v3 = 1
        local v4 = -1
        for i = v1, v3, v4 do
            v2 = select(i, ...)
            table.insert(p1, 1, v2)
        end
    end
    return #p1
end