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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.validateProps.spec
--                               Dumped in 0.00139 seconds
--                          Bytecode version 9  |  38 functions

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local createSpy = require(script.Parent.Parent.createSpy)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local GlobalConfig = require(script.Parent.Parent.GlobalConfig)
    local Component = require(script.Parent.Parent.Component)
    local u38 = createReconciler(NoopRenderer)
    it("should be invoked when mounted", function() -- Line: 12 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 17 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 20
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 26
                return nil
            end
            local v3 = createElement(v1)
            u38.mountVirtualNode(v3, nil, "Test")
            expect(v2.callCount).to.equal(1)
        end)
    end)
    it("should be invoked when props change", function() -- Line: 39 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 44 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 47
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 53
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
    it("should not be invoked when state changes", function() -- Line: 76 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 81 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local u5
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 85
                return true
            end)
            v1.validateProps = v2.value
            function v1.init(p1) -- Line: 91 -- upvalues: u5 (ref)
                function u5(a1) -- Line: 92 -- upvalues: p1 (val)
                    p1:setState(a1)
                end
            end
            function v1.render(p1) -- Line: 97
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
    it("should throw if validateProps is not a function", function() -- Line: 119 -- upvalues: GlobalConfig (val), Component (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 124 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            v1.validateProps = 1
            function v1.render(p1) -- Line: 128
                return nil
            end
            local u9 = createElement(v1)
            expect(function() -- Line: 136 -- upvalues: u38 (upval), u9 (val)
                u38.mountVirtualNode(u9, nil, "Test")
            end).to.throw()
        end)
    end)
    it("should throw if validateProps returns false", function() -- Line: 142 -- upvalues: GlobalConfig (val), Component (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 147 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            function v1.validateProps() -- Line: 149
                return false
            end
            function v1.render(p1) -- Line: 153
                return nil
            end
            local u9 = createElement(v1)
            expect(function() -- Line: 161 -- upvalues: u38 (upval), u9 (val)
                u38.mountVirtualNode(u9, nil, "Test")
            end).to.throw()
        end)
    end)
    it("should include the component name in the error message", function() -- Line: 167 -- upvalues: GlobalConfig (val), Component (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 172 -- upvalues: Component (upval), createElement (upval), u38 (upval)
            local v1, v2
            local v3 = Component:extend("MyComponent")
            function v3.validateProps() -- Line: 174
                return false
            end
            function v3.render(p1) -- Line: 178
                return nil
            end
            local u9 = createElement(v3)
            v1, v2 = pcall(function() -- Line: 186 -- upvalues: u38 (upval), u9 (val)
                u38.mountVirtualNode(u9, nil, "Test")
            end)
            expect(v1).to.equal(false)
            local v4 = v2:find("MyComponent")
            expect(v4).to.be.ok()
        end)
    end)
    it("should be invoked after defaultProps are applied", function() -- Line: 196 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = true}
        GlobalConfig.scoped(v1, function() -- Line: 201 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 204
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 210
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
    it("should not be invoked if the flag is off", function() -- Line: 239 -- upvalues: GlobalConfig (val), Component (val), createSpy (val), createElement (val), u38 (val)
        local v1 = {propValidation = false}
        GlobalConfig.scoped(v1, function() -- Line: 244 -- upvalues: Component (upval), createSpy (upval), createElement (upval), u38 (upval)
            local v1 = Component:extend("MyComponent")
            local v2 = createSpy(function() -- Line: 247
                return true
            end)
            v1.validateProps = v2.value
            function v1.render(p1) -- Line: 253
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