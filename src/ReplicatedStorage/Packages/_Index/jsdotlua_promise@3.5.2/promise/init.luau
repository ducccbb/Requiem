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
--        File: ReplicatedStorage.Packages._Index.jsdotlua_promise@3.5.2.promise
--                               Dumped in 0.00740 seconds
--                         Bytecode version 9  |  132 functions

local u0 = {__mode = "k"}
local function isCallable(p1) -- Line: 10
    if type(p1) == "function" then
        return true
    end
    if type(p1) ~= "table" then
        return false
    end
    local v1 = getmetatable(p1)
    if not v1 then
        return false
    end
    if type((rawget(v1, "__call"))) == "function" then
        return true
    end
    return false
end
local function makeEnum(p1, p2) -- Line: 28
    local v1 = {}
    for i, v in ipairs(p2) do
        v1[v] = v
    end
    local v2 = {
        __index = function(a1, p2) -- Line: 36 -- upvalues: p1 (val)
            local v1 = string.format("%s is not in %s!", p2, p1)
            error(v1, 2)
        end,
        __newindex = function() -- Line: 39 -- upvalues: p1 (val)
            local v1 = string.format("Creating new members in %s is not allowed!", p1)
            error(v1, 2)
        end,
    }
    return (setmetatable(v1, v2))
end
local v1 = {}
local v2 = {"ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut"}
v1.Kind = makeEnum("Promise.Error.Kind", v2)
local u13 = v1
u13.__index = u13
function u13.new(p1, p2) -- Line: 64 -- upvalues: u13 (ref)
    local v1 = p1
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    local v3 = {
        error = tostring(v2.error) or "[This error has no error text.]",
        trace = v2.trace,
        context = v2.context,
        kind = v2.kind,
        parent = p2,
        createdTick = os.clock(),
        createdTrace = debug.traceback(),
    }
    return (setmetatable(v3, u13))
end
function u13.is(p1) -- Line: 77
    if type(p1) ~= "table" then
        return false
    end
    local v1 = getmetatable(p1)
    if type(v1) ~= "table" then
        return false
    end
    local v2 = if rawget(p1, "error") ~= nil then type((rawget(v1, "extend"))) == "function" else false
    return v2
end
function u13.isKind(p1, p2) -- Line: 89 -- upvalues: u13 (ref)
    local v1 = p2 ~= nil
    assert(v1, "Argument #2 to Promise.Error.isKind must not be nil")
    local v2 = u13.is(p1)
    if v2 then
        v2 = p1.kind == p2
    end
    return v2
end
function u13:extend(p2) -- Line: 95 -- upvalues: u13 (ref)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    local kind = v2.kind
    if not kind then
        kind = self.kind
    end
    v2.kind = kind
    return u13.new(v2, self)
end
function u13.getErrorChain(p1) -- Line: 103
    local v1 = {p1}
    while v1[#v1].parent do
        table.insert(v1, v1[#v1].parent)
    end
    return v1
end
function u13.__tostring(p1) -- Line: 113
    local trace, v1
    local v2 = {string.format("-- Promise.Error(%s) --", p1.kind or "?")}
    for i, v in ipairs(p1:getErrorChain()) do
        v1 = {}
        trace = v.trace
        if not trace then
            trace = v.error
        end
        v1[1] = trace
        v1[2] = v.context
        table.insert(v2, table.concat(v1, "\n"))
    end
    return table.concat(v2, "\n")
end
local function pack(...) -- Line: 137
    local v1 = select("#", ...)
    return v1, {...}
end
local function packResult(p1, ...) -- Line: 144
    local v1 = select("#", ...)
    return p1, v1, {...}
end
local function makeErrorHandler(p1) -- Line: 148 -- upvalues: u13 (ref)
    local v1 = p1 ~= nil
    assert(v1, "traceback is nil")
    return function(a1) -- Line: 151 -- upvalues: u13 (upval), p1 (val)
        if type(a1) == "table" then
            return a1
        end
        local v1 = {error = a1, kind = u13.Kind.ExecutionError}
        local v2 = tostring(a1)
        v1.trace = debug.traceback(v2, 2)
        v1.context = "Promise created at:\n\n" .. p1
        return u13.new(v1)
    end
end
local function runExecutor(p1, p2, ...) -- Line: 171 -- upvalues: packResult (val), u13 (ref)
    local v1 = p1 ~= nil
    assert(v1, "traceback is nil")
    return packResult(xpcall(p2, function(a1) -- Line: 151 -- upvalues: u13 (upval), p1 (val)
        if type(a1) == "table" then
            return a1
        end
        local v1 = {error = a1, kind = u13.Kind.ExecutionError}
        local v2 = tostring(a1)
        v1.trace = debug.traceback(v2, 2)
        v1.context = "Promise created at:\n\n" .. p1
        return u13.new(v1)
    end, ...))
end
local function createAdvancer(p1, p2, p3, p4) -- Line: 179 -- upvalues: runExecutor (val)
    return function(...) -- Line: 180 -- upvalues: runExecutor (upval), p1 (val), p2 (val), p3 (val), p4 (val)
        local v1, v2, v3
        v1, v2, v3 = runExecutor(p1, p2, ...)
        if v1 then
            p3(unpack(v3, 1, v2))
            return
        end
        p4(v3[1])
    end
end
local function isEmpty(p1) -- Line: 191
    local v1 = next(p1) == nil
    return v1
end
local u26 = {Error = u13}
local v3 = {"Started", "Resolved", "Rejected", "Cancelled"}
u26.Status = makeEnum("Promise.Status", v3)
u26._getTime = os.clock
u26._timeEvent = game:GetService("RunService").Heartbeat
u26._unhandledRejectionCallbacks = {}
u26.prototype = {}
u26.__index = u26.prototype
function u26._new(p1, p2, p3) -- Line: 230 -- upvalues: u26 (val), u0 (val), runExecutor (val)
    if p3 ~= nil and not (u26.is(p3)) then
        error("Argument #2 to Promise.new must be a promise or nil", 2)
    end
    local u11 = {
        _valuesLength = -1,
        _unhandledRejection = true,
        _source = p1,
        _status = u26.Status.Started,
        _queuedResolve = {},
        _queuedReject = {},
        _queuedFinally = {},
        _parent = p3,
        _consumers = setmetatable({}, u0),
    }
    if p3 and p3._status == u26.Status.Started then
        p3._consumers[u11] = true
    end
    setmetatable(u11, u26)
    local function resolve(...) -- Line: 278 -- upvalues: u11 (val)
        u11:_resolve(...)
    end
    local function reject(...) -- Line: 282 -- upvalues: u11 (val)
        u11:_reject(...)
    end
    local function onCancel(p1) -- Line: 286 -- upvalues: u11 (val), u26 (upval)
        if p1 then
            if u11._status ~= u26.Status.Cancelled then
                u11._cancellationHook = p1
            else
                p1()
            end
        end
        local v1 = u11._status == u26.Status.Cancelled
        return v1
    end
    u11._thread = coroutine.create(function() -- Line: 298 -- upvalues: runExecutor (upval), u11 (val), p2 (val), resolve (val), reject (val), onCancel (val)
        local v1, v2
        v1, _, v2 = runExecutor(u11._source, p2, resolve, reject, onCancel)
        if not v1 then
            reject(v2[1])
        end
    end)
    task.spawn(u11._thread)
    return u11
end
function u26.new(p1) -- Line: 349 -- upvalues: u26 (val)
    local v1 = debug.traceback(nil, 2)
    return u26._new(v1, p1)
end
function u26.__tostring(p1) -- Line: 353
    return string.format("Promise(%s)", p1._status)
end
function u26.defer(p1) -- Line: 375 -- upvalues: u26 (val), runExecutor (val)
    local u4 = debug.traceback(nil, 2)
    return (u26._new(u4, function(a1, p2, p3) -- Line: 378 -- upvalues: u26 (upval), runExecutor (upval), u4 (val), p1 (val)
    local u3, v1, v2
    u3 = nil
    return
end))
end
u26.async = u26.defer
function u26.resolve(...) -- Line: 418 -- upvalues: pack (val), u26 (val)
    local u2, u3
    u2, u3 = pack(...)
    local v1 = debug.traceback(nil, 2)
    return u26._new(v1, function(p1) -- Line: 420 -- upvalues: u3 (val), u2 (val)
        p1(unpack(u3, 1, u2))
    end)
end
function u26.reject(...) -- Line: 435 -- upvalues: pack (val), u26 (val)
    local u2, u3
    u2, u3 = pack(...)
    local v1 = debug.traceback(nil, 2)
    return u26._new(v1, function(p1, p2) -- Line: 437 -- upvalues: u3 (val), u2 (val)
        p2(unpack(u3, 1, u2))
    end)
end
function u26._try(p1, p2, ...) -- Line: 446 -- upvalues: pack (val), u26 (val)
    local u4, u5
    u4, u5 = pack(...)
    return u26._new(p1, function(p1) -- Line: 449 -- upvalues: p2 (val), u5 (val), u4 (val)
        p1(p2(unpack(u5, 1, u4)))
    end)
end
function u26.try(p1, ...) -- Line: 477 -- upvalues: u26 (val)
    local v1 = debug.traceback(nil, 2)
    return u26._try(v1, p1, ...)
end
function u26._all(p1, p2, p3) -- Line: 486 -- upvalues: u26 (val)
    local v1
    if type(p2) ~= "table" then
        local v2 = string.format("Please pass a list of promises to %s", "Promise.all")
        error(v2, 3)
    end
    for k, v in pairs(p2) do
        if not (u26.is(v)) then
            v1 = string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(k)))
            error(v1, 3)
        end
    end
    if #p2 == 0 or p3 == 0 then
        return u26.resolve({})
    end
    return u26._new(p1, function(p1, a2, a3) -- Line: 504 -- upvalues: p3 (val), p2 (val)
        local u3 = {}
        local u4 = {}
        local u5 = 0
        local u6 = 0
        local u7 = false
        local function resolveOne(a1, ...) -- Line: 522 -- upvalues: u7 (ref), u5 (ref), p3 (upval), u3 (val), p2 (upval), p1 (val), u4 (val)
            if u7 then
                return
            end
            u5 = u5 + 1
            if p3 ~= nil then
                u3[u5] = ...
            else
                u3[a1] = ...
            end
            local v1 = p3
            if not v1 then
                v1 = #p2
            end
            if v1 <= u5 then
                u7 = true
                p1(u3)
                for i, v in ipairs(u4) do
                    v:cancel()
                end
            end
        end
        a3(function() -- Line: 515 -- upvalues: u4 (val)
            for i, v in ipairs(u4) do
                v:cancel()
            end
        end)
        for i, v in ipairs(p2) do
            u4[i] = v:andThen(function(...) -- Line: 547 -- upvalues: resolveOne (val), i (val)
                resolveOne(i, ...)
            end, function(...) -- Line: 549 -- upvalues: u6 (ref), p3 (upval), p2 (upval), u4 (val), u7 (ref), a2 (val)
                u6 = u6 + 1
                if p3 == nil then
                    for i, v in ipairs(u4) do
                        v:cancel()
                    end
                    u7 = true
                    a2(...)
                else
                    local v1 = #p2 - u6
                    if v1 >= p3 then end
                end
            end)
        end
        if u7 then
            for i2, i3 in ipairs(u4) do
                i3:cancel()
            end
        end
    end)
end
function u26.all(...) -- Line: 591 -- upvalues: u26 (val)
    local v1 = {...}
    if type(v1[1]) == "table" and not (u26.is(v1[1])) then
        v1 = v1[1]
    end
    local v2 = debug.traceback(nil, 2)
    return u26._all(v2, v1)
end
function u26.fold(p1, p2, p3) -- Line: 628 -- upvalues: u26 (val)
    local v1 = type(p1) == "table"
    assert(v1, "Bad argument #1 to Promise.fold: must be a table")
    if type(p2) == "function" then
        v1 = true
    elseif type(p2) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p2)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, "Bad argument #2 to Promise.fold: must be a function")
    local u41 = u26.resolve(p3)
    v1 = u26.each(p1, function(p1, a2) -- Line: 633 -- upvalues: u41 (ref), p2 (val)
        u41 = u41:andThen(function(a1) -- Line: 634 -- upvalues: p2 (upval), p1 (val), a2 (val)
            return p2(a1, p1, a2)
        end)
    end)
    return v1:andThen(function() -- Line: 637 -- upvalues: u41 (ref)
        return u41
    end)
end
function u26.some(p1, p2) -- Line: 661 -- upvalues: u26 (val)
    local v1 = type(p2) == "number"
    assert(v1, "Bad argument #2 to Promise.some: must be a number")
    v1 = debug.traceback(nil, 2)
    return u26._all(v1, p1, p2)
end
function u26.any(p1) -- Line: 685 -- upvalues: u26 (val)
    local v1 = debug.traceback(nil, 2)
    local v2 = u26._all(v1, p1, 1)
    return v2:andThen(function(p1) -- Line: 686
        return p1[1]
    end)
end
function u26.allSettled(p1) -- Line: 707 -- upvalues: u26 (val)
    local v1, v2
    if type(p1) ~= "table" then
        v1 = string.format("Please pass a list of promises to %s", "Promise.allSettled")
        error(v1, 2)
    end
    for k, v in pairs(p1) do
        if not (u26.is(v)) then
            v2 = string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(k)))
            error(v2, 2)
        end
    end
    if #p1 == 0 then
        return u26.resolve({})
    end
    v1 = debug.traceback(nil, 2)
    return u26._new(v1, function(a1, p2, p3) -- Line: 725 -- upvalues: p1 (val)
        local u3 = {}
        local u4 = {}
        local u5 = 0
        local function resolveOne(a1_2, ...) -- Line: 735 -- upvalues: u5 (ref), u3 (val), p1 (upval), a1 (val)
            u5 = u5 + 1
            u3[a1_2] = ...
            if #p1 <= u5 then
                a1(u3)
            end
        end
        p3(function() -- Line: 745 -- upvalues: u4 (val)
            for i, v in ipairs(u4) do
                v:cancel()
            end
        end)
        for i, v in ipairs(p1) do
            u4[i] = v:finally(function(...) -- Line: 754 -- upvalues: resolveOne (val), i (val)
                resolveOne(i, ...)
            end)
        end
    end)
end
function u26.race(p1) -- Line: 785 -- upvalues: u26 (val)
    local v1
    local v2 = type(p1) == "table"
    assert(v2, string.format("Please pass a list of promises to %s", "Promise.race"))
    for k, v in pairs(p1) do
        v1 = u26.is(v)
        assert(v1, string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(k))))
    end
    v2 = debug.traceback(nil, 2)
    return u26._new(v2, function(a1, p2, p3) -- Line: 792 -- upvalues: p1 (val)
        local u3 = {}
        local u4 = false
        local function cancel() -- Line: 796 -- upvalues: u3 (val)
            for i, v in ipairs(u3) do
                v:cancel()
            end
        end
        local function finalize(p1) -- Line: 802 -- upvalues: u3 (val), u4 (ref)
            return function(...) -- Line: 803 -- upvalues: u3 (upval), u4 (upval), p1 (val)
                for i, v in ipairs(u3) do
                    v:cancel()
                end
                u4 = true
                return p1(...)
            end
        end
        if p3(function(...) -- Line: 803 -- upvalues: u3 (val), u4 (ref), p2 (val)
    local v1, v2, v3, v4
    for i, v in ipairs(u3) do
        v:cancel()
    end
    u4 = true
    return p2(...)
end) then
            return
        end
        for i, v in ipairs(p1) do
            u3[i] = v:andThen(function(...) -- Line: 803 -- upvalues: u3 (val), u4 (ref), a1 (val)
                for i, v in ipairs(u3) do
                    v:cancel()
                end
                u4 = true
                return a1(...)
            end, function(...) -- Line: 803 -- upvalues: u3 (val), u4 (ref), p2 (val)
                for i, v in ipairs(u3) do
                    v:cancel()
                end
                u4 = true
                return p2(...)
            end)
        end
        if u4 then
            for i2, i3 in ipairs(u3) do
                i3:cancel()
            end
        end
    end)
end
function u26.each(p1, p2) -- Line: 880 -- upvalues: u26 (val), u13 (ref)
    local v1 = type(p1) == "table"
    assert(v1, string.format("Please pass a list of promises to %s", "Promise.each"))
    if type(p2) == "function" then
        v1 = true
    elseif type(p2) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p2)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, string.format("Please pass a handler function to %s!", "Promise.each"))
    v1 = debug.traceback(nil, 2)
    return u26._new(v1, function(a1, a2, p3) -- Line: 884 -- upvalues: p1 (val), u26 (upval), u13 (upval), p2 (val)
        local v1, v2, v3
        local v4 = {}
        local u85 = {}
        local u5 = false
        local function cancel() -- Line: 890 -- upvalues: u85 (val)
            for i, v in ipairs(u85) do
                v:cancel()
            end
        end
        p3(function() -- Line: 896 -- upvalues: u5 (ref), u85 (val)
            u5 = true
            for i, v in ipairs(u85) do
                v:cancel()
            end
        end)
        local v5 = {}
        for i, v in ipairs(p1) do
            if not (u26.is(v)) then
                v5[i] = v
            else
                v1 = v:getStatus()
                if v1 == u26.Status.Cancelled then
                    for i4, j in ipairs(u85) do
                        j:cancel()
                    end
                    return a2(u13.new({error = "Promise is cancelled", kind = u13.Kind.AlreadyCancelled, context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", i, v._source)}))
                end
                v1 = v:getStatus()
                if v1 == u26.Status.Rejected then
                    for i2, i3 in ipairs(u85) do
                        i3:cancel()
                    end
                    return a2(select(2, v:await()))
                end
                v1 = v:andThen(function(...) -- Line: 929
                    return ...
                end)
                table.insert(u85, v1)
                v5[i] = v1
            end
        end
        for i5, k in ipairs(v5) do
            if u26.is(k) then
                v2, v3 = k:await()
                k = v3
                if not v2 then
                    for i6, n in ipairs(u85) do
                        n:cancel()
                    end
                    return v6(k)
                end
            end
            if u5 then
                return
            end
            v1 = u26.resolve(p2(k, i5))
            table.insert(u85, v1)
            v2, v3 = v1:await()
            if not v2 then
                for i7, m in ipairs(u85) do
                    m:cancel()
                end
                return v6(v3)
            end
            v4[i5] = v3
        end
        a1(v4)
    end)
end
function u26.is(p1) -- Line: 979 -- upvalues: u26 (val)
    local v1, v2
    if type(p1) ~= "table" then
        return false
    end
    local v3 = getmetatable(p1)
    if v3 == u26 then
        return true
    end
    if v3 == nil then
        local andThen = p1.andThen
        if type(andThen) == "function" then
            return true
        end
        if type(andThen) ~= "table" then
            return false
        end
        v2 = getmetatable(andThen)
        if not v2 then
            return false
        end
        if type((rawget(v2, "__call"))) == "function" then
            return true
        end
        return false
    end
    if type(v3) ~= "table" or type((rawget(v3, "__index"))) ~= "table" then
        return false
    end
    v2 = rawget(v3, "__index")
    local v4 = rawget(v2, "andThen")
    if type(v4) == "function" then
        v1 = true
    elseif type(v4) ~= "table" then
        v1 = false
    else
        v2 = getmetatable(v4)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    if v1 then
        return true
    end
    return false
end
function u26.promisify(p1) -- Line: 1028 -- upvalues: u26 (val)
    return function(...) -- Line: 1029 -- upvalues: u26 (upval), p1 (val)
        local v1 = debug.traceback(nil, 2)
        return u26._try(v1, p1, ...)
    end
end
local timeout = nil
local prototype = nil
function u26.delay(p1) -- Line: 1059 -- upvalues: u26 (val), prototype (ref), timeout (ref)
    local u12
    local v1 = type(p1) == "number"
    assert(v1, "Bad argument #1 to Promise.delay, must be a number.")
    if 0.016666666666666666 > p1 then
        u12 = 0.016666666666666666
    elseif p1 ~= (1 / 0) then
        u12 = p1
    else
        u12 = 0.016666666666666666
    end
    v1 = debug.traceback(nil, 2)
    return u26._new(v1, function(p1, p2, p3) -- Line: 1067 -- upvalues: u26 (upval), u12 (ref), prototype (upval), timeout (upval)
        local next
        local v1 = u26._getTime()
        local v2 = v1 + u12
        local u8 = {resolve = p1, startTime = v1, endTime = v2}
        if prototype == nil then
            timeout = u8
            prototype = u26._timeEvent:Connect(function() -- Line: 1079 -- upvalues: u26 (upval), timeout (upval), prototype (upval)
                local v1
                local v2 = u26._getTime()
                while timeout ~= nil do
                    if timeout.endTime >= v2 then
                        break
                    end
                    v1 = timeout
                    timeout = v1.next
                    if timeout ~= nil then
                        timeout.previous = nil
                    else
                        prototype:Disconnect()
                        prototype = nil
                    end
                    v1.resolve(u26._getTime() - v1.startTime)
                end
            end)
        elseif timeout.endTime >= v2 then
            u8.next = timeout
            timeout.previous = u8
            timeout = u8
        else
            local v3 = timeout
            next = v3.next
            while next ~= nil do
                if next.endTime >= v2 then
                    break
                end
                next = next.next
            end
            v3.next = u8
            u8.previous = v3
            if next ~= nil then
                u8.next = next
                next.previous = u8
            end
        end
        p3(function() -- Line: 1124 -- upvalues: u8 (val), timeout (upval), prototype (upval)
            local next = u8.next
            if timeout ~= u8 then
                local previous = u8.previous
                previous.next = next
                if next ~= nil then
                    next.previous = previous
                end
                return
            end
            if next ~= nil then
                next.previous = nil
            else
                prototype:Disconnect()
                prototype = nil
            end
            timeout = next
        end)
    end)
end
function timeout(p1, p2, p3) -- Line: 1188 -- upvalues: u26 (val), u13 (ref)
    local u6 = debug.traceback(nil, 2)
    local v1 = {}
    local v2 = u26.delay(p2):andThen(function() -- Line: 1192 -- upvalues: u26 (upval), p3 (val), u13 (upval), p2 (val), u6 (val)
        local v1
        local reject = u26.reject
        if p3 ~= nil then
            v1 = p3
        else
            v1 = u13.new({error = "Timed out", kind = u13.Kind.TimedOut, context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p2, u6)})
            if not v1 then
                v1 = p3
            end
        end
        return reject(v1)
    end)
    v1[1] = v2
    v1[2] = p1
    return u26.race(v1)
end
prototype = u26.prototype
prototype.timeout = timeout
function timeout(self) -- Line: 1212
    return self._status
end
prototype = u26.prototype
prototype.getStatus = timeout
function timeout(self, p2, p3, p4) -- Line: 1221 -- upvalues: u26 (val), runExecutor (val), u13 (ref)
    self._unhandledRejection = false
    return u26._new(p2, function(p1, a2) -- Line: 1225 -- upvalues: p3 (val), p2 (val), runExecutor (upval), p4 (val), self (val), u26 (upval), u13 (upval)
        local v1 = p1
        if p3 then
            local u4 = p2
            local u5 = p3
            function v1(...) -- Line: 180 -- upvalues: runExecutor (upval), u4 (val), u5 (val), p1 (val), a2 (val)
                local v1, v2, v3
                v1, v2, v3 = runExecutor(u4, u5, ...)
                if v1 then
                    p1(unpack(v3, 1, v2))
                    return
                end
                a2(v3[1])
            end
        end
        local v2 = a2
        if p4 then
            local u10 = p2
            local u11 = p4
            function v2(...) -- Line: 180 -- upvalues: runExecutor (upval), u10 (val), u11 (val), p1 (val), a2 (val)
                local v1, v2, v3
                v1, v2, v3 = runExecutor(u10, u11, ...)
                if v1 then
                    p1(unpack(v3, 1, v2))
                    return
                end
                a2(v3[1])
            end
        end
        if self._status == u26.Status.Started then
            table.insert(self._queuedResolve, v1)
            table.insert(self._queuedReject, v2)
            return
        end
        if self._status == u26.Status.Resolved then
            v1(unpack(self._values, 1, self._valuesLength))
            return
        end
        if self._status == u26.Status.Rejected then
            v2(unpack(self._values, 1, self._valuesLength))
            return
        end
        if self._status == u26.Status.Cancelled then
            a2(u13.new({error = "Promise is cancelled", kind = u13.Kind.AlreadyCancelled, context = "Promise created at\n\n" .. p2}))
        end
    end, self)
end
prototype = u26.prototype
prototype._andThen = timeout
function timeout(self, p2, p3) -- Line: 1282
    local v1
    local v2 = true
    if p2 ~= nil then
        if type(p2) == "function" then
            v2 = true
        elseif type(p2) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p2)
            if v1 and type((rawget(v1, "__call"))) == "function" then
                v2 = true
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:andThen"))
    v2 = true
    if p3 ~= nil then
        if type(p3) == "function" then
            v2 = true
        elseif type(p3) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p3)
            if not v1 then
                v2 = false
            else
                v2 = not (type((rawget(v1, "__call"))) ~= "function")
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:andThen"))
    v1 = debug.traceback(nil, 2)
    return self:_andThen(v1, p2, p3)
end
prototype = u26.prototype
prototype.andThen = timeout
function timeout(p1, p2, p3) -- Line: 1310 -- upvalues: pack (val), u26 (val)
    local v1
    local v2 = true
    if p2 ~= nil then
        if type(p2) == "function" then
            v2 = true
        elseif type(p2) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p2)
            if v1 and type((rawget(v1, "__call"))) == "function" then
                v2 = true
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
    v2 = true
    if p3 ~= nil then
        if type(p3) == "function" then
            v2 = true
        elseif type(p3) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p3)
            if not v1 then
                v2 = false
            else
                v2 = not (type((rawget(v1, "__call"))) ~= "function")
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
    v1 = debug.traceback(nil, 2)
    local v3 = p1:_andThen(v1, function(...) -- Line: 1317 -- upvalues: pack (upval), u26 (upval)
        local u2, u3
        u2, u3 = pack(...)
        return u26.defer(function(p1) -- Line: 1319 -- upvalues: u3 (val), u2 (val)
            p1(unpack(u3, 1, u2))
        end)
    end, function(...) -- Line: 1323 -- upvalues: pack (upval), u26 (upval)
        local u2, u3
        u2, u3 = pack(...)
        return u26.defer(function(p1, p2) -- Line: 1325 -- upvalues: u3 (val), u2 (val)
            p2(unpack(u3, 1, u2))
        end)
    end)
    return v3:andThen(p2, p3)
end
prototype = u26.prototype
prototype.andThenAsync = timeout
function timeout(self, p2) -- Line: 1352
    local v1
    local v2 = true
    if p2 ~= nil then
        if type(p2) == "function" then
            v2 = true
        elseif type(p2) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p2)
            if not v1 then
                v2 = false
            else
                v2 = not (type((rawget(v1, "__call"))) ~= "function")
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:catch"))
    v1 = debug.traceback(nil, 2)
    return self:_andThen(v1, nil, p2)
end
prototype = u26.prototype
prototype.catch = timeout
function timeout(p1, p2) -- Line: 1373 -- upvalues: u26 (val), pack (val)
    local v1, v2
    if type(p2) == "function" then
        v1 = true
    elseif type(p2) ~= "table" then
        v1 = false
    else
        v2 = getmetatable(p2)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, string.format("Please pass a handler function to %s!", "Promise:tap"))
    v2 = debug.traceback(nil, 2)
    return p1:_andThen(v2, function(...) -- Line: 1375 -- upvalues: p2 (val), u26 (upval), pack (upval)
        local u10, u9
        local v1 = p2(...)
        if not (u26.is(v1)) then
            return ...
        end
        u9, u10 = pack(...)
        return v1:andThen(function() -- Line: 1380 -- upvalues: u10 (val), u9 (val)
            return unpack(u10, 1, u9)
        end)
    end)
end
prototype = u26.prototype
prototype.tap = timeout
function timeout(p1, p2, ...) -- Line: 1408 -- upvalues: pack (val)
    local u29, u30, v1
    if type(p2) == "function" then
        v1 = true
    elseif type(p2) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p2)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, string.format("Please pass a handler function to %s!", "Promise:andThenCall"))
    u29, u30 = pack(...)
    local v3 = debug.traceback(nil, 2)
    return p1:_andThen(v3, function() -- Line: 1411 -- upvalues: p2 (val), u30 (val), u29 (val)
        return p2(unpack(u30, 1, u29))
    end)
end
prototype = u26.prototype
prototype.andThenCall = timeout
function timeout(p1, ...) -- Line: 1438 -- upvalues: pack (val)
    local u3, u4
    u3, u4 = pack(...)
    local v1 = debug.traceback(nil, 2)
    return p1:_andThen(v1, function() -- Line: 1440 -- upvalues: u4 (val), u3 (val)
        return unpack(u4, 1, u3)
    end)
end
prototype = u26.prototype
prototype.andThenReturn = timeout
function timeout(self) -- Line: 1456 -- upvalues: u26 (val)
    if self._status ~= u26.Status.Started then
        return
    end
    self._status = u26.Status.Cancelled
    if self._cancellationHook then
        self._cancellationHook()
    end
    coroutine.close(self._thread)
    if self._parent then
        self._parent:_consumerCancelled(self)
    end
    for k in pairs(self._consumers) do
        k:cancel()
    end
    self:_finalize()
end
prototype = u26.prototype
prototype.cancel = timeout
function timeout(self, p2) -- Line: 1484 -- upvalues: u26 (val)
    if self._status ~= u26.Status.Started then
        return
    end
    self._consumers[p2] = nil
    if next(self._consumers) == nil then
        self:cancel()
    end
end
prototype = u26.prototype
prototype._consumerCancelled = timeout
function timeout(self, p2, p3, p4) -- Line: 1500 -- upvalues: u26 (val), runExecutor (val)
    if not p4 then
        self._unhandledRejection = false
    end
    return u26._new(p2, function(p1, a2) -- Line: 1506 -- upvalues: p3 (val), p2 (val), runExecutor (upval), p4 (val), self (val), u26 (upval)
        local v1 = p1
        if p3 then
            local u4 = p2
            local u5 = p3
            function v1(...) -- Line: 180 -- upvalues: runExecutor (upval), u4 (val), u5 (val), p1 (val), a2 (val)
                local v1, v2, v3
                v1, v2, v3 = runExecutor(u4, u5, ...)
                if v1 then
                    p1(unpack(v3, 1, v2))
                    return
                end
                a2(v3[1])
            end
        end
        if p4 then
            local u9 = v1
            function v1(...) -- Line: 1514 -- upvalues: self (upval), u26 (upval), p1 (val), u9 (val)
                if self._status == u26.Status.Rejected then
                    return p1(self)
                end
                return u9(...)
            end
        end
        if self._status == u26.Status.Started then
            table.insert(self._queuedFinally, v1)
            return
        end
        v1(self._status)
    end, self)
end
prototype = u26.prototype
prototype._finally = timeout
function timeout(self, p2) -- Line: 1582
    local v1
    local v2 = true
    if p2 ~= nil then
        if type(p2) == "function" then
            v2 = true
        elseif type(p2) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p2)
            if not v1 then
                v2 = false
            else
                v2 = not (type((rawget(v1, "__call"))) ~= "function")
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:finally"))
    v1 = debug.traceback(nil, 2)
    return self:_finally(v1, p2)
end
prototype = u26.prototype
prototype.finally = timeout
function timeout(p1, p2, ...) -- Line: 1596 -- upvalues: pack (val)
    local u29, u30, v1
    if type(p2) == "function" then
        v1 = true
    elseif type(p2) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p2)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, string.format("Please pass a handler function to %s!", "Promise:finallyCall"))
    u29, u30 = pack(...)
    local v3 = debug.traceback(nil, 2)
    return p1:_finally(v3, function() -- Line: 1599 -- upvalues: p2 (val), u30 (val), u29 (val)
        return p2(unpack(u30, 1, u29))
    end)
end
prototype = u26.prototype
prototype.finallyCall = timeout
function timeout(p1, ...) -- Line: 1622 -- upvalues: pack (val)
    local u3, u4
    u3, u4 = pack(...)
    local v1 = debug.traceback(nil, 2)
    return p1:_finally(v1, function() -- Line: 1624 -- upvalues: u4 (val), u3 (val)
        return unpack(u4, 1, u3)
    end)
end
prototype = u26.prototype
prototype.finallyReturn = timeout
function timeout(p1, p2) -- Line: 1632
    local v1
    local v2 = true
    if p2 ~= nil then
        if type(p2) == "function" then
            v2 = true
        elseif type(p2) ~= "table" then
            v2 = false
        else
            v1 = getmetatable(p2)
            if not v1 then
                v2 = false
            else
                v2 = not (type((rawget(v1, "__call"))) ~= "function")
            end
        end
    end
    assert(v2, string.format("Please pass a handler function to %s!", "Promise:done"))
    v1 = debug.traceback(nil, 2)
    return p1:_finally(v1, p2, true)
end
prototype = u26.prototype
prototype.done = timeout
function timeout(p1, p2, ...) -- Line: 1643 -- upvalues: pack (val)
    local u29, u30, v1
    if type(p2) == "function" then
        v1 = true
    elseif type(p2) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p2)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, string.format("Please pass a handler function to %s!", "Promise:doneCall"))
    u29, u30 = pack(...)
    local v3 = debug.traceback(nil, 2)
    return p1:_finally(v3, function() -- Line: 1646 -- upvalues: p2 (val), u30 (val), u29 (val)
        return p2(unpack(u30, 1, u29))
    end, true)
end
prototype = u26.prototype
prototype.doneCall = timeout
function timeout(p1, ...) -- Line: 1654 -- upvalues: pack (val)
    local u3, u4
    u3, u4 = pack(...)
    local v1 = debug.traceback(nil, 2)
    return p1:_finally(v1, function() -- Line: 1656 -- upvalues: u4 (val), u3 (val)
        return unpack(u4, 1, u3)
    end, true)
end
prototype = u26.prototype
prototype.doneReturn = timeout
function timeout(self) -- Line: 1668 -- upvalues: u26 (val)
    self._unhandledRejection = false
    if self._status == u26.Status.Started then
        local u7 = coroutine.running()
        self:finally(function() -- Line: 1674 -- upvalues: u7 (val)
            task.spawn(u7)
        end)
        coroutine.yield()
    end
    if self._status == u26.Status.Resolved or self._status == u26.Status.Rejected then
        return self._status, unpack(self._values, 1, self._valuesLength)
    end
    return self._status
end
prototype = u26.prototype
prototype.awaitStatus = timeout
function timeout(p1, ...) -- Line: 1690 -- upvalues: u26 (val)
    local v1 = p1 == u26.Status.Resolved
    return v1, ...
end
function prototype(self) -- Line: 1715 -- upvalues: timeout (val)
    return timeout(self:awaitStatus())
end
u26.prototype.await = prototype
function prototype(p1, ...) -- Line: 1719 -- upvalues: u26 (val)
    if p1 ~= u26.Status.Resolved then
        local v1
        if ... ~= nil then
            v1 = ...
        else
            v1 = "Expected Promise rejected with no value."
        end
        error(v1, 3)
    end
    return ...
end
function u26.prototype.expect(p1) -- Line: 1752 -- upvalues: prototype (val)
    return prototype(p1:awaitStatus())
end
u26.prototype.awaitValue = u26.prototype.expect
function u26.prototype._unwrap(p1) -- Line: 1766 -- upvalues: u26 (val)
    if p1._status == u26.Status.Started then
        error("Promise has not resolved or rejected.", 2)
    end
    local v1 = p1._status == u26.Status.Resolved
    return v1, unpack(p1._values, 1, p1._valuesLength)
end
function u26.prototype:_resolve(, ...) -- Line: 1776 -- upvalues: u26 (val), u13 (ref), pack (val)
    local v1, v2
    if self._status ~= u26.Status.Started then
        if u26.is((...)) then
            ...:_consumerCancelled(self)
        end
        return
    end
    if not (u26.is((...))) then
        local v3
        self._status = u26.Status.Resolved
        v1, v2 = pack(...)
        self._valuesLength = v1
        self._values = v2
        for i, v in ipairs(self._queuedResolve) do
            v3 = coroutine.wrap(v)
            v3(...)
        end
        self:_finalize()
        return
    end
    v1 = select("#", ...)
    if 1 < v1 then
        v1 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", self._source)
        warn(v1)
    end
    local u30 = ...
    v2 = u30:andThen(function(...) -- Line: 1797 -- upvalues: self (val)
        self:_resolve(...)
    end, function(...) -- Line: 1799 -- upvalues: u30 (val), u13 (upval), self (val)
        local v1
        local v2 = if u30._error then u13.new({context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v1)]", error = u30._error, kind = u13.Kind.ExecutionError}) else u30._values[1]
        if u13.isKind(v2, u13.Kind.ExecutionError) then
            return self:_reject(v2:extend({error = "This Promise was chained to a Promise that errored.", trace = "", context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", self._source)}))
        end
        self:_reject(...)
    end)
    if v2._status == u26.Status.Cancelled then
        self:cancel()
        return
    end
    if v2._status == u26.Status.Started then
        self._parent = v2
        v2._consumers[self] = true
    end
end
function u26.prototype:_reject(, ...) -- Line: 1847 -- upvalues: u26 (val), pack (val)
    local v1, v2
    if self._status ~= u26.Status.Started then
        return
    end
    self._status = u26.Status.Rejected
    v1, v2 = pack(...)
    self._valuesLength = v1
    self._values = v2
    v1 = next(self._queuedReject) == nil
    if v1 then
        local u39 = tostring((...))
        coroutine.wrap(function() -- Line: 1869 -- upvalues: u26 (upval), self (val), u39 (val)
            u26._timeEvent:Wait()
            if not self._unhandledRejection then
                return
            end
            local v1 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", u39, self._source)
            for i, v in ipairs(u26._unhandledRejectionCallbacks) do
                task.spawn(v, self, unpack(self._values, 1, self._valuesLength))
            end
            if u26.TEST then
                return
            end
            warn(v1)
        end)()
    else
        local v3
        for i, v in ipairs(self._queuedReject) do
            v3 = coroutine.wrap(v)
            v3(...)
        end
    end
    self:_finalize()
end
function u26.prototype:_finalize() -- Line: 1901 -- upvalues: u26 (val)
    local v1
    for i, v in ipairs(self._queuedFinally) do
        v1 = coroutine.wrap(v)
        v1(self._status)
    end
    self._queuedFinally = nil
    self._queuedReject = nil
    self._queuedResolve = nil
    if not u26.TEST then
        self._parent = nil
        self._consumers = nil
    end
    task.defer(coroutine.close, self._thread)
end
function u26.prototype.now(p1, p2) -- Line: 1938 -- upvalues: u26 (val), u13 (ref)
    local v1
    local v2 = debug.traceback(nil, 2)
    if p1._status == u26.Status.Resolved then
        return p1:_andThen(v2, function(...) -- Line: 1941
            return ...
        end)
    end
    local reject = u26.reject
    if p2 ~= nil then
        v1 = p2
    else
        v1 = u13.new({error = "This Promise was not resolved in time for :now()", kind = u13.Kind.NotResolvedInTime, context = ":now() was called at:\n\n" .. v2})
        if not v1 then
            v1 = p2
        end
    end
    return reject(v1)
end
function u26.retry(p1, p2, ...) -- Line: 1983 -- upvalues: u26 (val)
    local v1
    if type(p1) == "function" then
        v1 = true
    elseif type(p1) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p1)
        if not v2 then
            v1 = false
        else
            v1 = not (type((rawget(v2, "__call"))) ~= "function")
        end
    end
    assert(v1, "Parameter #1 to Promise.retry must be a function")
    v1 = type(p2) == "number"
    assert(v1, "Parameter #2 to Promise.retry must be a number")
    local u35 = {...}
    local u40 = select("#", ...)
    return u26.resolve(p1(...)):catch(function(...) -- Line: 1989 -- upvalues: p2 (val), u26 (upval), p1 (val), u35 (val), u40 (val)
        if 0 < p2 then
            return u26.retry(p1, p2 - 1, unpack(u35, 1, u40))
        end
        return u26.reject(...)
    end)
end
function u26.retryWithDelay(p1, p2, p3, ...) -- Line: 2011 -- upvalues: u26 (val)
    local v1
    if type(p1) == "function" then
        v1 = true
    elseif type(p1) ~= "table" then
        v1 = false
    else
        local v2 = getmetatable(p1)
        if v2 and type((rawget(v2, "__call"))) == "function" then
            v1 = true
        end
    end
    assert(v1, "Parameter #1 to Promise.retry must be a function")
    v1 = type(p2) == "number"
    assert(v1, "Parameter #2 (times) to Promise.retry must be a number")
    v1 = type(p3) == "number"
    assert(v1, "Parameter #3 (seconds) to Promise.retry must be a number")
    local u48 = {...}
    local u53 = select("#", ...)
    return u26.resolve(p1(...)):catch(function(...) -- Line: 2018 -- upvalues: p2 (val), u26 (upval), p3 (val), p1 (val), u48 (val), u53 (val)
        if 0 >= p2 then
            return u26.reject(...)
        end
        u26.delay(p3):await()
        return u26.retryWithDelay(p1, p2 - 1, p3, unpack(u48, 1, u53))
    end)
end
function u26.fromEvent(p1, p2) -- Line: 2053 -- upvalues: u26 (val)
    local v1 = p2
    if not v1 then
        function v1() -- Line: 2054
            return true
        end
    end
    local u5 = v1
    local v2 = debug.traceback(nil, 2)
    return u26._new(v2, function(a1, p2, p3) -- Line: 2058 -- upvalues: p1 (val), u5 (ref)
        local u3 = nil
        local u4 = false
        local function disconnect() -- Line: 2062 -- upvalues: u3 (ref)
            u3:Disconnect()
            u3 = nil
        end
        u3 = p1:Connect(function(...) -- Line: 2071 -- upvalues: u5 (upval), a1 (val), u3 (ref), u4 (ref)
            local v1 = u5(...)
            if v1 ~= true then
                if type(v1) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean")
                end
                return
            end
            a1(...)
            if not u3 then
                u4 = true
                return
            end
            u3:Disconnect()
            u3 = nil
        end)
        if not u4 then
            p3(disconnect)
            return
        end
        if u3 then
            return disconnect()
        end
        p3(disconnect)
    end)
end
function u26.onUnhandledRejection(p1) -- Line: 2105 -- upvalues: u26 (val)
    table.insert(u26._unhandledRejectionCallbacks, p1)
    return function() -- Line: 2108 -- upvalues: u26 (upval), p1 (val)
        local v1 = table.find(u26._unhandledRejectionCallbacks, p1)
        if v1 then
            table.remove(u26._unhandledRejectionCallbacks, v1)
        end
    end
end
return u26