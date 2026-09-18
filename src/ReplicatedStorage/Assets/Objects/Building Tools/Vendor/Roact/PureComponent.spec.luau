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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.PureComponent.spec
--                              Dumped in 0.000438 seconds
--                          Bytecode version 9  |  10 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createElement = require(u0.Parent.createElement)
    local NoopRenderer = require(u0.Parent.NoopRenderer)
    local createReconciler = require(u0.Parent.createReconciler)
    local PureComponent = require(u0.Parent.PureComponent)
    local u22 = createReconciler(NoopRenderer)
    it("should be extendable", function() -- Line: 17 -- upvalues: PureComponent (val)
        local v1 = PureComponent:extend("MyComponent")
        expect(v1).to.be.ok()
    end)
    it("should skip updates for shallow-equal props", function() -- Line: 23 -- upvalues: PureComponent (val), createElement (val), u22 (val)
        local u0 = 0
        local u1 = nil
        local u6 = PureComponent:extend("PureChild")
        function u6.willUpdate(p1) -- Line: 29 -- upvalues: u0 (ref)
            u0 = u0 + 1
        end
        function u6.render(p1) -- Line: 33
            return nil
        end
        local v1 = PureComponent:extend("PureContainer")
        function v1.init(p1) -- Line: 39
            p1.state = {value = 0}
        end
        function v1.didMount(p1) -- Line: 45 -- upvalues: u1 (ref)
            function u1(a1) -- Line: 46 -- upvalues: p1 (val)
                p1:setState({value = a1})
            end
        end
        function v1.render(p1) -- Line: 53 -- upvalues: createElement (upval), u6 (val)
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