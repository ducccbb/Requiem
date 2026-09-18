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
--                    File: ReplicatedStorage.Common.Utilities.Signal
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  24 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = nil
local function acquireRunnerThreadAndCallEventHandler(p1, ...) -- Line: 51 -- upvalues: u12 (ref)
    u12 = nil
    p1(...)
    u12 = u12
end
local function runEventHandlerInFreeThread(...) -- Line: 62 -- upvalues: acquireRunnerThreadAndCallEventHandler (val)
    acquireRunnerThreadAndCallEventHandler(...)
    while true do
        acquireRunnerThreadAndCallEventHandler(coroutine.yield())
    end
end
local u15 = {}
u15.__index = u15
function u15:Disconnect() -- Line: 73
    local _handlerListHead
    if not self.Connected then
        return
    end
    self.Connected = false
    if self._signal._handlerListHead == self then
        self._signal._handlerListHead = self._next
        return
    end
    _handlerListHead = self._signal._handlerListHead
    while _handlerListHead do
        if _handlerListHead._next == self then
            break
        end
        _handlerListHead = _handlerListHead._next
    end
    if _handlerListHead then
        _handlerListHead._next = self._next
    end
end
u15.Destroy = u15.Disconnect
setmetatable(u15, {
    __index = function(p1, p2) -- Line: 100
        local v1 = ("Attempt to get Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 103
        local v1 = ("Attempt to set Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
local u24 = {}
u24.__index = u24
function u24.new() -- Line: 145 -- upvalues: u24 (val)
    local v1 = {_handlerListHead = false}
    return (setmetatable(v1, u24))
end
function u24.Wrap(p1) -- Line: 168 -- upvalues: u24 (val)
    local v1 = typeof(p1) == "RBXScriptSignal"
    assert(v1, "Argument #1 to Signal.Wrap must be a RBXScriptSignal; got " .. typeof(p1))
    local u17 = u24.new()
    u17._proxyHandler = p1:Connect(function(...) -- Line: 175 -- upvalues: u17 (val)
        u17:Fire(...)
    end)
    return u17
end
function u24.Is(p1) -- Line: 188 -- upvalues: u24 (val)
    local v1 = false
    if type(p1) == "table" then
        local v2 = getmetatable(p1)
        v1 = v2 == u24
    end
    return v1
end
function u24:Connect(p2) -- Line: 205 -- upvalues: u15 (val)
    local v1 = setmetatable({Connected = true, _next = false, _signal = self, _fn = p2}, u15)
    if not self._handlerListHead then
        self._handlerListHead = v1
        return v1
    end
    v1._next = self._handlerListHead
    self._handlerListHead = v1
    return v1
end
function u24.ConnectOnce(p1, p2) -- Line: 228
    return p1:Once(p2)
end
function u24:Once(p2) -- Line: 247
    local u2 = nil
    local u3 = false
    u2 = self:Connect(function(...) -- Line: 251 -- upvalues: u3 (ref), u2 (ref), p2 (val)
        if u3 then
            return
        end
        u3 = true
        u2:Disconnect()
        p2(...)
    end)
    return u2
end
function u24.GetConnections(p1) -- Line: 264
    local v1 = {}
    local _handlerListHead = p1._handlerListHead
    while _handlerListHead do
        table.insert(v1, _handlerListHead)
        _handlerListHead = _handlerListHead._next
    end
    return v1
end
function u24:DisconnectAll() -- Line: 284
    local _handlerListHead = self._handlerListHead
    while _handlerListHead do
        _handlerListHead.Connected = false
        _handlerListHead = _handlerListHead._next
    end
    self._handlerListHead = false
    local v1 = rawget(self, "_yieldedThreads")
    if v1 then
        local v2 = v1
        local v3 = nil
        local v4 = nil
        for i in v2, v3, v4 do
            if coroutine.status(i) == "suspended" then
                warn(debug.traceback(i, "signal disconnected; yielded thread cancelled", 2))
                task.cancel(i)
            end
        end
        table.clear(self._yieldedThreads)
    end
end
function u24:Fire(, ...) -- Line: 319 -- upvalues: u12 (ref), runEventHandlerInFreeThread (val)
    local _handlerListHead = self._handlerListHead
    while _handlerListHead do
        if _handlerListHead.Connected then
            if not u12 then
                u12 = coroutine.create(runEventHandlerInFreeThread)
            end
            task.spawn(u12, _handlerListHead._fn, ...)
        end
        _handlerListHead = _handlerListHead._next
    end
end
function u24.FireDeferred(p1, ...) -- Line: 340
    local _handlerListHead = p1._handlerListHead
    while _handlerListHead do
        local u3 = _handlerListHead
        task.defer(function(...) -- Line: 344 -- upvalues: u3 (val)
            if u3.Connected then
                u3._fn(...)
            end
        end, ...)
        _handlerListHead = _handlerListHead._next
    end
end
function u24.Wait(p1) -- Line: 353
    local u5 = rawget(p1, "_yieldedThreads")
    if not u5 then
        rawset(p1, "_yieldedThreads", {})
    end
    local u12 = coroutine.running()
    u5[u12] = true
    p1:Once(function(...) -- Line: 363 -- upvalues: u5 (ref), u12 (val)
        u5[u12] = nil
        task.spawn(u12, ...)
    end)
    return coroutine.yield()
end
function u24.Destroy(p1) -- Line: 383
    p1:DisconnectAll()
    local v1 = rawget(p1, "_proxyHandler")
    if v1 then
        v1:Disconnect()
    end
end
setmetatable(u24, {
    __index = function(p1, p2) -- Line: 394
        local v1 = ("Attempt to get Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 397
        local v1 = ("Attempt to set Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
return table.freeze({new = u24.new, Wrap = u24.Wrap, Is = u24.Is})