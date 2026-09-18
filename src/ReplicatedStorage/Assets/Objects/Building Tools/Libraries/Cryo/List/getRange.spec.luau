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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.getRange.spec
--                              Dumped in 0.000517 seconds
--                          Bytecode version 9  |  9 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local getRange = require(u0.Parent.getRange)
    it("should return the correct range", function() -- Line: 11 -- upvalues: getRange (val)
        local v1 = {1, 2, 3, 4}
        local v2 = getRange(v1, 2, 3)
        expect(v2[1]).to.equal(2)
        expect(v2[2]).to.equal(3)
        expect(#v2).to.equal(2)
        local v3 = getRange(v1, 4, 4)
        expect(#v3).to.equal(1)
        expect(v3[1]).to.equal(4)
    end)
    it("should throw when the start index is higher than the end index", function() -- Line: 24 -- upvalues: getRange (val)
        local u0 = {
            5,
            8,
            7,
            2,
            3,
            7,
        }
        expect(function() -- Line: 27 -- upvalues: getRange (upval), u0 (val)
            getRange(u0, 4, 1)
        end).to.throw()
    end)
    it("should copy the table", function() -- Line: 32 -- upvalues: getRange (val)
        local v1 = {
            6,
            8,
            1,
            3,
            7,
            2,
        }
        local v2 = getRange(v1, 1, #v1)
        for k, v in pairs(v1) do
            expect(v2[k]).to.equal(v)
        end
        for k2, i in pairs(v2) do
            expect(i).to.equal(v1[k2])
        end
    end)
    it("should work with an empty table", function() -- Line: 45 -- upvalues: getRange (val)
        local v1 = getRange({}, 1, 5)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(0)
    end)
    it("should work when the start index is smaller that 1", function() -- Line: 52 -- upvalues: getRange (val)
        local v1 = getRange({1, 2, 3, 4}, -2, 2)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
    end)
    it("should work when the end index is larger that the list length", function() -- Line: 61 -- upvalues: getRange (val)
        local v1 = getRange({1, 2, 3, 4}, 3, 18)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(3)
        expect(v1[2]).to.equal(4)
    end)
end