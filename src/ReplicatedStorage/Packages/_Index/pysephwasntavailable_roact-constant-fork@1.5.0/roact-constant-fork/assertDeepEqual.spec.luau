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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.assertDeepEqual.spec
--                              Dumped in 0.000472 seconds
--                          Bytecode version 9  |  10 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.assertDeepEqual)
    it("should fail with a message when args are not equal", function() -- Line: 4 -- upvalues: assertDeepEqual (val)
        local v1, v2, v3, v4
        v1, v2 = pcall(assertDeepEqual, 1, 2)
        expect(v1).to.equal(false)
        expect(v2:find("first ~= second")).to.be.ok()
        v3, v4 = pcall(assertDeepEqual, {foo = 1}, {foo = 2})
        expect(v3).to.equal(false)
        expect(v4:find("first%[foo%] ~= second%[foo%]")).to.be.ok()
    end)
    it("should compare non-table values using standard '==' equality", function() -- Line: 20 -- upvalues: assertDeepEqual (val)
        assertDeepEqual(1, 1)
        assertDeepEqual("hello", "hello")
        assertDeepEqual(nil, nil)
        local function v1() end
        assertDeepEqual(v1, v1)
        assertDeepEqual({foo = v1}, {foo = v1})
    end)
    it("should fail when types differ", function() -- Line: 40 -- upvalues: assertDeepEqual (val)
        local v1, v2
        v1, v2 = pcall(assertDeepEqual, 1, "1")
        expect(v1).to.equal(false)
        expect(v2:find("first is of type number, but second is of type string")).to.be.ok()
    end)
    it("should compare (and report about) nested tables", function() -- Line: 47 -- upvalues: assertDeepEqual (val)
        local v1, v2
        local v3 = {
            foo = "bar",
            nested = {foo = 1, bar = 2},
        }
        assertDeepEqual(v3, {
            foo = "bar",
            nested = {foo = 1, bar = 2},
        })
        v1, v2 = pcall(assertDeepEqual, v3, {
            foo = "bar",
            nested = {foo = 1, bar = 3},
        })
        expect(v1).to.equal(false)
        expect(v2:find("first%[nested%]%[bar%] ~= second%[nested%]%[bar%]")).to.be.ok()
    end)
    it("should be commutative", function() -- Line: 79 -- upvalues: assertDeepEqual (val)
        local u0 = {foo = "bar", hello = "world"}
        local v1 = {foo = "bar", hello = "world"}
        assertDeepEqual(u0, v1)
        assertDeepEqual(v1, u0)
        local u10 = {foo = "bar"}
        expect(function() -- Line: 96 -- upvalues: assertDeepEqual (upval), u0 (val), u10 (val)
            assertDeepEqual(u0, u10)
        end).to.throw()
        expect(function() -- Line: 99 -- upvalues: assertDeepEqual (upval), u10 (val), u0 (val)
            assertDeepEqual(u10, u0)
        end).to.throw()
    end)
end