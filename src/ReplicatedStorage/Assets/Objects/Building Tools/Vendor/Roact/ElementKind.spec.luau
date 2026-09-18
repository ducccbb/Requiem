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
--  File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.ElementKind.spec
--                              Dumped in 0.000589 seconds
--                          Bytecode version 9  |  13 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Portal = require(u0.Parent.Portal)
    local Component = require(u0.Parent.Component)
    local ElementKind = require(u0.Parent.ElementKind)
    describe("of", function() -- Line: 14 -- upvalues: ElementKind (val)
        it("should return nil for non-table values", function() -- Line: 15 -- upvalues: ElementKind (upval)
            expect(ElementKind.of(nil)).to.equal(nil)
            expect(ElementKind.of(5)).to.equal(nil)
            expect(ElementKind.of(newproxy(true))).to.equal(nil)
        end)
        it("should return nil for table values without an ElementKind key", function() -- Line: 21 -- upvalues: ElementKind (upval)
            expect(ElementKind.of({})).to.equal(nil)
        end)
        it("should return the ElementKind from a table", function() -- Line: 25 -- upvalues: ElementKind (upval)
            local v1 = {}
            v1[ElementKind] = ElementKind.Stateful
            expect(ElementKind.of(v1)).to.equal(ElementKind.Stateful)
        end)
    end)
    describe("fromComponent", function() -- Line: 34 -- upvalues: ElementKind (val), Component (val), Portal (val)
        it("should handle host components", function() -- Line: 35 -- upvalues: ElementKind (upval)
            expect(ElementKind.fromComponent("foo")).to.equal(ElementKind.Host)
        end)
        it("should handle function components", function() -- Line: 39 -- upvalues: ElementKind (upval)
            expect(ElementKind.fromComponent(function() end)).to.equal(ElementKind.Function)
        end)
        it("should handle stateful components", function() -- Line: 46 -- upvalues: Component (upval), ElementKind (upval)
            local v1 = Component:extend("Foo")
            expect(ElementKind.fromComponent(v1)).to.equal(ElementKind.Stateful)
        end)
        it("should handle portals", function() -- Line: 52 -- upvalues: ElementKind (upval), Portal (upval)
            expect(ElementKind.fromComponent(Portal)).to.equal(ElementKind.Portal)
        end)
        it("should return nil for invalid inputs", function() -- Line: 56 -- upvalues: ElementKind (upval)
            expect(ElementKind.fromComponent(5)).to.equal(nil)
            expect(ElementKind.fromComponent(newproxy(true))).to.equal(nil)
        end)
    end)
end