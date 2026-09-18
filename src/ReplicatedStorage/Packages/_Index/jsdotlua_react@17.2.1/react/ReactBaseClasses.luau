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
-- File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactBaseClasses
--                               Dumped in 0.00139 seconds
--                          Bytecode version 9  |  14 functions

local u73
local __DEV__ = _G.__DEV__
local __COMPAT_WARNINGS__ = _G.__COMPAT_WARNINGS__
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
local ReactNoopUpdateQueue = require(script.Parent:WaitForChild("ReactNoopUpdateQueue"))
local u41 = {}
if __DEV__ then
    Object.freeze(u41)
end
local UninitializedState = require(script.Parent.Parent:WaitForChild("shared")).UninitializedState
local function trimPath(p1) -- Line: 48
    local v1 = string.match(p1, "%.%u[%.%w]-$")
    if v1 then
        return string.gsub(v1, "^%.", "")
    end
    return p1
end
local function warnAboutExistingLifecycle(p1, p2, p3) -- Line: 62 -- upvalues: console (val)
    console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", p1, p3, p2, p1)
end
local function warnAboutDeprecatedLifecycleName(p1, p2, p3) -- Line: 72 -- upvalues: __DEV__ (val), __COMPAT_WARNINGS__ (val), console (val)
    if __DEV__ and __COMPAT_WARNINGS__ then
        local v1, v2, v3
        v2, v3 = debug.info(3, "sln")
        local v4 = string.match(v2, "%.%u[%.%w]-$")
        if not v4 then
            v1 = v2
        else
            v1 = string.gsub(v4, "^%.", "")
        end
        console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", p1, p2, p3, v1, (tostring(v3)))
    end
end
local u62 = {
    didMount = "componentDidMount",
    shouldUpdate = "shouldComponentUpdate",
    willUpdate = "UNSAFE_componentWillUpdate",
    didUpdate = "componentDidUpdate",
    willUnmount = "componentWillUnmount",
}
local function handleNewLifecycle(p1, p2, p3) -- Line: 94 -- upvalues: u62 (val), console (val), __DEV__ (val), __COMPAT_WARNINGS__ (val)
    local v1
    if u62[p2] == nil then
        v1 = p2
    else
        if p1[u62[p2]] ~= nil then
            local __componentName = p1.__componentName
            console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", __componentName, u62[p2], p2, __componentName)
        elseif p2 ~= "willUpdate" then
            local v2 = u62[p2]
            if __DEV__ and __COMPAT_WARNINGS__ then
                local v3, v4, v5
                v4, v5 = debug.info(3, "sln")
                local v6 = string.match(v4, "%.%u[%.%w]-$")
                if not v6 then
                    v3 = v4
                else
                    v3 = string.gsub(v6, "^%.", "")
                end
                console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", p1.__componentName, p2, v2, v3, (tostring(v5)))
            end
        elseif p1.componentWillUpdate then
            local __componentName_2 = p1.__componentName
            console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", __componentName_2, "UNSAFE_componentWillUpdate", p2, __componentName_2)
        end
        v1 = u62[p2]
    end
    rawset(p1, v1, p3)
end
local u69 = setmetatable({__componentName = "Component"}, {
    __newindex = handleNewLifecycle,
    __index = {isReactComponent = true},
    __tostring = function(p1) -- Line: 124
        return p1.__componentName
    end,
})
if _G.__TESTEZ_RUNNING_TEST__ then
    u73 = 0
else
    u73 = 900
end
local u74 = 1
local u78 = table.create(u73)
local v1 = u73
local v2 = 1
for i = 1, v1, v2 do
    table.insert(u78, {state = UninitializedState, __refs = u41, __updater = ReactNoopUpdateQueue})
end
local function setStateInInit(p1, p2, p3) -- Line: 160 -- upvalues: __DEV__ (val), console (val), Object (val)
    local v1
    if __DEV__ and p3 ~= nil then
        console.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", p1.__componentName)
    end
    local v2 = p2
    if v2 then
        v2 = type(p2)
    end
    if p2 == nil then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    elseif v2 ~= "table" and v2 ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    end
    local state = p1.state
    if v2 ~= "function" then
        v1 = p2
    else
        v1 = p2(state, p1.props)
    end
    p1.state = Object.assign({}, state, v1)
end
function u69:extend(p2) -- Line: 200 -- upvalues: __COMPAT_WARNINGS__ (val), console (val), u74 (ref), u73 (val), u78 (val), UninitializedState (val), u41 (val), ReactNoopUpdateQueue (val), setStateInInit (val)
    local v1
    if p2 == nil then
        if __COMPAT_WARNINGS__ then
            console.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
        end
        v1 = ""
    elseif type(p2) == "string" then
        v1 = p2
    else
        error("Component class name must be a string")
        v1 = p2
    end
    local u14 = {__componentName = v1, setState = self.setState, forceUpdate = self.forceUpdate}
    u14.__index = u14
    function u14.__ctor(p1, p2, p3) -- Line: 234 -- upvalues: u74 (upval), u73 (upval), u78 (upval), UninitializedState (upval), u41 (upval), ReactNoopUpdateQueue (upval), u14 (val), setStateInInit (upval)
        local v1
        if u74 > u73 then
            local v2 = {props = p1, context = p2, state = UninitializedState, __refs = u41}
            local v3 = p3
            if not v3 then
                v3 = ReactNoopUpdateQueue
            end
            v2.__updater = v3
            v1 = v2
        else
            v1 = u78[u74]
            v1.props = p1
            v1.context = p2
            u78[u74] = nil
            u74 = u74 + 1
        end
        v1 = setmetatable(v1, u14)
        if u14.init and type(u14.init) == "function" then
            v1.setState = setStateInInit
            u14.init(v1, p1, p2)
            v1.setState = nil
        end
        return v1
    end
    setmetatable(u14, (getmetatable(self)))
    return u14
end
function u69.setState(p1, p2, p3) -- Line: 326
    if p2 ~= nil and type(p2) ~= "table" and type(p2) ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    end
    p1.__updater.enqueueSetState(p1, p2, p3, "setState")
end
function u69.forceUpdate(p1, p2) -- Line: 355
    p1.__updater.enqueueForceUpdate(p1, p2, "forceUpdate")
end
if __DEV__ then
    v2 = {
        isMounted = {"isMounted", "Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks."},
        replaceState = {"replaceState", "Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)."},
    }
    local function v3(p1, p2) -- Line: 379 -- upvalues: u69 (val), console (val)
        u69[p1] = function() -- Line: 380 -- upvalues: console (upval), p2 (val)
            console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", p2[1], p2[2])
            return nil
        end
    end
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for j, k in v4, v5, v6 do
        if v2[j] ~= nil then
            local u150 = v2[j]
            u69[j] = function() -- Line: 380 -- upvalues: console (val), u150 (val)
                console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", u150[1], u150[2])
                return nil
            end
        end
    end
end
v2 = u69:extend("PureComponent")
v2.extend = u69.extend
setmetatable(v2, {
    __newindex = handleNewLifecycle,
    __index = {isReactComponent = true, isPureReactComponent = true},
    __tostring = function(p1) -- Line: 427
        return p1.__componentName
    end,
})
return {Component = u69, PureComponent = v2}