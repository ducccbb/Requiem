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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createReconcilerCompat
--                              Dumped in 0.000186 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Logging = require(script.Parent.Logging)
return function(p1) -- Line: 30 -- upvalues: Logging (val)
    return {
        reify = function(...) -- Line: 33 -- upvalues: Logging (upval), p1 (val)
            Logging.warnOnce("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n")
            return p1.mountVirtualTree(...)
        end,
        teardown = function(...) -- Line: 39 -- upvalues: Logging (upval), p1 (val)
            Logging.warnOnce("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n")
            return p1.unmountVirtualTree(...)
        end,
        reconcile = function(...) -- Line: 45 -- upvalues: Logging (upval), p1 (val)
            Logging.warnOnce("Roact.reconcile has been renamed to Roact.update and will be removed in a future release.\nCheck the call to Roact.reconcile at:\n")
            return p1.updateVirtualTree(...)
        end,
    }
end