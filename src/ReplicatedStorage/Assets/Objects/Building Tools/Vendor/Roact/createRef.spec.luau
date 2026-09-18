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
--   File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createRef.spec
--                              Dumped in 0.000397 seconds
--                          Bytecode version 9  |  8 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Binding = require(u0.Parent.Binding)
    local Type = require(u0.Parent.Type)
    local createRef = require(u0.Parent.createRef)
    it("should create refs, which are specialized bindings", function() -- Line: 14 -- upvalues: createRef (val), Type (val)
        local v1 = createRef()
        expect(Type.of(v1)).to.equal(Type.Binding)
        expect(v1.current).to.equal(nil)
    end)
    it("should have a 'current' field that is the same as the internal binding's value", function() -- Line: 21 -- upvalues: createRef (val), Binding (val)
        local v1 = createRef()
        expect(v1.current).to.equal(nil)
        Binding.update(v1, 10)
        expect(v1.current).to.equal(10)
    end)
    it("should support tostring on refs", function() -- Line: 30 -- upvalues: createRef (val), Binding (val)
        local v1 = createRef()
        expect(v1.current).to.equal(nil)
        expect((tostring(v1))).to.equal("RoactRef(nil)")
        Binding.update(v1, 10)
        expect((tostring(v1))).to.equal("RoactRef(10)")
    end)
    it("should not allow assignments to the 'current' field", function() -- Line: 40 -- upvalues: createRef (val), Binding (val)
        local u1 = createRef()
        expect(u1.current).to.equal(nil)
        Binding.update(u1, 99)
        expect(u1.current).to.equal(99)
        expect(function() -- Line: 48 -- upvalues: u1 (val)
            u1.current = 77
        end).to.throw()
        expect(u1.current).to.equal(99)
    end)
    it("should return the same thing from getValue as its current field", function() -- Line: 55 -- upvalues: createRef (val), Binding (val)
        local v1 = createRef()
        Binding.update(v1, 10)
        expect(v1:getValue()).to.equal(10)
        expect(v1:getValue()).to.equal(v1.current)
    end)
end