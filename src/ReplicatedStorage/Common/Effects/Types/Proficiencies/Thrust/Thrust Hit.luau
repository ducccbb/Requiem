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
--     File: ReplicatedStorage.Common.Effects.Types.Proficiencies.Thrust.Thrust Hit
--                              Dumped in 0.000384 seconds
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
local u80 = CFrame.new(-0.14, -1.04, -0.02, 0, 0.7, -0.7, 0, -0.7, -0.7, -1, -0, 0)
return function(p1) -- Line: 29 -- upvalues: trove (val), Thrust (val), u80 (val), Particles (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart or not (HumanoidRootPart:IsA("BasePart")) then
        return
    end
    local u11 = trove.new()
    local v1 = (function(p1, p2, p3) -- Line: 41 -- upvalues: u11 (val)
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
        u11:Add(v1)
        u11:Add(WeldConstraint)
        return v1
    end)(Thrust.Hit, HumanoidRootPart, u80)
    Particles.deepEmitParticles(v1)
    task.delay(2, function() -- Line: 70 -- upvalues: u11 (val)
        u11:Clean()
        u11:Destroy()
    end)
end