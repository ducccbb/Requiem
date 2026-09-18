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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.ElementUtils.spec
--                              Dumped in 0.000844 seconds
--                          Bytecode version 9  |  17 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local ElementUtils = require(u0.Parent.ElementUtils)
    local createElement = require(u0.Parent.createElement)
    local createFragment = require(u0.Parent.createFragment)
    local Type = require(u0.Parent.Type)
    describe("iterateElements", function() -- Line: 14 -- upvalues: createElement (val), ElementUtils (val), Type (val)
        it("should iterate once for a single child", function() -- Line: 15 -- upvalues: createElement (upval), ElementUtils (upval)
            local v1, v2
            local TextLabel = createElement("TextLabel")
            local v3 = ElementUtils.iterateElements(TextLabel)
            v1, v2 = v3()
            expect(v1).to.equal(ElementUtils.UseParentKey)
            expect(v2).to.equal(TextLabel)
            v1 = v3()
            expect(v1).to.equal(nil)
        end)
        it("should iterate over tables", function() -- Line: 27 -- upvalues: createElement (upval), ElementUtils (upval), Type (upval)
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
        it("should return a zero-element iterator for booleans", function() -- Line: 48 -- upvalues: ElementUtils (upval)
            local v1 = ElementUtils.iterateElements(false)
            expect(v1()).to.equal(nil)
        end)
        it("should return a zero-element iterator for nil", function() -- Line: 53 -- upvalues: ElementUtils (upval)
            local v1 = ElementUtils.iterateElements(nil)
            expect(v1()).to.equal(nil)
        end)
        it("should throw if given an illegal value", function() -- Line: 58 -- upvalues: ElementUtils (upval)
            expect(function() -- Line: 59 -- upvalues: ElementUtils (upval)
                ElementUtils.iterateElements(1)
            end).to.throw()
        end)
    end)
    describe("getElementByKey", function() -- Line: 65 -- upvalues: ElementUtils (val), createElement (val), createFragment (val)
        it("should return nil for booleans", function() -- Line: 66 -- upvalues: ElementUtils (upval)
            expect(ElementUtils.getElementByKey(true, "test")).to.equal(nil)
        end)
        it("should return nil for nil", function() -- Line: 70 -- upvalues: ElementUtils (upval)
            expect(ElementUtils.getElementByKey(nil, "test")).to.equal(nil)
        end)
        describe("single elements", function() -- Line: 74 -- upvalues: createElement (upval), ElementUtils (upval)
            local TextLabel = createElement("TextLabel")
            it("should return the element if the key is UseParentKey", function() -- Line: 77 -- upvalues: ElementUtils (upval), TextLabel (val)
                expect(ElementUtils.getElementByKey(TextLabel, ElementUtils.UseParentKey)).to.equal(TextLabel)
            end)
            it("should return nil if the key is not UseParentKey", function() -- Line: 81 -- upvalues: ElementUtils (upval), TextLabel (val)
                expect(ElementUtils.getElementByKey(TextLabel, "test")).to.equal(nil)
            end)
        end)
        it("should return the corresponding element from a table", function() -- Line: 86 -- upvalues: createElement (upval), ElementUtils (upval)
            local v1 = {a = createElement("TextLabel"), b = createElement("TextLabel")}
            expect(ElementUtils.getElementByKey(v1, "a")).to.equal(v1.a)
            expect(ElementUtils.getElementByKey(v1, "b")).to.equal(v1.b)
        end)
        it("should return nil if the key does not exist", function() -- Line: 96 -- upvalues: createFragment (upval), ElementUtils (upval)
            local v1 = createFragment({})
            expect(ElementUtils.getElementByKey(v1, "a")).to.equal(nil)
        end)
    end)
end