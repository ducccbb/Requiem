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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Type.spec
--                              Dumped in 0.000277 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Type = require(u0.Parent.Type)
    describe("of", function() -- Line: 11 -- upvalues: Type (val)
        it("should return nil if the value is not a table", function() -- Line: 12 -- upvalues: Type (upval)
            expect(Type.of(1)).to.equal(nil)
            expect(Type.of(true)).to.equal(nil)
            expect(Type.of("test")).to.equal(nil)
            expect(Type.of(print)).to.equal(nil)
        end)
        it("should return nil if the table has no type", function() -- Line: 19 -- upvalues: Type (upval)
            expect(Type.of({})).to.equal(nil)
        end)
        it("should return the assigned type", function() -- Line: 23 -- upvalues: Type (upval)
            local v1 = {}
            v1[Type] = Type.Element
            expect(Type.of(v1)).to.equal(Type.Element)
        end)
    end)
end