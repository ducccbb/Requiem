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
--   File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactElement
--                               Dumped in 0.00181 seconds
--                          Bytecode version 9  |  18 functions

local __DEV__ = _G.__DEV__
local Error = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactLazy"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local REACT_ELEMENT_TYPE = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_ELEMENT_TYPE
local ReactCurrentOwner = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local u71 = {key = true, ref = true, __self = true, __source = true}
local u72 = nil
local u73 = nil
local u75 = if __DEV__ then {} else nil
local v1 = {}
local function hasValidRef(p1) -- Line: 59 -- upvalues: __DEV__ (val)
    local v1
    if not __DEV__ or p1.ref == nil or type(p1.ref) ~= "table" then
        v1 = p1.ref ~= nil
        return v1
    end
    if p1.ref.isReactWarning then
        return false
    end
    v1 = p1.ref ~= nil
    return v1
end
local function hasValidKey(p1) -- Line: 73 -- upvalues: __DEV__ (val)
    local v1
    if not __DEV__ or p1.key == nil or type(p1.key) ~= "table" then
        v1 = p1.key ~= nil
        return v1
    end
    if p1.key.isReactWarning then
        return false
    end
    v1 = p1.key ~= nil
    return v1
end
local u80 = {isReactWarning = true}
local function defineKeyPropWarningGetter(p1, p2) -- Line: 92 -- upvalues: __DEV__ (val), u72 (ref), console (val), u80 (val)
    local function v1() -- Line: 93 -- upvalues: __DEV__ (upval), u72 (upval), console (upval), p2 (val)
        if __DEV__ and not u72 then
            u72 = true
            console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
        end
    end
    p1.key = nil
    setmetatable(p1, {
        __index = function(p1, a2) -- Line: 112 -- upvalues: __DEV__ (upval), u72 (upval), console (upval), p2 (val), u80 (upval)
            if a2 ~= "key" then
                return nil
            end
            if __DEV__ and not u72 then
                u72 = true
                console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
            end
            return u80
        end,
    })
end
local function defineRefPropWarningGetter(p1, p2) -- Line: 124 -- upvalues: __DEV__ (val), u73 (ref), console (val), u80 (val)
    local function v1() -- Line: 127 -- upvalues: __DEV__ (upval), u73 (upval), console (upval), p2 (val)
        if __DEV__ and not u73 then
            u73 = true
            console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
        end
    end
    p1.ref = nil
    setmetatable(p1, {
        __index = function(p1, a2) -- Line: 146 -- upvalues: __DEV__ (upval), u73 (upval), console (upval), p2 (val), u80 (upval)
            if a2 ~= "ref" then
                return nil
            end
            if __DEV__ and not u73 then
                u73 = true
                console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
            end
            return u80
        end,
    })
end
local function warnIfStringRefCannotBeAutoConverted(p1) -- Line: 158 -- upvalues: __DEV__ (val), ReactCurrentOwner (val), getComponentName (val), u75 (ref)
    if __DEV__ and type(p1.ref) == "string" and ReactCurrentOwner.current then
        local v1 = getComponentName(ReactCurrentOwner.current.type)
        if not (u75[v1]) then
            error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v1 or "Unknown", p1.ref))
        end
    end
end
local function ReactElement(p1, p2, p3, p4, p5, p6, p7) -- Line: 209 -- upvalues: REACT_ELEMENT_TYPE (val), __DEV__ (val)
    local v1 = {
        type = p1,
        key = p2,
        ref = p3,
        props = p7,
        _owner = p6,
    }
    v1["$$typeof"] = REACT_ELEMENT_TYPE
    if __DEV__ then
        local u10 = {validated = false}
        v1._store = setmetatable({}, {
            __index = u10,
            __newindex = function(p1, p2, p3) -- Line: 246 -- upvalues: u10 (val)
                if p2 == "validated" then
                    u10.validated = p3
                    return
                end
                rawset(p1, p2, p3)
            end,
        })
        setmetatable(v1, {
            __index = {_self = p4, _source = p5},
        })
    end
    return v1
end
function v1.jsx(p1, p2, p3) -- Line: 277
    error("JSX is currently unsupported")
end
function v1.jsxDEV(p1, p2, p3, p4, p5) -- Line: 332
    error("JSX is currently unsupported")
    return nil
end
function v1.createElement(p1, p2, ...) -- Line: 408 -- upvalues: __DEV__ (val), warnIfStringRefCannotBeAutoConverted (val), defineKeyPropWarningGetter (val), defineRefPropWarningGetter (val), ReactElement (val), ReactCurrentOwner (val)
    local defaultProps, v1, v2, v3, v4, v5
    if p2 == nil then
        v1 = {}
    else
        v1 = table.clone(p2)
    end
    local v6 = nil
    local ref = nil
    local __source = nil
    if p2 ~= nil then
        local key
        if not __DEV__ then
            v2 = p2.ref ~= nil
        elseif p2.ref ~= nil and type(p2.ref) == "table" and p2.ref.isReactWarning then
            v2 = false
        end
        if v2 then
            ref = p2.ref
            if __DEV__ then
                warnIfStringRefCannotBeAutoConverted(p2)
            end
        end
        if not __DEV__ then
            v2 = p2.key ~= nil
        elseif p2.key ~= nil and type(p2.key) == "table" and p2.key.isReactWarning then
            v2 = false
        end
        if v2 then
            key = p2.key
            if type(key) ~= "number" then
                v6 = tostring(key)
            else
                v6 = key
            end
        end
        if p2.__source ~= nil then
            __source = p2.__source
        else
            __source = nil
        end
        if v1.key ~= nil then
            v1.key = nil
        end
        if v1.ref ~= nil then
            v1.ref = nil
        end
        if v1.__self ~= nil then
            v1.__self = nil
        end
        if v1.__source ~= nil then
            v1.__source = nil
        end
    end
    v2 = select("#", ...)
    if v2 == 1 then
        v1.children = select(1, ...)
    elseif 1 < v2 then
        local v7
        v3 = table.create(v2)
        v4 = v2
        v5 = 1
        for i = 1, v4, v5 do
            v7 = select(i, ...)
            table.insert(v3, v7)
        end
        if __DEV__ then
            table.freeze(v3)
        end
        v1.children = v3
    end
    if type(p1) == "table" and p1.defaultProps then
        defaultProps = p1.defaultProps
        v4 = defaultProps
        v5 = nil
        local v8 = nil
        for j, k in v4, v5, v8 do
            if v1[j] == nil then
                v1[j] = defaultProps[j]
            end
        end
    end
    if __DEV__ then
        if v6 then
            if type(p1) == "function" then
                v3 = debug.info(p1, "n") or "<function>"
            elseif type(p1) ~= "table" then
                v3 = p1
            else
                local displayName = p1.displayName
                if not displayName then
                    displayName = p1.name
                    if not displayName then
                        displayName = "Unknown"
                    end
                end
                v3 = displayName
            end
            if v6 then
                defineKeyPropWarningGetter(v1, v3)
            end
            if ref then
                defineRefPropWarningGetter(v1, v3)
            end
        elseif not ref then
        end
        if __source == nil then
            __source = {fileName = debug.info(3, "s"), lineNumber = debug.info(3, "l")}
        end
    end
    return (ReactElement(p1, v6, ref, nil, __source, ReactCurrentOwner.current, v1))
end
function v1.cloneAndReplaceKey(p1, p2) -- Line: 587 -- upvalues: ReactElement (val)
    return (ReactElement(p1.type, p2, p1.ref, p1._self, p1._source, p1._owner, p1.props))
end
function v1.cloneElement(p1, p2, ...) -- Line: 605 -- upvalues: Error (val), ReactCurrentOwner (val), __DEV__ (val), u71 (val), ReactElement (val)
    local defaultProps, type, v1, v2, v3
    if p1 == nil then
        error(Error.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(p1)))
    end
    local props = p1.props
    if props == nil then
        v3 = {}
    else
        v3 = table.clone(props)
    end
    local key = p1.key
    local ref = p1.ref
    local _source = p1._source
    local _owner = p1._owner
    if p2 ~= nil then
        local ref_2 = p2.ref
        if ref_2 ~= nil then
            ref = ref_2
            _owner = ReactCurrentOwner.current
        elseif not __DEV__ then
            if p2.ref ~= nil then end
        elseif p2.ref ~= nil and type(p2.ref) == "table" and not p2.ref.isReactWarning then
        end
        local key_2 = p2.key
        if key_2 == nil then
            if not __DEV__ then
                if p2.key ~= nil then end
            elseif p2.key ~= nil and type(p2.key) == "table" and not p2.key.isReactWarning then
            end
        elseif type(key_2) ~= "number" then
            key = key_2 or "nil"
        else
            key = key_2
        end
    end
    type = p1.type
    if type(type) ~= "table" then
        defaultProps = nil
    else
        defaultProps = type.defaultProps
    end
    if p2 ~= nil then
        local v4
        v2 = p2
        local v5 = nil
        local v6 = nil
        v4, v1 = p2, p1
        for i, j in v2, v5, v6 do
            if v4[i] ~= nil and not (u71[i]) then
                if v4[i] ~= nil then
                    v3[i] = v4[i]
                elseif defaultProps ~= nil then
                    v3[i] = defaultProps[i]
                end
            end
        end
    end
    v2 = select("#", ...)
    if v2 == 1 then
        v3.children = select(1, ...)
    elseif 1 < v2 then
        v3.children = {...}
    end
    return (ReactElement(v1.type, key, ref, nil, _source, _owner, v3))
end
function v1.isValidElement(p1) -- Line: 721 -- upvalues: REACT_ELEMENT_TYPE (val)
    local v1 = if type(p1) == "table" then p1["$$typeof"] == REACT_ELEMENT_TYPE else false
    return v1
end
return v1