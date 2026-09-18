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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Config.spec
--                              Dumped in 0.000290 seconds
--                          Bytecode version 9  |  7 functions

return function() -- Line: 1
    local Config = require(script.Parent.Config)
    it("should accept valid configuration", function() -- Line: 4 -- upvalues: Config (val)
        local v1 = Config.new()
        local v2 = v1.get()
        expect(v2.elementTracing).to.equal(false)
        v1.set({elementTracing = true})
        expect(v2.elementTracing).to.equal(true)
    end)
    it("should reject invalid configuration keys", function() -- Line: 17 -- upvalues: Config (val)
        local v1, v2
        local u2 = Config.new()
        v1, v2 = pcall(function() -- Line: 22 -- upvalues: u2 (val)
            u2.set({garblegoop = true})
        end)
        expect(v1).to.equal(false)
        expect(v2:find("garblegoop")).to.be.ok()
    end)
    it("should reject invalid configuration values", function() -- Line: 34 -- upvalues: Config (val)
        local v1, v2
        local u2 = Config.new()
        v1, v2 = pcall(function() -- Line: 40 -- upvalues: u2 (val)
            u2.set({elementTracing = "Hello there!"})
        end)
        expect(v1).to.equal(false)
        expect(v2:find("elementTracing")).to.be.ok()
        expect(v2:find("Hello there!")).to.be.ok()
    end)
end