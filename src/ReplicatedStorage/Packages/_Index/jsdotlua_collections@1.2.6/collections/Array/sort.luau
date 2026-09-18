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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.sort
--                              Dumped in 0.000475 seconds
--                          Bytecode version 9  |  4 functions

local Object = script.Parent.Parent:WaitForChild("Object")
local None = require(Object:WaitForChild("None"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local function u23(p1, p2) -- Line: 6
    local v1 = type(p1)
    local v2 = v1 .. tostring(p1)
    local v3 = type(p2)
    local v4 = v2 < v3 .. tostring(p2)
    return v4
end
return function(p1, p2) -- Line: 10 -- upvalues: u23 (val), None (val)
    local v1 = u23
    if p2 ~= nil and p2 ~= None then
        if typeof(p2) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function")
        end
        function v1(p1, a2) -- Line: 17 -- upvalues: p2 (val)
            local v1 = p2(p1, a2)
            if typeof(v1) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v1))))
            end
            local v2 = v1 < 0
            return v2
        end
    end
    table.sort(p1, v1)
    return p1
end