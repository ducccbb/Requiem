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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.willUpdate.spec
--                              Dumped in 0.000513 seconds
--                          Bytecode version 9  |  8 functions

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
    it("should be invoked when updated via updateVirtualNode", function() -- Line: 20 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.willUpdate = v2.value
        function v1.render(p1) -- Line: 27
            return nil
        end
        local v3 = createElement(v1, {a = 5})
        local v4 = u44.mountVirtualNode(v3, nil, "Test")
        local v5 = {a = 6, b = 2}
        local v6 = createElement(v1, v5)
        u44.updateVirtualNode(v4, v6)
        expect(v2.callCount).to.equal(1)
        local v7 = v2:captureValues("self", "newProps", "newState")
        expect(Type.of(v7.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(v7.newProps, v5)
        assertDeepEqual(v7.newState, {})
    end)
    it("it should be invoked when updated via setState", function() -- Line: 56 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local u5
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.willUpdate = v2.value
        function v1.init(p1) -- Line: 64 -- upvalues: u5 (ref)
            function u5(a1) -- Line: 65 -- upvalues: p1 (val)
                p1:setState(a1)
            end
            p1:setState({foo = 1})
        end
        function v1.render(p1) -- Line: 74
            return nil
        end
        local v3 = createElement(v1)
        u44.mountVirtualNode(v3, nil, "Test")
        expect(v2.callCount).to.equal(0)
        ;(nil)({foo = 2})
        expect(v2.callCount).to.equal(1)
        local v4 = v2:captureValues("self", "newProps", "newState")
        expect(Type.of(v4.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(v4.newProps, {})
        assertDeepEqual(v4.newState, {foo = 2})
    end)
end