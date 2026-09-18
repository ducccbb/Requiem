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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.getDerivedStateFromProps.spec
--                               Dumped in 0.00126 seconds
--                          Bytecode version 9  |  25 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual)
    local createSpy = require(script.Parent.Parent.createSpy)
    local createElement = require(script.Parent.Parent.createElement)
    local createFragment = require(script.Parent.Parent.createFragment)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Component = require(script.Parent.Parent.Component)
    local u44 = createReconciler(NoopRenderer)
    it("should be invoked on initial mount", function() -- Line: 13 -- upvalues: createSpy (val), Component (val), createElement (val), u44 (val), assertDeepEqual (val)
        local v1 = createSpy()
        local v2 = Component:extend("WithDerivedState")
        v2.getDerivedStateFromProps = v1.value
        function v2.render(p1) -- Line: 19
            return nil
        end
        local v3 = createElement(v2, {someProp = 1})
        u44.mountVirtualNode(v3, nil, "WithDerivedState")
        expect(v1.callCount).to.equal(1)
        local v4 = v1:captureValues("props", "state")
        assertDeepEqual(v4.props, {someProp = 1})
        assertDeepEqual(v4.state, {})
    end)
    it("should be invoked when updated via props", function() -- Line: 39 -- upvalues: createSpy (val), Component (val), u44 (val), createElement (val), assertDeepEqual (val)
        local v1 = createSpy()
        local v2 = Component:extend("WithDerivedState")
        v2.getDerivedStateFromProps = v1.value
        function v2.render(p1) -- Line: 45
            return nil
        end
        local v3 = createElement(v2, {someProp = 1})
        local v4 = u44.mountVirtualNode(v3, nil, "WithDerivedState")
        u44.updateVirtualNode(v4, createElement(v2, {someProp = 2}))
        expect(v1.callCount).to.equal(2)
        v3 = v1:captureValues("props", "state")
        assertDeepEqual(v3.props, {someProp = 2})
        assertDeepEqual(v3.state, {})
    end)
    it("should be invoked when updated via state", function() -- Line: 75 -- upvalues: createSpy (val), Component (val), createElement (val), u44 (val), assertDeepEqual (val)
        local v1 = createSpy()
        local v2 = Component:extend("WithDerivedState")
        v2.getDerivedStateFromProps = v1.value
        function v2.init(p1) -- Line: 81
            p1:setState({someState = 1})
        end
        function v2.render(p1) -- Line: 87
            return nil
        end
        local v3 = createElement(v2)
        local v4 = u44.mountVirtualNode(v3, nil, "WithDerivedState")
        u44.updateVirtualNode(v4, v3, {someState = 2})
        expect(v1.callCount).to.equal(4)
        local v5 = v1:captureValues("props", "state")
        assertDeepEqual(v5.props, {})
        assertDeepEqual(v5.state, {someState = 2})
    end)
    it("should be invoked when updating via state in init (which skips reconciliation)", function() -- Line: 114 -- upvalues: createSpy (val), Component (val), createElement (val), u44 (val), assertDeepEqual (val)
        local v1 = createSpy()
        local v2 = Component:extend("WithDerivedState")
        v2.getDerivedStateFromProps = v1.value
        function v2.init(p1) -- Line: 120
            p1:setState({stateFromInit = 1})
        end
        function v2.render(p1) -- Line: 126
            return nil
        end
        local v3 = createElement(v2, {someProp = 1})
        u44.mountVirtualNode(v3, nil, "WithDerivedState")
        expect(v1.callCount).to.equal(3)
        local v4 = v1:captureValues("props", "state")
        assertDeepEqual(v4.props, {someProp = 1})
        assertDeepEqual(v4.state, {stateFromInit = 1})
    end)
    it("should receive defaultProps", function() -- Line: 154 -- upvalues: createSpy (val), Component (val), createElement (val), u44 (val), assertDeepEqual (val)
        local v1 = createSpy()
        local v2 = Component:extend("WithDerivedState")
        v2.defaultProps = {someDefaultProp = "foo"}
        v2.getDerivedStateFromProps = v1.value
        function v2.render(p1) -- Line: 164
            return nil
        end
        local v3 = createElement(v2, {someProp = 1})
        local v4 = u44.mountVirtualNode(v3, nil, "WithDerivedState")
        expect(v1.callCount).to.equal(1)
        local v5 = v1:captureValues("props", "state")
        assertDeepEqual(v5.props, {someDefaultProp = "foo", someProp = 1})
        v3 = createElement(v2, {someProp = 2})
        u44.updateVirtualNode(v4, v3)
        expect(v1.callCount).to.equal(2)
        v5 = v1:captureValues("props", "state")
        assertDeepEqual(v5.props, {someDefaultProp = "foo", someProp = 2})
    end)
    it("should derive state for all setState updates, even when deferred", function() -- Line: 202 -- upvalues: Component (val), createSpy (val), createFragment (val), createElement (val), u44 (val)
        local u4 = Component:extend("Child")
        local u7 = createSpy(function() -- Line: 204
            return {}
        end)
        local v1 = createSpy()
        function u4.render(p1) -- Line: 209
            return nil
        end
        function u4.didMount(p1) -- Line: 213
            p1.props.callback()
        end
        local v2 = Component:extend("Parent")
        v2.getDerivedStateFromProps = v1.value
        function v2.render(p1) -- Line: 221 -- upvalues: u7 (val), createFragment (upval), createElement (upval), u4 (val)
            local function v1() -- Line: 222 -- upvalues: p1 (val), u7 (upval)
                p1:setState(u7.value)
            end
            return createFragment({ChildA = createElement(u4, {callback = v1}), ChildB = createElement(u4, {callback = v1})})
        end
        local v3 = createElement(v2)
        u44.mountVirtualNode(v3, nil, "Test")
        expect(u7.callCount).to.equal(2)
        expect(v1.callCount).to.equal(3)
    end)
    it("should have derived state after assigning to state in init", function() -- Line: 248 -- upvalues: createSpy (val), Component (val), createElement (val), u44 (val), assertDeepEqual (val)
        local u0
        local v1 = createSpy(function() -- Line: 250
            return {derived = true}
        end)
        local v2 = Component:extend("WithDerivedState")
        v2.getDerivedStateFromProps = v1.value
        function v2.init(p1) -- Line: 259 -- upvalues: u0 (ref)
            p1.state = {init = true}
            function u0() -- Line: 264 -- upvalues: p1 (val)
                return p1.state
            end
        end
        function v2.render(p1) -- Line: 269
            return nil
        end
        local v3 = createElement(v2)
        u44.mountVirtualNode(v3, nil, "WithDerivedState")
        expect(v1.callCount).to.equal(2)
        assertDeepEqual((nil)(), {init = true, derived = true})
    end)
end