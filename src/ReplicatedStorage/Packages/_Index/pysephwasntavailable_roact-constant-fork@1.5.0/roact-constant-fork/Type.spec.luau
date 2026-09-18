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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Type.spec
--                              Dumped in 0.000243 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local Type = require(script.Parent.Type)
    describe("of", function() -- Line: 4 -- upvalues: Type (val)
        it("should return nil if the value is not a table", function() -- Line: 5 -- upvalues: Type (upval)
            expect(Type.of(1)).to.equal(nil)
            expect(Type.of(true)).to.equal(nil)
            expect(Type.of("test")).to.equal(nil)
            expect(Type.of(print)).to.equal(nil)
        end)
        it("should return nil if the table has no type", function() -- Line: 12 -- upvalues: Type (upval)
            expect(Type.of({})).to.equal(nil)
        end)
        it("should return the assigned type", function() -- Line: 16 -- upvalues: Type (upval)
            local v1 = {}
            v1[Type] = Type.Element
            expect(Type.of(v1)).to.equal(Type.Element)
        end)
    end)
end