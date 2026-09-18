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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxRoot
--                              Dumped in 0.000702 seconds
--                          Bytecode version 9  |  13 functions

require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
require(script.Parent.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
local ReactRobloxComponentTree = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local markContainerAsRoot = ReactRobloxComponentTree.markContainerAsRoot
local unmarkContainerAsRoot = ReactRobloxComponentTree.unmarkContainerAsRoot
local v1 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox"))
local createContainer = v1.createContainer
local updateContainer = v1.updateContainer
local invariant = require(script.Parent.Parent.Parent:WaitForChild("shared")).invariant
local enableEagerRootListeners = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableEagerRootListeners
local flushSync = v1.flushSync
local flushPassiveEffects = v1.flushPassiveEffects
local BlockingRoot = v1.ReactRootTags.BlockingRoot
local ConcurrentRoot = v1.ReactRootTags.ConcurrentRoot
local LegacyRoot = v1.ReactRootTags.LegacyRoot
local u90 = nil
local u91 = {}
u91.__index = u91
function u91.new(p1, p2) -- Line: 63 -- upvalues: u91 (val), u90 (ref), ConcurrentRoot (val)
    local v1 = setmetatable({}, u91)
    v1._internalRoot = u90(p1, ConcurrentRoot, p2)
    return v1
end
local function createBlockingRoot(p1, p2, p3) -- Line: 70 -- upvalues: u91 (val), u90 (ref)
    local v1 = setmetatable({}, u91)
    v1._internalRoot = u90(p1, p2, p3)
    return v1
end
function u91.render(p1, p2) -- Line: 82 -- upvalues: updateContainer (val)
    updateContainer(p2, p1._internalRoot, nil)
end
function u91.unmount(p1) -- Line: 110 -- upvalues: flushSync (val), updateContainer (val), unmarkContainerAsRoot (val), flushPassiveEffects (val)
    local _internalRoot = p1._internalRoot
    local containerInfo = _internalRoot.containerInfo
    flushSync(function() -- Line: 123 -- upvalues: updateContainer (upval), _internalRoot (val), unmarkContainerAsRoot (upval), containerInfo (val)
        updateContainer(nil, _internalRoot, nil, function() -- Line: 124 -- upvalues: unmarkContainerAsRoot (upval), containerInfo (upval)
            unmarkContainerAsRoot(containerInfo)
        end)
    end)
    flushPassiveEffects()
end
function u90(p1, p2, p3) -- Line: 138 -- upvalues: createContainer (val), markContainerAsRoot (val), enableEagerRootListeners (val)
    local hydrationOptions, mutableSources
    local v1 = if p3 ~= nil then p3.hydrate == true else false
    if p3 == nil then
        hydrationOptions = nil
    else
        hydrationOptions = p3.hydrationOptions
    end
    if p3 == nil then
        mutableSources = nil
    elseif p3.hydrationOptions == nil then
        mutableSources = nil
    else
        mutableSources = p3.hydrationOptions.mutableSources
        if not mutableSources then
            mutableSources = nil
        end
    end
    local v2 = createContainer(p1, p2, v1, hydrationOptions)
    markContainerAsRoot(v2.current, p1)
    return v2
end
local v2 = {
    isValidContainer = function(p1) -- Line: 186
        local v1 = typeof(p1) == "Instance"
        return v1
    end,
    createRoot = function(p1, p2) -- Line: 203 -- upvalues: invariant (val), u91 (val)
        local v1 = typeof(p1) == "Instance"
        invariant(v1, "createRoot(...): Target container is not a Roblox Instance.")
        warnIfReactDOMContainerInDEV(p1)
        return u91.new(p1, p2)
    end,
    createBlockingRoot = function(p1, p2) -- Line: 214 -- upvalues: invariant (val), BlockingRoot (val), u91 (val), u90 (ref)
        local v1 = typeof(p1) == "Instance"
        invariant(v1, "createRoot(...): Target container is not a Roblox Instance.")
        warnIfReactDOMContainerInDEV(p1)
        local v2 = setmetatable({}, u91)
        v2._internalRoot = u90(p1, BlockingRoot, p2)
        return v2
    end,
    createLegacyRoot = function(p1, p2) -- Line: 224 -- upvalues: LegacyRoot (val), u91 (val), u90 (ref)
        local v1 = setmetatable({}, u91)
        v1._internalRoot = u90(p1, LegacyRoot, p2)
        return v1
    end,
}
function warnIfReactDOMContainerInDEV(p1) end
return v2