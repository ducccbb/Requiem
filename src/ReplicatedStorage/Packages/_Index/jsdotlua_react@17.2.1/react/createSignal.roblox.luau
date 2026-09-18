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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.createSignal.roblox
--                              Dumped in 0.000270 seconds
--                          Bytecode version 9  |  5 functions

return function() -- Line: 36
    local u0 = {}
    local u1 = {}
    local u2 = false
    return function(p1) -- Line: 41 -- upvalues: u2 (ref), u0 (val), u1 (val)
        local v1 = typeof(p1) == "function"
        assert(v1, "Can only subscribe to signals with a function.")
        local u10 = {disconnected = false, callback = p1}
        if u2 and not (u0[p1]) then
            u1[p1] = u10
        end
        u0[p1] = u10
        return function() -- Line: 60 -- upvalues: u10 (val), u0 (upval), p1 (val), u1 (upval)
            assert(not u10.disconnected, "Listeners can only be disconnected once.")
            u10.disconnected = true
            u0[p1] = nil
            u1[p1] = nil
        end
    end, function(...) -- Line: 74 -- upvalues: u2 (ref), u0 (val), u1 (val)
        u2 = true
        local v1 = u0
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if not j.disconnected and not (u1[i]) then
                i(...)
            end
        end
        u2 = false
        table.clear(u1)
    end
end