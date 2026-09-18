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
--  File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.find.spec
--                              Dumped in 0.000311 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local find = require(u0.Parent.find)
    it("should return the correct index", function() -- Line: 11 -- upvalues: find (val)
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
    it("should work with an empty table", function() -- Line: 21 -- upvalues: find (val)
        expect(find({}, 1)).to.equal(nil)
    end)
    it("should return nil when the given value is not found", function() -- Line: 25 -- upvalues: find (val)
        local v1 = {1, 2, 3}
        expect(find(v1, 4)).to.equal(nil)
        expect((type(find(v1, 4)))).to.equal("nil")
    end)
    it("should return the index of the first value found", function() -- Line: 32 -- upvalues: find (val)
        expect(find({1, 2, 2}, 2)).to.equal(2)
    end)
end