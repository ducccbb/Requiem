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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createContext.spec
--                               Dumped in 0.00131 seconds
--                          Bytecode version 9  |  25 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Component = require(u0.Parent.Component)
    local NoopRenderer = require(u0.Parent.NoopRenderer)
    local Children = require(u0.Parent.PropMarkers.Children)
    local createContext = require(u0.Parent.createContext)
    local createElement = require(u0.Parent.createElement)
    local createFragment = require(u0.Parent.createFragment)
    local createReconciler = require(u0.Parent.createReconciler)
    local createSpy = require(u0.Parent.createSpy)
    local u43 = createReconciler(NoopRenderer)
    it("should return a table", function() -- Line: 20 -- upvalues: createContext (val)
        local Test = createContext("Test")
        expect(Test).to.be.ok()
        expect((type(Test))).to.equal("table")
    end)
    it("should contain a Provider and a Consumer", function() -- Line: 26 -- upvalues: createContext (val)
        local Test = createContext("Test")
        expect(Test.Provider).to.be.ok()
        expect(Test.Consumer).to.be.ok()
    end)
    describe("Provider", function() -- Line: 32 -- upvalues: createContext (val), createSpy (val), createElement (val), u43 (val)
        it("should render its children", function() -- Line: 33 -- upvalues: createContext (upval), createSpy (upval), createElement (upval), u43 (upval)
            local Test = createContext("Test")
            local v1 = createSpy(function() -- Line: 36
                return nil
            end)
            local v2 = createElement(Test.Provider, {value = "Test"}, {Listener = createElement(v1.value)})
            local v3 = u43.mountVirtualTree(v2, nil, "Provide Tree")
            u43.unmountVirtualTree(v3)
            expect(v1.callCount).to.equal(1)
        end)
    end)
    describe("Consumer", function() -- Line: 53 -- upvalues: createContext (val), createElement (val), u43 (val), createSpy (val), Component (val), createFragment (val), Children (val)
        it("should expect a render function", function() -- Line: 54 -- upvalues: createContext (upval), createElement (upval), u43 (upval)
            local Test = createContext("Test")
            local u5 = createElement(Test.Consumer)
            expect(function() -- Line: 58 -- upvalues: u43 (upval), u5 (val)
                u43.mountVirtualTree(u5, nil, "Provide Tree")
            end).to.throw()
        end)
        it("should return the default value if there is no Provider", function() -- Line: 63 -- upvalues: createSpy (upval), createContext (upval), createElement (upval), u43 (upval)
            local v1 = createSpy()
            local Test = createContext("Test")
            local v2 = createElement(Test.Consumer, {render = v1.value})
            local v3 = u43.mountVirtualTree(v2, nil, "Provide Tree")
            u43.unmountVirtualTree(v3)
            v1:assertCalledWith("Test")
        end)
        it("should pass the value to the render function", function() -- Line: 77 -- upvalues: createSpy (upval), createContext (upval), createElement (upval), u43 (upval)
            local u1 = createSpy()
            local Test = createContext("Test")
            local v1 = createElement(Test.Provider, {value = "NewTest"}, {Listener = createElement(function() -- Line: 81 -- upvalues: createElement (upval), Test (val), u1 (val)
                return createElement(Test.Consumer, {render = u1.value})
            end)})
            local v2 = u43.mountVirtualTree(v1, nil, "Provide Tree")
            u43.unmountVirtualTree(v2)
            u1:assertCalledWith("NewTest")
        end)
        it("should update when the value updates", function() -- Line: 99 -- upvalues: createSpy (upval), createContext (upval), createElement (upval), u43 (upval)
            local u1 = createSpy()
            local Test = createContext("Test")
            local function Listener() -- Line: 103 -- upvalues: createElement (upval), Test (val), u1 (val)
                return createElement(Test.Consumer, {render = u1.value})
            end
            local v1 = createElement(Test.Provider, {value = "NewTest"}, {Listener = createElement(Listener)})
            local v2 = u43.mountVirtualTree(v1, nil, "Provide Tree")
            expect(u1.callCount).to.equal(1)
            u1:assertCalledWith("NewTest")
            u43.updateVirtualTree(v2, createElement(Test.Provider, {value = "ThirdTest"}, {Listener = createElement(Listener)}))
            expect(u1.callCount).to.equal(2)
            u1:assertCalledWith("ThirdTest")
            u43.unmountVirtualTree(v2)
        end)
        it("should update when the value updates through an update blocking component", function() -- Line: 137 -- upvalues: createSpy (upval), createContext (upval), Component (upval), createFragment (upval), Children (upval), createElement (upval), u43 (upval)
            local u1 = createSpy()
            local Test = createContext("Test")
            local v1 = Component:extend("UpdateBlocker")
            function v1.render(p1) -- Line: 143 -- upvalues: createFragment (upval), Children (upval)
                return createFragment(p1.props[Children])
            end
            function v1.shouldUpdate(p1) -- Line: 147
                return false
            end
            local function Listener() -- Line: 151 -- upvalues: createElement (upval), Test (val), u1 (val)
                return createElement(Test.Consumer, {render = u1.value})
            end
            local v2 = createElement(Test.Provider, {value = "NewTest"}, {Blocker = createElement(v1, nil, {Listener = createElement(Listener)})})
            local v3 = u43.mountVirtualTree(v2, nil, "Provide Tree")
            expect(u1.callCount).to.equal(1)
            u1:assertCalledWith("NewTest")
            u43.updateVirtualTree(v3, createElement(Test.Provider, {value = "ThirdTest"}, {Blocker = createElement(v1, nil, {Listener = createElement(Listener)})}))
            expect(u1.callCount).to.equal(2)
            u1:assertCalledWith("ThirdTest")
            u43.unmountVirtualTree(v3)
        end)
        it("should behave correctly when the default value is nil", function() -- Line: 184 -- upvalues: createContext (upval), createSpy (upval), createElement (upval), u43 (upval)
            local u2 = createContext(nil)
            local u4 = createSpy()
            local function Listener() -- Line: 188 -- upvalues: createElement (upval), u2 (val), u4 (val)
                return createElement(u2.Consumer, {render = u4.value})
            end
            local v1 = createElement(Listener)
            local v2 = u43.mountVirtualTree(v1, nil, "Provide Tree")
            expect(u4.callCount).to.equal(1)
            u4:assertCalledWith(nil)
            v2 = u43.updateVirtualTree(v2, createElement(Listener))
            u43.unmountVirtualTree(v2)
            expect(u4.callCount).to.equal(2)
            u4:assertCalledWith(nil)
        end)
    end)
    describe("Update order", function() -- Line: 206 -- upvalues: createContext (val), createElement (val), u43 (val)
        it("should update context at the same time as props", function() -- Line: 260 -- upvalues: createContext (upval), createElement (upval), u43 (upval)
            local u0, u1
            local u2 = 0
            local default = createContext("default")
            local function Listener(p1) -- Line: 269 -- upvalues: createElement (upval), default (val), u2 (ref), u0 (ref), u1 (ref)
                return createElement(default.Consumer, {
                    render = function(a1) -- Line: 271 -- upvalues: u2 (upval), p1 (val), u0 (upval), u1 (upval)
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
            local v3 = u43.mountVirtualTree(v1, nil, "UpdateObservationIsFun")
            u43.updateVirtualTree(v3, v2)
            expect(u2).to.equal(2)
            expect(false).to.equal(true)
            expect(false).to.equal(true)
        end)
    end)
end