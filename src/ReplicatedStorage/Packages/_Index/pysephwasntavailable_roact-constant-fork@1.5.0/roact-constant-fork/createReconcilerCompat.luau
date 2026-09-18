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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createReconcilerCompat
--                              Dumped in 0.000174 seconds
--                          Bytecode version 9  |  5 functions

local Logging = require(script.Parent.Logging)
return function(p1) -- Line: 23 -- upvalues: Logging (val)
    return {
        reify = function(...) -- Line: 26 -- upvalues: Logging (upval), p1 (val)
            Logging.warnOnce("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n")
            return p1.mountVirtualTree(...)
        end,
        teardown = function(...) -- Line: 32 -- upvalues: Logging (upval), p1 (val)
            Logging.warnOnce("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n")
            return p1.unmountVirtualTree(...)
        end,
        reconcile = function(...) -- Line: 38 -- upvalues: Logging (upval), p1 (val)
            Logging.warnOnce("Roact.reconcile has been renamed to Roact.update and will be removed in a future release.\nCheck the call to Roact.reconcile at:\n")
            return p1.updateVirtualTree(...)
        end,
    }
end