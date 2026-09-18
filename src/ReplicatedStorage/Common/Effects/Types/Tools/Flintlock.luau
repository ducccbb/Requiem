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
--             File: ReplicatedStorage.Common.Effects.Types.Tools.Flintlock
--                              Dumped in 0.000412 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
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
return function(p1, p2, p3) -- Line: 17 -- upvalues: Alive (val), Musket (val), Particles (val)
    local Flintlock = p1:FindFirstChild("Flintlock")
    if not Flintlock then
        return
    end
    local v1 = Alive.getAliveCharacter(Alive.LocalPlayer)
    local Exit = Flintlock:FindFirstChild("Exit", true)
    if not Exit then
        return
    end
    local Fire = Flintlock:FindFirstChild("Fire", true)
    if not Fire then
        return
    end
    Fire.SoundId = Musket.Fire[math.random(1, #Musket.Fire)]
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
end