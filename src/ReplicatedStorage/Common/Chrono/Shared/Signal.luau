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
--                  File: ReplicatedStorage.Common.Chrono.Shared.Signal
--                              Dumped in 0.000738 seconds
--                          Bytecode version 9  |  19 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = nil
local function acquireRunnerThreadAndCallEventHandler(p1, ...) -- Line: 59 -- upvalues: u12 (ref)
    u12 = nil
    p1(...)
    u12 = u12
end
local function runEventHandlerInFreeThread() -- Line: 70 -- upvalues: acquireRunnerThreadAndCallEventHandler (val)
    while true do
        acquireRunnerThreadAndCallEventHandler(coroutine.yield())
    end
end
local u15 = {}
u15.__index = u15
function u15.new(p1, p2, p3) -- Line: 85 -- upvalues: u15 (val)
    local v1 = {
        _type_ = "Connection",
        Connected = true,
        _next = false,
        _signal = p1,
        _fn = p2,
        _defer = p3 or false,
    }
    return (setmetatable(v1, u15))
end
function u15:Disconnect() -- Line: 96
    local _handlerListHead
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
setmetatable(u15, {
    __index = function(p1, p2) -- Line: 118
        local v1 = ("Attempt to get Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 121
        local v1 = ("Attempt to set Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
local u24 = {}
u24.__index = u24
function u24.new() -- Line: 129 -- upvalues: u24 (val)
    local v1 = {_type_ = "Event", _handlerListHead = false}
    return (setmetatable(v1, u24))
end
function u24:Connect(p2) -- Line: 136 -- upvalues: u15 (val)
    local v1 = u15.new(self, p2)
    if not self._handlerListHead then
        self._handlerListHead = v1
        return v1
    end
    v1._next = self._handlerListHead
    self._handlerListHead = v1
    return v1
end
function u24.DisconnectAll(p1) -- Line: 149
    p1._handlerListHead = false
end
function u24.Wait(p1, p2) -- Line: 155
    local u3 = coroutine.running()
    local u4 = nil
    return coroutine.yield()
end
function u24.Once(p1, p2, p3) -- Line: 167
    local u3 = nil
    u3 = p1:Connect(function(...) -- Line: 169 -- upvalues: u3 (ref), p2 (val)
        if u3.Connected then
            u3:Disconnect()
        end
        p2(...)
    end, p3)
    return u3
end
local u30 = {}
u30.__index = u30
function u30.new() -- Line: 182 -- upvalues: u24 (val), u30 (val)
    local v1 = {_type_ = "Signal", Event = u24.new()}
    return (setmetatable(v1, u30))
end
function u30.DisconnectAll(p1) -- Line: 191
    p1.Event._handlerListHead = false
end
function u30.Fire(p1, ...) -- Line: 199 -- upvalues: u12 (ref), runEventHandlerInFreeThread (val)
    local _handlerListHead = p1.Event._handlerListHead
    while _handlerListHead do
        if _handlerListHead.Connected then
            if not _handlerListHead._defer then
                if not u12 then
                    u12 = coroutine.create(runEventHandlerInFreeThread)
                    coroutine.resume(u12)
                end
                task.spawn(u12, _handlerListHead._fn, ...)
            else
                task.defer(_handlerListHead._fn, ...)
            end
        end
        _handlerListHead = _handlerListHead._next
    end
end
setmetatable(u30, {
    __index = function(p1, p2) -- Line: 220
        local v1 = ("Attempt to get Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 223
        local v1 = ("Attempt to set Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
return u30