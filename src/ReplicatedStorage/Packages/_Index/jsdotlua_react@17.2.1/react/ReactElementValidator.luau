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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactElementValidator
--                               Dumped in 0.00322 seconds
--                          Bytecode version 9  |  16 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local inspect = v1.util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
local isValidElementType = require(script.Parent.Parent:WaitForChild("shared")).isValidElementType
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local getIteratorFn = ReactSymbols.getIteratorFn
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local warnAboutSpreadingKeyToJSX = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local checkPropTypes = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local ReactCurrentOwner = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local ReactElement = require(script.Parent:WaitForChild("ReactElement"))
local isValidElement = ReactElement.isValidElement
local createElement = ReactElement.createElement
local cloneElement = ReactElement.cloneElement
local jsxDEV = ReactElement.jsxDEV
local setExtraStackFrame = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local describeUnknownElementTypeFrameInDEV = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV
local v2 = {}
local function setCurrentlyValidatingElement(p1) -- Line: 63 -- upvalues: describeUnknownElementTypeFrameInDEV (val), setExtraStackFrame (val)
    local type
    if not _G.__DEV__ then
        return
    end
    if not p1 then
        setExtraStackFrame(nil)
        return
    end
    local _owner = p1._owner
    type = if _owner then _owner.type else nil
    local v1 = describeUnknownElementTypeFrameInDEV(p1.type, p1._source, type)
    setExtraStackFrame(v1)
end
local u140 = if _G.__DEV__ then false else nil
local function hasOwnProperty(p1, p2) -- Line: 91
    local v1 = p1[p2] ~= nil
    return v1
end
local function getDeclarationErrorAddendum() -- Line: 95 -- upvalues: ReactCurrentOwner (val), getComponentName (val)
    if not ReactCurrentOwner.current then
        return ""
    end
    local v1 = getComponentName(ReactCurrentOwner.current.type)
    if v1 then
        return "\n\nCheck the render method of `" .. v1 .. "`."
    end
    return ""
end
local function getSourceInfoErrorAddendum(p1) -- Line: 106
    if p1 == nil then
        return ""
    end
    local v1 = string.gsub(p1.fileName, "^.*[\\/]", "")
    return "\n\nCheck your code at " .. v1 .. ":" .. p1.lineNumber .. "."
end
local function getSourceInfoErrorAddendumForProps(p1) -- Line: 116
    if p1 == nil then
        return ""
    end
    local __source = p1.__source
    if __source == nil then
        return ""
    end
    local v1 = string.gsub(__source.fileName, "^.*[\\/]", "")
    return "\n\nCheck your code at " .. v1 .. ":" .. __source.lineNumber .. "."
end
local u147 = {}
local function getCurrentComponentErrorInfo(p1) -- Line: 133 -- upvalues: ReactCurrentOwner (val), getComponentName (val), Boolean (val)
    local v1
    if not ReactCurrentOwner.current then
        v1 = ""
    else
        local v2 = getComponentName(ReactCurrentOwner.current.type)
        if v2 then
            v1 = "\n\nCheck the render method of `" .. v2 .. "`."
        end
    end
    if not (Boolean.toJSBoolean(v1)) then
        local displayName
        if typeof(p1) == "string" then
            displayName = p1
        elseif typeof(p1) ~= "table" then
            displayName = nil
        else
            displayName = p1.displayName
            if not displayName then
                displayName = p1.name
            end
        end
        if not displayName and typeof(p1) == "function" then
            local v3 = debug.info(p1, "n")
            if v3 == "" then
                displayName = nil
            else
                displayName = v3
            end
        end
        if displayName then
            v1 = string.format("\n\nCheck the top-level render call using <%s>.", displayName)
        end
    end
    return v1
end
local function validateExplicitKey(p1, p2, p3) -- Line: 175 -- upvalues: getCurrentComponentErrorInfo (val), u147 (val), ReactCurrentOwner (val), getComponentName (val), describeUnknownElementTypeFrameInDEV (val), setExtraStackFrame (val), console (val)
    local _owner, type
    if p1._store == nil or p1._store.validated then
        return
    end
    p1._store.validated = true
    local v1 = p1.key ~= nil
    local v2 = p3 ~= nil
    if v1 ~= v2 then
        return
    end
    v1 = getCurrentComponentErrorInfo(p2)
    if u147[v1] then
        return
    end
    u147[v1] = true
    v2 = if p1 and p1._owner and p1._owner ~= ReactCurrentOwner.current then string.format(" It was passed a child from %s.", (tostring(getComponentName(p1._owner.type)))) else ""
    if _G.__DEV__ then
        local v3
        if _G.__DEV__ then
            if not p1 then
                setExtraStackFrame(nil)
            else
                _owner = p1._owner
                type = if _owner then _owner.type else nil
                v3 = describeUnknownElementTypeFrameInDEV(p1.type, p1._source, type)
                setExtraStackFrame(v3)
            end
        end
        if p1.key == nil then
            console.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", v1, v2)
        elseif p3 == nil then
            console.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", v1, v2)
        else
            v3 = tostring(p1.key)
            local v4 = tostring(p3)
            console.error("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", v3, v4, v1, v2)
        end
        if _G.__DEV__ then
            setExtraStackFrame(nil)
        end
    end
end
local function validateChildKeys(p1, p2) -- Line: 250 -- upvalues: Array (val), isValidElement (val), validateExplicitKey (val), getIteratorFn (val)
    local v1, v2, v3
    if typeof(p1) ~= "table" then
        return
    end
    if Array.isArray(p1) then
        local v4, v5
        v2 = #p1
        v3 = 1
        v4, v1 = p1, p2
        for i = 1, v2, v3 do
            v5 = v4[i]
            if isValidElement(v5) then
                validateExplicitKey(v5, v1)
            end
        end
        return
    end
    if isValidElement(p1) then
        if not p1._store then
            return
        end
        p1._store.validated = true
        return
    end
    if p1 then
        v2 = getIteratorFn(p1)
        if typeof(v2) == "function" and v2 ~= p1.entries then
            v3 = v2(p1)
            local v6 = v3.next()
            v1 = p2
            while not v6.done do
                if isValidElement(v6.value) then
                    validateExplicitKey(v6.value, v1, v6.key)
                end
                v6 = v3.next()
            end
        end
    end
end
local function validatePropTypes(p1) -- Line: 293 -- upvalues: getComponentName (val), checkPropTypes (val), u140 (ref), console (val)
    if _G.__DEV__ then
        local v1
        local type = p1.type
        if type == nil or typeof(type) == "string" or typeof(type) == "function" or typeof(type) ~= "table" then
            return
        end
        local propTypes = type.propTypes
        local validateProps = type.validateProps
        if propTypes then
            v1 = getComponentName(type)
            checkPropTypes(propTypes, validateProps, p1.props, "prop", v1, p1)
        elseif validateProps then
            v1 = getComponentName(type)
            checkPropTypes(propTypes, validateProps, p1.props, "prop", v1, p1)
        elseif type.PropTypes ~= nil and not u140 then
            u140 = true
            v1 = getComponentName(type)
            console.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", v1 or "Unknown")
        end
        if type.getDefaultProps ~= nil then
            console.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
        end
        return
    elseif not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        return
    end
end
local function validateFragmentProps(p1) -- Line: 343 -- upvalues: Object (val), describeUnknownElementTypeFrameInDEV (val), setExtraStackFrame (val), console (val)
    if _G.__DEV__ then
        local _owner, type, v1, v2
        local v3 = Object.keys(p1.props)
        local v4 = #v3
        local v5 = 1
        local v6 = p1
        for i = 1, v4, v5 do
            v1 = v3[i]
            if v1 ~= "children" and v1 ~= "key" then
                if _G.__DEV__ then
                    if not v6 then
                        setExtraStackFrame(nil)
                    else
                        _owner = v6._owner
                        type = if _owner then _owner.type else nil
                        v2 = describeUnknownElementTypeFrameInDEV(v6.type, v6._source, type)
                        setExtraStackFrame(v2)
                    end
                end
                console.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", v1)
                if not _G.__DEV__ then
                    break
                end
                setExtraStackFrame(nil)
                break
            end
        end
        if v6.ref ~= nil then
            if _G.__DEV__ then
                if not v6 then
                    setExtraStackFrame(nil)
                else
                    local _owner_2 = v6._owner
                    local type_2 = if _owner_2 then _owner_2.type else nil
                    local v7 = describeUnknownElementTypeFrameInDEV(v6.type, v6._source, type_2)
                    setExtraStackFrame(v7)
                end
            end
            console.error("Invalid attribute `ref` supplied to `React.Fragment`.")
            if _G.__DEV__ then
                setExtraStackFrame(nil)
            end
        end
    end
end
local function jsxWithValidation(p1, p2, p3, p4, p5, p6) -- Line: 369 -- upvalues: isValidElementType (val), Object (val), ReactCurrentOwner (val), getComponentName (val), Array (val), REACT_ELEMENT_TYPE (val), inspect (val), console (val), jsxDEV (val), validateChildKeys (val), warnAboutSpreadingKeyToJSX (val), REACT_FRAGMENT_TYPE (val), validateFragmentProps (val), validatePropTypes (val)
    local v1, v2, v3, v4
    local v5 = isValidElementType(p1)
    if not v5 then
        v2 = ""
        if p1 == nil then
            v2 = v2 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
        elseif typeof(p1) == "table" and #Object.keys(p1) ~= 0 then
        end
        if p5 == nil then
            v3 = ""
        else
            v4 = string.gsub(p5.fileName, "^.*[\\/]", "")
            v3 = "\n\nCheck your code at " .. v4 .. ":" .. p5.lineNumber .. "."
        end
        if not v3 then
            if not ReactCurrentOwner.current then
                v1 = ""
            else
                local v6 = getComponentName(ReactCurrentOwner.current.type)
                if v6 then
                    v1 = "\n\nCheck the render method of `" .. v6 .. "`."
                end
            end
            v2 = v2 .. v1
        else
            v2 = v2 .. v3
        end
        if p1 == nil then
            v4 = "nil"
        elseif Array.isArray(p1) then
            v4 = "array"
        elseif typeof(p1) ~= "table" then
            v4 = typeof(p1)
            v2 = v2 .. "\n" .. inspect(p1)
        elseif p1["$$typeof"] == REACT_ELEMENT_TYPE then
            v4 = string.format("<%s />", getComponentName(p1.type) or "Unknown")
            v2 = v2 .. " Did you accidentally export a JSX literal or Element instead of a component?"
        end
        if _G.__DEV__ then
            console.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v4, v2)
        end
    end
    v2 = jsxDEV(p1, p2, p3, p5, p6)
    if v2 == nil then
        return v2
    end
    if v5 then
        local children = p2.children
        if children ~= nil then
            if not p4 then
                validateChildKeys(children, p1)
            elseif Array.isArray(children) then
                v4 = #children
                v1 = 1
                for i = 1, v4, v1 do
                    validateChildKeys(children[i], p1)
                end
                Object.freeze(children)
            elseif _G.__DEV__ then
                console.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
            end
        end
    end
    if _G.__DEV__ and warnAboutSpreadingKeyToJSX then
        v3 = p2.key ~= nil
        if v3 then
            console.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", getComponentName(p1) or "ComponentName")
        end
    end
    if p1 == REACT_FRAGMENT_TYPE then
        validateFragmentProps(v2)
        return v2
    end
    validatePropTypes(v2)
    return v2
end
v2.jsxWithValidation = jsxWithValidation
function v2.jsxWithValidationStatic(p1, p2, p3) -- Line: 491 -- upvalues: jsxWithValidation (val)
    return (jsxWithValidation(p1, p2, p3, true))
end
function v2.jsxWithValidationDynamic(p1, p2, p3) -- Line: 495 -- upvalues: jsxWithValidation (val)
    return (jsxWithValidation(p1, p2, p3, false))
end
function v2.createElementWithValidation(p1, p2, ...) -- Line: 500 -- upvalues: isValidElementType (val), Object (val), ReactCurrentOwner (val), getComponentName (val), Array (val), REACT_ELEMENT_TYPE (val), inspect (val), console (val), createElement (val), validateChildKeys (val), REACT_FRAGMENT_TYPE (val), validateFragmentProps (val), validatePropTypes (val)
    local v1, v2, v3
    local v4 = isValidElementType(p1)
    if not v4 then
        local v5
        v1 = ""
        if p1 == nil then
            v1 = v1 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
        elseif typeof(p1) == "table" and #Object.keys(p1) ~= 0 then
        end
        if p2 == nil then
            v2 = ""
        else
            local __source = p2.__source
            if __source == nil then
                v2 = ""
            else
                v5 = string.gsub(__source.fileName, "^.*[\\/]", "")
                v2 = "\n\nCheck your code at " .. v5 .. ":" .. __source.lineNumber .. "."
            end
        end
        if not v2 then
            if not ReactCurrentOwner.current then
                v5 = ""
            else
                local v6 = getComponentName(ReactCurrentOwner.current.type)
                if v6 then
                    v5 = "\n\nCheck the render method of `" .. v6 .. "`."
                end
            end
            v1 = v1 .. v5
        else
            v1 = v1 .. v2
        end
        if p1 == nil then
            v3 = "nil"
        elseif Array.isArray(p1) then
            v3 = "array"
        elseif p1 == nil then
            v3 = typeof(p1)
            if p1 ~= nil then
                v1 = v1 .. "\n" .. inspect(p1)
            end
        elseif typeof(p1) == "table" and p1["$$typeof"] == REACT_ELEMENT_TYPE then
            v3 = string.format("<%s />", getComponentName(p1.type) or "Unknown")
            v1 = v1 .. " Did you accidentally export a JSX literal or Element instead of a component?"
        end
        if _G.__DEV__ then
            console.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v3, v1)
        end
    end
    v1 = createElement(p1, p2, ...)
    if v1 == nil then
        return v1
    end
    if v4 then
        local v7
        v2 = select("#", ...)
        v3 = 1
        for i = 1, v2, v3 do
            v7 = select(i, ...)
            validateChildKeys(v7, p1)
        end
    end
    if p1 == REACT_FRAGMENT_TYPE then
        validateFragmentProps(v1)
        return v1
    end
    validatePropTypes(v1)
    return v1
end
function v2.cloneElementWithValidation(p1, p2, ...) -- Line: 633 -- upvalues: cloneElement (val), validateChildKeys (val), validatePropTypes (val)
    local v1 = {p1, p2, ...}
    local v2 = cloneElement(p1, p2, ...)
    local v3 = #v1
    local v4 = 1
    for i = 3, v3, v4 do
        validateChildKeys(v1[i], v2.type)
    end
    validatePropTypes(v2)
    return v2
end
return v2