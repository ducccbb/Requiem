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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.strict.spec
--                              Dumped in 0.000205 seconds
--                          Bytecode version 9  |  6 functions

return function() -- Line: 1
    local strict = require(script.Parent.strict)
    it("should error when getting a nonexistent key", function() -- Line: 4 -- upvalues: strict (val)
        local u2 = strict({a = 1, b = 2})
        expect(function() -- Line: 10 -- upvalues: u2 (val)
            return u2.c
        end).to.throw()
    end)
    it("should error when setting a nonexistent key", function() -- Line: 15 -- upvalues: strict (val)
        local u2 = strict({a = 1, b = 2})
        expect(function() -- Line: 21 -- upvalues: u2 (val)
            u2.c = 3
        end).to.throw()
    end)
end