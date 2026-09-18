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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.ElementUtils.spec
--                              Dumped in 0.000734 seconds
--                          Bytecode version 9  |  17 functions

return function() -- Line: 1
    local ElementUtils = require(script.Parent.ElementUtils)
    local createElement = require(script.Parent.createElement)
    local createFragment = require(script.Parent.createFragment)
    local Type = require(script.Parent.Type)
    describe("iterateElements", function() -- Line: 7 -- upvalues: createElement (val), ElementUtils (val), Type (val)
        it("should iterate once for a single child", function() -- Line: 8 -- upvalues: createElement (upval), ElementUtils (upval)
            local v1, v2
            local TextLabel = createElement("TextLabel")
            local v3 = ElementUtils.iterateElements(TextLabel)
            v1, v2 = v3()
            expect(v1).to.equal(ElementUtils.UseParentKey)
            expect(v2).to.equal(TextLabel)
            v1 = v3()
            expect(v1).to.equal(nil)
        end)
        it("should iterate over tables", function() -- Line: 20 -- upvalues: createElement (upval), ElementUtils (upval), Type (upval)
            local v1 = {a = createElement("TextLabel"), b = createElement("TextLabel")}
            local v2 = {}
            local v3 = 0
            for i, j in ElementUtils.iterateElements(v1) do
                expect((typeof(i))).to.equal("string")
                expect(Type.of(j)).to.equal(Type.Element)
                v2[j] = i
                v3 = v3 + 1
            end
            expect(v3).to.equal(2)
            expect(v2[v1.a]).to.equal("a")
            expect(v2[v1.b]).to.equal("b")
        end)
        it("should return a zero-element iterator for booleans", function() -- Line: 41 -- upvalues: ElementUtils (upval)
            local v1 = ElementUtils.iterateElements(false)
            expect(v1()).to.equal(nil)
        end)
        it("should return a zero-element iterator for nil", function() -- Line: 46 -- upvalues: ElementUtils (upval)
            local v1 = ElementUtils.iterateElements(nil)
            expect(v1()).to.equal(nil)
        end)
        it("should throw if given an illegal value", function() -- Line: 51 -- upvalues: ElementUtils (upval)
            expect(function() -- Line: 52 -- upvalues: ElementUtils (upval)
                ElementUtils.iterateElements(1)
            end).to.throw()
        end)
    end)
    describe("getElementByKey", function() -- Line: 58 -- upvalues: ElementUtils (val), createElement (val), createFragment (val)
        it("should return nil for booleans", function() -- Line: 59 -- upvalues: ElementUtils (upval)
            expect(ElementUtils.getElementByKey(true, "test")).to.equal(nil)
        end)
        it("should return nil for nil", function() -- Line: 63 -- upvalues: ElementUtils (upval)
            expect(ElementUtils.getElementByKey(nil, "test")).to.equal(nil)
        end)
        describe("single elements", function() -- Line: 67 -- upvalues: createElement (upval), ElementUtils (upval)
            local TextLabel = createElement("TextLabel")
            it("should return the element if the key is UseParentKey", function() -- Line: 70 -- upvalues: ElementUtils (upval), TextLabel (val)
                expect(ElementUtils.getElementByKey(TextLabel, ElementUtils.UseParentKey)).to.equal(TextLabel)
            end)
            it("should return nil if the key is not UseParentKey", function() -- Line: 74 -- upvalues: ElementUtils (upval), TextLabel (val)
                expect(ElementUtils.getElementByKey(TextLabel, "test")).to.equal(nil)
            end)
        end)
        it("should return the corresponding element from a table", function() -- Line: 79 -- upvalues: createElement (upval), ElementUtils (upval)
            local v1 = {a = createElement("TextLabel"), b = createElement("TextLabel")}
            expect(ElementUtils.getElementByKey(v1, "a")).to.equal(v1.a)
            expect(ElementUtils.getElementByKey(v1, "b")).to.equal(v1.b)
        end)
        it("should return nil if the key does not exist", function() -- Line: 89 -- upvalues: createFragment (upval), ElementUtils (upval)
            local v1 = createFragment({})
            expect(ElementUtils.getElementByKey(v1, "a")).to.equal(nil)
        end)
    end)
end