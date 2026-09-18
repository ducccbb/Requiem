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
--            File: ReplicatedStorage.Common.Effects.Types.Tools.BlunderBuss
--                              Dumped in 0.000501 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Sounds = Common:WaitForChild("Sounds")
local Tools = Sounds:WaitForChild("Tools")
local Musket = require(Tools:WaitForChild("Musket"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Alive = require(Common_3:WaitForChild("Alive"))
return function(p1, p2, p3, p4) -- Line: 21 -- upvalues: Players (val), Alive (val), Musket (val), Particles (val)
    if not p4 then
        local v1 = Alive.getAliveCharacter(Players.LocalPlayer)
        local BlunderBuss = p1:FindFirstChild("BlunderBuss")
        if not BlunderBuss then
            return
        end
        local Exit = BlunderBuss:FindFirstChild("Exit", true)
        if not Exit then
            return
        end
        local Fire = BlunderBuss:FindFirstChild("Fire", true)
        if not Fire then
            return
        end
        Fire.SoundId = Musket.BlunderBussFire
        Fire.RollOffMinDistance = 50
        Fire.RollOffMaxDistance = 500
        if v1 and v1 ~= p1 then
            local Magnitude = (v1:GetPivot().Position - p1:GetPivot().Position).Magnitude
            if 500 >= Magnitude then
                if 1000 < Magnitude then
                    Fire.SoundId = Musket.DistantFire.Far
                    Fire.RollOffMinDistance = 1500
                    Fire.RollOffMaxDistance = 1500
                end
            elseif Magnitude < 1000 then
                Fire.SoundId = Musket.DistantFire.Medium
                Fire.RollOffMinDistance = 1000
                Fire.RollOffMaxDistance = 1000
            elseif 1000 < Magnitude then
                Fire.SoundId = Musket.DistantFire.Far
                Fire.RollOffMinDistance = 1500
                Fire.RollOffMaxDistance = 1500
            end
        end
        Fire.Volume = 2
        Particles.deepEmitParticles(Exit, false, p2, p3)
        return
    elseif p4 == Players.LocalPlayer.UserId then
        return
    end
end