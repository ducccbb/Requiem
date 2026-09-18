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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Map.coerceToTable
--                              Dumped in 0.000197 seconds
--                          Bytecode version 9  |  3 functions

local Map = require(script.Parent:WaitForChild("Map"))
local u17 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
local Array = script.Parent.Parent:WaitForChild("Array")
local reduce = require(Array:WaitForChild("reduce"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1) -- Line: 9 -- upvalues: u17 (val), Map (val), reduce (val)
    if not (u17(p1, Map)) then
        return p1
    end
    local v1 = p1:entries()
    return reduce(v1, function(p1, p2) -- Line: 15
        p1[p2[1]] = p2[2]
        return p1
    end, {})
end