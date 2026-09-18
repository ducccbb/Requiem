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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createSpy
--                              Dumped in 0.000471 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local assertDeepEqual = require(script.Parent.assertDeepEqual)
return function(p1) -- Line: 18 -- upvalues: assertDeepEqual (val)
    local u1 = {callCount = 0, valuesLength = 0}
    local v1 = {}
    u1.values = v1
    function u1.value(...) -- Line: 25 -- upvalues: u1 (val), p1 (val)
        u1.callCount = u1.callCount + 1
        u1.values = {...}
        u1.valuesLength = select("#", ...)
        if p1 ~= nil then
            return p1(...)
        end
    end
    function u1.assertCalledWith(p1, ...) -- Line: 35 -- upvalues: u1 (val)
        local v1, v2
        local v3 = select("#", ...)
        if u1.valuesLength ~= v3 then
            v1 = ("Expected %d arguments, but was called with %d arguments"):format(u1.valuesLength, v3)
            error(v1, 2)
        end
        local v4 = v3
        v1 = 1
        for i = 1, v4, v1 do
            v2 = u1.values[i] == select(i, ...)
            assert(v2, "value differs")
        end
    end
    function u1.assertCalledWithDeepEqual(p1, ...) -- Line: 52 -- upvalues: u1 (val), assertDeepEqual (upval)
        local v1, v2
        local v3 = select("#", ...)
        if u1.valuesLength ~= v3 then
            v1 = ("Expected %d arguments, but was called with %d arguments"):format(u1.valuesLength, v3)
            error(v1, 2)
        end
        local v4 = v3
        v1 = 1
        for i = 1, v4, v1 do
            v2 = select(i, ...)
            assertDeepEqual(u1.values[i], v2)
        end
    end
    function u1.captureValues(p1, ...) -- Line: 69 -- upvalues: u1 (val)
        local v1
        local v2 = select("#", ...)
        local v3 = {}
        local v4 = u1.valuesLength == v2
        assert(v4, "length of expected values differs from stored values")
        local v5 = v2
        v4 = 1
        for i = 1, v5, v4 do
            v1 = select(i, ...)
            v3[v1] = u1.values[i]
        end
        return v3
    end
    setmetatable(u1, {
        __index = function(p1, p2) -- Line: 84
            error(("%q is not a valid member of spy"):format(p2))
        end,
    })
    return u1
end