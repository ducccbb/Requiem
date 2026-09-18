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
--     File: ReplicatedStorage.Client.Entities.Titans.Utilities.CooldownTitanClient
--                              Dumped in 0.000957 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local v2 = {
    isOnCooldown = function(p1, p2) -- Line: 20
        local cooldowns, v1, v2, v3, v4, v5
        debug.profilebegin("CooldownTitanClient.isOnCooldown")
        local v6 = os.clock()
        if type(p2) ~= "table" then
            local cooldowns_2 = p1.cooldowns
            v3 = nil
            v4 = nil
            for i, j in cooldowns_2, v3, v4 do
                if j.name == p2 then
                    v5 = v6 - j.time < j.duration
                    debug.profileend()
                    return v5
                end
            end
            debug.profileend()
            return false
        end
        local v7 = p2
        v3 = nil
        v4 = nil
        local v8 = p1
        for k, n in v7, v3, v4 do
            cooldowns = v8.cooldowns
            v5 = nil
            v1 = nil
            for m, i5 in cooldowns, v5, v1 do
                if i5.name == n then
                    v2 = v6 - i5.time
                    if v2 < i5.duration then
                        debug.profileend()
                        return true
                    end
                end
            end
        end
        debug.profileend()
        return false
    end,
    getCooldownRemaining = function(p1, p2) -- Line: 61
        local v1
        local v2 = os.clock()
        local cooldowns = p1.cooldowns
        local v3 = nil
        local v4 = nil
        for i, j in cooldowns, v3, v4 do
            if j.name == p2 then
                v1 = j.duration - (v2 - j.time)
                if 0 < v1 then
                    return v1
                end
            end
        end
        return nil
    end,
    addClientCooldown = function(p1, p2, p3) -- Line: 85
        local v1, v2, v3, v4, v5, v6
        debug.profilebegin("CooldownTitanClient.addClientCooldown")
        local v7 = os.clock()
        if type(p2) ~= "table" then
            local v8
            v4 = 1
            v5 = -1
            v1, v8 = p1, p2
            for i = #p1.cooldowns, v4, v5 do
                if v1.cooldowns[i].name == v8 then
                    table.remove(v1.cooldowns, i)
                end
            end
            table.insert(v1.cooldowns, {name = v8, duration = v3, time = v7})
            debug.profileend()
            return
        end
        v4 = p2
        v5 = nil
        local v9 = nil
        v1, v3 = p1, p3
        for j, k in v4, v5, v9 do
            v6 = 1
            v2 = -1
            for n = #v1.cooldowns, v6, v2 do
                if v1.cooldowns[n].name == k then
                    table.remove(v1.cooldowns, n)
                end
            end
            table.insert(v1.cooldowns, {name = k, duration = v3, time = v7})
        end
        debug.profileend()
    end,
}
function v2.removeClientCooldown(p1, p2) -- Line: 137
    local v1, v2, v3, v4, v5
    if type(p2) ~= "table" then
        local v6
        v2 = 1
        v3 = -1
        v1, v6 = p1, p2
        for i = #p1.cooldowns, v2, v3 do
            if v1.cooldowns[i].name == v6 then
                table.remove(v1.cooldowns, i)
            end
        end
        return
    end
    v2 = p2
    v3 = nil
    local v7 = nil
    v1 = p1
    for j, k in v2, v3, v7 do
        v4 = 1
        v5 = -1
        for n = #v1.cooldowns, v4, v5 do
            if v1.cooldowns[n].name == k then
                table.remove(v1.cooldowns, n)
            end
        end
    end
end
function v2.cleanupExpiredCooldowns(p1) -- Line: 163
    local v1, v2
    local v3 = os.clock()
    local v4 = 1
    local v5 = -1
    local v6 = p1
    for i = #p1.cooldowns, v4, v5 do
        v1 = v6.cooldowns[i]
        v2 = v3 - v1.time
        if v1.duration <= v2 then
            table.remove(v6.cooldowns, i)
        end
    end
end
return v2