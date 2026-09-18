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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.filter.spec
--                              Dumped in 0.000540 seconds
--                          Bytecode version 9  |  12 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local filter = require(u0.Parent.filter)
    it("should call the callback for each element", function() -- Line: 11 -- upvalues: filter (val)
        local v1 = {"foo1", "foo2", "foo3"}
        local u4 = {}
        filter(v1, function(p1, p2) -- Line: 18 -- upvalues: u4 (val)
            u4[p2] = p1
            return true
        end)
        for k, v in pairs(v1) do
            expect(u4[k]).to.equal(v)
        end
        for k2, i in pairs(u4) do
            expect(i).to.equal(v1[k2])
        end
    end)
    it("should correctly use the filter callback", function() -- Line: 33 -- upvalues: filter (val)
        local v1 = filter({
            1,
            2,
            3,
            4,
            5,
        }, function(p1) -- Line: 35
            local v1 = p1 % 2 == 0
            return v1
        end)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(2)
        expect(v1[2]).to.equal(4)
    end)
    it("should copy the list correctly", function() -- Line: 45 -- upvalues: filter (val)
        local v1 = {1, 2, 3}
        local v2 = filter(v1, function() -- Line: 47
            return true
        end)
        expect(v2).never.to.equal(v1)
        for k, v in pairs(v1) do
            expect(v2[k]).to.equal(v)
        end
        for k2, i in pairs(v2) do
            expect(i).to.equal(v1[k2])
        end
    end)
    it("should work with an empty table", function() -- Line: 63 -- upvalues: filter (val)
        local u0
        local v1 = filter({}, function() -- Line: 65 -- upvalues: u0 (ref)
            u0 = true
            return true
        end)
        expect(#v1).to.equal(0)
        expect(false).to.equal(false)
    end)
    it("should remove all element from a list when callback return always false", function() -- Line: 75 -- upvalues: filter (val)
        local v1 = filter({
            6,
            2,
            8,
            6,
            7,
        }, function() -- Line: 77
            return false
        end)
        expect(#v1).to.equal(0)
    end)
end