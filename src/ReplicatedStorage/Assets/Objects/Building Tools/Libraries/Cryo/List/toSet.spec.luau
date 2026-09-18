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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.toSet.spec
--                              Dumped in 0.000369 seconds
--                          Bytecode version 9  |  5 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local toSet = require(u0.Parent.toSet)
    it("should return a new table", function() -- Line: 11 -- upvalues: toSet (val)
        local v1 = {1, 2, 3}
        expect(toSet(v1)).never.to.equal(v1)
    end)
    it("should not mutate the given table", function() -- Line: 17 -- upvalues: toSet (val)
        local v1 = {"a", "b", "c"}
        toSet(v1)
        for k, v in pairs(v1) do
            if k == 1 then
                expect(v).to.equal("a")
            elseif k == 2 then
                expect(v).to.equal("b")
            elseif k ~= 3 then
                error("Extra key was added to table a")
            else
                expect(v).to.equal("c")
            end
        end
    end)
    it("should have every value in a as a key mapped to true in b", function() -- Line: 34 -- upvalues: toSet (val)
        local v1 = toSet({
            1,
            2,
            3,
            "a",
            "b",
            "c",
        })
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(true)
        expect(v1[2]).to.equal(true)
        expect(v1[3]).to.equal(true)
        expect(v1[4]).to.equal(nil)
        expect(v1.a).to.equal(true)
        expect(v1.b).to.equal(true)
        expect(v1.c).to.equal(true)
    end)
end