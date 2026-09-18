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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Binding
--                               Dumped in 0.00100 seconds
--                          Bytecode version 9  |  23 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local createSignal = require(v1.Parent.createSignal)
local Symbol = require(v1.Parent.Symbol)
local Type = require(v1.Parent.Type)
local u29 = require(v1.Parent.GlobalConfig).get()
local BindingImpl = Symbol.named("BindingImpl")
local u33 = {}
local u37 = {
    __index = {
        getValue = function(p1) -- Line: 20 -- upvalues: u33 (val)
            return u33.getValue(p1)
        end,
        map = function(p1, p2) -- Line: 24 -- upvalues: u33 (val)
            return u33.map(p1, p2)
        end,
    },
    __tostring = function(p1) -- Line: 30
        return string.format("RoactBinding(%s)", (tostring(p1:getValue())))
    end,
}
function u33.update(p1, p2) -- Line: 35 -- upvalues: BindingImpl (val)
    return p1[BindingImpl].update(p2)
end
function u33:subscribe(p2) -- Line: 39 -- upvalues: BindingImpl (val)
    return self[BindingImpl].subscribe(p2)
end
function u33:getValue() -- Line: 43 -- upvalues: BindingImpl (val)
    return self[BindingImpl].getValue()
end
function u33.create(p1) -- Line: 47 -- upvalues: createSignal (val), Type (val), BindingImpl (val), u37 (val)
    local u1 = {value = p1, changeSignal = createSignal()}
    function u1.subscribe(p1) -- Line: 53 -- upvalues: u1 (val)
        return u1.changeSignal:subscribe(p1)
    end
    function u1.update(p1) -- Line: 57 -- upvalues: u1 (val)
        u1.value = p1
        u1.changeSignal:fire(p1)
    end
    function u1.getValue() -- Line: 62 -- upvalues: u1 (val)
        return u1.value
    end
    local v1 = {}
    v1[Type] = Type.Binding
    v1[BindingImpl] = u1
    local v2 = setmetatable(v1, u37)
    return v2, u1.update
end
function u33.map(p1, p2) -- Line: 72 -- upvalues: u29 (val), Type (val), u33 (val), BindingImpl (val), u37 (val)
    local v1
    if u29.typeChecks then
        v1 = Type.of(p1)
        local v2 = v1 == Type.Binding
        assert(v2, "Expected arg #1 to be a binding")
        v2 = typeof(p2) == "function"
        assert(v2, "Expected arg #1 to be a function")
    end
    local v3 = {
        subscribe = function(a1) -- Line: 80 -- upvalues: u33 (upval), p1 (val), p2 (val)
            return u33.subscribe(p1, function(p1) -- Line: 81 -- upvalues: a1 (val), p2 (upval)
                a1(p2(p1))
            end)
        end,
        update = function(p1) -- Line: 86
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
        end,
        getValue = function() -- Line: 90 -- upvalues: p2 (val), p1 (val)
            return p2(p1:getValue())
        end,
    }
    v1 = {}
    v1[Type] = Type.Binding
    v1[BindingImpl] = v3
    return (setmetatable(v1, u37))
end
function u33.join(p1) -- Line: 100 -- upvalues: u29 (val), Type (val), u33 (val), BindingImpl (val), u37 (val)
    if u29.typeChecks then
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
    local function getValue() -- Line: 118 -- upvalues: p1 (val)
        local v1 = {}
        for k, v in pairs(p1) do
            v1[k] = v:getValue()
        end
        return v1
    end
    function v3.subscribe(a1) -- Line: 128 -- upvalues: p1 (val), u33 (upval), getValue (val)
        local u1 = {}
        for k, v in pairs(p1) do
            u1[k] = u33.subscribe(v, function(p1) -- Line: 132 -- upvalues: a1 (val), getValue (upval)
                a1(getValue())
            end)
        end
        return function() -- Line: 137 -- upvalues: u1 (ref)
            if u1 == nil then
                return
            end
            for k, v in pairs(u1) do
                v()
            end
            u1 = nil
        end
    end
    function v3.update(p1) -- Line: 150
        error("Bindings created by joinBindings(...) cannot be updated directly", 2)
    end
    function v3.getValue() -- Line: 154 -- upvalues: getValue (val)
        return getValue()
    end
    local v4 = {}
    v4[Type] = Type.Binding
    v4[BindingImpl] = v3
    return (setmetatable(v4, u37))
end
return u33