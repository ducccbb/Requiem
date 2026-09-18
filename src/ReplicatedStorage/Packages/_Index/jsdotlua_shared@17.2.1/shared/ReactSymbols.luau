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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactSymbols
--                              Dumped in 0.000264 seconds
--                          Bytecode version 9  |  4 functions

local u0 = {
    REACT_ELEMENT_TYPE = 60103,
    REACT_PORTAL_TYPE = 60106,
    REACT_FRAGMENT_TYPE = 60107,
    REACT_STRICT_MODE_TYPE = 60108,
    REACT_PROFILER_TYPE = 60114,
    REACT_PROVIDER_TYPE = 60109,
    REACT_CONTEXT_TYPE = 60110,
    REACT_FORWARD_REF_TYPE = 60112,
    REACT_SUSPENSE_TYPE = 60113,
    REACT_SUSPENSE_LIST_TYPE = 60120,
    REACT_MEMO_TYPE = 60115,
    REACT_LAZY_TYPE = 60116,
    REACT_BLOCK_TYPE = 60121,
    REACT_SERVER_BLOCK_TYPE = 60122,
    REACT_FUNDAMENTAL_TYPE = 60117,
    REACT_SCOPE_TYPE = 60119,
    REACT_OPAQUE_ID_TYPE = 60128,
    REACT_DEBUG_TRACING_MODE_TYPE = 60129,
    REACT_OFFSCREEN_TYPE = 60130,
    REACT_LEGACY_HIDDEN_TYPE = 60131,
    REACT_BINDING_TYPE = 60132,
}
function u0.getIteratorFn(p1) -- Line: 83 -- upvalues: u0 (val)
    if typeof(p1) ~= "table" or p1["$$typeof"] == u0.REACT_PORTAL_TYPE then
        return nil
    end
    return function() -- Line: 90 -- upvalues: p1 (val)
        local u0 = nil
        local u1 = nil
        return {
            next = function() -- Line: 93 -- upvalues: u0 (ref), u1 (ref), p1 (upval)
                local v1, v2
                v1, v2 = next(p1, u0)
                u0 = v1
                u1 = v2
                v1 = {}
                v2 = u1 == nil
                v1.done = v2
                v1.key = u0
                v1.value = u1
                return v1
            end,
        }
    end
end
return u0