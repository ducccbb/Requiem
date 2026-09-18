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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.removeRange.spec
--                              Dumped in 0.000639 seconds
--                          Bytecode version 9  |  10 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local removeRange = require(u0.Parent.removeRange)
    local None = require(u0.Parent.Parent.None)
    it("should remove elements properly", function() -- Line: 12 -- upvalues: removeRange (val)
        local v1 = removeRange({1, 2, 3}, 2, 2)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        local v2 = {
            1,
            2,
            3,
            4,
            5,
            6,
        }
        local v3 = removeRange(v2, 1, 4)
        expect(#v3).to.equal(2)
        expect(v3[1]).to.equal(5)
        expect(v3[2]).to.equal(6)
        local v4 = removeRange(v2, 2, 5)
        expect(#v4).to.equal(2)
        expect(v4[1]).to.equal(1)
        expect(v4[2]).to.equal(6)
    end)
    it("should throw when the start index is higher than the end index", function() -- Line: 34 -- upvalues: removeRange (val)
        local u0 = {1, 2, 3}
        expect(function() -- Line: 37 -- upvalues: removeRange (upval), u0 (val)
            removeRange(u0, 2, 0)
        end).to.throw()
        expect(function() -- Line: 41 -- upvalues: removeRange (upval), u0 (val)
            removeRange(u0, 1, -1)
        end).to.throw()
    end)
    it("should copy the table when then indexes are higher than the list length", function() -- Line: 46 -- upvalues: removeRange (val)
        local v1 = removeRange({1, 2, 3}, 4, 7)
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
    it("should work when the start index is smaller than 1", function() -- Line: 56 -- upvalues: removeRange (val)
        local v1 = removeRange({1, 2, 3, 4}, -5, 2)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(3)
        expect(v1[2]).to.equal(4)
    end)
    it("should work when the end index is greater than the list length", function() -- Line: 65 -- upvalues: removeRange (val)
        local v1 = removeRange({1, 2, 3, 4}, 3, 8)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
    end)
    it("should work with a None element", function() -- Line: 74 -- upvalues: None (val), removeRange (val)
        local v1 = removeRange({1, None, 3}, 1, 1)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(None)
        expect(v1[2]).to.equal(3)
    end)
end