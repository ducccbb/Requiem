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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHydrationContext.new
--                               Dumped in 0.00206 seconds
--                          Bytecode version 9  |  17 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local function unimplemented(p1) -- Line: 16
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. p1)
    error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostRoot = ReactWorkTags.HostRoot
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Placement = ReactFiberFlags.Placement
local Hydrating = ReactFiberFlags.Hydrating
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local createFiberFromDehydratedFragment = require(script.Parent:WaitForChild("ReactFiber.new")).createFiberFromDehydratedFragment
local supportsHydration = ReactFiberHostConfig.supportsHydration
local getNextHydratableSibling = ReactFiberHostConfig.getNextHydratableSibling
local getFirstHydratableChild = ReactFiberHostConfig.getFirstHydratableChild
local canHydrateInstance = ReactFiberHostConfig.canHydrateInstance
local canHydrateTextInstance = ReactFiberHostConfig.canHydrateTextInstance
local canHydrateSuspenseInstance = ReactFiberHostConfig.canHydrateSuspenseInstance
local hydrateInstance = ReactFiberHostConfig.hydrateInstance
local hydrateTextInstance = ReactFiberHostConfig.hydrateTextInstance
local hydrateSuspenseInstance = ReactFiberHostConfig.hydrateSuspenseInstance
local getNextHydratableInstanceAfterSuspenseInstance = ReactFiberHostConfig.getNextHydratableInstanceAfterSuspenseInstance
local didNotMatchHydratedContainerTextInstance = ReactFiberHostConfig.didNotMatchHydratedContainerTextInstance
local didNotMatchHydratedTextInstance = ReactFiberHostConfig.didNotMatchHydratedTextInstance
local shouldSetTextContent = ReactFiberHostConfig.shouldSetTextContent
local enableSuspenseServerRenderer = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSuspenseServerRenderer
local OffscreenLane = require(script.Parent:WaitForChild("ReactFiberLane")).OffscreenLane
local u109 = nil
local u110 = nil
local u111 = false
function warnIfHydrating() -- Line: 89 -- upvalues: u111 (ref), console (val)
    if _G.__DEV__ and u111 then
        console.error("We should not be hydrating here. This is a bug in React. Please file a bug.")
    end
end
function enterHydrationState(p1) -- Line: 99 -- upvalues: supportsHydration (val), u110 (ref), getFirstHydratableChild (val), u109 (ref), u111 (ref)
    if not supportsHydration then
        return false
    end
    u110 = getFirstHydratableChild(p1.stateNode.containerInfo)
    u109 = p1
    u111 = true
    return true
end
function reenterHydrationStateFromDehydratedSuspenseInstance(p1, p2) -- Line: 111 -- upvalues: supportsHydration (val), u110 (ref), getNextHydratableSibling (val), u111 (ref)
    if not supportsHydration then
        return false
    end
    u110 = getNextHydratableSibling(p2)
    popToNextHostParent(p1)
    u111 = true
    return true
end
function deleteHydratableInstance(p1, p2) -- Line: 125
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: deleteHydratableInstance")
    error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2)
end
function insertNonHydratedInstance(p1, p2) -- Line: 160 -- upvalues: Hydrating (val), Placement (val)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: insertNonHydratedInstance")
    error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2)
    local v1 = bit32.band(p2.flags, (bit32.bnot(Hydrating)))
    p2.flags = bit32.bor(v1, Placement)
end
function tryHydrate(p1, p2) -- Line: 224 -- upvalues: HostComponent (val), canHydrateInstance (val), HostText (val), canHydrateTextInstance (val), SuspenseComponent (val), enableSuspenseServerRenderer (val), canHydrateSuspenseInstance (val), OffscreenLane (val), createFiberFromDehydratedFragment (val)
    local v1
    if p1.tag == HostComponent then
        v1 = canHydrateInstance(p2, p1.type, p1.pendingProps)
        if v1 == nil then
            return false
        end
        p1.stateNode = v1
        return true
    end
    if p1.tag == HostText then
        local v2 = canHydrateTextInstance(p2, p1.pendingProps)
        if v2 == nil then
            return false
        end
        p1.stateNode = v2
        return true
    end
    if p1.tag ~= SuspenseComponent or not enableSuspenseServerRenderer then
        return false
    end
    local v3 = canHydrateSuspenseInstance(p2)
    if v3 == nil then
        return false
    end
    p1.memoizedState = {dehydrated = v3, retryLane = OffscreenLane}
    v1 = createFiberFromDehydratedFragment(v3)
    v1.return_ = p1
    p1.child = v1
    return true
end
function tryToClaimNextHydratableInstance(p1) -- Line: 269 -- upvalues: u111 (ref), u110 (ref), u109 (ref), getNextHydratableSibling (val), getFirstHydratableChild (val)
    if not u111 then
        return
    end
    local v1 = u110
    if not v1 then
        insertNonHydratedInstance(u109, p1)
        u111 = false
        u109 = p1
        return
    end
    local v2 = v1
    if tryHydrate(p1, v1) then
        u109 = p1
        u110 = getFirstHydratableChild(v1)
        return
    end
    v1 = getNextHydratableSibling(v2)
    if not v1 or not (tryHydrate(p1, v1)) then
        insertNonHydratedInstance(u109, p1)
        u111 = false
        u109 = p1
        return
    end
    deleteHydratableInstance(u109, v2)
    u109 = p1
    u110 = getFirstHydratableChild(v1)
end
function prepareToHydrateHostInstance(p1, p2, p3) -- Line: 305 -- upvalues: supportsHydration (val), invariant (val), hydrateInstance (val)
    if not supportsHydration then
        invariant(false, "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local v1 = hydrateInstance(p1.stateNode, p1.type, p1.memoizedProps, p2, p3, p1)
    p1.updateQueue = v1
    if v1 ~= nil then
        return true
    end
    return false
end
function prepareToHydrateHostTextInstance(p1) -- Line: 337 -- upvalues: supportsHydration (val), invariant (val), hydrateTextInstance (val), u109 (ref), HostRoot (val), didNotMatchHydratedContainerTextInstance (val), HostComponent (val), didNotMatchHydratedTextInstance (val)
    if not supportsHydration then
        invariant(false, "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local stateNode = p1.stateNode
    local memoizedProps = p1.memoizedProps
    local v1 = hydrateTextInstance(stateNode, memoizedProps, p1)
    if not _G.__DEV__ or not v1 then
        return v1
    end
    local v2 = u109
    if v2 == nil then
        return v1
    end
    if v2.tag == HostRoot then
        didNotMatchHydratedContainerTextInstance(v2.stateNode.containerInfo, stateNode, memoizedProps)
        return v1
    end
    if v2.tag == HostComponent then
        didNotMatchHydratedTextInstance(v2.type, v2.memoizedProps, v2.stateNode, stateNode, memoizedProps)
    end
    return v1
end
function prepareToHydrateHostSuspenseInstance(p1) -- Line: 380 -- upvalues: supportsHydration (val), invariant (val), hydrateSuspenseInstance (val)
    local dehydrated
    if not supportsHydration then
        invariant(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local memoizedState = p1.memoizedState
    if memoizedState == nil then
        dehydrated = nil
    else
        dehydrated = memoizedState.dehydrated
    end
    invariant(dehydrated, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
    hydrateSuspenseInstance(dehydrated, p1)
end
function skipPastDehydratedSuspenseInstance(p1) -- Line: 405 -- upvalues: supportsHydration (val), invariant (val), getNextHydratableInstanceAfterSuspenseInstance (val)
    local dehydrated
    if not supportsHydration then
        invariant(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
    end
    local memoizedState = p1.memoizedState
    if memoizedState == nil then
        dehydrated = nil
    else
        dehydrated = memoizedState.dehydrated
    end
    invariant(dehydrated, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
    return getNextHydratableInstanceAfterSuspenseInstance(dehydrated)
end
function popToNextHostParent(p1) -- Line: 428 -- upvalues: HostComponent (val), HostRoot (val), SuspenseComponent (val), u109 (ref)
    local return_ = p1.return_
    while return_ ~= nil do
        if return_.tag == HostComponent or return_.tag == HostRoot or return_.tag == SuspenseComponent then
            break
        end
        return_ = return_.return_
    end
    u109 = return_
end
function popHydrationState(p1) -- Line: 441 -- upvalues: supportsHydration (val), u109 (ref), u111 (ref), HostComponent (val), shouldSetTextContent (val), u110 (ref), getNextHydratableSibling (val), SuspenseComponent (val)
    if not supportsHydration or p1 ~= u109 then
        return false
    end
    if not u111 then
        popToNextHostParent(p1)
        u111 = true
        return false
    end
    local type = p1.type
    if p1.tag ~= HostComponent then
        local v1 = u110
        while v1 do
            deleteHydratableInstance(p1, v1)
            v1 = getNextHydratableSibling(v1)
        end
    elseif type ~= "head" and type ~= "body" and shouldSetTextContent(type, p1.memoizedProps) then
    end
    popToNextHostParent(p1)
    if p1.tag == SuspenseComponent then
        u110 = skipPastDehydratedSuspenseInstance(p1)
    elseif not u109 then
        u110 = nil
    else
        u110 = getNextHydratableSibling(p1.stateNode)
    end
    return true
end
function resetHydrationState() -- Line: 494 -- upvalues: supportsHydration (val), u109 (ref), u110 (ref), u111 (ref)
    if not supportsHydration then
        return
    end
    u109 = nil
    u110 = nil
    u111 = false
end
function getIsHydrating() -- Line: 504 -- upvalues: u111 (ref)
    return u111
end
return {
    warnIfHydrating = warnIfHydrating,
    enterHydrationState = enterHydrationState,
    getIsHydrating = getIsHydrating,
    reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance,
    resetHydrationState = resetHydrationState,
    tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance,
    prepareToHydrateHostInstance = prepareToHydrateHostInstance,
    prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance,
    prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance,
    popHydrationState = popHydrationState,
}