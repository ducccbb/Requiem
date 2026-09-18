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
--  File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.filter.spec
--                              Dumped in 0.000596 seconds
--                          Bytecode version 9  |  12 functions

return function() -- Line: 1
    local filter = require(script.Parent.filter)
    it("should call the callback for each element", function() -- Line: 4 -- upvalues: filter (val)
        local v1 = {"foo1", "foo2", "foo3"}
        local u4 = {}
        filter(v1, function(p1, p2) -- Line: 11 -- upvalues: u4 (val)
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
    it("should correctly use the filter callback", function() -- Line: 26 -- upvalues: filter (val)
        local v1 = filter({
            1,
            2,
            3,
            4,
            5,
        }, function(p1) -- Line: 28
            local v1 = p1 % 2 == 0
            return v1
        end)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(2)
        expect(v1[2]).to.equal(4)
    end)
    it("should copy the list correctly", function() -- Line: 38 -- upvalues: filter (val)
        local v1 = {1, 2, 3}
        local v2 = filter(v1, function() -- Line: 40
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
    it("should work with an empty table", function() -- Line: 56 -- upvalues: filter (val)
        local u0
        local v1 = filter({}, function() -- Line: 58 -- upvalues: u0 (ref)
            u0 = true
            return true
        end)
        expect(#v1).to.equal(0)
        expect(false).to.equal(false)
    end)
    it("should remove all element from a list when callback return always false", function() -- Line: 68 -- upvalues: filter (val)
        local v1 = filter({
            6,
            2,
            8,
            6,
            7,
        }, function() -- Line: 70
            return false
        end)
        expect(#v1).to.equal(0)
    end)
end