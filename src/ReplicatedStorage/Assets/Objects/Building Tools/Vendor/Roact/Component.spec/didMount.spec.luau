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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.didMount.spec
--                              Dumped in 0.000296 seconds
--                          Bytecode version 9  |  4 functions

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
    local Type = require(u0.Parent.Parent.Type)
    local Component = require(u0.Parent.Parent.Component)
    local u38 = createReconciler(NoopRenderer)
    it("should be invoked when mounted", function() -- Line: 19 -- upvalues: Component (val), createSpy (val), createElement (val), u38 (val), Type (val)
        local v1 = Component:extend("MyComponent")
        local v2 = createSpy()
        v1.didMount = v2.value
        function v1.render(p1) -- Line: 26
            return nil
        end
        local v3 = createElement(v1)
        u38.mountVirtualNode(v3, nil, "Test")
        expect(v2.callCount).to.equal(1)
        local v4 = v2:captureValues("self")
        expect(Type.of(v4.self)).to.equal(Type.StatefulComponentInstance)
    end)
end