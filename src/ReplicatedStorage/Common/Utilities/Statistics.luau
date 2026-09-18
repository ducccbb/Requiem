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
--                  File: ReplicatedStorage.Common.Utilities.Statistics
--                              Dumped in 0.000948 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local function GetHighestSetPriority(p1) -- Line: 58 -- upvalues: u12 (val)
    local v1 = u12[p1]
    if not v1 then
        return error(string.format("Statistic %s not found", p1))
    end
    local priority = -1
    local value = nil
    for k, v in pairs(v1.modifiers) do
        if v.mode == "set" and priority < v.priority then
            priority = v.priority
            value = v.value
        end
    end
    return priority, value
end
local function ComputeBindingCallback(p1, p2, p3, p4) -- Line: 77 -- upvalues: GetHighestSetPriority (val)
    local default, v1
    v1, default = GetHighestSetPriority(p1)
    if default == nil then
        default = p2.default
    end
    for k, v in pairs(p2.modifiers) do
        if v1 < v.priority then
            if v.mode == "add" then
                default = default + v.value
            elseif v.mode == "subtract" then
                default = default - v.value
            elseif v.mode == "multiply" then
                default = default * v.value
            end
        end
    end
    if default ~= p2.value then
        p2.value = default
        p2.binding(p2.value, p3, p4)
    end
end
local function Adjust(p1, p2, p3, p4, p5, p6, p7) -- Line: 133 -- upvalues: u12 (val), ComputeBindingCallback (val)
    local v1 = u12[p1]
    if not v1 then
        return error(string.format("Statistic %s not found", p1))
    end
    if p3 == nil or p4 == nil then
        local v2 = tostring(p2 or "nil")
        local v3 = tostring(p3 or "nil")
        print("Failed to adjust statistic " .. p1 .. " with identifier " .. v2 .. " and value " .. v3 .. " and mode " .. tostring(p4 or "nil"))
        print(debug.traceback())
        return
    end
    v1.modifiers[p2] = {mode = p4, priority = p5, value = p3}
    if p2 == "default" then
        v1.value = p3
        return
    end
    ComputeBindingCallback(p1, v1, p6, p7)
end
return {
    Create = function(p1, p2) -- Line: 223 -- upvalues: u12 (val), Adjust (val)
        if u12[p1] then
            return error(string.format("Statistic %s already exists", p1))
        end
        u12[p1] = {
            key = p1,
            modifiers = {},
            value = p2,
            default = p2,
            binding = function(p1, p2) -- Line: 233
                error("Statistic %s has no binding")
            end,
        }
        Adjust(p1, "default", p2, "set", 0)
        return u12[p1]
    end,
    Adjust = Adjust,
    Remove = function(p1, p2, p3, p4) -- Line: 178 -- upvalues: u12 (val), ComputeBindingCallback (val)
        local v1 = u12[p1]
        if not v1 then
            return error(string.format("Statistic %s not found", p1))
        end
        v1.modifiers[p2] = nil
        ComputeBindingCallback(p1, v1, p3, p4)
    end,
    Bind = function(p1, p2) -- Line: 194 -- upvalues: u12 (val), Adjust (val)
        local u3 = u12[p1]
        if not u3 then
            return error(string.format("Statistic %s not found", p1))
        end
        u3.binding = p2
        return function() -- Line: 202 -- upvalues: u3 (val), p1 (val), Adjust (upval)
            function u3.binding() -- Line: 203 -- upvalues: p1 (upval)
                error(string.format("Statistic %s has no binding", p1))
            end
            u3.modifiers = {}
            u3.value = u3.default
            Adjust(p1, "default", u3.default, "set", 0)
        end
    end,
    Get = function(p1) -- Line: 214 -- upvalues: u12 (val)
        local v1 = u12[p1]
        if not v1 then
            return error(string.format("Statistic %s not found", p1))
        end
        return v1.value
    end,
    Reset = function(p1, p2) -- Line: 242 -- upvalues: u12 (val), Adjust (val)
        local v1 = u12[p1]
        if not v1 then
            return error(string.format("Statistic %s not found", p1))
        end
        local v2 = {}
        for k, v in pairs(v1.modifiers) do
            if table.find(p2, k) then
                v2[k] = v
            end
        end
        v1.modifiers = v2
        v1.value = v1.default
        Adjust(p1, "default", v1.default, "set", 0)
    end,
    Contains = function(p1, p2) -- Line: 124 -- upvalues: u12 (val)
        local v1 = u12[p1]
        if not v1 then
            return error(string.format("Statistic %s not found", p1))
        end
        local v2 = v1.modifiers[p2] ~= nil
        return v2
    end,
    ClearAll = function() -- Line: 267 -- upvalues: u12 (val), Adjust (val)
        for k, v in pairs(u12) do
            v.modifiers = {}
            v.value = v.default
            Adjust(k, "default", v.default, "set", 0)
            if v.binding and typeof(v.binding) == "function" then
                pcall(function() -- Line: 281 -- upvalues: v (val)
                    v.binding(v.default, nil, nil)
                end)
            end
        end
    end,
    __getStatisticsMap = function() -- Line: 263 -- upvalues: u12 (val)
        return u12
    end,
}