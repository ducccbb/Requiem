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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactFiberHostConfig.WithNoHydration
--                              Dumped in 0.000157 seconds
--                          Bytecode version 9  |  2 functions

local invariant = require(script.Parent.Parent:WaitForChild("invariant"))
function shim(...) -- Line: 16 -- upvalues: invariant (val)
    invariant(false, "The current renderer does not support hydration. This error is likely caused by a bug in React. Please file an issue.")
end
return {
    supportsHydration = false,
    canHydrateInstance = shim,
    canHydrateTextInstance = shim,
    canHydrateSuspenseInstance = shim,
    isSuspenseInstancePending = shim,
    isSuspenseInstanceFallback = shim,
    registerSuspenseInstanceRetry = shim,
    getNextHydratableSibling = shim,
    getFirstHydratableChild = shim,
    hydrateInstance = shim,
    hydrateTextInstance = shim,
    hydrateSuspenseInstance = shim,
    getNextHydratableInstanceAfterSuspenseInstance = shim,
    commitHydratedContainer = shim,
    commitHydratedSuspenseInstance = shim,
    clearSuspenseBoundary = shim,
    clearSuspenseBoundaryFromContainer = shim,
    didNotMatchHydratedContainerTextInstance = shim,
    didNotMatchHydratedTextInstance = shim,
    didNotHydrateContainerInstance = shim,
    didNotHydrateInstance = shim,
    didNotFindHydratableContainerInstance = shim,
    didNotFindHydratableContainerTextInstance = shim,
    didNotFindHydratableContainerSuspenseInstance = shim,
    didNotFindHydratableInstance = shim,
    didNotFindHydratableTextInstance = shim,
    didNotFindHydratableSuspenseInstance = shim,
}