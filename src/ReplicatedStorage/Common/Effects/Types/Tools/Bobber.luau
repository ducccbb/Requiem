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
--               File: ReplicatedStorage.Common.Effects.Types.Tools.Bobber
--                               Dumped in 0.00305 seconds
--                          Bytecode version 9  |  25 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local FishingBobberState = require(Utilities:WaitForChild("FishingBobberState"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_4 = Common_5:WaitForChild("Utilities")
local Water = require(Utilities_4:WaitForChild("Water"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local u155 = require(Tools:WaitForChild("Fishing Rod"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Objects = Assets:WaitForChild("Objects")
local Bobber = Objects:WaitForChild("Bobber")
local Fish = Objects:WaitForChild("Fish", 10)
local Particles_2 = Assets:WaitForChild("Particles")
local WaterBobber = Particles_2:WaitForChild("WaterBobber")
local u181 = {}
local function cancelBobberTweens(p1) -- Line: 99
    if p1.landTween then
        p1.landTween:Cancel()
        p1.landTween = nil
    end
    if p1.bobTween then
        p1.bobTween:Cancel()
        p1.bobTween = nil
    end
end
local function applyWaterBobberParticleColor(p1, p2) -- Line: 111
    local v1 = ColorSequence.new(p2)
    for i, j in p1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Color = v1
        end
    end
end
local function playWaterBobberEffect(p1, p2) -- Line: 121 -- upvalues: WaterBobber (val), Water (val), applyWaterBobberParticleColor (val), Workspace (val), Particles (val)
    local u5 = WaterBobber:Clone()
    if u5:IsA("Model") then
        u5:PivotTo(CFrame.new(p1))
    elseif u5:IsA("BasePart") then
        u5.CFrame = CFrame.new(p1)
    end
    for i, j in u5:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
            j.Transparency = 1
        end
    end
    if u5:IsA("BasePart") then
        u5.Anchored = true
        u5.CanCollide = false
        u5.CanQuery = false
        u5.CanTouch = false
        u5.Transparency = 1
    end
    local v1 = Water.isPositionInWater(p1, p2)
    if v1 then
        applyWaterBobberParticleColor(u5, v1.Color)
    end
    u5.Parent = Workspace
    Particles.deepEmitDelayedParticles(u5)
    task.delay(10, function() -- Line: 156 -- upvalues: u5 (val)
        u5:Destroy()
    end)
end
local function playWaterIdleBobTween(p1, p2) -- Line: 161 -- upvalues: TweenService (val)
    local v1 = CFrame.new(p2)
    local v2 = CFrame.new(p2 - Vector3.new(0, 1, 0))
    p1.CFrame = v1
    local v3 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local v4 = TweenService:Create(p1, v3, {CFrame = v2})
    v4:Play()
    return v4
end
local function playWaterLandTween(p1, p2, p3) -- Line: 178 -- upvalues: TweenService (val)
    local u5 = CFrame.new(p2)
    local v1 = CFrame.new(p2 - Vector3.new(0, 1, 0))
    p1.CFrame = u5
    local v2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true)
    local v3 = TweenService:Create(p1, v2, {CFrame = v1})
    v3:Play()
    v3.Completed:Once(function(a1) -- Line: 191 -- upvalues: p1 (val), u5 (val), p3 (val)
        if a1 ~= Enum.PlaybackState.Completed or not p1.Parent then
            return
        end
        p1.CFrame = u5
        p3()
    end)
    return v3
end
local function destroyBobber(p1) -- Line: 203 -- upvalues: u181 (val), cancelBobberTweens (val), FishingBobberState (val)
    local v1 = u181[p1]
    if not v1 then
        return
    end
    if v1.connection then
        v1.connection:Disconnect()
    end
    if v1.failsafeThread then
        task.cancel(v1.failsafeThread)
        v1.failsafeThread = nil
    end
    cancelBobberTweens(v1)
    if v1.model.Parent then
        v1.model:Destroy()
    end
    FishingBobberState.clearBobber(p1)
    u181[p1] = nil
end
local function anchorBobber(p1, p2) -- Line: 229
    p1.Anchored = true
    p1.AssemblyLinearVelocity = Vector3.zero
    p1.AssemblyAngularVelocity = Vector3.zero
    p1.CFrame = CFrame.new(p2)
end
local function getRaycastParams(p1, p2) -- Line: 236 -- upvalues: CollectionService (val)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    local v2 = {p1}
    if p2 then
        table.insert(v2, p2)
    end
    for i, j in CollectionService:GetTagged("Water") do
        table.insert(v2, j)
    end
    v1.FilterDescendantsInstances = v2
    return v1
end
local function getRodLineBeam(p1) -- Line: 258
    if not p1 then
        return nil
    end
    local RightHand = p1:FindFirstChild("RightHand")
    if not RightHand then
        return nil
    end
    local Handle = RightHand:FindFirstChild("Handle")
    if not Handle or not Handle.Part1 then
        return nil
    end
    local v1 = Handle.Part1:FindFirstAncestorWhichIsA("Model")
    if not v1 then
        return nil
    end
    local Main = v1:FindFirstChild("Main", true)
    if not Main then
        return v1:FindFirstChildWhichIsA("Beam", true)
    end
    local Beam = Main:FindFirstChildWhichIsA("Beam")
    if Beam then
        return Beam
    end
    return v1:FindFirstChildWhichIsA("Beam", true)
end
local function connectLineBeam(p1, p2) -- Line: 297 -- upvalues: getRodLineBeam (val)
    local v1 = getRodLineBeam(p2)
    if not v1 then
        return
    end
    local main = p1:FindFirstChild("main")
    local LineBobber = main
    if LineBobber then
        LineBobber = main:FindFirstChild("LineBobber")
    end
    if not LineBobber or not (LineBobber:IsA("Attachment")) then
        return
    end
    v1.Attachment1 = LineBobber
end
local function runBobberCast(p1, p2) -- Line: 312 -- upvalues: Bobber (val), Alive (val), connectLineBeam (val), Workspace (val), getRaycastParams (val), u181 (val), FishingBobberState (val), Water (val), anchorBobber (val), playWaterBobberEffect (val), Sounds (val), u155 (val), playWaterLandTween (val), playWaterIdleBobTween (val), RunService (val), destroyBobber (val), Players (val)
    local u5 = Bobber:Clone()
    local Root = u5:FindFirstChild("Root")
    if not Root then
        Root = u5.PrimaryPart
        if not Root then
            Root = u5:FindFirstChildWhichIsA("BasePart")
        end
    end
    if not Root then
        u5:Destroy()
        return
    end
    for i, j in u5:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = false
            j.CanCollide = false
        end
    end
    local v1 = p2
    if v1 then
        v1 = Alive.getAliveCharacter(p2)
    end
    connectLineBeam(u5, v1)
    u5.Parent = Workspace
    Root.CFrame = CFrame.new(p1.startPos)
    local u56 = getRaycastParams(u5, v1)
    local u57 = {u5}
    if v1 then
        table.insert(u57, v1)
    end
    local startPos = p1.startPos
    local velocity = p1.velocity
    local gravity = p1.gravity
    local u67 = 0
    local u68 = false
    local u69 = nil
    u181[p1.bobberId] = {model = u5}
    FishingBobberState.setBobberState(p1.bobberId, false, false)
    local function settleAt(a1) -- Line: 363 -- upvalues: u68 (ref), Water (upval), u57 (val), FishingBobberState (upval), p1 (val), anchorBobber (upval), Root (val), playWaterBobberEffect (upval), Sounds (upval), u155 (upval), u181 (upval), playWaterLandTween (upval), playWaterIdleBobTween (upval)
        local u17
        if u68 then
            return
        end
        u68 = true
        local v1 = Water.getWaterSurfaceY(a1, u57)
        local v2 = v1 ~= nil
        if not v1 then
            u17 = a1
        else
            u17 = Vector3.new(a1.X, v1, a1.Z)
        end
        FishingBobberState.setBobberState(p1.bobberId, true, v2, u17)
        anchorBobber(Root, u17)
        if v1 then
            playWaterBobberEffect(u17, u57)
            Sounds.playRangedSoundEffect(u155.BobberLandInWater, Root, 80, 2)
            local v3 = u181[p1.bobberId]
            if v3 then
                v3.landTween = playWaterLandTween(Root, u17, function() -- Line: 383 -- upvalues: u181 (upval), p1 (upval), Root (upval), playWaterIdleBobTween (upval), u17 (val)
                    local v1 = u181[p1.bobberId]
                    if not v1 or not Root.Parent then
                        return
                    end
                    v1.bobTween = playWaterIdleBobTween(Root, u17)
                end)
            end
        end
    end
    u69 = RunService.Heartbeat:Connect(function(a1) -- Line: 395 -- upvalues: u68 (ref), u5 (val), u69 (ref), u67 (ref), destroyBobber (upval), p1 (val), startPos (ref), velocity (ref), gravity (val), Root (val), Water (upval), u57 (val), settleAt (val), Workspace (upval), u56 (val)
        if u68 then
            if u69.Connected then
                u69:Disconnect()
            end
            return
        else
            if not u5.Parent then
                if u69.Connected then
                    u69:Disconnect()
                end
                return
            end
            u67 = u67 + a1
            if 10 <= u67 then
                if u69.Connected then
                    u69:Disconnect()
                end
                destroyBobber(p1.bobberId)
                return
            end
            local v1 = startPos
            startPos = startPos + velocity * 0.03
            velocity = velocity + gravity * 0.03
            Root.CFrame = CFrame.new(startPos)
            local v2 = Water.getWaterSurfaceY(startPos, u57)
            if not v2 then
                if 0.1 > u67 then
                    return
                end
                local v3 = startPos - v1
                if 0 >= v3.Magnitude then
                    return
                end
                local v4 = Workspace:Spherecast(v1, 0.15, v3 * 8, u56)
                if not v4 or Water.isWaterTagged(v4.Instance) then
                    return
                end
                if u69.Connected then
                    u69:Disconnect()
                end
                settleAt(v4.Position)
                return
            elseif startPos.Y <= v2 + 0.15 then
                if u69.Connected then
                    u69:Disconnect()
                end
                settleAt((Vector3.new(startPos.X, v2, startPos.Z)))
                return
            end
        end
    end)
    u181[p1.bobberId].connection = u69
    if p2 ~= Players.LocalPlayer then
        local v2 = u181[p1.bobberId]
        v2.failsafeThread = task.delay(120, function() -- Line: 451 -- upvalues: u181 (upval), p1 (val), destroyBobber (upval)
            local v1 = u181[p1.bobberId]
            if v1 then
                v1.failsafeThread = nil
                destroyBobber(p1.bobberId)
            end
        end)
    end
end
local function getCharacterRoot(p1) -- Line: 467 -- upvalues: Alive (val)
    if not p1 then
        return nil
    end
    local v1 = Alive.getAliveCharacter(p1)
    if not v1 then
        return nil
    end
    return (v1:FindFirstChild("HumanoidRootPart"))
end
local function getRigidPart(p1) -- Line: 484
    if p1:IsA("BasePart") then
        return p1
    end
    if not (p1:IsA("Model")) then
        return nil
    end
    local PrimaryPart = p1.PrimaryPart
    if not PrimaryPart then
        PrimaryPart = p1:FindFirstChildWhichIsA("BasePart", true)
    end
    return PrimaryPart
end
local function attachReelFish(p1, p2) -- Line: 502 -- upvalues: Fish (val), getRigidPart (val)
    local WeldConstraint_2
    if not Fish then
        return
    end
    local v1 = Fish:Clone()
    local v2 = getRigidPart(v1)
    if not v2 then
        v1:Destroy()
        return
    end
    local v3 = CFrame.new(p2.Position - Vector3.new(0, 1.2, 0))
    if not (v1:IsA("Model")) then
        v2.CFrame = v3
    else
        v1:PivotTo(v3)
    end
    for i, j in v1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = false
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
            j.Massless = true
            if j ~= v2 then
                WeldConstraint_2 = Instance.new("WeldConstraint")
                WeldConstraint_2.Part0 = v2
                WeldConstraint_2.Part1 = j
                WeldConstraint_2.Parent = v2
            end
        end
    end
    if v1:IsA("BasePart") then
        v1.Anchored = false
        v1.CanCollide = false
        v1.CanQuery = false
        v1.CanTouch = false
        v1.Massless = true
    end
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = p2
    WeldConstraint.Part1 = v2
    WeldConstraint.Parent = p2
    v1.Parent = p1
end
local function runBobberReel(p1, p2) -- Line: 564 -- upvalues: u181 (val), destroyBobber (val), cancelBobberTweens (val), attachReelFish (val), RunService (val), getCharacterRoot (val)
    local v1 = u181[p1.bobberId]
    if not v1 then
        return
    end
    local model = v1.model
    local Root = model:FindFirstChild("Root")
    if not Root then
        Root = model.PrimaryPart
        if not Root then
            Root = model:FindFirstChildWhichIsA("BasePart")
        end
    end
    if not Root then
        destroyBobber(p1.bobberId)
        return
    end
    if v1.connection then
        v1.connection:Disconnect()
        v1.connection = nil
    end
    cancelBobberTweens(v1)
    Root.Anchored = true
    attachReelFish(model, Root)
    local Position = Root.Position
    local u42 = p1.duration or 0.6
    local u43 = 0
    local u44 = nil
    u44 = RunService.Heartbeat:Connect(function(a1) -- Line: 597 -- upvalues: model (val), u44 (ref), u43 (ref), u42 (val), getCharacterRoot (upval), p2 (val), Position (val), Root (val), destroyBobber (upval), p1 (val)
        local Position_2, v1
        if not model.Parent then
            u44:Disconnect()
            return
        end
        u43 = u43 + a1
        if 0 >= u42 then
            v1 = 1
        else
            v1 = math.clamp(u43 / u42, 0, 1)
        end
        local v2 = getCharacterRoot(p2)
        if not v2 then
            Position_2 = Position
        else
            Position_2 = v2.Position
        end
        local v3 = Vector3.new(Position.X, math.max(Position.Y, Position_2.Y) + 14, Position.Z)
        local v4 = 1 - v1
        Root.CFrame = CFrame.new(v4 * v4 * Position + v4 * 2 * v1 * v3 + v1 * v1 * Position_2)
        if 1 <= v1 then
            u44:Disconnect()
            destroyBobber(p1.bobberId)
        end
    end)
    v1.connection = u44
end
return function(p1, p2) -- Line: 632 -- upvalues: destroyBobber (val), Players (val), runBobberReel (val), u181 (val), runBobberCast (val)
    local v1
    if p2.action == "destroy" then
        destroyBobber(p2.bobberId)
        return
    end
    if p2.action == "reel" then
        local v2 = p2.player or p1
        v1 = v2 == Players.LocalPlayer
        if not v2 or not v1 then
            runBobberReel(p2, v2)
            return
        end
        if not p2.skip then
            return
        end
        runBobberReel(p2, v2)
        return
    end
    if not p2.bobberId or not p2.startPos or not p2.velocity or not p2.gravity then
        return
    end
    local u28 = p2.player or p1
    v1 = u28 == Players.LocalPlayer
    if not u28 or not v1 then
        task.defer(function() -- Line: 659 -- upvalues: u181 (upval), p2 (val), destroyBobber (upval), runBobberCast (upval), u28 (val)
            if u181[p2.bobberId] then
                destroyBobber(p2.bobberId)
            end
            runBobberCast(p2, u28)
        end)
        return
    end
    if not p2.skip then
        return
    end
    task.defer(function() -- Line: 659 -- upvalues: u181 (upval), p2 (val), destroyBobber (upval), runBobberCast (upval), u28 (val)
        if u181[p2.bobberId] then
            destroyBobber(p2.bobberId)
        end
        runBobberCast(p2, u28)
    end)
end