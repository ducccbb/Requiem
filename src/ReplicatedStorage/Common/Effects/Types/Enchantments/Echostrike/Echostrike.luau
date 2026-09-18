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
--    File: ReplicatedStorage.Common.Effects.Types.Enchantments.Echostrike.Echostrike
--                               Dumped in 0.00163 seconds
--                          Bytecode version 9  |  14 functions

local v1, v2, v3
script = nil
local v4 = getfenv(0)
v4.script = nil
_G.script = nil
v4 = getfenv(0)
v4.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Particles_2 = ReplicatedStorage_5:WaitForChild("Assets"):WaitForChild("Particles")
local Enchantments = Particles_2:WaitForChild("Enchantments")
local Echostrike = Enchantments:WaitForChild("Echostrike")
local Value = Enum.AnimationPriority.Action.Value
local u167 = {}
local v5 = {Gear.Blades.Swings.Ground, Gear.Blades.Swings.Air}
local v6 = nil
local v7 = nil
for i, j in v5, v6, v7 do
    v1 = j
    v2 = nil
    v3 = nil
    for k, n in v1, v2, v3 do
        u167[n] = true
    end
end
local function handleParticles(p1) -- Line: 40 -- upvalues: Echostrike (val), Particles (val)
    local v1, v2
    local v3 = p1
    for i, j in Echostrike:GetChildren() do
        v2 = v3:FindFirstChild(j.Name)
        if v2 then
            for k, n in j:GetChildren() do
                v1 = n:Clone()
                v1.Parent = v2
                v1.WorldCFrame = v2.CFrame
                Particles.deepEmitParticles(v1)
            end
        end
    end
end
local function getAnimator(p1) -- Line: 56
    local Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
    local Animator = Humanoid
    if Animator then
        Animator = Humanoid:FindFirstChildWhichIsA("Animator")
    end
    return Animator
end
local function getBladeSwingAnimationId(p1) -- Line: 63 -- upvalues: Character (val), Gear (val)
    local v1
    if not (Character.isGrounded(p1)) then
        v1 = "Air"
    else
        v1 = "Ground"
    end
    local v2 = Gear.Blades.Swings[v1]
    return v2[math.random(1, #v2)]
end
local function getPreferredCombatAnimationTrack(p1) -- Line: 71 -- upvalues: Value (val), u167 (val)
    local Value_2
    local v1 = nil
    local v2 = -1
    local v3 = nil
    local v4 = -1
    for i, j in p1:GetPlayingAnimationTracks() do
        if j.IsPlaying and j.Animation then
            Value_2 = j.Priority.Value
            if Value_2 >= Value then
                if not (u167[j.Animation.AnimationId]) then
                    if v2 < Value_2 then
                        v1 = j
                        v2 = Value_2
                    end
                elseif v4 < Value_2 then
                    v3 = j
                    v4 = Value_2
                end
            end
        end
    end
    return v3 or v1
end
local function prepareEchoCloneParts(p1, p2) -- Line: 103
    local v1 = p2
    for i, j in p1:GetDescendants() do
        if j:IsA("Decal") then
            j:Destroy()
        elseif not (j:IsA("Shirt")) and not (j:IsA("Pants")) and j:IsA("BasePart") then
            j.CollisionGroup = "Echostrike"
            if j ~= v1 then
                j.Anchored = false
            end
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
            j.Massless = true
        end
    end
    v1.Anchored = true
end
local function playAnimationOnClone(p1, p2, p3) -- Line: 131 -- upvalues: getAnimator (val), useAnimatorObserver (val)
    local AnimationId
    local v1 = getAnimator(p1)
    if not v1 then
        return
    end
    for i, j in v1:GetPlayingAnimationTracks() do
        j:Stop(0)
    end
    if typeof(p2) ~= "string" then
        AnimationId = p2.AnimationId
    else
        AnimationId = p2
    end
    local v2 = useAnimatorObserver.playAnimationOnRig(p1, AnimationId, 0, Enum.AnimationPriority.Action4)
    if not v2 then
        return
    end
    if p3 then
        v2.TimePosition = p3.TimePosition
        v2:AdjustSpeed(p3.Speed)
        return
    end
    if v2.Length == 0 then
        while true do
            task.wait()
            if 0 < v2.Length or not v2.IsPlaying then
                break
            end
        end
    end
    if 0 < v2.Length then
        v2.TimePosition = v2.Length * 0.65
    end
end
local function playMatchingAnimationOnClone(p1, p2, p3) -- Line: 165 -- upvalues: getAnimator (val), getPreferredCombatAnimationTrack (val), playAnimationOnClone (val), getBladeSwingAnimationId (val)
    local v1 = getAnimator(p1)
    if not v1 then
        return
    end
    local v2 = getPreferredCombatAnimationTrack(v1)
    if v2 then
        playAnimationOnClone(p2, v2.Animation, v2)
        return
    end
    if not p3 then
        return
    end
    local v3 = getBladeSwingAnimationId(p1)
    playAnimationOnClone(p2, v3, nil)
end
local function cloneCharacter(p1) -- Line: 184 -- upvalues: TweenService (val)
    local v1
    local v2 = p1:Clone()
    v2.Name = ("Echostrike_%*"):format(v2.Name)
    local Animate = v2:FindFirstChild("Animate")
    if Animate then
        Animate:Destroy()
    end
    for i, j in v2:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 1
            j.Color = Color3.fromRGB(67, 98, 201)
            j.Material = Enum.Material.Neon
            v1 = TweenInfo.new(0.5)
            TweenService:Create(j, v1, {LocalTransparencyModifier = 0.75}):Play()
        end
    end
    v2.Parent = workspace
    return v2
end
return function(p1) -- Line: 210 -- upvalues: cloneCharacter (val), prepareEchoCloneParts (val), playMatchingAnimationOnClone (val), handleParticles (val), TweenService (val)
    local senderCharacter = p1.senderCharacter
    if not senderCharacter or not senderCharacter.Parent then
        return
    end
    local HumanoidRootPart = senderCharacter:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local targetCharacter = p1.targetCharacter
    if targetCharacter then
        targetCharacter = p1.targetCharacter:FindFirstChild("HumanoidRootPart")
    end
    if not targetCharacter then
        return
    end
    senderCharacter.Archivable = true
    task.delay(0.15, function() -- Line: 233 -- upvalues: cloneCharacter (upval), senderCharacter (val), HumanoidRootPart (val), targetCharacter (val), prepareEchoCloneParts (upval), p1 (val), playMatchingAnimationOnClone (upval), handleParticles (upval), TweenService (upval)
        local v1
        local u2 = cloneCharacter(senderCharacter)
        local HumanoidRootPart_2 = u2:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart_2 then
            u2:Destroy()
            return
        end
        if math.random() >= 0.5 then
            v1 = 1
        else
            v1 = -1
        end
        local Position = (HumanoidRootPart.CFrame * CFrame.new(v1 * math.random(3, 5), 0, -1.5)).Position
        local v2 = Vector3.new(targetCharacter.Position.X, Position.Y, targetCharacter.Position.Z)
        HumanoidRootPart_2.CFrame = CFrame.lookAt(Position, v2)
        prepareEchoCloneParts(u2, HumanoidRootPart_2)
        local v3 = if p1.reason ~= "blades" then p1.category == "gear" else true
        playMatchingAnimationOnClone(senderCharacter, u2, v3)
        task.delay(0.2, function() -- Line: 253 -- upvalues: handleParticles (upval), p1 (upval)
            handleParticles(p1.targetCharacter)
        end)
        task.delay(0.5, function() -- Line: 257 -- upvalues: u2 (val), TweenService (upval)
            local v1
            for i, j in u2:GetDescendants() do
                if j:IsA("BasePart") then
                    v1 = TweenInfo.new(0.5)
                    TweenService:Create(j, v1, {LocalTransparencyModifier = 1}):Play()
                end
            end
            task.delay(0.5, function() -- Line: 266 -- upvalues: u2 (upval)
                u2:Destroy()
            end)
        end)
    end)
end