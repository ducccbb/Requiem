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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.extend.spec
--                              Dumped in 0.000287 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Type = require(u0.Parent.Parent.Type)
    local Component = require(u0.Parent.Parent.Component)
    it("should be extendable", function() -- Line: 13 -- upvalues: Component (val), Type (val)
        local v1 = Component:extend("The Senate")
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.StatefulComponentClass)
    end)
    it("should prevent extending a user component", function() -- Line: 20 -- upvalues: Component (val)
        local u4 = Component:extend("Sheev")
        expect(function() -- Line: 23 -- upvalues: u4 (val)
            u4:extend("Frank")
        end).to.throw()
    end)
    it("should use a given name", function() -- Line: 28 -- upvalues: Component (val)
        local v1 = tostring((Component:extend("FooBar")))
        expect(v1).to.be.a("string")
        expect(v1:find("FooBar")).to.be.ok()
    end)
end