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
--       File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.BakingObserve
--                               Dumped in 0.00175 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Baking = require(Animations:WaitForChild("Baking"))
local Player = Baking.Player
local Station = Baking.Station
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Baking_2 = Common_3:WaitForChild("Baking")
local BakingSounds = require(Baking_2:WaitForChild("BakingSounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local World = Common_4:WaitForChild("World")
local BakingStation = require(World:WaitForChild("BakingStation"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
task.spawn(BakingSounds.preload)
local u125 = {}
local function hideObserverTargetCharacter(p1) -- Line: 42
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 1
        elseif j:IsA("Decal") then
            j.Transparency = 1
        end
    end
end
local function restoreObserverTargetCharacter(p1) -- Line: 52
    if not p1 or not p1.Parent then
        return
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 0
        elseif j:IsA("Decal") then
            j.Transparency = 0
        end
    end
end
local function getStationAnimationModel(p1) -- Line: 66
    local Animator, v1
    local BakingArea = p1:FindFirstChild("BakingArea", true)
    if not BakingArea or not (BakingArea:IsA("Model")) then
        Animator = p1:FindFirstChildWhichIsA("Animator", true)
        if not Animator then
            return nil
        end
        v1 = Animator:FindFirstAncestorWhichIsA("Model")
        if v1 then
            if v1:IsDescendantOf(p1) then
                return v1
            end
            return nil
        end
        return nil
    end
    local AnimationController = BakingArea:FindFirstChildWhichIsA("AnimationController")
    if not AnimationController then
        Animator = p1:FindFirstChildWhichIsA("Animator", true)
        if not Animator then
            return nil
        end
        v1 = Animator:FindFirstAncestorWhichIsA("Model")
        if v1 then
            if v1:IsDescendantOf(p1) then
                return v1
            end
            return nil
        end
        return nil
    end
    if AnimationController:FindFirstChildWhichIsA("Animator") then
        return BakingArea
    end
    Animator = p1:FindFirstChildWhichIsA("Animator", true)
    if not Animator then
        return nil
    end
    v1 = Animator:FindFirstAncestorWhichIsA("Model")
    if not v1 then
        return nil
    end
    if v1:IsDescendantOf(p1) then
        return v1
    end
    return nil
end
local function hideCameraParts(p1) -- Line: 88
    local Camera = p1:FindFirstChild("Camera")
    if not Camera then
        return
    end
    for i, j in Camera:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = 1
        end
    end
end
local function playBakingRigAnimation(p1, p2) -- Line: 101 -- upvalues: useAnimatorObserver (val)
    local v1 = useAnimatorObserver.loadAnimationOnRig(p1, p2)
    v1.Looped = false
    if not (p1:GetAttribute("Ragdolled")) then
        v1:Play(0)
    end
    return v1
end
local function destroyObserverRigsUnderStation(p1) -- Line: 112 -- upvalues: useAnimatorObserver (val)
    local BakingAnimation = p1:FindFirstChild("BakingAnimation")
    if not BakingAnimation then
        return
    end
    for i, j in BakingAnimation:GetChildren() do
        if j.Name == "BakingObserverRig" and j:IsA("Model") then
            useAnimatorObserver.onStopRigAnimations(j, 0)
            j:Destroy()
        end
    end
end
local function stopSession(p1) -- Line: 126 -- upvalues: u125 (val), restoreObserverTargetCharacter (val), useAnimatorObserver (val), getStationAnimationModel (val), destroyObserverRigsUnderStation (val)
    local v1 = u125[p1]
    if not v1 then
        return
    end
    u125[p1] = nil
    restoreObserverTargetCharacter(v1.hiddenCharacter)
    local playerRig = v1.playerRig
    if playerRig and playerRig.Parent then
        useAnimatorObserver.onStopRigAnimations(playerRig, 0)
        playerRig:Destroy()
    end
    local v2 = getStationAnimationModel(v1.station)
    if v2 then
        useAnimatorObserver.onStopRigAnimations(v2, 0)
    end
    destroyObserverRigsUnderStation(v1.station)
end
local function spawnObserverRig(p1, p2) -- Line: 150 -- upvalues: BakingStation (val), Objects (val), hideCameraParts (val), Customization (val)
    local BakingAnimation = p2:FindFirstChild("BakingAnimation")
    if not BakingAnimation then
        return nil
    end
    local v1 = BakingStation.getSpawnWorldCFrame(p2)
    if not v1 then
        return nil
    end
    local Requiem_PlayerCamera = Objects:FindFirstChild("Requiem_PlayerCamera")
    if not Requiem_PlayerCamera then
        return nil
    end
    local v2 = Requiem_PlayerCamera:Clone()
    v2.Name = "BakingObserverRig"
    v2.HumanoidRootPart.CFrame = v1
    v2.HumanoidRootPart.Anchored = true
    v2.Parent = BakingAnimation
    hideCameraParts(v2)
    Customization.decorateRigFromPlayer(v2, p1)
    return v2
end
local function playBakeAnimation(p1) -- Line: 178 -- upvalues: getStationAnimationModel (val), useAnimatorObserver (val), BakingSounds (val), Player (val), playBakingRigAnimation (val), Station (val), stopSession (val)
    local v1 = getStationAnimationModel(p1.station)
    useAnimatorObserver.onStopRigAnimations(p1.playerRig, 0)
    if v1 then
        useAnimatorObserver.onStopRigAnimations(v1, 0)
    end
    BakingSounds.playSoundAtStation(p1.station, "BakeBread")
    local v2 = {}
    local BakeBread = Player.BakeBread
    if typeof(BakeBread) == "string" then
        table.insert(v2, playBakingRigAnimation(p1.playerRig, BakeBread))
    end
    local S_BakeBread = v1
    if S_BakeBread then
        S_BakeBread = Station.S_BakeBread
    end
    if v1 and typeof(S_BakeBread) == "string" then
        table.insert(v2, playBakingRigAnimation(v1, S_BakeBread))
    end
    if #v2 == 0 then
        stopSession(p1.userId)
        return
    end
    local u60 = #v2
    local v3 = v2
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        j.Stopped:Once(function() -- Line: 207 -- upvalues: u60 (ref), stopSession (upval), p1 (val)
            u60 = u60 - 1
            if 0 < u60 then
                return
            end
            stopSession(p1.userId)
        end)
    end
end
return function(p1, p2, p3) -- Line: 217 -- upvalues: stopSession (val), spawnObserverRig (val), hideObserverTargetCharacter (val), u125 (val), playBakeAnimation (val)
    if not p1 or not p2 or not (p2:IsDescendantOf(workspace)) then
        return
    end
    local UserId = p1.UserId
    if p3 == "Stop" then
        stopSession(UserId)
        return
    end
    if p3 ~= "Start" then
        return
    end
    stopSession(UserId)
    local v1 = spawnObserverRig(p1, p2)
    if not v1 then
        return
    end
    local Character = p1.Character
    if Character then
        hideObserverTargetCharacter(Character)
    end
    local v2 = {userId = UserId, station = p2, playerRig = v1, hiddenCharacter = Character}
    u125[UserId] = v2
    playBakeAnimation(v2)
end