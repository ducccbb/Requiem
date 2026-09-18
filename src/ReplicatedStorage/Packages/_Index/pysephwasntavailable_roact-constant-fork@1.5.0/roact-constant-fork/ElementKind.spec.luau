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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.ElementKind.spec
--                              Dumped in 0.000471 seconds
--                          Bytecode version 9  |  13 functions

return function() -- Line: 1
    local Portal = require(script.Parent.Portal)
    local Component = require(script.Parent.Component)
    local ElementKind = require(script.Parent.ElementKind)
    describe("of", function() -- Line: 7 -- upvalues: ElementKind (val)
        it("should return nil for non-table values", function() -- Line: 8 -- upvalues: ElementKind (upval)
            expect(ElementKind.of(nil)).to.equal(nil)
            expect(ElementKind.of(5)).to.equal(nil)
            expect(ElementKind.of(newproxy(true))).to.equal(nil)
        end)
        it("should return nil for table values without an ElementKind key", function() -- Line: 14 -- upvalues: ElementKind (upval)
            expect(ElementKind.of({})).to.equal(nil)
        end)
        it("should return the ElementKind from a table", function() -- Line: 18 -- upvalues: ElementKind (upval)
            local v1 = {}
            v1[ElementKind] = ElementKind.Stateful
            expect(ElementKind.of(v1)).to.equal(ElementKind.Stateful)
        end)
    end)
    describe("fromComponent", function() -- Line: 27 -- upvalues: ElementKind (val), Component (val), Portal (val)
        it("should handle host components", function() -- Line: 28 -- upvalues: ElementKind (upval)
            expect(ElementKind.fromComponent("foo")).to.equal(ElementKind.Host)
        end)
        it("should handle function components", function() -- Line: 32 -- upvalues: ElementKind (upval)
            expect(ElementKind.fromComponent(function() end)).to.equal(ElementKind.Function)
        end)
        it("should handle stateful components", function() -- Line: 38 -- upvalues: Component (upval), ElementKind (upval)
            local v1 = Component:extend("Foo")
            expect(ElementKind.fromComponent(v1)).to.equal(ElementKind.Stateful)
        end)
        it("should handle portals", function() -- Line: 44 -- upvalues: ElementKind (upval), Portal (upval)
            expect(ElementKind.fromComponent(Portal)).to.equal(ElementKind.Portal)
        end)
        it("should return nil for invalid inputs", function() -- Line: 48 -- upvalues: ElementKind (upval)
            expect(ElementKind.fromComponent(5)).to.equal(nil)
            expect(ElementKind.fromComponent(newproxy(true))).to.equal(nil)
        end)
    end)
end