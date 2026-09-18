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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component.spec.getElementTraceback.spec
--                              Dumped in 0.000408 seconds
--                          Bytecode version 9  |  11 functions

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
    local GlobalConfig = require(u0.Parent.Parent.GlobalConfig)
    local NoopRenderer = require(u0.Parent.Parent.NoopRenderer)
    local Component = require(u0.Parent.Parent.Component)
    local u32 = createReconciler(NoopRenderer)
    it("should return stack traces in initial renders", function() -- Line: 18 -- upvalues: Component (val), GlobalConfig (val), createElement (val), u32 (val)
        local u5
        local u4 = Component:extend("TestComponent")
        function u4.init(p1) -- Line: 22 -- upvalues: u5 (ref)
            u5 = p1:getElementTraceback()
        end
        function u4.render(p1) -- Line: 26
            return nil
        end
        GlobalConfig.scoped({elementTracing = true}, function() -- Line: 34 -- upvalues: createElement (upval), u4 (val), u32 (upval)
            local v1 = createElement(u4)
            u32.mountVirtualNode(v1, nil, "Some key")
        end)
        expect(nil).to.be.a("string")
    end)
    itSKIP("it should return an updated stack trace after an update", function() end)
    it("should return nil when elementTracing is off", function() -- Line: 47 -- upvalues: Component (val), GlobalConfig (val), createElement (val), u32 (val)
        local u0
        local u6 = Component:extend("TestComponent")
        function u6.init(p1) -- Line: 56 -- upvalues: u0 (ref)
            u0 = p1:getElementTraceback()
        end
        function u6.render(p1) -- Line: 60
            return nil
        end
        GlobalConfig.scoped({elementTracing = false}, function() -- Line: 64 -- upvalues: createElement (upval), u6 (val), u32 (upval)
            local v1 = createElement(u6)
            u32.mountVirtualNode(v1, nil, "Some key")
        end)
        expect(nil).to.equal(nil)
    end)
end