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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Config
--                              Dumped in 0.000463 seconds
--                          Bytecode version 9  |  9 functions

local u0 = {internalTypeChecks = false, typeChecks = false, elementTracing = false, propValidation = false}
local u5 = {}
for k in pairs(u0) do
    table.insert(u5, k)
end
local u17 = {}
function u17.new() -- Line: 35 -- upvalues: u5 (val), u17 (val), u0 (val)
    local u0 = {}
    local v1 = {}
    u0._currentConfig = setmetatable(v1, {
        __index = function(p1, p2) -- Line: 39 -- upvalues: u5 (upval)
            local v1 = tostring(p2)
            local v2 = ("Invalid global configuration key %q. Valid configuration keys are: %s"):format(v1, table.concat(u5, ", "))
            error(v2, 3)
        end,
    })
    function u0.set(...) -- Line: 52 -- upvalues: u17 (upval), u0 (val)
        return u17.set(u0, ...)
    end
    function u0.get(...) -- Line: 56 -- upvalues: u17 (upval), u0 (val)
        return u17.get(u0, ...)
    end
    function u0.scoped(...) -- Line: 60 -- upvalues: u17 (upval), u0 (val)
        return u17.scoped(u0, ...)
    end
    u0.set(u0)
    return u0
end
function u17.set(p1, p2) -- Line: 69 -- upvalues: u0 (val), u5 (val)
    local v1, v2, v3
    for k, v in pairs(p2) do
        if u0[k] == nil then
            v3 = tostring(k)
            v1 = typeof(k)
            v2 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(v3, v1, table.concat(u5, ", "))
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
function u17.get(p1) -- Line: 96
    return p1._currentConfig
end
function u17.scoped(p1, p2, p3) -- Line: 100
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
return u17