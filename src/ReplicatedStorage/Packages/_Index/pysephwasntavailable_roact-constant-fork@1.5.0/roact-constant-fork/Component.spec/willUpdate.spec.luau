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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.willUpdate.spec
--                              Dumped in 0.000478 seconds
--                          Bytecode version 9  |  8 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual)
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local createSpy = require(script.Parent.Parent.createSpy)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Type = require(script.Parent.Parent.Type)
    local Component = require(script.Parent.Parent.Component)
    local u44 = createReconciler(NoopRenderer)
    it("should be invoked when updated via updateVirtualNode", function() -- Line: 13 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.willUpdate = v2.value
        function v1.render(p1) -- Line: 20
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
    it("it should be invoked when updated via setState", function() -- Line: 49 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local u5
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.willUpdate = v2.value
        function v1.init(p1) -- Line: 57 -- upvalues: u5 (ref)
            function u5(a1) -- Line: 58 -- upvalues: p1 (val)
                p1:setState(a1)
            end
            p1:setState({foo = 1})
        end
        function v1.render(p1) -- Line: 67
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