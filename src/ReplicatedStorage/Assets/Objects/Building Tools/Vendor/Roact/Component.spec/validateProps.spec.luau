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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.validateProps.spec
--                               Dumped in 0.00117 seconds
--                          Bytecode version 9  |  38 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createElement = require(u0.Parent.Parent.createElement)
    local createReconciler = require(u0.Parent.Parent.createReconciler)
    local createSpy = require(u0.Parent.Parent.createSpy)
    local NoopRenderer = require(u0.Parent.Parent.NoopRenderer)
    local GlobalConfig = require(u0.Parent.Parent.GlobalConfig)
    local Component = require(u0.Parent.Parent.Component)
    local u38 = createReconciler(NoopRenderer)
    it("should be invoked when mounted", function() -- Line: 19 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 24 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 27
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 33
                return nil
            end
            local v3 = createElement(v1)
            u38.mountVirtualNode(v3, nil, "Test")
            expect(v2.callCount).to.equal(1)
        end)
    end)
    it("should be invoked when props change", function() -- Line: 46 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 51 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 54
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 60
                return nil
            end
            local v3 = createElement(v1, {a = 1})
            local v4 = u38.mountVirtualNode(v3, nil, "Test")
            expect(v2.callCount).to.equal(1)
            v2:assertCalledWithDeepEqual({a = 1})
            local v5 = createElement(v1, {a = 2})
            u38.updateVirtualNode(v4, v5)
            expect(v2.callCount).to.equal(2)
            v2:assertCalledWithDeepEqual({a = 2})
        end)
    end)
    it("should not be invoked when state changes", function() -- Line: 83 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 88 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local u5
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 92
                return true
            end)
            v1.validateProps = v2.value
            function v1.init(p1) -- Line: 98 -- upvalues: u5 (ref)
                function u5(a1) -- Line: 99 -- upvalues: p1 (val)
                    p1:setState(a1)
                end
            end
            function v1.render(p1) -- Line: 104
                return nil
            end
            local v3 = createElement(v1, {a = 1})
            u38.mountVirtualNode(v3, nil, "Test")
            expect(v2.callCount).to.equal(1)
            v2:assertCalledWithDeepEqual({a = 1})
            ;(nil)({b = 1})
            expect(v2.callCount).to.equal(1)
        end)
    end)
    it("should throw if validateProps is not a function", function() -- Line: 126 -- upvalues: GlobalConfig (val), Component (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 131 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            v1.validateProps = 1
            function v1.render(p1) -- Line: 135
                return nil
            end
            local u9 = createElement(v1)
            expect(function() -- Line: 143 -- upvalues: u38 (upval), u9 (val)
                u38.mountVirtualNode(u9, nil, "Test")
            end).to.throw()
        end)
    end)
    it("should throw if validateProps returns false", function() -- Line: 149 -- upvalues: GlobalConfig (val), Component (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 154 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            function v1.validateProps() -- Line: 156
                return false
            end
            function v1.render(p1) -- Line: 160
                return nil
            end
            local u9 = createElement(v1)
            expect(function() -- Line: 168 -- upvalues: u38 (upval), u9 (val)
                u38.mountVirtualNode(u9, nil, "Test")
            end).to.throw()
        end)
    end)
    it("should include the component name in the error message", function() -- Line: 174 -- upvalues: GlobalConfig (val), Component (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 179 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1, v2
            local v3 = Component:extend("MyComponent")
            function v3.validateProps() -- Line: 181
                return false
            end
            function v3.render(p1) -- Line: 185
                return nil
            end
            local u9 = createElement(v3)
            v1, v2 = pcall(function() -- Line: 193 -- upvalues: u38 (upval), u9 (val)
                u38.mountVirtualNode(u9, nil, "Test")
            end)
            expect(v1).to.equal(false)
            local v4 = v2:find("MyComponent")
            expect(v4).to.be.ok()
        end)
    end)
    it("should be invoked after defaultProps are applied", function() -- Line: 203 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 208 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 211
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 217
                return nil
            end
            v1.defaultProps = {b = 2}
            local v3 = createElement(v1, {a = 1})
            local v4 = u38.mountVirtualNode(v3, nil, "Test")
            expect(v2.callCount).to.equal(1)
            v2:assertCalledWithDeepEqual({a = 1, b = 2})
            local v5 = createElement(v1, {a = 2})
            u38.updateVirtualNode(v4, v5)
            expect(v2.callCount).to.equal(2)
            v2:assertCalledWithDeepEqual({a = 2, b = 2})
        end)
    end)
    it("should not be invoked if the flag is off", function() -- Line: 246 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = false}
        GlobalConfig.scoped(v1, function() -- Line: 251 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 254
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 260
                return nil
            end
            local v3 = createElement(v1, {a = 1})
            local v4 = u38.mountVirtualNode(v3, nil, "Test")
            expect(v2.callCount).to.equal(0)
            local v5 = createElement(v1, {a = 2})
            u38.updateVirtualNode(v4, v5)
            expect(v2.callCount).to.equal(0)
        end)
    end)
end