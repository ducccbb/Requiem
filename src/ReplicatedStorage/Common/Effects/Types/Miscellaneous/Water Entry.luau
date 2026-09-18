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
--        File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.Water Entry
--                              Dumped in 0.000482 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Water = Particles_2:WaitForChild("Water")
local function applyWaterEntryParticleColor(p1, p2) -- Line: 25
    local v1 = ColorSequence.new(p2)
    for i, j in p1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Color = v1
        end
    end
end
return function(p1, p2, p3, p4, p5) -- Line: 35 -- upvalues: Water (val), Workspace (val), applyWaterEntryParticleColor (val), Particles (val)
    local v1 = Color3.fromRGB(p3, p4, p5)
    local u13 = Water:Clone()
    u13.Anchored = true
    u13.CanCollide = false
    u13.CanQuery = false
    u13.CanTouch = false
    u13.Transparency = 1
    u13.CFrame = CFrame.new(p2)
    u13.Parent = Workspace
    applyWaterEntryParticleColor(u13, v1)
    Particles.deepEmitDelayedParticles(u13)
    task.delay(10, function() -- Line: 51 -- upvalues: u13 (val)
        u13:Destroy()
    end)
end