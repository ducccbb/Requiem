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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactBinding.roblox
--                               Dumped in 0.00100 seconds
--                          Bytecode version 9  |  22 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
require(script.Parent.Parent:WaitForChild("shared"))
local u36 = require(script.Parent:WaitForChild("createSignal.roblox"))
local BindingImpl = v1.Symbol("BindingImpl")
local u40 = {}
local u44 = {
    __index = {
        getValue = function(p1) -- Line: 45 -- upvalues: u40 (val)
            return u40.getValue(p1)
        end,
        map = function(p1, p2) -- Line: 49 -- upvalues: u40 (val)
            return u40.map(p1, p2)
        end,
    },
    __tostring = function(p1) -- Line: 58
        return string.format("RoactBinding(%s)", (tostring(p1:getValue())))
    end,
}
function u40.update(p1, p2) -- Line: 63 -- upvalues: BindingImpl (val)
    return p1[BindingImpl].update(p2)
end
function u40.subscribe(p1, p2) -- Line: 67 -- upvalues: BindingImpl (val)
    return p1[BindingImpl].subscribe(p2)
end
function u40:getValue() -- Line: 71 -- upvalues: BindingImpl (val)
    return self[BindingImpl]:getValue()
end
function u40.create(p1) -- Line: 75 -- upvalues: u36 (val), ReactSymbols (val), BindingImpl (val), u44 (val)
    local u3, v1
    v1, u3 = u36()
    local u4 = {value = p1, subscribe = v1}
    function u4.update(p1) -- Line: 82 -- upvalues: u4 (val), u3 (val)
        u4.value = p1
        u3(p1)
    end
    function u4.getValue() -- Line: 87 -- upvalues: u4 (val)
        return u4.value
    end
    local v2 = if _G.__DEV__ then debug.traceback("Binding created at:", 3) else nil
    local v3 = {}
    v3["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE
    v3[BindingImpl] = u4
    v3._source = v2
    local v4 = setmetatable(v3, u44)
    return v4, u4.update
end
function u40.map(p1, p2) -- Line: 105 -- upvalues: ReactSymbols (val), u40 (val), BindingImpl (val), u44 (val)
    local v1
    if _G.__DEV__ then
        v1 = if typeof(p1) == "table" then p1["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE else false
        assert(v1, "Expected `self` to be a binding")
        v1 = typeof(p2) == "function"
        assert(v1, "Expected arg #1 to be a function")
    end
    local v2 = {
        subscribe = function(a1) -- Line: 121 -- upvalues: u40 (upval), p1 (val), p2 (val)
            return u40.subscribe(p1, function(p1) -- Line: 122 -- upvalues: a1 (val), p2 (upval)
                a1(p2(p1))
            end)
        end,
        update = function(p1) -- Line: 127
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
        end,
        getValue = function() -- Line: 131 -- upvalues: p2 (val), p1 (val)
            return p2(p1:getValue())
        end,
    }
    v1 = if _G.__DEV__ then debug.traceback("Mapped binding created at:", 3) else nil
    local v3 = {}
    v3["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE
    v3[BindingImpl] = v2
    v3._source = v1
    return (setmetatable(v3, u44))
end
function u40.join(p1) -- Line: 152 -- upvalues: ReactSymbols (val), u40 (val), BindingImpl (val), u44 (val)
    local u48, v1, v2, v3
    if not _G.__DEV__ then
        u48 = p1
    else
        local v4
        v2 = typeof(p1) == "table"
        assert(v2, "Expected arg #1 to be of type table")
        v1 = p1
        v2 = nil
        v3 = nil
        u48 = p1
        for i, j in v1, v2, v3 do
            if typeof(j) ~= "table" then
                v4 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(i)))
                error(v4, 2)
            elseif j["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE then
            end
        end
    end
    v1 = {}
    local function getValue() -- Line: 173 -- upvalues: u48 (val)
        local v1 = {}
        for k, v in pairs(u48) do
            v1[k] = v:getValue()
        end
        return v1
    end
    function v1.subscribe(p1) -- Line: 184 -- upvalues: u48 (val), u40 (upval), getValue (val)
        local u1 = {}
        local v1 = u48
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            u1[i] = u40.subscribe(j, function(a1) -- Line: 189 -- upvalues: p1 (val), getValue (upval)
                p1((getValue()))
            end)
        end
        return function() -- Line: 194 -- upvalues: u1 (ref)
            if u1 == nil then
                return
            end
            local v1 = u1
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j()
            end
            u1 = nil
        end
    end
    function v1.update(p1) -- Line: 207
        error("Bindings created by joinBindings(...) cannot be updated directly", 2)
    end
    function v1.getValue() -- Line: 211 -- upvalues: getValue (val)
        return (getValue())
    end
    v3 = if _G.__DEV__ then debug.traceback("Joined binding created at:", 2) else nil
    local v5 = {}
    v5["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE
    v5[BindingImpl] = v1
    v5._source = v3
    return (setmetatable(v5, u44))
end
return u40