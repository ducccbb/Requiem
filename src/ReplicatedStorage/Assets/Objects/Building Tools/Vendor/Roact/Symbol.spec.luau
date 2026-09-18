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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Symbol.spec
--                              Dumped in 0.000257 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Symbol = require(u0.Parent.Symbol)
    describe("named", function() -- Line: 11 -- upvalues: Symbol (val)
        it("should give an opaque object", function() -- Line: 12 -- upvalues: Symbol (upval)
            local foo = Symbol.named("foo")
            expect(foo).to.be.a("userdata")
        end)
        it("should coerce to the given name", function() -- Line: 18 -- upvalues: Symbol (upval)
            local foo = Symbol.named("foo")
            expect(tostring(foo):find("foo")).to.be.ok()
        end)
        it("should be unique when constructed", function() -- Line: 24 -- upvalues: Symbol (upval)
            local abc = Symbol.named("abc")
            local abc_2 = Symbol.named("abc")
            expect(abc).never.to.equal(abc_2)
        end)
    end)
end