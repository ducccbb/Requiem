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
--             File: ReplicatedStorage.Common.Utilities.Ripple.createMotion
--                               Dumped in 0.00147 seconds
--                          Bytecode version 9  |  24 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local assign = require(v1.Parent.utils.assign)
local immediate = require(v1.Parent.solvers.immediate)
local intermediate = require(v1.Parent.utils.intermediate)
local linear = require(v1.Parent.solvers.linear)
local merge = require(v1.Parent.utils.merge)
local Signal = require(v1.Parent.Parent:WaitForChild("Signal"))
local spring = require(v1.Parent.solvers.spring)
local tween = require(v1.Parent.solvers.tween)
local shake = require(v1.Parent.solvers.shake)
require(v1.Parent.types)
local u69 = {start = false, heartbeat = RunService.Heartbeat}
return function(p1, p2) -- Line: 26 -- upvalues: merge (val), u69 (val), Signal (val), intermediate (val), assign (val), immediate (val), linear (val), spring (val), tween (val), shake (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    local u9 = merge(u69, v1)
    local u13 = typeof(p1)
    local u14 = {}
    local u15 = {}
    local u16 = {}
    local u17 = {}
    local u18 = 1
    local u19 = nil
    local u20 = false
    local u21 = nil
    local u24 = Signal.new()
    for i, j in intermediate.to(p1) do
        u14[i] = {complete = true, value = j}
    end
    local function stop() -- Line: 50 -- upvalues: u19 (ref)
        if u19 then
            u19:Disconnect()
            u19 = nil
        end
    end
    local v2 = {
        state = u14,
        onTargetChanged = u24,
        start = function(p1) -- Line: 57 -- upvalues: u19 (ref), stop (val), u9 (val)
            if u19 then
                return stop
            end
            u19 = u9.heartbeat:Connect(function(a1) -- Line: 62 -- upvalues: p1 (val)
                p1:step(a1)
            end)
            return stop
        end,
        stop = stop,
        get = function() -- Line: 69 -- upvalues: u14 (val), intermediate (upval), u13 (val)
            local v1 = {}
            local v2 = u14
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1[i] = j.value
            end
            return intermediate.from(v1, u13)
        end,
        set = function(p1, p2) -- Line: 89 -- upvalues: intermediate (upval), u14 (val)
            local v1
            local v2 = intermediate.to(p2)
            local v3 = u14
            local v4 = nil
            local v5 = nil
            for i, j in v3, v4, v5 do
                v1 = v2[i]
                if v1 then
                    j.value = v1
                    j.complete = false
                end
            end
        end,
        getVelocity = function() -- Line: 79 -- upvalues: u14 (val), intermediate (upval), u13 (val)
            local v1 = {}
            local v2 = u14
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1[i] = j.velocity or 0
            end
            return intermediate.from(v1, u13)
        end,
        setVelocity = function(p1, p2) -- Line: 141 -- upvalues: intermediate (upval), u14 (val)
            local v1
            local v2 = intermediate.to(p2)
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1 = u14[i]
                if v1 and v1.velocity then
                    v1.complete = false
                    v1.velocity = j
                end
            end
        end,
        impulse = function(p1, p2) -- Line: 113 -- upvalues: u14 (val), intermediate (upval)
            local v1, v2, v3
            if type(p2) == "number" then
                local v4 = u14
                v1 = nil
                v2 = nil
                for k, n in v4, v1, v2 do
                    if n.velocity then
                        n.complete = false
                        n.velocity = n.velocity + p2
                    end
                end
                return
            end
            v1 = intermediate.to(p2)
            v2 = nil
            local v5 = nil
            for i, j in v1, v2, v5 do
                v3 = u14[i]
                if v3 and v3.velocity then
                    v3.complete = false
                    v3.velocity = v3.velocity + j
                end
            end
        end,
        patch = function(p1, p2) -- Line: 102 -- upvalues: u14 (val), assign (upval)
            local v1
            local v2 = u14
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1 = p2[i]
                if v1 then
                    j.complete = false
                    assign(j, v1)
                end
            end
        end,
        to = function(p1, p2) -- Line: 156 -- upvalues: u14 (val), u15 (val), u24 (val)
            local v1, v2, v3, v4
            if type(p2) == "function" then
                v1 = u14
                v2 = nil
                v3 = nil
                for k, n in v1, v2, v3 do
                    if n.destructor then
                        n.destructor()
                        n.destructor = nil
                    end
                    n.complete = false
                    if v5(k, n, 0) ~= false then
                        u15[k] = v5
                    end
                end
                u24:Fire()
                return
            end
            v1 = p2
            v2 = nil
            v3 = nil
            for i, j in v1, v2, v3 do
                v4 = u14[i]
                if v4 then
                    if v4.destructor then
                        v4.destructor()
                        v4.destructor = nil
                    end
                    v4.complete = false
                    if j(i, v4, 0) ~= false then
                        u15[i] = j
                    end
                end
            end
            u24:Fire()
        end,
        immediate = function(p1, p2) -- Line: 199 -- upvalues: immediate (upval)
            p1:to(immediate(p2))
        end,
        linear = function(p1, p2, p3) -- Line: 203 -- upvalues: linear (upval)
            p1:to(linear(p2, p3))
        end,
        spring = function(p1, p2, p3) -- Line: 207 -- upvalues: spring (upval)
            p1:to(spring(p2, p3))
        end,
        tween = function(p1, p2, p3) -- Line: 211 -- upvalues: tween (upval)
            p1:to(tween(p2, p3))
        end,
        shake = function(p1, p2, p3) -- Line: 215 -- upvalues: shake (upval)
            p1:to(shake(p2, p3))
        end,
        step = function(p1, p2) -- Line: 219 -- upvalues: u15 (val), u14 (val), u20 (ref), u16 (val), u21 (ref), u17 (val)
            local v1, v2, v3
            local v4 = u15
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                v3 = u14[i]
                if v3 and not v3.complete then
                    j(i, v3, p2)
                end
            end
            v4 = p1:get()
            v5 = p1:isComplete()
            if not u20 then
                v6 = u16
                v1 = nil
                v2 = nil
                for k, n in v6, v1, v2 do
                    task.spawn(n, v4, p2)
                end
            end
            if v5 then
                if not u20 then
                    v6 = u17
                    v1 = nil
                    v2 = nil
                    for m, i5 in v6, v1, v2 do
                        task.spawn(i5, v4)
                    end
                elseif u21 == v4 then
                end
            end
            u20 = v5
            u21 = v4
            return v4
        end,
        isComplete = function() -- Line: 249 -- upvalues: u14 (val)
            local v1 = u14
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if not j.complete then
                    return false
                end
            end
            return true
        end,
        onComplete = function(p1, p2) -- Line: 259 -- upvalues: u18 (ref), u17 (val)
            local u2 = u18
            u18 = u18 + 1
            u17[u2] = p2
            return function() -- Line: 264 -- upvalues: u17 (upval), u2 (val)
                u17[u2] = nil
            end
        end,
        onStep = function(p1, p2) -- Line: 269 -- upvalues: u18 (ref), u16 (val)
            local u2 = u18
            u18 = u18 + 1
            u16[u2] = p2
            return function() -- Line: 274 -- upvalues: u16 (upval), u2 (val)
                u16[u2] = nil
            end
        end,
        destroy = function() -- Line: 279 -- upvalues: u20 (ref), u18 (ref), stop (val), u16 (val), u17 (val), u15 (val), u14 (val)
            u20 = false
            u18 = 1
            stop()
            table.clear(u16)
            table.clear(u17)
            table.clear(u15)
            local v1 = u14
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.destructor then
                    j.destructor()
                    j.destructor = nil
                end
            end
        end,
    }
    if u9.start then
        v2:start()
    end
    return v2
end