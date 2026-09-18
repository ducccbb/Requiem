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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.getDefaultInstanceProperty.spec
--                              Dumped in 0.000274 seconds
--                          Bytecode version 9  |  7 functions

return function() -- Line: 1
    local getDefaultInstanceProperty = require(script.Parent.getDefaultInstanceProperty)
    it("should get default name string values", function() -- Line: 4 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("StringValue", "Name")
        expect(v1).to.equal("Value")
    end)
    it("should get default empty string values", function() -- Line: 10 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("StringValue", "Value")
        expect(v1).to.equal("")
    end)
    it("should get default number values", function() -- Line: 16 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("IntValue", "Value")
        expect(v1).to.equal(0)
    end)
    it("should get nil default values", function() -- Line: 22 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("ObjectValue", "Value")
        expect(v1).to.equal(nil)
    end)
    it("should get bool default values", function() -- Line: 28 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("BoolValue", "Value")
        expect(v1).to.equal(false)
    end)
end