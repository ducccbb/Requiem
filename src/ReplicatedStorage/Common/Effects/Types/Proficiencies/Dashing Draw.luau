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
--        File: ReplicatedStorage.Common.Effects.Types.Proficiencies.Dashing Draw
--                              Dumped in 0.000426 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Particles_2 = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Particles")
local u32 = Particles_2:WaitForChild("Proficiencies"):WaitForChild("Dashing Draw")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local u95 = CFrame.new(2.36395264, -1.2238965, -29.1352539, -1, 0, 0, 0, 1, 0, 0, 0, -1)
return function(p1) -- Line: 31 -- upvalues: Alive (val), trove (val), u32 (val), u95 (val), Particles (val)
    local v1 = Alive.getAliveCharacter(p1)
    if not v1 then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart or not (HumanoidRootPart:IsA("BasePart")) then
        return
    end
    local u15 = trove.new()
    local v2 = (function(p1, p2, p3) -- Line: 48 -- upvalues: u15 (val)
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
        u15:Add(v1)
        u15:Add(WeldConstraint)
        return v1
    end)(u32.Slash, HumanoidRootPart, u95)
    Particles.deepEmitParticles(v2)
    task.delay(0.5, function() -- Line: 77 -- upvalues: u15 (val)
        u15:Clean()
        u15:Destroy()
    end)
end