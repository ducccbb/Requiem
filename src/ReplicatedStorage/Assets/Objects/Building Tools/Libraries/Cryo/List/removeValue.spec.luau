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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.removeValue.spec
--                              Dumped in 0.000384 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local removeValue = require(u0.Parent.removeValue)
    local None = require(u0.Parent.Parent.None)
    it("should remove the given value", function() -- Line: 12 -- upvalues: removeValue (val)
        local v1 = removeValue({1, 4, 3}, 4)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
    end)
    it("should remove all occurences of the same given value", function() -- Line: 20 -- upvalues: removeValue (val)
        local v1 = removeValue({1, 2, 2, 3}, 2)
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
    end)
    it("should work with an empty list", function() -- Line: 29 -- upvalues: removeValue (val)
        local v1 = removeValue({}, 1)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(0)
    end)
    it("should work with a None element", function() -- Line: 36 -- upvalues: None (val), removeValue (val)
        local v1 = {1, 2, None, 3}
        local v2 = removeValue(v1, 2)
        expect(#v2).to.equal(3)
        expect(v2[1]).to.equal(1)
        expect(v2[2]).to.equal(None)
        expect(v2[3]).to.equal(3)
        local v3 = removeValue(v1, None)
        expect(v3[3]).to.equal(3)
        expect(#v3).to.equal(3)
    end)
end