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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createReconcilerCompat.spec
--                              Dumped in 0.000581 seconds
--                          Bytecode version 9  |  11 functions

return function() -- Line: 1
    local createElement = require(script.Parent.createElement)
    local createReconciler = require(script.Parent.createReconciler)
    local Logging = require(script.Parent.Logging)
    local NoopRenderer = require(script.Parent.NoopRenderer)
    local createReconcilerCompat = require(script.Parent.createReconcilerCompat)
    local u27 = createReconciler(NoopRenderer)
    local u30 = createReconcilerCompat(u27)
    it("reify should only warn once per call site", function() -- Line: 12 -- upvalues: Logging (val), u30 (val), createElement (val), u27 (val)
        local v1
        v1 = Logging.capture(function() -- Line: 13 -- upvalues: u30 (upval), createElement (upval), u27 (upval)
            local v1 = u30.reify(createElement("StringValue"))
            u27.unmountVirtualTree(v1)
            v1 = u30.reify(createElement("StringValue"))
            u27.unmountVirtualTree(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reify")).to.be.ok()
        v1 = Logging.capture(function() -- Line: 25 -- upvalues: u30 (upval), createElement (upval), u27 (upval)
            local v1 = u30.reify(createElement("StringValue"))
            u27.unmountVirtualTree(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reify")).to.be.ok()
    end)
    it("teardown should only warn once per call site", function() -- Line: 35 -- upvalues: Logging (val), u27 (val), createElement (val), u30 (val)
        local v1
        v1 = Logging.capture(function() -- Line: 36 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.teardown(v1)
            v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.teardown(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("teardown")).to.be.ok()
        v1 = Logging.capture(function() -- Line: 48 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.teardown(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("teardown")).to.be.ok()
    end)
    it("update should only warn once per call site", function() -- Line: 58 -- upvalues: Logging (val), u27 (val), createElement (val), u30 (val)
        local v1
        v1 = Logging.capture(function() -- Line: 59 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
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
        v1 = Logging.capture(function() -- Line: 72 -- upvalues: u27 (upval), createElement (upval), u30 (upval)
            local v1 = u27.mountVirtualTree(createElement("StringValue"))
            u30.reconcile(v1, createElement("StringValue"))
            u27.unmountVirtualTree(v1)
        end)
        expect(#v1.warnings).to.equal(1)
        expect(v1.warnings[1]:find("reconcile")).to.be.ok()
    end)
end