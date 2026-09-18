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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Map.coerceToMap
--                              Dumped in 0.000191 seconds
--                          Bytecode version 9  |  2 functions

local Map = require(script.Parent:WaitForChild("Map"))
local Object = require(script.Parent.Parent:WaitForChild("Object"))
local u26 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1) -- Line: 9 -- upvalues: u26 (val), Map (val), Object (val)
    local v1
    if not (u26(p1, Map)) then
        v1 = Map.new(Object.entries(p1))
    else
        v1 = p1
        if not v1 then
            v1 = Map.new(Object.entries(p1))
        end
    end
    return v1
end