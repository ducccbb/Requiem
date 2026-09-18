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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberCompleteWork.new
--                               Dumped in 0.00821 seconds
--                          Bytecode version 9  |  15 functions

local updateHostContainer
local function unimplemented(p1) -- Line: 11
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(p1))
    error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local OffscreenLane = ReactFiberLane.OffscreenLane
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local resetWorkInProgressVersions = require(script.Parent:WaitForChild("ReactMutableSource.new")).resetWorkInProgressVersions
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local IndeterminateComponent = ReactWorkTags.IndeterminateComponent
local FunctionComponent = ReactWorkTags.FunctionComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local ContextProvider = ReactWorkTags.ContextProvider
local ContextConsumer = ReactWorkTags.ContextConsumer
local ForwardRef = ReactWorkTags.ForwardRef
local Fragment = ReactWorkTags.Fragment
local Mode = ReactWorkTags.Mode
local Profiler = ReactWorkTags.Profiler
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local LazyComponent = ReactWorkTags.LazyComponent
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local ScopeComponent = ReactWorkTags.ScopeComponent
local Block = ReactWorkTags.Block
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local NoMode = ReactTypeOfMode.NoMode
local ConcurrentMode = ReactTypeOfMode.ConcurrentMode
local BlockingMode = ReactTypeOfMode.BlockingMode
local ProfileMode = ReactTypeOfMode.ProfileMode
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Ref = ReactFiberFlags.Ref
local Update = ReactFiberFlags.Update
local Callback = ReactFiberFlags.Callback
local Passive = ReactFiberFlags.Passive
local Deletion = ReactFiberFlags.Deletion
local NoFlags = ReactFiberFlags.NoFlags
local DidCapture = ReactFiberFlags.DidCapture
local Snapshot = ReactFiberFlags.Snapshot
local MutationMask = ReactFiberFlags.MutationMask
local LayoutMask = ReactFiberFlags.LayoutMask
local PassiveMask = ReactFiberFlags.PassiveMask
local StaticMask = ReactFiberFlags.StaticMask
local PerformedWork = ReactFiberFlags.PerformedWork
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local createInstance = ReactFiberHostConfig.createInstance
local createTextInstance = ReactFiberHostConfig.createTextInstance
local appendInitialChild = ReactFiberHostConfig.appendInitialChild
local finalizeInitialChildren = ReactFiberHostConfig.finalizeInitialChildren
local prepareUpdate = ReactFiberHostConfig.prepareUpdate
local supportsMutation = ReactFiberHostConfig.supportsMutation
local supportsPersistence = ReactFiberHostConfig.supportsPersistence
local createContainerChildSet = ReactFiberHostConfig.createContainerChildSet
local finalizeContainerChildren = ReactFiberHostConfig.finalizeContainerChildren
local preparePortalMount = ReactFiberHostConfig.preparePortalMount
local v1 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local getRootHostContainer = v1.getRootHostContainer
local popHostContext = v1.popHostContext
local getHostContext = v1.getHostContext
local popHostContainer = v1.popHostContainer
local v2 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
local popSuspenseContext = v2.popSuspenseContext
local suspenseStackCursor = v2.suspenseStackCursor
local InvisibleParentSuspenseContext = v2.InvisibleParentSuspenseContext
local hasSuspenseContext = v2.hasSuspenseContext
local v3 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local isContextProvider = v3.isContextProvider
local popContext = v3.popContext
local popTopLevelContextObject = v3.popTopLevelContextObject
local popProvider = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).popProvider
local v4 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new"))
local prepareToHydrateHostSuspenseInstance = v4.prepareToHydrateHostSuspenseInstance
local popHydrationState = v4.popHydrationState
local resetHydrationState = v4.resetHydrationState
local prepareToHydrateHostInstance = v4.prepareToHydrateHostInstance
local prepareToHydrateHostTextInstance = v4.prepareToHydrateHostTextInstance
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local enableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local enableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local enableFundamentalAPI = ReactFeatureFlags.enableFundamentalAPI
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local u215 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local popRenderLanes = u215.popRenderLanes
local markSpawnedWork = u215.markSpawnedWork
local renderDidSuspend = u215.renderDidSuspend
local renderDidSuspendDelayIfPossible = u215.renderDidSuspendDelayIfPossible
local NoLanes = ReactFiberLane.NoLanes
local includesSomeLane = ReactFiberLane.includesSomeLane
local mergeLanes = ReactFiberLane.mergeLanes
local transferActualDuration = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).transferActualDuration
local function markUpdate(p1) -- Line: 185 -- upvalues: Update (val)
    p1.flags = bit32.bor(p1.flags, Update)
end
local function markRef(p1) -- Line: 191 -- upvalues: Ref (val)
    p1.flags = bit32.bor(p1.flags, Ref)
end
local function hadNoMutationsEffects(p1, p2) -- Line: 197 -- upvalues: MutationMask (val), NoFlags (val)
    local child, v1
    local v2 = if p1 ~= nil then p1.child == p2.child else false
    if v2 then
        return true
    end
    child = p2.child
    while child ~= nil do
        v1 = bit32.band(child.flags, MutationMask)
        if v1 ~= NoFlags then
            return false
        end
        v1 = bit32.band(child.subtreeFlags, MutationMask)
        if v1 ~= NoFlags then
            return false
        end
        child = child.sibling
    end
    return true
end
local u235 = nil
local updateHostComponent = nil
local updateHostText = nil
if supportsMutation then
    function u235(p1, p2, p3, p4) -- Line: 223 -- upvalues: HostComponent (val), HostText (val), appendInitialChild (val), enableFundamentalAPI (val), FundamentalComponent (val), HostPortal (val)
        local v1, v2
        local child = p2.child
        v1, v2 = p1, p2
        while child ~= nil do
            if child.tag ~= HostComponent and child.tag ~= HostText then
                if enableFundamentalAPI and child.tag == FundamentalComponent then
                    appendInitialChild(v1, child.stateNode.instance)
                    if child == v2 then
                        return
                    end
                    while child.sibling == nil do
                        if child.return_ ~= nil and child.return_ ~= v2 then
                            child = child.return_
                            continue
                        end
                        return
                    end
                    child.sibling.return_ = child.return_
                    child = child.sibling
                    continue
                end
                if child.tag ~= HostPortal then end
                if child.child ~= nil then
                    child.child.return_ = child
                    child = child.child
                end
            end
            appendInitialChild(v1, child.stateNode)
        end
    end
    function updateHostContainer(p1, p2) end
    function updateHostComponent(p1, p2, p3, p4, p5) -- Line: 264 -- upvalues: getHostContext (val), prepareUpdate (val), Update (val)
        local memoizedProps = p1.memoizedProps
        if memoizedProps == p4 then
            return
        end
        local v1 = prepareUpdate(p2.stateNode, p3, memoizedProps, p4, p5, (getHostContext()))
        p2.updateQueue = v1
        if v1 then
            p2.flags = bit32.bor(p2.flags, Update)
        end
    end
    function updateHostText(p1, p2, p3, p4) -- Line: 305 -- upvalues: Update (val)
        if p3 ~= p4 then
            p2.flags = bit32.bor(p2.flags, Update)
        end
    end
elseif not supportsPersistence then
    function updateHostContainer(p1, p2) end
else
    function u235(p1, p2, p3, p4) -- Line: 318
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"))
        error("FIXME (roblox): appendAllChildren is unimplemented", 2)
    end
    local function appendAllChildrenToContainer(p1, p2, p3, p4) -- Line: 413
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
        error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
    end
    function updateHostContainer(p1, p2) -- Line: 507 -- upvalues: hadNoMutationsEffects (val), createContainerChildSet (val), Update (val), finalizeContainerChildren (val)
        local stateNode = p2.stateNode
        if hadNoMutationsEffects(p1, p2) then
            return
        end
        local containerInfo = stateNode.containerInfo
        local v1 = createContainerChildSet(containerInfo)
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
        error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
        stateNode.pendingChildren = v1
        p2.flags = bit32.bor(p2.flags, Update)
        finalizeContainerChildren(containerInfo, v1)
    end
end
local function bubbleProperties(p1) -- Line: 716 -- upvalues: NoLanes (val), NoFlags (val), enableProfilerTimer (val), ProfileMode (val), NoMode (val), mergeLanes (val), StaticMask (val)
    local child, v1
    local v2 = if p1.alternate ~= nil then p1.alternate.child == p1.child else false
    local v3 = NoLanes
    local v4 = NoFlags
    if v2 then
        if not enableProfilerTimer then
            local child_4 = p1.child
            while child_4 ~= nil do
                v3 = bit32.bor(v3, (bit32.bor(child_4.lanes, child_4.childLanes)))
                v4 = bit32.bor(bit32.bor(v4, (bit32.band(child_4.subtreeFlags, StaticMask))), (bit32.band(child_4.flags, StaticMask)))
                child_4.return_ = p1
                child_4 = child_4.sibling
            end
        else
            v1 = bit32.band(p1.mode, ProfileMode)
            if v1 ~= NoMode then
                local selfBaseDuration_2 = p1.selfBaseDuration
                local child_3 = p1.child
                while child_3 ~= nil do
                    v3 = mergeLanes(v3, mergeLanes(child_3.lanes, child_3.childLanes))
                    v4 = bit32.bor(bit32.bor(v4, (bit32.band(child_3.subtreeFlags, StaticMask))), (bit32.band(child_3.flags, StaticMask)))
                    selfBaseDuration_2 = selfBaseDuration_2 + child_3.treeBaseDuration
                    child_3 = child_3.sibling
                end
                p1.treeBaseDuration = selfBaseDuration_2
            end
        end
        p1.subtreeFlags = bit32.bor(p1.subtreeFlags, v4)
    else
        if not enableProfilerTimer then
            local child_2 = p1.child
            while child_2 ~= nil do
                v3 = bit32.bor(v3, (bit32.bor(child_2.lanes, child_2.childLanes)))
                v4 = bit32.bor(bit32.bor(v4, child_2.subtreeFlags), child_2.flags)
                child_2.return_ = p1
                child_2 = child_2.sibling
            end
        else
            v1 = bit32.band(p1.mode, ProfileMode)
            if v1 ~= NoMode then
                local actualDuration = p1.actualDuration
                local selfBaseDuration = p1.selfBaseDuration
                child = p1.child
                while child ~= nil do
                    v3 = mergeLanes(v3, mergeLanes(child.lanes, child.childLanes))
                    v4 = bit32.bor(bit32.bor(v4, child.subtreeFlags), child.flags)
                    actualDuration = actualDuration + child.actualDuration
                    selfBaseDuration = selfBaseDuration + child.treeBaseDuration
                    child = child.sibling
                end
                p1.actualDuration = actualDuration
                p1.treeBaseDuration = selfBaseDuration
            end
        end
        p1.subtreeFlags = bit32.bor(p1.subtreeFlags, v4)
    end
    p1.childLanes = v3
    return v2
end
return {
    completeWork = function(p1, p2, p3) -- Line: 855 -- upvalues: IndeterminateComponent (val), LazyComponent (val), SimpleMemoComponent (val), FunctionComponent (val), ForwardRef (val), Fragment (val), Mode (val), ContextConsumer (val), MemoComponent (val), bubbleProperties (val), ClassComponent (val), isContextProvider (val), popContext (val), HostRoot (val), popHostContainer (val), popTopLevelContextObject (val), resetWorkInProgressVersions (val), popHydrationState (val), Update (val), Snapshot (val), updateHostContainer (ref), HostComponent (val), popHostContext (val), getRootHostContainer (val), updateHostComponent (ref), Ref (val), invariant (val), getHostContext (val), prepareToHydrateHostInstance (val), createInstance (val), u235 (ref), finalizeInitialChildren (val), HostText (val), updateHostText (ref), prepareToHydrateHostTextInstance (val), createTextInstance (val), Profiler (val), Callback (val), Passive (val), PerformedWork (val), NoFlags (val), LayoutMask (val), Deletion (val), PassiveMask (val), SuspenseComponent (val), popSuspenseContext (val), enableSuspenseServerRenderer (val), prepareToHydrateHostSuspenseInstance (val), enableSchedulerTracing (val), markSpawnedWork (val), OffscreenLane (val), enableProfilerTimer (val), ProfileMode (val), NoMode (val), resetHydrationState (val), DidCapture (val), transferActualDuration (val), BlockingMode (val), hasSuspenseContext (val), suspenseStackCursor (val), InvisibleParentSuspenseContext (val), renderDidSuspend (val), renderDidSuspendDelayIfPossible (val), supportsPersistence (val), supportsMutation (val), enableSuspenseCallback (val), HostPortal (val), preparePortalMount (val), ContextProvider (val), popProvider (val), IncompleteClassComponent (val), SuspenseListComponent (val), FundamentalComponent (val), ScopeComponent (val), Block (val), OffscreenComponent (val), LegacyHiddenComponent (val), popRenderLanes (val), includesSomeLane (val), u215 (val), ConcurrentMode (val)
        local pendingProps = p2.pendingProps
        if p2.tag == IndeterminateComponent then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == LazyComponent then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == SimpleMemoComponent then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == FunctionComponent then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == ForwardRef then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == Fragment then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == Mode then
            bubbleProperties(p2)
            return nil
        elseif p2.tag == ContextConsumer then
            bubbleProperties(p2)
            return nil
        else
            local child, stateNode, type, v1, v2
            if p2.tag == MemoComponent then
                bubbleProperties(p2)
                return nil
            end
            if p2.tag == ClassComponent then
                if isContextProvider(p2.type) then
                    popContext(p2)
                end
                bubbleProperties(p2)
                return nil
            end
            if p2.tag == HostRoot then
                popHostContainer(p2)
                popTopLevelContextObject(p2)
                resetWorkInProgressVersions()
                stateNode = p2.stateNode
                if stateNode.pendingContext then
                    stateNode.context = stateNode.pendingContext
                    stateNode.pendingContext = nil
                end
                if p1 == nil then
                    if popHydrationState(p2) then
                        p2.flags = bit32.bor(p2.flags, Update)
                    elseif not stateNode.hydrate then
                        p2.flags = bit32.bor(p2.flags, Snapshot)
                    end
                elseif p1.child == nil then
                    if popHydrationState(p2) then
                        p2.flags = bit32.bor(p2.flags, Update)
                    elseif not stateNode.hydrate then
                        p2.flags = bit32.bor(p2.flags, Snapshot)
                    end
                end
                updateHostContainer(p1, p2)
                bubbleProperties(p2)
                return nil
            end
            if p2.tag ~= HostComponent then
                local memoizedState, v3
                if p2.tag == HostText then
                    if not p1 then
                        if typeof(pendingProps) ~= "string" then
                            v3 = p2.stateNode ~= nil
                            invariant(v3, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
                        end
                        if not (popHydrationState(p2)) then
                            p2.stateNode = createTextInstance(pendingProps, getRootHostContainer(), getHostContext(), p2)
                        elseif prepareToHydrateHostTextInstance(p2) then
                            p2.flags = bit32.bor(p2.flags, Update)
                        end
                    elseif p2.stateNode ~= nil then
                        updateHostText(p1, p2, p1.memoizedProps, pendingProps)
                    end
                    bubbleProperties(p2)
                    return nil
                end
                if p2.tag == Profiler then
                    if not (bubbleProperties(p2)) then
                        v1 = Callback
                        v2 = Passive
                        local subtreeFlags = p2.subtreeFlags
                        local flags = p2.flags
                        local v4 = flags
                        local v5 = bit32.band(flags, PerformedWork)
                        if v5 ~= NoFlags then
                            v4 = bit32.bor(v4, Update)
                        else
                            v5 = bit32.band(subtreeFlags, PerformedWork)
                            if v5 == NoFlags then end
                        end
                        v5 = bit32.band(flags, (bit32.bor(LayoutMask, Deletion)))
                        if v5 ~= NoFlags then
                            v4 = bit32.bor(v4, v1)
                        else
                            v5 = bit32.band(subtreeFlags, (bit32.bor(LayoutMask, Deletion)))
                            if v5 == NoFlags then end
                        end
                        v5 = bit32.band(flags, PassiveMask)
                        if v5 ~= NoFlags then
                            v4 = bit32.bor(v4, v2)
                        else
                            v5 = bit32.band(subtreeFlags, PassiveMask)
                            if v5 ~= NoFlags then
                                v4 = bit32.bor(v4, v2)
                            end
                        end
                        p2.flags = v4
                    end
                    return nil
                end
                if p2.tag ~= SuspenseComponent then
                    if p2.tag == HostPortal then
                        popHostContainer(p2)
                        updateHostContainer(p1, p2)
                        if p1 == nil then
                            preparePortalMount(p2.stateNode.containerInfo)
                        end
                        bubbleProperties(p2)
                        return nil
                    end
                    if p2.tag == ContextProvider then
                        popProvider(p2)
                        bubbleProperties(p2)
                        return nil
                    end
                    if p2.tag == IncompleteClassComponent then
                        if isContextProvider(p2.type) then
                            popContext(p2)
                        end
                        bubbleProperties(p2)
                        return nil
                    end
                    if p2.tag == SuspenseListComponent then
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
                        error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
                        invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(p2.tag)))
                        return nil
                    end
                    if p2.tag == FundamentalComponent then
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
                        error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
                        invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(p2.tag)))
                        return nil
                    end
                    if p2.tag == ScopeComponent then
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
                        error("FIXME (roblox): ScopeComponent is unimplemented", 2)
                        invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(p2.tag)))
                        return nil
                    end
                    if p2.tag == Block then
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
                        error("FIXME (roblox): Block is unimplemented", 2)
                        invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(p2.tag)))
                        return nil
                    end
                    if p2.tag == OffscreenComponent then
                        popRenderLanes(p2)
                        v3 = p2.memoizedState ~= nil
                        if p1 ~= nil then
                            v2 = p1.memoizedState ~= nil
                            if v2 ~= v3 and pendingProps.mode ~= "unstable-defer-without-hiding" then
                                p2.flags = bit32.bor(p2.flags, Update)
                            end
                        end
                        if not v3 then
                            bubbleProperties(p2)
                        elseif includesSomeLane(u215.subtreeRenderLanes, OffscreenLane) then
                            bubbleProperties(p2)
                        else
                            v1 = bit32.band(p2.mode, ConcurrentMode)
                            if v1 == NoMode then
                                bubbleProperties(p2)
                            end
                        end
                        return nil
                    elseif p2.tag ~= LegacyHiddenComponent then
                        invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(p2.tag)))
                        return nil
                    end
                else
                    popSuspenseContext(p2)
                    memoizedState = p2.memoizedState
                    if not enableSuspenseServerRenderer then
                        v3 = bit32.band(p2.flags, DidCapture)
                        if v3 ~= NoFlags then
                            p2.lanes = p3
                            if enableProfilerTimer then
                                v3 = bit32.band(p2.mode, ProfileMode)
                                if v3 ~= NoMode then
                                    transferActualDuration(p2)
                                end
                            end
                            return p2
                        end
                        v3 = memoizedState ~= nil
                        v1 = false
                        if p1 ~= nil then
                            v1 = p1.memoizedState ~= nil
                        elseif p2.memoizedProps.fallback ~= nil then
                            popHydrationState(p2)
                        end
                        if v3 and not v1 then
                            v2 = bit32.band(p2.mode, BlockingMode)
                            if v2 ~= NoMode then
                                v2 = if p1 == nil then p2.memoizedProps.unstable_avoidThisFallback ~= true else false
                                if v2 then
                                    renderDidSuspend()
                                elseif not (hasSuspenseContext(suspenseStackCursor.current, InvisibleParentSuspenseContext)) then
                                    renderDidSuspendDelayIfPossible()
                                end
                            end
                        end
                        if supportsPersistence and v3 then
                            p2.flags = bit32.bor(p2.flags, Update)
                        end
                        if supportsMutation then
                            if v3 then
                                p2.flags = bit32.bor(p2.flags, Update)
                            elseif not v1 then
                            end
                        end
                        if enableSuspenseCallback and p2.updateQueue ~= nil and p2.memoizedProps.suspenseCallback ~= nil then
                            p2.flags = bit32.bor(p2.flags, Update)
                        end
                        bubbleProperties(p2)
                        if enableProfilerTimer then
                            v2 = bit32.band(p2.mode, ProfileMode)
                            if v2 ~= NoMode and v3 then
                                local child_3 = p2.child
                                if child_3 ~= nil then
                                    p2.treeBaseDuration = p2.treeBaseDuration - child_3.treeBaseDuration
                                end
                            end
                        end
                        return nil
                    elseif memoizedState ~= nil and memoizedState.dehydrated ~= nil then
                        if p1 == nil then
                            v3 = popHydrationState(p2)
                            invariant(v3, "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.")
                            prepareToHydrateHostSuspenseInstance(p2)
                            if enableSchedulerTracing then
                                markSpawnedWork(OffscreenLane)
                            end
                            bubbleProperties(p2)
                            if enableProfilerTimer then
                                v1 = bit32.band(p2.mode, ProfileMode)
                                if v1 ~= NoMode then
                                    v1 = memoizedState ~= nil
                                    if v1 then
                                        child = p2.child
                                        if child ~= nil then
                                            p2.treeBaseDuration = child.treeBaseDuration
                                        end
                                    end
                                end
                            end
                            return nil
                        end
                        resetHydrationState()
                        v3 = bit32.band(p2.flags, DidCapture)
                        if v3 == NoFlags then
                            p2.memoizedState = nil
                        end
                        p2.flags = bit32.bor(p2.flags, Update)
                        bubbleProperties(p2)
                        if enableProfilerTimer then
                            v3 = bit32.band(p2.mode, ProfileMode)
                            if v3 ~= NoMode then
                                v3 = memoizedState ~= nil
                                if v3 then
                                    local child_2 = p2.child
                                    if child_2 ~= nil then
                                        p2.treeBaseDuration = p2.treeBaseDuration - child_2.treeBaseDuration
                                    end
                                end
                            end
                        end
                        return nil
                    end
                end
            else
                popHostContext(p2)
                local v6 = getRootHostContainer()
                type = p2.type
                if p1 == nil then
                    if not pendingProps then
                        v2 = p2.stateNode ~= nil
                        invariant(v2, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
                        bubbleProperties(p2)
                        return nil
                    end
                    v1 = getHostContext()
                    if not (popHydrationState(p2)) then
                        local v7 = createInstance(type, pendingProps, v6, v1, p2)
                        u235(v7, p2, false, false)
                        p2.stateNode = v7
                        if finalizeInitialChildren(v7, type, pendingProps, v6, v1) then
                            p2.flags = bit32.bor(p2.flags, Update)
                        end
                    elseif prepareToHydrateHostInstance(p2, v6, v1) then
                        p2.flags = bit32.bor(p2.flags, Update)
                    end
                    if p2.ref ~= nil then
                        p2.flags = bit32.bor(p2.flags, Ref)
                    end
                    bubbleProperties(p2)
                    return nil
                elseif p2.stateNode ~= nil then
                    updateHostComponent(p1, p2, type, pendingProps, v6)
                    if p1.ref ~= p2.ref then
                        p2.flags = bit32.bor(p2.flags, Ref)
                    end
                    bubbleProperties(p2)
                    return nil
                end
            end
        end
    end,
}