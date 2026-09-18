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
--          File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.Collapse
--                               Dumped in 0.00209 seconds
--                          Bytecode version 9  |  27 functions

local trySpawnFall
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local u91 = require(Packages:WaitForChild("trove")).new()
local u92 = {}
local u93 = {}
local u94 = false
local u95 = false
local u96 = false
local u97 = false
local u98 = nil
local u99 = nil
local u100 = nil
local u101 = nil
local u102 = 0
local u103 = {}
local u104 = nil
local u105 = 0
local u106 = 0
local u107 = nil
local u108 = {}
local u109 = 0
local function randomRange(p1, p2) -- Line: 61
    return math.random() * (p2 - p1) + p1
end
local function resetSpawnDelay() -- Line: 65 -- upvalues: u106 (ref), randomRange (val), u105 (ref)
    u106 = randomRange(0.08, 0.35)
    u105 = 0
end
local function getLocalRoot() -- Line: 70 -- upvalues: Players (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return nil
    end
    return (Character:FindFirstChild("HumanoidRootPart"))
end
local function getShakeIntensity() -- Line: 82 -- upvalues: getLocalRoot (val), u98 (ref), u99 (ref)
    local v1 = getLocalRoot()
    if not v1 then
        return 0
    end
    local Magnitude = (v1.Position - u98).Magnitude
    if u99 < Magnitude then
        return 0
    end
    if Magnitude <= 1000 then
        return 1
    end
    if 2000 <= Magnitude then
        return 0
    end
    return 1 - (Magnitude - 1000) / 1000
end
local function removeActiveFall(p1) -- Line: 104 -- upvalues: u93 (val)
    local v1 = table.find(u93, p1)
    if v1 then
        table.remove(u93, v1)
    end
end
local function fadeOutPart(p1, p2) -- Line: 111 -- upvalues: TweenService (val)
    local v1
    if p1:IsA("BasePart") then
        local v2 = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(p1, v2, {Transparency = 1}):Play()
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            v1 = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(j, v1, {Transparency = 1}):Play()
        end
    end
end
local function fadeOutActiveFalls() -- Line: 127 -- upvalues: u93 (val), fadeOutPart (val), u102 (ref)
    local v1
    local v2 = 1
    local v3 = -1
    for i = #u93, v2, v3 do
        v1 = u93[i]
        v1.tween:Cancel()
        fadeOutPart(v1.clone, 3)
        table.remove(u93, i)
    end
    u102 = 0
end
local function cleanupCollapse() -- Line: 138 -- upvalues: u91 (val), u107 (ref), u93 (val), u103 (val), u102 (ref), u104 (ref), u95 (ref), u96 (ref), u97 (ref)
    u91:Clean()
    if u107 then
        u107:Destroy()
        u107 = nil
    end
    table.clear(u93)
    table.clear(u103)
    u102 = 0
    u104 = nil
    u95 = false
    u96 = false
    u97 = false
end
local function beginShutdown() -- Line: 156 -- upvalues: u95 (ref), u96 (ref), u97 (ref), u107 (ref), fadeOutActiveFalls (val), u91 (val), cleanupCollapse (val)
    if not u95 or u96 then
        return
    end
    u96 = true
    u97 = false
    if u107 and u107:IsShaking() then
        u107:StopSustain()
    end
    fadeOutActiveFalls()
    u91:Add(task.delay(3, cleanupCollapse))
end
local function setupShake() -- Line: 173 -- upvalues: Workspace (val), Shake (val), getShakeIntensity (val), u107 (ref), u91 (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v1 = Shake.new()
    v1.FadeInTime = 3
    v1.FadeOutTime = 3
    v1.Frequency = 0.04
    v1.Amplitude = 0.7
    v1.Sustain = true
    v1.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 188 -- upvalues: getShakeIntensity (upval), CurrentCamera (val)
        local v1 = getShakeIntensity()
        if v1 <= 0 then
            return
        end
        local v2 = p2 * v1
        local v3 = CurrentCamera
        local v4 = CFrame.new(p1 * v1)
        v3.CFrame = v3.CFrame * (v4 * CFrame.Angles(v2.X, v2.Y, v2.Z))
    end)
    u107 = v1
    u91:Add(function() -- Line: 202 -- upvalues: u107 (upval)
        if u107 then
            u107:Destroy()
            u107 = nil
        end
    end)
end
local function onRegisterObjects() -- Line: 214 -- upvalues: u92 (val), CollectionService (val), u94 (ref)
    local Goal, Object, Particle
    table.clear(u92)
    for i, j in CollectionService:GetTagged("Falling") do
        Object = j:FindFirstChild("Object")
        Goal = j:FindFirstChild("Goal")
        Particle = j:FindFirstChild("Particle")
        if Object and Goal then
            table.insert(u92, {reference = Object, goal = Goal.CFrame, particle = Particle})
        end
    end
    u94 = true
end
local function isEntryAvailable(p1) -- Line: 238 -- upvalues: u98 (ref), u99 (ref), u103 (val)
    local v1 = p1.reference.Position - u98
    local v2 = u99 * u99
    if v2 < v1:Dot(v1) then
        return false
    end
    local v3 = u103[p1.reference]
    local v4 = not v3
    if not v4 then
        v4 = v3 <= os.clock()
    end
    return v4
end
local function invalidateCandidatesCache() -- Line: 249 -- upvalues: u109 (ref)
    u109 = 0
end
local function refreshCandidatesCache() -- Line: 253 -- upvalues: u109 (ref), u108 (val), u92 (val), isEntryAvailable (val)
    local v1 = os.clock()
    local v2 = v1 - u109
    if v2 < 0.1 then
        return
    end
    table.clear(u108)
    v2 = u92
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if isEntryAvailable(j) then
            table.insert(u108, j)
        end
    end
    u109 = v1
end
local function shouldStaggerSpawns() -- Line: 270 -- upvalues: u100 (ref), u102 (ref)
    if u100 <= 0 then
        return false
    end
    local v1 = u100 * 0.85 <= u102
    return v1
end
local function getSpawnBatchSize() -- Line: 278 -- upvalues: u100 (ref), u102 (ref)
    local v1 = u100 - u102
    return (math.max(1, (math.min(16, (math.ceil(v1 / 4))))))
end
local function getRandomAvailableInRadius() -- Line: 287 -- upvalues: refreshCandidatesCache (val), u108 (val), u104 (ref)
    refreshCandidatesCache()
    if #u108 == 0 then
        return nil
    end
    local v1 = u108
    if 1 < #v1 and u104 then
        local v2 = {}
        local v3 = v1
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j.reference ~= u104 then
                table.insert(v2, j)
            end
        end
        if 0 < #v2 then
            v1 = v2
        end
    end
    return v1[math.random(1, #v1)]
end
local function spawnFall(p1, p2) -- Line: 318 -- upvalues: Workspace (val), u91 (val), randomRange (val), TweenService (val), u93 (val), removeActiveFall (val), u96 (ref), Particles (val)
    local u5 = p1.reference:Clone()
    u5.Anchored = true
    u5.CanCollide = false
    u5.CanTouch = false
    u5.CanQuery = false
    u5.Massless = true
    u5.CFrame = p1.reference.CFrame
    local v1 = math.random(90, 110) / 100
    local v2 = math.random(90, 110) / 100
    u5.Size = p1.reference.Size * Vector3.new(v1, v2, math.random(90, 110) / 100)
    u5.Parent = Workspace
    u91:Add(u5)
    local v3 = randomRange(1.4, 2.8)
    v2 = TweenInfo.new(v3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local v4 = TweenService:Create(u5, v2, {CFrame = p1.goal})
    local u55 = {clone = u5, tween = v4}
    table.insert(u93, u55)
    v4:Play()
    v4.Completed:Once(function() -- Line: 345 -- upvalues: removeActiveFall (upval), u55 (val), u96 (upval), p1 (val), Particles (upval), u5 (val), p2 (val)
        removeActiveFall(u55)
        if u96 then
            return
        end
        if p1.particle then
            local v1 = math.random(1, 100)
            if v1 <= 50 then
                Particles.deepEmitParticles(p1.particle)
            end
        end
        u5:Destroy()
        p2()
    end)
end
function trySpawnFall() -- Line: 365 -- upvalues: u97 (ref), u96 (ref), u102 (ref), u100 (ref), getRandomAvailableInRadius (val), u104 (ref), invalidateCandidatesCache (val), spawnFall (val), u101 (ref), randomRange (val), u103 (val), trySpawnFall (val)
    if not u97 or u96 or u100 <= u102 or u100 <= 0 then
        return false
    end
    local u7 = getRandomAvailableInRadius()
    if not u7 then
        return false
    end
    u102 = u102 + 1
    u104 = u7.reference
    invalidateCandidatesCache()
    spawnFall(u7, function() -- Line: 383 -- upvalues: u102 (upval), u101 (upval), randomRange (upval), u103 (upval), u7 (val), invalidateCandidatesCache (upval), u97 (upval), u96 (upval), u100 (upval), trySpawnFall (upval)
        u102 = u102 - 1
        local v1 = u101 * randomRange(0.65, 1.35)
        u103[u7.reference] = os.clock() + v1
        invalidateCandidatesCache()
        if u97 and not u96 and u102 < u100 then
            trySpawnFall()
        end
    end)
    return true
end
local function fillPipeline() -- Line: 400 -- upvalues: u97 (ref), u96 (ref), getSpawnBatchSize (val), u102 (ref), u100 (ref), trySpawnFall (val)
    if not u97 or u96 then
        return
    end
    local v1 = getSpawnBatchSize()
    local v2 = 1
    for i = 1, v1, v2 do
        if u100 <= u102 or not (trySpawnFall()) then
            break
        end
    end
end
return function(p1, p2, p3, p4, p5) -- Line: 418 -- upvalues: beginShutdown (val), u96 (ref), cleanupCollapse (val), u91 (val), u102 (ref), u104 (ref), u103 (val), u93 (val), invalidateCandidatesCache (val), resetSpawnDelay (val), u94 (ref), onRegisterObjects (val), u98 (ref), u99 (ref), u100 (ref), u101 (ref), u95 (ref), u97 (ref), setupShake (val), RunService (val), shouldStaggerSpawns (val), u105 (ref), u106 (ref), trySpawnFall (val), fillPipeline (val)
    if not p1 then
        beginShutdown()
        return
    end
    if u96 then
        cleanupCollapse()
    end
    u91:Clean()
    u102 = 0
    u104 = nil
    table.clear(u103)
    table.clear(u93)
    invalidateCandidatesCache()
    resetSpawnDelay()
    if not u94 then
        onRegisterObjects()
    end
    u98 = p2
    u99 = p3
    u100 = math.max(0, (math.floor(p4)))
    u101 = math.max(0, p5)
    u95 = true
    u96 = false
    u97 = true
    setupShake()
    u91:Add(RunService.Heartbeat:Connect(function(p1) -- Line: 451 -- upvalues: u97 (upval), shouldStaggerSpawns (upval), u105 (upval), u106 (upval), resetSpawnDelay (upval), trySpawnFall (upval), fillPipeline (upval)
        if not u97 then
            return
        end
        if not (shouldStaggerSpawns()) then
            u105 = 0
            fillPipeline()
            return
        end
        u105 = u105 + p1
        if u105 < u106 then
            return
        end
        resetSpawnDelay()
        trySpawnFall()
    end))
end