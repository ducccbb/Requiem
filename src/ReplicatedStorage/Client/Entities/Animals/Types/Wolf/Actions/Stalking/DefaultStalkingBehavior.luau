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
--File: ReplicatedStorage.Client.Entities.Animals.Types.Wolf.Actions.Stalking.DefaultStalkingBehavior
--                              Dumped in 0.000369 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Animals = Types:WaitForChild("Animals")
require(Animals:WaitForChild("Actions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types_2 = Common_2:WaitForChild("Types")
local Animals_2 = Types_2:WaitForChild("Animals")
require(Animals_2:WaitForChild("Animal"))
local LocalPlayer = Players.LocalPlayer
return {
    priority = 1,
    attempt = function(p1) -- Line: 47 -- upvalues: LocalPlayer (val)
        if not p1.__internal.lastStalkingTime then
            local nearestPlayers = false
            if p1.exposed.state == 2 then
                nearestPlayers = p1.exposed.nearestPlayers
                if nearestPlayers then
                    nearestPlayers = false
                    local v1 = #p1.exposed.nearestPlayers
                    if 0 < v1 then
                        v1 = p1.exposed.nearestPlayers[1]
                        nearestPlayers = v1 == LocalPlayer.UserId
                    end
                end
            end
            if nearestPlayers then
                p1.__internal.lastStalkingTime = tick()
            end
            return nearestPlayers
        else
            local v2 = tick() - p1.__internal.lastStalkingTime
            if v2 < 6 then
                return false
            end
        end
    end,
    execute = function(p1, p2, p3, p4) -- Line: 32
        if p1.throttle then
            p1.throttle(0.2)
        end
        p1.__internal.lastStalkingTime = tick()
    end,
}