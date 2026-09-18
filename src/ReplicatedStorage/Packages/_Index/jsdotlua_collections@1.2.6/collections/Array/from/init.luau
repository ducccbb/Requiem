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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.from
--                              Dumped in 0.000523 seconds
--                          Bytecode version 9  |  2 functions

local Set = require(script.Parent.Parent:WaitForChild("Set"))
local Map_2 = script.Parent.Parent:WaitForChild("Map")
local Map = require(Map_2:WaitForChild("Map"))
local isArray = require(script.Parent:WaitForChild("isArray"))
local u39 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local fromString = require(script:WaitForChild("fromString"))
local fromSet = require(script:WaitForChild("fromSet"))
local fromMap = require(script:WaitForChild("fromMap"))
local fromArray = require(script:WaitForChild("fromArray"))
return function(p1, p2, p3) -- Line: 20 -- upvalues: isArray (val), fromArray (val), u39 (val), Set (val), fromSet (val), Map (val), fromMap (val), fromString (val)
    if p1 == nil then
        error("cannot create array from a nil value")
    end
    local v1 = typeof(p1)
    if v1 ~= "table" then
        if u39(p1, Set) then
            return (fromSet(p1, p2, p3))
        end
        if u39(p1, Map) then
            return (fromMap(p1, p2, p3))
        end
        if v1 == "string" then
            return (fromString(p1, p2, p3))
        end
        return {}
    end
    if isArray(p1) then
        return (fromArray(p1, p2, p3))
    end
    if u39(p1, Set) then
        return (fromSet(p1, p2, p3))
    end
    if u39(p1, Map) then
        return (fromMap(p1, p2, p3))
    end
    if v1 == "string" then
        return (fromString(p1, p2, p3))
    end
    return {}
end