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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.legacyContext.spec
--                              Dumped in 0.000895 seconds
--                          Bytecode version 9  |  25 functions

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
    local NoopRenderer = require(u0.Parent.Parent.NoopRenderer)
    local Component = require(u0.Parent.Parent.Component)
    local u32 = createReconciler(NoopRenderer)
    it("should be provided as a mutable self._context in Component:init", function() -- Line: 18 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 21
            p1._context.foo = "bar"
        end
        function v1.render(p1) end
        local v2 = createElement(v1)
        local v3 = u32.mountVirtualNode(v2, nil, "Provider")
        assertDeepEqual(v3.legacyContext, {foo = "bar"})
    end)
    it("should be inherited from parent stateful nodes", function() -- Line: 40 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 44 -- upvalues: u5 (ref)
            u5 = p1._context
        end
        function u4.render(p1) end
        local v1 = Component:extend("Parent")
        function v1.render(p1) -- Line: 53 -- upvalues: createElement (upval), u4 (val)
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
    it("should be inherited from parent function nodes", function() -- Line: 72 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 76 -- upvalues: u5 (ref)
            u5 = p1._context
        end
        function u4.render(p1) end
        local v1 = createElement(function() -- Line: 83 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end)
        local v2 = {hello = "world", value = 6}
        local v3 = u32.mountVirtualNode(v1, nil, "Parent", nil, v2)
        expect(u5).never.to.equal(v2)
        expect(u5).never.to.equal(v3.legacyContext)
        assertDeepEqual(v3.legacyContext, v2)
        assertDeepEqual(u5, v2)
    end)
    it("should contain values put into the tree by parent nodes", function() -- Line: 102 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 106 -- upvalues: u5 (ref)
            u5 = p1._context
        end
        function u4.render(p1) end
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 115
            p1._context.frob = "ulator"
        end
        function v1.render(p1) -- Line: 119 -- upvalues: createElement (upval), u4 (val)
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
    it("should transfer context to children that are replaced", function() -- Line: 150 -- upvalues: Component (val), createElement (val), u32 (val), assertDeepEqual (val)
        local u13, u5
        local u4 = Component:extend("ConsumerA")
        function u4.init(p1) -- Line: 154 -- upvalues: u5 (ref)
            p1._context.A = "hello"
            u5 = p1._context
        end
        function u4.render(p1) end
        local u12 = Component:extend("ConsumerB")
        function u12.init(p1) -- Line: 166 -- upvalues: u13 (ref)
            p1._context.B = "hello"
            u13 = p1._context
        end
        function u12.render(p1) end
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 177
            p1._context.frob = "ulator"
        end
        function v1.render(p1) -- Line: 181 -- upvalues: createElement (upval), u12 (val), u4 (val)
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