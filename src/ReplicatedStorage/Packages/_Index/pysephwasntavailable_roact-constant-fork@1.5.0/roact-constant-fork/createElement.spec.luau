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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createElement.spec
--                              Dumped in 0.000750 seconds
--                          Bytecode version 9  |  14 functions

return function() -- Line: 1
    local Component = require(script.Parent.Component)
    local ElementKind = require(script.Parent.ElementKind)
    local GlobalConfig = require(script.Parent.GlobalConfig)
    local Logging = require(script.Parent.Logging)
    local Type = require(script.Parent.Type)
    local Portal = require(script.Parent.Portal)
    local Children = require(script.Parent.PropMarkers.Children)
    local createElement = require(script.Parent.createElement)
    it("should create new primitive elements", function() -- Line: 12 -- upvalues: createElement (val), Type (val), ElementKind (val)
        local Frame = createElement("Frame")
        expect(Frame).to.be.ok()
        expect(Type.of(Frame)).to.equal(Type.Element)
        expect(ElementKind.of(Frame)).to.equal(ElementKind.Host)
    end)
    it("should create new functional elements", function() -- Line: 20 -- upvalues: createElement (val), Type (val), ElementKind (val)
        local v1 = createElement(function() end)
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.Element)
        expect(ElementKind.of(v1)).to.equal(ElementKind.Function)
    end)
    it("should create new stateful components", function() -- Line: 28 -- upvalues: Component (val), createElement (val), Type (val), ElementKind (val)
        local v1 = Component:extend("Foo")
        local v2 = createElement(v1)
        expect(v2).to.be.ok()
        expect(Type.of(v2)).to.equal(Type.Element)
        expect(ElementKind.of(v2)).to.equal(ElementKind.Stateful)
    end)
    it("should create new portal elements", function() -- Line: 38 -- upvalues: createElement (val), Portal (val), Type (val), ElementKind (val)
        local v1 = createElement(Portal)
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.Element)
        expect(ElementKind.of(v1)).to.equal(ElementKind.Portal)
    end)
    it("should accept props", function() -- Line: 46 -- upvalues: createElement (val)
        local v1 = createElement("StringValue", {Value = "Foo"})
        expect(v1).to.be.ok()
        expect(v1.props.Value).to.equal("Foo")
    end)
    it("should accept props and children", function() -- Line: 55 -- upvalues: createElement (val), Children (val)
        local IntValue = createElement("IntValue")
        local v1 = createElement("StringValue", {Value = "Foo"}, {Child = IntValue})
        expect(v1).to.be.ok()
        expect(v1.props.Value).to.equal("Foo")
        expect(v1.props[Children]).to.be.ok()
        expect(v1.props[Children].Child).to.equal(IntValue)
    end)
    it("should accept children with without props", function() -- Line: 70 -- upvalues: createElement (val), Children (val)
        local IntValue = createElement("IntValue")
        local v1 = createElement("StringValue", nil, {Child = IntValue})
        expect(v1).to.be.ok()
        expect(v1.props[Children]).to.be.ok()
        expect(v1.props[Children].Child).to.equal(IntValue)
    end)
    it("should warn once if children is specified in two different ways", function() -- Line: 82 -- upvalues: Logging (val), createElement (val), Children (val)
        local v1
        v1 = Logging.capture(function() -- Line: 83 -- upvalues: createElement (upval), Children (upval)
            local v1
            local v2 = 2
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = {}
                v1[Children] = {}
                createElement("Frame", v1, {})
            end
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("createElement")).to.be.ok()
        expect(v1.warnings[1]:find("Children")).to.be.ok()
    end)
    it("should have a `source` member if elementTracing is set", function() -- Line: 98 -- upvalues: GlobalConfig (val), createElement (val)
        GlobalConfig.scoped({elementTracing = true}, function() -- Line: 103 -- upvalues: createElement (upval)
            local StringValue = createElement("StringValue")
            expect(StringValue.source).to.be.a("string")
        end)
    end)
end