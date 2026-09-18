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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createContext
--                              Dumped in 0.000582 seconds
--                          Bytecode version 9  |  18 functions

local Symbol = require(script.Parent.Symbol)
local createFragment = require(script.Parent.createFragment)
local createSignal = require(script.Parent.createSignal)
local Children = require(script.Parent.PropMarkers.Children)
local Component = require(script.Parent.Component)
local function createContextEntry(p1) -- Line: 10 -- upvalues: createSignal (val)
    return {value = p1, onUpdate = createSignal()}
end
local function createProvider(p1) -- Line: 17 -- upvalues: Component (val), createSignal (val), createFragment (val), Children (val)
    local v1 = Component:extend("Provider")
    function v1.init(a1, p2) -- Line: 20 -- upvalues: createSignal (upval), p1 (val)
        a1.contextEntry = {value = p2.value, onUpdate = createSignal()}
        a1:__addContext(p1.key, a1.contextEntry)
    end
    function v1.willUpdate(p1, p2) -- Line: 25
        if p2.value ~= p1.props.value then
            p1.contextEntry.value = p2.value
        end
    end
    function v1.didUpdate(p1, p2) -- Line: 36
        if p2.value ~= p1.props.value then
            p1.contextEntry.onUpdate:fire(p1.props.value)
        end
    end
    function v1.render(p1) -- Line: 51 -- upvalues: createFragment (upval), Children (upval)
        return createFragment(p1.props[Children])
    end
    return v1
end
local function createConsumer(p1) -- Line: 58 -- upvalues: Component (val)
    local v1 = Component:extend("Consumer")
    function v1.validateProps(p1) -- Line: 61
        if type(p1.render) ~= "function" then
            return false, "Consumer expects a `render` function"
        end
        return true
    end
    function v1.init(a1, p2) -- Line: 69 -- upvalues: p1 (val)
        a1.contextEntry = a1:__getContext(p1.key)
    end
    function v1.render(a1) -- Line: 75 -- upvalues: p1 (val)
        local value
        if a1.contextEntry == nil then
            value = p1.defaultValue
        else
            value = a1.contextEntry.value
        end
        return a1.props.render(value)
    end
    function v1.didUpdate(p1) -- Line: 90
        if p1.contextEntry ~= nil then
            p1.lastValue = p1.contextEntry.value
        end
    end
    function v1.didMount(p1) -- Line: 99
        if p1.contextEntry ~= nil then
            p1.disconnect = p1.contextEntry.onUpdate:subscribe(function(a1) -- Line: 110 -- upvalues: p1 (val)
                if a1 ~= p1.lastValue then
                    p1:setState({})
                end
            end)
        end
    end
    function v1.willUnmount(p1) -- Line: 119
        if p1.disconnect ~= nil then
            p1.disconnect()
            p1.disconnect = nil
        end
    end
    return v1
end
local u29 = {}
u29.__index = u29
function u29.new(p1) -- Line: 132 -- upvalues: Symbol (val), u29 (val)
    local v1 = {defaultValue = p1, key = Symbol.named("ContextKey")}
    return (setmetatable(v1, u29))
end
function u29.__tostring(p1) -- Line: 139
    return "RoactContext"
end
return function(p1) -- Line: 143 -- upvalues: u29 (val), createProvider (val), createConsumer (val)
    local v1 = u29.new(p1)
    return {Provider = createProvider(v1), Consumer = createConsumer(v1)}
end