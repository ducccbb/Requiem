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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.setState.spec
--                               Dumped in 0.00298 seconds
--                          Bytecode version 9  |  89 functions

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local createSpy = require(script.Parent.Parent.createSpy)
    local None = require(script.Parent.Parent.None)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Component = require(script.Parent.Parent.Component)
    local u38 = createReconciler(NoopRenderer)
    describe("setState", function() -- Line: 12 -- upvalues: Component (val), createElement (val), u38 (val), None (val)
        it("should not trigger an extra update when called in init", function() -- Line: 13 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u2
            local u0 = 0
            local u1 = 0
            local v1 = Component:extend("InitComponent")
            function v1.init(p1) -- Line: 20
                p1:setState({a = 1})
            end
            function v1.willUpdate(p1) -- Line: 26 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end
            function v1.render(p1) -- Line: 30 -- upvalues: u0 (ref), u2 (ref)
                u0 = u0 + 1
                u2 = p1.state
                return nil
            end
            local v2 = createElement(v1)
            u38.mountVirtualTree(v2)
            expect(u0).to.equal(1)
            expect(u1).to.equal(0)
            expect((nil).a).to.equal(1)
        end)
        it("should throw when called in render", function() -- Line: 45 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1, v2
            local v3 = Component:extend("TestComponent")
            function v3.render(p1) -- Line: 48
                p1:setState({a = 1})
            end
            local v4 = createElement(v3)
            v1, v2 = pcall(u38.mountVirtualTree, v4)
            expect(v1).to.equal(false)
            expect(v2:match("render")).to.be.ok()
            expect(v2:match("TestComponent")).to.be.ok()
        end)
        it("should throw when called in shouldUpdate", function() -- Line: 63 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1, v2
            local v3 = Component:extend("TestComponent")
            function v3.render(p1) -- Line: 66
                return nil
            end
            function v3.shouldUpdate(p1) -- Line: 70
                p1:setState({a = 1})
            end
            local v4 = createElement(v3)
            local v5 = createElement(v3)
            local v6 = u38.mountVirtualTree(v4)
            v1, v2 = pcall(u38.updateVirtualTree, v6, v5)
            expect(v1).to.equal(false)
            expect(v2:match("shouldUpdate")).to.be.ok()
            expect(v2:match("TestComponent")).to.be.ok()
        end)
        it("should throw when called in willUpdate", function() -- Line: 88 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1, v2
            local v3 = Component:extend("TestComponent")
            function v3.render(p1) -- Line: 91
                return nil
            end
            function v3.willUpdate(p1) -- Line: 95
                p1:setState({a = 1})
            end
            local v4 = createElement(v3)
            local v5 = createElement(v3)
            local v6 = u38.mountVirtualTree(v4)
            v1, v2 = pcall(u38.updateVirtualTree, v6, v5)
            expect(v1).to.equal(false)
            expect(v2:match("willUpdate")).to.be.ok()
            expect(v2:match("TestComponent")).to.be.ok()
        end)
        it("should not throw when called in willUnmount", function() -- Line: 112 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("TestComponent")
            function v1.render(p1) -- Line: 115
                return nil
            end
            function v1.willUnmount(p1) -- Line: 119
                p1:setState({a = 1})
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualTree(v2)
            local v4 = pcall(u38.unmountVirtualTree, v3)
            expect(v4).to.equal(true)
        end)
        it("should remove values from state when the value is None", function() -- Line: 133 -- upvalues: Component (upval), createElement (upval), u38 (upval), None (upval)
            local u5
            local v1 = Component:extend("TestComponent")
            local u6 = nil
            function v1.init(p1) -- Line: 137 -- upvalues: u5 (ref), u6 (ref)
                function u5(a1) -- Line: 138 -- upvalues: p1 (val)
                    p1:setState(a1)
                end
                function u6() -- Line: 142 -- upvalues: p1 (val)
                    return p1.state
                end
                p1:setState({value = 0})
            end
            function v1.render(p1) -- Line: 151
                return nil
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(u6().value).to.equal(0)
            ;(nil)({value = None})
            expect(u6().value).to.equal(nil)
            u38.unmountVirtualNode(v3)
        end)
        it("should invoke functions to compute a partial state", function() -- Line: 169 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u5
            local v1 = Component:extend("TestComponent")
            local u6 = nil
            local u7 = nil
            function v1.init(p1) -- Line: 173 -- upvalues: u5 (ref), u6 (ref), u7 (ref)
                function u5(a1) -- Line: 174 -- upvalues: p1 (val)
                    p1:setState(a1)
                end
                function u6() -- Line: 178 -- upvalues: p1 (val)
                    return p1.state
                end
                function u7() -- Line: 182 -- upvalues: p1 (val)
                    return p1.props
                end
                p1:setState({value = 0})
            end
            function v1.render(p1) -- Line: 191
                return nil
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(u6().value).to.equal(0)
            ;(nil)(function(p1, p2) -- Line: 200 -- upvalues: u6 (ref), u7 (ref)
                expect(p1).to.equal(u6())
                expect(p2).to.equal(u7())
                return {value = p1.value + 1}
            end)
            expect(u6().value).to.equal(1)
            u38.unmountVirtualNode(v3)
        end)
        it("should cancel rendering if the function returns nil", function() -- Line: 214 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u5
            local v1 = Component:extend("TestComponent")
            local u6 = 0
            function v1.init(p1) -- Line: 219 -- upvalues: u5 (ref)
                function u5(a1) -- Line: 220 -- upvalues: p1 (val)
                    p1:setState(a1)
                end
                p1:setState({value = 0})
            end
            function v1.render(p1) -- Line: 229 -- upvalues: u6 (ref)
                u6 = u6 + 1
                return nil
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(u6).to.equal(1)
            ;(nil)(function(p1, p2) -- Line: 238
                return nil
            end)
            expect(u6).to.equal(1)
            u38.unmountVirtualNode(v3)
        end)
    end)
    describe("setState suspension", function() -- Line: 248 -- upvalues: Component (val), createElement (val), u38 (val), createSpy (val)
        it("should defer setState triggered while reconciling", function() -- Line: 249 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u5
            local u4 = Component:extend("Child")
            function u4.render(p1) -- Line: 253
                return nil
            end
            function u4.didMount(p1) -- Line: 257
                p1.props.callback()
            end
            local v1 = Component:extend("Parent")
            function v1.init(p1) -- Line: 263 -- upvalues: u5 (ref)
                function u5() -- Line: 264 -- upvalues: p1 (val)
                    return p1.state
                end
            end
            function v1.render(p1) -- Line: 269 -- upvalues: createElement (upval), u4 (val)
                return createElement(u4, {
                    callback = function() -- Line: 271 -- upvalues: p1 (val)
                        p1:setState({foo = "bar"})
                    end,
                })
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(v3).to.be.ok()
            expect((nil)().foo).to.equal("bar")
        end)
        it("should defer setState triggered while reconciling during an update", function() -- Line: 289 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u4 = Component:extend("Child")
            local u5 = nil
            function u4.render(p1) -- Line: 293
                return nil
            end
            function u4.didUpdate(p1) -- Line: 297
                p1.props.callback()
            end
            local v1 = Component:extend("Parent")
            function v1.init(p1) -- Line: 303 -- upvalues: u5 (ref)
                function u5() -- Line: 304 -- upvalues: p1 (val)
                    return p1.state
                end
            end
            function v1.render(p1) -- Line: 309 -- upvalues: createElement (upval), u4 (val)
                return createElement(u4, {
                    callback = function() -- Line: 311 -- upvalues: p1 (val)
                        if not p1.state.foo then
                            p1:setState({foo = "bar"})
                        end
                    end,
                })
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(v3).to.be.ok()
            expect(u5().foo).to.equal(nil)
            v3 = u38.updateVirtualNode(v3, createElement(v1))
            expect(v3).to.be.ok()
            expect(u5().foo).to.equal("bar")
            u38.unmountVirtualNode(v3)
        end)
        it("should combine pending state changes properly", function() -- Line: 339 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1
            local u4 = Component:extend("Child")
            local u5 = nil
            function u4.render(p1) -- Line: 343
                return nil
            end
            function u4.didMount(p1) -- Line: 347
                p1.props.callback("foo", 1)
                p1.props.callback("bar", 3)
            end
            local v2 = Component:extend("Parent")
            function v2.init(p1) -- Line: 354 -- upvalues: u5 (ref)
                function u5() -- Line: 355 -- upvalues: p1 (val)
                    return p1.state
                end
            end
            function v2.render(p1) -- Line: 360 -- upvalues: createElement (upval), u4 (val)
                return createElement(u4, {
                    callback = function(a1, p2) -- Line: 362 -- upvalues: p1 (val)
                        local v1 = {}
                        v1[a1] = p2
                        p1:setState(v1)
                    end,
                })
            end
            local v3 = createElement(v2)
            v1 = u38.mountVirtualNode(v3, nil, "Test")
            expect(v1).to.be.ok()
            expect(u5().foo).to.equal(1)
            expect(u5().bar).to.equal(3)
            u38.unmountVirtualNode(v1)
        end)
        it("should abort properly when functional setState returns nil while deferred", function() -- Line: 383 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local u4 = Component:extend("Child")
            function u4.render(p1) -- Line: 386
                return nil
            end
            function u4.didMount(p1) -- Line: 390
                p1.props.callback()
            end
            local v1 = Component:extend("Parent")
            local v2 = createSpy(function(p1) -- Line: 396 -- upvalues: createElement (upval), u4 (val)
                return createElement(u4, {
                    callback = function() -- Line: 398 -- upvalues: p1 (val)
                        p1:setState(function() -- Line: 399
                            return nil
                        end)
                    end,
                })
            end)
            v1.render = v2.value
            local v3 = createElement(v1)
            local v4 = u38.mountVirtualNode(v3, nil, "Test")
            expect(v4).to.be.ok()
            expect(v2.callCount).to.equal(1)
            u38.unmountVirtualNode(v4)
        end)
        it("should still apply pending state if a subsequent state update was aborted", function() -- Line: 421 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u5
            local u4 = Component:extend("Child")
            function u4.render(p1) -- Line: 425
                return nil
            end
            function u4.didMount(p1) -- Line: 429
                p1.props.callback(function() -- Line: 430
                    return {foo = 1}
                end)
                p1.props.callback(function() -- Line: 435
                    return nil
                end)
            end
            local v1 = Component:extend("Parent")
            function v1.init(p1) -- Line: 442 -- upvalues: u5 (ref)
                function u5() -- Line: 443 -- upvalues: p1 (val)
                    return p1.state
                end
            end
            function v1.render(p1) -- Line: 448 -- upvalues: createElement (upval), u4 (val)
                return createElement(u4, {
                    callback = function(a1) -- Line: 450 -- upvalues: p1 (val)
                        p1:setState(a1)
                    end,
                })
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(v3).to.be.ok()
            expect((nil)().foo).to.equal(1)
            u38.unmountVirtualNode(v3)
        end)
        it("should not re-process new state when pending state is present after update", function() -- Line: 468 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local u0
            local u1 = nil
            local v1 = Component:extend("MyComponent")
            function v1.init(p1) -- Line: 474 -- upvalues: u0 (ref), u1 (ref)
                p1:setState({hasUpdatedOnce = false, counter = 0})
                function u0(a1) -- Line: 480 -- upvalues: p1 (val)
                    p1:setState(a1)
                end
                function u1() -- Line: 484 -- upvalues: p1 (val)
                    return p1.state
                end
            end
            function v1.render(p1) -- Line: 489
                return nil
            end
            function v1.didUpdate(p1) -- Line: 493
                if p1.state.hasUpdatedOnce == false then
                    p1:setState({hasUpdatedOnce = true})
                end
            end
            local v2 = createElement(v1)
            u38.mountVirtualNode(v2, nil, "Test")
            expect(u1().hasUpdatedOnce).to.equal(false)
            expect(u1().counter).to.equal(0)
            ;(nil)(function(p1) -- Line: 510
                return {counter = p1.counter + 1}
            end)
            expect(u1().hasUpdatedOnce).to.equal(true)
            expect(u1().counter).to.equal(1)
        end)
        it("should throw when an infinite update is triggered", function() -- Line: 520 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1, v2
            local v3 = Component:extend("InfiniteUpdater")
            function v3.render(p1) -- Line: 523
                return nil
            end
            function v3.didMount(p1) -- Line: 527
                p1:setState({})
            end
            function v3.didUpdate(p1) -- Line: 531
                p1:setState({})
            end
            local v4 = createElement(v3)
            v1, v2 = pcall(u38.mountVirtualNode, v4, nil, "Test")
            expect(v1).to.equal(false)
            expect(v2:find("InfiniteUpdater")).to.be.ok()
            expect(v2:find("reached the setState update recursion limit")).to.be.ok()
        end)
        itSKIP("should process single updates with both new and pending state", function() end)
        it("should call trigger update after didMount when setting state in didMount", function() -- Line: 553 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            function v1.init(p1) -- Line: 564
                p1:setState({status = "initial mount"})
                p1.isMounted = false
            end
            function v1.render(p1) -- Line: 572
                return nil
            end
            function v1.didMount(p1) -- Line: 576
                p1:setState({status = "mounted"})
                p1.isMounted = true
            end
            function v1.didUpdate(p1, p2, p3) -- Line: 584
                expect(p3.status).to.equal("initial mount")
                expect(p1.state.status).to.equal("mounted")
                expect(p1.isMounted).to.equal(true)
            end
            local v2 = createElement(v1)
            local v3 = u38.mountVirtualNode(v2, nil, "Test")
            expect(v3).to.be.ok()
        end)
    end)
end