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
--File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.Dictionary.join.spec
--                              Dumped in 0.000632 seconds
--                          Bytecode version 9  |  16 functions

return function() -- Line: 1
    local join = require(script.Parent.join)
    local None = require(script.Parent.Parent.None)
    it("should return a new table", function() -- Line: 5 -- upvalues: join (val)
        local v1 = {}
        expect(join(v1)).never.to.equal(v1)
    end)
    it("should merge tables, overwriting previous values", function() -- Line: 11 -- upvalues: join (val)
        local v1 = {foo = "foo-a", bar = "bar-a"}
        local v2 = {foo = "foo-b", baz = "baz-b"}
        local v3 = join(v1, v2)
        expect(v3.foo).to.equal(v2.foo)
        expect(v3.bar).to.equal(v1.bar)
        expect(v3.baz).to.equal(v2.baz)
    end)
    it("should remove values set to None", function() -- Line: 29 -- upvalues: None (val), join (val)
        local v1 = join({foo = "foo-a"}, {foo = None})
        expect(v1.foo).to.equal(nil)
    end)
    it("should not mutate passed in tables", function() -- Line: 43 -- upvalues: join (val)
        local u0 = 0
        local u1 = 0
        local v1 = {}
        local v2 = {foo = "foo-b"}
        setmetatable(v1, {
            __newindex = function() -- Line: 53 -- upvalues: u0 (ref)
                u0 = u0 + 1
            end,
        })
        setmetatable(v2, {
            __newindex = function() -- Line: 59 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end,
        })
        join(v1, v2)
        expect(u0).to.equal(0)
        expect(u1).to.equal(0)
        expect(v2.foo).to.equal("foo-b")
    end)
    it("should not copy metatables of passed in tables", function() -- Line: 71 -- upvalues: join (val)
        local v1 = setmetatable({foo = "foo-a"}, {
            __index = function() end,
        })
        local v2 = setmetatable({foo = "foo-b"}, {
            __index = function() end,
        })
        local v3 = join(v1, v2)
        local v4 = join(v1)
        expect((getmetatable(v3))).to.equal(nil)
        expect((getmetatable(v4))).to.equal(nil)
    end)
    it("should accept arbitrary numbers of tables", function() -- Line: 91 -- upvalues: join (val)
        local v1 = {foo = "foo-a"}
        local v2 = {bar = "bar-b"}
        local v3 = {baz = "baz-c"}
        local v4 = join(v1, v2, v3)
        expect(v4.foo).to.equal(v1.foo)
        expect(v4.bar).to.equal(v2.bar)
        expect(v4.baz).to.equal(v3.baz)
    end)
    it("should accept zero tables", function() -- Line: 111 -- upvalues: join (val)
        expect(join()).to.be.a("table")
    end)
    it("should safely iterate through tables with call metamethods", function() -- Line: 115 -- upvalues: join (val)
        local u4 = setmetatable({A = 1}, {
            __call = function(p1, ...) -- Line: 117
                error(...)
            end,
        })
        expect(function() -- Line: 121 -- upvalues: join (upval), u4 (val)
            join({}, u4)
        end).never.to.throw()
    end)
end