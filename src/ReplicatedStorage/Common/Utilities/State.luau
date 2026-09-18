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
--                    File: ReplicatedStorage.Common.Utilities.State
--                              Dumped in 0.000248 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
return function(p1) -- Line: 14 -- upvalues: u12 (val)
    if not (u12[p1]) then
        u12[p1] = {listeners = {}}
    end
    return function(a1) -- Line: 26 -- upvalues: u12 (upval), p1 (val)
        u12[p1].value = a1
        for i, v in ipairs(u12[p1].listeners) do
            v(a1)
        end
    end, u12[p1].value, function(a1) -- Line: 34 -- upvalues: u12 (upval), p1 (val)
        table.insert(u12[p1].listeners, a1)
        a1(u12[p1].value)
        return function() -- Line: 38 -- upvalues: u12 (upval), p1 (upval), a1 (val)
            table.remove(u12[p1].listeners, table.find(u12[p1].listeners, a1))
        end
    end, function() -- Line: 22 -- upvalues: u12 (upval), p1 (val)
        return u12[p1].value
    end
end