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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.filterMap.spec
--                              Dumped in 0.000587 seconds
--                          Bytecode version 9  |  14 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local filterMap = require(u0.Parent.filterMap)
    it("should return a new table", function() -- Line: 11 -- upvalues: filterMap (val)
        local v1 = {1, 2, 3}
        local v2 = filterMap(v1, function() -- Line: 13
            return 1
        end)
        expect(v2).never.to.equal(v1)
    end)
    it("should call the callback for each element", function() -- Line: 21 -- upvalues: filterMap (val)
        local v1 = {"foo1", "foo2", "foo3"}
        local u4 = {}
        filterMap(v1, function(p1, p2) -- Line: 28 -- upvalues: u4 (val)
            u4[p2] = p1
            return p1
        end)
        for k, v in pairs(v1) do
            expect(u4[k]).to.equal(v)
        end
        for k2, i in pairs(u4) do
            expect(i).to.equal(v1[k2])
        end
    end)
    it("should correctly use the filter callback", function() -- Line: 43 -- upvalues: filterMap (val)
        local v1 = filterMap({
            1,
            2,
            3,
            4,
            5,
        }, function(p1) -- Line: 45
            if p1 % 2 == 0 then
                return nil
            end
            return p1 * 2
        end)
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(2)
        expect(v1[2]).to.equal(6)
        expect(v1[3]).to.equal(10)
    end)
    it("should copy the list correctly", function() -- Line: 60 -- upvalues: filterMap (val)
        local v1 = {1, 2, 3}
        local v2 = filterMap(v1, function(p1) -- Line: 62
            return p1
        end)
        expect(v2).never.to.equal(v1)
        for k, v in pairs(v1) do
            expect(v2[k]).to.equal(v)
        end
        for k2, i in pairs(v2) do
            expect(i).to.equal(v1[k2])
        end
    end)
    it("should work with an empty table", function() -- Line: 78 -- upvalues: filterMap (val)
        local u0
        local v1 = filterMap({}, function() -- Line: 80 -- upvalues: u0 (ref)
            u0 = true
            return true
        end)
        expect(#v1).to.equal(0)
        expect(false).to.equal(false)
    end)
    it("should remove all elements from a list when callback return always nil", function() -- Line: 90 -- upvalues: filterMap (val)
        local v1 = filterMap({
            6,
            2,
            8,
            6,
            7,
        }, function() -- Line: 92
            return nil
        end)
        expect(#v1).to.equal(0)
    end)
end