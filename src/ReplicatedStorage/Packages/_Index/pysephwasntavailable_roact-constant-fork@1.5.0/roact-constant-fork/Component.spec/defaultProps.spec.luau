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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.defaultProps.spec
--                              Dumped in 0.000894 seconds
--                          Bytecode version 9  |  9 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual)
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local None = require(script.Parent.Parent.None)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Component = require(script.Parent.Parent.Component)
    local u38 = createReconciler(NoopRenderer)
    it("should fill in when mounting before init", function() -- Line: 12 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u6
        local v1 = {a = 3, b = 2}
        local v2 = Component:extend("Foo")
        v2.defaultProps = v1
        function v2.init(p1) -- Line: 23 -- upvalues: u6 (ref)
            u6 = p1.props
        end
        function v2.render(p1) end
        local v3 = {b = 4, c = 6}
        local v4 = createElement(v2, v3)
        u38.mountVirtualNode(v4, nil, "Some Foo")
        assertDeepEqual(nil, {a = v1.a, b = v3.b, c = v3.c})
    end)
    it("should fill in when updating via props", function() -- Line: 49 -- upvalues: Component (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u6
        local v1 = {a = 3, b = 2}
        local v2 = Component:extend("Foo")
        v2.defaultProps = v1
        function v2.render(p1) -- Line: 60 -- upvalues: u6 (ref)
            u6 = p1.props
        end
        local v3 = createElement(v2, {b = 4, c = 6})
        local v4 = u38.mountVirtualNode(v3, nil, "Some Foo")
        local v5 = {c = 5}
        local v6 = createElement(v2, v5)
        u38.updateVirtualNode(v4, v6)
        assertDeepEqual(nil, {a = v1.a, b = v1.b, c = v5.c})
    end)
    it("should respect None to override a default prop with nil", function() -- Line: 91 -- upvalues: Component (val), None (val), createElement (val), u38 (val), assertDeepEqual (val)
        local u6
        local v1 = {a = 3, b = 2}
        local v2 = Component:extend("Foo")
        v2.defaultProps = v1
        function v2.render(p1) -- Line: 102 -- upvalues: u6 (ref)
            u6 = p1.props
        end
        local v3 = {c = 4, b = None}
        local v4 = createElement(v2, v3)
        u38.mountVirtualNode(v4, nil, "Some Foo")
        assertDeepEqual(nil, {a = v1.a, c = v3.c})
    end)
end