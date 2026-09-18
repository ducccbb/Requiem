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
--   File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createSpy.spec
--                              Dumped in 0.000643 seconds
--                          Bytecode version 9  |  29 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createSpy = require(u0.Parent.createSpy)
    describe("createSpy", function() -- Line: 11 -- upvalues: createSpy (val)
        it("should create spies", function() -- Line: 12 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            expect(v1).to.be.ok()
        end)
        it("should throw if spies are indexed by an invalid key", function() -- Line: 18 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            expect(function() -- Line: 21 -- upvalues: u2 (val)
                return u2.test
            end).to.throw()
        end)
    end)
    describe("value", function() -- Line: 27 -- upvalues: createSpy (val)
        it("should increment callCount when called", function() -- Line: 28 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            v1.value()
            expect(v1.callCount).to.equal(1)
        end)
        it("should store all values passed", function() -- Line: 35 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            v1.value(1, true, "3")
            expect(v1.valuesLength).to.equal(3)
            expect(v1.values[1]).to.equal(1)
            expect(v1.values[2]).to.equal(true)
            expect(v1.values[3]).to.equal("3")
        end)
        it("should return the value of the inner function", function() -- Line: 45 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() -- Line: 46
                return true
            end)
            expect(v1.value()).to.equal(true)
        end)
    end)
    describe("assertCalledWith", function() -- Line: 54 -- upvalues: createSpy (val)
        it("should throw if the number of values differs", function() -- Line: 55 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            u2.value(1, 2)
            expect(function() -- Line: 59 -- upvalues: u2 (val)
                u2:assertCalledWith(1)
            end).to.throw()
        end)
        it("should throw if any value differs", function() -- Line: 64 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            u2.value(1, 2)
            expect(function() -- Line: 68 -- upvalues: u2 (val)
                u2:assertCalledWith(1, 3)
            end).to.throw()
            expect(function() -- Line: 72 -- upvalues: u2 (val)
                u2:assertCalledWith(2, 3)
            end).to.throw()
        end)
    end)
    describe("captureValues", function() -- Line: 78 -- upvalues: createSpy (val)
        it("should throw if the number of values differs", function() -- Line: 79 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            u2.value(1, 2)
            expect(function() -- Line: 83 -- upvalues: u2 (val)
                u2:captureValues("a")
            end).to.throw()
        end)
        it("should capture all values in a table", function() -- Line: 88 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            v1.value(1, 2)
            local v2 = v1:captureValues("a", "b")
            expect(v2.a).to.equal(1)
            expect(v2.b).to.equal(2)
        end)
    end)
end