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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberNewContext.new
--                               Dumped in 0.00144 seconds
--                          Bytecode version 9  |  11 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Number = v1.Number
local Error = v1.Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local v3 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local isPrimaryRenderer = require(script.Parent:WaitForChild("ReactFiberHostConfig")).isPrimaryRenderer
local push = v2.push
local pop = v2.pop
local MAX_SIGNED_31_BIT_INT = require(script.Parent:WaitForChild("MaxInts")).MAX_SIGNED_31_BIT_INT
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ContextProvider = ReactWorkTags.ContextProvider
local ClassComponent = ReactWorkTags.ClassComponent
local NoLanes = ReactFiberLane.NoLanes
local NoTimestamp = ReactFiberLane.NoTimestamp
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local includesSomeLane = ReactFiberLane.includesSomeLane
local mergeLanes = ReactFiberLane.mergeLanes
local pickArbitraryLane = ReactFiberLane.pickArbitraryLane
local objectIs = require(script.Parent.Parent:WaitForChild("shared")).objectIs
local createUpdate = v3.createUpdate
local ForceUpdate = v3.ForceUpdate
local u111 = {}
local u114 = v2.createCursor(nil)
local u118 = if _G.__DEV__ then {} else nil
local u119 = nil
local u120 = nil
local u121 = nil
local u122 = false
function u111.resetContextDependencies() -- Line: 72 -- upvalues: u119 (ref), u120 (ref), u121 (ref), u122 (ref)
    u119 = nil
    u120 = nil
    u121 = nil
    if _G.__DEV__ then
        u122 = false
    end
end
function u111.enterDisallowedContextReadInDEV() -- Line: 83 -- upvalues: u122 (ref)
    if _G.__DEV__ then
        u122 = true
    end
end
function u111.exitDisallowedContextReadInDEV() -- Line: 89 -- upvalues: u122 (ref)
    if _G.__DEV__ then
        u122 = false
    end
end
function u111.pushProvider(p1, p2) -- Line: 95 -- upvalues: isPrimaryRenderer (val), push (val), u114 (val), u118 (ref), console (val)
    local _context = p1.type._context
    if not isPrimaryRenderer then
        push(u114, _context._currentValue2, p1)
        _context._currentValue2 = p2
        if _G.__DEV__ then
            if _context._currentRenderer2 ~= nil and _context._currentRenderer2 ~= u118 then
                console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
            end
            _context._currentRenderer2 = u118
        end
        return
    end
    push(u114, _context._currentValue, p1)
    _context._currentValue = p2
    if not _G.__DEV__ then
        return
    end
    if _context._currentRenderer ~= nil and _context._currentRenderer ~= u118 then
        console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
    end
    _context._currentRenderer = u118
end
function u111.popProvider(p1) -- Line: 133 -- upvalues: u114 (val), pop (val), isPrimaryRenderer (val)
    local current = u114.current
    pop(u114, p1)
    local _context = p1.type._context
    if isPrimaryRenderer then
        _context._currentValue = current
        return
    end
    _context._currentValue2 = current
end
function u111.calculateChangedBits(p1, p2, p3) -- Line: 147 -- upvalues: objectIs (val), MAX_SIGNED_31_BIT_INT (val)
    if objectIs(p3, p2) then
        return 0
    end
    local v1 = if typeof(p1._calculateChangedBits) == "function" then p1._calculateChangedBits(p3, p2) else MAX_SIGNED_31_BIT_INT
    return (math.floor(v1))
end
function u111.scheduleWorkOnParentPath(p1, p2) -- Line: 174 -- upvalues: isSubsetOfLanes (val), mergeLanes (val)
    local alternate
    local return_ = p1
    local v1 = p2
    while return_ ~= nil do
        alternate = return_.alternate
        if isSubsetOfLanes(return_.childLanes, v1) then
            if alternate == nil or isSubsetOfLanes(alternate.childLanes, v1) then
                break
            end
            alternate.childLanes = mergeLanes(alternate.childLanes, v1)
            return_ = return_.return_
        else
            return_.childLanes = mergeLanes(return_.childLanes, v1)
            if alternate ~= nil then
                alternate.childLanes = mergeLanes(alternate.childLanes, v1)
            end
        end
    end
end
function u111.propagateContextChange(p1, p2, p3, p4) -- Line: 197 -- upvalues: ClassComponent (val), createUpdate (val), NoTimestamp (val), pickArbitraryLane (val), ForceUpdate (val), u111 (val), ContextProvider (val)
    local alternate, child_2, dependencies, firstContext, pending, shared, sibling, updateQueue, v1, v2, v3, v4, v5
    local child = p1.child
    if child == nil then
        v2, v3, v4, v1 = p2, p3, p4, p1
    else
        child.return_ = p1
        v2, v3, v4, v1 = p2, p3, p4, p1
    end
    while child ~= nil do
        dependencies = child.dependencies
        if dependencies ~= nil then
            child_2 = child.child
            firstContext = dependencies.firstContext
            while firstContext ~= nil do
                if firstContext.context == v2 and bit32.band(firstContext.observedBits, v3) ~= 0 then
                    if child.tag == ClassComponent then
                        v5 = createUpdate(NoTimestamp, pickArbitraryLane(v4))
                        v5.tag = ForceUpdate
                        updateQueue = child.updateQueue
                        if updateQueue ~= nil then
                            shared = updateQueue.shared
                            pending = shared.pending
                            if pending ~= nil then
                                v5.next = pending.next
                                pending.next = v5
                            else
                                v5.next = v5
                            end
                            shared.pending = v5
                        end
                    end
                    child.lanes = bit32.bor(child.lanes, v4)
                    alternate = child.alternate
                    if alternate ~= nil then
                        alternate.lanes = bit32.bor(alternate.lanes, v4)
                    end
                    u111.scheduleWorkOnParentPath(child.return_, v4)
                    dependencies.lanes = bit32.bor(dependencies.lanes, v4)
                    break
                end
                firstContext = firstContext.next
            end
        elseif child.tag ~= ContextProvider then
            child_2 = child.child
        elseif child.type ~= v1.type then
            child_2 = child.child
        else
            child_2 = nil
        end
        if child_2 == nil then
            child_2 = child
            while child_2 ~= nil do
                if child_2 == v1 then
                    child_2 = nil
                    break
                end
                sibling = child_2.sibling
                if sibling ~= nil then
                    sibling.return_ = child_2.return_
                    child_2 = sibling
                    break
                end
                child_2 = child_2.return_
            end
        else
            child_2.return_ = child
        end
        child = child_2
    end
end
function u111.prepareToReadContext(p1, p2, p3) -- Line: 336 -- upvalues: u119 (ref), u120 (ref), u121 (ref), includesSomeLane (val)
    u119 = p1
    u120 = nil
    u121 = nil
    local dependencies = p1.dependencies
    if dependencies ~= nil and dependencies.firstContext ~= nil then
        if includesSomeLane(dependencies.lanes, p2) then
            p3()
        end
        dependencies.firstContext = nil
    end
end
function u111.readContext(p1, p2) -- Line: 360 -- upvalues: u122 (ref), console (val), u121 (ref), Number (val), u120 (ref), u119 (ref), Error (val), NoLanes (val), isPrimaryRenderer (val)
    if _G.__DEV__ and u122 then
        console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
    end
    if u121 ~= p1 and p2 ~= false and p2 ~= 0 then
        local MAX_SAFE_INTEGER
        if typeof(p2) ~= "number" then
            u121 = p1
            MAX_SAFE_INTEGER = Number.MAX_SAFE_INTEGER
        elseif p2 ~= Number.MAX_SAFE_INTEGER then
            MAX_SAFE_INTEGER = p2
        end
        local v1 = {context = p1, observedBits = MAX_SAFE_INTEGER}
        if u120 ~= nil then
            u120.next = v1
            u120 = v1
        else
            if u119 == nil then
                error(Error.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."))
            end
            u120 = v1
            u119.dependencies = {lanes = NoLanes, firstContext = v1}
        end
    end
    if isPrimaryRenderer then
        return p1._currentValue
    end
    return p1._currentValue2
end
return u111