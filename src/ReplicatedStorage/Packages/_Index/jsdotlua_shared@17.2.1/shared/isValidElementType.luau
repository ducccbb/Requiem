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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.isValidElementType
--                              Dumped in 0.000422 seconds
--                          Bytecode version 9  |  2 functions

local ReactSymbols = require(script.Parent:WaitForChild("ReactSymbols"))
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_DEBUG_TRACING_MODE_TYPE = ReactSymbols.REACT_DEBUG_TRACING_MODE_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_FUNDAMENTAL_TYPE = ReactSymbols.REACT_FUNDAMENTAL_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
local REACT_SERVER_BLOCK_TYPE = ReactSymbols.REACT_SERVER_BLOCK_TYPE
local REACT_LEGACY_HIDDEN_TYPE = ReactSymbols.REACT_LEGACY_HIDDEN_TYPE
return function(p1) -- Line: 31 -- upvalues: REACT_FRAGMENT_TYPE (val), REACT_PROFILER_TYPE (val), REACT_DEBUG_TRACING_MODE_TYPE (val), REACT_STRICT_MODE_TYPE (val), REACT_SUSPENSE_TYPE (val), REACT_LEGACY_HIDDEN_TYPE (val), REACT_LAZY_TYPE (val), REACT_MEMO_TYPE (val), REACT_PROVIDER_TYPE (val), REACT_CONTEXT_TYPE (val), REACT_FORWARD_REF_TYPE (val), REACT_FUNDAMENTAL_TYPE (val), REACT_BLOCK_TYPE (val), REACT_SERVER_BLOCK_TYPE (val)
    local v1 = typeof(p1)
    if v1 == "string" or v1 == "function" or p1 == REACT_FRAGMENT_TYPE or p1 == REACT_PROFILER_TYPE or p1 == REACT_DEBUG_TRACING_MODE_TYPE or p1 == REACT_STRICT_MODE_TYPE or p1 == REACT_SUSPENSE_TYPE or p1 == REACT_LEGACY_HIDDEN_TYPE then
        return true
    end
    if v1 ~= "table" then
        return false
    end
    if p1.isReactComponent or p1["$$typeof"] == REACT_LAZY_TYPE or p1["$$typeof"] == REACT_MEMO_TYPE or p1["$$typeof"] == REACT_PROVIDER_TYPE or p1["$$typeof"] == REACT_CONTEXT_TYPE or p1["$$typeof"] == REACT_FORWARD_REF_TYPE or p1["$$typeof"] == REACT_FUNDAMENTAL_TYPE or p1["$$typeof"] == REACT_BLOCK_TYPE or p1[1] == REACT_SERVER_BLOCK_TYPE then
        return true
    end
    return false
end