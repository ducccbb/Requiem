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
--File: ReplicatedStorage.Common.Effects.Types.Enchantments.Mark of the Hidden Blade.Mark of the Hidden Blade
--                              Dumped in 0.000429 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles = Assets:WaitForChild("Particles")
local Enchantments = Particles:WaitForChild("Enchantments")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local u48 = {}
return function(p1, p2) -- Line: 24 -- upvalues: Character (val), u48 (val), Enchantments (val)
    local ParticleEmitter, Torso_2, v1, v2
    if typeof(p1) ~= "Instance" or not (p1:IsA("Player")) then
        return
    end
    local v3 = Character.getCharacter(p1)
    if not v3 then
        return
    end
    local Torso = v3:FindFirstChild("Torso")
    if not Torso then
        return
    end
    if not p2 then
        local u42 = u48[v3]
        if not u42 then
            return
        end
        u42.Enabled = false
        task.delay(2, function() -- Line: 66 -- upvalues: u42 (val)
            u42:Destroy()
        end)
        u48[v3] = nil
        return
    end
    local v4 = u48[v3]
    if not v4 then
        v1 = Enchantments:WaitForChild("Mark of the Hidden Blade")
        Torso_2 = v1:WaitForChild("Torso")
        ParticleEmitter = Torso_2:FindFirstChildWhichIsA("ParticleEmitter")
        if not ParticleEmitter then
            return
        end
        v2 = ParticleEmitter:Clone()
        v2.Parent = Torso
        v2.Enabled = true
        u48[v3] = v2
        return
    end
    if v4.Parent then
        v4.Enabled = true
        return
    end
    v1 = Enchantments:WaitForChild("Mark of the Hidden Blade")
    Torso_2 = v1:WaitForChild("Torso")
    ParticleEmitter = Torso_2:FindFirstChildWhichIsA("ParticleEmitter")
    if not ParticleEmitter then
        return
    end
    v2 = ParticleEmitter:Clone()
    v2.Parent = Torso
    v2.Enabled = true
    u48[v3] = v2
end