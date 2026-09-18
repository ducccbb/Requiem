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
--        File: ReplicatedStorage.Common.Utilities.Ripple.solvers.immediate.spec
--                              Dumped in 0.000366 seconds
--                          Bytecode version 9  |  4 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createMotion = require(u0.Parent.Parent.createMotion)
    local immediate = require(u0.Parent.immediate)
    it("should set a value", function() -- Line: 12 -- upvalues: createMotion (val), immediate (val)
        local v1 = createMotion({x = 0, y = 0})
        v1:to(immediate({x = 1, y = 1}))
        v1:step(0)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(1)
        expect(v1:get().y).to.equal(1)
        expect(v1:isComplete()).to.equal(true)
    end)
    it("should set multiple values", function() -- Line: 24 -- upvalues: createMotion (val), immediate (val)
        local v1 = createMotion({x = 0, y = 0})
        v1:to({x = immediate(1), y = immediate(1)})
        v1:step(0)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(1)
        expect(v1:get().y).to.equal(1)
        expect(v1:isComplete()).to.equal(true)
        v1:to({x = immediate(2), y = immediate(2)})
        v1:step(0)
        expect(v1:get()).to.be.ok()
        expect(v1:get().x).to.equal(2)
        expect(v1:get().y).to.equal(2)
        expect(v1:isComplete()).to.equal(true)
    end)
end