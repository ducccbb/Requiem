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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createSignal
--                              Dumped in 0.000416 seconds
--                          Bytecode version 9  |  5 functions

return function() -- Line: 15
    local u0 = {}
    local u1 = {}
    local u2 = false
    return {
        subscribe = function(p1, p2) -- Line: 20 -- upvalues: u2 (ref), u0 (val), u1 (val)
            local v1 = typeof(p2) == "function"
            assert(v1, "Can only subscribe to signals with a function.")
            local u11 = {disconnected = false, callback = p2}
            if u2 and not (u0[p2]) then
                u1[p2] = u11
            end
            u0[p2] = u11
            return function() -- Line: 36 -- upvalues: u11 (val), u0 (upval), p2 (val), u1 (upval)
                assert(not u11.disconnected, "Listeners can only be disconnected once.")
                u11.disconnected = true
                u0[p2] = nil
                u1[p2] = nil
            end
        end,
        fire = function(p1, ...) -- Line: 47 -- upvalues: u2 (ref), u0 (val), u1 (val)
            u2 = true
            for k, v in pairs(u0) do
                if not v.disconnected and not (u1[k]) then
                    k(...)
                end
            end
            u2 = false
            for k2, i in pairs(u1) do
                u1[k2] = nil
            end
        end,
    }
end