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
--            File: ReplicatedStorage.Common.Effects.Types.Titans.FemaleSwing
--                              Dumped in 0.000399 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Titans = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
return function(p1, p2) -- Line: 24 -- upvalues: Titans (val), trove (val), Particles (val)
    local LeftHand
    local Punch = Titans:WaitForChild("Punch")
    if not Punch then
        return
    end
    if p2 ~= "Left" then
        LeftHand = p1:FindFirstChild("RightHand")
    else
        LeftHand = p1:FindFirstChild("LeftHand")
        if not LeftHand then
            LeftHand = p1:FindFirstChild("RightHand")
        end
    end
    if not LeftHand then
        return
    end
    local u19 = trove.new()
    local v1 = (function(p1, p2) -- Line: 38 -- upvalues: u19 (val)
        local v1 = p1:Clone()
        if not (v1:IsA("BasePart")) then
            return p1
        end
        v1.Anchored = false
        v1.Massless = true
        v1.CanCollide = false
        v1.CanTouch = false
        v1.CanQuery = false
        v1.CFrame = p2.CFrame
        v1.Parent = p2.Parent
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = p2
        WeldConstraint.Part1 = v1
        WeldConstraint.Parent = p2
        u19:Add(v1)
        u19:Add(WeldConstraint)
        return v1
    end)(Punch, LeftHand)
    Particles.deepEmitParticles(v1)
    task.delay(0.75, function() -- Line: 71 -- upvalues: u19 (val)
        u19:Clean()
        u19:Destroy()
    end)
end