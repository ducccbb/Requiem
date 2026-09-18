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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.context.spec
--                               Dumped in 0.00221 seconds
--                          Bytecode version 9  |  35 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual)
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local oneChild = require(script.Parent.Parent.oneChild)
    local Component = require(script.Parent.Parent.Component)
    local u38 = createReconciler(NoopRenderer)
    it("should be provided as an internal api on Component", function() -- Line: 12 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 15
            p1:__addContext("foo", "bar")
        end
        function v1.render(p1) end
        local v2 = createElement(v1)
        local v3 = u38.mountVirtualNode(v2, nil, "Provider")
        assertDeepEqual(v3.context, {foo = "bar"})
    end)
    it("should be inherited from parent stateful nodes", function() -- Line: 33 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 37 -- upvalues: u5 (ref)
            u5 = {hello = p1:__getContext("hello"), value = p1:__getContext("value")}
        end
        function u4.render(p1) end
        local v1 = Component:extend("Parent")
        function v1.render(p1) -- Line: 48 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = {hello = "world", value = 6}
        local v4 = u38.mountVirtualNode(v2, nil, "Parent", v3)
        expect(u5).never.to.equal(v3)
        expect(u5).never.to.equal(v4.context)
        assertDeepEqual(v4.context, v3)
        assertDeepEqual(u5, v3)
    end)
    it("should be inherited from parent function nodes", function() -- Line: 67 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 71 -- upvalues: u5 (ref)
            u5 = {hello = p1:__getContext("hello"), value = p1:__getContext("value")}
        end
        function u4.render(p1) end
        local v1 = createElement(function() -- Line: 80 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end)
        local v2 = {hello = "world", value = 6}
        local v3 = u38.mountVirtualNode(v1, nil, "Parent", v2)
        expect(u5).never.to.equal(v2)
        expect(u5).never.to.equal(v3.context)
        assertDeepEqual(v3.context, v2)
        assertDeepEqual(u5, v2)
    end)
    it("should not copy the context table if it doesn't need to", function() -- Line: 99 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val), oneChild (val)
        local v1 = Component:extend("Parent")
        function v1.init(p1) -- Line: 102
            p1:__addContext("parent", "I'm here!")
        end
        function v1.render(p1) -- Line: 106 -- upvalues: createElement (upval)
            return createElement(function() end)
        end
        local v2 = createElement(v1)
        local v3 = u38.mountVirtualNode(v2, nil, "Parent")
        assertDeepEqual(v3.context, {parent = "I'm here!"})
        local v4 = oneChild(v3.children)
        expect(v3.context).to.equal(v4.context)
    end)
    it("should not allow context to move up the tree", function() -- Line: 128 -- upvalues: Component (val), createElement (val), u38 (val), oneChild (val), assertDeepEqual (val)
        local u4 = Component:extend("ChildProvider")
        function u4.init(p1) -- Line: 131
            p1:__addContext("child", "I'm here too!")
        end
        function u4.render(p1) end
        local v1 = Component:extend("ParentProvider")
        function v1.init(p1) -- Line: 139
            p1:__addContext("parent", "I'm here!")
        end
        function v1.render(p1) -- Line: 143 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = u38.mountVirtualNode(v2, nil, "Parent")
        local v4 = oneChild(v3.children)
        assertDeepEqual(v3.context, {parent = "I'm here!"})
        assertDeepEqual(v4.context, {parent = "I'm here!", child = "I'm here too!"})
    end)
    it("should contain values put into the tree by parent nodes", function() -- Line: 168 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u4 = Component:extend("Consumer")
        local u5 = nil
        function u4.init(p1) -- Line: 172 -- upvalues: u5 (ref)
            u5 = {dont = p1:__getContext("dont"), frob = p1:__getContext("frob")}
        end
        function u4.render(p1) end
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 183
            p1:__addContext("frob", "ulator")
        end
        function v1.render(p1) -- Line: 187 -- upvalues: createElement (upval), u4 (val)
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = {dont = "try it"}
        local v4 = u38.mountVirtualNode(v2, nil, "Consumer", v3)
        local v5 = {dont = "try it", frob = "ulator"}
        expect(v4.context).never.to.equal(v3)
        expect(u5).never.to.equal(v3)
        expect(u5).never.to.equal(v4.context)
        assertDeepEqual(v3, {dont = "try it"})
        assertDeepEqual(v4.context, v5)
        assertDeepEqual(u5, v5)
    end)
    it("should transfer context to children that are replaced", function() -- Line: 218 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u14, u6
        local u4 = Component:extend("ConsumerA")
        local function captureAllContext(p1) -- Line: 221
            return {A = p1:__getContext("A"), B = p1:__getContext("B"), frob = p1:__getContext("frob")}
        end
        function u4.init(p1) -- Line: 230 -- upvalues: u6 (ref), captureAllContext (val)
            p1:__addContext("A", "hello")
            u6 = captureAllContext(p1)
        end
        function u4.render(p1) end
        local u13 = Component:extend("ConsumerB")
        function u13.init(p1) -- Line: 241 -- upvalues: u14 (ref), captureAllContext (val)
            p1:__addContext("B", "hello")
            u14 = captureAllContext(p1)
        end
        function u13.render(p1) end
        local v1 = Component:extend("Provider")
        function v1.init(p1) -- Line: 251
            p1:__addContext("frob", "ulator")
        end
        function v1.render(p1) -- Line: 255 -- upvalues: createElement (upval), u13 (val), u4 (val)
            if p1.props.useConsumerB then
                return createElement(u13)
            end
            return createElement(u4)
        end
        local v2 = createElement(v1)
        local v3 = u38.mountVirtualNode(v2, nil, "Consumer")
        assertDeepEqual(nil, {frob = "ulator", A = "hello"})
        local v4 = createElement(v1, {useConsumerB = true})
        u38.updateVirtualNode(v3, v4)
        assertDeepEqual(nil, {frob = "ulator", B = "hello"})
    end)
end