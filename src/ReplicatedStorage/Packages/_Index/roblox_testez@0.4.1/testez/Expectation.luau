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
--    File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.Expectation
--                               Dumped in 0.00135 seconds
--                          Bytecode version 9  |  16 functions

local u0 = {}
local u1 = {
    to = true,
    be = true,
    been = true,
    have = true,
    was = true,
    at = true,
}
local u2 = {never = true}
local function assertLevel(p1, p2, p3) -- Line: 42
    if not p1 then
        error(p2 or "Assertion failed!", (p3 or 1) + 1)
    end
end
local function bindSelf(p1, p2) -- Line: 54
    return function(a1, ...) -- Line: 55 -- upvalues: p1 (val), p2 (val)
        if a1 == p1 then
            return p2(p1, ...)
        end
        return p2(p1, a1, ...)
    end
end
local function formatMessage(p1, p2, p3) -- Line: 64
    if p1 then
        return p2
    end
    return p3
end
function u0.new(p1) -- Line: 75 -- upvalues: u0 (val)
    local u1 = {
        successCondition = true,
        condition = false,
        value = p1,
        matchers = {},
        _boundMatchers = {},
    }
    setmetatable(u1, u0)
    local a = u1.a
    function u1.a(p1, ...) -- Line: 55 -- upvalues: u1 (val), a (val)
        if p1 == u1 then
            return a(u1, ...)
        end
        return a(u1, p1, ...)
    end
    u1.an = u1.a
    local ok = u1.ok
    function u1.ok(p1, ...) -- Line: 55 -- upvalues: u1 (val), ok (val)
        if p1 == u1 then
            return ok(u1, ...)
        end
        return ok(u1, p1, ...)
    end
    local equal = u1.equal
    function u1.equal(p1, ...) -- Line: 55 -- upvalues: u1 (val), equal (val)
        if p1 == u1 then
            return equal(u1, ...)
        end
        return equal(u1, p1, ...)
    end
    local throw = u1.throw
    function u1.throw(p1, ...) -- Line: 55 -- upvalues: u1 (val), throw (val)
        if p1 == u1 then
            return throw(u1, ...)
        end
        return throw(u1, p1, ...)
    end
    local near = u1.near
    function u1.near(p1, ...) -- Line: 55 -- upvalues: u1 (val), near (val)
        if p1 == u1 then
            return near(u1, ...)
        end
        return near(u1, p1, ...)
    end
    return u1
end
function u0.checkMatcherNameCollisions(p1) -- Line: 96 -- upvalues: u1 (val), u2 (val), u0 (val)
    if u1[p1] or u2[p1] or u0[p1] then
        return false
    end
    return true
end
function u0:extend(p2) -- Line: 104
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    self.matchers = v1
    for k, v in pairs(self.matchers) do
        local function u20(p1, ...) -- Line: 108 -- upvalues: v (val), self (val)
            local v1 = v(self.value, ...)
            local v2 = v1.pass == self.successCondition
            if not v2 then
                error(v1.message or "Assertion failed!", (3 or 1) + 1)
            end
            self:_resetModifiers()
            return self
        end
        self._boundMatchers[k] = function(p1, ...) -- Line: 55 -- upvalues: self (val), u20 (val)
            if p1 == self then
                return u20(self, ...)
            end
            return u20(self, p1, ...)
        end
    end
    return self
end
function u0.__index(p1, p2) -- Line: 121 -- upvalues: u1 (val), u2 (val), u0 (val)
    if u1[p2] then
        return p1
    end
    if u2[p2] then
        local v1 = u0.new(p1.value):extend(p1.matchers)
        v1.successCondition = not p1.successCondition
        return v1
    end
    if p1._boundMatchers[p2] then
        return p1._boundMatchers[p2]
    end
    return u0[p2]
end
function u0:_resetModifiers() -- Line: 154
    self.successCondition = true
end
function u0.a(p1, p2) -- Line: 163
    local v1 = type(p1.value) == p2
    local v2 = v1 == p1.successCondition
    local v3 = tostring(p1.value)
    local v4 = ("Expected value of type %q, got value %q of type %s"):format(p2, v3, (type(p1.value)))
    local v5 = tostring(p1.value)
    if not p1.successCondition then
        v1 = ("Expected value not of type %q, got value %q of type %s"):format(p2, v5, (type(p1.value)))
    else
        v1 = v4
    end
    if not v2 then
        error(v1 or "Assertion failed!", (3 or 1) + 1)
    end
    p1:_resetModifiers()
    return p1
end
u0.an = u0.a
function u0.ok(p1) -- Line: 191
    local v1 = p1.value ~= nil
    local v2 = v1 == p1.successCondition
    local v3 = ("Expected value %q to be non-nil"):format((tostring(p1.value)))
    if not p1.successCondition then
        v1 = ("Expected value %q to be nil"):format((tostring(p1.value)))
    else
        v1 = v3
    end
    if not v2 then
        error(v1 or "Assertion failed!", (3 or 1) + 1)
    end
    p1:_resetModifiers()
    return p1
end
function u0.equal(p1, p2) -- Line: 212
    local v1 = p1.value == p2
    local v2 = v1 == p1.successCondition
    local v3 = tostring(p2)
    local v4 = type(p2)
    local v5 = tostring(p1.value)
    local v6 = ("Expected value %q (%s), got %q (%s) instead"):format(v3, v4, v5, (type(p1.value)))
    v4 = tostring(p2)
    if not p1.successCondition then
        v1 = ("Expected anything but value %q (%s)"):format(v4, (type(p2)))
    else
        v1 = v6
    end
    if not v2 then
        error(v1 or "Assertion failed!", (3 or 1) + 1)
    end
    p1:_resetModifiers()
    return p1
end
function u0.near(p1, p2, p3) -- Line: 238
    local v1 = type(p1.value) == "number"
    assert(v1, "Expectation value must be a number to use 'near'")
    v1 = type(p2) == "number"
    assert(v1, "otherValue must be a number")
    v1 = if type(p3) ~= "number" then p3 == nil else true
    assert(v1, "limit must be a number or nil")
    local v2 = p3 or 1e-07
    v1 = math.abs(p1.value - p2) <= v2
    local v3 = v1 == p1.successCondition
    local v4 = ("Expected value to be near %f (within %f) but got %f instead"):format(p2, v2, p1.value)
    if not p1.successCondition then
        v1 = ("Expected value to not be near %f (within %f) but got %f instead"):format(p2, v2, p1.value)
    else
        v1 = v4
    end
    if not v3 then
        error(v1 or "Assertion failed!", (3 or 1) + 1)
    end
    p1:_resetModifiers()
    return p1
end
function u0.throw(p1, p2) -- Line: 271
    local successCondition, v1, v2, v3
    v1, v2 = pcall(p1.value)
    local v4 = v1 ~= p1.successCondition
    if p2 and not v1 then
        if not p1.successCondition then
            v4 = v2:find(p2, 1, true) == nil
        else
            v4 = v2:find(p2, 1, true) ~= nil
        end
    end
    if p2 then
        local v5
        successCondition = p1.successCondition
        if not v2 then
            v5 = "did not throw."
        else
            v5 = ("threw: %s"):format(v2)
        end
        local v6 = ("Expected function to throw an error containing %q, but it %s"):format(p2, v5)
        if not successCondition then
            v3 = ("Expected function to never throw an error containing %q, but it threw: %s"):format(p2, (tostring(v2)))
        else
            v3 = v6
        end
    elseif not p1.successCondition then
        v3 = ("Expected function to succeed, but it threw an error: %s"):format((tostring(v2)))
    else
        v3 = "Expected function to throw an error, but it did not throw."
    end
    if not v4 then
        error(v3 or "Assertion failed!", (3 or 1) + 1)
    end
    p1:_resetModifiers()
    return p1
end
return u0