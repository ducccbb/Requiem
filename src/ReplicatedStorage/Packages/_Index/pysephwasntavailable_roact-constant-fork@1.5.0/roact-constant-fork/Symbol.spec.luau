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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Symbol.spec
--                              Dumped in 0.000224 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local Symbol = require(script.Parent.Symbol)
    describe("named", function() -- Line: 4 -- upvalues: Symbol (val)
        it("should give an opaque object", function() -- Line: 5 -- upvalues: Symbol (upval)
            local foo = Symbol.named("foo")
            expect(foo).to.be.a("userdata")
        end)
        it("should coerce to the given name", function() -- Line: 11 -- upvalues: Symbol (upval)
            local v1 = tostring((Symbol.named("foo"))):find("foo")
            expect(v1).to.be.ok()
        end)
        it("should be unique when constructed", function() -- Line: 18 -- upvalues: Symbol (upval)
            local abc = Symbol.named("abc")
            local abc_2 = Symbol.named("abc")
            expect(abc).never.to.equal(abc_2)
        end)
    end)
end