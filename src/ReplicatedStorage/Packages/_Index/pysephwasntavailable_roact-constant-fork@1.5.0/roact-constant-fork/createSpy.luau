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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createSpy
--                              Dumped in 0.000581 seconds
--                          Bytecode version 9  |  7 functions

local assertDeepEqual = require(script.Parent.assertDeepEqual)
return function(p1) -- Line: 11 -- upvalues: assertDeepEqual (val)
    local u1 = {callCount = 0}
    local v1 = {}
    u1.values = v1
    u1.valuesLength = 0
    function u1.value(...) -- Line: 16 -- upvalues: u1 (val), p1 (val)
        u1.callCount = u1.callCount + 1
        u1.values = {...}
        u1.valuesLength = select("#", ...)
        if p1 ~= nil then
            return p1(...)
        end
        return nil
    end
    function u1.assertCalledWith(p1, ...) -- Line: 27 -- upvalues: u1 (val)
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
    function u1.assertCalledWithDeepEqual(p1, ...) -- Line: 41 -- upvalues: u1 (val), assertDeepEqual (upval)
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
    function u1.captureValues(p1, ...) -- Line: 55 -- upvalues: u1 (val)
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
        __index = function(p1, p2) -- Line: 70
            error(("%q is not a valid member of spy"):format(p2))
        end,
    })
    return u1
end