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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Config
--                              Dumped in 0.000843 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {internalTypeChecks = false, typeChecks = false, elementTracing = false, propValidation = false}
local u17 = {}
for k in pairs(u12) do
    table.insert(u17, k)
end
local u29 = {}
function u29.new() -- Line: 42 -- upvalues: u17 (val), u29 (val), u12 (val)
    local u0 = {}
    local v1 = {}
    u0._currentConfig = setmetatable(v1, {
        __index = function(p1, p2) -- Line: 46 -- upvalues: u17 (upval)
            local v1 = tostring(p2)
            local v2 = ("Invalid global configuration key %q. Valid configuration keys are: %s"):format(v1, table.concat(u17, ", "))
            error(v2, 3)
        end,
    })
    function u0.set(...) -- Line: 61 -- upvalues: u29 (upval), u0 (val)
        return u29.set(u0, ...)
    end
    function u0.get(...) -- Line: 65 -- upvalues: u29 (upval), u0 (val)
        return u29.get(u0, ...)
    end
    function u0.scoped(...) -- Line: 69 -- upvalues: u29 (upval), u0 (val)
        return u29.scoped(u0, ...)
    end
    u0.set(u12)
    return u0
end
function u29.set(p1, p2) -- Line: 78 -- upvalues: u12 (val), u17 (val)
    local v1, v2, v3
    for k, v in pairs(p2) do
        if u12[k] == nil then
            v3 = tostring(k)
            v1 = typeof(k)
            v2 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(v3, v1, table.concat(u17, ", "))
            error(v2, 3)
        end
        if typeof(v) ~= "boolean" then
            v3 = tostring(v)
            v1 = typeof(v)
            v2 = ("Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"):format(v3, v1, (tostring(k)))
            error(v2, 3)
        end
        v4._currentConfig[k] = v
    end
end
function u29.get(p1) -- Line: 111
    return p1._currentConfig
end
function u29.scoped(p1, p2, p3) -- Line: 115
    local v1, v2
    local v3 = {}
    for k, v in pairs(p1._currentConfig) do
        v3[k] = v
    end
    p1.set(p2)
    v1, v2 = pcall(p3)
    p1.set(v3)
    assert(v1, v2)
end
return u29