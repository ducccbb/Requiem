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
-- File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactErrorUtils
--                              Dumped in 0.000290 seconds
--                          Bytecode version 9  |  7 functions

local invariant = require(script.Parent:WaitForChild("invariant"))
local invokeGuardedCallbackImpl = require(script.Parent:WaitForChild("invokeGuardedCallbackImpl"))
local u16 = nil
local u17 = false
local u18 = nil
local u19 = false
local u20 = nil
local u21 = {
    onError = function(p1) -- Line: 25 -- upvalues: u17 (ref), u18 (ref)
        u17 = true
        u18 = p1
    end,
}
local u23 = {
    invokeGuardedCallback = function(...) -- Line: 45 -- upvalues: u17 (ref), u18 (ref), invokeGuardedCallbackImpl (val), u21 (val)
        u17 = false
        u18 = nil
        invokeGuardedCallbackImpl(u21, ...)
    end,
}
function u23.invokeGuardedCallbackAndCatchFirstError(...) -- Line: 62 -- upvalues: u23 (val), u17 (ref), u16 (ref), u19 (ref), u20 (ref)
    u23.invokeGuardedCallback(...)
    if u17 and not u19 then
        u19 = true
        u20 = u16()
    end
end
function u23.rethrowCaughtError() -- Line: 80 -- upvalues: u19 (ref), u20 (ref)
    if u19 then
        u19 = false
        u20 = nil
        error(u20)
    end
end
function u23.hasCaughtError() -- Line: 89 -- upvalues: u17 (ref)
    return u17
end
function u16() -- Line: 93 -- upvalues: u17 (ref), u18 (ref), invariant (val)
    if not u17 then
        invariant(false, "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.")
        return nil
    end
    u17 = false
    u18 = nil
    return u18
end
u23.clearCaughtError = u16
return u23