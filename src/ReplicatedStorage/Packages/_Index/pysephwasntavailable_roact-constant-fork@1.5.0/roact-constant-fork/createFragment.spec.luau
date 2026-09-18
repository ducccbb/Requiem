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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createFragment.spec
--                              Dumped in 0.000213 seconds
--                          Bytecode version 9  |  4 functions

return function() -- Line: 1
    local ElementKind = require(script.Parent.ElementKind)
    local Type = require(script.Parent.Type)
    local createFragment = require(script.Parent.createFragment)
    it("should create new primitive elements", function() -- Line: 7 -- upvalues: createFragment (val), Type (val), ElementKind (val)
        local v1 = createFragment({})
        expect(v1).to.be.ok()
        expect(Type.of(v1)).to.equal(Type.Element)
        expect(ElementKind.of(v1)).to.equal(ElementKind.Fragment)
    end)
    it("should accept children", function() -- Line: 15 -- upvalues: createFragment (val)
        local v1 = createFragment({})
        local v2 = createFragment({key = v1})
        expect(v2.elements.key).to.equal(v1)
    end)
end