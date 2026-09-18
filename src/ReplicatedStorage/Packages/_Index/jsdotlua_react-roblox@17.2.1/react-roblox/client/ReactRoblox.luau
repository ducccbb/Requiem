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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRoblox
--                              Dumped in 0.000446 seconds
--                          Bytecode version 9  |  3 functions

local v1
require(script.Parent.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local v2 = require(script.Parent:WaitForChild("ReactRobloxRoot"))
local isValidContainer = v2.isValidContainer
local v3 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox"))
local createPortal = v3.createPortal
local ReactVersion = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactVersion
local invariant = require(script.Parent.Parent.Parent:WaitForChild("shared")).invariant
local ReactRobloxComponentTree = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local v4 = {
    createPortal = function(p1, p2, p3) -- Line: 122 -- upvalues: invariant (val), isValidContainer (val), createPortal (val)
        local v1 = isValidContainer(p2)
        invariant(v1, "Target container is not a Roblox Instance.")
        return createPortal(p1, p2, nil, p3)
    end,
    unstable_batchedUpdates = v3.batchedUpdates,
    flushSync = v3.flushSync,
    __SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = {
        Events = {
            getInstanceFromNode = ReactRobloxComponentTree.getInstanceFromNode,
            getNodeFromInstance = ReactRobloxComponentTree.getNodeFromInstance,
            getFiberCurrentPropsFromNode = ReactRobloxComponentTree.getFiberCurrentPropsFromNode,
            flushPassiveEffects = v3.flushPassiveEffects,
            IsThisRendererActing = v3.IsThisRendererActing,
        },
    },
    version = ReactVersion,
    createRoot = v2.createRoot,
    createBlockingRoot = v2.createBlockingRoot,
    createLegacyRoot = v2.createLegacyRoot,
    Event = require(script.Parent.Parent.Parent:WaitForChild("shared")).Event,
    Change = require(script.Parent.Parent.Parent:WaitForChild("shared")).Change,
    Tag = require(script.Parent.Parent.Parent:WaitForChild("shared")).Tag,
    unstable_isNewReconciler = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableNewReconciler,
    act = function(p1) -- Line: 255
        error("ReactRoblox.act is only available in testing environments, not production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your test configuration in order to use `act`.")
    end,
}
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    v4.act = v3.act
end
local v5 = {rendererPackageName = "ReactRoblox", findFiberByHostInstance = ReactRobloxComponentTree.getClosestInstanceFromNode}
if not _G.__DEV__ then
    v1 = 0
else
    v1 = 1
end
v5.bundleType = v1
v5.version = ReactVersion
v3.injectIntoDevTools(v5)
v4.robloxReactProfiling = v3.robloxReactProfiling
return v4