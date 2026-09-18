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
--               File: ReplicatedStorage.Common.Effects.Types.Tools.Bullet
--                              Dumped in 0.000963 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Musket = require(Tools:WaitForChild("Musket"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Alive = require(Common_4:WaitForChild("Alive"))
return function(p1) -- Line: 44 -- upvalues: Players (val), ReplicatedStorage (val), Workspace (val), CollectionService (val), RunService (val), Alive (val), Sounds (val), Musket (val), Signals (val)
    local u2 = not p1.isServerSent
    if not p1.owner then
        if not p1.sender then
            p1.sender = Players.LocalPlayer
        end
        local u20 = ReplicatedStorage.Assets.Particles.Tools.Bullet:Clone()
        u20.CFrame = CFrame.new(p1.exit, p1.exit + p1.direction)
        u20.Parent = Workspace
        local u33 = Players.LocalPlayer == p1.sender
        local u34 = false
        local Tagged = CollectionService:GetTagged("Ungrappleable")
        local u41 = RaycastParams.new()
        u41.FilterType = Enum.RaycastFilterType.Exclude
        u41.FilterDescendantsInstances = {u20, p1.sender.Character, Tagged}
        local u53 = (p1.dropoff or 0) / p1.speed
        local u54 = 0
        local u55 = nil
        u55 = RunService.RenderStepped:Connect(function(a1) -- Line: 77 -- upvalues: u54 (ref), u53 (val), p1 (val), u20 (val), u2 (val), Workspace (upval), u41 (val), Alive (upval), Players (upval), Sounds (upval), Musket (upval), u34 (ref), u33 (val), Signals (upval), u55 (ref)
            local Magnitude, v1, v2, v3
            if u54 >= u53 then
                local v4 = u54 - u53
                v1 = p1.exit + p1.direction * p1.dropoff + p1.direction * (p1.speed * v4) + p1.gravity * 0.5 * (v4 * v4)
                v2 = p1.direction * p1.speed + p1.gravity * v4
            else
                v1 = p1.exit + p1.direction * (p1.speed * u54)
                v2 = p1.direction * p1.speed
            end
            u20.CFrame = CFrame.new(v1, v1 + p1.direction)
            local v5 = v2 * a1 * 1.1
            if not u2 then
                v3 = Workspace:Raycast(u20.Position, v5, u41)
            else
                Magnitude = v5.Magnitude
                if 1024 < Magnitude then
                    v5 = v5 * (1024 / Magnitude)
                end
                v3 = Workspace:Spherecast(u20.Position, 0.15, v5, u41)
            end
            local sender = p1.sender
            if sender then
                sender = Alive.getAliveCharacter(p1.sender)
            end
            if not sender then
                return
            end
            local HumanoidRootPart = sender:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return
            end
            if (game.Workspace.CurrentCamera.CFrame.Position - u20.Position).Magnitude <= 15 and p1.sender ~= Players.LocalPlayer and 120 < (HumanoidRootPart.Position - u20.Position).Magnitude then
                Sounds.playRangedSoundEffect(Musket.Whizz, u20.Position, 80, 4, math.random(95, 105) / 100)
            end
            u54 = u54 + a1
            if not v3 then
                return
            end
            if v3.Instance and v3.Position and not (Players:GetPlayerFromCharacter(v3.Instance.Parent)) then
                Sounds.playFalloffSoundEffect(Musket.BulletImpact, v3.Position, 100, 2, 1)
            end
            if u34 then
                return
            end
            local BeamLong = u20:FindFirstChild("BeamLong")
            if BeamLong then
                BeamLong.Enabled = false
            end
            u34 = true
            if u33 then
                Signals.Bullet:Fire(p1.id, v3.Instance)
            end
            task.delay(2, function() -- Line: 167 -- upvalues: u20 (upval)
                u20:Destroy()
            end)
            u55:Disconnect()
        end)
        task.delay(4, function() -- Line: 174 -- upvalues: u34 (ref), u55 (ref), u20 (val)
            if u34 then
                return
            end
            u55:Disconnect()
            task.wait(2)
            u20:Destroy()
        end)
        return
    elseif p1.isServerSent and p1.owner == Players.LocalPlayer.UserId then
        return
    end
end