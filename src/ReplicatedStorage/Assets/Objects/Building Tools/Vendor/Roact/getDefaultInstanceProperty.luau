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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.getDefaultInstanceProperty
--                              Dumped in 0.000419 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Nil = require(script.Parent.Symbol).named("Nil")
local u19 = {}
return function(p1, p2) -- Line: 23 -- upvalues: u19 (val), Nil (val)
    local u15, u29, v1, v2, v3
    local v4 = u19[p1]
    if not v4 then
        v4 = {}
        u19[p1] = v4
        v1, u29 = p1, p2
        u15 = Instance.new(v1)
        v2, v3 = pcall(function() -- Line: 44 -- upvalues: u15 (val), u29 (val)
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
    v2, v3 = pcall(function() -- Line: 44 -- upvalues: u15 (val), u29 (val)
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