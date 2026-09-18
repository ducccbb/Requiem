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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.render.spec
--                              Dumped in 0.000799 seconds
--                          Bytecode version 9  |  15 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local assertDeepEqual = require(u0.Parent.Parent.assertDeepEqual)
    local createElement = require(u0.Parent.Parent.createElement)
    local createReconciler = require(u0.Parent.Parent.createReconciler)
    local createSpy = require(u0.Parent.Parent.createSpy)
    local NoopRenderer = require(u0.Parent.Parent.NoopRenderer)
    local Type = require(u0.Parent.Parent.Type)
    local Component = require(u0.Parent.Parent.Component)
    local u44 = createReconciler(NoopRenderer)
    it("should throw on mount if not overridden", function() -- Line: 20 -- upvalues: Component (val), createElement (val), u44 (val)
        local v1, v2
        local v3 = Component:extend("MyComponent")
        local u7 = createElement(v3)
        v1, v2 = pcall(function() -- Line: 27 -- upvalues: u44 (upval), u7 (val)
            u44.mountVirtualNode(u7, nil, "Test")
        end)
        expect(v1).to.equal(false)
        expect(v2:match("MyComponent")).to.be.ok()
        expect(v2:match("render")).to.be.ok()
    end)
    it("should be invoked when a component is mounted", function() -- Line: 36 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local u5, u6
        local v1 = Component:extend("Foo")
        local v2 = createSpy(function(p1) -- Line: 41 -- upvalues: u5 (ref), u6 (ref)
            u5 = p1.props
            u6 = p1.state
        end)
        v1.render = v2.value
        local v3 = createElement(v1)
        u44.mountVirtualNode(v3, nil, "Foo Test")
        expect(v2.callCount).to.equal(1)
        local v4 = v2:captureValues("self")
        expect(Type.of(v4.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(nil, {})
        assertDeepEqual(nil, {})
    end)
    it("should be invoked when a component is updated via props", function() -- Line: 62 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local v1 = Component:extend("Foo")
        local u5 = nil
        local u6 = nil
        local v2 = createSpy(function(p1) -- Line: 67 -- upvalues: u5 (ref), u6 (ref)
            u5 = p1.props
            u6 = p1.state
        end)
        v1.render = v2.value
        local v3 = {a = 2}
        local v4 = createElement(v1, v3)
        local v5 = u44.mountVirtualNode(v4, nil, "Foo Test")
        expect(v2.callCount).to.equal(1)
        local v6 = v2:captureValues("self")
        local v7 = u5
        local v8 = u6
        expect(Type.of(v6.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(v7, v3)
        assertDeepEqual(v8, {})
        local v9 = {a = 3}
        local v10 = createElement(v1, v9)
        u44.updateVirtualNode(v5, v10)
        expect(v2.callCount).to.equal(2)
        local v11 = v2:captureValues("self")
        local v12 = u5
        expect(Type.of(v11.self)).to.equal(Type.StatefulComponentInstance)
        expect(v12).never.to.equal(v7)
        assertDeepEqual(v12, v9)
        expect(u6).to.equal(v8)
    end)
    it("should be invoked when a component is updated via state", function() -- Line: 111 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val)
        local u5
        local v1 = Component:extend("Foo")
        function v1.init(p1) -- Line: 115 -- upvalues: u5 (ref)
            function u5(...) -- Line: 116 -- upvalues: p1 (val)
                return p1:setState(...)
            end
        end
        local u7 = nil
        local u8 = nil
        local v2 = createSpy(function(p1) -- Line: 123 -- upvalues: u7 (ref), u8 (ref)
            u7 = p1.props
            u8 = p1.state
        end)
        v1.render = v2.value
        local v3 = createElement(v1)
        u44.mountVirtualNode(v3, nil, "Foo Test")
        expect(v2.callCount).to.equal(1)
        local v4 = v2:captureValues("self")
        expect(Type.of(v4.self)).to.equal(Type.StatefulComponentInstance)
        ;(nil)({})
        expect(v2.callCount).to.equal(2)
        local v5 = v2:captureValues("self")
        expect(Type.of(v5.self)).to.equal(Type.StatefulComponentInstance)
        expect(u7).to.equal(u7)
        expect(u8).never.to.equal(u8)
    end)
    itSKIP("Test defaultProps on initial render", function() end)
    itSKIP("Test defaultProps on prop update", function() end)
    itSKIP("Test defaultProps on state update", function() end)
end