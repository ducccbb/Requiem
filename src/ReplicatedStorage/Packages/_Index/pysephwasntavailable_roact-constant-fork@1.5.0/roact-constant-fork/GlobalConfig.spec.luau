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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.GlobalConfig.spec
--                              Dumped in 0.000119 seconds
--                          Bytecode version 9  |  3 functions

return function() -- Line: 1
    local GlobalConfig = require(script.Parent.GlobalConfig)
    it("should have the correct methods", function() -- Line: 4 -- upvalues: GlobalConfig (val)
        expect(GlobalConfig).to.be.ok()
        expect(GlobalConfig.set).to.be.ok()
        expect(GlobalConfig.get).to.be.ok()
    end)
end