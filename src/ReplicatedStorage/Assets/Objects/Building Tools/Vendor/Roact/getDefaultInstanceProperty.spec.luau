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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.getDefaultInstanceProperty.spec
--                              Dumped in 0.000564 seconds
--                          Bytecode version 9  |  7 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local getDefaultInstanceProperty = require(u0.Parent.getDefaultInstanceProperty)
    it("should get default name string values", function() -- Line: 11 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("StringValue", "Name")
        expect(v1).to.equal("Value")
    end)
    it("should get default empty string values", function() -- Line: 17 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("StringValue", "Value")
        expect(v1).to.equal("")
    end)
    it("should get default number values", function() -- Line: 23 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("IntValue", "Value")
        expect(v1).to.equal(0)
    end)
    it("should get nil default values", function() -- Line: 29 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("ObjectValue", "Value")
        expect(v1).to.equal(nil)
    end)
    it("should get bool default values", function() -- Line: 35 -- upvalues: getDefaultInstanceProperty (val)
        local v1
        _, v1 = getDefaultInstanceProperty("BoolValue", "Value")
        expect(v1).to.equal(false)
    end)
end