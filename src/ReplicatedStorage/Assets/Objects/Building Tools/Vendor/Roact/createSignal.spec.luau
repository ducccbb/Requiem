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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createSignal.spec
--                              Dumped in 0.000435 seconds
--                          Bytecode version 9  |  7 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createSignal = require(u0.Parent.createSignal)
    local createSpy = require(u0.Parent.createSpy)
    it("should fire subscribers and disconnect them", function() -- Line: 13 -- upvalues: createSignal (val), createSpy (val)
        local v1 = createSignal()
        local v2 = createSpy()
        local v3 = v1:subscribe(v2.value)
        expect(v2.callCount).to.equal(0)
        local v4 = {}
        v1:fire(1, v4, "hello")
        expect(v2.callCount).to.equal(1)
        v2:assertCalledWith(1, v4, "hello")
        v3()
        v1:fire()
        expect(v2.callCount).to.equal(1)
    end)
    it("should handle multiple subscribers", function() -- Line: 36 -- upvalues: createSignal (val), createSpy (val)
        local v1 = createSignal()
        local v2 = createSpy()
        local v3 = createSpy()
        local v4 = v1:subscribe(v2.value)
        local v5 = v1:subscribe(v3.value)
        expect(v2.callCount).to.equal(0)
        expect(v3.callCount).to.equal(0)
        local v6 = {}
        v1:fire(v6, 67)
        expect(v2.callCount).to.equal(1)
        v2:assertCalledWith(v6, 67)
        expect(v3.callCount).to.equal(1)
        v3:assertCalledWith(v6, 67)
        v4()
        v1:fire(67, v6)
        expect(v2.callCount).to.equal(1)
        expect(v3.callCount).to.equal(2)
        v3:assertCalledWith(67, v6)
        v5()
    end)
    it("should stop firing a connection if disconnected mid-fire", function() -- Line: 70 -- upvalues: createSignal (val), createSpy (val)
        local v1 = createSignal()
        local u2 = nil
        local u3 = nil
        local v2 = createSpy(function() -- Line: 80 -- upvalues: u3 (ref)
            u3()
        end)
        local v3 = createSpy(function() -- Line: 84 -- upvalues: u2 (ref)
            u2()
        end)
        v1:fire()
        expect(v2.callCount + v3.callCount).to.equal(1)
    end)
end