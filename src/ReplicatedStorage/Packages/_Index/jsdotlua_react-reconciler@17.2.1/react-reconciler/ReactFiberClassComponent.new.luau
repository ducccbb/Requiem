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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberClassComponent.new
--                               Dumped in 0.00627 seconds
--                          Bytecode version 9  |  18 functions

local __DEV__ = _G.__DEV__
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local v1 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
local react = require(script.Parent.Parent:WaitForChild("react"))
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Update = ReactFiberFlags.Update
local Snapshot = ReactFiberFlags.Snapshot
local MountLayoutDev = ReactFiberFlags.MountLayoutDev
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local debugRenderPhaseSideEffectsForStrictMode = ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local disableLegacyContext = ReactFeatureFlags.disableLegacyContext
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local warnAboutDeprecatedLifecycles = ReactFeatureFlags.warnAboutDeprecatedLifecycles
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local u98 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local isMounted = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).isMounted
local ReactInstanceMap = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap
local get = ReactInstanceMap.get
local set = ReactInstanceMap.set
local shallowEqual = require(script.Parent.Parent:WaitForChild("shared")).shallowEqual
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local UninitializedState = require(script.Parent.Parent:WaitForChild("shared")).UninitializedState
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local resolveDefaultProps = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local DebugTracingMode = ReactTypeOfMode.DebugTracingMode
local StrictMode = ReactTypeOfMode.StrictMode
local enqueueUpdate = v1.enqueueUpdate
local processUpdateQueue = v1.processUpdateQueue
local checkHasForceUpdateAfterProcessing = v1.checkHasForceUpdateAfterProcessing
local resetHasForceUpdateBeforeProcessing = v1.resetHasForceUpdateBeforeProcessing
local createUpdate = v1.createUpdate
local ReplaceState = v1.ReplaceState
local ForceUpdate = v1.ForceUpdate
local initializeUpdateQueue = v1.initializeUpdateQueue
local cloneUpdateQueue = v1.cloneUpdateQueue
local NoLanes = ReactFiberLane.NoLanes
local v2 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local cacheContext = v2.cacheContext
local getMaskedContext = v2.getMaskedContext
local getUnmaskedContext = v2.getUnmaskedContext
local hasContextChanged = v2.hasContextChanged
local emptyContextObject = v2.emptyContextObject
local readContext = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).readContext
local DebugTracing = require(script.Parent:WaitForChild("DebugTracing"))
local logForceUpdateScheduled = DebugTracing.logForceUpdateScheduled
local logStateUpdateScheduled = DebugTracing.logStateUpdateScheduled
local ConsolePatchingDev = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local disableLogs = ConsolePatchingDev.disableLogs
local reenableLogs = ConsolePatchingDev.reenableLogs
local SchedulingProfiler = require(script.Parent:WaitForChild("SchedulingProfiler"))
local markForceUpdateScheduled = SchedulingProfiler.markForceUpdateScheduled
local markStateUpdateScheduled = SchedulingProfiler.markStateUpdateScheduled
local u255 = {}
local __refs = react.Component:extend("").__refs
local u272 = nil
local u273 = nil
local u274 = nil
local u275 = nil
local warnOnUndefinedDerivedState = nil
local warnOnInvalidCallback = nil
local u276 = nil
local u278 = nil
local u279 = nil
if __DEV__ then
    u272 = {}
    u273 = {}
    u274 = {}
    u275 = {}
    u276 = {}
    local v3 = {}
    u278 = {}
    u279 = {}
    local u280 = {}
    function warnOnInvalidCallback(p1, p2) -- Line: 137 -- upvalues: u280 (val), console (val)
        if p1 == nil or type(p1) == "function" then
            return
        end
        local v1 = p2 .. "_" .. tostring(p1)
        if not (u280[v1]) then
            u280[v1] = true
            console.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", p2, (tostring(p1)))
        end
    end
    function warnOnUndefinedDerivedState(p1, p2) end
end
local function applyDerivedStateFromProps(p1, p2, p3, p4) -- Line: 196 -- upvalues: __DEV__ (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), warnOnUndefinedDerivedState (ref), Object (val), NoLanes (val)
    local v1, v2
    local memoizedState = p1.memoizedState
    if __DEV__ and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
        disableLogs()
        v1, v2 = xpcall(p3, describeError, p4, memoizedState)
        reenableLogs()
        if not v1 then
            error(v2)
        end
    end
    v1 = p3(p4, memoizedState)
    if __DEV__ then
        warnOnUndefinedDerivedState(p2, v1)
    end
    if v1 ~= nil then
        v2 = Object.assign({}, memoizedState, v1)
    else
        v2 = memoizedState
    end
    p1.memoizedState = v2
    if p1.lanes == NoLanes then
        p1.updateQueue.baseState = v2
    end
end
local u293 = nil
local function initializeClassComponentUpdater() -- Line: 244 -- upvalues: u293 (ref), isMounted (val), get (val), createUpdate (val), __DEV__ (val), warnOnInvalidCallback (ref), enqueueUpdate (val), enableDebugTracing (val), DebugTracingMode (val), getComponentName (val), logStateUpdateScheduled (val), enableSchedulingProfiler (val), markStateUpdateScheduled (val), ReplaceState (val), ForceUpdate (val), logForceUpdateScheduled (val), markForceUpdateScheduled (val)
    local v1 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    local requestEventTime = v1.requestEventTime
    local requestUpdateLane = v1.requestUpdateLane
    local scheduleUpdateOnFiber = v1.scheduleUpdateOnFiber
    local v2 = {isMounted = isMounted}
    function v2.enqueueSetState(p1, p2, p3) -- Line: 252 -- upvalues: get (upval), requestEventTime (val), requestUpdateLane (val), createUpdate (upval), __DEV__ (upval), warnOnInvalidCallback (upval), enqueueUpdate (upval), scheduleUpdateOnFiber (val), enableDebugTracing (upval), DebugTracingMode (upval), getComponentName (upval), logStateUpdateScheduled (upval), enableSchedulingProfiler (upval), markStateUpdateScheduled (upval)
        local v1 = get(p1)
        local v2 = requestEventTime()
        local v3 = requestUpdateLane(v1)
        local v4 = createUpdate(v2, v3, p2, p3)
        if p3 ~= nil and __DEV__ then
            warnOnInvalidCallback(p3, "setState")
        end
        enqueueUpdate(v1, v4)
        scheduleUpdateOnFiber(v1, v3, v2)
        if __DEV__ and enableDebugTracing and bit32.band(v1.mode, DebugTracingMode) ~= 0 then
            local v5 = getComponentName(v1.type) or "Unknown"
            logStateUpdateScheduled(v5, v3, p2)
        end
        if enableSchedulingProfiler then
            markStateUpdateScheduled(v1, v3)
        end
    end
    function v2.enqueueReplaceState(p1, p2, p3) -- Line: 282 -- upvalues: get (upval), requestEventTime (val), requestUpdateLane (val), createUpdate (upval), ReplaceState (upval), __DEV__ (upval), warnOnInvalidCallback (upval), enqueueUpdate (upval), scheduleUpdateOnFiber (val), enableDebugTracing (upval), DebugTracingMode (upval), getComponentName (upval), logStateUpdateScheduled (upval), enableSchedulingProfiler (upval), markStateUpdateScheduled (upval)
        local v1 = get(p1)
        local v2 = requestEventTime()
        local v3 = requestUpdateLane(v1)
        local v4 = createUpdate(v2, v3, p2, p3)
        v4.tag = ReplaceState
        if p3 ~= nil and __DEV__ then
            warnOnInvalidCallback(p3, "replaceState")
        end
        enqueueUpdate(v1, v4)
        scheduleUpdateOnFiber(v1, v3, v2)
        if __DEV__ and enableDebugTracing and bit32.band(v1.mode, DebugTracingMode) ~= 0 then
            local v5 = getComponentName(v1.type) or "Unknown"
            logStateUpdateScheduled(v5, v3, p2)
        end
        if enableSchedulingProfiler then
            markStateUpdateScheduled(v1, v3)
        end
    end
    function v2.enqueueForceUpdate(p1, p2) -- Line: 314 -- upvalues: get (upval), requestEventTime (val), requestUpdateLane (val), createUpdate (upval), ForceUpdate (upval), __DEV__ (upval), warnOnInvalidCallback (upval), enqueueUpdate (upval), scheduleUpdateOnFiber (val), enableDebugTracing (upval), DebugTracingMode (upval), getComponentName (upval), logForceUpdateScheduled (upval), enableSchedulingProfiler (upval), markForceUpdateScheduled (upval)
        local v1 = get(p1)
        local v2 = requestEventTime()
        local v3 = requestUpdateLane(v1)
        local v4 = createUpdate(v2, v3, nil, p2)
        v4.tag = ForceUpdate
        if p2 ~= nil and __DEV__ then
            warnOnInvalidCallback(p2, "forceUpdate")
        end
        enqueueUpdate(v1, v4)
        scheduleUpdateOnFiber(v1, v3, v2)
        if __DEV__ and enableDebugTracing and bit32.band(v1.mode, DebugTracingMode) ~= 0 then
            local v5 = getComponentName(v1.type) or "Unknown"
            logForceUpdateScheduled(v5, v3)
        end
        if enableSchedulingProfiler then
            markForceUpdateScheduled(v1, v3)
        end
    end
    u293 = v2
end
local function getClassComponentUpdater() -- Line: 348 -- upvalues: u293 (ref), initializeClassComponentUpdater (val)
    if u293 == nil then
        initializeClassComponentUpdater()
    end
    return u293
end
function checkShouldComponentUpdate(p1, p2, p3, p4, p5, p6, p7) -- Line: 355 -- upvalues: __DEV__ (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), console (val), getComponentName (val), shallowEqual (val)
    local v1
    local stateNode = p1.stateNode
    if stateNode.shouldComponentUpdate == nil or type(stateNode.shouldComponentUpdate) ~= "function" then
        if type(p2) == "table" then
            if not p2.isPureReactComponent then
                return true
            end
            v1 = not shallowEqual(p3, p4)
            if not v1 then
                v1 = not shallowEqual(p5, p6)
            end
            return v1
        end
        return true
    end
    if __DEV__ and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
        local v2
        disableLogs()
        v1, v2 = xpcall(stateNode.shouldComponentUpdate, describeError, stateNode, p4, p6, p7)
        reenableLogs()
        if not v1 then
            error(v2)
        end
    end
    v1 = stateNode:shouldComponentUpdate(p4, p6, p7)
    if __DEV__ and v1 == nil then
        console.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", getComponentName(p2) or "Component")
    end
    return v1
end
local function checkClassInstance(p1, p2, p3) -- Line: 420 -- upvalues: __DEV__ (val), getComponentName (val), console (val), disableLegacyContext (val), u278 (ref), u274 (ref)
    local stateNode = p1.stateNode
    if __DEV__ then
        local state
        local v1 = getComponentName(p2) or "Component"
        if not stateNode.render then
            if type(p2.render) ~= "function" then
                console.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", v1)
            else
                console.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", v1)
            end
        end
        if stateNode.getInitialState and not stateNode.getInitialState.isReactClassApproved and not stateNode.state then
            console.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", v1)
        end
        if stateNode.getDefaultProps and not stateNode.getDefaultProps.isReactClassApproved then
            console.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", v1)
        end
        if stateNode.propTypes and not p2.propTypes then
            console.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", v1)
        end
        if stateNode.contextType and not p2.contextType then
            console.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", v1)
        end
        if not disableLegacyContext then
            if stateNode.contextTypes and not p2.contextTypes then
                console.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", v1)
            end
            if type(p2) == "table" and p2.contextType and p2.contextTypes and not (u278[p2]) then
                u278[p2] = true
                console.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", v1)
            end
        else
            if p2.childContextTypes then
                console.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", v1)
            end
            if p2.contextTypes then
                console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", v1)
            end
        end
        if type(stateNode.componentShouldUpdate) == "function" then
            console.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", v1)
        end
        if type(p2) == "table" and p2.isPureReactComponent and stateNode.shouldComponentUpdate ~= nil then
            console.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", getComponentName(p2) or "A pure component")
        end
        if type(stateNode.componentDidUnmount) == "function" then
            console.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", v1)
        end
        if type(stateNode.componentDidReceiveProps) == "function" then
            console.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v1)
        end
        if type(stateNode.componentWillRecieveProps) == "function" then
            console.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v1)
        end
        if type(stateNode.UNSAFE_componentWillRecieveProps) == "function" then
            console.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v1)
        end
        local v2 = stateNode.props ~= p3
        if stateNode.props ~= nil and v2 then
            console.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.", v1, v1)
        end
        if rawget(stateNode, "defaultProps") then
            console.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", v1, v1)
        end
        if type(stateNode.getSnapshotBeforeUpdate) == "function" and type(stateNode.componentDidUpdate) ~= "function" and not (u274[p2]) then
            u274[p2] = true
            console.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", getComponentName(p2))
        end
        state = stateNode.state
        if state ~= nil and type(state) ~= "table" then
            console.error("%s.state: must be set to an object or nil", v1)
        end
        if type(p2) == "table" and type(stateNode.getChildContext) == "function" and type(p2.childContextTypes) ~= "table" then
            console.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", v1)
        end
    end
end
local function callComponentWillMount(p1, p2) -- Line: 880 -- upvalues: __DEV__ (val), console (val), getComponentName (val), u293 (ref), initializeClassComponentUpdater (val)
    if p2.componentWillMount ~= nil and type(p2.componentWillMount) == "function" then
        p2:componentWillMount()
    end
    if p2.UNSAFE_componentWillMount ~= nil and type(p2.UNSAFE_componentWillMount) == "function" then
        p2:UNSAFE_componentWillMount()
    end
    if p2.state ~= p2.state then
        if __DEV__ then
            console.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", getComponentName(p1.type) or "Component")
        end
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        u293.enqueueReplaceState(p2, p2.state)
    end
end
function callComponentWillReceiveProps(p1, p2, p3, p4) -- Line: 910 -- upvalues: __DEV__ (val), getComponentName (val), u272 (ref), console (val), u293 (ref), initializeClassComponentUpdater (val)
    if p2.componentWillReceiveProps ~= nil and type(p2.componentWillReceiveProps) == "function" then
        p2:componentWillReceiveProps(p3, p4)
    end
    if p2.UNSAFE_componentWillReceiveProps ~= nil and type(p2.UNSAFE_componentWillReceiveProps) == "function" then
        p2:UNSAFE_componentWillReceiveProps(p3, p4)
    end
    if p2.state ~= p2.state then
        if __DEV__ then
            local v1 = getComponentName(p1.type) or "Component"
            if not (u272[v1]) then
                u272[v1] = true
                console.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", v1)
            end
        end
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        u293.enqueueReplaceState(p2, p2.state)
    end
end
function resumeMountClassInstance(p1, p2, p3, p4) -- Line: 1056 -- upvalues: emptyContextObject (val), readContext (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val), resetHasForceUpdateBeforeProcessing (val), processUpdateQueue (val), hasContextChanged (val), checkHasForceUpdateAfterProcessing (val), __DEV__ (val), enableDoubleInvokingEffects (val), MountLayoutDev (val), Update (val), applyDerivedStateFromProps (val)
    local stateNode = p1.stateNode
    local memoizedProps = p1.memoizedProps
    stateNode.props = memoizedProps
    local context = stateNode.context
    local contextType = p2.contextType
    local v1 = emptyContextObject
    if contextType == nil then
        if not disableLegacyContext then
            local v2 = getUnmaskedContext(p1, p2, true)
            v1 = getMaskedContext(p1, v2)
        end
    elseif type(contextType) == "table" then
        v1 = readContext(contextType)
    end
    local getDerivedStateFromProps = p2.getDerivedStateFromProps
    local v3 = if type(getDerivedStateFromProps) ~= "function" then type(stateNode.getSnapshotBeforeUpdate) == "function" else true
    if not v3 then
        if type(stateNode.UNSAFE_componentWillReceiveProps) == "function" then
            if memoizedProps ~= p3 then
                callComponentWillReceiveProps(p1, stateNode, p3, v1)
            elseif context == v1 then
            end
        elseif type(stateNode.componentWillReceiveProps) ~= "function" then
        end
    end
    resetHasForceUpdateBeforeProcessing()
    local memoizedState = p1.memoizedState
    stateNode.state = memoizedState
    processUpdateQueue(p1, p3, stateNode, p4)
    local memoizedState_2 = p1.memoizedState
    if memoizedProps ~= p3 then
        if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
            applyDerivedStateFromProps(p1, p2, getDerivedStateFromProps, p3)
            memoizedState_2 = p1.memoizedState
        end
        local v4 = checkHasForceUpdateAfterProcessing()
        if not v4 then
            v4 = checkShouldComponentUpdate(p1, p2, memoizedProps, p3, memoizedState, memoizedState_2, v1)
        end
        if not v4 then
            if type(stateNode.componentDidMount) == "function" then
                if not __DEV__ then
                    p1.flags = bit32.bor(p1.flags, Update)
                elseif not enableDoubleInvokingEffects then
                    p1.flags = bit32.bor(p1.flags, Update)
                else
                    p1.flags = bit32.bor(p1.flags, MountLayoutDev, Update)
                end
            end
            p1.memoizedProps = p3
            p1.memoizedState = memoizedState_2
        else
            if not v3 then
                if type(stateNode.UNSAFE_componentWillMount) == "function" then
                    if type(stateNode.componentWillMount) == "function" then
                        stateNode:componentWillMount()
                    end
                    if type(stateNode.UNSAFE_componentWillMount) == "function" then
                        stateNode:UNSAFE_componentWillMount()
                    end
                elseif type(stateNode.componentWillMount) ~= "function" then
                end
            end
            if type(stateNode.componentDidMount) == "function" then
                if not __DEV__ then
                    p1.flags = bit32.bor(p1.flags, Update)
                elseif not enableDoubleInvokingEffects then
                    p1.flags = bit32.bor(p1.flags, Update)
                else
                    p1.flags = bit32.bor(p1.flags, MountLayoutDev, Update)
                end
            end
        end
        stateNode.props = p3
        stateNode.state = memoizedState_2
        stateNode.context = v1
        return v4
    elseif memoizedState == memoizedState_2 and not (hasContextChanged()) and not (checkHasForceUpdateAfterProcessing()) then
        if type(stateNode.componentDidMount) == "function" then
            if not __DEV__ then
                p1.flags = bit32.bor(p1.flags, Update)
            elseif not enableDoubleInvokingEffects then
                p1.flags = bit32.bor(p1.flags, Update)
            else
                p1.flags = bit32.bor(p1.flags, MountLayoutDev, Update)
            end
        end
        return false
    end
end
return {
    adoptClassInstance = function(p1, p2) -- Line: 654 -- upvalues: u293 (ref), initializeClassComponentUpdater (val), set (val), __DEV__ (val), u255 (val)
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        p2.__updater = u293
        p1.stateNode = p2
        set(p2, p1)
        if __DEV__ then
            p2._reactInternalInstance = u255
        end
    end,
    constructClassInstance = function(p1, p2, p3) -- Line: 665 -- upvalues: emptyContextObject (val), __DEV__ (val), REACT_CONTEXT_TYPE (val), u279 (ref), REACT_PROVIDER_TYPE (val), console (val), getComponentName (val), readContext (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), u293 (ref), initializeClassComponentUpdater (val), set (val), u255 (val), UninitializedState (val), u273 (ref), u275 (ref), cacheContext (val)
        local v1, v2, v3, v4, v5
        local v6 = false
        local v7 = emptyContextObject
        local v8 = emptyContextObject
        local contextType = p2.contextType
        if __DEV__ and p2.contextType ~= nil then
            v3 = if contextType ~= nil then if contextType["$$typeof"] == REACT_CONTEXT_TYPE then contextType._context == nil else false else true
            if not v3 and not (u279[p2]) then
                u279[p2] = true
                if contextType == nil then
                    v4 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
                elseif type(contextType) ~= "table" then
                    v4 = " However, it is set to a " .. type(contextType) .. "."
                elseif contextType["$$typeof"] == REACT_PROVIDER_TYPE then
                    v4 = " Did you accidentally pass the Context.Provider instead?"
                elseif contextType._context == nil then
                    v4 = "" .. " However, it is set to an object with keys {"
                    v5 = contextType
                    v1 = nil
                    v2 = nil
                    for i, j in v5, v1, v2 do
                        v4 = v4 .. i .. ", "
                    end
                    v4 = v4 .. "}."
                else
                    v4 = " Did you accidentally pass the Context.Consumer instead?"
                end
                v2 = getComponentName(p2) or "Component"
                console.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", v2, v4)
            end
        end
        if contextType == nil then
            if not disableLegacyContext then
                v7 = getUnmaskedContext(p1, p2, true)
                v6 = p2.contextTypes ~= nil
                if not v6 then
                    v4 = emptyContextObject
                else
                    v4 = getMaskedContext(p1, v7)
                end
                v8 = v4
            end
        elseif type(contextType) == "table" then
            v8 = readContext(contextType)
        end
        if __DEV__ and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
            disableLogs()
            v3, v4 = xpcall(p2.__ctor, describeError, p3, v8)
            reenableLogs()
            if not v3 then
                error(v4)
            end
        end
        v3 = p2.__ctor(p3, v8)
        p1.memoizedState = v3.state
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        v3.__updater = u293
        p1.stateNode = v3
        set(v3, p1)
        if __DEV__ then
            v3._reactInternalInstance = u255
        end
        if __DEV__ then
            if type(p2.getDerivedStateFromProps) == "function" and p1.memoizedState == UninitializedState then
                v5 = getComponentName(p2) or "Component"
                if not (u273[v5]) then
                    u273[v5] = true
                    console.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v5, v5)
                end
            end
            if type(p2.getDerivedStateFromProps) == "function" then
                v5 = nil
                v1 = nil
                v2 = nil
                if type(v3.componentWillMount) == "function" then
                    v5 = "componentWillMount"
                elseif type(v3.UNSAFE_componentWillMount) == "function" then
                    v5 = "UNSAFE_componentWillMount"
                end
                if type(v3.componentWillReceiveProps) == "function" then
                    v1 = "componentWillReceiveProps"
                elseif type(v3.UNSAFE_componentWillReceiveProps) == "function" then
                    v1 = "UNSAFE_componentWillReceiveProps"
                end
                if type(v3.componentWillUpdate) == "function" then
                    v2 = "componentWillUpdate"
                elseif type(v3.UNSAFE_componentWillUpdate) == "function" then
                    v2 = "UNSAFE_componentWillUpdate"
                end
                if v5 ~= nil then
                    local v9, v10, v11, v12
                    local v13 = getComponentName(p2) or "Component"
                    if type(p2.getDerivedStateFromProps) ~= "function" then
                        v9 = "getSnapshotBeforeUpdate()"
                    else
                        v9 = "getDerivedStateFromProps()"
                    end
                    if v5 == nil then
                        v10 = ""
                    else
                        v10 = "\n  " .. tostring(v5)
                    end
                    if v1 == nil then
                        v11 = ""
                    else
                        v11 = "\n  " .. tostring(v1)
                    end
                    if v2 == nil then
                        v12 = ""
                    else
                        v12 = "\n  " .. tostring(v2)
                    end
                    if not (u275[v13]) then
                        u275[v13] = true
                        console.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", v13, v9, v10, v11, v12)
                    end
                elseif v1 == nil and v2 == nil then
                end
            elseif type(v3.getSnapshotBeforeUpdate) ~= "function" then
            end
        end
        if v6 then
            cacheContext(p1, v7, v8)
        end
        return v3
    end,
    mountClassInstance = function(p1, p2, p3, p4) -- Line: 945 -- upvalues: __DEV__ (val), checkClassInstance (val), __refs (val), initializeUpdateQueue (val), readContext (val), disableLegacyContext (val), emptyContextObject (val), getUnmaskedContext (val), getMaskedContext (val), getComponentName (val), u276 (ref), console (val), StrictMode (val), u98 (val), warnAboutDeprecatedLifecycles (val), processUpdateQueue (val), applyDerivedStateFromProps (val), callComponentWillMount (val), enableDoubleInvokingEffects (val), MountLayoutDev (val), Update (val)
        local contextType, getDerivedStateFromProps, v1
        if __DEV__ then
            checkClassInstance(p1, p2, p3)
        end
        local stateNode = p1.stateNode
        stateNode.props = p3
        stateNode.state = p1.memoizedState
        stateNode.__refs = __refs
        initializeUpdateQueue(p1)
        contextType = if type(p2) == "table" then p2.contextType else nil
        if contextType == nil then
            if not disableLegacyContext then
                v1 = getUnmaskedContext(p1, p2, true)
                stateNode.context = getMaskedContext(p1, v1)
            else
                stateNode.context = emptyContextObject
            end
        elseif type(contextType) == "table" then
            stateNode.context = readContext(contextType)
        end
        if __DEV__ then
            if stateNode.state == p3 then
                v1 = getComponentName(p2) or "Component"
                if not (u276[v1]) then
                    u276[v1] = true
                    console.error("%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.", v1)
                end
            end
            if bit32.band(p1.mode, StrictMode) ~= 0 then
                u98.recordLegacyContextWarning(p1, stateNode)
            end
            if warnAboutDeprecatedLifecycles then
                u98.recordUnsafeLifecycleWarnings(p1, stateNode)
            end
        end
        processUpdateQueue(p1, p3, stateNode, p4)
        stateNode.state = p1.memoizedState
        v1 = type(p2)
        getDerivedStateFromProps = if type(p2) == "table" then p2.getDerivedStateFromProps else nil
        if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
            applyDerivedStateFromProps(p1, p2, getDerivedStateFromProps, p3)
            stateNode.state = p1.memoizedState
        end
        if v1 == "table" and type(p2.getDerivedStateFromProps) ~= "function" and type(stateNode.getSnapshotBeforeUpdate) ~= "function" then
            if type(stateNode.UNSAFE_componentWillMount) == "function" then
                callComponentWillMount(p1, stateNode)
                processUpdateQueue(p1, p3, stateNode, p4)
                stateNode.state = p1.memoizedState
            elseif type(stateNode.componentWillMount) ~= "function" then
            end
        end
        if type(stateNode.componentDidMount) ~= "function" then
            return
        end
        if not __DEV__ then
            p1.flags = bit32.bor(p1.flags, Update)
            return
        end
        if enableDoubleInvokingEffects then
            p1.flags = bit32.bor(p1.flags, (bit32.bor(MountLayoutDev, Update)))
            return
        end
        p1.flags = bit32.bor(p1.flags, Update)
    end,
    resumeMountClassInstance = resumeMountClassInstance,
    updateClassInstance = function(p1, p2, p3, p4, p5) -- Line: 1204 -- upvalues: cloneUpdateQueue (val), resolveDefaultProps (val), emptyContextObject (val), readContext (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val), resetHasForceUpdateBeforeProcessing (val), processUpdateQueue (val), hasContextChanged (val), checkHasForceUpdateAfterProcessing (val), Update (val), Snapshot (val), applyDerivedStateFromProps (val)
        local v1, v2
        local stateNode = p2.stateNode
        cloneUpdateQueue(p1, p2)
        local memoizedProps = p2.memoizedProps
        if p2.type ~= p2.elementType then
            v2 = resolveDefaultProps(p2.type, memoizedProps)
        else
            v2 = memoizedProps
        end
        stateNode.props = v2
        local pendingProps = p2.pendingProps
        local context = stateNode.context
        local contextType = nil
        local getDerivedStateFromProps = nil
        if type(p3) == "table" then
            contextType = p3.contextType
            getDerivedStateFromProps = p3.getDerivedStateFromProps
        end
        local v3 = emptyContextObject
        if type(contextType) == "table" then
            v3 = readContext(contextType)
        elseif not disableLegacyContext then
            v1 = getUnmaskedContext(p2, p3, true)
            v3 = getMaskedContext(p2, v1)
        end
        if getDerivedStateFromProps == nil then
            v1 = if stateNode.getSnapshotBeforeUpdate ~= nil then type(stateNode.getSnapshotBeforeUpdate) == "function" else false
        else
            v1 = true
            if type(getDerivedStateFromProps) == "function" then end
        end
        if not v1 then
            if stateNode.UNSAFE_componentWillReceiveProps == nil then
                if stateNode.componentWillReceiveProps ~= nil and type(stateNode.componentWillReceiveProps) == "function" then
                    if memoizedProps ~= pendingProps then
                        callComponentWillReceiveProps(p2, stateNode, p4, v3)
                    elseif context == v3 then
                    end
                end
            elseif type(stateNode.UNSAFE_componentWillReceiveProps) == "function" then
            end
        end
        resetHasForceUpdateBeforeProcessing()
        local memoizedState = p2.memoizedState
        stateNode.state = memoizedState
        processUpdateQueue(p2, p4, stateNode, p5)
        local memoizedState_2 = p2.memoizedState
        if memoizedProps ~= pendingProps then
            if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
                applyDerivedStateFromProps(p2, p3, getDerivedStateFromProps, p4)
                memoizedState_2 = p2.memoizedState
            end
            local v4 = checkHasForceUpdateAfterProcessing()
            if not v4 then
                v4 = checkShouldComponentUpdate(p2, p3, v2, p4, memoizedState, memoizedState_2, v3)
            end
            if not v4 then
                if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
                    if memoizedProps ~= p1.memoizedProps then
                        p2.flags = bit32.bor(p2.flags, Update)
                    elseif memoizedState == p1.memoizedState then
                    end
                end
                if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
                    if memoizedProps ~= p1.memoizedProps then
                        p2.flags = bit32.bor(p2.flags, Snapshot)
                    elseif memoizedState ~= p1.memoizedState then
                        p2.flags = bit32.bor(p2.flags, Snapshot)
                    end
                end
                p2.memoizedProps = p4
                p2.memoizedState = memoizedState_2
            else
                if not v1 then
                    if stateNode.UNSAFE_componentWillUpdate == nil then
                        if stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
                            if stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
                                stateNode:componentWillUpdate(p4, memoizedState_2, v3)
                            end
                            if stateNode.UNSAFE_componentWillUpdate ~= nil and type(stateNode.UNSAFE_componentWillUpdate) == "function" then
                                stateNode:UNSAFE_componentWillUpdate(p4, memoizedState_2, v3)
                            end
                        end
                    elseif type(stateNode.UNSAFE_componentWillUpdate) == "function" then
                    end
                end
                if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
                    p2.flags = bit32.bor(p2.flags, Update)
                end
                if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
                    p2.flags = bit32.bor(p2.flags, Snapshot)
                end
            end
            stateNode.props = p4
            stateNode.state = memoizedState_2
            stateNode.context = v3
            return v4
        elseif memoizedState == memoizedState_2 and not (hasContextChanged()) and not (checkHasForceUpdateAfterProcessing()) then
            if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
                if memoizedProps ~= p1.memoizedProps then
                    p2.flags = bit32.bor(p2.flags, Update)
                elseif memoizedState == p1.memoizedState then
                end
            end
            if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
                if memoizedProps ~= p1.memoizedProps then
                    p2.flags = bit32.bor(p2.flags, Snapshot)
                elseif memoizedState ~= p1.memoizedState then
                    p2.flags = bit32.bor(p2.flags, Snapshot)
                end
            end
            return false
        end
    end,
    applyDerivedStateFromProps = applyDerivedStateFromProps,
    emptyRefsObject = __refs,
}