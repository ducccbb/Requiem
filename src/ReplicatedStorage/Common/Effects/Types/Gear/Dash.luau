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
--                File: ReplicatedStorage.Common.Effects.Types.Gear.Dash
--                              Dumped in 0.000528 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Gear = require(Sounds_2:WaitForChild("Gear"))
return function(p1) -- Line: 20 -- upvalues: Alive (val), Particles (val), Sounds (val), Gear (val)
    local v1 = Alive.getAliveCharacter(p1)
    if not v1 then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local Character = Alive.LocalPlayer.Character
    local PrimaryPart = Character
    if PrimaryPart then
        PrimaryPart = Character.PrimaryPart
    end
    if not PrimaryPart or 300 < (PrimaryPart.Position - HumanoidRootPart.Position).Magnitude then
        return
    end
    local DashParticle = v1:FindFirstChild("DashParticle", true)
    if DashParticle then
        Particles.deepEmitParticles(DashParticle)
    end
    Sounds.playRangedSoundEffect(Gear.Woosh, HumanoidRootPart, 150, 0.3, math.random(95, 105) / 100)
    Sounds.playRangedSoundEffect(Gear.Orbit, HumanoidRootPart, 150, 1, math.random(95, 105) / 100)
end