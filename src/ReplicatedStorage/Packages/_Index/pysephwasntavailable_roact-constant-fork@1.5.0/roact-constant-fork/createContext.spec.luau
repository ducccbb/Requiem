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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createContext.spec
--                               Dumped in 0.00176 seconds
--                          Bytecode version 9  |  40 functions

return function() -- Line: 1
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Component = require(script.Parent.Component)
    local NoopRenderer = require(script.Parent.NoopRenderer)
    local Children = require(script.Parent.PropMarkers.Children)
    local createContext = require(script.Parent.createContext)
    local createElement = require(script.Parent.createElement)
    local createFragment = require(script.Parent.createFragment)
    local createReconciler = require(script.Parent.createReconciler)
    local createSpy = require(script.Parent.createSpy)
    local u48 = createReconciler(NoopRenderer)
    local RobloxRenderer = require(script.Parent.RobloxRenderer)
    local u56 = createReconciler(RobloxRenderer)
    it("should return a table", function() -- Line: 18 -- upvalues: createContext (val)
        local Test = createContext("Test")
        expect(Test).to.be.ok()
        expect((type(Test))).to.equal("table")
    end)
    it("should contain a Provider and a Consumer", function() -- Line: 24 -- upvalues: createContext (val)
        local Test = createContext("Test")
        expect(Test.Provider).to.be.ok()
        expect(Test.Consumer).to.be.ok()
    end)
    describe("Provider", function() -- Line: 30 -- upvalues: createContext (val), createSpy (val), createElement (val), u48 (val)
        it("should render its children", function() -- Line: 31 -- upvalues: createContext (upval), createSpy (upval), createElement (upval), u48 (upval)
            local Test = createContext("Test")
            local v1 = createSpy(function() -- Line: 34
                return nil
            end)
            local v2 = createElement(Test.Provider, {value = "Test"}, {Listener = createElement(v1.value)})
            local v3 = u48.mountVirtualTree(v2, nil, "Provide Tree")
            u48.unmountVirtualTree(v3)
            expect(v1.callCount).to.equal(1)
        end)
    end)
    describe("Consumer", function() -- Line: 51 -- upvalues: createContext (val), createElement (val), u48 (val), createSpy (val), Component (val), createFragment (val), Children (val)
        it("should expect a render function", function() -- Line: 52 -- upvalues: createContext (upval), createElement (upval), u48 (upval)
            local Test = createContext("Test")
            local u5 = createElement(Test.Consumer)
            expect(function() -- Line: 56 -- upvalues: u48 (upval), u5 (val)
                u48.mountVirtualTree(u5, nil, "Provide Tree")
            end).to.throw()
        end)
        it("should return the default value if there is no Provider", function() -- Line: 61 -- upvalues: createSpy (upval), createContext (upval), createElement (upval), u48 (upval)
            local v1 = createSpy()
            local Test = createContext("Test")
            local v2 = createElement(Test.Consumer, {render = v1.value})
            local v3 = u48.mountVirtualTree(v2, nil, "Provide Tree")
            u48.unmountVirtualTree(v3)
            v1:assertCalledWith("Test")
        end)
        it("should pass the value to the render function", function() -- Line: 75 -- upvalues: createSpy (upval), createContext (upval), createElement (upval), u48 (upval)
            local u1 = createSpy()
            local Test = createContext("Test")
            local v1 = createElement(Test.Provider, {value = "NewTest"}, {Listener = createElement(function() -- Line: 79 -- upvalues: createElement (upval), Test (val), u1 (val)
                return createElement(Test.Consumer, {render = u1.value})
            end)})
            local v2 = u48.mountVirtualTree(v1, nil, "Provide Tree")
            u48.unmountVirtualTree(v2)
            u1:assertCalledWith("NewTest")
        end)
        it("should update when the value updates", function() -- Line: 97 -- upvalues: createSpy (upval), createContext (upval), createElement (upval), u48 (upval)
            local u1 = createSpy()
            local Test = createContext("Test")
            local function Listener() -- Line: 101 -- upvalues: createElement (upval), Test (val), u1 (val)
                return createElement(Test.Consumer, {render = u1.value})
            end
            local v1 = createElement(Test.Provider, {value = "NewTest"}, {Listener = createElement(Listener)})
            local v2 = u48.mountVirtualTree(v1, nil, "Provide Tree")
            expect(u1.callCount).to.equal(1)
            u1:assertCalledWith("NewTest")
            u48.updateVirtualTree(v2, createElement(Test.Provider, {value = "ThirdTest"}, {Listener = createElement(Listener)}))
            expect(u1.callCount).to.equal(2)
            u1:assertCalledWith("ThirdTest")
            u48.unmountVirtualTree(v2)
        end)
        it("should update when the value updates through an update blocking component", function() -- Line: 138 -- upvalues: createSpy (upval), createContext (upval), Component (upval), createFragment (upval), Children (upval), createElement (upval), u48 (upval)
            local u1 = createSpy()
            local Test = createContext("Test")
            local v1 = Component:extend("UpdateBlocker")
            function v1.render(p1) -- Line: 144 -- upvalues: createFragment (upval), Children (upval)
                return createFragment(p1.props[Children])
            end
            function v1.shouldUpdate(p1) -- Line: 148
                return false
            end
            local function Listener() -- Line: 152 -- upvalues: createElement (upval), Test (val), u1 (val)
                return createElement(Test.Consumer, {render = u1.value})
            end
            local v2 = createElement(Test.Provider, {value = "NewTest"}, {Blocker = createElement(v1, nil, {Listener = createElement(Listener)})})
            local v3 = u48.mountVirtualTree(v2, nil, "Provide Tree")
            expect(u1.callCount).to.equal(1)
            u1:assertCalledWith("NewTest")
            u48.updateVirtualTree(v3, createElement(Test.Provider, {value = "ThirdTest"}, {Blocker = createElement(v1, nil, {Listener = createElement(Listener)})}))
            expect(u1.callCount).to.equal(2)
            u1:assertCalledWith("ThirdTest")
            u48.unmountVirtualTree(v3)
        end)
        it("should behave correctly when the default value is nil", function() -- Line: 188 -- upvalues: createContext (upval), createSpy (upval), createElement (upval), u48 (upval)
            local u2 = createContext(nil)
            local u4 = createSpy()
            local function Listener() -- Line: 192 -- upvalues: createElement (upval), u2 (val), u4 (val)
                return createElement(u2.Consumer, {render = u4.value})
            end
            local v1 = createElement(Listener)
            local v2 = u48.mountVirtualTree(v1, nil, "Provide Tree")
            expect(u4.callCount).to.equal(1)
            u4:assertCalledWith(nil)
            v2 = u48.updateVirtualTree(v2, createElement(Listener))
            u48.unmountVirtualTree(v2)
            expect(u4.callCount).to.equal(2)
            u4:assertCalledWith(nil)
        end)
    end)
    describe("Update order", function() -- Line: 210 -- upvalues: createContext (val), createElement (val), u48 (val)
        it("should update context at the same time as props", function() -- Line: 264 -- upvalues: createContext (upval), createElement (upval), u48 (upval)
            local u0, u1
            local u2 = 0
            local default = createContext("default")
            local function Listener(p1) -- Line: 273 -- upvalues: createElement (upval), default (val), u2 (ref), u0 (ref), u1 (ref)
                return createElement(default.Consumer, {
                    render = function(a1) -- Line: 275 -- upvalues: u2 (upval), p1 (val), u0 (upval), u1 (upval)
                        u2 = u2 + 1
                        if a1 == "context_1" then
                            expect(p1.someProp).to.equal("prop_1")
                            u0 = true
                            return
                        end
                        if a1 ~= "context_2" then
                            error("Unexpected context value")
                            return
                        end
                        expect(p1.someProp).to.equal("prop_2")
                        u1 = true
                    end,
                })
            end
            local v1 = createElement(default.Provider, {value = "context_1"}, {Child = createElement(Listener, {someProp = "prop_1"})})
            local v2 = createElement(default.Provider, {value = "context_2"}, {Child = createElement(Listener, {someProp = "prop_2"})})
            local v3 = u48.mountVirtualTree(v1, nil, "UpdateObservationIsFun")
            u48.updateVirtualTree(v3, v2)
            expect(u2).to.equal(2)
            expect(false).to.equal(true)
            expect(false).to.equal(true)
        end)
    end)
    it("does not throw if willUnmount is called twice on a context consumer", function() -- Line: 317 -- upvalues: createContext (val), Component (val), createElement (val), ReplicatedStorage (val), u56 (val)
        local u2 = createContext({})
        local u7 = Component:extend("LowestComponent")
        function u7.init(p1) end
        function u7.render(p1) -- Line: 323 -- upvalues: createElement (upval)
            return createElement("Frame")
        end
        function u7.didMount(p1) -- Line: 327
            p1.props.onDidMountCallback()
        end
        local u15 = Component:extend("FirstComponent")
        function u15.init(p1) end
        function u15.render(p1) -- Line: 334 -- upvalues: createElement (upval), u2 (val)
            return createElement(u2.Consumer, {
                render = function() -- Line: 336 -- upvalues: createElement (upval)
                    return createElement("TextLabel")
                end,
            })
        end
        local u22 = Component:extend("ChildComponent")
        function u22.init(p1) -- Line: 344
            p1:setState({firstTime = true})
        end
        local u24 = nil
        function u22.render(p1) -- Line: 350 -- upvalues: createElement (upval), u15 (val), u7 (val)
            if p1.state.firstTime then
                return createElement(u15)
            end
            return createElement(u7, {onDidMountCallback = p1.props.onDidMountCallback})
        end
        function u22.didMount(p1) -- Line: 360 -- upvalues: u24 (ref)
            function u24() -- Line: 361 -- upvalues: p1 (val)
                p1:setState({firstTime = false})
            end
        end
        local v1 = Component:extend("ParentComponent")
        local u32 = 0
        function v1.init(p1) -- Line: 370 -- upvalues: u32 (ref)
            p1:setState({count = 1})
            function p1.onDidMountCallback() -- Line: 373 -- upvalues: u32 (upval), p1 (val)
                u32 = u32 + 1
                if p1.state.count < 5 then
                    p1:setState({count = p1.state.count + 1})
                end
            end
        end
        function v1.render(p1) -- Line: 381 -- upvalues: createElement (upval), u2 (val), u22 (val)
            return createElement("Frame", {}, {Provider = createElement(u2.Provider, {value = {}}, {ChildComponent = createElement(u22, {count = p1.state.count, onDidMountCallback = p1.onDidMountCallback})})})
        end
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = ReplicatedStorage
        local v2 = createElement(v1)
        u56.mountVirtualNode(v2, ScreenGui, "Some Key")
        expect(function() -- Line: 400 -- upvalues: u24 (ref)
            u24()
        end).never.to.throw()
    end)
end