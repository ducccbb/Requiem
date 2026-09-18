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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Component.spec.getElementTraceback.spec
--                              Dumped in 0.000441 seconds
--                          Bytecode version 9  |  11 functions

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement)
    local createReconciler = require(script.Parent.Parent.createReconciler)
    local GlobalConfig = require(script.Parent.Parent.GlobalConfig)
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer)
    local Component = require(script.Parent.Parent.Component)
    local u32 = createReconciler(NoopRenderer)
    it("should return stack traces in initial renders", function() -- Line: 11 -- upvalues: Component (val), GlobalConfig (val), createElement (val), u32 (val)
        local u5
        local u4 = Component:extend("TestComponent")
        function u4.init(p1) -- Line: 15 -- upvalues: u5 (ref)
            u5 = p1:getElementTraceback()
        end
        function u4.render(p1) -- Line: 19
            return nil
        end
        GlobalConfig.scoped({elementTracing = true}, function() -- Line: 27 -- upvalues: createElement (upval), u4 (val), u32 (upval)
            local v1 = createElement(u4)
            u32.mountVirtualNode(v1, nil, "Some key")
        end)
        expect(nil).to.be.a("string")
    end)
    itSKIP("it should return an updated stack trace after an update", function() end)
    it("should return nil when elementTracing is off", function() -- Line: 40 -- upvalues: Component (val), GlobalConfig (val), createElement (val), u32 (val)
        local u0
        local u6 = Component:extend("TestComponent")
        function u6.init(p1) -- Line: 49 -- upvalues: u0 (ref)
            u0 = p1:getElementTraceback()
        end
        function u6.render(p1) -- Line: 53
            return nil
        end
        GlobalConfig.scoped({elementTracing = false}, function() -- Line: 57 -- upvalues: createElement (upval), u6 (val), u32 (upval)
            local v1 = createElement(u6)
            u32.mountVirtualNode(v1, nil, "Some key")
        end)
        expect(nil).to.equal(nil)
    end)
end