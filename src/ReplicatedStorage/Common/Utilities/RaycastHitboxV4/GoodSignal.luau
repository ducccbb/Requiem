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
--          File: ReplicatedStorage.Common.Utilities.RaycastHitboxV4.GoodSignal
--                              Dumped in 0.000647 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = nil
local function acquireRunnerThreadAndCallEventHandler(p1, ...) -- Line: 43 -- upvalues: u12 (ref)
    u12 = nil
    p1(...)
    u12 = u12
end
local function runEventHandlerInFreeThread(...) -- Line: 54 -- upvalues: acquireRunnerThreadAndCallEventHandler (val)
    acquireRunnerThreadAndCallEventHandler(...)
    while true do
        acquireRunnerThreadAndCallEventHandler(coroutine.yield())
    end
end
local u15 = {}
u15.__index = u15
function u15.new(p1, p2) -- Line: 65 -- upvalues: u15 (val)
    local v1 = {_connected = true, _next = false, _signal = p1, _fn = p2}
    return (setmetatable(v1, u15))
end
function u15:Disconnect() -- Line: 74
    local _handlerListHead
    assert(self._connected, "Can't disconnect a connection twice.")
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
setmetatable(u15, {
    __index = function(p1, p2) -- Line: 97
        local v1 = ("Attempt to get Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 100
        local v1 = ("Attempt to set Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
local u24 = {}
u24.__index = u24
function u24.new(p1) -- Line: 109 -- upvalues: u24 (val)
    local v1 = {_handlerListHead = false, _signalType = p1}
    return (setmetatable(v1, u24))
end
function u24:Connect(p2) -- Line: 116 -- upvalues: u15 (val)
    local v1 = u15.new(self, p2)
    if self._signalType ~= 1 or not self._handlerListHead then
        self._handlerListHead = v1
        return v1
    end
    v1._next = self._handlerListHead
    self._handlerListHead = v1
    return v1
end
function u24.Destroy(p1) -- Line: 131
    p1._handlerListHead = false
end
function u24.Fire(p1, ...) -- Line: 139 -- upvalues: u12 (ref), runEventHandlerInFreeThread (val)
    local _handlerListHead = p1._handlerListHead
    while _handlerListHead do
        if _handlerListHead._connected then
            if not u12 then
                u12 = coroutine.create(runEventHandlerInFreeThread)
            end
            task.spawn(u12, _handlerListHead._fn, ...)
        end
        _handlerListHead = _handlerListHead._next
    end
end
function u24.Wait(p1) -- Line: 154
    local u2 = coroutine.running()
    local u3 = nil
    return coroutine.yield()
end
setmetatable(u24, {
    __index = function(p1, p2) -- Line: 166
        local v1 = ("Attempt to get Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 169
        local v1 = ("Attempt to set Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
return u24