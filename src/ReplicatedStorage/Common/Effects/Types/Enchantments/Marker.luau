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
--           File: ReplicatedStorage.Common.Effects.Types.Enchantments.Marker
--                              Dumped in 0.000804 seconds
--                          Bytecode version 9  |  7 functions

local mount, mount_2
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Enchantments = Particles_2:WaitForChild("Enchantments")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
mount, _, _, mount_2 = require(Utilities_2:WaitForChild("State"))("mount")
local u82 = Color3.fromRGB(56, 68, 230)
local function applyParticles(p1, p2) -- Line: 25 -- upvalues: Enchantments (val), Particles (val)
    local Marker = Enchantments:WaitForChild("Marker")
    local Buff = Marker:WaitForChild("Buff")
    local v1 = Buff:FindFirstChildWhichIsA("Attachment"):Clone()
    v1.Parent = p1
    if p2 then
        local v2 = p2
        for i, j in v1:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                j.Color = ColorSequence.new(v2)
            elseif not (j:IsA("Trail")) then
            end
        end
    end
    Particles.deepEmitParticles(v1, true)
end
local function applyHighlight(p1, p2, p3) -- Line: 40 -- upvalues: u82 (val), TweenService (val)
    if not p1.Parent then
        return
    end
    local v1 = p2
    if not v1 then
        v1 = u82
    end
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = v1
    Highlight.OutlineColor = v1
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    Highlight.Adornee = p1
    Highlight.Parent = p1
    local v2 = TweenInfo.new(0.15)
    TweenService:Create(Highlight, v2, {FillTransparency = 0.65, OutlineTransparency = 0}):Play()
    task.delay(p3 or 10, function() -- Line: 63 -- upvalues: Highlight (val), TweenService (upval)
        if not Highlight.Parent then
            return
        end
        local v1 = TweenInfo.new(0.3)
        TweenService:Create(Highlight, v1, {FillTransparency = 1, OutlineTransparency = 1}):Play()
        task.delay(0.3, function() -- Line: 73 -- upvalues: Highlight (upval)
            Highlight:Destroy()
        end)
    end)
end
local function restoreHorseStamina(p1) -- Line: 79 -- upvalues: mount_2 (val), mount (val)
    local v1 = mount_2()
    if not v1 or not v1.enabled then
        return
    end
    mount({enabled = v1.enabled, stamina = math.clamp(v1.stamina + v1.maxStamina * (p1 / 100), 0, v1.maxStamina), maxStamina = v1.maxStamina, speed = v1.speed})
end
return function(p1, p2, p3) -- Line: 96 -- upvalues: restoreHorseStamina (val), applyHighlight (val), applyParticles (val)
    if typeof(p1) == "number" then
        restoreHorseStamina(p1)
        return
    end
    if not (p1:IsA("Model")) then
        if p1:IsA("BasePart") then
            applyParticles(p1, p2)
        end
        return
    end
    if p1:FindFirstChildWhichIsA("Humanoid") then
        applyHighlight(p1, p2, p3)
        return
    end
    if p1:IsA("BasePart") then
        applyParticles(p1, p2)
    end
end