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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.shouldUpdate.spec
--                              Dumped in 0.000786 seconds
--                          Bytecode version 9  |  14 functions

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
    it("should be invoked when props update", function() -- Line: 20 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local u5
        local v1 = Component:extend("MyComponent")
        local u6 = nil
        local v2 = createSpy(function(p1) -- Line: 25 -- upvalues: u5 (ref), u6 (ref)
            u5 = p1.props
            u6 = p1.state
            return true
        end)
        v1.shouldUpdate = v2.value
        function v1.render(p1) -- Line: 34
            return nil
        end
        local v3 = {a = 5}
        local v4 = createElement(v1, v3)
        local v5 = u44.mountVirtualNode(v4, nil, "Test")
        expect(v2.callCount).to.equal(0)
        local v6 = {a = 6, b = 2}
        local v7 = createElement(v1, v6)
        u44.updateVirtualNode(v5, v7)
        expect(v2.callCount).to.equal(1)
        local v8 = v2:captureValues("self", "newProps", "newState")
        expect(Type.of(v8.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(v8.newProps, v6)
        assertDeepEqual(nil, v3)
        expect(v8.newState).to.equal(u6)
        assertDeepEqual(u6, {})
    end)
    it("should be invoked when state is updated", function() -- Line: 70 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local u6, u7
        local v1 = Component:extend("MyComponent")
        local u5 = {a = 1}
        function v1.init(p1) -- Line: 79 -- upvalues: u6 (ref), u5 (val), u7 (ref)
            function u6(...) -- Line: 80 -- upvalues: p1 (val)
                return p1:setState(...)
            end
            p1:setState(u5)
            u7 = p1.state
        end
        local u9 = nil
        local u10 = nil
        local v2 = createSpy(function(p1) -- Line: 91 -- upvalues: u9 (ref), u10 (ref)
            u9 = p1.props
            u10 = p1.state
            return true
        end)
        v1.shouldUpdate = v2.value
        function v1.render(p1) -- Line: 100
            return nil
        end
        local v3 = createElement(v1)
        u44.mountVirtualNode(v3, nil, "Test")
        expect(v2.callCount).to.equal(0)
        local v4 = {a = 2, b = 3}
        ;(nil)(v4)
        expect(v2.callCount).to.equal(1)
        local v5 = v2:captureValues("self", "newProps", "newState")
        expect(Type.of(v5.self)).to.equal(Type.StatefulComponentInstance)
        expect(v5.newProps).to.equal(u9)
        assertDeepEqual(u9, {})
        assertDeepEqual(u10, u5)
        expect(u10).to.equal(nil)
        assertDeepEqual(v5.newState, v4)
    end)
    it("should not abort an update when returning true", function() -- Line: 133 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val)
        local v1 = Component:extend("MyComponent")
        function v1.shouldUpdate(p1) -- Line: 136
            return true
        end
        local v2 = createSpy()
        v1.render = v2.value
        local v3 = createElement(v1)
        local v4 = u44.mountVirtualNode(v3, nil, "Test")
        expect(v2.callCount).to.equal(1)
        local v5 = createElement(v1)
        u44.updateVirtualNode(v4, v5)
        expect(v2.callCount).to.equal(2)
    end)
    it("should abort an update when retuning false", function() -- Line: 158 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val)
        local v1 = Component:extend("MyComponent")
        function v1.shouldUpdate(p1) -- Line: 161
            return false
        end
        local v2 = createSpy()
        v1.render = v2.value
        local v3 = createElement(v1)
        local v4 = u44.mountVirtualNode(v3, nil, "Test")
        expect(v2.callCount).to.equal(1)
        local v5 = createElement(v1)
        u44.updateVirtualNode(v4, v5)
        expect(v2.callCount).to.equal(1)
    end)
end