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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.init.spec
--                              Dumped in 0.000334 seconds
--                          Bytecode version 9  |  4 functions

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual)
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local createSpy = require(script.Parent.Parent.createSpy)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Type = require(script.Parent.Parent.Type)
    local Component = require(script.Parent.Parent.Component)
    local u44 = createReconciler(NoopRenderer)
    it("should be invoked with props when mounted", function() -- Line: 13 -- upvalues: Component (val), createSpy (val), createElement (val), u44 (val), Type (val), assertDeepEqual (val)
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.init = v2.value
        function v1.render(p1) -- Line: 20
            return nil
        end
        local v3 = {a = 5}
        local v4 = createElement(v1, v3)
        u44.mountVirtualNode(v4, nil, "Some Component Key")
        expect(v2.callCount).to.equal(1)
        local v5 = v2:captureValues("self", "props")
        expect(Type.of(v5.self)).to.equal(Type.StatefulComponentInstance)
        expect((typeof(v5.props))).to.equal("table")
        assertDeepEqual(v5.props, v3)
    end)
end