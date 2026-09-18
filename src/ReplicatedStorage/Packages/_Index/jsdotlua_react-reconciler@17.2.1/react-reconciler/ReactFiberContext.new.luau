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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberContext.new
--                               Dumped in 0.00150 seconds
--                          Bytecode version 9  |  13 functions

local __DEV__ = _G.__DEV__
local __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local Error = v1.Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local isFiberMounted = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).isFiberMounted
local disableLegacyContext = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.disableLegacyContext
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local checkPropTypes = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local createCursor = v2.createCursor
local push = v2.push
local pop = v2.pop
local u95 = if __DEV__ then {} else nil
local u96 = {}
if __DEV__ then
    Object.freeze(u96)
end
local u107 = createCursor(u96)
local u110 = createCursor(false)
local u111 = u96
local isContextProvider = nil
function isContextProvider(p1) -- Line: 160
    if type(p1) == "function" then
        return false
    end
    local v1 = p1.childContextTypes ~= nil
    return v1
end
local function processChildContext(p1, p2, p3) -- Line: 218 -- upvalues: __DEV__ (val), getComponentName (val), u95 (ref), console (val), Error (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), Object (val)
    local v1, v2
    local stateNode = p1.stateNode
    local childContextTypes = p2.childContextTypes
    if stateNode.getChildContext == nil or type(stateNode.getChildContext) ~= "function" then
        if __DEV__ then
            v2 = getComponentName(p2) or "Unknown"
            if not (u95[v2]) then
                u95[v2] = true
                console.error("%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.", v2, v2)
            end
        end
        return p3
    end
    v2 = stateNode:getChildContext()
    local v3 = v2
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if childContextTypes[i] == nil then
            v1 = getComponentName(p2) or "Unknown"
            error(Error.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", v1, i)))
        end
    end
    if __DEV__ then
        v3 = getComponentName(p2) or "Unknown"
        checkPropTypes(childContextTypes, nil, v2, "child context", v3)
    elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        v3 = getComponentName(p2) or "Unknown"
        checkPropTypes(childContextTypes, nil, v2, "child context", v3)
    end
    return Object.assign({}, p3, v2)
end
return {
    emptyContextObject = u96,
    getUnmaskedContext = function(p1, p2, p3) -- Line: 67 -- upvalues: isContextProvider (ref), u111 (ref), u107 (val)
        if not p3 then
            return u107.current
        end
        if isContextProvider(p2) then
            return u111
        end
        return u107.current
    end,
    cacheContext = function(p1, p2, p3) -- Line: 87
        local stateNode = p1.stateNode
        stateNode.__reactInternalMemoizedUnmaskedChildContext = p2
        stateNode.__reactInternalMemoizedMaskedChildContext = p3
    end,
    getMaskedContext = function(p1, p2) -- Line: 102 -- upvalues: u96 (val), __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), getComponentName (val), checkPropTypes (val)
        local type = p1.type
        if type(type) == "function" then
            return p2
        end
        local contextTypes = type.contextTypes
        if not contextTypes then
            return u96
        end
        local stateNode = p1.stateNode
        if not stateNode then
            local v1 = {}
            local v2 = contextTypes
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1[i] = p2[i]
            end
            if __DEV__ then
                v2 = getComponentName(type) or "Unknown"
                checkPropTypes(contextTypes, nil, v1, "context", v2)
            elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
                v2 = getComponentName(type) or "Unknown"
                checkPropTypes(contextTypes, nil, v1, "context", v2)
            end
            if stateNode then
                local stateNode_2 = p1.stateNode
                stateNode_2.__reactInternalMemoizedUnmaskedChildContext = p2
                stateNode_2.__reactInternalMemoizedMaskedChildContext = v1
            end
            return v1
        elseif stateNode.__reactInternalMemoizedUnmaskedChildContext == p2 then
            return stateNode.__reactInternalMemoizedMaskedChildContext
        end
    end,
    hasContextChanged = function() -- Line: 151 -- upvalues: disableLegacyContext (val), u110 (val)
        if disableLegacyContext then
            return false
        end
        return u110.current
    end,
    popContext = function(p1) -- Line: 175 -- upvalues: pop (val), u110 (val), u107 (val)
        pop(u110, p1)
        pop(u107, p1)
    end,
    popTopLevelContextObject = function(p1) -- Line: 185 -- upvalues: pop (val), u110 (val), u107 (val)
        pop(u110, p1)
        pop(u107, p1)
    end,
    pushTopLevelContextObject = function(p1, p2, p3) -- Line: 195 -- upvalues: u107 (val), u96 (val), Error (val), push (val), u110 (val)
        if u107.current ~= u96 then
            error(Error.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."))
        end
        push(u107, p2, p1)
        push(u110, p3, p1)
    end,
    processChildContext = processChildContext,
    isContextProvider = isContextProvider,
    pushContextProvider = function(p1) -- Line: 278 -- upvalues: u96 (val), u111 (ref), u107 (val), push (val), u110 (val)
        local __reactInternalMemoizedMergedChildContext
        local stateNode = p1.stateNode
        if not stateNode then
            __reactInternalMemoizedMergedChildContext = u96
        else
            __reactInternalMemoizedMergedChildContext = stateNode.__reactInternalMemoizedMergedChildContext
            if not __reactInternalMemoizedMergedChildContext then
                __reactInternalMemoizedMergedChildContext = u96
            end
        end
        u111 = u107.current
        push(u107, __reactInternalMemoizedMergedChildContext, p1)
        push(u110, u110.current, p1)
        return true
    end,
    invalidateContextProvider = function(p1, p2, p3) -- Line: 301 -- upvalues: Error (val), processChildContext (val), u111 (ref), pop (val), u110 (val), u107 (val), push (val)
        local stateNode = p1.stateNode
        if not stateNode then
            error(Error.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."))
        end
        if not p3 then
            pop(u110, p1)
            push(u110, p3, p1)
            return
        end
        local v1 = processChildContext(p1, p2, u111)
        stateNode.__reactInternalMemoizedMergedChildContext = v1
        pop(u110, p1)
        pop(u107, p1)
        push(u107, v1, p1)
        push(u110, p3, p1)
    end,
    findCurrentUnmaskedContext = function(p1) -- Line: 342 -- upvalues: ClassComponent (val), isFiberMounted (val), Error (val), HostRoot (val)
        if p1.tag ~= ClassComponent then
            error(Error.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."))
        elseif isFiberMounted(p1) then
        end
        local return_ = p1
        while return_.tag ~= HostRoot do
            if return_.tag == ClassComponent and return_.type.childContextTypes ~= nil then
                return return_.stateNode.__reactInternalMemoizedMergedChildContext
            end
            return_ = return_.return_
            if return_ == nil then
                error(Error.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."))
                return
            end
        end
        return return_.stateNode.context
    end,
}