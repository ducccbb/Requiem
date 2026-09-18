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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createReconcilerCompat.spec
--                              Dumped in 0.000612 seconds
--                          Bytecode version 9  |  11 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createElement = require(u0.Parent.createElement)
    local createReconciler = require(u0.Parent.createReconciler)
    local Logging = require(u0.Parent.Logging)
    local NoopRenderer = require(u0.Parent.NoopRenderer)
    local createReconcilerCompat = require(u0.Parent.createReconcilerCompat)
    local u27 = createReconciler(NoopRenderer)
    local u30 = createReconcilerCompat(u27)
    it("reify should only warn once per call site", function() -- Line: 19 -- upvalues: Logging (val), u30 (val), createElement (val), u27 (val)
        local v1
        v1 = Logging.capture(function() -- Line: 20 -- upvalues: u30 (upval), createElement (upval), u27 (upval)
            local v1 = u30.reify(createElement("StringValue"))
            u27.unmountVirtualTree(v1)
            v1 = u30.reify(createElement("StringValue"))
            u27.unmountVirtualTree(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reify")).to.be.ok()
        v1 = Logging.capture(function() -- Line: 32 -- upvalues: u30 (upval), createElement (upval), u27 (upval)
            local v1 = u30.reify(createElement("StringValue"))
            u27.unmountVirtualTree(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reify")).to.be.ok()
    end)
    it("teardown should only warn once per call site", function() -- Line: 42 -- upvalues: Logging (val), u27 (val), createElement (val), u30 (val)
        local v1
        v1 = Logging.capture(function() -- Line: 43 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.teardown(v1)
            v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.teardown(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("teardown")).to.be.ok()
        v1 = Logging.capture(function() -- Line: 55 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.teardown(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("teardown")).to.be.ok()
    end)
    it("update should only warn once per call site", function() -- Line: 65 -- upvalues: Logging (val), u27 (val), createElement (val), u30 (val)
        local v1
        v1 = Logging.capture(function() -- Line: 66 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1
            local v2 = 2
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u27.mountVirtualTree(createElement("StringValue"))
                u30.reconcile(v1, createElement("StringValue"))
                u27.unmountVirtualTree(v1)
            end
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reconcile")).to.be.ok()
        v1 = Logging.capture(function() -- Line: 79 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.reconcile(v1, createElement("StringValue"))
            u27.unmountVirtualTree(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reconcile")).to.be.ok()
    end)
end