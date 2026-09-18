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
--File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.removeIndex.spec
--                              Dumped in 0.000536 seconds
--                          Bytecode version 9  |  5 functions

return function() -- Line: 1
    local removeIndex = require(script.Parent.removeIndex)
    local None = require(script.Parent.Parent.None)
    it("should remove the element at the given index", function() -- Line: 5 -- upvalues: removeIndex (val)
        local v1 = removeIndex({"first", "second", "third"}, 2)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal("first")
        expect(v1[2]).to.equal("third")
    end)
    it("should not remove any element if index is out of bound", function() -- Line: 19 -- upvalues: removeIndex (val)
        local v1 = {"first", "second", "third"}
        local v2 = removeIndex(v1, 4)
        expect(#v2).to.equal(#v1)
        local v3 = #v1
        local v4 = 1
        for i = 1, v3, v4 do
            expect(v2[i]).to.equal(v1[i])
        end
        v3 = removeIndex(v1, -2)
        expect(#v3).to.equal(#v1)
        v4 = #v1
        local v5 = 1
        for j = 1, v4, v5 do
            expect(v3[j]).to.equal(v1[j])
        end
    end)
    it("should work with a None element", function() -- Line: 40 -- upvalues: None (val), removeIndex (val)
        local v1 = removeIndex({"first", None, "third"}, 1)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(None)
        expect(v1[2]).to.equal("third")
    end)
end