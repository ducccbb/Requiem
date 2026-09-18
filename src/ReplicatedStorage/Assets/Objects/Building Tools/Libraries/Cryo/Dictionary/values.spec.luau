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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.Dictionary.values.spec
--                              Dumped in 0.000537 seconds
--                          Bytecode version 9  |  7 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local values = require(u0.Parent.values)
    local None = require(u0.Parent.Parent.None)
    it("should not mutate the given table", function() -- Line: 12 -- upvalues: values (val)
        local v1 = {Foo = "FooValue", Bar = "BarValue"}
        local v2 = {Foo = "FooValue", Bar = "BarValue"}
        values(v1)
        for k, v in pairs(v1) do
            expect(v2[k]).to.equal(v)
        end
        for k2, i in pairs(v2) do
            expect(v1[k2]).to.equal(i)
        end
    end)
    it("should return the correct values", function() -- Line: 32 -- upvalues: values (val)
        local v1 = {FooValue = 1, BarValue = 1, TestValue = 1}
        local v2 = values({Foo = "FooValue", Bar = "BarValue", Test = "TestValue"})
        expect(#v2).to.equal(3)
        for i, v in ipairs(v2) do
            expect(v1[v]).never.to.equal(nil)
            v1[v] = v1[v] - 1
        end
        for k, i2 in pairs(v1) do
            expect(i2).to.equal(0)
        end
    end)
    it("should return duplicates if two values are the same", function() -- Line: 55 -- upvalues: values (val)
        local v1 = {FooValue = 2, BarValue = 1}
        local v2 = values({Foo = "FooValue", Bar = "BarValue", Test = "FooValue"})
        expect(#v2).to.equal(3)
        for i, v in ipairs(v2) do
            expect(v1[v]).never.to.equal(nil)
            v1[v] = v1[v] - 1
        end
        for k, i2 in pairs(v1) do
            expect(i2).to.equal(0)
        end
    end)
    it("should work with an empty table", function() -- Line: 77 -- upvalues: values (val)
        local v1 = values({})
        expect(next(v1)).to.equal(nil)
    end)
    it("should contain a None element if there is a None value in the dictionary", function() -- Line: 83 -- upvalues: None (val), values (val)
        local v1 = {}
        v1[None] = 1
        v1.BarValue = 1
        local v2 = values({Bar = "BarValue", Foo = None})
        expect(#v2).to.equal(2)
        for i, v in ipairs(v2) do
            expect(v1[v]).never.to.equal(nil)
            v1[v] = v1[v] - 1
        end
        for k, i2 in pairs(v1) do
            expect(i2).to.equal(0)
        end
    end)
end