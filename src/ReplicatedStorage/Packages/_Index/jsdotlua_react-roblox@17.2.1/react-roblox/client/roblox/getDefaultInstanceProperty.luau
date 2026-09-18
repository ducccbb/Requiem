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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.getDefaultInstanceProperty
--                              Dumped in 0.000283 seconds
--                          Bytecode version 9  |  3 functions

local Nil = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).Symbol.named("Nil")
local u15 = {}
local function tryPropertyName(p1, p2) -- Line: 32
    return p1[p2]
end
return function(p1, p2) -- Line: 36 -- upvalues: u15 (val), Nil (val), tryPropertyName (val)
    local v1, v2, v3, v4, v5
    local v6 = u15[p1]
    if not v6 then
        v6 = {}
        u15[p1] = v6
        v1, v2 = p1, p2
        v3 = Instance.new(v1)
        v4, v5 = pcall(tryPropertyName, v3, v2)
        v3:Destroy()
        if v4 then
            if v5 == nil then
                v6[v2] = Nil
                return v4, v5
            end
            v6[v2] = v5
            return v4, v5
        end
        return v4, v5
    end
    v3 = v6[p2]
    if v3 == Nil then
        return true, nil
    end
    if v3 ~= nil then
        return true, v3
    end
    v1, v2 = p1, p2
    v3 = Instance.new(v1)
    v4, v5 = pcall(tryPropertyName, v3, v2)
    v3:Destroy()
    if not v4 then
        return v4, v5
    end
    if v5 == nil then
        v6[v2] = Nil
        return v4, v5
    end
    v6[v2] = v5
    return v4, v5
end