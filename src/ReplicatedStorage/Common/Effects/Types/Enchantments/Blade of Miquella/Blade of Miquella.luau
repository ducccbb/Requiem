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
--File: ReplicatedStorage.Common.Effects.Types.Enchantments.Blade of Miquella.Blade of Miquella
--                              Dumped in 0.000531 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local u32 = Particles_2:WaitForChild("Enchantments"):WaitForChild("Blade of Miquella")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local u80 = CFrame.new(0.272758484, 0.128234625, -0.305851936, -1, 0, 0, 0, -1, 0, 0, 0, 1)
return function(p1, p2) -- Line: 25 -- upvalues: trove (val), u32 (val), u80 (val), Particles (val)
    if not p1 then
        return
    end
    local u4 = trove.new()
    local function createConnectedParticle(p1, p2, p3) -- Line: 35 -- upvalues: u4 (val)
        local v1 = p1:Clone()
        if not (v1:IsA("BasePart")) then
            return p1
        end
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
        u4:Add(v1)
        u4:Add(WeldConstraint)
        return v1
    end
    local v1 = u32:WaitForChild(p2):Clone()
    local v2 = {}
    if v1:IsA("Model") then
        local v3
        for i, j in v1:GetChildren() do
            if j:IsA("BasePart") then
                v3 = createConnectedParticle(j, p1, u80)
                table.insert(v2, v3)
            end
        end
    end
    local v4 = createConnectedParticle(v1, p1, u80)
    Particles.deepEmitParticles(v4)
    local v5 = v2
    local v6 = nil
    local v7 = nil
    for k, n in v5, v6, v7 do
        Particles.deepEmitParticles(n)
    end
    task.delay(1.5, function() -- Line: 88 -- upvalues: u4 (val)
        u4:Clean()
        u4:Destroy()
    end)
end