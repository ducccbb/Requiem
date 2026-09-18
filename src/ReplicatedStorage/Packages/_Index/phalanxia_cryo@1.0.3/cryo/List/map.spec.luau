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
--    File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.map.spec
--                              Dumped in 0.000645 seconds
--                          Bytecode version 9  |  12 functions

return function() -- Line: 1
    local map = require(script.Parent.map)
    it("should return a new table", function() -- Line: 4 -- upvalues: map (val)
        local v1 = {1, 2, 3}
        expect(map(v1, function() end)).never.to.equal(v1)
    end)
    it("should call the callback for each element", function() -- Line: 10 -- upvalues: map (val)
        local v1 = {5, 6, 7}
        local u4 = {}
        map(v1, function(p1, p2) -- Line: 13 -- upvalues: u4 (val)
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
    it("should copy list", function() -- Line: 27 -- upvalues: map (val)
        local v1 = {1, 2, 3}
        local v2 = map(v1, function(p1) -- Line: 29
            return p1
        end)
        for k, v in pairs(v1) do
            expect(v2[k]).to.equal(v)
        end
        for k2, i in pairs(v2) do
            expect(i).to.equal(v1[k2])
        end
    end)
    it("should sets the new values to the result of the given callback", function() -- Line: 42 -- upvalues: map (val)
        local v1 = {5, 6, 7}
        local v2 = map(v1, function(p1) -- Line: 44
            return p1 * 2
        end)
        expect(#v2).to.equal(#v1)
        local v3 = #v1
        local v4 = 1
        for i = 1, v3, v4 do
            expect(v2[i]).to.equal(v1[i] * 2)
        end
    end)
    it("should work with an empty list", function() -- Line: 54 -- upvalues: map (val)
        local v1 = {}
        local v2 = map(v1, function() end)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
    end)
end