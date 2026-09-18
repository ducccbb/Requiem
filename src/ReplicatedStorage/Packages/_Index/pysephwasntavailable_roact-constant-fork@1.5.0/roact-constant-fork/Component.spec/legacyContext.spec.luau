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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.legacyContext.spec
--                              Dumped in 0.000987 seconds
--                          Bytecode version 9  |  25 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual)
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Component = require(script.Parent.Parent.Component)
    local u32 = createReconciler(NoopRenderer)
    it("should be provided as a mutable self._context in Component:init", function() -- Line: 11 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 14
            p1._context.foo = "bar"
        end
        function v1.render(p1) end
        local v2 = createElement(v1)
        local v3 = u32.mountVirtualNode(v2, nil, "Provider")
        assertDeepEqual(v3.legacyContext, {foo = "bar"})
    end)
    it("should be inherited from parent stateful nodes", function() -- Line: 32 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 36 -- upvalues: u5 (ref)
            u5 = p1._context
        end
        function u4.render(p1) end
        local v1 = Component:extend("Parent")
        function v1.render(p1) -- Line: 44 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = {hello = "world", value = 6}
        local v4 = u32.mountVirtualNode(v2, nil, "Parent", nil, v3)
        expect(u5).never.to.equal(v3)
        expect(u5).never.to.equal(v4.legacyContext)
        assertDeepEqual(v4.legacyContext, v3)
        assertDeepEqual(u5, v3)
    end)
    it("should be inherited from parent function nodes", function() -- Line: 63 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 67 -- upvalues: u5 (ref)
            u5 = p1._context
        end
        function u4.render(p1) end
        local v1 = createElement(function() -- Line: 73 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end)
        local v2 = {hello = "world", value = 6}
        local v3 = u32.mountVirtualNode(v1, nil, "Parent", nil, v2)
        expect(u5).never.to.equal(v2)
        expect(u5).never.to.equal(v3.legacyContext)
        assertDeepEqual(v3.legacyContext, v2)
        assertDeepEqual(u5, v2)
    end)
    it("should contain values put into the tree by parent nodes", function() -- Line: 92 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 96 -- upvalues: u5 (ref)
            u5 = p1._context
        end
        function u4.render(p1) end
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 104
            p1._context.frob = "ulator"
        end
        function v1.render(p1) -- Line: 108 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = {dont = "try it"}
        local v4 = u32.mountVirtualNode(v2, nil, "Consumer", nil, v3)
        local v5 = {dont = "try it", frob = "ulator"}
        expect(v4.legacyContext).never.to.equal(v3)
        expect(u5).never.to.equal(v3)
        expect(u5).never.to.equal(v4.legacyContext)
        assertDeepEqual(v3, {dont = "try it"})
        assertDeepEqual(v4.legacyContext, v5)
        assertDeepEqual(u5, v5)
    end)
    it("should transfer context to children that are replaced", function() -- Line: 139 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u13, u5
        local u4 = Component:extend("ConsumerA")
        function u4.init(p1) -- Line: 143 -- upvalues: u5 (ref)
            p1._context.A = "hello"
            u5 = p1._context
        end
        function u4.render(p1) end
        local u12 = Component:extend("ConsumerB")
        function u12.init(p1) -- Line: 154 -- upvalues: u13 (ref)
            p1._context.B = "hello"
            u13 = p1._context
        end
        function u12.render(p1) end
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 164
            p1._context.frob = "ulator"
        end
        function v1.render(p1) -- Line: 168 -- upvalues: createElement (upval), u12 (val), u4 (val)
            if p1.props.useConsumerB then
                return createElement(u12)
            end
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = u32.mountVirtualNode(v2, nil, "Consumer")
        assertDeepEqual(nil, {frob = "ulator", A = "hello"})
        local v4 = createElement(v1, {useConsumerB = true})
        u32.updateVirtualNode(v3, v4)
        assertDeepEqual(nil, {frob = "ulator", B = "hello"})
    end)
end