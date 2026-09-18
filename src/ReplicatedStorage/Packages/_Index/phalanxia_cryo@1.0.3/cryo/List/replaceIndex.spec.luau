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
--File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.replaceIndex.spec
--                              Dumped in 0.000434 seconds
--                          Bytecode version 9  |  8 functions

return function() -- Line: 1
    local replaceIndex = require(script.Parent.replaceIndex)
    it("should return a new table", function() -- Line: 4 -- upvalues: replaceIndex (val)
        local v1 = {1, 2, 3}
        expect(replaceIndex(v1, 2, 0)).never.to.equal(v1)
    end)
    it("should not mutate the original list", function() -- Line: 10 -- upvalues: replaceIndex (val)
        local v1 = {false, "foo", 3}
        replaceIndex(v1, 2, {})
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(false)
        expect(v1[2]).to.equal("foo")
        expect(v1[3]).to.equal(3)
    end)
    it("should replace the value at the given index", function() -- Line: 21 -- upvalues: replaceIndex (val)
        local v1 = {}
        local v2 = replaceIndex({1, 2, 3}, 2, v1)
        expect(v2[1]).to.equal(1)
        expect(v2[2]).to.equal(v1)
        expect(v2[3]).to.equal(3)
        expect(next(v2[2])).to.equal(nil)
    end)
    it("should throw if the given index is higher than the list length", function() -- Line: 32 -- upvalues: replaceIndex (val)
        local u0 = {1}
        expect(function() -- Line: 35 -- upvalues: replaceIndex (upval), u0 (val)
            replaceIndex(u0, #u0 + 1, {})
        end).to.throw()
    end)
    it("should be able to replace to a falsy value", function() -- Line: 40 -- upvalues: replaceIndex (val)
        local v1 = {}
        local v2 = replaceIndex({v1, false, "value", true}, 3, false)
        expect(v2[1]).to.equal(v1)
        expect(v2[2]).to.equal(false)
        expect(v2[3]).to.equal(false)
        expect(v2[4]).to.equal(true)
    end)
end