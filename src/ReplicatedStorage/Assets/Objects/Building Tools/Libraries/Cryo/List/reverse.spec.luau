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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.reverse.spec
--                              Dumped in 0.000566 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local reverse = require(u0.Parent.reverse)
    it("should return a new table", function() -- Line: 11 -- upvalues: reverse (val)
        local v1 = {1, 2, 3}
        expect(reverse(v1)).never.to.equal(v1)
    end)
    it("should not mutate the given table", function() -- Line: 17 -- upvalues: reverse (val)
        local v1 = {1, 2, 3}
        reverse(v1)
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
    it("should contain the same elements", function() -- Line: 27 -- upvalues: reverse (val)
        local v1 = {Foo = true, Bar = true}
        local v2 = reverse({"Foo", "Bar"})
        expect(#v2).to.equal(2)
        for i, v in ipairs(v2) do
            expect(v1[v]).to.equal(true)
        end
    end)
    it("should reverse the list", function() -- Line: 44 -- upvalues: reverse (val)
        local v1 = reverse({1, 2, 3, 4})
        expect(v1[1]).to.equal(4)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).to.equal(2)
        expect(v1[4]).to.equal(1)
    end)
end