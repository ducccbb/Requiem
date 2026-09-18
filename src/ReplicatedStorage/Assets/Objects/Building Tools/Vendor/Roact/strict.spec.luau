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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.strict.spec
--                              Dumped in 0.000225 seconds
--                          Bytecode version 9  |  6 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local strict = require(u0.Parent.strict)
    it("should error when getting a nonexistent key", function() -- Line: 11 -- upvalues: strict (val)
        local u2 = strict({a = 1, b = 2})
        expect(function() -- Line: 17 -- upvalues: u2 (val)
            return u2.c
        end).to.throw()
    end)
    it("should error when setting a nonexistent key", function() -- Line: 22 -- upvalues: strict (val)
        local u2 = strict({a = 1, b = 2})
        expect(function() -- Line: 28 -- upvalues: u2 (val)
            u2.c = 3
        end).to.throw()
    end)
end