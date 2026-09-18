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
--       File: ReplicatedStorage.Common.Effects.Types.Proficiencies.Thrust.Thrust
--                              Dumped in 0.000499 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Particles_2 = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Particles")
local Thrust = Particles_2:WaitForChild("Proficiencies"):WaitForChild("Thrust")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local u80 = CFrame.new(0.3, 0.61, 1.04, 1, 0, 0, 0, -3.63588333e-05, 1, 0, -1, -3.63588333e-05)
local u94 = CFrame.new(0.272758484, 0.128234625, -0.305851936, -1, 0, 0, 0, -1, 0, 0, 0, 1)
local u99 = CFrame.new(0, 0, 0)
return function(p1, p2) -- Line: 32 -- upvalues: trove (val), Thrust (val), u80 (val), Particles (val), u99 (val), u94 (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart or not (HumanoidRootPart:IsA("BasePart")) then
        return
    end
    local u17 = trove.new()
    local function createConnectedParticle(p1, p2, p3) -- Line: 47 -- upvalues: u17 (val)
        local v1 = p1:Clone()
        v1.Anchored = false
        v1.Massless = true
        v1.CanCollide = false
        v1.CanTouch = false
        v1.CanQuery = false
        v1.CFrame = p2.CFrame * p3
        v1.Parent = p2.Parent
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = p2
        WeldConstraint.Part1 = v1
        WeldConstraint.Parent = p2
        u17:Add(v1)
        u17:Add(WeldConstraint)
        return v1
    end
    local v1 = createConnectedParticle(Thrust.Burst, HumanoidRootPart, u80)
    Particles.deepEmitParticles(v1)
    local u34 = createConnectedParticle(Thrust.Trail, HumanoidRootPart, u99)
    Particles.deepEnableParticles(u34)
    task.delay(0.5 - (workspace:GetServerTimeNow() - p2), function() -- Line: 79 -- upvalues: createConnectedParticle (val), Thrust (upval), HumanoidRootPart (val), u94 (upval), Particles (upval), u34 (val), u17 (val)
        local v1 = createConnectedParticle(Thrust.Slash, HumanoidRootPart, u94)
        Particles.deepEmitParticles(v1)
        Particles.deepDisableParticles(u34)
        task.wait(2)
        u17:Clean()
        u17:Destroy()
    end)
end