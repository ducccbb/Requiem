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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createSignal.spec
--                              Dumped in 0.000666 seconds
--                          Bytecode version 9  |  10 functions

return function() -- Line: 1
    local createSignal = require(script.Parent.createSignal)
    local createSpy = require(script.Parent.createSpy)
    it("should fire subscribers and disconnect them", function() -- Line: 6 -- upvalues: createSignal (val), createSpy (val)
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
    it("should handle multiple subscribers", function() -- Line: 29 -- upvalues: createSignal (val), createSpy (val)
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
    it("should stop firing a connection if disconnected mid-fire", function() -- Line: 63 -- upvalues: createSignal (val), createSpy (val)
        local v1 = createSignal()
        local u2 = nil
        local u3 = nil
        local v2 = createSpy(function() -- Line: 73 -- upvalues: u3 (ref)
            u3()
        end)
        local v3 = createSpy(function() -- Line: 77 -- upvalues: u2 (ref)
            u2()
        end)
        v1:fire()
        expect(v2.callCount + v3.callCount).to.equal(1)
    end)
    it("should allow adding listener in the middle of firing", function() -- Line: 90 -- upvalues: createSignal (val), createSpy (val)
        local u2
        local u1 = createSignal()
        local u4 = createSpy()
        local v1 = u1:subscribe(function(p1, p2) -- Line: 95 -- upvalues: u2 (ref), u1 (val), u4 (val)
            u2 = u1:subscribe(u4.value)
        end)
        expect(u4.callCount).to.equal(0)
        local v2 = {}
        u1:fire(v2, 67)
        expect(u4.callCount).to.equal(0)
        u1:fire(67, v2)
        expect(u4.callCount).to.equal(1)
        u4:assertCalledWith(67, v2)
        ;(nil)()
        v1()
        u1:fire(v2)
        expect(u4.callCount).to.equal(1)
    end)
    it("should have one connection instance when add the same listener multiple times", function() -- Line: 122 -- upvalues: createSignal (val), createSpy (val)
        local v1 = createSignal()
        local v2 = createSpy()
        local v3 = v1:subscribe(v2.value)
        expect(v2.callCount).to.equal(0)
        local v4 = {}
        v1:fire(v4, 67)
        expect(v2.callCount).to.equal(1)
        v2:assertCalledWith(v4, 67)
        local v5 = v1:subscribe(v2.value)
        v1:fire(67, v4)
        expect(v2.callCount).to.equal(2)
        v2:assertCalledWith(67, v4)
        v5()
        v1:fire(v4)
        expect(v2.callCount).to.equal(2)
        v3()
        v1:fire(v4)
        expect(v2.callCount).to.equal(2)
    end)
end