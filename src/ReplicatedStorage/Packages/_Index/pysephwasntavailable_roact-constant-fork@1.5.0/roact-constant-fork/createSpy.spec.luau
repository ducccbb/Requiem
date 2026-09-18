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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createSpy.spec
--                              Dumped in 0.000671 seconds
--                          Bytecode version 9  |  29 functions

return function() -- Line: 1
    local createSpy = require(script.Parent.createSpy)
    describe("createSpy", function() -- Line: 4 -- upvalues: createSpy (val)
        it("should create spies", function() -- Line: 5 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            expect(v1).to.be.ok()
        end)
        it("should throw if spies are indexed by an invalid key", function() -- Line: 11 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            expect(function() -- Line: 14 -- upvalues: u2 (val)
                return u2.test
            end).to.throw()
        end)
    end)
    describe("value", function() -- Line: 20 -- upvalues: createSpy (val)
        it("should increment callCount when called", function() -- Line: 21 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            v1.value()
            expect(v1.callCount).to.equal(1)
        end)
        it("should store all values passed", function() -- Line: 28 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            v1.value(1, true, "3")
            expect(v1.valuesLength).to.equal(3)
            expect(v1.values[1]).to.equal(1)
            expect(v1.values[2]).to.equal(true)
            expect(v1.values[3]).to.equal("3")
        end)
        it("should return the value of the inner function", function() -- Line: 38 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() -- Line: 39
                return true
            end)
            expect(v1.value()).to.equal(true)
        end)
    end)
    describe("assertCalledWith", function() -- Line: 47 -- upvalues: createSpy (val)
        it("should throw if the number of values differs", function() -- Line: 48 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            u2.value(1, 2)
            expect(function() -- Line: 52 -- upvalues: u2 (val)
                u2:assertCalledWith(1)
            end).to.throw()
        end)
        it("should throw if any value differs", function() -- Line: 57 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            u2.value(1, 2)
            expect(function() -- Line: 61 -- upvalues: u2 (val)
                u2:assertCalledWith(1, 3)
            end).to.throw()
            expect(function() -- Line: 65 -- upvalues: u2 (val)
                u2:assertCalledWith(2, 3)
            end).to.throw()
        end)
    end)
    describe("captureValues", function() -- Line: 71 -- upvalues: createSpy (val)
        it("should throw if the number of values differs", function() -- Line: 72 -- upvalues: createSpy (upval)
            local u2 = createSpy(function() end)
            u2.value(1, 2)
            expect(function() -- Line: 76 -- upvalues: u2 (val)
                u2:captureValues("a")
            end).to.throw()
        end)
        it("should capture all values in a table", function() -- Line: 81 -- upvalues: createSpy (upval)
            local v1 = createSpy(function() end)
            v1.value(1, 2)
            local v2 = v1:captureValues("a", "b")
            expect(v2.a).to.equal(1)
            expect(v2.b).to.equal(2)
        end)
    end)
end