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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Binding
--                              Dumped in 0.000849 seconds
--                          Bytecode version 9  |  23 functions

local createSignal = require(script.Parent.createSignal)
local Symbol = require(script.Parent.Symbol)
local Type = require(script.Parent.Type)
local u21 = require(script.Parent.GlobalConfig).get()
local BindingImpl = Symbol.named("BindingImpl")
local u25 = {}
local u29 = {
    __index = {
        getValue = function(p1) -- Line: 13 -- upvalues: u25 (val)
            return u25.getValue(p1)
        end,
        map = function(p1, p2) -- Line: 17 -- upvalues: u25 (val)
            return u25.map(p1, p2)
        end,
    },
    __tostring = function(p1) -- Line: 23
        return string.format("RoactBinding(%s)", (tostring(p1:getValue())))
    end,
}
function u25.update(p1, p2) -- Line: 28 -- upvalues: BindingImpl (val)
    return p1[BindingImpl].update(p2)
end
function u25:subscribe(p2) -- Line: 32 -- upvalues: BindingImpl (val)
    return self[BindingImpl].subscribe(p2)
end
function u25:getValue() -- Line: 36 -- upvalues: BindingImpl (val)
    return self[BindingImpl].getValue()
end
function u25.create(p1) -- Line: 40 -- upvalues: createSignal (val), Type (val), BindingImpl (val), u29 (val)
    local u1 = {value = p1, changeSignal = createSignal()}
    function u1.subscribe(p1) -- Line: 46 -- upvalues: u1 (val)
        return u1.changeSignal:subscribe(p1)
    end
    function u1.update(p1) -- Line: 50 -- upvalues: u1 (val)
        u1.value = p1
        u1.changeSignal:fire(p1)
    end
    function u1.getValue() -- Line: 55 -- upvalues: u1 (val)
        return u1.value
    end
    local v1 = {}
    v1[Type] = Type.Binding
    v1[BindingImpl] = u1
    local v2 = setmetatable(v1, u29)
    return v2, u1.update
end
function u25.map(p1, p2) -- Line: 65 -- upvalues: u21 (val), Type (val), u25 (val), BindingImpl (val), u29 (val)
    local v1
    if u21.typeChecks then
        v1 = Type.of(p1)
        local v2 = v1 == Type.Binding
        assert(v2, "Expected arg #1 to be a binding")
        v2 = typeof(p2) == "function"
        assert(v2, "Expected arg #1 to be a function")
    end
    local v3 = {
        subscribe = function(a1) -- Line: 73 -- upvalues: u25 (upval), p1 (val), p2 (val)
            return u25.subscribe(p1, function(p1) -- Line: 74 -- upvalues: a1 (val), p2 (upval)
                a1(p2(p1))
            end)
        end,
        update = function(p1) -- Line: 79
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
        end,
        getValue = function() -- Line: 83 -- upvalues: p2 (val), p1 (val)
            return p2(p1:getValue())
        end,
    }
    v1 = {}
    v1[Type] = Type.Binding
    v1[BindingImpl] = v3
    return (setmetatable(v1, u29))
end
function u25.join(p1) -- Line: 93 -- upvalues: u21 (val), Type (val), u25 (val), BindingImpl (val), u29 (val)
    if u21.typeChecks then
        local v1
        local v2 = typeof(p1) == "table"
        assert(v2, "Expected arg #1 to be of type table")
        for k, v in pairs(p1) do
            v1 = Type.of(v)
            if v1 ~= Type.Binding then
                v1 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(k)))
                error(v1, 2)
            end
        end
    end
    local v3 = {}
    local function getValue() -- Line: 109 -- upvalues: p1 (val)
        local v1 = {}
        for k, v in pairs(p1) do
            v1[k] = v:getValue()
        end
        return v1
    end
    function v3.subscribe(a1) -- Line: 119 -- upvalues: p1 (val), u25 (upval), getValue (val)
        local u1 = {}
        for k, v in pairs(p1) do
            u1[k] = u25.subscribe(v, function(p1) -- Line: 123 -- upvalues: a1 (val), getValue (upval)
                a1((getValue()))
            end)
        end
        return function() -- Line: 128 -- upvalues: u1 (ref)
            if u1 == nil then
                return
            end
            for k, v in pairs(u1) do
                v()
            end
            u1 = nil
        end
    end
    function v3.update(p1) -- Line: 141
        error("Bindings created by joinBindings(...) cannot be updated directly", 2)
    end
    function v3.getValue() -- Line: 145 -- upvalues: getValue (val)
        return (getValue())
    end
    local v4 = {}
    v4[Type] = Type.Binding
    v4[BindingImpl] = v3
    return (setmetatable(v4, u29))
end
return u25