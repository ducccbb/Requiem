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
--               File: ReplicatedStorage.Common.Effects.Types.Tools.Pebble
--                               Dumped in 0.00120 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ProjectileRunner = require(script.Parent.Parent.Parent:WaitForChild("ProjectileRunner"))
local Pebble = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Pebble")
return function(p1, p2) -- Line: 38 -- upvalues: Players (val), Pebble (val), ProjectileRunner (val), Workspace (val), Alive (val)
    local userId = p2.userId
    if userId then
        userId = Players.LocalPlayer.UserId == p2.userId
    end
    if not p2.userId or not userId then
        task.defer(function() -- Line: 45 -- upvalues: Pebble (upval), ProjectileRunner (upval), Workspace (upval), Players (upval), p2 (val), Alive (upval)
            local u3 = Pebble:Clone()
            if not (ProjectileRunner.getRootPart(u3)) then
                u3:Destroy()
                return
            end
            u3.Parent = Workspace
            local PlayerByUserId = Players:GetPlayerByUserId(p2.userId)
            local v1 = PlayerByUserId
            if v1 then
                v1 = Alive.getAliveCharacter(PlayerByUserId)
            end
            local u23 = false
            local u42 = ProjectileRunner.run(u3, p2.startPos, {
                sphereRadius = 0.05,
                timeStep = 0.03,
                maxTime = 15,
                minTimeBeforeCollision = 0.1,
                directionScale = 8,
                velocity = p2.velocity,
                gravity = p2.gravity,
            }, nil, v1, function(p1, p2, p3, p4) -- Line: 79 -- upvalues: u23 (ref)
                if not p2 then
                    if p2 then
                        if not p2.Parent then
                            u23 = true
                            p4:Destroy()
                            return true
                        end
                        if p2.Parent.Name == "Pebble" then
                            return false
                        end
                        u23 = true
                        p4:Destroy()
                        return true
                    end
                    u23 = true
                    p4:Destroy()
                    return true
                end
                if p2:IsDescendantOf(p4) then
                    return false
                end
                if not p2 or not p2.Parent then
                    u23 = true
                    p4:Destroy()
                    return true
                end
                if p2.Parent.Name == "Pebble" then
                    return false
                end
                u23 = true
                p4:Destroy()
                return true
            end, function() -- Line: 91 -- upvalues: u23 (ref), u3 (val)
                if u23 then
                    return
                end
                u23 = true
                if u3.Parent then
                    u3:Destroy()
                end
            end, nil, nil)
            task.delay(60, function() -- Line: 104 -- upvalues: u23 (ref), u42 (val), u3 (val)
                if u23 then
                    return
                end
                u23 = true
                u42()
                if u3.Parent then
                    u3:Destroy()
                end
            end)
        end)
        return
    end
    if not p2.skip then
        return
    end
    task.defer(function() -- Line: 45 -- upvalues: Pebble (upval), ProjectileRunner (upval), Workspace (upval), Players (upval), p2 (val), Alive (upval)
        local u3 = Pebble:Clone()
        if not (ProjectileRunner.getRootPart(u3)) then
            u3:Destroy()
            return
        end
        u3.Parent = Workspace
        local PlayerByUserId = Players:GetPlayerByUserId(p2.userId)
        local v1 = PlayerByUserId
        if v1 then
            v1 = Alive.getAliveCharacter(PlayerByUserId)
        end
        local u23 = false
        local u42 = ProjectileRunner.run(u3, p2.startPos, {
            sphereRadius = 0.05,
            timeStep = 0.03,
            maxTime = 15,
            minTimeBeforeCollision = 0.1,
            directionScale = 8,
            velocity = p2.velocity,
            gravity = p2.gravity,
        }, nil, v1, function(p1, p2, p3, p4) -- Line: 79 -- upvalues: u23 (ref)
            if not p2 then
                if p2 then
                    if not p2.Parent then
                        u23 = true
                        p4:Destroy()
                        return true
                    end
                    if p2.Parent.Name == "Pebble" then
                        return false
                    end
                    u23 = true
                    p4:Destroy()
                    return true
                end
                u23 = true
                p4:Destroy()
                return true
            end
            if p2:IsDescendantOf(p4) then
                return false
            end
            if not p2 or not p2.Parent then
                u23 = true
                p4:Destroy()
                return true
            end
            if p2.Parent.Name == "Pebble" then
                return false
            end
            u23 = true
            p4:Destroy()
            return true
        end, function() -- Line: 91 -- upvalues: u23 (ref), u3 (val)
            if u23 then
                return
            end
            u23 = true
            if u3.Parent then
                u3:Destroy()
            end
        end, nil, nil)
        task.delay(60, function() -- Line: 104 -- upvalues: u23 (ref), u42 (val), u3 (val)
            if u23 then
                return
            end
            u23 = true
            u42()
            if u3.Parent then
                u3:Destroy()
            end
        end)
    end)
end