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
--          File: ReplicatedStorage.Common.Utilities.Ripple.solvers.spring.spec
--                              Dumped in 0.000733 seconds
--                          Bytecode version 9  |  11 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createMotion = require(u0.Parent.Parent.createMotion)
    local snapshot = require(u0.Parent.Parent.utils.snapshot)
    local spring = require(u0.Parent.spring)
    local v1 = {
        default = "[0.37,0.73,0.9,0.96,0.98,0.99,0.99,0.99,0.99,1]",
        underdamped = "[0.41,0.84,1.01,1.03,1.02,1.01,0.99,0.99,0.99,1]",
        critical = "[0.36,0.71,0.89,0.95,0.98,0.99,0.99,0.99,0.99,1]",
        overdamped = "[0.31,0.6,0.78,0.87,0.93,0.96,0.97,0.98,0.99,0.99,0.99,0.99,0.99,0.99,0.99,0.99]",
        tension_200 = "[0.43,0.81,0.95,0.99,0.99,1.01,1.01,1]",
        tension_300 = "[0.61,0.98,1.03,1.01,0.99,0.99,1]",
        mass_half = "[0.44,0.74,0.87,0.94,0.97,0.98,0.99,0.99,0.99,0.99,0.99,0.99,1]",
        mass_2 = "[0.27,0.67,0.92,1.03,1.05,1.03,1.02,1.01,0.99,0.99,0.99,0.99,1]",
        friction_20 = "[0.43,0.85,1.01,1.03,1.01,1.01,0.99,0.99,0.99,1]",
        friction_30 = "[0.35,0.67,0.84,0.92,0.96,0.98,0.99,0.99,0.99,0.99,0.99,0.99,1]",
    }
    it("should animate a value", function() -- Line: 26 -- upvalues: snapshot (val), spring (val)
        local v1 = spring(1)
        local v2 = snapshot.testSnapshot(v1, "[0.37,0.73,0.9,0.96,0.98,0.99,0.99,0.99,0.99,1]")
        expect(v2:get()).to.equal(1)
        expect(v2:isComplete()).to.equal(true)
    end)
    it("should accept damping ratio", function() -- Line: 32 -- upvalues: snapshot (val), spring (val)
        local v1 = spring(1, {damping = 0.75})
        local v2 = snapshot.testSnapshot(v1, "[0.41,0.84,1.01,1.03,1.02,1.01,0.99,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
        v1 = spring(1, {damping = 1})
        v2 = snapshot.testSnapshot(v1, "[0.36,0.71,0.89,0.95,0.98,0.99,0.99,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
        v1 = spring(1, {damping = 1.3})
        v2 = snapshot.testSnapshot(v1, "[0.31,0.6,0.78,0.87,0.93,0.96,0.97,0.98,0.99,0.99,0.99,0.99,0.99,0.99,0.99,0.99]")
        expect(v2:isComplete()).to.equal(false)
    end)
    it("should accept tension", function() -- Line: 45 -- upvalues: snapshot (val), spring (val)
        local v1 = spring(1, {tension = 200})
        local v2 = snapshot.testSnapshot(v1, "[0.43,0.81,0.95,0.99,0.99,1.01,1.01,1]")
        expect(v2:isComplete()).to.equal(true)
        v1 = spring(1, {tension = 300})
        v2 = snapshot.testSnapshot(v1, "[0.61,0.98,1.03,1.01,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
    end)
    it("should accept mass", function() -- Line: 55 -- upvalues: snapshot (val), spring (val)
        local v1 = spring(1, {mass = 0.5})
        local v2 = snapshot.testSnapshot(v1, "[0.44,0.74,0.87,0.94,0.97,0.98,0.99,0.99,0.99,0.99,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
        v1 = spring(1, {mass = 2})
        v2 = snapshot.testSnapshot(v1, "[0.27,0.67,0.92,1.03,1.05,1.03,1.02,1.01,0.99,0.99,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
    end)
    it("should accept friction", function() -- Line: 65 -- upvalues: snapshot (val), spring (val)
        local v1 = spring(1, {friction = 20})
        local v2 = snapshot.testSnapshot(v1, "[0.43,0.85,1.01,1.03,1.01,1.01,0.99,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
        v1 = spring(1, {friction = 30})
        v2 = snapshot.testSnapshot(v1, "[0.35,0.67,0.84,0.92,0.96,0.98,0.99,0.99,0.99,0.99,0.99,0.99,1]")
        expect(v2:isComplete()).to.equal(true)
    end)
    describe("when passed initial values", function() -- Line: 75 -- upvalues: createMotion (val), spring (val)
        it("should accept position", function() -- Line: 76 -- upvalues: createMotion (upval), spring (upval)
            local v1 = createMotion(0)
            v1:to(spring(1, {position = 0.5}))
            expect(v1:get()).to.equal(0.5)
        end)
        it("should accept velocity", function() -- Line: 82 -- upvalues: createMotion (upval), spring (upval)
            local v1 = createMotion(0)
            v1:to(spring(1, {velocity = 1000}))
            expect(v1.state[1].velocity).to.equal(1000)
            v1:step(0.1)
            local v2 = v1:get()
            local v3 = 1 < v2
            expect(v3).to.equal(true)
        end)
        it("should apply impulse", function() -- Line: 92 -- upvalues: createMotion (upval), spring (upval)
            local v1 = createMotion(0)
            v1:to(spring(1, {impulse = 1}))
            v1:to(spring(1, {impulse = 1}))
            expect(v1.state[1].velocity).to.equal(2)
        end)
    end)
end