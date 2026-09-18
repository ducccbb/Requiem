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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactChildFiber.new
--                               Dumped in 0.00995 seconds
--                          Bytecode version 9  |  30 functions

local __DEV__ = _G.__DEV__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("react"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberLane"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Placement = ReactFiberFlags.Placement
local Deletion = ReactFiberFlags.Deletion
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local getIteratorFn = ReactSymbols.getIteratorFn
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local Fragment = ReactWorkTags.Fragment
local Block = ReactWorkTags.Block
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableLazyElements = ReactFeatureFlags.enableLazyElements
local enableBlocksAPI = ReactFeatureFlags.enableBlocksAPI
local v2 = require(script.Parent:WaitForChild("ReactFiber.new"))
local createWorkInProgress = v2.createWorkInProgress
local resetWorkInProgress = v2.resetWorkInProgress
local createFiberFromElement = v2.createFiberFromElement
local createFiberFromFragment = v2.createFiberFromFragment
local createFiberFromText = v2.createFiberFromText
local createFiberFromPortal = v2.createFiberFromPortal
local v3 = {}
local u160 = nil
local u162 = nil
local function u163(p1, p2) end
if __DEV__ then
    u160 = false
    local u161 = {}
    u162 = {}
    function u163(p1, p2) -- Line: 112 -- upvalues: invariant (val), getComponentName (val), u161 (ref), console (val)
        if p1 == nil or type(p1) ~= "table" or not p1._store or p1._store.validated or p1.key ~= nil then
            return
        end
        local v1 = if p1._store ~= nil then type(p1._store) == "table" else false
        invariant(v1, "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.")
        p1._store.validated = true
        local v2 = getComponentName(p2.type) or "Component"
        if u161[v2] then
            return
        end
        u161[v2] = true
        console.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
    end
end
local isArray = v1.Array.isArray
function coerceRef(p1, p2, p3) -- Line: 143 -- upvalues: __DEV__ (val), getComponentName (val), Error (val)
    local ref = p3.ref
    if ref ~= nil and type(ref) == "string" then
        if not p3._owner then
            local v1
            if not __DEV__ then
                v1 = "<enable __DEV__ mode for component names>"
            else
                v1 = getComponentName(p1.type) or "Component"
            end
            error(Error.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v1, (tostring(ref)))))
        elseif p3._self and p3._owner.stateNode ~= p3._self then
        end
        if not p3._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
        end
    end
    return ref
end
local function warnOnFunctionType(p1) -- Line: 316 -- upvalues: __DEV__ (val), getComponentName (val), u162 (ref), console (val)
    if not __DEV__ then
        return
    end
    local v1 = getComponentName(p1.type) or "Component"
    if u162[v1] then
        return
    end
    u162[v1] = true
    console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
end
function resolveLazyType(p1) -- Line: 335 -- upvalues: describeError (val)
    local v1, v2
    v1, v2 = xpcall(p1._init, describeError, p1._payload)
    if not v1 then
        return p1
    end
    return v2
end
local function ChildReconciler(p1) -- Line: 353 -- upvalues: Deletion (val), createWorkInProgress (val), Placement (val), HostText (val), createFiberFromText (val), __DEV__ (val), enableBlocksAPI (val), Block (val), REACT_LAZY_TYPE (val), REACT_BLOCK_TYPE (val), createFiberFromElement (val), HostPortal (val), createFiberFromPortal (val), Fragment (val), createFiberFromFragment (val), REACT_ELEMENT_TYPE (val), REACT_PORTAL_TYPE (val), enableLazyElements (val), getComponentName (val), u162 (ref), console (val), REACT_FRAGMENT_TYPE (val), u163 (ref), u160 (ref), isArray (val), getIteratorFn (val)
    local createChild, reconcileChildFibers, updateFromMap, updateSlot, warnOnInvalidKey
    local function deleteChild(a1, p2) -- Line: 354 -- upvalues: p1 (val), Deletion (upval)
        if not p1 then
            return
        end
        local deletions = a1.deletions
        if deletions ~= nil then
            table.insert(deletions, p2)
            return
        end
        a1.deletions = {p2}
        a1.flags = bit32.bor(a1.flags, Deletion)
    end
    local function deleteRemainingChildren(a1, p2) -- Line: 368 -- upvalues: p1 (val), Deletion (upval)
        local deletions, v1
        if not p1 then
            return nil
        end
        local sibling = p2
        local v2 = a1
        while sibling ~= nil do
            v1 = sibling
            if p1 then
                deletions = v2.deletions
                if deletions ~= nil then
                    table.insert(deletions, v1)
                else
                    v2.deletions = {v1}
                    v2.flags = bit32.bor(v2.flags, Deletion)
                end
            end
            sibling = sibling.sibling
        end
        return nil
    end
    local function mapRemainingChildren(p1, p2) -- Line: 387
        local v1 = {}
        local sibling = p2
        while sibling ~= nil do
            if sibling.key == nil then
                v1[sibling.index] = sibling
            else
                v1[sibling.key] = sibling
            end
            sibling = sibling.sibling
        end
        return v1
    end
    local function useFiber(p1, p2) -- Line: 409 -- upvalues: createWorkInProgress (upval)
        local v1 = createWorkInProgress(p1, p2)
        v1.index = 1
        v1.sibling = nil
        return v1
    end
    local function placeChild(a1, p2, p3) -- Line: 419 -- upvalues: p1 (val), Placement (upval)
        a1.index = p3
        if not p1 then
            return p2
        end
        local alternate = a1.alternate
        if alternate == nil then
            a1.flags = bit32.bor(a1.flags, Placement)
            return p2
        end
        local index = alternate.index
        if index >= p2 then
            return index
        end
        a1.flags = bit32.bor(a1.flags, Placement)
        return p2
    end
    local function placeSingleChild(a1) -- Line: 447 -- upvalues: p1 (val), Placement (upval)
        if p1 and a1.alternate == nil then
            a1.flags = bit32.bor(a1.flags, Placement)
        end
        return a1
    end
    local function updateTextNode(p1, p2, p3, p4) -- Line: 456 -- upvalues: HostText (upval), createFiberFromText (upval), createWorkInProgress (upval)
        local v1
        if p2 == nil or p2.tag ~= HostText then
            v1 = createFiberFromText(p3, p1.mode, p4)
            v1.return_ = p1
            return v1
        end
        local v2 = createWorkInProgress(p2, p3)
        v2.index = 1
        v2.sibling = nil
        v1 = v2
        v1.return_ = p1
        return v1
    end
    local function updateElement(p1, p2, p3, p4) -- Line: 476 -- upvalues: createWorkInProgress (upval), __DEV__ (upval), enableBlocksAPI (upval), Block (upval), REACT_LAZY_TYPE (upval), REACT_BLOCK_TYPE (upval), createFiberFromElement (upval)
        local type, v1
        if p2 == nil then
            v1 = createFiberFromElement(p3, p1.mode, p4)
            v1.ref = coerceRef(p1, p2, p3)
            v1.return_ = p1
            return v1
        end
        if p2.elementType == p3.type then
            local v2 = createWorkInProgress(p2, p3.props)
            v2.index = 1
            v2.sibling = nil
            v1 = v2
            v1.ref = coerceRef(p1, p2, p3)
            v1.return_ = p1
            if __DEV__ then
                v1._debugSource = p3._source
                v1._debugOwner = p3._owner
            end
            return v1
        end
        if not enableBlocksAPI or p2.tag ~= Block then
            v1 = createFiberFromElement(p3, p1.mode, p4)
            v1.ref = coerceRef(p1, p2, p3)
            v1.return_ = p1
            return v1
        end
        type = p3.type
        if type(type) == "table" and type["$$typeof"] == REACT_LAZY_TYPE then
            type = resolveLazyType(type)
        end
        if type["$$typeof"] ~= REACT_BLOCK_TYPE or type._render ~= p2.type._render then
            v1 = createFiberFromElement(p3, p1.mode, p4)
            v1.ref = coerceRef(p1, p2, p3)
            v1.return_ = p1
            return v1
        end
        local v3 = createWorkInProgress(p2, p3.props)
        v3.index = 1
        v3.sibling = nil
        local v4 = v3
        v4.return_ = p1
        v4.type = type
        if __DEV__ then
            v4._debugSource = p3._source
            v4._debugOwner = p3._owner
        end
        return v4
    end
    local function updatePortal(p1, p2, p3, p4) -- Line: 529 -- upvalues: HostPortal (upval), createFiberFromPortal (upval), createWorkInProgress (upval)
        local v1
        if p2 == nil or p2.tag ~= HostPortal or p2.stateNode.containerInfo ~= p3.containerInfo or p2.stateNode.implementation ~= p3.implementation then
            v1 = createFiberFromPortal(p3, p1.mode, p4)
            v1.return_ = p1
            return v1
        end
        local children = p3.children
        if not children then
            children = {}
        end
        local v2 = createWorkInProgress(p2, children)
        v2.index = 1
        v2.sibling = nil
        v1 = v2
        v1.return_ = p1
        return v1
    end
    local function updateFragment(p1, p2, p3, p4, p5) -- Line: 554 -- upvalues: Fragment (upval), createFiberFromFragment (upval), createWorkInProgress (upval)
        local v1
        if p2 == nil or p2.tag ~= Fragment then
            v1 = createFiberFromFragment(p3, p1.mode, p4, p5)
            v1.return_ = p1
            return v1
        end
        local v2 = createWorkInProgress(p2, p3)
        v2.index = 1
        v2.sibling = nil
        v1 = v2
        v1.return_ = p1
        return v1
    end
    local function assignStableKey(p1, p2) -- Line: 581
        if p2.key ~= nil then
            return
        end
        local v1 = type(p1)
        if v1 == "string" or v1 == "number" then
            p2.key = p1
            return
        end
        if v1 == "table" then
            p2.key = tostring(p1)
        end
    end
    function createChild(p1, p2, p3, p4) -- Line: 600 -- upvalues: REACT_ELEMENT_TYPE (upval), createFiberFromElement (upval), REACT_PORTAL_TYPE (upval), createFiberFromPortal (upval), REACT_LAZY_TYPE (upval), enableLazyElements (upval), createChild (val), createFiberFromFragment (upval), createFiberFromText (upval), __DEV__ (upval), getComponentName (upval), u162 (upval), console (upval)
        local v1, v2
        if p2 == nil then
            return nil
        end
        local v3 = type(p2)
        if v3 ~= "table" then
            if v3 ~= "string" then
                if v3 == "number" then
                    v2 = tostring(p2)
                    v1 = createFiberFromText(v2, p1.mode, p3)
                    v1.return_ = p1
                    return v1
                end
                if __DEV__ and v3 == "function" and __DEV__ then
                    v1 = getComponentName(p1.type) or "Component"
                    if not (u162[v1]) then
                        u162[v1] = true
                        console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                return nil
            end
            v2 = tostring(p2)
            v1 = createFiberFromText(v2, p1.mode, p3)
            v1.return_ = p1
            return v1
        end
        if p2.key == nil then
            v1 = type(p4)
            if v1 == "string" then
                p2.key = p4
            elseif v1 == "number" then
                p2.key = p4
            elseif v1 == "table" then
                p2.key = tostring(p4)
            end
        end
        v1 = p2["$$typeof"]
        if v1 == REACT_ELEMENT_TYPE then
            v2 = createFiberFromElement(p2, p1.mode, p3)
            v2.ref = coerceRef(p1, nil, p2)
            v2.return_ = p1
            return v2
        end
        if v1 == REACT_PORTAL_TYPE then
            v2 = createFiberFromPortal(p2, p1.mode, p3)
            v2.return_ = p1
            return v2
        end
        if v1 ~= REACT_LAZY_TYPE then
            v2 = createFiberFromFragment(p2, p1.mode, p3, nil)
            v2.return_ = p1
            return v2
        end
        if enableLazyElements then
            local v4 = p2._init(p2._payload)
            return createChild(p1, v4, p3)
        end
        v2 = createFiberFromFragment(p2, p1.mode, p3, nil)
        v2.return_ = p1
        return v2
    end
    function updateSlot(p1, p2, p3, p4, p5) -- Line: 671 -- upvalues: REACT_ELEMENT_TYPE (upval), REACT_FRAGMENT_TYPE (upval), Fragment (upval), createFiberFromFragment (upval), createWorkInProgress (upval), updateElement (val), REACT_PORTAL_TYPE (upval), updatePortal (val), REACT_LAZY_TYPE (upval), enableLazyElements (upval), updateSlot (val), HostText (upval), createFiberFromText (upval), __DEV__ (upval), getComponentName (upval), u162 (upval), console (upval)
        local key, v1, v2, v3
        if p3 == nil then
            return nil
        end
        if p2 == nil then
            key = nil
        else
            key = p2.key
        end
        local v4 = type(p3)
        if v4 ~= "table" then
            local v5
            if v4 ~= "string" then
                if v4 ~= "number" then
                    if __DEV__ and v4 == "function" and __DEV__ then
                        v2 = getComponentName(p1.type) or "Component"
                        if not (u162[v2]) then
                            u162[v2] = true
                            console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                        end
                    end
                    return nil
                end
                if key ~= nil then
                    return nil
                end
                v5 = tostring(p3)
                if p2 == nil or p2.tag ~= HostText then
                    v3 = createFiberFromText(v5, p1.mode, p4)
                    v3.return_ = p1
                    return v3
                end
                v1 = createWorkInProgress(p2, v5)
                v1.index = 1
                v1.sibling = nil
                v3 = v1
                v3.return_ = p1
                return v3
            end
            if key ~= nil then
                return nil
            end
            v5 = tostring(p3)
            if p2 ~= nil then
                if p2.tag ~= HostText then
                    v3 = createFiberFromText(v5, p1.mode, p4)
                    v3.return_ = p1
                    return v3
                end
                v1 = createWorkInProgress(p2, v5)
                v1.index = 1
                v1.sibling = nil
                v3 = v1
                v3.return_ = p1
                return v3
            end
            v3 = createFiberFromText(v5, p1.mode, p4)
            v3.return_ = p1
            return v3
        end
        if p3.key == nil then
            v2 = type(p5)
            if v2 == "string" then
                p3.key = p5
            elseif v2 ~= "number" and v2 == "table" then
                p3.key = tostring(p5)
            end
        end
        v2 = p3["$$typeof"]
        if v2 == REACT_ELEMENT_TYPE then
            if p3.key ~= key then
                return nil
            end
            if p3.type ~= REACT_FRAGMENT_TYPE then
                return (updateElement(p1, p2, p3, p4))
            end
            local children = p3.props.children
            if p2 == nil or p2.tag ~= Fragment then
                v1 = createFiberFromFragment(children, p1.mode, p4, key)
                v1.return_ = p1
                return v1
            end
            local v6 = createWorkInProgress(p2, children)
            v6.index = 1
            v6.sibling = nil
            v1 = v6
            v1.return_ = p1
            return v1
        end
        if v2 == REACT_PORTAL_TYPE then
            if p3.key == key then
                return (updatePortal(p1, p2, p3, p4))
            end
            return nil
        end
        if v2 ~= REACT_LAZY_TYPE then
            if key ~= nil then
                return nil
            end
            if p2 ~= nil then
                if p2.tag ~= Fragment then
                    v3 = createFiberFromFragment(p3, p1.mode, p4, nil)
                    v3.return_ = p1
                    return v3
                end
                v1 = createWorkInProgress(p2, p3)
                v1.index = 1
                v1.sibling = nil
                v3 = v1
                v3.return_ = p1
                return v3
            end
            v3 = createFiberFromFragment(p3, p1.mode, p4, nil)
            v3.return_ = p1
            return v3
        end
        if enableLazyElements then
            local v7 = p3._init(p3._payload)
            return updateSlot(p1, p2, v7, p4)
        end
        if key ~= nil then
            return nil
        end
        if p2 == nil or p2.tag ~= Fragment then
            v3 = createFiberFromFragment(p3, p1.mode, p4, nil)
            v3.return_ = p1
            return v3
        end
        v1 = createWorkInProgress(p2, p3)
        v1.index = 1
        v1.sibling = nil
        v3 = v1
        v3.return_ = p1
        return v3
    end
    function updateFromMap(p1, p2, p3, p4, p5, p6) -- Line: 759 -- upvalues: REACT_ELEMENT_TYPE (upval), REACT_FRAGMENT_TYPE (upval), Fragment (upval), createFiberFromFragment (upval), createWorkInProgress (upval), updateElement (val), REACT_PORTAL_TYPE (upval), updatePortal (val), REACT_LAZY_TYPE (upval), enableLazyElements (upval), updateFromMap (val), HostText (upval), createFiberFromText (upval), __DEV__ (upval), getComponentName (upval), u162 (upval), console (upval)
        local key, v1, v2, v3, v4
        if p4 == nil then
            return nil
        end
        local v5 = type(p4)
        if v5 ~= "table" then
            local v6
            if v5 ~= "string" then
                if v5 ~= "number" then
                    if __DEV__ and v5 == "function" and __DEV__ then
                        v3 = getComponentName(p2.type) or "Component"
                        if not (u162[v3]) then
                            u162[v3] = true
                            console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                        end
                    end
                    return nil
                end
                v3 = p1[p3] or nil
                v4 = tostring(p4)
                if v3 == nil or v3.tag ~= HostText then
                    v6 = createFiberFromText(v4, p2.mode, p5)
                    v6.return_ = p2
                    return v6
                end
                v1 = createWorkInProgress(v3, v4)
                v1.index = 1
                v1.sibling = nil
                v6 = v1
                v6.return_ = p2
                return v6
            end
            v3 = p1[p3] or nil
            v4 = tostring(p4)
            if v3 ~= nil then
                if v3.tag ~= HostText then
                    v6 = createFiberFromText(v4, p2.mode, p5)
                    v6.return_ = p2
                    return v6
                end
                v1 = createWorkInProgress(v3, v4)
                v1.index = 1
                v1.sibling = nil
                v6 = v1
                v6.return_ = p2
                return v6
            end
            v6 = createFiberFromText(v4, p2.mode, p5)
            v6.return_ = p2
            return v6
        end
        if p4.key == nil then
            v3 = type(p6)
            if v3 == "string" then
                p4.key = p6
            elseif v3 ~= "number" and v3 == "table" then
                p4.key = tostring(p6)
            end
        end
        local v7 = p4["$$typeof"]
        if v7 == REACT_ELEMENT_TYPE then
            local v8
            if p4.key ~= nil then
                key = p4.key
            else
                key = p3
            end
            v4 = p1[key]
            if p4.type ~= REACT_FRAGMENT_TYPE then
                return (updateElement(p2, v4, p4, p5))
            end
            local children = p4.props.children
            if v4 == nil or v4.tag ~= Fragment then
                v8 = createFiberFromFragment(children, p2.mode, p5, p4.key)
                v8.return_ = p2
                return v8
            end
            local v9 = createWorkInProgress(v4, children)
            v9.index = 1
            v9.sibling = nil
            v8 = v9
            v8.return_ = p2
            return v8
        end
        if v7 == REACT_PORTAL_TYPE then
            local key_2
            if p4.key ~= nil then
                key_2 = p4.key
            else
                key_2 = p3
            end
            return (updatePortal(p2, p1[key_2], p4, p5))
        end
        if v7 ~= REACT_LAZY_TYPE then
            v4 = p1[p3]
            if v4 ~= nil then
                if v4.tag ~= Fragment then
                    v1 = createFiberFromFragment(p4, p2.mode, p5, nil)
                    v1.return_ = p2
                    return v1
                end
                v2 = createWorkInProgress(v4, p4)
                v2.index = 1
                v2.sibling = nil
                v1 = v2
                v1.return_ = p2
                return v1
            end
            v1 = createFiberFromFragment(p4, p2.mode, p5, nil)
            v1.return_ = p2
            return v1
        end
        if enableLazyElements then
            local v10 = p4._init(p4._payload)
            return updateFromMap(p1, p2, p3, v10, p5)
        end
        v4 = p1[p3]
        if v4 == nil or v4.tag ~= Fragment then
            v1 = createFiberFromFragment(p4, p2.mode, p5, nil)
            v1.return_ = p2
            return v1
        end
        v2 = createWorkInProgress(v4, p4)
        v2.index = 1
        v2.sibling = nil
        v1 = v2
        v1.return_ = p2
        return v1
    end
    function warnOnInvalidKey(p1, p2, p3) -- Line: 853 -- upvalues: __DEV__ (upval), REACT_ELEMENT_TYPE (upval), REACT_PORTAL_TYPE (upval), u163 (upval), console (upval), REACT_LAZY_TYPE (upval), enableLazyElements (upval), warnOnInvalidKey (val)
        local key, v1
        if not __DEV__ or p1 == nil or type(p1) ~= "table" then
            return p2
        end
        local v2 = p1["$$typeof"]
        if v2 == REACT_ELEMENT_TYPE then
            u163(p1, p3)
            key = p1.key
            if type(key) ~= "string" then
                return p2
            end
            if p2 == nil then
                v1 = {}
                v1[key] = true
                return v1
            end
            if not (p2[key]) then
                p2[key] = true
                return p2
            end
            console.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.", key)
            return p2
        end
        if v2 ~= REACT_PORTAL_TYPE then
            if v2 == REACT_LAZY_TYPE and enableLazyElements then
                local v3 = p1._init(p1._payload)
                warnOnInvalidKey(v3, p2, p3)
            end
            return p2
        end
        u163(p1, p3)
        key = p1.key
        if type(key) ~= "string" then
            return p2
        end
        if p2 == nil then
            v1 = {}
            v1[key] = true
            return v1
        end
        if not (p2[key]) then
            p2[key] = true
            return p2
        end
        console.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.", key)
        return p2
    end
    local function reconcileChildrenArray(a1, p2, p3, p4) -- Line: 895 -- upvalues: __DEV__ (upval), warnOnInvalidKey (val), updateSlot (val), p1 (val), Deletion (upval), Placement (upval), createChild (val), mapRemainingChildren (val), updateFromMap (val)
        local alternate, alternate_3, deletions, index, index_3, key, sibling, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        if __DEV__ then
            v8 = nil
            v9 = p3
            v10 = nil
            v11 = nil
            for i, j in v9, v10, v11 do
                v8 = warnOnInvalidKey(j, v8, a1)
            end
        end
        v8 = nil
        v9 = nil
        v10 = p2
        v11 = 1
        local v12 = 1
        local v13 = #p3
        v6, v1, v7 = p3, a1, p4
        while v10 ~= nil do
            if v12 > v13 then
                break
            end
            if v12 >= v10.index then
                sibling = v10.sibling
            else
                sibling = v10
                v10 = nil
            end
            v3 = v6[v12]
            if v3 == nil then
                v2 = updateSlot(v1, v10, v3, v7)
            elseif type(v3) == "table" and v3["$$typeof"] ~= nil then
                v2 = updateSlot(v1, v10, v3, v7, v12)
            end
            if v2 == nil then
                if v10 ~= nil then
                    break
                end
                v10 = sibling
                break
            end
            if p1 and v10 and v2.alternate == nil then
                v4 = v10
                if p1 then
                    deletions = v1.deletions
                    if deletions ~= nil then
                        table.insert(deletions, v4)
                    else
                        v1.deletions = {v4}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
            end
            v4 = v2
            v5 = v11
            v4.index = v12
            if p1 then
                alternate = v4.alternate
                if alternate == nil then
                    v4.flags = bit32.bor(v4.flags, Placement)
                    v11 = v5
                else
                    index = alternate.index
                    if index >= v5 then
                        v11 = index
                    else
                        v4.flags = bit32.bor(v4.flags, Placement)
                        v11 = v5
                    end
                end
            else
                v11 = v5
            end
            if v9 ~= nil then
                v9.sibling = v2
            else
                v8 = v2
            end
            v9 = v2
            v10 = sibling
            v12 = v12 + 1
        end
        if v13 < v12 then
            local deletions_2
            if not p1 then
                return v8
            end
            local sibling_2 = v10
            while sibling_2 ~= nil do
                v4 = sibling_2
                if p1 then
                    deletions_2 = v1.deletions
                    if deletions_2 ~= nil then
                        table.insert(deletions_2, v4)
                    else
                        v1.deletions = {v4}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
                sibling_2 = sibling_2.sibling
            end
            return v8
        end
        if v10 == nil then
            local alternate_2, index_2
            while v12 <= v13 do
                v3 = v6[v12]
                if v3 == nil then
                    v2 = createChild(v1, v3, v7)
                elseif type(v3) == "table" and v3["$$typeof"] ~= nil then
                    v2 = createChild(v1, v3, v7, v12)
                end
                if v2 ~= nil then
                    v4 = v2
                    v5 = v11
                    v4.index = v12
                    if p1 then
                        alternate_2 = v4.alternate
                        if alternate_2 == nil then
                            v4.flags = bit32.bor(v4.flags, Placement)
                            v11 = v5
                        else
                            index_2 = alternate_2.index
                            if index_2 >= v5 then
                                v11 = index_2
                            else
                                v4.flags = bit32.bor(v4.flags, Placement)
                                v11 = v5
                            end
                        end
                    else
                        v11 = v5
                    end
                    if v9 ~= nil then
                        v9.sibling = v2
                    else
                        v8 = v2
                    end
                    v9 = v2
                    v12 = v12 + 1
                else
                    v12 = v12 + 1
                end
            end
            return v8
        end
        v2 = mapRemainingChildren(v1, v10)
        while v12 <= v13 do
            v3 = updateFromMap(v2, v1, v12, v6[v12], v7, v12)
            if v3 ~= nil then
                if p1 and v3.alternate ~= nil then
                    if v3.key ~= nil then
                        key = v3.key
                    else
                        key = v12
                    end
                    v2[key] = nil
                end
                v4 = v11
                v3.index = v12
                if p1 then
                    alternate_3 = v3.alternate
                    if alternate_3 == nil then
                        v3.flags = bit32.bor(v3.flags, Placement)
                        v11 = v4
                    else
                        index_3 = alternate_3.index
                        if index_3 >= v4 then
                            v11 = index_3
                        else
                            v3.flags = bit32.bor(v3.flags, Placement)
                            v11 = v4
                        end
                    end
                else
                    v11 = v4
                end
                if v9 ~= nil then
                    v9.sibling = v3
                else
                    v8 = v3
                end
                v9 = v3
            end
            v12 = v12 + 1
        end
        if p1 then
            local deletions_3
            v3 = v2
            v4 = nil
            v5 = nil
            for k, n in v3, v4, v5 do
                if p1 then
                    deletions_3 = v1.deletions
                    if deletions_3 ~= nil then
                        table.insert(deletions_3, n)
                    else
                        v1.deletions = {n}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
            end
        end
        return v8
    end
    local function reconcileChildrenIterator(a1, p2, p3, p4, p5) -- Line: 1102 -- upvalues: __DEV__ (upval), u160 (upval), console (upval), warnOnInvalidKey (val), updateSlot (val), p1 (val), Deletion (upval), Placement (upval), createChild (val), mapRemainingChildren (val), updateFromMap (val)
        local alternate, alternate_3, deletions, index, index_3, sibling, v1, v2, v3, v4, v5, v6, v7, v8
        if __DEV__ then
            if p3.entries == p5 then
                if not u160 then
                    console.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
                end
                u160 = true
            end
            v6 = p5(p3)
            if v6 then
                v7 = nil
                v8 = v6.next()
                while not v8.done do
                    v8 = v6.next()
                    v7 = warnOnInvalidKey(v8.value, v7, a1)
                end
            end
        end
        v6 = p5(p3)
        v7 = nil
        v8 = nil
        local v9 = p2
        local v10 = 1
        local v11 = 1
        local v12 = v6.next()
        v1, v5 = a1, p4
        while v9 ~= nil do
            if v12.done then
                break
            end
            if v11 >= v9.index then
                sibling = v9.sibling
            else
                sibling = v9
                v9 = nil
            end
            v2 = updateSlot(v1, v9, v12.value, v5, v12.key)
            if v2 == nil then
                if v9 ~= nil then
                    break
                end
                v9 = sibling
                break
            end
            if p1 and v9 and v2.alternate == nil then
                v3 = v9
                if p1 then
                    deletions = v1.deletions
                    if deletions ~= nil then
                        table.insert(deletions, v3)
                    else
                        v1.deletions = {v3}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
            end
            v3 = v10
            v2.index = v11
            if p1 then
                alternate = v2.alternate
                if alternate == nil then
                    v2.flags = bit32.bor(v2.flags, Placement)
                    v10 = v3
                else
                    index = alternate.index
                    if index >= v3 then
                        v10 = index
                    else
                        v2.flags = bit32.bor(v2.flags, Placement)
                        v10 = v3
                    end
                end
            else
                v10 = v3
            end
            if v8 ~= nil then
                v8.sibling = v2
            else
                v7 = v2
            end
            v8 = v2
            v9 = sibling
            v11 = v11 + 1
            v12 = v6.next()
        end
        if v12.done then
            local deletions_2
            if not p1 then
                return v7
            end
            local sibling_2 = v9
            while sibling_2 ~= nil do
                v4 = sibling_2
                if p1 then
                    deletions_2 = v1.deletions
                    if deletions_2 ~= nil then
                        table.insert(deletions_2, v4)
                    else
                        v1.deletions = {v4}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
                sibling_2 = sibling_2.sibling
            end
            return v7
        end
        if v9 == nil then
            local alternate_2, index_2
            while not v12.done do
                v2 = createChild(v1, v12.value, v5, v12.key)
                if v2 ~= nil then
                    v3 = v10
                    v2.index = v11
                    if p1 then
                        alternate_2 = v2.alternate
                        if alternate_2 == nil then
                            v2.flags = bit32.bor(v2.flags, Placement)
                            v10 = v3
                        else
                            index_2 = alternate_2.index
                            if index_2 >= v3 then
                                v10 = index_2
                            else
                                v2.flags = bit32.bor(v2.flags, Placement)
                                v10 = v3
                            end
                        end
                    else
                        v10 = v3
                    end
                    if v8 ~= nil then
                        v8.sibling = v2
                    else
                        v7 = v2
                    end
                    v8 = v2
                    v11 = v11 + 1
                    v12 = v6.next()
                else
                    v11 = v11 + 1
                    v12 = v6.next()
                end
            end
            return v7
        end
        v2 = nil
        while not v12.done do
            if not v2 then
                v2 = mapRemainingChildren(v1, v9)
            end
            v3 = updateFromMap(v2, v1, v11, v12.value, v5, v12.key)
            if v3 ~= nil then
                if p1 and v3.alternate ~= nil then
                    if v3.key ~= nil then
                        v2[v3.key] = nil
                    else
                        v2[v11] = nil
                    end
                end
                v4 = v10
                v3.index = v11
                if p1 then
                    alternate_3 = v3.alternate
                    if alternate_3 == nil then
                        v3.flags = bit32.bor(v3.flags, Placement)
                        v10 = v4
                    else
                        index_3 = alternate_3.index
                        if index_3 >= v4 then
                            v10 = index_3
                        else
                            v3.flags = bit32.bor(v3.flags, Placement)
                            v10 = v4
                        end
                    end
                else
                    v10 = v4
                end
                if v8 ~= nil then
                    v8.sibling = v3
                else
                    v7 = v3
                end
                v8 = v3
            end
            v11 = v11 + 1
            v12 = v6.next()
        end
        if p1 then
            local deletions_3
            v3 = v2
            v4 = nil
            local v13 = nil
            for i, j in v3, v4, v13 do
                if p1 then
                    deletions_3 = v1.deletions
                    if deletions_3 ~= nil then
                        table.insert(deletions_3, j)
                    else
                        v1.deletions = {j}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
            end
        end
        return v7
    end
    local function reconcileSingleTextNode(a1, p2, p3, p4) -- Line: 1315 -- upvalues: HostText (upval), p1 (val), Deletion (upval), createWorkInProgress (upval), createFiberFromText (upval)
        local v1, v2, v3, v4
        if p2 == nil then
            local v5
            if p1 then
                local deletions_2
                local sibling_2 = p2
                v1, v2, v5 = a1, p3, p4
                while sibling_2 ~= nil do
                    v4 = sibling_2
                    if p1 then
                        deletions_2 = v1.deletions
                        if deletions_2 ~= nil then
                            table.insert(deletions_2, v4)
                        else
                            v1.deletions = {v4}
                            v1.flags = bit32.bor(v1.flags, Deletion)
                        end
                    end
                    sibling_2 = sibling_2.sibling
                end
            else
                v2, v1, v5 = p3, a1, p4
            end
            v3 = createFiberFromText(v2, v1.mode, v5)
            v3.return_ = v1
            return v3
        elseif p2.tag == HostText then
            local v6
            if p1 then
                local deletions, v7
                local sibling = p2.sibling
                v1, v6, v2 = a1, p2, p3
                while sibling ~= nil do
                    v7 = sibling
                    if p1 then
                        deletions = v1.deletions
                        if deletions ~= nil then
                            table.insert(deletions, v7)
                        else
                            v1.deletions = {v7}
                            v1.flags = bit32.bor(v1.flags, Deletion)
                        end
                    end
                    sibling = sibling.sibling
                end
            else
                v6, v2, v1 = p2, p3, a1
            end
            v4 = createWorkInProgress(v6, v2)
            v4.index = 1
            v4.sibling = nil
            v3 = v4
            v3.return_ = v1
            return v3
        end
    end
    local function reconcileSingleElement(a1, p2, p3, p4) -- Line: 1340 -- upvalues: Fragment (upval), REACT_FRAGMENT_TYPE (upval), p1 (val), Deletion (upval), createWorkInProgress (upval), __DEV__ (upval), createFiberFromFragment (upval), createFiberFromElement (upval)
        local deletions, deletions_2, deletions_3, deletions_4, sibling, sibling_2, sibling_3, v1, v2, v3, v4, v5, v6, v7
        local key = p3.key
        local sibling_4 = p2
        v3, v1, v2, v4 = p3, a1, p2, p4
        while sibling_4 ~= nil do
            if sibling_4.key ~= key then
                v5 = sibling_4
                if p1 then
                    deletions_4 = v1.deletions
                    if deletions_4 ~= nil then
                        table.insert(deletions_4, v5)
                    else
                        v1.deletions = {v5}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
                sibling_4 = sibling_4.sibling
            elseif sibling_4.tag ~= Fragment then
                if sibling_4.elementType ~= v3.type then
                    if not p1 then
                        break
                    end
                    sibling_3 = sibling_4
                    while sibling_3 ~= nil do
                        v6 = sibling_3
                        if p1 then
                            deletions_3 = v1.deletions
                            if deletions_3 ~= nil then
                                table.insert(deletions_3, v6)
                            else
                                v1.deletions = {v6}
                                v1.flags = bit32.bor(v1.flags, Deletion)
                            end
                        end
                        sibling_3 = sibling_3.sibling
                    end
                    break
                end
                if p1 then
                    sibling_2 = sibling_4.sibling
                    while sibling_2 ~= nil do
                        v6 = sibling_2
                        if p1 then
                            deletions_2 = v1.deletions
                            if deletions_2 ~= nil then
                                table.insert(deletions_2, v6)
                            else
                                v1.deletions = {v6}
                                v1.flags = bit32.bor(v1.flags, Deletion)
                            end
                        end
                        sibling_2 = sibling_2.sibling
                    end
                end
                v7 = createWorkInProgress(sibling_4, v3.props)
                v7.index = 1
                v7.sibling = nil
                v5 = v7
                v5.ref = coerceRef(v1, sibling_4, v3)
                v5.return_ = v1
                if __DEV__ then
                    v5._debugSource = v3._source
                    v5._debugOwner = v3._owner
                end
                return v5
            elseif v3.type == REACT_FRAGMENT_TYPE then
                if p1 then
                    sibling = sibling_4.sibling
                    while sibling ~= nil do
                        v6 = sibling
                        if p1 then
                            deletions = v1.deletions
                            if deletions ~= nil then
                                table.insert(deletions, v6)
                            else
                                v1.deletions = {v6}
                                v1.flags = bit32.bor(v1.flags, Deletion)
                            end
                        end
                        sibling = sibling.sibling
                    end
                end
                v7 = createWorkInProgress(sibling_4, v3.props.children)
                v7.index = 1
                v7.sibling = nil
                v5 = v7
                v5.return_ = v1
                if __DEV__ then
                    v5._debugSource = v3._source
                    v5._debugOwner = v3._owner
                end
                return v5
            end
        end
        if v3.type == REACT_FRAGMENT_TYPE then
            v5 = createFiberFromFragment(v3.props.children, v1.mode, v4, v3.key)
            v5.return_ = v1
            return v5
        end
        v5 = createFiberFromElement(v3, v1.mode, v4)
        v5.ref = coerceRef(v1, v2, v3)
        v5.return_ = v1
        return v5
    end
    local function reconcileSinglePortal(a1, p2, p3, p4) -- Line: 1440 -- upvalues: HostPortal (upval), p1 (val), Deletion (upval), createWorkInProgress (upval), createFiberFromPortal (upval)
        local children, deletions, deletions_2, deletions_3, sibling, sibling_2, v1, v2, v3, v4, v5, v6
        local key = p3.key
        local sibling_3 = p2
        v2, v1, v3 = p3, a1, p4
        while sibling_3 ~= nil do
            if sibling_3.key == key then
                if sibling_3.tag == HostPortal and sibling_3.stateNode.containerInfo == v2.containerInfo and sibling_3.stateNode.implementation == v2.implementation then
                    if p1 then
                        sibling = sibling_3.sibling
                        while sibling ~= nil do
                            v5 = sibling
                            if p1 then
                                deletions = v1.deletions
                                if deletions ~= nil then
                                    table.insert(deletions, v5)
                                else
                                    v1.deletions = {v5}
                                    v1.flags = bit32.bor(v1.flags, Deletion)
                                end
                            end
                            sibling = sibling.sibling
                        end
                    end
                    children = v2.children
                    if not children then
                        children = {}
                    end
                    v6 = createWorkInProgress(sibling_3, children)
                    v6.index = 1
                    v6.sibling = nil
                    v4 = v6
                    v4.return_ = v1
                    return v4
                end
                if not p1 then
                    break
                end
                sibling_2 = sibling_3
                while sibling_2 ~= nil do
                    v5 = sibling_2
                    if p1 then
                        deletions_2 = v1.deletions
                        if deletions_2 ~= nil then
                            table.insert(deletions_2, v5)
                        else
                            v1.deletions = {v5}
                            v1.flags = bit32.bor(v1.flags, Deletion)
                        end
                    end
                    sibling_2 = sibling_2.sibling
                end
                break
            end
            v4 = sibling_3
            if p1 then
                deletions_3 = v1.deletions
                if deletions_3 ~= nil then
                    table.insert(deletions_3, v4)
                else
                    v1.deletions = {v4}
                    v1.flags = bit32.bor(v1.flags, Deletion)
                end
            end
            sibling_3 = sibling_3.sibling
        end
        v4 = createFiberFromPortal(v2, v1.mode, v3)
        v4.return_ = v1
        return v4
    end
    function reconcileChildFibers(a1, p2, p3, p4) -- Line: 1479 -- upvalues: REACT_FRAGMENT_TYPE (upval), isArray (upval), REACT_ELEMENT_TYPE (upval), reconcileSingleElement (val), p1 (val), Placement (upval), REACT_PORTAL_TYPE (upval), reconcileSinglePortal (val), REACT_LAZY_TYPE (upval), enableLazyElements (upval), reconcileChildFibers (val), reconcileChildrenArray (val), reconcileSingleTextNode (val), getIteratorFn (upval), reconcileChildrenIterator (val), __DEV__ (upval), getComponentName (upval), u162 (upval), console (upval), Deletion (upval)
        local children, v1, v2, v3, v4
        local v5 = type(p3)
        local v6 = if p3 ~= nil then if v5 == "table" then if p3.type == REACT_FRAGMENT_TYPE then p3.key == nil else false else false else false
        if not v6 then
            children = p3
        else
            v5 = type(p3.props.children)
        end
        local v7 = isArray(children)
        local v8 = if children ~= nil then if v5 == "table" then not v7 else false else false
        if not v8 then
            local deletions, v9, v10
            if v7 then
                return (reconcileChildrenArray(a1, p2, children, p4))
            end
            if v5 == "string" or v5 == "number" then
                local v11 = tostring(children)
                v10 = reconcileSingleTextNode(a1, p2, v11, p4)
                if p1 and v10.alternate == nil then
                    v10.flags = bit32.bor(v10.flags, Placement)
                end
                return v10
            end
            v1, v2, v3 = a1, p2, p4
            v4 = getIteratorFn(children)
            if v4 then
                return (reconcileChildrenIterator(v1, v2, children, v3, v4))
            end
            if __DEV__ and v5 == "function" and __DEV__ then
                v10 = getComponentName(v1.type) or "Component"
                if not (u162[v10]) then
                    u162[v10] = true
                    console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                end
            end
            if children ~= nil then end
            if not p1 then
                return nil
            end
            local sibling = v2
            while sibling ~= nil do
                v9 = sibling
                if p1 then
                    deletions = v1.deletions
                    if deletions ~= nil then
                        table.insert(deletions, v9)
                    else
                        v1.deletions = {v9}
                        v1.flags = bit32.bor(v1.flags, Deletion)
                    end
                end
                sibling = sibling.sibling
            end
            return nil
        else
            local v12
            v4 = children["$$typeof"]
            if v4 == REACT_ELEMENT_TYPE then
                v12 = reconcileSingleElement(a1, p2, children, p4)
                if p1 and v12.alternate == nil then
                    v12.flags = bit32.bor(v12.flags, Placement)
                end
                return v12
            end
            if v4 == REACT_PORTAL_TYPE then
                v12 = reconcileSinglePortal(a1, p2, children, p4)
                if p1 and v12.alternate == nil then
                    v12.flags = bit32.bor(v12.flags, Placement)
                end
                return v12
            end
            if v4 ~= REACT_LAZY_TYPE then
                v1, v2, v3 = a1, p2, p4
            else
                if enableLazyElements then
                    local v13 = children._init(children._payload)
                    return reconcileChildFibers(a1, p2, v13, p4)
                end
                v1, v2, v3 = a1, p2, p4
            end
        end
    end
    return reconcileChildFibers
end
v3.reconcileChildFibers = ChildReconciler(true)
v3.mountChildFibers = ChildReconciler(false)
function v3.cloneChildFibers(p1, p2) -- Line: 1627 -- upvalues: createWorkInProgress (val)
    local child
    if p2.child == nil then
        return
    end
    child = p2.child
    local sibling = createWorkInProgress(child, child.pendingProps)
    p2.child = sibling
    sibling.return_ = p2
    while child.sibling ~= nil do
        child = child.sibling
        sibling.sibling = createWorkInProgress(child, child.pendingProps)
        sibling = sibling.sibling
        sibling.return_ = p2
    end
    sibling.sibling = nil
end
function v3.resetChildFibers(p1, p2) -- Line: 1654 -- upvalues: resetWorkInProgress (val)
    local child = p1.child
    while child ~= nil do
        resetWorkInProgress(child, p2)
        child = child.sibling
    end
end
return v3