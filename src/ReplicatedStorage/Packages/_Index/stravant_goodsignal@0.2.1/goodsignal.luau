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
--     File: ReplicatedStorage.Packages._Index.stravant_goodsignal@0.2.1.goodsignal
--                              Dumped in 0.000597 seconds
--                          Bytecode version 9  |  17 functions

local u0 = nil
local function acquireRunnerThreadAndCallEventHandler(p1, ...) -- Line: 34 -- upvalues: u0 (ref)
    u0 = nil
    p1(...)
    u0 = u0
end
local function runEventHandlerInFreeThread() -- Line: 45 -- upvalues: acquireRunnerThreadAndCallEventHandler (val)
    while true do
        acquireRunnerThreadAndCallEventHandler(coroutine.yield())
    end
end
local u3 = {}
u3.__index = u3
function u3.new(p1, p2) -- Line: 60 -- upvalues: u3 (val)
    local v1 = {_connected = true, _next = false, _signal = p1, _fn = p2}
    return (setmetatable(v1, u3))
end
function u3:Disconnect() -- Line: 69
    local _handlerListHead
    self._connected = false
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
setmetatable(u3, {
    __index = function(p1, p2) -- Line: 91
        local v1 = ("Attempt to get Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 94
        local v1 = ("Attempt to set Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
local u12 = {}
u12.__index = u12
function u12.new() -- Line: 103 -- upvalues: u12 (val)
    local v1 = {_handlerListHead = false}
    return (setmetatable(v1, u12))
end
function u12:Connect(p2) -- Line: 109 -- upvalues: u3 (val)
    local v1 = u3.new(self, p2)
    if not self._handlerListHead then
        self._handlerListHead = v1
        return v1
    end
    v1._next = self._handlerListHead
    self._handlerListHead = v1
    return v1
end
function u12.DisconnectAll(p1) -- Line: 122
    p1._handlerListHead = false
end
function u12.Fire(p1, ...) -- Line: 130 -- upvalues: u0 (ref), runEventHandlerInFreeThread (val)
    local _handlerListHead = p1._handlerListHead
    while _handlerListHead do
        if _handlerListHead._connected then
            if not u0 then
                u0 = coroutine.create(runEventHandlerInFreeThread)
                coroutine.resume(u0)
            end
            task.spawn(u0, _handlerListHead._fn, ...)
        end
        _handlerListHead = _handlerListHead._next
    end
end
function u12.Wait(p1) -- Line: 147
    local u2 = coroutine.running()
    local u3 = nil
    return coroutine.yield()
end
function u12.Once(p1, p2) -- Line: 159
    local u2 = nil
    u2 = p1:Connect(function(...) -- Line: 161 -- upvalues: u2 (ref), p2 (val)
        if u2._connected then
            u2:Disconnect()
        end
        p2(...)
    end)
    return u2
end
setmetatable(u12, {
    __index = function(p1, p2) -- Line: 172
        local v1 = ("Attempt to get Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 175
        local v1 = ("Attempt to set Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
return u12