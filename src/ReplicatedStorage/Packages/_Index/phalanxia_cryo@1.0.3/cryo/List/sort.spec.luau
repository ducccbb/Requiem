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
--   File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.sort.spec
--                              Dumped in 0.000569 seconds
--                          Bytecode version 9  |  10 functions

return function() -- Line: 1
    local sort = require(script.Parent.sort)
    it("should return a new table", function() -- Line: 4 -- upvalues: sort (val)
        local v1 = {}
        expect(sort(v1)).never.to.equal(v1)
    end)
    it("should not mutate the given table", function() -- Line: 10 -- upvalues: sort (val)
        local v1 = {77, "foo", 2}
        sort(v1, function(p1, p2) -- Line: 12
            local v1 = tostring(p1)
            local v2 = v1 < tostring(p2)
            return v2
        end)
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(77)
        expect(v1[2]).to.equal("foo")
        expect(v1[3]).to.equal(2)
    end)
    it("should contain the same elements from the given table", function() -- Line: 23 -- upvalues: sort (val)
        local v1 = {Foo = true, Bar = true, Test = true}
        local v2 = sort({"Foo", "Bar", "Test"})
        expect(#v2).to.equal(3)
        for i, v in ipairs(v2) do
            expect(v1[v]).to.equal(true)
        end
    end)
    it("should sort with the default table.sort when no callback is given", function() -- Line: 42 -- upvalues: sort (val)
        local v1 = {
            4,
            2,
            5,
            3,
            1,
        }
        local v2 = sort(v1)
        table.sort(v1)
        expect(#v2).to.equal(#v1)
        local v3 = #v1
        local v4 = 1
        for i = 1, v3, v4 do
            expect(v2[i]).to.equal(v1[i])
        end
    end)
    it("should sort with the given callback", function() -- Line: 54 -- upvalues: sort (val)
        local v1
        local v2 = {
            1,
            2,
            5,
            3,
            4,
        }
        local function order(p1, p2) -- Line: 56
            local v1 = p2 < p1
            return v1
        end
        v1 = sort(v2, order)
        table.sort(v2, order)
        expect(#v1).to.equal(#v2)
        local v3 = #v2
        local v4 = 1
        for i = 1, v3, v4 do
            expect(v1[i]).to.equal(v2[i])
        end
    end)
    it("should work with an empty table", function() -- Line: 69 -- upvalues: sort (val)
        local v1 = sort({})
        expect(#v1).to.equal(0)
    end)
end