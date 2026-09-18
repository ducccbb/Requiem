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
--   File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createContext
--                              Dumped in 0.000607 seconds
--                          Bytecode version 9  |  18 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Symbol = require(v1.Parent.Symbol)
local createFragment = require(v1.Parent.createFragment)
local createSignal = require(v1.Parent.createSignal)
local Children = require(v1.Parent.PropMarkers.Children)
local Component = require(v1.Parent.Component)
local function createContextEntry(p1) -- Line: 17 -- upvalues: createSignal (val)
    return {value = p1, onUpdate = createSignal()}
end
local function createProvider(p1) -- Line: 24 -- upvalues: Component (val), createContextEntry (val), createFragment (val), Children (val)
    local v1 = Component:extend("Provider")
    function v1.init(a1, p2) -- Line: 27 -- upvalues: createContextEntry (upval), p1 (val)
        a1.contextEntry = createContextEntry(p2.value)
        a1:__addContext(p1.key, a1.contextEntry)
    end
    function v1.willUpdate(p1, p2) -- Line: 32
        if p2.value ~= p1.props.value then
            p1.contextEntry.value = p2.value
        end
    end
    function v1.didUpdate(p1, p2) -- Line: 43
        if p2.value ~= p1.props.value then
            p1.contextEntry.onUpdate:fire(p1.props.value)
        end
    end
    function v1.render(p1) -- Line: 58 -- upvalues: createFragment (upval), Children (upval)
        return createFragment(p1.props[Children])
    end
    return v1
end
local function createConsumer(p1) -- Line: 65 -- upvalues: Component (val)
    local v1 = Component:extend("Consumer")
    function v1.validateProps(p1) -- Line: 68
        if type(p1.render) ~= "function" then
            return false, "Consumer expects a `render` function"
        end
        return true
    end
    function v1.init(a1, p2) -- Line: 76 -- upvalues: p1 (val)
        a1.contextEntry = a1:__getContext(p1.key)
    end
    function v1.render(a1) -- Line: 82 -- upvalues: p1 (val)
        local value
        if a1.contextEntry == nil then
            value = p1.defaultValue
        else
            value = a1.contextEntry.value
        end
        return a1.props.render(value)
    end
    function v1.didUpdate(p1) -- Line: 97
        if p1.contextEntry ~= nil then
            p1.lastValue = p1.contextEntry.value
        end
    end
    function v1.didMount(p1) -- Line: 106
        if p1.contextEntry ~= nil then
            p1.disconnect = p1.contextEntry.onUpdate:subscribe(function(a1) -- Line: 117 -- upvalues: p1 (val)
                if a1 ~= p1.lastValue then
                    p1:setState({})
                end
            end)
        end
    end
    function v1.willUnmount(p1) -- Line: 126
        if p1.disconnect ~= nil then
            p1.disconnect()
        end
    end
    return v1
end
local u36 = {}
u36.__index = u36
function u36.new(p1) -- Line: 138 -- upvalues: Symbol (val), u36 (val)
    local v1 = {defaultValue = p1, key = Symbol.named("ContextKey")}
    return (setmetatable(v1, u36))
end
function u36.__tostring(p1) -- Line: 145
    return "RoactContext"
end
return function(p1) -- Line: 149 -- upvalues: u36 (val), createProvider (val), createConsumer (val)
    local v1 = u36.new(p1)
    return {Provider = createProvider(v1), Consumer = createConsumer(v1)}
end