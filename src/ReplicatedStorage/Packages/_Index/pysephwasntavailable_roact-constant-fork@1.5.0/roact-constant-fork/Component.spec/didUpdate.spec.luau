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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.didUpdate.spec
--                              Dumped in 0.000588 seconds
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
        v1.didUpdate = v2.value
        function v1.render(p1) -- Line: 19
            return nil
        end
        local v3 = {a = 5}
        local v4 = createElement(v1, v3)
        local v5 = u44.mountVirtualNode(v4, nil, "Test")
        expect(v2.callCount).to.equal(0)
        local v6 = createElement(v1, {a = 6, b = 2})
        u44.updateVirtualNode(v5, v6)
        expect(v2.callCount).to.equal(1)
        local v7 = v2:captureValues("self", "oldProps", "oldState")
        expect(Type.of(v7.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(v7.oldProps, v3)
        assertDeepEqual(v7.oldState, {})
    end)
    it("should be invoked when updated via setState", function() -- Line: 50 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local u9
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.didUpdate = v2.value
        local u8 = {a = 4}
        function v1.init(p1) -- Line: 61 -- upvalues: u9 (ref), u8 (val)
            function u9(...) -- Line: 62 -- upvalues: p1 (val)
                return p1:setState(...)
            end
            p1:setState(u8)
        end
        function v1.render(p1) end
        local v3 = createElement(v1)
        u44.mountVirtualNode(v3, nil, "Test")
        expect(v2.callCount).to.equal(0)
        ;(nil)({a = 5})
        expect(v2.callCount).to.equal(1)
        local v4 = v2:captureValues("self", "oldProps", "oldState")
        expect(Type.of(v4.self)).to.equal(Type.StatefulComponentInstance)
        assertDeepEqual(v4.oldProps, {})
        assertDeepEqual(v4.oldState, u8)
    end)
end