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
--       File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.React
--                              Dumped in 0.000427 seconds
--                          Bytecode version 9  |  1 functions

local cloneElementWithValidation, createElementWithValidation
require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local ReactMutableSource = require(script.Parent:WaitForChild("ReactMutableSource"))
local ReactBaseClasses = require(script.Parent:WaitForChild("ReactBaseClasses"))
local ReactChildren = require(script.Parent:WaitForChild("ReactChildren"))
local ReactElementValidator = require(script.Parent:WaitForChild("ReactElementValidator"))
local ReactElement = require(script.Parent:WaitForChild("ReactElement"))
local ReactCreateRef = require(script.Parent:WaitForChild("ReactCreateRef"))
local ReactForwardRef = require(script.Parent:WaitForChild("ReactForwardRef"))
local ReactHooks = require(script.Parent:WaitForChild("ReactHooks"))
local ReactMemo = require(script.Parent:WaitForChild("ReactMemo"))
local ReactContext = require(script.Parent:WaitForChild("ReactContext"))
local ReactLazy = require(script.Parent:WaitForChild("ReactLazy"))
local v1 = require(script.Parent:WaitForChild("ReactBinding.roblox"))
local v2 = require(script.Parent:WaitForChild("None.roblox"))
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local __DEV__ = _G.__DEV__
if not __DEV__ then
    __DEV__ = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
end
require(script.Parent.Parent:WaitForChild("shared"))
if not __DEV__ then
    createElementWithValidation = ReactElement.createElement
else
    createElementWithValidation = ReactElementValidator.createElementWithValidation
end
if not __DEV__ then
    cloneElementWithValidation = ReactElement.cloneElement
else
    cloneElementWithValidation = ReactElementValidator.cloneElementWithValidation
end
return {
    Children = ReactChildren,
    createMutableSource = ReactMutableSource,
    createRef = ReactCreateRef.createRef,
    Component = ReactBaseClasses.Component,
    PureComponent = ReactBaseClasses.PureComponent,
    createContext = ReactContext.createContext,
    forwardRef = ReactForwardRef.forwardRef,
    lazy = ReactLazy.lazy,
    memo = ReactMemo.memo,
    useCallback = ReactHooks.useCallback,
    useContext = ReactHooks.useContext,
    useEffect = ReactHooks.useEffect,
    useImperativeHandle = ReactHooks.useImperativeHandle,
    useDebugValue = ReactHooks.useDebugValue,
    useLayoutEffect = ReactHooks.useLayoutEffect,
    useMemo = ReactHooks.useMemo,
    useMutableSource = ReactHooks.useMutableSource,
    useReducer = ReactHooks.useReducer,
    useRef = ReactHooks.useRef,
    useBinding = ReactHooks.useBinding,
    useState = ReactHooks.useState,
    Fragment = ReactSymbols.REACT_FRAGMENT_TYPE,
    Profiler = ReactSymbols.REACT_PROFILER_TYPE,
    StrictMode = ReactSymbols.REACT_STRICT_MODE_TYPE,
    unstable_DebugTracingMode = ReactSymbols.REACT_DEBUG_TRACING_MODE_TYPE,
    Suspense = ReactSymbols.REACT_SUSPENSE_TYPE,
    createElement = createElementWithValidation,
    cloneElement = cloneElementWithValidation,
    isValidElement = ReactElement.isValidElement,
    __SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals,
    unstable_LegacyHidden = ReactSymbols.REACT_LEGACY_HIDDEN_TYPE,
    createBinding = v1.create,
    joinBindings = v1.join,
    None = v2,
    __subscribeToBinding = v1.subscribe,
    Event = require(script.Parent.Parent:WaitForChild("shared")).Event,
    Change = require(script.Parent.Parent:WaitForChild("shared")).Change,
    Tag = require(script.Parent.Parent:WaitForChild("shared")).Tag,
    unstable_parseReactError = require(script.Parent.Parent:WaitForChild("shared")).parseReactError,
}