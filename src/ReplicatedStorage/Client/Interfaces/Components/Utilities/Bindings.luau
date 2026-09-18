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
--        File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Bindings
--                              Dumped in 0.000721 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local createBinding = react.createBinding
local joinBindings = react.joinBindings
local function lerp(p1, p2, p3) -- Line: 19
    return p1 + (p2 - p1) * p3
end
local function isBinding(p1) -- Line: 29
    local v1 = type(p1) == "table"
    if v1 then
        local v2 = if p1.getValue ~= nil then p1.map ~= nil else false
        v1 = v2
    end
    return v1
end
local function toBinding(p1, ...) -- Line: 45 -- upvalues: isBinding (val), createBinding (val)
    if isBinding(p1) then
        return p1
    end
    return (createBinding(p1))
end
local function mapBinding(p1, p2) -- Line: 77 -- upvalues: isBinding (val), createBinding (val)
    if isBinding(p1) then
        return p1:map(p2)
    end
    return (createBinding(p2(p1)))
end
return {
    isBinding = isBinding,
    toBinding = toBinding,
    getBindingValue = function(p1) -- Line: 61 -- upvalues: isBinding (val)
        if isBinding(p1) then
            return p1:getValue()
        end
        return p1
    end,
    mapBinding = mapBinding,
    joinAnyBindings = function(p1) -- Line: 93 -- upvalues: toBinding (val), joinBindings (val)
        local v1 = {}
        for k, v in pairs(p1) do
            v1[k] = toBinding(v)
        end
        return joinBindings(v1)
    end,
    getBindingApi = function(p1) -- Line: 108
        local v1
        for k, v in pairs(p1) do
            v1 = tostring(k)
            if v1 ~= "Symbol(BindingImpl)" and string.sub(v1, 1, 12) ~= "RoactBinding" then
                continue
            end
            return v
        end
    end,
    lerpBinding = function(p1, p2, p3) -- Line: 126 -- upvalues: mapBinding (val), lerp (val)
        return mapBinding(p1, function(p1) -- Line: 127 -- upvalues: p2 (val), lerp (upval), p3 (val)
            if type(p2) == "number" then
                return lerp(p2, p3, p1)
            end
            return p2:Lerp(p3, p1)
        end)
    end,
    composeBindings = function(...) -- Line: 146 -- upvalues: toBinding (val), joinBindings (val)
        local v1 = {...}
        local v2 = #v1
        local u3 = v1[v2]
        v1[v2] = nil
        local v3 = table.create(#v1)
        local v4 = v1
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v3[i] = toBinding(j, i - 1, v1)
        end
        return joinBindings(v3):map(function(p1) -- Line: 161 -- upvalues: u3 (val)
            return u3(unpack(p1))
        end)
    end,
}