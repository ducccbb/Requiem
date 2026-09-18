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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.flatMap
--                              Dumped in 0.000213 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
local flat = require(script.Parent:WaitForChild("flat"))
local map = require(script.Parent:WaitForChild("map"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 9 -- upvalues: __DEV__ (val), flat (val), map (val)
    if __DEV__ then
        if typeof(p1) ~= "table" then
            error(string.format("Array.flatMap called on %s", (typeof(p1))))
        end
        if typeof(p2) ~= "function" then
            error("callback is not a function")
        end
    end
    return flat(map(p1, p2, p3))
end