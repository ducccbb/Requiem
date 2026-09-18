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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.6.luau-polyfill
--                              Dumped in 0.000304 seconds
--                          Bytecode version 9  |  1 functions

local boolean = require(script.Parent:WaitForChild("boolean"))
local collections = require(script.Parent:WaitForChild("collections"))
local console = require(script.Parent:WaitForChild("console"))
local math = require(script.Parent:WaitForChild("math"))
local number = require(script.Parent:WaitForChild("number"))
local string = require(script.Parent:WaitForChild("string"))
local v1 = require(script.Parent:WaitForChild("symbol-luau"))
local timers = require(script.Parent:WaitForChild("timers"))
require(script.Parent:WaitForChild("es7-types"))
local AssertionError = require(script:WaitForChild("AssertionError"))
local Error = require(script:WaitForChild("Error"))
require(script:WaitForChild("Promise"))
local extends = require(script:WaitForChild("extends"))
local v2 = require(script.Parent:WaitForChild("instance-of"))
return {
    Array = collections.Array,
    AssertionError = AssertionError,
    Boolean = boolean,
    console = console,
    Error = Error,
    extends = extends,
    instanceof = v2,
    Math = math,
    Number = number,
    Object = collections.Object,
    Map = collections.Map,
    coerceToMap = collections.coerceToMap,
    coerceToTable = collections.coerceToTable,
    Set = collections.Set,
    WeakMap = collections.WeakMap,
    String = string,
    Symbol = v1,
    setTimeout = timers.setTimeout,
    clearTimeout = timers.clearTimeout,
    setInterval = timers.setInterval,
    clearInterval = timers.clearInterval,
    util = {inspect = collections.inspect},
}