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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.assign.spec
--                              Dumped in 0.000323 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local None = require(u0.Parent.None)
    local assign = require(u0.Parent.assign)
    it("should accept zero additional tables", function() -- Line: 13 -- upvalues: assign (val)
        local v1 = {}
        local v2 = assign(v1)
        expect(v1).to.equal(v2)
    end)
    it("should merge multiple tables onto the given target table", function() -- Line: 20 -- upvalues: assign (val)
        local v1 = {a = 5, b = 6}
        local v2 = {b = 7, c = 8}
        local v3 = {b = 8}
        assign(v1, v2, v3)
        expect(v1.a).to.equal(5)
        expect(v1.b).to.equal(v3.b)
        expect(v1.c).to.equal(v2.c)
    end)
    it("should remove keys if specified as None", function() -- Line: 42 -- upvalues: None (val), assign (val)
        local v1 = {foo = 2, bar = 3}
        assign(v1, {foo = None})
        expect(v1.foo).to.equal(nil)
        expect(v1.bar).to.equal(3)
    end)
    it("should re-add keys if specified after None", function() -- Line: 58 -- upvalues: None (val), assign (val)
        local v1 = {foo = 2}
        local v2 = {foo = 3}
        assign(v1, {foo = None}, v2)
        expect(v1.foo).to.equal(v2.foo)
    end)
end