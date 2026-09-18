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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.extend.spec
--                              Dumped in 0.000403 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local Type = require(script.Parent.Parent.Type)
    local Component = require(script.Parent.Parent.Component)
    it("should be extendable", function() -- Line: 6 -- upvalues: Component (val), Type (val)
        local v1 = Component:extend("The Senate")
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.StatefulComponentClass)
    end)
    it("should prevent extending a user component", function() -- Line: 13 -- upvalues: Component (val)
        local u4 = Component:extend("Sheev")
        expect(function() -- Line: 16 -- upvalues: u4 (val)
            u4:extend("Frank")
        end).to.throw()
    end)
    it("should use a given name", function() -- Line: 21 -- upvalues: Component (val)
        local v1 = tostring((Component:extend("FooBar")))
        expect(v1).to.be.a("string")
        expect(v1:find("FooBar")).to.be.ok()
    end)
end