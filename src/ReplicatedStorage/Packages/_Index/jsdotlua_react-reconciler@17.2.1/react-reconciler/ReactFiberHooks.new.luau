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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHooks.new
--                               Dumped in 0.0140 seconds
--                         Bytecode version 9  |  165 functions

local function unimplemented(p1) -- Line: 12
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. p1)
    error("FIXME (roblox): " .. p1 .. " is unimplemented")
end
local __DEV__ = _G.__DEV__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local Object = v1.Object
local createRef = require(script.Parent.Parent:WaitForChild("react")).createRef
local createBinding = require(script.Parent.Parent:WaitForChild("react")).createBinding
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local ReactHookEffectTags = require(script.Parent:WaitForChild("ReactHookEffectTags"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local enableNewReconciler = ReactFeatureFlags.enableNewReconciler
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local DebugTracingMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).DebugTracingMode
local NoLane = ReactFiberLane.NoLane
local NoLanes = ReactFiberLane.NoLanes
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local mergeLanes = ReactFiberLane.mergeLanes
local removeLanes = ReactFiberLane.removeLanes
local markRootEntangled = ReactFiberLane.markRootEntangled
local markRootMutableRead = ReactFiberLane.markRootMutableRead
local readContext = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).readContext
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Update = ReactFiberFlags.Update
local Passive = ReactFiberFlags.Passive
local PassiveStatic = ReactFiberFlags.PassiveStatic
local MountLayoutDev = ReactFiberFlags.MountLayoutDev
local MountPassiveDev = ReactFiberFlags.MountPassiveDev
local HasEffect = ReactHookEffectTags.HasEffect
local Layout = ReactHookEffectTags.Layout
local Passive_2 = ReactHookEffectTags.Passive
local v2 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local warnIfNotCurrentlyActingUpdatesInDEV = v2.warnIfNotCurrentlyActingUpdatesInDEV
local scheduleUpdateOnFiber = v2.scheduleUpdateOnFiber
local warnIfNotScopedWithMatchingAct = v2.warnIfNotScopedWithMatchingAct
local requestEventTime = v2.requestEventTime
local requestUpdateLane = v2.requestUpdateLane
local markSkippedUpdateLanes = v2.markSkippedUpdateLanes
local getWorkInProgressRoot = v2.getWorkInProgressRoot
local warnIfNotCurrentlyActingEffectsInDEV = v2.warnIfNotCurrentlyActingEffectsInDEV
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local function is(p1, p2) -- Line: 114
    local v1
    if p1 ~= p2 then
        v1 = if p1 ~= p1 then p2 ~= p2 else false
    else
        v1 = if p1 == 0 then if 1 / p1 ~= 1 / p2 then if p1 ~= p1 then p2 ~= p2 else false else true else true
    end
    return v1
end
local markWorkInProgressReceivedUpdate = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).markWorkInProgressReceivedUpdate
local getIsHydrating = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new")).getIsHydrating
local makeClientId = require(script.Parent:WaitForChild("ReactFiberHostConfig")).makeClientId
local v3 = require(script.Parent:WaitForChild("ReactMutableSource.new"))
local warnAboutMultipleRenderersDEV = v3.warnAboutMultipleRenderersDEV
local getWorkInProgressVersion = v3.getWorkInProgressVersion
local setWorkInProgressVersion = v3.setWorkInProgressVersion
local markSourceAsDirty = v3.markSourceAsDirty
local logStateUpdateScheduled = require(script.Parent:WaitForChild("DebugTracing")).logStateUpdateScheduled
local markStateUpdateScheduled = require(script.Parent:WaitForChild("SchedulingProfiler")).markStateUpdateScheduled
local ReactCurrentDispatcher = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentDispatcher
local u241 = nil
if __DEV__ then
    local v4 = {}
    u241 = {}
end
local u242 = {}
local u244 = NoLanes
local u245 = nil
local u246 = nil
local u247 = nil
local u248 = false
local u249 = false
local u250 = nil
local u251 = nil
local u252 = 0
local u406 = nil
local u422 = nil
local u438 = nil
local u454 = nil
local u257 = nil
local u258 = nil
local u259 = nil
local function getHighestIndex(p1) -- Line: 256
    local v1 = 0
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if v1 < i then
            v1 = i
        end
    end
    return v1
end
local function isArrayOrSparseArray(p1) -- Line: 266
    if type(p1) ~= "table" then
        return false
    end
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if type(i) ~= "number" then
            return false
        end
    end
    return true
end
local function mountHookTypesDev() -- Line: 278 -- upvalues: __DEV__ (val), u250 (ref), u251 (ref)
    if not __DEV__ then
        return
    end
    local v1 = u250
    if u251 == nil then
        u251 = {v1}
        return
    end
    table.insert(u251, v1)
end
function updateHookTypesDev() -- Line: 291 -- upvalues: __DEV__ (val), u250 (ref), u251 (ref), u252 (ref)
    if __DEV__ then
        local v1 = u250
        if u251 ~= nil then
            u252 = u252 + 1
            if u251[u252] ~= v1 then
                warnOnHookMismatchInDev(v1)
            end
        end
    end
end
local function checkDepsAreArrayDev(p1) -- Line: 305 -- upvalues: __DEV__ (val), console (val), u250 (ref)
    if __DEV__ and p1 ~= nil then
        local v1
        if type(p1) == "table" then
            local v2 = p1
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if type(i) ~= "number" then
                    v1 = false
                    if not v1 then
                        console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p1)))
                    end
                    return
                end
            end
            v1 = true
        else
            v1 = false
        end
        if not v1 then
            console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p1)))
        end
    end
end
function warnOnHookMismatchInDev(p1) -- Line: 320 -- upvalues: __DEV__ (val), getComponentName (val), u245 (ref), u241 (ref), u251 (ref), u252 (ref), console (val)
    if __DEV__ then
        local v1 = getComponentName(u245.type) or "Component"
        if not (u241[v1]) then
            u241[v1] = true
            if u251 ~= nil then
                local v2, v3, v4, v5
                local v6 = ""
                local v7 = u252
                local v8 = 1
                local v9 = p1
                for i = 1, v7, v8 do
                    v2 = u251[i]
                    if i ~= u252 then
                        v3 = v2
                    else
                        v3 = v9
                    end
                    v4 = tostring(i) .. ". " .. (v2 or "undefined")
                    while true do
                        v5 = string.len(v4)
                        if v5 >= 30 then
                            break
                        end
                        v4 = v4 .. " "
                    end
                    v4 = v4 .. v3 .. "\n"
                    v6 = v6 .. v4
                end
                console.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v1, v6)
            end
        end
    end
end
local function throwInvalidHookError() -- Line: 372 -- upvalues: Error (val)
    error(Error.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end
local function areHookInputsEqual(p1, p2) -- Line: 387 -- upvalues: __DEV__ (val), console (val), u250 (ref)
    local v1, v2, v3, v4, v5
    if p2 == nil then
        if __DEV__ then
            console.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", u250)
        end
        return false
    end
    local v6 = 0
    local v7 = p1
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        if v6 < i then
            v6 = i
        end
    end
    local v10 = v6
    v7 = 0
    v8 = p2
    v9 = nil
    local v11 = nil
    for k, n in v8, v9, v11 do
        if v7 < k then
            v7 = k
        end
    end
    v6 = v7
    if v10 ~= v6 then
        return false
    end
    v8 = math.min(v6, v10)
    v9 = 1
    v1, v2 = p1, p2
    for m = 1, v8, v9 do
        v5 = v1[m]
        v3 = v2[m]
        if v5 ~= v3 then
            v4 = if v5 ~= v5 then v3 ~= v3 else false
        else
            v4 = true
            if v5 == 0 then
                v4 = true
                if 1 / v5 == 1 / v3 then end
            end
        end
        if not v4 then
            return false
        end
    end
    return true
end
function u242.bailoutHooks(p1, p2, p3) -- Line: 451 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), MountPassiveDev (val), Passive (val), MountLayoutDev (val), Update (val), removeLanes (val)
    p2.updateQueue = p1.updateQueue
    if not __DEV__ then
        p2.flags = bit32.band(p2.flags, (bit32.bnot((bit32.bor(Passive, Update)))))
    elseif not enableDoubleInvokingEffects then
        p2.flags = bit32.band(p2.flags, (bit32.bnot((bit32.bor(Passive, Update)))))
    else
        p2.flags = bit32.band(p2.flags, (bit32.bnot((bit32.bor(MountPassiveDev, Passive, MountLayoutDev, Update)))))
    end
    p1.lanes = removeLanes(p1.lanes, p3)
end
local u280 = false
function u242.resetHooksAfterThrow() -- Line: 476 -- upvalues: ReactCurrentDispatcher (val), u242 (val), u248 (ref), u245 (ref), u244 (ref), NoLanes (val), u246 (ref), u247 (ref), __DEV__ (val), u251 (ref), u252 (ref), u250 (ref), u280 (ref), u249 (ref)
    ReactCurrentDispatcher.current = u242.ContextOnlyDispatcher
    if u248 then
        local queue
        local memoizedState = u245.memoizedState
        while memoizedState ~= nil do
            queue = memoizedState.queue
            if queue ~= nil then
                queue.pending = nil
            end
            memoizedState = memoizedState.next
        end
        u248 = false
    end
    u244 = NoLanes
    u245 = nil
    u246 = nil
    u247 = nil
    if __DEV__ then
        u251 = nil
        u252 = 0
        u250 = nil
        u280 = false
    end
    u249 = false
end
local function mountWorkInProgressHook() -- Line: 521 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    return u247
end
local function updateWorkInProgressHook() -- Line: 544 -- upvalues: u246 (ref), u245 (ref), u247 (ref), Error (val)
    local memoizedState, memoizedState_2
    if u246 ~= nil then
        memoizedState = u246.next
    else
        local alternate = u245.alternate
        if alternate == nil then
            memoizedState = nil
        else
            memoizedState = alternate.memoizedState
        end
    end
    if u247 ~= nil then
        memoizedState_2 = u247.next
    else
        memoizedState_2 = u245.memoizedState
    end
    if memoizedState_2 == nil then
        if memoizedState == nil then
            error(Error.new("Rendered more hooks than during the previous render."))
        end
        u246 = memoizedState
        local v1 = {memoizedState = u246.memoizedState, baseState = u246.baseState, baseQueue = u246.baseQueue, queue = u246.queue}
        if u247 ~= nil then
            u247.next = v1
            u247 = v1
        else
            u247 = v1
            u245.memoizedState = v1
        end
    else
        u247 = memoizedState_2
        u246 = memoizedState
    end
    return u247
end
function basicStateReducer(p1, p2) -- Line: 619
    if type(p2) == "function" then
        return p2(p1)
    end
    return p2
end
function mountReducer(p1, p2, p3) -- Line: 628 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    local v2 = u247
    if p3 == nil then
        v1 = p2
    else
        v1 = p3(p2)
    end
    v2.baseState = v1
    v2.memoizedState = v2.baseState
    local u19 = {lastRenderedReducer = p1, lastRenderedState = v1}
    v2.queue = u19
    local u22 = u245
    local function v3(p1, ...) -- Line: 655 -- upvalues: u22 (val), u19 (val)
        dispatchAction(u22, u19, p1, ...)
    end
    u19.dispatch = v3
    return v2.memoizedState, v3
end
function updateReducer(p1, p2, p3) -- Line: 665 -- upvalues: updateWorkInProgressHook (val), u246 (ref), u244 (ref), u245 (ref), mergeLanes (val), markSkippedUpdateLanes (val), NoLane (val), markWorkInProgressReceivedUpdate (val)
    local v1 = updateWorkInProgressHook()
    local queue = v1.queue
    local v2 = queue ~= nil
    assert(v2, "Should have a queue. This is likely a bug in React. Please file an issue.")
    queue.lastRenderedReducer = p1
    local v3 = u246
    local baseQueue = v3.baseQueue
    local pending = queue.pending
    if pending ~= nil then
        if baseQueue ~= nil then
            local next = baseQueue.next
            baseQueue.next = pending.next
            pending.next = next
        end
        v3.baseQueue = pending
        queue.pending = nil
    end
    if baseQueue ~= nil then
        local lane, v4, v5, v6
        local next_2 = baseQueue.next
        local baseState = v3.baseState
        local v7 = nil
        local v8 = nil
        local next_3 = nil
        local next_4 = next_2
        while true do
            lane = next_4.lane
            if bit32.band(u244, lane) == lane then
                if next_3 ~= nil then
                    next_3.next = {lane = NoLane, action = next_4.action, eagerReducer = next_4.eagerReducer, eagerState = next_4.eagerState}
                    next_3 = next_3.next
                end
                if next_4.eagerReducer ~= v4 then
                    baseState = v4(baseState, next_4.action)
                else
                    baseState = next_4.eagerState
                end
            else
                v6 = {lane = lane, action = next_4.action, eagerReducer = next_4.eagerReducer, eagerState = next_4.eagerState}
                if next_3 ~= nil then
                    next_3.next = v6
                    next_3 = next_3.next
                else
                    v8 = v6
                    v7 = baseState
                end
                u245.lanes = mergeLanes(u245.lanes, lane)
                markSkippedUpdateLanes(lane)
            end
            next_4 = next_4.next
            if next_4 == nil or next_4 == next_2 then
                break
            end
        end
        if next_3 ~= nil then
            next_3.next = v8
        else
            v7 = baseState
        end
        v6 = baseState
        local memoizedState = v1.memoizedState
        if v6 ~= memoizedState then
            v5 = if v6 ~= v6 then memoizedState ~= memoizedState else false
        else
            v5 = true
            if v6 == 0 then
                v5 = true
                if 1 / v6 == 1 / memoizedState then end
            end
        end
        if not v5 then
            markWorkInProgressReceivedUpdate()
        end
        v1.memoizedState = baseState
        v1.baseState = v7
        v1.baseQueue = next_3
        queue.lastRenderedState = baseState
    end
    return v1.memoizedState, queue.dispatch
end
function rerenderReducer(p1, p2, p3) -- Line: 806 -- upvalues: updateWorkInProgressHook (val), markWorkInProgressReceivedUpdate (val)
    local v1 = updateWorkInProgressHook()
    local queue = v1.queue
    local v2 = queue ~= nil
    assert(v2, "Should have a queue. This is likely a bug in React. Please file an issue.")
    queue.lastRenderedReducer = p1
    local dispatch = queue.dispatch
    local pending = queue.pending
    local memoizedState = v1.memoizedState
    if pending ~= nil then
        local v3
        queue.pending = nil
        local next = pending.next
        local next_2 = next
        while true do
            memoizedState = p1(memoizedState, next_2.action)
            next_2 = next_2.next
            if next_2 == next then
                break
            end
        end
        local v4 = memoizedState
        local memoizedState_2 = v1.memoizedState
        if v4 ~= memoizedState_2 then
            v3 = if v4 ~= v4 then memoizedState_2 ~= memoizedState_2 else false
        else
            v3 = true
            if v4 == 0 then
                v3 = true
                if 1 / v4 == 1 / memoizedState_2 then end
            end
        end
        if not v3 then
            markWorkInProgressReceivedUpdate()
        end
        v1.memoizedState = memoizedState
        if v1.baseQueue == nil then
            v1.baseState = memoizedState
        end
        queue.lastRenderedState = memoizedState
    end
    return memoizedState, dispatch
end
function readFromUnsubcribedMutableSource(p1, p2, p3) -- Line: 871 -- upvalues: __DEV__ (val), warnAboutMultipleRenderersDEV (val), getWorkInProgressVersion (val), isSubsetOfLanes (val), u244 (ref), setWorkInProgressVersion (val), console (val), markSourceAsDirty (val), Error (val)
    local v1
    if __DEV__ then
        warnAboutMultipleRenderersDEV(p2)
    end
    local v2 = p2._getVersion(p2._source)
    local v3 = getWorkInProgressVersion(p2)
    if v3 == nil then
        v1 = isSubsetOfLanes(u244, p1.mutableReadLanes)
        if v1 then
            setWorkInProgressVersion(p2, v2)
        end
    else
        v1 = v3 == v2
    end
    if not v1 then
        markSourceAsDirty(p2)
        error(Error.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
        return
    end
    local v4 = p3(p2._source)
    if __DEV__ and type(v4) == "function" then
        console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
    end
    return v4
end
function useMutableSource(p1, p2, p3, p4) -- Line: 954 -- upvalues: getWorkInProgressRoot (val), invariant (val), ReactCurrentDispatcher (val), u247 (ref), u245 (ref), __DEV__ (val), console (val), requestUpdateLane (val), markRootMutableRead (val), markRootEntangled (val)
    local refs, u124, u133, u35, v1
    local u5 = getWorkInProgressRoot()
    local v2 = u5 ~= nil
    invariant(v2, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
    local _getVersion = p2._getVersion
    local u17 = _getVersion(p2._source)
    local current = ReactCurrentDispatcher.current
    local v3 = current ~= nil
    assert(v3, "dispatcher was nil, this is a bug in React")
    v1, u35 = current.useState(function() -- Line: 979 -- upvalues: u5 (val), p2 (val), p3 (val)
        return readFromUnsubcribedMutableSource(u5, p2, p3)
    end)
    local u166 = v1
    local v4 = u247
    local memoizedState = p1.memoizedState
    if memoizedState.refs == nil then
        error((tostring(debug.traceback())))
    end
    refs = memoizedState.refs
    local getSnapshot = refs.getSnapshot
    local source = memoizedState.source
    local subscribe = memoizedState.subscribe
    local u53 = u245
    local v5 = {refs = refs, source = p2, subscribe = p4}
    p1.memoizedState = v5
    current.useEffect(function() -- Line: 1008 -- upvalues: refs (val), p3 (val), u35 (ref), _getVersion (val), p2 (val), u17 (val), __DEV__ (upval), console (upval), u166 (ref), requestUpdateLane (upval), u53 (val), markRootMutableRead (upval), u5 (val), markRootEntangled (upval)
        local v1
        refs.getSnapshot = p3
        refs.setSnapshot = u35
        local v2 = _getVersion(p2._source)
        local v3 = u17
        if v3 ~= v2 then
            v1 = if v3 ~= v3 then v2 ~= v2 else false
        else
            v1 = true
            if v3 == 0 then
                v1 = true
                if 1 / v3 == 1 / v2 then end
            end
        end
        if not v1 then
            v1 = p3(p2._source)
            if __DEV__ and type(v1) == "function" then
                console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
            end
            local v4 = u166
            if v4 ~= v1 then
                v3 = if v4 ~= v4 then v1 ~= v1 else false
            else
                v3 = true
                if v4 == 0 then
                    v3 = true
                    if 1 / v4 == 1 / v1 then end
                end
            end
            if not v3 then
                u35(v1)
                v3 = requestUpdateLane(u53)
                markRootMutableRead(u5, v3)
            end
            markRootEntangled(u5, u5.mutableReadLanes)
        end
    end, {p3, p2, p4})
    current.useEffect(function() -- Line: 1046 -- upvalues: refs (val), p2 (val), requestUpdateLane (upval), u53 (val), markRootMutableRead (upval), u5 (val), p4 (val), __DEV__ (upval), console (upval)
        local v1 = p4(p2._source, function() -- Line: 1047 -- upvalues: refs (upval), p2 (upval), requestUpdateLane (upval), u53 (upval), markRootMutableRead (upval), u5 (upval)
            local u7, v1
            local getSnapshot = refs.getSnapshot
            local setSnapshot = refs.setSnapshot
            v1, u7 = pcall(function() -- Line: 1052 -- upvalues: setSnapshot (val), getSnapshot (val), p2 (upval), requestUpdateLane (upval), u53 (upval), markRootMutableRead (upval), u5 (upval)
                setSnapshot(getSnapshot(p2._source))
                local v1 = requestUpdateLane(u53)
                markRootMutableRead(u5, v1)
            end)
            if not v1 then
                setSnapshot(function() -- Line: 1066 -- upvalues: u7 (val)
                    error(u7)
                end)
            end
        end)
        if __DEV__ and type(v1) ~= "function" then
            console.error("Mutable source subscribe function must return an unsubscribe function.")
        end
        return v1
    end, {p2, p4})
    if getSnapshot ~= p3 then
        v5 = if getSnapshot ~= getSnapshot then p3 ~= p3 else false
    else
        v5 = true
        if getSnapshot == 0 then
            v5 = true
            if 1 / getSnapshot == 1 / p3 then end
        end
    end
    if not v5 then
        u124 = {lastRenderedReducer = basicStateReducer, lastRenderedState = u166}
        u133 = u245
        function u35(...) -- Line: 1115 -- upvalues: u133 (val), u124 (val)
            dispatchAction(u133, u124, ...)
        end
        u124.dispatch = u35
        v4.queue = u124
        v4.baseQueue = nil
        u166 = readFromUnsubcribedMutableSource(u5, p2, p3)
        v4.baseState = u166
        v4.memoizedState = v4.baseState
    else
        if source ~= p2 then
            v5 = if source ~= source then p2 ~= p2 else false
        else
            v5 = true
            if source == 0 then
                v5 = true
                if 1 / source == 1 / p2 then end
            end
        end
        if not v5 then
            u124 = {lastRenderedReducer = basicStateReducer, lastRenderedState = u166}
            u133 = u245
            function u35(...) -- Line: 1115 -- upvalues: u133 (val), u124 (val)
                dispatchAction(u133, u124, ...)
            end
            u124.dispatch = u35
            v4.queue = u124
            v4.baseQueue = nil
            u166 = readFromUnsubcribedMutableSource(u5, p2, p3)
            v4.baseState = u166
            v4.memoizedState = v4.baseState
        else
            if subscribe ~= p4 then
                v5 = if subscribe ~= subscribe then p4 ~= p4 else false
            else
                v5 = true
                if subscribe == 0 then
                    v5 = true
                    if 1 / subscribe == 1 / p4 then end
                end
            end
            if not v5 then
                u124 = {lastRenderedReducer = basicStateReducer, lastRenderedState = u166}
                u133 = u245
                function u35(...) -- Line: 1115 -- upvalues: u133 (val), u124 (val)
                    dispatchAction(u133, u124, ...)
                end
                u124.dispatch = u35
                v4.queue = u124
                v4.baseQueue = nil
                u166 = readFromUnsubcribedMutableSource(u5, p2, p3)
                v4.baseState = u166
                v4.memoizedState = v4.baseState
            end
        end
    end
    return u166
end
function mountMutableSource(p1, p2, p3) -- Line: 1129 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    local v2 = u247
    v2.memoizedState = {
        refs = {getSnapshot = p2},
        source = p1,
        subscribe = p3,
    }
    return useMutableSource(v2, p1, p2, p3)
end
function updateMutableSource(p1, p2, p3) -- Line: 1152 -- upvalues: updateWorkInProgressHook (val)
    return useMutableSource(updateWorkInProgressHook(), p1, p2, p3)
end
function mountState(p1) -- Line: 1167 -- upvalues: u247 (ref), u245 (ref)
    local v1
    local v2 = {}
    if u247 ~= nil then
        u247.next = v2
        u247 = v2
    else
        u245.memoizedState = v2
        u247 = v2
    end
    local v3 = u247
    if type(p1) ~= "function" then
        v1 = p1
    else
        v1 = p1()
    end
    v3.baseState = v1
    v3.memoizedState = v3.baseState
    local u17 = {lastRenderedState = v1, lastRenderedReducer = basicStateReducer}
    v3.queue = u17
    local u19 = u245
    local function v4(p1, ...) -- Line: 1189 -- upvalues: u19 (val), u17 (val)
        dispatchAction(u19, u17, p1, ...)
    end
    u17.dispatch = v4
    return v3.memoizedState, v4
end
function updateState(p1) -- Line: 1198
    return updateReducer(basicStateReducer, p1)
end
function rerenderState(p1) -- Line: 1202
    return rerenderReducer(basicStateReducer, p1)
end
local function pushEffect(p1, p2, p3, p4) -- Line: 1206 -- upvalues: u245 (ref)
    local v1 = {tag = p1, create = p2, destroy = p3, deps = p4}
    local updateQueue = u245.updateQueue
    if updateQueue == nil then
        local v2 = {}
        u245.updateQueue = v2
        v1.next = v1
        v2.lastEffect = v1
        return v1
    end
    local lastEffect = updateQueue.lastEffect
    if lastEffect == nil then
        updateQueue.lastEffect = v1
        v1.next = v1
        return v1
    end
    local next = lastEffect.next
    lastEffect.next = v1
    v1.next = next
    updateQueue.lastEffect = v1
    return v1
end
function mountBinding(p1) -- Line: 1242 -- upvalues: u247 (ref), u245 (ref), createBinding (val)
    local v1
    local v2 = {}
    if u247 ~= nil then
        u247.next = v2
        u247 = v2
    else
        u245.memoizedState = v2
        u247 = v2
    end
    v2, v1 = createBinding(p1)
    u247.memoizedState = {v2, v1}
    return v2, v1
end
function updateBinding(p1) -- Line: 1251 -- upvalues: updateWorkInProgressHook (val)
    return unpack(updateWorkInProgressHook().memoizedState)
end
function mountRef(p1) -- Line: 1256 -- upvalues: u247 (ref), u245 (ref), createRef (val)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    v1 = createRef()
    v1.current = p1
    u247.memoizedState = v1
    return v1
end
function updateRef(p1) -- Line: 1268 -- upvalues: updateWorkInProgressHook (val)
    return updateWorkInProgressHook().memoizedState
end
local function mountEffectImpl(p1, p2, p3, p4) -- Line: 1273 -- upvalues: u247 (ref), u245 (ref), pushEffect (val), HasEffect (val)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    u245.flags = bit32.bor(u245.flags, p1)
    local v2 = bit32.bor(HasEffect, p2)
    u247.memoizedState = pushEffect(v2, p3, nil, p4)
end
function updateEffectImpl(p1, p2, p3, p4) -- Line: 1285 -- upvalues: updateWorkInProgressHook (val), u246 (ref), areHookInputsEqual (val), pushEffect (val), u245 (ref), HasEffect (val)
    local v1
    local v2 = updateWorkInProgressHook()
    local destroy = nil
    if u246 == nil then
        u245.flags = bit32.bor(u245.flags, p1)
        v1 = bit32.bor(HasEffect, p2)
        v2.memoizedState = pushEffect(v1, p3, destroy, p4)
        return
    end
    local memoizedState = u246.memoizedState
    destroy = memoizedState.destroy
    if p4 == nil then
        u245.flags = bit32.bor(u245.flags, p1)
        v1 = bit32.bor(HasEffect, p2)
        v2.memoizedState = pushEffect(v1, p3, destroy, p4)
        return
    end
    if areHookInputsEqual(p4, memoizedState.deps) then
        v2.memoizedState = pushEffect(p2, p3, destroy, p4)
        return
    end
    u245.flags = bit32.bor(u245.flags, p1)
    v1 = bit32.bor(HasEffect, p2)
    v2.memoizedState = pushEffect(v1, p3, destroy, p4)
end
local function mountEffect(p1, p2) -- Line: 1311 -- upvalues: __DEV__ (val), warnIfNotCurrentlyActingEffectsInDEV (val), u245 (ref), enableDoubleInvokingEffects (val), MountPassiveDev (val), Passive (val), PassiveStatic (val), Passive_2 (val), u247 (ref), pushEffect (val), HasEffect (val)
    local v1, v2, v3
    if __DEV__ then
        if type(_G.jest) ~= "nil" then
            warnIfNotCurrentlyActingEffectsInDEV(u245)
        elseif not _G.__TESTEZ_RUNNING_TEST__ then
        end
    end
    if not __DEV__ then
        v1 = bit32.bor(Passive, PassiveStatic)
        v2 = {}
        if u247 ~= nil then
            u247.next = v2
            u247 = v2
        else
            u245.memoizedState = v2
            u247 = v2
        end
        u245.flags = bit32.bor(u245.flags, v1)
        v3 = bit32.bor(HasEffect, Passive_2)
        u247.memoizedState = pushEffect(v3, p1, nil, p2)
        return
    end
    if enableDoubleInvokingEffects then
        v1 = bit32.bor(MountPassiveDev, Passive, PassiveStatic)
        v2 = {}
        if u247 ~= nil then
            u247.next = v2
            u247 = v2
        else
            u245.memoizedState = v2
            u247 = v2
        end
        u245.flags = bit32.bor(u245.flags, v1)
        v3 = bit32.bor(HasEffect, Passive_2)
        u247.memoizedState = pushEffect(v3, p1, nil, p2)
        return
    end
    v1 = bit32.bor(Passive, PassiveStatic)
    v2 = {}
    if u247 ~= nil then
        u247.next = v2
        u247 = v2
    else
        u245.memoizedState = v2
        u247 = v2
    end
    u245.flags = bit32.bor(u245.flags, v1)
    v3 = bit32.bor(HasEffect, Passive_2)
    u247.memoizedState = pushEffect(v3, p1, nil, p2)
end
local function updateEffect(p1, p2) -- Line: 1341 -- upvalues: __DEV__ (val), warnIfNotCurrentlyActingEffectsInDEV (val), u245 (ref), Passive (val), Passive_2 (val)
    if __DEV__ then
        if type(_G.jest) ~= "nil" then
            warnIfNotCurrentlyActingEffectsInDEV(u245)
        elseif _G.__TESTEZ_RUNNING_TEST__ then
            warnIfNotCurrentlyActingEffectsInDEV(u245)
        end
    end
    updateEffectImpl(Passive, Passive_2, p1, p2)
end
local function mountLayoutEffect(p1, p2) -- Line: 1356 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), MountLayoutDev (val), Update (val), Layout (val), u247 (ref), u245 (ref), pushEffect (val), HasEffect (val)
    local v1, v2
    if not __DEV__ or not enableDoubleInvokingEffects then
        v1 = {}
        if u247 ~= nil then
            u247.next = v1
            u247 = v1
        else
            u245.memoizedState = v1
            u247 = v1
        end
        u245.flags = bit32.bor(u245.flags, Update)
        v2 = bit32.bor(HasEffect, Layout)
        u247.memoizedState = pushEffect(v2, p1, nil, p2)
        return
    end
    local v3 = bit32.bor(MountLayoutDev, Update)
    v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    u245.flags = bit32.bor(u245.flags, v3)
    v2 = bit32.bor(HasEffect, Layout)
    u247.memoizedState = pushEffect(v2, p1, nil, p2)
end
local function updateLayoutEffect(p1, p2) -- Line: 1373 -- upvalues: Update (val), Layout (val)
    updateEffectImpl(Update, Layout, p1, p2)
end
function imperativeHandleEffect(p1, p2) -- Line: 1381 -- upvalues: __DEV__ (val), Object (val), console (val), Array (val)
    if p2 == nil then
        if p2 == nil then
            return nil
        end
        if __DEV__ then
            local v1 = if getmetatable(p2) ~= nil then #Object.keys(p2) == 0 else false
            if not v1 then
                local v2 = Object.keys(p2)
                console.error("Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. Array.join(v2, ", ") .. "}")
            end
        end
        p2.current = p1()
        return function() -- Line: 1415 -- upvalues: p2 (val)
            p2.current = nil
        end
    elseif type(p2) == "function" then
        p2((p1()))
        return function() -- Line: 1390 -- upvalues: p2 (val)
            return p2(nil)
        end
    end
end
function mountImperativeHandle(p1, p2, p3) -- Line: 1424 -- upvalues: __DEV__ (val), console (val), Array (val), enableDoubleInvokingEffects (val), mountEffectImpl (val), MountLayoutDev (val), Update (val), Layout (val)
    local v1, v2
    if __DEV__ and type(p2) ~= "function" then
        if p2 == nil then
            v2 = "nil"
        else
            v2 = type(p2)
        end
        console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", v2)
    end
    if p3 == nil then
        v1 = nil
    else
        v1 = Array.concat(p3, {p1})
    end
    if not __DEV__ or not enableDoubleInvokingEffects then
        return mountEffectImpl(Update, Layout, function() -- Line: 1453 -- upvalues: p2 (val), p1 (val)
            return imperativeHandleEffect(p2, p1)
        end, v1)
    end
    v2 = bit32.bor(MountLayoutDev, Update)
    return mountEffectImpl(v2, Layout, function() -- Line: 1447 -- upvalues: p2 (val), p1 (val)
        return imperativeHandleEffect(p2, p1)
    end, v1)
end
function updateImperativeHandle(p1, p2, p3) -- Line: 1459 -- upvalues: __DEV__ (val), console (val), Update (val), Layout (val)
    local v1
    if __DEV__ and type(p2) ~= "function" then
        v1 = if p2 then type(p2) else "nil"
        console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", v1)
    end
    v1 = nil
    if p3 ~= nil then
        v1 = table.clone(p3)
        table.insert(v1, p1)
    end
    return updateEffectImpl(Update, Layout, function() -- Line: 1486 -- upvalues: p2 (val), p1 (val)
        return imperativeHandleEffect(p2, p1)
    end, v1)
end
function mountDebugValue(p1, p2) end
local u334 = mountDebugValue
function mountCallback(p1, p2) -- Line: 1499 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    u247.memoizedState = {p1, p2}
    return p1
end
function updateCallback(p1, p2) -- Line: 1507 -- upvalues: updateWorkInProgressHook (val), areHookInputsEqual (val)
    local v1 = updateWorkInProgressHook()
    local memoizedState = v1.memoizedState
    if memoizedState == nil or p2 == nil then
        v1.memoizedState = {p1, p2}
        return p1
    end
    if areHookInputsEqual(p2, memoizedState[2]) then
        return memoizedState[1]
    end
    v1.memoizedState = {p1, p2}
    return p1
end
function mountMemo(p1, p2) -- Line: 1526 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
        u247 = v1
    else
        u245.memoizedState = v1
        u247 = v1
    end
    v1 = {p1()}
    u247.memoizedState = {v1, p2}
    return unpack(v1)
end
function updateMemo(p1, p2) -- Line: 1538 -- upvalues: updateWorkInProgressHook (val), areHookInputsEqual (val)
    local v1
    local v2 = updateWorkInProgressHook()
    local memoizedState = v2.memoizedState
    if memoizedState == nil or p2 == nil then
        v1 = {p1()}
        v2.memoizedState = {v1, p2}
        return unpack(v1)
    end
    if areHookInputsEqual(p2, memoizedState[2]) then
        return unpack(memoizedState[1])
    end
    v1 = {p1()}
    v2.memoizedState = {v1, p2}
    return unpack(v1)
end
function u242.getIsUpdatingOpaqueValueInRenderPhaseInDEV() -- Line: 1688 -- upvalues: __DEV__ (val)
    if __DEV__ then
        return false
    end
    return nil
end
function mountOpaqueIdentifier() -- Line: 1710 -- upvalues: __DEV__ (val), console (val), makeClientId (val), getIsHydrating (val)
    local v1 = nil
    if not __DEV__ then
        v1 = makeClientId
    else
        console.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
    end
    if not (getIsHydrating()) then
        local v2 = v1()
        mountState(v2)
        return v2
    end
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
    error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
    return nil
end
function updateOpaqueIdentifier() -- Line: 1777
    local v1 = updateState(nil)
    return v1
end
function rerenderOpaqueIdentifier() -- Line: 1782
    local v1 = rerenderState(nil)
    return v1
end
function dispatchAction(p1, p2, p3, ...) -- Line: 1787 -- upvalues: __DEV__ (val), console (val), requestEventTime (val), requestUpdateLane (val), u245 (ref), u248 (ref), u249 (ref), NoLanes (val), ReactCurrentDispatcher (val), u258 (ref), warnIfNotScopedWithMatchingAct (val), warnIfNotCurrentlyActingUpdatesInDEV (val), scheduleUpdateOnFiber (val), enableDebugTracing (val), DebugTracingMode (val), getComponentName (val), logStateUpdateScheduled (val), enableSchedulingProfiler (val), markStateUpdateScheduled (val)
    local v1, v2
    if __DEV__ then
        v1 = select("#", ...)
        v2 = if v1 == 1 then select(1, ...) else nil
        if type(v2) == "function" then
            console.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
        end
    end
    v1 = requestEventTime()
    v2 = requestUpdateLane(p1)
    local v3 = {lane = v2, action = p3}
    local pending = p2.pending
    if pending ~= nil then
        v3.next = pending.next
        pending.next = v3
    else
        v3.next = v3
    end
    p2.pending = v3
    local alternate = p1.alternate
    if p1 == u245 then
        u248 = true
        u249 = true
        if __DEV__ and enableDebugTracing and bit32.band(p1.mode, DebugTracingMode) ~= 0 then
            local v4 = getComponentName(p1.type) or "Unknown"
            logStateUpdateScheduled(v4, v2, p3)
        end
        if enableSchedulingProfiler then
            markStateUpdateScheduled(p1, v2)
        end
        return
    elseif alternate == nil then
        if p1.lanes ~= NoLanes then
            if __DEV__ then
                if type(_G.jest) ~= "nil" then
                    warnIfNotScopedWithMatchingAct(p1)
                    warnIfNotCurrentlyActingUpdatesInDEV(p1)
                elseif not _G.__TESTEZ_RUNNING_TEST__ then
                end
            end
            scheduleUpdateOnFiber(p1, v2, v1)
        elseif alternate == nil then
            local lastRenderedReducer = p2.lastRenderedReducer
            if lastRenderedReducer ~= nil then
                local v5, v6, v7
                local current = nil
                if __DEV__ then
                    current = ReactCurrentDispatcher.current
                    ReactCurrentDispatcher.current = u258
                end
                local lastRenderedState = p2.lastRenderedState
                v5, v6 = pcall(lastRenderedReducer, lastRenderedState, p3)
                if v5 then
                    v3.eagerReducer = lastRenderedReducer
                    v3.eagerState = v6
                end
                if __DEV__ then
                    ReactCurrentDispatcher.current = current
                end
                if v6 ~= lastRenderedState then
                    v7 = if v6 ~= v6 then lastRenderedState ~= lastRenderedState else false
                else
                    v7 = true
                    if v6 == 0 then
                        v7 = true
                        if 1 / v6 == 1 / lastRenderedState then end
                    end
                end
                if v7 then
                    return
                end
            end
        elseif alternate.lanes ~= NoLanes then
        end
    elseif alternate ~= u245 then
    end
end
local u355 = {
    readContext = readContext,
    useCallback = throwInvalidHookError,
    useContext = throwInvalidHookError,
    useEffect = throwInvalidHookError,
    useImperativeHandle = throwInvalidHookError,
    useLayoutEffect = throwInvalidHookError,
    useMemo = throwInvalidHookError,
    useReducer = throwInvalidHookError,
    useRef = throwInvalidHookError,
    useBinding = throwInvalidHookError,
    useState = throwInvalidHookError,
    useDebugValue = throwInvalidHookError,
    useMutableSource = throwInvalidHookError,
    useOpaqueIdentifier = throwInvalidHookError,
    unstable_isNewReconciler = enableNewReconciler,
}
u242.ContextOnlyDispatcher = u355
local u358 = {
    readContext = readContext,
    useCallback = mountCallback,
    useContext = readContext,
    useEffect = mountEffect,
    useImperativeHandle = mountImperativeHandle,
    useLayoutEffect = mountLayoutEffect,
    useMemo = mountMemo,
    useReducer = mountReducer,
    useRef = mountRef,
    useBinding = mountBinding,
    useState = mountState,
    useDebugValue = mountDebugValue,
    useMutableSource = mountMutableSource,
    useOpaqueIdentifier = mountOpaqueIdentifier,
    unstable_isNewReconciler = enableNewReconciler,
}
local u369 = {
    readContext = readContext,
    useCallback = updateCallback,
    useContext = readContext,
    useEffect = updateEffect,
    useImperativeHandle = updateImperativeHandle,
    useLayoutEffect = updateLayoutEffect,
    useMemo = updateMemo,
    useReducer = updateReducer,
    useRef = updateRef,
    useBinding = updateBinding,
    useState = updateState,
    useDebugValue = u334,
    useMutableSource = updateMutableSource,
    useOpaqueIdentifier = updateOpaqueIdentifier,
    unstable_isNewReconciler = enableNewReconciler,
}
local u379 = {
    readContext = readContext,
    useCallback = updateCallback,
    useContext = readContext,
    useEffect = updateEffect,
    useImperativeHandle = updateImperativeHandle,
    useLayoutEffect = updateLayoutEffect,
    useMemo = updateMemo,
    useReducer = rerenderReducer,
    useRef = updateRef,
    useBinding = updateBinding,
    useState = rerenderState,
    useDebugValue = u334,
    useMutableSource = updateMutableSource,
    useOpaqueIdentifier = rerenderOpaqueIdentifier,
    unstable_isNewReconciler = enableNewReconciler,
}
if __DEV__ then
    local function v5() -- Line: 2002 -- upvalues: console (val)
        console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
    end
    local function v6() -- Line: 2011 -- upvalues: console (val)
        console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
    end
    u406 = {
        readContext = function(p1, p2) -- Line: 2021 -- upvalues: readContext (val)
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2024 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val)
            local v1
            u250 = "useCallback"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and p2 ~= nil then
                if type(p2) == "table" then
                    local v2 = p2
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        if type(i) ~= "number" then
                            v1 = false
                            if not v1 then
                                console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                            end
                            return mountCallback(p1, p2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                end
            end
            return mountCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2030 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), readContext (val)
            u250 = "useContext"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2035 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val), mountEffect (val)
            local v1
            u250 = "useEffect"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and p2 ~= nil then
                if type(p2) == "table" then
                    local v2 = p2
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        if type(i) ~= "number" then
                            v1 = false
                            if not v1 then
                                console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                            end
                            return mountEffect(p1, p2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                end
            end
            return mountEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2045 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val)
            local v1
            u250 = "useImperativeHandle"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and p3 ~= nil then
                if type(p3) == "table" then
                    local v2 = p3
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        if type(i) ~= "number" then
                            v1 = false
                            if not v1 then
                                console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p3)))
                            end
                            return mountImperativeHandle(p1, p2, p3)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p3)))
                end
            end
            return mountImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2055 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val), mountLayoutEffect (val)
            local v1
            u250 = "useLayoutEffect"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and p2 ~= nil then
                if type(p2) == "table" then
                    local v2 = p2
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        if type(i) ~= "number" then
                            v1 = false
                            if not v1 then
                                console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                            end
                            return mountLayoutEffect(p1, p2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                end
            end
            return mountLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2066 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2
            u250 = "useMemo"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and p2 ~= nil then
                if type(p2) == "table" then
                    v2 = p2
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        if type(i) ~= "number" then
                            v1 = false
                            if not v1 then
                                console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                            end
                            ReactCurrentDispatcher.current = u257
                            v2 = {pcall(mountMemo, p1, p2)}
                            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
                            if not (v2[1]) then
                                error(v2[2])
                            end
                            return unpack(v2, 2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
            end
            ReactCurrentDispatcher.current = u257
            v2 = {pcall(mountMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v2[1]) then
                error(v2[2])
            end
            return unpack(v2, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2084 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            if __DEV__ then
                local v4 = u250
                if u251 ~= nil then
                    table.insert(u251, v4)
                else
                    u251 = {v4}
                end
            end
            ReactCurrentDispatcher.current = u257
            v1, v2, v3 = pcall(mountReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2102 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useRef"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountRef(p1)
        end,
        useBinding = function(p1) -- Line: 2108 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useBinding"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountBinding(p1)
        end,
        useState = function(p1) -- Line: 2113 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2, v3
            u250 = "useState"
            if __DEV__ then
                local v4 = u250
                if u251 ~= nil then
                    table.insert(u251, v4)
                else
                    u251 = {v4}
                end
            end
            ReactCurrentDispatcher.current = u257
            v1, v2, v3 = pcall(mountState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 2127 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useDebugValue"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountDebugValue(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 2142 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useMutableSource"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 2157 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useOpaqueIdentifier"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u422 = {
        readContext = function(p1, p2) -- Line: 2167 -- upvalues: readContext (val)
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2170 -- upvalues: u250 (ref), __DEV__ (val), console (val)
            u250 = "useCallback"
            updateHookTypesDev()
            if __DEV__ and p2 ~= nil then
                local v1
                if type(p2) == "table" then
                    local v2 = p2
                    local v3 = nil
                    local v4 = nil
                    for i, j in v2, v3, v4 do
                        if type(i) ~= "number" then
                            v1 = false
                            if not v1 then
                                console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                            end
                            return mountCallback(p1, p2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", u250, (type(p2)))
                end
            end
            return mountCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2176 -- upvalues: u250 (ref), readContext (val)
            u250 = "useContext"
            updateHookTypesDev()
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2181 -- upvalues: u250 (ref), mountEffect (val)
            u250 = "useEffect"
            updateHookTypesDev()
            return mountEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2190 -- upvalues: u250 (ref)
            u250 = "useImperativeHandle"
            updateHookTypesDev()
            return mountImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2199 -- upvalues: u250 (ref), mountLayoutEffect (val)
            u250 = "useLayoutEffect"
            updateHookTypesDev()
            return mountLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2209 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useMemo"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u257
            local v1 = {pcall(mountMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v1[1]) then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2225 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u257
            v1, v2, v3 = pcall(mountReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2243 -- upvalues: u250 (ref)
            u250 = "useRef"
            updateHookTypesDev()
            return mountRef(p1)
        end,
        useBinding = function(p1) -- Line: 2249 -- upvalues: u250 (ref)
            u250 = "useBinding"
            updateHookTypesDev()
            return mountBinding(p1)
        end,
        useState = function(p1) -- Line: 2254 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2, v3
            u250 = "useState"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u257
            v1, v2, v3 = pcall(mountState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 2268 -- upvalues: u250 (ref)
            u250 = "useDebugValue"
            updateHookTypesDev()
            return mountDebugValue(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 2283 -- upvalues: u250 (ref)
            u250 = "useMutableSource"
            updateHookTypesDev()
            return mountMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 2298 -- upvalues: u250 (ref)
            u250 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return mountOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u438 = {
        readContext = function(p1, p2) -- Line: 2308 -- upvalues: readContext (val)
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2311 -- upvalues: u250 (ref)
            u250 = "useCallback"
            updateHookTypesDev()
            return updateCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2316 -- upvalues: u250 (ref), readContext (val)
            u250 = "useContext"
            updateHookTypesDev()
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2321 -- upvalues: u250 (ref), updateEffect (val)
            u250 = "useEffect"
            updateHookTypesDev()
            return updateEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2330 -- upvalues: u250 (ref)
            u250 = "useImperativeHandle"
            updateHookTypesDev()
            return updateImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2339 -- upvalues: u250 (ref), updateLayoutEffect (val)
            u250 = "useLayoutEffect"
            updateHookTypesDev()
            return updateLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2349 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useMemo"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            local v1 = {pcall(updateMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v1[1]) then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2365 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u258 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            v1, v2, v3 = pcall(updateReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2383 -- upvalues: u250 (ref)
            u250 = "useRef"
            updateHookTypesDev()
            return updateRef(p1)
        end,
        useBinding = function(p1) -- Line: 2389 -- upvalues: u250 (ref)
            u250 = "useBinding"
            updateHookTypesDev()
            return updateBinding(p1)
        end,
        useState = function(p1) -- Line: 2394 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u258 (ref)
            local v1, v2, v3
            u250 = "useState"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            v1, v2, v3 = pcall(updateState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 2408 -- upvalues: u250 (ref), u334 (val)
            u250 = "useDebugValue"
            updateHookTypesDev()
            return u334(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 2423 -- upvalues: u250 (ref)
            u250 = "useMutableSource"
            updateHookTypesDev()
            return updateMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 2438 -- upvalues: u250 (ref)
            u250 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return updateOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u454 = {
        readContext = function(p1, p2) -- Line: 2448 -- upvalues: readContext (val)
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2451 -- upvalues: u250 (ref)
            u250 = "useCallback"
            updateHookTypesDev()
            return mountCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2456 -- upvalues: u250 (ref), readContext (val)
            u250 = "useContext"
            updateHookTypesDev()
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2461 -- upvalues: u250 (ref), updateEffect (val)
            u250 = "useEffect"
            updateHookTypesDev()
            return updateEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2470 -- upvalues: u250 (ref)
            u250 = "useImperativeHandle"
            updateHookTypesDev()
            return updateImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2479 -- upvalues: u250 (ref), updateLayoutEffect (val)
            u250 = "useLayoutEffect"
            updateHookTypesDev()
            return updateLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2489 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u259 (ref)
            u250 = "useMemo"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u259
            local v1 = {pcall(updateMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v1[1]) then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2505 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u259 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u259
            v1, v2, v3 = pcall(rerenderReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2524 -- upvalues: u250 (ref)
            u250 = "useRef"
            updateHookTypesDev()
            return updateRef(p1)
        end,
        useBinding = function(p1) -- Line: 2530 -- upvalues: u250 (ref)
            u250 = "useBinding"
            updateHookTypesDev()
            return updateBinding(p1)
        end,
        useState = function(p1) -- Line: 2535 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u259 (ref)
            local v1, v2, v3
            u250 = "useState"
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u259
            v1, v2, v3 = pcall(rerenderState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 2549 -- upvalues: u250 (ref), u334 (val)
            u250 = "useDebugValue"
            updateHookTypesDev()
            return u334(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 2564 -- upvalues: u250 (ref)
            u250 = "useMutableSource"
            updateHookTypesDev()
            return updateMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 2579 -- upvalues: u250 (ref)
            u250 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return rerenderOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    local v7 = {
        readContext = function(p1, p2) -- Line: 2589 -- upvalues: console (val), readContext (val)
            console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2593 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useCallback"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2599 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), readContext (val)
            u250 = "useContext"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2605 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), mountEffect (val)
            u250 = "useEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2615 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useImperativeHandle"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2625 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), mountLayoutEffect (val)
            u250 = "useLayoutEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2636 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useMemo"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            ReactCurrentDispatcher.current = u257
            local v2 = {pcall(mountMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v2[1]) then
                error(v2[2])
            end
            return unpack(v2, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2653 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v4 = u250
                if u251 ~= nil then
                    table.insert(u251, v4)
                else
                    u251 = {v4}
                end
            end
            ReactCurrentDispatcher.current = u257
            v1, v2, v3 = pcall(mountReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2672 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useRef"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountRef(p1)
        end,
        useBinding = function(p1) -- Line: 2679 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useBinding"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountBinding(p1)
        end,
        useState = function(p1) -- Line: 2685 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            local v1, v2, v3
            u250 = "useState"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v4 = u250
                if u251 ~= nil then
                    table.insert(u251, v4)
                else
                    u251 = {v4}
                end
            end
            ReactCurrentDispatcher.current = u257
            v1, v2, v3 = pcall(mountState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 2700 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useDebugValue"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountDebugValue(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 2718 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useMutableSource"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 2734 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useOpaqueIdentifier"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u258 = {
        readContext = function(p1, p2) -- Line: 2745 -- upvalues: console (val), readContext (val)
            console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2749 -- upvalues: u250 (ref), console (val)
            u250 = "useCallback"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return mountCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2755 -- upvalues: u250 (ref), console (val), readContext (val)
            u250 = "useContext"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2761 -- upvalues: u250 (ref), console (val), updateEffect (val)
            u250 = "useEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2771 -- upvalues: u250 (ref), console (val)
            u250 = "useImperativeHandle"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2781 -- upvalues: u250 (ref), console (val), updateLayoutEffect (val)
            u250 = "useLayoutEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2792 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useMemo"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            local v1 = {pcall(updateMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v1[1]) then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2809 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            v1, v2, v3 = pcall(updateReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2829 -- upvalues: u250 (ref), console (val)
            u250 = "useRef"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateRef(p1)
        end,
        useBinding = function(p1) -- Line: 2836 -- upvalues: u250 (ref), console (val)
            u250 = "useBinding"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateBinding(p1)
        end,
        useState = function(p1) -- Line: 2842 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            local v1, v2, v3
            u250 = "useState"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            v1, v2, v3 = pcall(updateState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 2857 -- upvalues: u250 (ref), console (val), u334 (val)
            u250 = "useDebugValue"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return u334(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 2875 -- upvalues: u250 (ref), console (val)
            u250 = "useMutableSource"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 2891 -- upvalues: u250 (ref), console (val)
            u250 = "useOpaqueIdentifier"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    v7 = {
        readContext = function(p1, p2) -- Line: 2902 -- upvalues: console (val), readContext (val)
            console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return readContext(p1, p2)
        end,
        useCallback = function(p1, p2) -- Line: 2906 -- upvalues: u250 (ref), console (val)
            u250 = "useCallback"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateCallback(p1, p2)
        end,
        useContext = function(p1, p2) -- Line: 2912 -- upvalues: u250 (ref), console (val), readContext (val)
            u250 = "useContext"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return readContext(p1, p2)
        end,
        useEffect = function(p1, p2) -- Line: 2918 -- upvalues: u250 (ref), console (val), updateEffect (val)
            u250 = "useEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateEffect(p1, p2)
        end,
        useImperativeHandle = function(p1, p2, p3) -- Line: 2928 -- upvalues: u250 (ref), console (val)
            u250 = "useImperativeHandle"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateImperativeHandle(p1, p2, p3)
        end,
        useLayoutEffect = function(p1, p2) -- Line: 2938 -- upvalues: u250 (ref), console (val), updateLayoutEffect (val)
            u250 = "useLayoutEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateLayoutEffect(p1, p2)
        end,
        useMemo = function(p1, p2) -- Line: 2949 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useMemo"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            local v1 = {pcall(updateMemo, p1, p2)}
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not (v1[1]) then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(p1, p2, p3) -- Line: 2966 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            local v1, v2, v3
            u250 = "useReducer"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            v1, v2, v3 = pcall(rerenderReducer, p1, p2, p3)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useRef = function(p1) -- Line: 2986 -- upvalues: u250 (ref), console (val)
            u250 = "useRef"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateRef(p1)
        end,
        useBinding = function(p1) -- Line: 2993 -- upvalues: u250 (ref), console (val)
            u250 = "useBinding"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateBinding(p1)
        end,
        useState = function(p1) -- Line: 2999 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            local v1, v2, v3
            u250 = "useState"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            ReactCurrentDispatcher.current = u258
            v1, v2, v3 = pcall(rerenderState, p1)
            ReactCurrentDispatcher.current = ReactCurrentDispatcher.current
            if not v1 then
                error(v2)
            end
            return v2, v3
        end,
        useDebugValue = function(p1, p2) -- Line: 3014 -- upvalues: u250 (ref), console (val), u334 (val)
            u250 = "useDebugValue"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return u334(p1, p2)
        end,
        useMutableSource = function(p1, p2, p3) -- Line: 3032 -- upvalues: u250 (ref), console (val)
            u250 = "useMutableSource"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateMutableSource(p1, p2, p3)
        end,
        useOpaqueIdentifier = function() -- Line: 3048 -- upvalues: u250 (ref), console (val)
            u250 = "useOpaqueIdentifier"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return rerenderOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
end
function u242.renderWithHooks(p1, p2, p3, p4, p5, p6) -- Line: 3059 -- upvalues: u244 (ref), u245 (ref), __DEV__ (val), u251 (ref), u252 (ref), NoLanes (val), ReactCurrentDispatcher (val), u438 (ref), u422 (ref), u406 (ref), u358 (val), u369 (val), u249 (ref), Error (val), u246 (ref), u247 (ref), u454 (ref), u379 (val), u355 (val), u250 (ref), u248 (ref)
    local v1, v2, v3
    u244 = p6
    u245 = p2
    if __DEV__ then
        local _debugHookTypes
        if p1 == nil then
            _debugHookTypes = nil
        else
            _debugHookTypes = p1._debugHookTypes
        end
        u251 = _debugHookTypes
        u252 = 0
    end
    p2.memoizedState = nil
    p2.updateQueue = nil
    p2.lanes = NoLanes
    if not __DEV__ then
        v2 = ReactCurrentDispatcher
        if p1 == nil then
            v3 = u358
            if not v3 then
                v3 = u369
            end
        elseif p1.memoizedState ~= nil then
        end
        v2.current = v3
    elseif p1 == nil then
        if u251 == nil then
            ReactCurrentDispatcher.current = u406
        else
            ReactCurrentDispatcher.current = u422
        end
    elseif p1.memoizedState ~= nil then
        ReactCurrentDispatcher.current = u438
    end
    v2 = p3(p4, p5)
    if not u249 then
        v1 = p2
    else
        local v4, v5, v6, v7, v8
        v3 = 0
        while true do
            u249 = false
            if 25 <= v3 then
                error(Error.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
            end
            v3 = v3 + 1
            u246 = nil
            u247 = nil
            v1.updateQueue = nil
            if __DEV__ then
                u252 = 0
            end
            v7 = ReactCurrentDispatcher
            if not __DEV__ then
                v8 = u379
            else
                v8 = u454
            end
            v7.current = v8
            v2 = v4(v5, v6)
            if not u249 then
                break
            end
        end
    end
    ReactCurrentDispatcher.current = u355
    if __DEV__ then
        v1._debugHookTypes = u251
    end
    v3 = if u246 ~= nil then u246.next ~= nil else false
    u244 = NoLanes
    u245 = nil
    u246 = nil
    u247 = nil
    if __DEV__ then
        u250 = nil
        u251 = nil
        u252 = 0
    end
    u248 = false
    if v3 then
        error(Error.new("Rendered fewer hooks than expected. This may be caused by an accidental early return statement."))
    end
    return v2
end
return u242