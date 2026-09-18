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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.PureComponent.spec
--                              Dumped in 0.000392 seconds
--                          Bytecode version 9  |  10 functions

return function() -- Line: 1
    local createElement = require(script.Parent.createElement)
    local NoopRenderer = require(script.Parent.NoopRenderer)
    local createReconciler = require(script.Parent.createReconciler)
    local PureComponent = require(script.Parent.PureComponent)
    local u22 = createReconciler(NoopRenderer)
    it("should be extendable", function() -- Line: 10 -- upvalues: PureComponent (val)
        local v1 = PureComponent:extend("MyComponent")
        expect(v1).to.be.ok()
    end)
    it("should skip updates for shallow-equal props", function() -- Line: 16 -- upvalues: PureComponent (val), createElement (val), u22 (val)
        local u0 = 0
        local u1 = nil
        local u6 = PureComponent:extend("PureChild")
        function u6.willUpdate(p1) -- Line: 22 -- upvalues: u0 (ref)
            u0 = u0 + 1
        end
        function u6.render(p1) -- Line: 26
            return nil
        end
        local v1 = PureComponent:extend("PureContainer")
        function v1.init(p1) -- Line: 32
            p1.state = {value = 0}
        end
        function v1.didMount(p1) -- Line: 38 -- upvalues: u1 (ref)
            function u1(a1) -- Line: 39 -- upvalues: p1 (val)
                p1:setState({value = a1})
            end
        end
        function v1.render(p1) -- Line: 46 -- upvalues: createElement (upval), u6 (val)
            return createElement(u6, {value = p1.state.value})
        end
        local v2 = createElement(v1)
        local v3 = u22.mountVirtualTree(v2, nil, "PureComponent Tree")
        expect(u0).to.equal(0)
        u1(1)
        expect(u0).to.equal(1)
        u1(1)
        expect(u0).to.equal(1)
        u1(2)
        expect(u0).to.equal(2)
        u1(1)
        expect(u0).to.equal(3)
        u22.unmountVirtualTree(v3)
    end)
end