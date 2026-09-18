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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactStrictModeWarnings.new
--                               Dumped in 0.00155 seconds
--                          Bytecode version 9  |  14 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local StrictMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).StrictMode
local v1 = {
    recordUnsafeLifecycleWarnings = function(p1, p2) end,
    flushPendingUnsafeLifecycleWarnings = function() end,
    recordLegacyContextWarning = function(p1, p2) end,
    flushLegacyContextWarning = function() end,
    discardPendingWarnings = function() end,
}
if _G.__DEV__ then
    local function v2(p1) -- Line: 38 -- upvalues: StrictMode (val)
        local v1 = nil
        local return_ = p1
        while return_ ~= nil do
            if bit32.band(return_.mode, StrictMode) ~= 0 then
                v1 = return_
            end
            return_ = return_.return_
        end
        return v1
    end
    local function u56(p1) -- Line: 53
        local v1 = {}
        local v2 = p1
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, i)
        end
        table.sort(v1)
        return table.concat(v1, ", ")
    end
    local u57 = {}
    local u58 = {}
    local u59 = {}
    local u60 = {}
    local u61 = {}
    local u62 = {}
    local u63 = {}
    function v1.recordUnsafeLifecycleWarnings(p1, p2) -- Line: 73 -- upvalues: u63 (val), u57 (val), StrictMode (val), u58 (val), u59 (val), u60 (val), u61 (val), u62 (val)
        if u63[p1.type] then
            return
        end
        if typeof(p2.componentWillMount) == "function" then
            table.insert(u57, p1)
        end
        if bit32.band(p1.mode, StrictMode) ~= 0 and typeof(p2.UNSAFE_componentWillMount) == "function" then
            table.insert(u58, p1)
        end
        if typeof(p2.componentWillReceiveProps) == "function" then
            table.insert(u59, p1)
        end
        if bit32.band(p1.mode, StrictMode) ~= 0 and typeof(p2.UNSAFE_componentWillReceiveProps) == "function" then
            table.insert(u60, p1)
        end
        if typeof(p2.componentWillUpdate) == "function" then
            table.insert(u61, p1)
        end
        if bit32.band(p1.mode, StrictMode) ~= 0 and typeof(p2.UNSAFE_componentWillUpdate) == "function" then
            table.insert(u62, p1)
        end
    end
    function v1.flushPendingUnsafeLifecycleWarnings() -- Line: 126 -- upvalues: u57 (val), getComponentName (val), u63 (val), u58 (val), u59 (val), u60 (val), u61 (val), u62 (val), u56 (val), console (val)
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = {}
        local v9 = #u57
        if 0 < v9 then
            v9 = u57
            v1 = nil
            v2 = nil
            for i, j in v9, v1, v2 do
                v5 = getComponentName(j.type) or "Component"
                v8[v5] = true
                u63[j.type] = true
            end
            table.clear(u57)
        end
        v9 = {}
        v1 = #u58
        if 0 < v1 then
            v1 = u58
            v2 = nil
            v3 = nil
            for k, n in v1, v2, v3 do
                v6 = getComponentName(n.type) or "Component"
                v9[v6] = true
                u63[n.type] = true
            end
            table.clear(u58)
        end
        v1 = {}
        v2 = #u59
        if 0 < v2 then
            v2 = u59
            v3 = nil
            v4 = nil
            for m, i5 in v2, v3, v4 do
                v7 = getComponentName(i5.type) or "Component"
                v1[v7] = true
                u63[i5.type] = true
            end
            table.clear(u59)
        end
        v2 = {}
        v3 = #u60
        if 0 < v3 then
            local v10
            v3 = u60
            v4 = nil
            v5 = nil
            for i6, i7 in v3, v4, v5 do
                v10 = getComponentName(i7.type) or "Component"
                v2[v10] = true
                u63[i7.type] = true
            end
            table.clear(u60)
        end
        v3 = {}
        v4 = #u61
        if 0 < v4 then
            local v11
            v4 = u61
            v5 = nil
            v6 = nil
            for i8, i9 in v4, v5, v6 do
                v11 = getComponentName(i9.type) or "Component"
                v3[v11] = true
                u63[i9.type] = true
            end
            table.clear(u61)
        end
        v4 = {}
        v5 = #u62
        if 0 < v5 then
            local v12
            v5 = u62
            v6 = nil
            v7 = nil
            for i10, i11 in v5, v6, v7 do
                v12 = getComponentName(i11.type) or "Component"
                v4[v12] = true
                u63[i11.type] = true
            end
            table.clear(u62)
        end
        if next(v9) ~= nil then
            v5 = u56(v9)
            console.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n\nPlease update the following components: %s", v5)
        end
        if next(v2) ~= nil then
            v5 = u56(v2)
            console.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n\nPlease update the following components: %s", v5)
        end
        if next(v4) ~= nil then
            v5 = u56(v4)
            console.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n\nPlease update the following components: %s", v5)
        end
        if next(v8) ~= nil then
            v5 = u56(v8)
            console.warn("componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v5)
        end
        if next(v1) ~= nil then
            v5 = u56(v1)
            console.warn("componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v5)
        end
        if next(v3) ~= nil then
            v5 = u56(v3)
            console.warn("componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v5)
        end
    end
    local u66 = {}
    local u67 = {}
    function v1.recordLegacyContextWarning(p1, p2) -- Line: 300 -- upvalues: StrictMode (val), console (val), u67 (val), u66 (val)
        local v1, v2
        local v3 = nil
        local return_ = p1
        v1, v2 = p1, p2
        while return_ ~= nil do
            if bit32.band(return_.mode, StrictMode) ~= 0 then
                v3 = return_
            end
            return_ = return_.return_
        end
        local v4 = v3
        if v4 == nil then
            console.error("Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.")
            return
        end
        if u67[v1.type] then
            return
        end
        v3 = u66[v4]
        if typeof(v1.type) ~= "function" then
            if v1.type.contextTypes ~= nil then
                if v3 == nil then
                    u66[v4] = {}
                end
                table.insert(v3, v1)
            elseif v1.type.childContextTypes == nil and v2 ~= nil and typeof(v2.getChildContext) ~= "function" then
            end
        end
    end
    function v1.flushLegacyContextWarning() -- Line: 339 -- upvalues: u66 (val), getComponentName (val), u67 (val), u56 (val), setCurrentFiber (val), console (val), resetCurrentFiber (val)
        local v1, v2, v3, v4, v5
        local v6 = u66
        local v7 = nil
        local v8 = nil
        for i, j in v6, v7, v8 do
            if #j == 0 then
                return
            end
            local u11 = j[1]
            v2 = {}
            v3 = j
            v4 = nil
            v5 = nil
            for k, n in v3, v4, v5 do
                v1 = getComponentName(n.type) or "Component"
                v2[v1] = true
                u67[n.type] = true
            end
            local u26 = u56(v2)
            v4, v5 = pcall(function() -- Line: 354 -- upvalues: setCurrentFiber (upval), u11 (val), console (upval), u26 (val)
                setCurrentFiber(u11)
                console.error("Legacy context API has been detected within a strict-mode tree.\n\nThe old API will be supported in all 16.x releases, but applications using it should migrate to the new version.\n\nPlease update the following components: %s\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", u26)
            end)
            resetCurrentFiber()
            if not v4 then
                error(v5)
            end
        end
    end
    function v1.discardPendingWarnings() -- Line: 377 -- upvalues: u57 (val), u58 (val), u59 (val), u60 (val), u61 (val), u62 (val), u66 (val)
        table.clear(u57)
        table.clear(u58)
        table.clear(u59)
        table.clear(u60)
        table.clear(u61)
        table.clear(u62)
        table.clear(u66)
    end
end
return v1