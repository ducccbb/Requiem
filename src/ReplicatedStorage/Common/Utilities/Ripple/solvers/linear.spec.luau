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
--          File: ReplicatedStorage.Common.Utilities.Ripple.solvers.linear.spec
--                              Dumped in 0.000553 seconds
--                          Bytecode version 9  |  5 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createMotion = require(u0.Parent.Parent.createMotion)
    local linear = require(u0.Parent.linear)
    it("should animate a value", function() -- Line: 12 -- upvalues: createMotion (val), linear (val)
        local v1 = createMotion(0)
        v1:to(linear(1, {speed = 1}))
        v1:step(0.5)
        expect(v1:get()).to.equal(0.5)
        expect(v1:isComplete()).to.equal(false)
        v1:step(0.5)
        expect(v1:get()).to.equal(1)
        expect(v1:isComplete()).to.equal(true)
    end)
    it("should animate multiple values", function() -- Line: 27 -- upvalues: createMotion (val), linear (val)
        local v1 = createMotion({x = 0, y = 0})
        v1:to(linear({x = 1, y = 1}, {speed = 1}))
        v1:step(0.5)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(0.5)
        expect(v1:get().y).to.equal(0.5)
        expect(v1:isComplete()).to.equal(false)
        v1:step(0.5)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(1)
        expect(v1:get().y).to.equal(1)
        expect(v1:isComplete()).to.equal(true)
        v1:to({x = linear(2, {speed = 1}), y = linear(2, {speed = 0.5})})
        v1:step(0.5)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(1.5)
        expect(v1:get().y).to.equal(1.25)
        expect(v1:isComplete()).to.equal(false)
        v1:step(0.5)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(2)
        expect(v1:get().y).to.equal(1.5)
        expect(v1:isComplete()).to.equal(false)
        v1:step(1)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(2)
        expect(v1:get().y).to.equal(2)
        expect(v1:isComplete()).to.equal(true)
    end)
    it("should complete if overshooting", function() -- Line: 72 -- upvalues: createMotion (val), linear (val)
        local v1 = createMotion(0)
        v1:to(linear(1, {speed = 1}))
        v1:step(1000)
        expect(v1:get()).to.equal(1)
        expect(v1:isComplete()).to.equal(true)
    end)
end