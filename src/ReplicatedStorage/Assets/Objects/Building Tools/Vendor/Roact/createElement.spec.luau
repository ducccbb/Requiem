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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createElement.spec
--                              Dumped in 0.000781 seconds
--                          Bytecode version 9  |  14 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Component = require(u0.Parent.Component)
    local ElementKind = require(u0.Parent.ElementKind)
    local GlobalConfig = require(u0.Parent.GlobalConfig)
    local Logging = require(u0.Parent.Logging)
    local Type = require(u0.Parent.Type)
    local Portal = require(u0.Parent.Portal)
    local Children = require(u0.Parent.PropMarkers.Children)
    local createElement = require(u0.Parent.createElement)
    it("should create new primitive elements", function() -- Line: 19 -- upvalues: createElement (val), Type (val), ElementKind (val)
        local Frame = createElement("Frame")
        expect(Frame).to.be.ok()
        expect(Type.of(Frame)).to.equal(Type.Element)
        expect(ElementKind.of(Frame)).to.equal(ElementKind.Host)
    end)
    it("should create new functional elements", function() -- Line: 27 -- upvalues: createElement (val), Type (val), ElementKind (val)
        local v1 = createElement(function() end)
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.Element)
        expect(ElementKind.of(v1)).to.equal(ElementKind.Function)
    end)
    it("should create new stateful components", function() -- Line: 36 -- upvalues: Component (val), createElement (val), Type (val), ElementKind (val)
        local v1 = Component:extend("Foo")
        local v2 = createElement(v1)
        expect(v2).to.be.ok()
        expect(Type.of(v2)).to.equal(Type.Element)
        expect(ElementKind.of(v2)).to.equal(ElementKind.Stateful)
    end)
    it("should create new portal elements", function() -- Line: 46 -- upvalues: createElement (val), Portal (val), Type (val), ElementKind (val)
        local v1 = createElement(Portal)
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.Element)
        expect(ElementKind.of(v1)).to.equal(ElementKind.Portal)
    end)
    it("should accept props", function() -- Line: 54 -- upvalues: createElement (val)
        local v1 = createElement("StringValue", {Value = "Foo"})
        expect(v1).to.be.ok()
        expect(v1.props.Value).to.equal("Foo")
    end)
    it("should accept props and children", function() -- Line: 63 -- upvalues: createElement (val), Children (val)
        local IntValue = createElement("IntValue")
        local v1 = createElement("StringValue", {Value = "Foo"}, {Child = IntValue})
        expect(v1).to.be.ok()
        expect(v1.props.Value).to.equal("Foo")
        expect(v1.props[Children]).to.be.ok()
        expect(v1.props[Children].Child).to.equal(IntValue)
    end)
    it("should accept children with without props", function() -- Line: 78 -- upvalues: createElement (val), Children (val)
        local IntValue = createElement("IntValue")
        local v1 = createElement("StringValue", nil, {Child = IntValue})
        expect(v1).to.be.ok()
        expect(v1.props[Children]).to.be.ok()
        expect(v1.props[Children].Child).to.equal(IntValue)
    end)
    it("should warn once if children is specified in two different ways", function() -- Line: 90 -- upvalues: Logging (val), createElement (val), Children (val)
        local v1
        v1 = Logging.capture(function() -- Line: 91 -- upvalues: createElement (upval), Children (upval)
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
    it("should have a `source` member if elementTracing is set", function() -- Line: 106 -- upvalues: GlobalConfig (val), createElement (val)
        GlobalConfig.scoped({elementTracing = true}, function() -- Line: 111 -- upvalues: createElement (upval)
            local StringValue = createElement("StringValue")
            expect(StringValue.source).to.be.a("string")
        end)
    end)
end