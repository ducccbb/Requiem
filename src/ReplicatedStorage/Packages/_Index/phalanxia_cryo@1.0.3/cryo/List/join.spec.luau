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
--   File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.join.spec
--                              Dumped in 0.000311 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local join = require(script.Parent.join)
    local None = require(script.Parent.Parent.None)
    it("should return a new table", function() -- Line: 5 -- upvalues: join (val)
        local v1 = {}
        expect(join(v1)).never.to.equal(v1)
    end)
    it("should remove elements equal to None", function() -- Line: 11 -- upvalues: None (val), join (val)
        local v1 = join({"foo-a"}, {None, "foo-b"})
        expect(v1[1]).to.equal("foo-a")
        expect(v1[2]).to.equal("foo-b")
        expect(v1[3]).to.equal(nil)
    end)
    it("should accept arbitrary numbers of tables", function() -- Line: 28 -- upvalues: join (val)
        local v1 = join({1}, {2}, {3})
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
    it("should accept zero tables", function() -- Line: 41 -- upvalues: join (val)
        expect(join()).to.be.a("table")
    end)
end