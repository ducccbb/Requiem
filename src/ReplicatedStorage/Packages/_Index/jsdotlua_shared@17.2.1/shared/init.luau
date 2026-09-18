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
--         File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared
--                              Dumped in 0.000376 seconds
--                          Bytecode version 9  |  1 functions

require(script.Parent:WaitForChild("luau-polyfill"))
local ReactTypes = require(script:WaitForChild("ReactTypes"))
require(script:WaitForChild("flowtypes.roblox"))
require(script:WaitForChild("ReactElementType"))
local ReactFiberHostConfig = require(script:WaitForChild("ReactFiberHostConfig"))
local ReactSharedInternals = require(script:WaitForChild("ReactSharedInternals"))
local v1 = require(script:WaitForChild("ErrorHandling.roblox"))
local v2 = {
    checkPropTypes = require(script:WaitForChild("checkPropTypes")),
    console = require(script:WaitForChild("console")),
    ConsolePatchingDev = require(script:WaitForChild("ConsolePatchingDev.roblox")),
    consoleWithStackDev = require(script:WaitForChild("consoleWithStackDev")),
    enqueueTask = require(script:WaitForChild("enqueueTask.roblox")),
    ExecutionEnvironment = require(script:WaitForChild("ExecutionEnvironment")),
    formatProdErrorMessage = require(script:WaitForChild("formatProdErrorMessage")),
    getComponentName = require(script:WaitForChild("getComponentName")),
    invariant = require(script:WaitForChild("invariant")),
    invokeGuardedCallbackImpl = require(script:WaitForChild("invokeGuardedCallbackImpl")),
    isValidElementType = require(script:WaitForChild("isValidElementType")),
    objectIs = require(script:WaitForChild("objectIs")),
    ReactComponentStackFrame = require(script:WaitForChild("ReactComponentStackFrame")),
    ReactElementType = require(script:WaitForChild("ReactElementType")),
    ReactErrorUtils = require(script:WaitForChild("ReactErrorUtils")),
    ReactFeatureFlags = require(script:WaitForChild("ReactFeatureFlags")),
    ReactInstanceMap = require(script:WaitForChild("ReactInstanceMap")),
    ReactSharedInternals = ReactSharedInternals,
    ReactFiberHostConfig = ReactFiberHostConfig,
    ReactSymbols = require(script:WaitForChild("ReactSymbols")),
    ReactVersion = require(script:WaitForChild("ReactVersion")),
    shallowEqual = require(script:WaitForChild("shallowEqual")),
    UninitializedState = require(script:WaitForChild("UninitializedState.roblox")),
    ReactTypes = ReactTypes,
    describeError = v1.describeError,
    errorToString = v1.errorToString,
    parseReactError = v1.parseReactError,
    Symbol = require(script:WaitForChild("Symbol.roblox")),
    Type = require(script:WaitForChild("Type.roblox")),
}
local PropMarkers = script:WaitForChild("PropMarkers")
v2.Change = require(PropMarkers:WaitForChild("Change"))
local PropMarkers_2 = script:WaitForChild("PropMarkers")
v2.Event = require(PropMarkers_2:WaitForChild("Event"))
local PropMarkers_3 = script:WaitForChild("PropMarkers")
v2.Tag = require(PropMarkers_3:WaitForChild("Tag"))
return v2