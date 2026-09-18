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
-- File: ReplicatedStorage.Packages._Index.jsdotlua_timers@1.2.6.timers.makeIntervalImpl
--                              Dumped in 0.000348 seconds
--                          Bytecode version 9  |  6 functions

local u2 = newproxy(false)
return function(p1) -- Line: 9 -- upvalues: u2 (val)
    return {
        setInterval = function(a1, p2, ...) -- Line: 10 -- upvalues: u2 (upval), p1 (val)
            local u11, v1
            local u2 = {...}
            local u4 = {}
            u4[u2] = 1
            if p2 ~= nil then
                v1 = p2
            else
                v1 = 0
            end
            local u9 = v1 / 1000
            function u11() -- Line: 24 -- upvalues: p1 (upval), u9 (val), u4 (val), u2 (upval), a1 (val), u2 (val), u11 (ref)
                p1(u9, function() -- Line: 25 -- upvalues: u4 (upval), u2 (upval), a1 (upval), u2 (upval), u11 (upval)
                    if u4[u2] == 1 then
                        a1(unpack(u2))
                        u11()
                    end
                end)
            end
            u11()
            return u4
        end,
        clearInterval = function(p1) -- Line: 38 -- upvalues: u2 (upval)
            if p1 == nil then
                return
            end
            if p1[u2] == 1 then
                p1[u2] = 3
            end
        end,
    }
end