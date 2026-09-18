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
--       File: ReplicatedStorage.Common.Effects.Types.Enchantments.The Law.The Law
--                              Dumped in 0.000569 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Enchantments = Particles_2:WaitForChild("Enchantments")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local u48 = {}
local u49 = {
    "Left Arm",
    "Right Arm",
    "Left Leg",
    "Right Leg",
    "Torso",
    "Head",
}
return function(p1, p2) -- Line: 24 -- upvalues: Enchantments (val), u48 (val), u49 (val), Particles (val)
    local v1
    if not p2 then
        if u48[p1] then
            for k, v in pairs(u48[p1]) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = false
                elseif v:IsA("Attachment") then
                    Particles.deepDisableParticles(v)
                end
                task.delay(2, function() -- Line: 62 -- upvalues: v (val)
                    v:Destroy()
                end)
            end
            u48[p1] = nil
        end
        return
    end
    local v2 = Enchantments:WaitForChild("The Law")
    u48[p1] = {}
    local Limb = v2:WaitForChild("Limb")
    local Torso = v2:WaitForChild("Torso")
    local v3 = p1
    for k2, i in pairs(p1:GetChildren()) do
        if table.find(u49, i.Name) then
            for k3, j in pairs(Limb:GetChildren()) do
                v1 = j:Clone()
                v1.Parent = i
                table.insert(u48[v3], v1)
            end
            if i.Name == "Torso" then
                for k4, k5 in pairs(Torso:GetChildren()) do
                    v1 = k5:Clone()
                    v1.Parent = i
                    table.insert(u48[v3], v1)
                end
            end
        end
    end
end