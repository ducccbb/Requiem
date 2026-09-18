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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Signal
--                              Dumped in 0.000673 seconds
--                          Bytecode version 9  |  18 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = nil
local function acquireRunnerThreadAndCallEventHandler(p1, ...) -- Line: 61 -- upvalues: u12 (ref)
    u12 = nil
    p1(...)
    u12 = u12
end
local function runEventHandlerInFreeThread() -- Line: 72 -- upvalues: acquireRunnerThreadAndCallEventHandler (val)
    while true do
        acquireRunnerThreadAndCallEventHandler(coroutine.yield())
    end
end
local u15 = {}
u15.__index = u15
function u15.new(p1, p2) -- Line: 87 -- upvalues: u15 (val)
    local v1 = {_connected = true, _next = false, _signal = p1, _fn = p2}
    return (setmetatable(v1, u15))
end
function u15:Disconnect() -- Line: 96
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
u15.Destroy = u15.Disconnect
setmetatable(u15, {
    __index = function(p1, p2) -- Line: 120
        local v1 = ("Attempt to get Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 123
        local v1 = ("Attempt to set Connection::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
local u25 = {ClassName = "Signal"}
u25.__index = u25
function u25.new() -- Line: 137 -- upvalues: u25 (val)
    local v1 = {_handlerListHead = false}
    return (setmetatable(v1, u25))
end
function u25.isSignal(p1) -- Line: 149 -- upvalues: u25 (val)
    local v1 = false
    if type(p1) == "table" then
        local v2 = getmetatable(p1)
        v1 = v2 == u25
    end
    return v1
end
function u25:Connect(p2) -- Line: 160 -- upvalues: u15 (val)
    local v1 = u15.new(self, p2)
    if not self._handlerListHead then
        self._handlerListHead = v1
        return v1
    end
    v1._next = self._handlerListHead
    self._handlerListHead = v1
    return v1
end
function u25.DisconnectAll(p1) -- Line: 179
    p1._handlerListHead = false
end
function u25.Fire(p1, ...) -- Line: 195 -- upvalues: u12 (ref), runEventHandlerInFreeThread (val)
    local _handlerListHead = p1._handlerListHead
    while _handlerListHead do
        if _handlerListHead._connected then
            if not u12 then
                u12 = coroutine.create(runEventHandlerInFreeThread)
                coroutine.resume(u12)
            end
            task.spawn(u12, _handlerListHead._fn, ...)
        end
        _handlerListHead = _handlerListHead._next
    end
end
function u25.Wait(p1) -- Line: 221
    local u2 = coroutine.running()
    local u3 = nil
    return coroutine.yield()
end
function u25.Once(p1, p2) -- Line: 242
    local u2 = nil
    u2 = p1:Connect(function(...) -- Line: 244 -- upvalues: u2 (ref), p2 (val)
        if u2._connected then
            u2:Disconnect()
        end
        p2(...)
    end)
    return u2
end
u25.Destroy = u25.DisconnectAll
setmetatable(u25, {
    __index = function(p1, p2) -- Line: 263
        local v1 = ("Attempt to get Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
    __newindex = function(p1, p2, p3) -- Line: 266
        local v1 = ("Attempt to set Signal::%s (not a valid member)"):format((tostring(p2)))
        error(v1, 2)
    end,
})
return u25