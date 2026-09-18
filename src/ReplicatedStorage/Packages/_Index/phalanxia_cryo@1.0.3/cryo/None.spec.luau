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
--      File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.None.spec
--                              Dumped in 0.000166 seconds
--                          Bytecode version 9  |  4 functions

return function() -- Line: 1
    local None = require(script.Parent.None)
    it("should be a userdata", function() -- Line: 4 -- upvalues: None (val)
        expect(None).to.be.a("userdata")
    end)
    it("should have a nice string name", function() -- Line: 8 -- upvalues: None (val)
        local v1 = tostring(None)
        expect(v1:find("^userdata: ")).never.to.be.ok()
        expect(v1:find("None")).to.be.ok()
    end)
end