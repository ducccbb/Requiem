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
--    File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactHooks
--                              Dumped in 0.000999 seconds
--                          Bytecode version 9  |  15 functions

local Array = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("shared"))
local ReactCurrentDispatcher = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentDispatcher
local function resolveDispatcher() -- Line: 44 -- upvalues: ReactCurrentDispatcher (val), console (val)
    local current = ReactCurrentDispatcher.current
    if _G.__DEV__ and current == nil then
        console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
    end
    return current
end
return {
    useContext = function(p1, p2, ...) -- Line: 67 -- upvalues: ReactCurrentDispatcher (val), console (val), Array (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        if _G.__DEV__ then
            local _context
            if p2 ~= nil then
                local v1
                local error = console.error
                if typeof(p2) ~= "number" then
                    v1 = ""
                else
                    local v2 = {...}
                    if Array.isArray(v2) then
                        v1 = "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks"
                    end
                end
                error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", p2, v1)
            end
            if p1._context ~= nil then
                _context = p1._context
                if _context.Consumer == p1 then
                    console.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
                elseif _context.Provider == p1 then
                    console.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
                end
            end
        end
        return current.useContext(p1, p2)
    end,
    useState = function(p1, ...) -- Line: 108 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useState(p1, ...)
    end,
    useReducer = function(p1, p2, p3) -- Line: 117 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useReducer(p1, p2, p3)
    end,
    useRef = function(p1) -- Line: 128 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useRef(p1)
    end,
    useBinding = function(p1) -- Line: 135 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useBinding(p1)
    end,
    useEffect = function(p1, p2) -- Line: 147 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useEffect(p1, p2)
    end,
    useLayoutEffect = function(p1, p2) -- Line: 157 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useLayoutEffect(p1, p2)
    end,
    useCallback = function(p1, p2) -- Line: 167 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useCallback(p1, p2)
    end,
    useMemo = function(p1, p2) -- Line: 173 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useMemo(p1, p2)
    end,
    useImperativeHandle = function(p1, p2, p3) -- Line: 179 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useImperativeHandle(p1, p2, p3)
    end,
    useDebugValue = function(p1, p2) -- Line: 189 -- upvalues: ReactCurrentDispatcher (val), console (val)
        if not _G.__DEV__ then
            return nil
        end
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useDebugValue(p1, p2)
    end,
    emptyObject = {},
    useOpaqueIdentifier = function() -- Line: 214 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useOpaqueIdentifier()
    end,
    useMutableSource = function(p1, p2, p3) -- Line: 220 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useMutableSource(p1, p2, p3)
    end,
}