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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.findWhere.spec
--                              Dumped in 0.000500 seconds
--                          Bytecode version 9  |  15 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local findWhere = require(u0.Parent.findWhere)
    it("should return the correct index", function() -- Line: 11 -- upvalues: findWhere (val)
        local v1 = {1, 5, 10, 7}
        expect(findWhere(v1, function(p1) -- Line: 13
            local v1 = p1 % 2 == 0
            return v1
        end)).to.equal(3)
        expect(findWhere(v1, function(p1) -- Line: 17
            local v1 = p1 % 2 == 1
            return v1
        end)).to.equal(1)
    end)
    it("should work with an empty table", function() -- Line: 25 -- upvalues: findWhere (val)
        expect(findWhere({}, function() -- Line: 26
            return true
        end)).to.equal(nil)
    end)
    it("should return nil when the when no value satisfies the predicate", function() -- Line: 32 -- upvalues: findWhere (val)
        expect(findWhere({1, 2, 3}, function(p1) -- Line: 34
            local v1 = p1 == 4
            return v1
        end)).to.equal(nil)
    end)
    it("should return the index of the first value for which the predicate is true", function() -- Line: 41 -- upvalues: findWhere (val)
        expect(findWhere({
            1,
            1,
            1,
            2,
            2,
        }, function(p1) -- Line: 44
            local v1 = p1 == 2
            return v1
        end)).to.equal(4)
    end)
    it("should allow access to table index in the predicate function", function() -- Line: 51 -- upvalues: findWhere (val)
        expect(findWhere({
            5,
            4,
            3,
            2,
            1,
        }, function(p1, p2) -- Line: 54
            local v1 = p2 == 4
            return v1
        end)).to.equal(4)
    end)
    it("should allow access to both value and index in the predicate function", function() -- Line: 61 -- upvalues: findWhere (val)
        expect(findWhere({
            1,
            1,
            2,
            2,
            1,
        }, function(p1, p2) -- Line: 64
            local v1 = p1 + p2 == 5
            return v1
        end)).to.equal(3)
    end)
end