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
--   File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.find.spec
--                              Dumped in 0.000396 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local find = require(script.Parent.find)
    it("should return the correct index", function() -- Line: 4 -- upvalues: find (val)
        local v1 = {
            5,
            4,
            3,
            2,
            1,
        }
        expect(find(v1, 1)).to.equal(5)
        expect(find(v1, 2)).to.equal(4)
        expect(find(v1, 3)).to.equal(3)
        expect(find(v1, 4)).to.equal(2)
        expect(find(v1, 5)).to.equal(1)
    end)
    it("should work with an empty table", function() -- Line: 14 -- upvalues: find (val)
        expect(find({}, 1)).to.equal(nil)
    end)
    it("should return nil when the given value is not found", function() -- Line: 18 -- upvalues: find (val)
        local v1 = {1, 2, 3}
        expect(find(v1, 4)).to.equal(nil)
        expect((type(find(v1, 4)))).to.equal("nil")
    end)
    it("should return the index of the first value found", function() -- Line: 25 -- upvalues: find (val)
        expect(find({1, 2, 2}, 2)).to.equal(2)
    end)
end