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
--    File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections
--                              Dumped in 0.000156 seconds
--                          Bytecode version 9  |  1 functions

local Array = require(script:WaitForChild("Array"))
local Map = require(script:WaitForChild("Map"))
local Object = require(script:WaitForChild("Object"))
local Set = require(script:WaitForChild("Set"))
local WeakMap = require(script:WaitForChild("WeakMap"))
local inspect = require(script:WaitForChild("inspect"))
require(script.Parent:WaitForChild("es7-types"))
return {
    Array = Array,
    Object = Object,
    Map = Map.Map,
    coerceToMap = Map.coerceToMap,
    coerceToTable = Map.coerceToTable,
    Set = Set,
    WeakMap = WeakMap,
    inspect = inspect,
}