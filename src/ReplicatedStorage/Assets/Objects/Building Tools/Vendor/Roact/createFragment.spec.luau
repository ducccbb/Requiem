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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createFragment.spec
--                              Dumped in 0.000246 seconds
--                          Bytecode version 9  |  4 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local ElementKind = require(u0.Parent.ElementKind)
    local Type = require(u0.Parent.Type)
    local createFragment = require(u0.Parent.createFragment)
    it("should create new primitive elements", function() -- Line: 14 -- upvalues: createFragment (val), Type (val), ElementKind (val)
        local v1 = createFragment({})
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.Element)
        expect(ElementKind.of(v1)).to.equal(ElementKind.Fragment)
    end)
    it("should accept children", function() -- Line: 22 -- upvalues: createFragment (val)
        local v1 = createFragment({})
        local v2 = createFragment({key = v1})
        expect(v2.elements.key).to.equal(v1)
    end)
end