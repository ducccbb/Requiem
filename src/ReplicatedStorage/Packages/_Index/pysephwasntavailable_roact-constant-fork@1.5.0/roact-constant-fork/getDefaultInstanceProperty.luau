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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.getDefaultInstanceProperty
--                              Dumped in 0.000301 seconds
--                          Bytecode version 9  |  3 functions

local Nil = require(script.Parent.Symbol).named("Nil")
local u8 = {}
return function(p1, p2) -- Line: 16 -- upvalues: u8 (val), Nil (val)
    local u15, u29, v1, v2, v3
    local v4 = u8[p1]
    if not v4 then
        v4 = {}
        u8[p1] = v4
        v1, u29 = p1, p2
        u15 = Instance.new(v1)
        v2, v3 = pcall(function() -- Line: 37 -- upvalues: u15 (val), u29 (val)
            return u15[u29]
        end)
        u15:Destroy()
        if v2 then
            if v3 == nil then
                v4[u29] = Nil
                return v2, v3
            end
            v4[u29] = v3
            return v2, v3
        end
        return v2, v3
    end
    local v5 = v4[p2]
    if v5 == Nil then
        return true, nil
    end
    if v5 ~= nil then
        return true, v5
    end
    v1, u29 = p1, p2
    u15 = Instance.new(v1)
    v2, v3 = pcall(function() -- Line: 37 -- upvalues: u15 (val), u29 (val)
        return u15[u29]
    end)
    u15:Destroy()
    if not v2 then
        return v2, v3
    end
    if v3 == nil then
        v4[u29] = Nil
        return v2, v3
    end
    v4[u29] = v3
    return v2, v3
end