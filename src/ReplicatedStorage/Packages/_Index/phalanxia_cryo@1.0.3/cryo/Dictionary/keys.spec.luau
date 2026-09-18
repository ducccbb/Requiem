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
--File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.Dictionary.keys.spec
--                              Dumped in 0.000574 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local keys = require(script.Parent.keys)
    local None = require(script.Parent.Parent.None)
    it("should not mutate the given table", function() -- Line: 5 -- upvalues: keys (val)
        local v1 = {Foo = "FooValue", Bar = "BarValue"}
        local v2 = {Foo = "FooValue", Bar = "BarValue"}
        keys(v1)
        for k, v in pairs(v1) do
            expect(v2[k]).to.equal(v)
        end
        for k2, i in pairs(v2) do
            expect(v1[k2]).to.equal(i)
        end
    end)
    it("should return the correct keys", function() -- Line: 25 -- upvalues: keys (val)
        local v1 = {Foo = 1, Bar = 1, Test = 1}
        local v2 = keys({Foo = "FooValue", Bar = "BarValue", Test = "TestValue"})
        expect(#v2).to.equal(3)
        for i, v in ipairs(v2) do
            expect(v1[v]).never.to.equal(nil)
            v1[v] = v1[v] - 1
        end
        for k, i2 in pairs(v1) do
            expect(i2).to.equal(0)
        end
    end)
    it("should work with an empty table", function() -- Line: 48 -- upvalues: keys (val)
        local v1 = keys({})
        expect(next(v1)).to.equal(nil)
    end)
    it("should contain a None element if there is a None key in the dictionary", function() -- Line: 54 -- upvalues: None (val), keys (val)
        local v1 = {}
        v1[None] = "Foo"
        v1.Bar = "BarValue"
        local v2 = {}
        v2[None] = 1
        v2.Bar = 1
        local v3 = keys(v1)
        expect(#v3).to.equal(2)
        for i, v in ipairs(v3) do
            expect(v2[v]).never.to.equal(nil)
            v2[v] = v2[v] - 1
        end
        for k, i2 in pairs(v2) do
            expect(i2).to.equal(0)
        end
    end)
end