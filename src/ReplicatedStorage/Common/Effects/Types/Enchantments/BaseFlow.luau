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
--          File: ReplicatedStorage.Common.Effects.Types.Enchantments.BaseFlow
--                              Dumped in 0.000813 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Enchantments = Particles_2:WaitForChild("Enchantments")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Proficiencies = require(Sounds_2:WaitForChild("Proficiencies"))
local u91 = {}
local u92 = {
    "Left Arm",
    "Right Arm",
    "Left Leg",
    "Right Leg",
    "Torso",
    "Head",
}
return function(p1, p2, p3) -- Line: 28 -- upvalues: Players (val), Sounds (val), Proficiencies (val), Enchantments (val), u91 (val), u92 (val), Particles (val)
    local v1
    local v2 = p3
    if not v2 then
        v2 = Color3.fromRGB(255, 255, 255)
    end
    if not p2 then
        if u91[p1] then
            for k, v in pairs(u91[p1]) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = false
                elseif v:IsA("Attachment") then
                    Particles.deepDisableParticles(v)
                end
                task.delay(2, function() -- Line: 86 -- upvalues: v (val)
                    v:Destroy()
                end)
            end
            u91[p1] = nil
        end
        return
    end
    if p1 == Players.LocalPlayer.Character then
        Sounds.playGlobalSoundEffect(Proficiencies.FlowProc, 0.1, 1.5, 4)
    end
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        Sounds.playRangedSoundEffect(Proficiencies.Flow.Enabled, HumanoidRootPart, 80, 1.5, {min = 0.95, max = 1.05})
    end
    local v3 = Enchantments:WaitForChild("Base Flow")
    u91[p1] = {}
    local Limb = v3:WaitForChild("Limb")
    local Torso = v3:WaitForChild("Torso")
    local v4 = p1
    for k2, i in pairs(p1:GetChildren()) do
        if table.find(u92, i.Name) then
            for k3, j in pairs(Limb:GetChildren()) do
                v1 = j:Clone()
                v1.Parent = i
                if v1:IsA("ParticleEmitter") then
                    v1.Color = ColorSequence.new(v2)
                end
                table.insert(u91[v4], v1)
            end
            if i.Name == "Torso" then
                for k4, k5 in pairs(Torso:GetChildren()) do
                    v1 = k5:Clone()
                    v1.Parent = i
                    if v1:IsA("ParticleEmitter") then
                        v1.Color = ColorSequence.new(v2)
                    end
                    table.insert(u91[v4], v1)
                end
            end
        end
    end
end