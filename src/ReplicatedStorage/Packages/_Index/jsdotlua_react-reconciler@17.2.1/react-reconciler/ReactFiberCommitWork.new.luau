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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberCommitWork.new
--                               Dumped in 0.0153 seconds
--                          Bytecode version 9  |  56 functions

local recursivelyCommitLayoutEffects
local function unimplemented(p1) -- Line: 11
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(p1))
    error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
local __DEV__ = _G.__DEV__
local __YOLO__ = _G.__YOLO__
local u5 = 0
local function isCallable(p1) -- Line: 27
    if typeof(p1) == "function" then
        return true
    end
    if typeof(p1) ~= "table" then
        return false
    end
    local v1 = getmetatable(p1)
    if not v1 then
        if p1._isMockFunction then
            return true
        end
        return false
    end
    if rawget(v1, "__call") or p1._isMockFunction then
        return true
    end
    return false
end
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local Set = v1.Set
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v2 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local ReactHookEffectTags = require(script.Parent:WaitForChild("ReactHookEffectTags"))
local unstable_wrap = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_wrap
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = ReactFeatureFlags.enableProfilerCommitHooks
local enableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FunctionComponent = ReactWorkTags.FunctionComponent
local ForwardRef = ReactWorkTags.ForwardRef
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local Profiler = ReactWorkTags.Profiler
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local DehydratedFragment = ReactWorkTags.DehydratedFragment
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local ScopeComponent = ReactWorkTags.ScopeComponent
local Block = ReactWorkTags.Block
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
local ReactErrorUtils = require(script.Parent.Parent:WaitForChild("shared")).ReactErrorUtils
local invokeGuardedCallback = ReactErrorUtils.invokeGuardedCallback
local hasCaughtError = ReactErrorUtils.hasCaughtError
local clearCaughtError = ReactErrorUtils.clearCaughtError
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local ContentReset = ReactFiberFlags.ContentReset
local Placement = ReactFiberFlags.Placement
local Snapshot = ReactFiberFlags.Snapshot
local Update = ReactFiberFlags.Update
local Callback = ReactFiberFlags.Callback
local LayoutMask = ReactFiberFlags.LayoutMask
local PassiveMask = ReactFiberFlags.PassiveMask
local Ref = ReactFiberFlags.Ref
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local current = ReactCurrentFiber.current
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local onCommitUnmount = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).onCommitUnmount
local resolveDefaultProps = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v3 = require(script.Parent:WaitForChild("ReactProfilerTimer.new"))
local startLayoutEffectTimer = v3.startLayoutEffectTimer
local recordPassiveEffectDuration = v3.recordPassiveEffectDuration
local recordLayoutEffectDuration = v3.recordLayoutEffectDuration
local startPassiveEffectTimer = v3.startPassiveEffectTimer
local getCommitTime = v3.getCommitTime
local ProfileMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).ProfileMode
local commitUpdateQueue = v2.commitUpdateQueue
local getPublicInstance = ReactFiberHostConfig.getPublicInstance
local supportsMutation = ReactFiberHostConfig.supportsMutation
local supportsPersistence = ReactFiberHostConfig.supportsPersistence
local supportsHydration = ReactFiberHostConfig.supportsHydration
local commitMount = ReactFiberHostConfig.commitMount
local commitUpdate = ReactFiberHostConfig.commitUpdate
local resetTextContent = ReactFiberHostConfig.resetTextContent
local commitTextUpdate = ReactFiberHostConfig.commitTextUpdate
local appendChild = ReactFiberHostConfig.appendChild
local appendChildToContainer = ReactFiberHostConfig.appendChildToContainer
local insertBefore = ReactFiberHostConfig.insertBefore
local insertInContainerBefore = ReactFiberHostConfig.insertInContainerBefore
local removeChild = ReactFiberHostConfig.removeChild
local removeChildFromContainer = ReactFiberHostConfig.removeChildFromContainer
local hideInstance = ReactFiberHostConfig.hideInstance
local hideTextInstance = ReactFiberHostConfig.hideTextInstance
local unhideInstance = ReactFiberHostConfig.unhideInstance
local unhideTextInstance = ReactFiberHostConfig.unhideTextInstance
local commitHydratedSuspenseInstance = ReactFiberHostConfig.commitHydratedSuspenseInstance
local clearContainer = ReactFiberHostConfig.clearContainer
local u270 = nil
local function resolveRetryWakeable(p1, p2) -- Line: 190 -- upvalues: u270 (ref)
    if not u270 then
        u270 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u270.resolveRetryWakeable(p1, p2)
end
local function markCommitTimeOfFallback() -- Line: 197 -- upvalues: u270 (ref)
    if not u270 then
        u270 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u270.markCommitTimeOfFallback()
end
local function schedulePassiveEffectCallback() -- Line: 205 -- upvalues: console (val)
    console.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end
local function captureCommitPhaseError(p1, p2, p3) -- Line: 213 -- upvalues: console (val)
    console.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
    error(p3)
end
local NoFlags_2 = ReactHookEffectTags.NoFlags
local HasEffect = ReactHookEffectTags.HasEffect
local Layout = ReactHookEffectTags.Layout
local Passive = ReactHookEffectTags.Passive
local u279 = nil
local function u280() -- Line: 231 -- upvalues: u279 (ref)
    if not u279 then
        u279 = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).didWarnAboutReassigningProps
    end
    return u279
end
local isHostParent = nil
local insertOrAppendPlacementNode = nil
local insertOrAppendPlacementNodeIntoContainer = nil
local commitLayoutEffectsForHostRoot = nil
local commitLayoutEffectsForHostComponent = nil
local commitLayoutEffectsForClassComponent = nil
local unmountHostComponents = nil
local u291 = nil
local function callComponentWillUnmountWithTimer(p1, p2) -- Line: 256 -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startLayoutEffectTimer (val), describeError (val), recordLayoutEffectDuration (val)
    local v1, v2
    p2.props = p1.memoizedProps
    p2.state = p1.memoizedState
    if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p1.mode, ProfileMode) == 0 then
        p2:componentWillUnmount()
        return
    end
    v1, v2 = xpcall(function() -- Line: 265 -- upvalues: startLayoutEffectTimer (upval), p2 (val)
        startLayoutEffectTimer()
        p2:componentWillUnmount()
    end, describeError)
    recordLayoutEffectDuration(p1)
    if v1 then
        return
    end
    error(v2)
end
function safelyCallComponentWillUnmount(p1, p2, p3) -- Line: 283 -- upvalues: callComponentWillUnmountWithTimer (val), describeError (val), captureCommitPhaseError (ref)
    local v1, v2
    v1, v2 = xpcall(callComponentWillUnmountWithTimer, describeError, p1, p2)
    if not v1 then
        captureCommitPhaseError(p1, p3, v2)
    end
end
local function safelyDetachRef(p1, p2) -- Line: 297 -- upvalues: describeError (val), captureCommitPhaseError (ref)
    local v1, v2
    local ref = p1.ref
    if ref == nil then
        return
    end
    if typeof(ref) ~= "function" then
        ref.current = nil
        return
    end
    v1, v2 = xpcall(ref, describeError)
    if v1 then
        return
    end
    captureCommitPhaseError(p1, p2, v2)
end
local function commitHookEffectListUnmount(p1, p2, p3) -- Line: 418 -- upvalues: describeError (val), captureCommitPhaseError (ref)
    local lastEffect
    local updateQueue = p2.updateQueue
    lastEffect = if updateQueue ~= nil then updateQueue.lastEffect else nil
    if lastEffect ~= nil then
        local destroy, v1, v2, v3, v4, v5
        local next = lastEffect.next
        local next_2 = next
        v1, v2, v3 = p1, p2, p3
        while true do
            if bit32.band(next_2.tag, v1) == v1 then
                destroy = next_2.destroy
                next_2.destroy = nil
                if destroy ~= nil then
                    v4, v5 = xpcall(destroy, describeError)
                    if not v4 then
                        captureCommitPhaseError(v2, v3, v5)
                    end
                end
            end
            next_2 = next_2.next
            if next_2 == next then
                break
            end
        end
    end
end
local function commitHookEffectListMount(p1, p2) -- Line: 446 -- upvalues: __DEV__ (val), console (val)
    local lastEffect
    local updateQueue = p2.updateQueue
    if updateQueue == nil then
        lastEffect = nil
    else
        lastEffect = updateQueue.lastEffect
    end
    if lastEffect ~= nil then
        local destroy, v1
        local next = lastEffect.next
        local next_2 = next
        local v2 = p1
        while true do
            if bit32.band(next_2.tag, v2) == v2 then
                next_2.destroy = next_2.create()
                if __DEV__ then
                    destroy = next_2.destroy
                    if destroy ~= nil and typeof(destroy) ~= "function" then
                        if destroy == nil then
                            v1 = " You returned nil. If your effect does not require clean up, return nil (or nothing)."
                        elseif typeof(destroy.andThen) ~= "function" then
                            v1 = " You returned: " .. destroy
                        else
                            v1 = "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn't need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching"
                        end
                        console.error("An effect function must not return anything besides a function, which is used for clean-up.%s", v1)
                    end
                end
            end
            next_2 = next_2.next
            if next_2 == next then
                break
            end
        end
    end
end
function commitProfilerPassiveEffect(p1, p2) -- Line: 497 -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), Profiler (val), getCommitTime (val), enableSchedulerTracing (val)
    local v1
    if not enableProfilerTimer or not enableProfilerCommitHooks or p2.tag ~= Profiler then
        return
    end
    local passiveEffectDuration = p2.stateNode.passiveEffectDuration
    local id = p2.memoizedProps.id
    local onPostCommit = p2.memoizedProps.onPostCommit
    local v2 = getCommitTime()
    if typeof(onPostCommit) ~= "function" then
        return
    end
    if enableSchedulerTracing then
        if p2.alternate ~= nil then
            v1 = "update"
        else
            v1 = "mount"
        end
        onPostCommit(id, v1, passiveEffectDuration, v2, p1.memoizedInteractions)
        return
    end
    if p2.alternate ~= nil then
        v1 = "update"
    else
        v1 = "mount"
    end
    onPostCommit(id, v1, passiveEffectDuration, v2)
end
function recursivelyCommitLayoutEffects(p1, p2, p3, p4) -- Line: 530 -- upvalues: captureCommitPhaseError (ref), schedulePassiveEffectCallback (ref), Profiler (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), u291 (ref), LayoutMask (val), NoFlags (val), __DEV__ (val), current (val), setCurrentFiber (val), invokeGuardedCallback (val), recursivelyCommitLayoutEffects (val), hasCaughtError (val), clearCaughtError (val), resetCurrentFiber (val), describeError (val), Update (val), Callback (val), ReactCurrentFiber (val), u5 (ref), __YOLO__ (val), FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), ProfileMode (val), startLayoutEffectTimer (val), commitHookEffectListMount (val), Layout (val), HasEffect (val), recordLayoutEffectDuration (val), PassiveMask (val), ClassComponent (val), commitLayoutEffectsForClassComponent (ref), HostRoot (val), commitLayoutEffectsForHostRoot (ref), HostComponent (val), commitLayoutEffectsForHostComponent (ref), SuspenseComponent (val), FundamentalComponent (val), HostPortal (val), HostText (val), IncompleteClassComponent (val), LegacyHiddenComponent (val), OffscreenComponent (val), ScopeComponent (val), SuspenseListComponent (val), invariant (val), Ref (val)
    local current_2, u240, v1, v2, v3, v4, v5, v6
    if p3 ~= nil then
        captureCommitPhaseError = p3
    end
    if p4 ~= nil then
        schedulePassiveEffectCallback = p4
    end
    local flags = p1.flags
    local tag = p1.tag
    if tag == Profiler then
        local v7 = nil
        if enableProfilerTimer and enableProfilerCommitHooks then
            v7 = u291
            u291 = p1
        end
        local child = p1.child
        u240, v1 = p1, p2
        while child ~= nil do
            v5 = bit32.band(u240.subtreeFlags, LayoutMask)
            if v5 ~= NoFlags then
                if not __DEV__ then
                    v6, v2 = xpcall(recursivelyCommitLayoutEffects, describeError, child, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                    if not v6 then
                        captureCommitPhaseError(child, u240, v2)
                    end
                else
                    v6 = current
                    setCurrentFiber(child)
                    invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, child, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                    if hasCaughtError() then
                        captureCommitPhaseError(child, u240, (clearCaughtError()))
                    end
                    if v6 == nil then
                        resetCurrentFiber()
                    else
                        setCurrentFiber(v6)
                    end
                end
            end
            child = child.sibling
        end
        v5 = bit32.band(flags, (bit32.bor(Update, Callback)))
        if v5 ~= NoFlags and enableProfilerTimer then
            if not __DEV__ then
                v6, v2 = xpcall(commitLayoutEffectsForProfiler, describeError, u240, v1)
                if not v6 then
                    captureCommitPhaseError(u240, u240.return_, v2)
                end
            else
                v6 = current
                setCurrentFiber(u240)
                invokeGuardedCallback(nil, commitLayoutEffectsForProfiler, nil, u240, v1)
                if hasCaughtError() then
                    captureCommitPhaseError(u240, u240.return_, (clearCaughtError()))
                end
                if v6 == nil then
                    resetCurrentFiber()
                else
                    setCurrentFiber(v6)
                end
            end
        end
        if not enableProfilerTimer or not enableProfilerCommitHooks then
            return
        end
        if v7 ~= nil then
            local stateNode = v7.stateNode
            stateNode.effectDuration = stateNode.effectDuration + u240.stateNode.effectDuration
        end
        u291 = v7
        return
    end
    local child_2 = p1.child
    u240, v1 = p1, p2
    while child_2 ~= nil do
        v4 = bit32.band(u240.subtreeFlags, LayoutMask)
        if v4 ~= NoFlags then
            if not __DEV__ then
                v6 = nil
                if __YOLO__ then
                    v5 = true
                    recursivelyCommitLayoutEffects(child_2, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                elseif u5 < 20 then
                    u5 = u5 + 1
                    v2, v3 = xpcall(recursivelyCommitLayoutEffects, describeError, child_2, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                    v5 = v2
                    v6 = v3
                    u5 = u5 - 1
                end
                if not v5 then
                    captureCommitPhaseError(child_2, u240, v6)
                end
            else
                current_2 = ReactCurrentFiber.current
                setCurrentFiber(child_2)
                if u5 >= 20 then
                    recursivelyCommitLayoutEffects(child_2, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                else
                    u5 = u5 + 1
                    invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, child_2, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                    u5 = u5 - 1
                    if hasCaughtError() then
                        captureCommitPhaseError(child_2, u240, (clearCaughtError()))
                    end
                end
                if current_2 == nil then
                    resetCurrentFiber()
                else
                    setCurrentFiber(current_2)
                end
            end
        end
        child_2 = child_2.sibling
    end
    v4 = bit32.band(flags, (bit32.bor(Update, Callback)))
    if v4 ~= NoFlags then
        if tag == FunctionComponent then
            if not enableProfilerTimer then
                v6 = bit32.bor(Layout, HasEffect)
                commitHookEffectListMount(v6, u240)
            elseif enableProfilerCommitHooks and bit32.band(u240.mode, ProfileMode) ~= 0 then
                v5, v6 = xpcall(function() -- Line: 751 -- upvalues: startLayoutEffectTimer (upval), commitHookEffectListMount (upval), Layout (upval), HasEffect (upval), u240 (val)
                    startLayoutEffectTimer()
                    local v1 = bit32.bor(Layout, HasEffect)
                    commitHookEffectListMount(v1, u240)
                end, describeError)
                recordLayoutEffectDuration(u240)
                if not v5 then
                    error(v6)
                end
            end
            v5 = bit32.band(u240.subtreeFlags, PassiveMask)
            if v5 ~= NoFlags then
                schedulePassiveEffectCallback()
            end
        elseif tag ~= ForwardRef and tag ~= SimpleMemoComponent and tag ~= Block then
            if tag == ClassComponent then
                commitLayoutEffectsForClassComponent(u240)
            elseif tag == HostRoot then
                commitLayoutEffectsForHostRoot(u240)
            elseif tag == HostComponent then
                commitLayoutEffectsForHostComponent(u240)
            elseif tag == SuspenseComponent then
                commitSuspenseHydrationCallbacks(v1, u240)
            elseif tag ~= FundamentalComponent and tag ~= HostPortal and tag ~= HostText and tag ~= IncompleteClassComponent and tag ~= LegacyHiddenComponent and tag ~= OffscreenComponent and tag ~= ScopeComponent and tag ~= SuspenseListComponent then
                invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
            end
        end
    end
    if bit32.band(flags, Ref) ~= 0 then
        commitAttachRef(u240)
    end
end
function commitLayoutEffectsForProfiler(p1, p2) -- Line: 814 -- upvalues: enableProfilerTimer (val), getCommitTime (val), Update (val), Callback (val), NoFlags (val), enableSchedulerTracing (val), enableProfilerCommitHooks (val)
    local v1, v2
    if not enableProfilerTimer then
        return
    end
    local flags = p1.flags
    local alternate = p1.alternate
    local onCommit = p1.memoizedProps.onCommit
    local onRender = p1.memoizedProps.onRender
    local effectDuration = p1.stateNode.effectDuration
    local v3 = getCommitTime()
    local v4 = Callback
    local v5 = bit32.band(flags, Update)
    if v5 ~= NoFlags then
        if typeof(onRender) == "function" then
            v5 = true
        elseif typeof(onRender) ~= "table" then
            v5 = false
        else
            v1 = getmetatable(onRender)
            if not v1 then
                if onRender._isMockFunction then
                    v5 = true
                end
            elseif rawget(v1, "__call") then
                v5 = true
            end
        end
        if v5 then
            if not enableSchedulerTracing then
                if alternate ~= nil then
                    v2 = "update"
                else
                    v2 = "mount"
                end
                onRender(p1.memoizedProps.id, v2, p1.actualDuration, p1.treeBaseDuration, p1.actualStartTime, v3)
            else
                if alternate ~= nil then
                    v2 = "update"
                else
                    v2 = "mount"
                end
                onRender(p1.memoizedProps.id, v2, p1.actualDuration, p1.treeBaseDuration, p1.actualStartTime, v3, p2.memoizedInteractions)
            end
        end
    end
    if not enableProfilerCommitHooks then
        return
    end
    v5 = bit32.band(flags, v4)
    if v5 == NoFlags then
        return
    end
    if typeof(onCommit) == "function" then
        v5 = true
    elseif typeof(onCommit) ~= "table" then
        v5 = false
    else
        v1 = getmetatable(onCommit)
        if not v1 then
            if onCommit._isMockFunction then
                v5 = true
            end
        elseif rawget(v1, "__call") then
            v5 = true
        end
    end
    if not v5 then
        return
    end
    if enableSchedulerTracing then
        if alternate ~= nil then
            v2 = "update"
        else
            v2 = "mount"
        end
        onCommit(p1.memoizedProps.id, v2, effectDuration, v3, p2.memoizedInteractions)
        return
    end
    if alternate ~= nil then
        v2 = "update"
    else
        v2 = "mount"
    end
    onCommit(p1.memoizedProps.id, v2, effectDuration, v3)
end
function commitLayoutEffectsForClassComponent(p1) -- Line: 882 -- upvalues: Update (val), __DEV__ (val), u280 (val), console (val), getComponentName (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startLayoutEffectTimer (val), describeError (val), recordLayoutEffectDuration (val), resolveDefaultProps (val), commitUpdateQueue (val)
    local memoizedProps, memoizedState
    local stateNode = p1.stateNode
    local alternate = p1.alternate
    if bit32.band(p1.flags, Update) ~= 0 then
        if alternate ~= nil then
            if p1.elementType ~= p1.type then
                memoizedProps = resolveDefaultProps(p1.type, alternate.memoizedProps)
            else
                memoizedProps = alternate.memoizedProps
            end
            memoizedState = alternate.memoizedState
            if __DEV__ and p1.type == p1.elementType and not u280 then
                if stateNode.props ~= p1.memoizedProps then
                    console.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p1.type) or "instance")
                end
                if stateNode.state ~= p1.memoizedState then
                    console.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p1.type) or "instance")
                end
            end
            if not enableProfilerTimer then
                stateNode:componentDidUpdate(memoizedProps, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
            elseif enableProfilerCommitHooks and bit32.band(p1.mode, ProfileMode) ~= 0 then
                local v1, v2
                v1, v2 = xpcall(function() -- Line: 968 -- upvalues: startLayoutEffectTimer (upval), stateNode (val), memoizedProps (val), memoizedState (val)
                    startLayoutEffectTimer()
                    stateNode:componentDidUpdate(memoizedProps, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
                end, describeError)
                recordLayoutEffectDuration(p1)
                if not v1 then
                    error(v2)
                end
            end
        else
            if __DEV__ and p1.type == p1.elementType and not u280 then
                if stateNode.props ~= p1.memoizedProps then
                    console.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p1.type) or "instance")
                end
                if stateNode.state ~= p1.memoizedState then
                    console.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p1.type) or "instance")
                end
            end
            if not enableProfilerTimer then
                stateNode:componentDidMount()
            elseif enableProfilerCommitHooks and bit32.band(p1.mode, ProfileMode) ~= 0 then
                local v3, v4
                v3, v4 = xpcall(function() -- Line: 914 -- upvalues: startLayoutEffectTimer (upval), stateNode (val)
                    startLayoutEffectTimer()
                    stateNode:componentDidMount()
                end, describeError)
                recordLayoutEffectDuration(p1)
                if not v3 then
                    error(v4)
                end
            end
        end
    end
    local updateQueue = p1.updateQueue
    if updateQueue ~= nil then
        if __DEV__ and p1.type == p1.elementType and not u280 then
            if stateNode.props ~= p1.memoizedProps then
                console.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p1.type) or "instance")
            end
            if stateNode.state ~= p1.memoizedState then
                console.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p1.type) or "instance")
            end
        end
        commitUpdateQueue(p1, updateQueue, stateNode)
    end
end
function commitLayoutEffectsForHostRoot(p1) -- Line: 1031 -- upvalues: HostComponent (val), getPublicInstance (val), ClassComponent (val), commitUpdateQueue (val)
    local updateQueue = p1.updateQueue
    if updateQueue ~= nil then
        local child
        local stateNode = nil
        if p1.child ~= nil then
            child = p1.child
            if child.tag == HostComponent then
                stateNode = getPublicInstance(child.stateNode)
            elseif child.tag == ClassComponent then
                stateNode = child.stateNode
            end
        end
        commitUpdateQueue(p1, updateQueue, stateNode)
    end
end
function commitLayoutEffectsForHostComponent(p1) -- Line: 1050 -- upvalues: Update (val), commitMount (val)
    if p1.alternate == nil and bit32.band(p1.flags, Update) ~= 0 then
        commitMount(p1.stateNode, p1.type, p1.memoizedProps, p1)
    end
end
local function hideOrUnhideAllChildren(p1, p2) -- Line: 1065 -- upvalues: supportsMutation (val), HostComponent (val), hideInstance (val), unhideInstance (val), HostText (val), hideTextInstance (val), unhideTextInstance (val), OffscreenComponent (val), LegacyHiddenComponent (val)
    if not supportsMutation then
        return
    else
        local stateNode, v1, v2
        local child = p1
        v2, v1 = p2, p1
        while true do
            if child.tag ~= HostComponent then
                if child.tag == HostText then
                    stateNode = child.stateNode
                    if not v2 then
                        unhideTextInstance(stateNode, child.memoizedProps)
                    else
                        hideTextInstance(stateNode)
                    end
                elseif child.tag == OffscreenComponent then
                    if child.memoizedState == nil then
                        if child.child ~= nil then
                            child.child.return_ = child
                            child = child.child
                            continue
                        end
                    elseif child == v1 then
                    end
                elseif child.tag ~= LegacyHiddenComponent then
                end
            elseif not v2 then
                unhideInstance(child.stateNode, child.memoizedProps)
            else
                hideInstance(child.stateNode)
            end
            if child == v1 then
                return
            end
            while child.sibling == nil do
                if child.return_ ~= nil and child.return_ ~= v1 then
                    child = child.return_
                    continue
                end
                return
            end
            child.sibling.return_ = child.return_
            child = child.sibling
        end
    end
end
function commitAttachRef(p1) -- Line: 1115 -- upvalues: HostComponent (val), getPublicInstance (val), __DEV__ (val), console (val), getComponentName (val)
    local v1
    local ref = p1.ref
    if ref == nil then
        return
    end
    local stateNode = p1.stateNode
    if p1.tag ~= HostComponent then
        v1 = stateNode
    else
        v1 = getPublicInstance(stateNode)
    end
    if typeof(ref) == "function" then
        ref(v1)
        return
    end
    if not __DEV__ then
        ref.current = v1
        return
    end
    if typeof(ref) ~= "table" then
        console.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", getComponentName(p1.type) or "instance")
        return
    end
    ref.current = v1
end
function commitDetachRef(p1) -- Line: 1154
    local ref = p1.ref
    if ref == nil then
        return
    end
    if typeof(ref) == "function" then
        ref(nil)
        return
    end
    ref.current = nil
end
local function commitUnmount(p1, p2, p3, p4) -- Line: 1168 -- upvalues: onCommitUnmount (val), FunctionComponent (val), ForwardRef (val), MemoComponent (val), SimpleMemoComponent (val), Block (val), Layout (val), NoFlags_2 (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startLayoutEffectTimer (val), describeError (val), captureCommitPhaseError (ref), recordLayoutEffectDuration (val), ClassComponent (val), HostComponent (val), HostPortal (val), supportsMutation (val), unmountHostComponents (ref), supportsPersistence (val), unimplemented (val)
    onCommitUnmount(p2)
    if p2.tag == FunctionComponent then
        local updateQueue = p2.updateQueue
        if updateQueue ~= nil then
            local lastEffect = updateQueue.lastEffect
            if lastEffect ~= nil then
                local v1, v2, v3, v4, v5
                local next = lastEffect.next
                local next_2 = next
                v1, v3 = p2, p3
                while true do
                    if next_2.destroy ~= nil then
                        v4 = bit32.band(next_2.tag, Layout)
                        if v4 ~= NoFlags_2 then
                            if not enableProfilerTimer then
                                v5, v2 = xpcall(next_2.destroy, describeError)
                                if not v5 then
                                    captureCommitPhaseError(v1, v3, v2)
                                end
                            elseif enableProfilerCommitHooks and bit32.band(v1.mode, ProfileMode) ~= 0 then
                                startLayoutEffectTimer()
                                v5, v2 = xpcall(next_2.destroy, describeError)
                                if not v5 then
                                    captureCommitPhaseError(v1, v3, v2)
                                end
                                recordLayoutEffectDuration(v1)
                            end
                        end
                    end
                    next_2 = next_2.next
                    if next_2 == next then
                        break
                    end
                end
            end
        end
        return
    elseif p2.tag ~= ForwardRef and p2.tag ~= MemoComponent and p2.tag ~= SimpleMemoComponent and p2.tag ~= Block then
        local v6, v7
        if p2.tag == ClassComponent then
            local ref = p2.ref
            if ref ~= nil then
                if typeof(ref) ~= "function" then
                    ref.current = nil
                else
                    v6, v7 = xpcall(ref, describeError)
                    if not v6 then
                        captureCommitPhaseError(p2, p3, v7)
                    end
                end
            end
            local stateNode = p2.stateNode
            if typeof(stateNode.componentWillUnmount) == "function" then
                safelyCallComponentWillUnmount(p2, stateNode, p3)
            end
            return
        end
        if p2.tag ~= HostComponent then
            if p2.tag == HostPortal then
                if supportsMutation then
                    unmountHostComponents(p1, p2, p3, p4)
                    return
                end
                if supportsPersistence then
                    unimplemented("emptyPortalContainer")
                end
                return
            end
            return
        end
        local ref_2 = p2.ref
        if ref_2 == nil then
            return
        end
        if typeof(ref_2) ~= "function" then
            ref_2.current = nil
            return
        end
        v6, v7 = xpcall(ref_2, describeError)
        if v6 then
            return
        end
        captureCommitPhaseError(p2, p3, v7)
        return
    end
end
local function commitNestedUnmounts(p1, p2, p3, p4) -- Line: 1275 -- upvalues: commitUnmount (ref), supportsMutation (val), HostPortal (val)
    local v1, v2, v3, v4
    local child = p2
    v1, v3, v4 = p1, p3, p4
    while true do
        commitUnmount(v1, child, v3, v4)
        if child.child ~= nil then
            if not supportsMutation then
                child.child.return_ = child
                child = child.child
                continue
            elseif child.tag == HostPortal then
            end
        end
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
    end
end
local function detachFiberMutation(p1) -- Line: 1315
    local alternate = p1.alternate
    if alternate ~= nil then
        alternate.return_ = nil
        p1.alternate = nil
    end
    p1.return_ = nil
end
local function getHostParentFiber(p1) -- Line: 1382 -- upvalues: isHostParent (ref), Error (val)
    local return_ = p1.return_
    while return_ ~= nil do
        if isHostParent(return_) then
            return return_
        end
        return_ = return_.return_
    end
    error(Error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end
function isHostParent(p1) -- Line: 1400 -- upvalues: HostComponent (val), HostRoot (val), HostPortal (val)
    local v1 = if p1.tag ~= HostComponent then if p1.tag ~= HostRoot then p1.tag == HostPortal else true else true
    return v1
end
local function getHostSibling(p1) -- Line: 1404 -- upvalues: isHostParent (ref), HostComponent (val), HostText (val), DehydratedFragment (val), Placement (val), HostPortal (val)
    local v1
    local return_ = p1
    while true do
        v1 = false
        while return_.sibling == nil do
            if return_.return_ ~= nil and not (isHostParent(return_.return_)) then
                return_ = return_.return_
                continue
            end
            return nil
        end
        return_.sibling.return_ = return_.return_
        return_ = return_.sibling
        while return_.tag ~= HostComponent do
            if return_.tag == HostText or return_.tag == DehydratedFragment then
                break
            end
            if bit32.band(return_.flags, Placement) ~= 0 then
                v1 = true
                break
            end
            if return_.child ~= nil and return_.tag ~= HostPortal then
                return_.child.return_ = return_
                return_ = return_.child
                continue
            end
            v1 = true
            break
        end
        if not v1 and bit32.band(return_.flags, Placement) == 0 then
            return return_.stateNode
        end
    end
end
function insertOrAppendPlacementNodeIntoContainer(p1, p2, p3) -- Line: 1509 -- upvalues: HostComponent (val), HostText (val), insertInContainerBefore (val), appendChildToContainer (val), HostPortal (val), insertOrAppendPlacementNodeIntoContainer (ref)
    local tag = p1.tag
    local v1 = if tag ~= HostComponent then tag == HostText else true
    if v1 then
        local stateNode = p1.stateNode
        if p2 then
            insertInContainerBefore(p3, stateNode, p2)
            return
        end
        appendChildToContainer(p3, stateNode)
        return
    end
    if tag == HostPortal then
        return
    end
    local child = p1.child
    if child ~= nil then
        insertOrAppendPlacementNodeIntoContainer(child, p2, p3)
        local sibling = child.sibling
        while sibling ~= nil do
            insertOrAppendPlacementNodeIntoContainer(sibling, p2, p3)
            sibling = sibling.sibling
        end
    end
end
function insertOrAppendPlacementNode(p1, p2, p3) -- Line: 1541 -- upvalues: HostComponent (val), HostText (val), insertBefore (val), appendChild (val), HostPortal (val), insertOrAppendPlacementNode (ref)
    local tag = p1.tag
    local v1 = if tag ~= HostComponent then tag == HostText else true
    if v1 then
        local stateNode = p1.stateNode
        if p2 then
            insertBefore(p3, stateNode, p2)
            return
        end
        appendChild(p3, stateNode)
        return
    end
    if tag == HostPortal then
        return
    end
    local child = p1.child
    if child ~= nil then
        insertOrAppendPlacementNode(child, p2, p3)
        local sibling = child.sibling
        while sibling ~= nil do
            insertOrAppendPlacementNode(sibling, p2, p3)
            sibling = sibling.sibling
        end
    end
end
function unmountHostComponents(p1, p2, p3, p4) -- Line: 1569 -- upvalues: Error (val), HostComponent (val), HostRoot (val), HostPortal (val), HostText (val), commitNestedUnmounts (ref), removeChildFromContainer (val), removeChild (val), commitUnmount (ref)
    local return_, stateNode, v1, v2, v3, v4
    local child = p2
    local v5 = false
    local containerInfo = nil
    local v6 = nil
    v1, v3, v4, v2 = p1, p3, p4, p2
    while true do
        if not v5 then
            return_ = child.return_
            while true do
                if return_ == nil then
                    error(Error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
                end
                stateNode = return_.stateNode
                if return_.tag == HostComponent then
                    containerInfo = stateNode
                    v6 = false
                elseif return_.tag == HostRoot then
                    containerInfo = stateNode.containerInfo
                    v6 = true
                elseif return_.tag ~= HostPortal then
                    return_ = return_.return_
                    continue
                else
                    containerInfo = stateNode.containerInfo
                    v6 = true
                end
                v5 = true
                if child.tag == HostComponent then
                    commitNestedUnmounts(v1, child, v3, v4)
                    if not v6 then
                        removeChild(containerInfo, child.stateNode)
                    else
                        removeChildFromContainer(containerInfo, child.stateNode)
                    end
                elseif child.tag ~= HostText then
                    if child.tag ~= HostPortal then
                        commitUnmount(v1, child, v3, v4)
                        if child.child ~= nil then
                            child.child.return_ = child
                            child = child.child
                            break
                        end
                    elseif child.child ~= nil then
                        containerInfo = child.stateNode.containerInfo
                        v6 = true
                        child.child.return_ = child
                        child = child.child
                    end
                end
                if child ~= v2 then
                    while child.sibling == nil do
                        if child.return_ ~= nil and child.return_ ~= v2 then
                            child = child.return_
                            if child.tag == HostPortal then
                                v5 = false
                            end
                            continue
                        end
                        return
                    end
                    child.sibling.return_ = child.return_
                    child = child.sibling
                end
                return
            end
        end
    end
end
function commitSuspenseComponent(p1) -- Line: 1994 -- upvalues: u270 (ref), supportsMutation (val), hideOrUnhideAllChildren (val), enableSuspenseCallback (val), __DEV__ (val), console (val)
    local memoizedState = p1.memoizedState
    if memoizedState ~= nil then
        if not u270 then
            u270 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
        end
        u270.markCommitTimeOfFallback()
        if supportsMutation then
            hideOrUnhideAllChildren(p1.child, true)
        end
    end
    if not enableSuspenseCallback or memoizedState == nil then
        return
    end
    local suspenseCallback = p1.memoizedProps.suspenseCallback
    if typeof(suspenseCallback) ~= "function" then
        if __DEV__ and suspenseCallback ~= nil then
            console.error("Unexpected type for suspenseCallback: %s", (tostring(suspenseCallback)))
        end
        return
    end
    local updateQueue = p1.updateQueue
    if updateQueue == nil then
        return
    end
    suspenseCallback(table.clone(updateQueue))
end
function commitSuspenseHydrationCallbacks(p1, p2) -- Line: 2033 -- upvalues: supportsHydration (val), commitHydratedSuspenseInstance (val), enableSuspenseCallback (val)
    local memoizedState
    if not supportsHydration then
        return
    end
    if p2.memoizedState == nil then
        local alternate = p2.alternate
        if alternate ~= nil then
            memoizedState = alternate.memoizedState
            if memoizedState ~= nil then
                local dehydrated = memoizedState.dehydrated
                if dehydrated ~= nil then
                    commitHydratedSuspenseInstance(dehydrated)
                    if enableSuspenseCallback then
                        local hydrationCallbacks = p1.hydrationCallbacks
                        if hydrationCallbacks ~= nil then
                            local onHydrated = hydrationCallbacks.onHydrated
                            if onHydrated then
                                onHydrated(dehydrated)
                            end
                        end
                    end
                end
            end
        end
    end
end
function attachSuspenseRetryListeners(p1) -- Line: 2061 -- upvalues: Set (val), resolveRetryWakeable (val), enableSchedulerTracing (val), unstable_wrap (val)
    local updateQueue = p1.updateQueue
    if updateQueue ~= nil then
        p1.updateQueue = nil
        local stateNode = p1.stateNode
        if stateNode == nil then
            p1.stateNode = Set.new()
            stateNode = p1.stateNode
        end
        local v1 = updateQueue
        local v2 = nil
        local v3 = nil
        local u46 = p1
        for i, j in v1, v2, v3 do
            local function u31() -- Line: 2075 -- upvalues: resolveRetryWakeable (upval), u46 (val), i (val)
                return resolveRetryWakeable(u46, i)
            end
            if not (stateNode:has(i)) then
                if enableSchedulerTracing and i.__reactDoNotTraceInteractions ~= true then
                    u31 = unstable_wrap(u31)
                end
                stateNode:add(i)
                i:andThen(function() -- Line: 2086 -- upvalues: u31 (ref)
                    return u31()
                end, function() -- Line: 2088 -- upvalues: u31 (ref)
                    return u31()
                end)
            end
        end
    end
end
function isSuspenseBoundaryBeingHidden(p1, p2) -- Line: 2099
    local memoizedState_2, v1
    if p1 == nil then
        return false
    end
    local memoizedState = p1.memoizedState
    if memoizedState == nil then
        memoizedState_2 = p2.memoizedState
        v1 = if memoizedState_2 ~= nil then memoizedState_2.dehydrated == nil else false
        return v1
    end
    if memoizedState.dehydrated == nil then
        return false
    end
    memoizedState_2 = p2.memoizedState
    v1 = if memoizedState_2 ~= nil then memoizedState_2.dehydrated == nil else false
    return v1
end
function commitResetTextContent(p1) -- Line: 2111 -- upvalues: supportsMutation (val), resetTextContent (val)
    if not supportsMutation then
        return
    end
    resetTextContent(p1.stateNode)
end
function invokeLayoutEffectMountInDEV(p1) -- Line: 2204 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListMount (val), Layout (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val), captureCommitPhaseError (ref), ClassComponent (val)
    local v1
    if not __DEV__ or not enableDoubleInvokingEffects then
        if p1.tag == ClassComponent then
            local stateNode = p1.stateNode
            invokeGuardedCallback(nil, stateNode.componentDidMount, stateNode)
            if hasCaughtError() then
                captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
            end
            return
        end
        return
    end
    if p1.tag == FunctionComponent or p1.tag == ForwardRef or p1.tag == SimpleMemoComponent then
        v1 = bit32.bor(Layout, HasEffect)
        invokeGuardedCallback(nil, commitHookEffectListMount, nil, v1, p1)
        if hasCaughtError() then
            captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
        end
        return
    end
    if p1.tag ~= Block then
        return
    end
    v1 = bit32.bor(Layout, HasEffect)
    invokeGuardedCallback(nil, commitHookEffectListMount, nil, v1, p1)
    if hasCaughtError() then
        captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
    end
end
function invokePassiveEffectMountInDEV(p1) -- Line: 2236 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListMount (val), Passive (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val), captureCommitPhaseError (ref)
    local v1
    if not __DEV__ or not enableDoubleInvokingEffects then
        return
    end
    if p1.tag == FunctionComponent or p1.tag == ForwardRef or p1.tag == SimpleMemoComponent then
        v1 = bit32.bor(Passive, HasEffect)
        invokeGuardedCallback(nil, commitHookEffectListMount, nil, v1, p1)
        if hasCaughtError() then
            captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
        end
        return
    end
    if p1.tag ~= Block then
        return
    end
    v1 = bit32.bor(Passive, HasEffect)
    invokeGuardedCallback(nil, commitHookEffectListMount, nil, v1, p1)
    if hasCaughtError() then
        captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
    end
end
function invokeLayoutEffectUnmountInDEV(p1) -- Line: 2260 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListUnmount (val), Layout (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val), captureCommitPhaseError (ref), ClassComponent (val)
    local v1
    if not __DEV__ or not enableDoubleInvokingEffects then
        if p1.tag == ClassComponent then
            local stateNode = p1.stateNode
            if typeof(stateNode.componentWillUnmount) == "function" then
                safelyCallComponentWillUnmount(p1, stateNode, p1.return_)
            end
            return
        end
        return
    end
    if p1.tag == FunctionComponent or p1.tag == ForwardRef or p1.tag == SimpleMemoComponent then
        v1 = bit32.bor(Layout, HasEffect)
        invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, v1, p1, p1.return_)
        if hasCaughtError() then
            captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
        end
        return
    end
    if p1.tag ~= Block then
        return
    end
    v1 = bit32.bor(Layout, HasEffect)
    invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, v1, p1, p1.return_)
    if hasCaughtError() then
        captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
    end
end
function invokePassiveEffectUnmountInDEV(p1) -- Line: 2291 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListUnmount (val), Passive (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val), captureCommitPhaseError (ref)
    local v1
    if not __DEV__ or not enableDoubleInvokingEffects then
        return
    end
    if p1.tag == FunctionComponent or p1.tag == ForwardRef or p1.tag == SimpleMemoComponent then
        v1 = bit32.bor(Passive, HasEffect)
        invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, v1, p1, p1.return_)
        if hasCaughtError() then
            captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
        end
        return
    end
    if p1.tag ~= Block then
        return
    end
    v1 = bit32.bor(Passive, HasEffect)
    invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, v1, p1, p1.return_)
    if hasCaughtError() then
        captureCommitPhaseError(p1, p1.return_, (clearCaughtError()))
    end
end
return {
    safelyCallDestroy = function(p1, p2, p3) -- Line: 313 -- upvalues: describeError (val), captureCommitPhaseError (ref)
        local v1, v2
        v1, v2 = xpcall(p3, describeError)
        if not v1 then
            captureCommitPhaseError(p1, p2, v2)
        end
    end,
    commitBeforeMutationLifeCycles = function(p1, p2) -- Line: 325 -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), ClassComponent (val), Snapshot (val), __DEV__ (val), u280 (val), console (val), getComponentName (val), resolveDefaultProps (val), HostRoot (val), supportsMutation (val), clearContainer (val), HostComponent (val), HostText (val), HostPortal (val), IncompleteClassComponent (val), invariant (val)
        if p2.tag == FunctionComponent or p2.tag == ForwardRef or p2.tag == SimpleMemoComponent or p2.tag == Block then
            return
        end
        if p2.tag ~= ClassComponent then
            if p2.tag == HostRoot then
                if supportsMutation and bit32.band(p2.flags, Snapshot) ~= 0 then
                    clearContainer(p2.stateNode.containerInfo)
                end
                return
            end
            if p2.tag ~= HostComponent then
                if p2.tag == HostText or p2.tag == HostPortal or p2.tag == IncompleteClassComponent then
                    return
                end
                invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
                return
            end
            return
        end
        if bit32.band(p2.flags, Snapshot) ~= 0 and p1 ~= nil then
            local v1
            local memoizedProps = p1.memoizedProps
            local memoizedState = p1.memoizedState
            local stateNode = p2.stateNode
            if __DEV__ and p2.type == p2.elementType and not u280 then
                if stateNode.props ~= p2.memoizedProps then
                    console.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p2.type) or "instance")
                end
                if stateNode.state ~= p2.memoizedState then
                    console.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p2.type) or "instance")
                end
            end
            if p2.elementType ~= p2.type then
                v1 = resolveDefaultProps(p2.type, memoizedProps)
            else
                v1 = memoizedProps
                if not v1 then
                    v1 = resolveDefaultProps(p2.type, memoizedProps)
                end
            end
            local v2 = stateNode:getSnapshotBeforeUpdate(v1, memoizedState)
            stateNode.__reactInternalSnapshotBeforeUpdate = v2
        end
    end,
    commitResetTextContent = commitResetTextContent,
    commitPlacement = function(p1) -- Line: 1458 -- upvalues: supportsMutation (val), getHostParentFiber (val), HostComponent (val), HostRoot (val), HostPortal (val), invariant (val), ContentReset (val), resetTextContent (val), getHostSibling (ref), insertOrAppendPlacementNodeIntoContainer (ref), insertOrAppendPlacementNode (ref)
        if not supportsMutation then
            return
        end
        local v1 = getHostParentFiber(p1)
        local containerInfo = nil
        local v2 = nil
        local stateNode = v1.stateNode
        if v1.tag == HostComponent then
            containerInfo = stateNode
            v2 = false
        elseif v1.tag == HostRoot then
            containerInfo = stateNode.containerInfo
            v2 = true
        elseif v1.tag ~= HostPortal then
            invariant(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
        else
            containerInfo = stateNode.containerInfo
            v2 = true
        end
        if bit32.band(v1.flags, ContentReset) ~= 0 then
            resetTextContent(containerInfo)
            v1.flags = bit32.band(v1.flags, (bit32.bnot(ContentReset)))
        end
        local v3 = getHostSibling(p1)
        if v2 then
            insertOrAppendPlacementNodeIntoContainer(p1, v3, containerInfo)
            return
        end
        insertOrAppendPlacementNode(p1, v3, containerInfo)
    end,
    commitDeletion = function(p1, p2, p3, p4) -- Line: 1747 -- upvalues: unmountHostComponents (ref)
        unmountHostComponents(p1, p2, p3, p4)
        local alternate = p2.alternate
        local alternate_2 = p2.alternate
        if alternate_2 ~= nil then
            alternate_2.return_ = nil
            p2.alternate = nil
        end
        p2.return_ = nil
        if alternate ~= nil then
            local alternate_3 = alternate.alternate
            if alternate_3 ~= nil then
                alternate_3.return_ = nil
                alternate.alternate = nil
            end
            alternate.return_ = nil
        end
    end,
    commitWork = function(p1, p2) -- Line: 1779 -- upvalues: FunctionComponent (val), ForwardRef (val), MemoComponent (val), SimpleMemoComponent (val), Block (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startLayoutEffectTimer (val), commitHookEffectListUnmount (val), Layout (val), HasEffect (val), describeError (val), recordLayoutEffectDuration (val), ClassComponent (val), HostComponent (val), commitUpdate (val), HostText (val), invariant (val), commitTextUpdate (val), HostRoot (val), supportsHydration (val), unimplemented (val), Profiler (val), SuspenseComponent (val), SuspenseListComponent (val), IncompleteClassComponent (val), OffscreenComponent (val), LegacyHiddenComponent (val), hideOrUnhideAllChildren (val)
        local v1
        if p2.tag == FunctionComponent then
            local v2
            if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p2.mode, ProfileMode) == 0 then
                v1 = bit32.bor(Layout, HasEffect)
                commitHookEffectListUnmount(v1, p2, p2.return_)
                return
            end
            v2, v1 = xpcall(function() -- Line: 1868 -- upvalues: startLayoutEffectTimer (upval), commitHookEffectListUnmount (upval), Layout (upval), HasEffect (upval), p2 (val)
                startLayoutEffectTimer()
                local v1 = bit32.bor(Layout, HasEffect)
                commitHookEffectListUnmount(v1, p2, p2.return_)
            end, describeError)
            recordLayoutEffectDuration(p2)
            if v2 then
                return
            end
            error(v1)
            return
        elseif p2.tag ~= ForwardRef and p2.tag ~= MemoComponent and p2.tag ~= SimpleMemoComponent and p2.tag ~= Block then
            local stateNode
            if p2.tag == ClassComponent then
                return
            end
            if p2.tag == HostComponent then
                stateNode = p2.stateNode
                if stateNode ~= nil then
                    local memoizedProps_2
                    local memoizedProps = p2.memoizedProps
                    if not p1 then
                        memoizedProps_2 = memoizedProps
                    else
                        memoizedProps_2 = p1.memoizedProps
                    end
                    local type = p2.type
                    local updateQueue = p2.updateQueue
                    p2.updateQueue = nil
                    if updateQueue ~= nil then
                        commitUpdate(stateNode, updateQueue, type, memoizedProps_2, memoizedProps, p2)
                    end
                end
                return
            end
            if p2.tag == HostText then
                v1 = p2.stateNode ~= nil
                invariant(v1, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.")
                local memoizedProps_3 = p2.memoizedProps
                local v3 = if p1 ~= nil then memoizedProps_3 else nil
                commitTextUpdate(p2.stateNode, v3, memoizedProps_3)
                return
            end
            if p2.tag == HostRoot then
                if supportsHydration then
                    local stateNode_2 = p2.stateNode
                    if stateNode_2.hydrate then
                        stateNode_2.hydrate = false
                        unimplemented("commitWork: HostRoot: commitHydratedContainer")
                    end
                end
                return
            end
            if p2.tag == Profiler then
                return
            end
            if p2.tag == SuspenseComponent then
                commitSuspenseComponent(p2)
                attachSuspenseRetryListeners(p2)
                return
            end
            if p2.tag == SuspenseListComponent then
                unimplemented("commitWork: SuspenseListComponent")
                invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
                return
            end
            if p2.tag == IncompleteClassComponent then
                return
            end
            if p2.tag == OffscreenComponent then
                v1 = p2.memoizedState ~= nil
                hideOrUnhideAllChildren(p2, v1)
                return
            end
            if p2.tag ~= LegacyHiddenComponent then
                invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
                return
            end
            v1 = p2.memoizedState ~= nil
            hideOrUnhideAllChildren(p2, v1)
            return
        end
    end,
    commitAttachRef = commitAttachRef,
    commitDetachRef = commitDetachRef,
    commitPassiveUnmount = function(p1) -- Line: 2118 -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startPassiveEffectTimer (val), commitHookEffectListUnmount (val), Passive (val), HasEffect (val), recordPassiveEffectDuration (val)
        if p1.tag == FunctionComponent then
            local v1
            if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p1.mode, ProfileMode) == 0 then
                v1 = bit32.bor(Passive, HasEffect)
                commitHookEffectListUnmount(v1, p1, p1.return_)
                return
            end
            startPassiveEffectTimer()
            v1 = bit32.bor(Passive, HasEffect)
            commitHookEffectListUnmount(v1, p1, p1.return_)
            recordPassiveEffectDuration(p1)
            return
        elseif p1.tag ~= ForwardRef and p1.tag ~= SimpleMemoComponent and p1.tag ~= Block then
            return
        end
    end,
    commitPassiveUnmountInsideDeletedTree = function(p1, p2) -- Line: 2147 -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startPassiveEffectTimer (val), commitHookEffectListUnmount (val), Passive (val), recordPassiveEffectDuration (val)
        if p1.tag == FunctionComponent then
            if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p1.mode, ProfileMode) == 0 then
                commitHookEffectListUnmount(Passive, p1, p2)
                return
            end
            startPassiveEffectTimer()
            commitHookEffectListUnmount(Passive, p1, p2)
            recordPassiveEffectDuration(p1)
            return
        elseif p1.tag ~= ForwardRef and p1.tag ~= SimpleMemoComponent and p1.tag ~= Block then
            return
        end
    end,
    commitPassiveMount = function(p1, p2) -- Line: 2171 -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val), startPassiveEffectTimer (val), commitHookEffectListMount (val), describeError (val), Passive (val), HasEffect (val), recordPassiveEffectDuration (val), Profiler (val)
        local v1, v2, v3
        if p2.tag == FunctionComponent or p2.tag == ForwardRef or p2.tag == SimpleMemoComponent then
            if enableProfilerTimer then
                if not enableProfilerCommitHooks or bit32.band(p2.mode, ProfileMode) == 0 then
                    v2 = bit32.bor(Passive, HasEffect)
                    commitHookEffectListMount(v2, p2)
                    return
                end
                startPassiveEffectTimer()
                v3 = bit32.bor(Passive, HasEffect)
                v1, v2 = xpcall(commitHookEffectListMount, describeError, v3, p2)
                recordPassiveEffectDuration(p2)
                if v1 then
                    return
                end
                error(v2)
                return
            end
            v2 = bit32.bor(Passive, HasEffect)
            commitHookEffectListMount(v2, p2)
            return
        end
        if p2.tag ~= Block then
            if p2.tag == Profiler then
                commitProfilerPassiveEffect(p1, p2)
            end
            return
        end
        if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p2.mode, ProfileMode) == 0 then
            v2 = bit32.bor(Passive, HasEffect)
            commitHookEffectListMount(v2, p2)
            return
        end
        startPassiveEffectTimer()
        v3 = bit32.bor(Passive, HasEffect)
        v1, v2 = xpcall(commitHookEffectListMount, describeError, v3, p2)
        recordPassiveEffectDuration(p2)
        if v1 then
            return
        end
        error(v2)
    end,
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV,
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV,
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV,
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV,
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden,
    recursivelyCommitLayoutEffects = recursivelyCommitLayoutEffects,
}