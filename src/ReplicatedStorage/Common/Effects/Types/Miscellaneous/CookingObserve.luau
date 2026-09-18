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
--       File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.CookingObserve
--                               Dumped in 0.00242 seconds
--                          Bytecode version 9  |  21 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Cooking_2 = require(Animations:WaitForChild("Cooking"))
local Player = Cooking_2.Player
local Station = Cooking_2.Station
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Cooking_3 = Common_3:WaitForChild("Cooking")
local Cooking = require(Cooking_3:WaitForChild("Cooking"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Cooking_4 = Common_4:WaitForChild("Cooking")
local CookingSounds = require(Cooking_4:WaitForChild("CookingSounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Cooking_5 = Common_5:WaitForChild("Cooking")
local CookingStation = require(Cooking_5:WaitForChild("CookingStation"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Cooking_6 = Common_6:WaitForChild("Cooking")
local CookingVisuals = require(Cooking_6:WaitForChild("CookingVisuals"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities = Common_7:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local Idle = Enum.AnimationPriority.Idle
local Action3 = Enum.AnimationPriority.Action3
task.spawn(CookingSounds.preload)
local u170 = {}
local function applyObserverHideToDescendant(p1) -- Line: 52
    if p1:IsA("BasePart") then
        p1.LocalTransparencyModifier = 1
        return
    end
    if p1:IsA("Decal") then
        p1.Transparency = 1
    end
end
local function hideObserverTargetCharacter(p1) -- Line: 60 -- upvalues: applyObserverHideToDescendant (val)
    for i, j in p1:GetDescendants() do
        applyObserverHideToDescendant(j)
    end
end
local function bindObserverTargetCharacterHide(p1) -- Line: 66 -- upvalues: hideObserverTargetCharacter (val), applyObserverHideToDescendant (val)
    hideObserverTargetCharacter(p1)
    return p1.DescendantAdded:Connect(applyObserverHideToDescendant)
end
local function restoreObserverTargetCharacter(p1) -- Line: 71
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
local function unbindObserverTargetCharacterHide(p1) -- Line: 85 -- upvalues: restoreObserverTargetCharacter (val)
    if p1.hideCharacterConnection then
        p1.hideCharacterConnection:Disconnect()
        p1.hideCharacterConnection = nil
    end
    restoreObserverTargetCharacter(p1.hiddenCharacter)
    p1.hiddenCharacter = nil
end
local function getStationAnimationModel(p1) -- Line: 95
    local Animator, v1
    local CookingArea = p1:FindFirstChild("CookingArea", true)
    if not CookingArea or not (CookingArea:IsA("Model")) then
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
    local AnimationController = CookingArea:FindFirstChildWhichIsA("AnimationController")
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
        return CookingArea
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
local function hideCameraParts(p1) -- Line: 117
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
local function playCookingSoundFor(p1, p2) -- Line: 130 -- upvalues: CookingSounds (val)
    CookingSounds.playSoundAtStation(p1, p2)
end
local function playCookingRigAnimation(p1, p2, p3, p4) -- Line: 134 -- upvalues: useAnimatorObserver (val)
    local v1 = useAnimatorObserver.loadAnimationOnRig(p1, p2)
    v1.Looped = p4
    if p3 then
        v1.Priority = p3
    end
    if not (p1:GetAttribute("Ragdolled")) then
        v1:Play(0)
    end
    return v1
end
local function handlePotEffects(p1, p2) -- Line: 153 -- upvalues: Cooking (val), TweenService (val)
    local v1
    local CookingArea = p1:FindFirstChild("CookingArea")
    if not CookingArea then
        return
    end
    local Rigs = CookingArea:FindFirstChild("Rigs")
    if not Rigs then
        return
    end
    local Pot = Rigs:FindFirstChild("Pot")
    if not Pot then
        return
    end
    local SoupColor = Pot:FindFirstChild("SoupColor")
    if not SoupColor then
        return
    end
    local v2 = Color3.fromRGB(234, 184, 146)
    local v3 = p2
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v2 = v2:Lerp(Cooking.Colors[j], 0.5)
    end
    local v6 = TweenInfo.new(0.25)
    TweenService:Create(SoupColor, v6, {Color = v2}):Play()
    SoupColor.Transparency = 0
    local Vegetables = Pot:FindFirstChild("Vegetables")
    if not Vegetables then
        return
    end
    for k, n in Vegetables:GetChildren() do
        v1 = p2[tonumber(n.Name)]
        if v1 and n:IsA("BasePart") then
            n.Color = Cooking.Colors[v1]
            n.Transparency = 0
        end
    end
end
local function ensureObserverIdle(p1) -- Line: 200 -- upvalues: getStationAnimationModel (val), Player (val), playCookingRigAnimation (val), Idle (val), Station (val)
    local v1 = getStationAnimationModel(p1.station)
    local ChooseItemIdle = Player.ChooseItemIdle
    if typeof(ChooseItemIdle) == "string" then
        if not p1.idlePlayerTrack then
            p1.idlePlayerTrack = playCookingRigAnimation(p1.playerRig, ChooseItemIdle, Idle, true)
        elseif p1.idlePlayerTrack.IsPlaying then
        end
    end
    local S_ChooseItemIdle = v1
    if S_ChooseItemIdle then
        S_ChooseItemIdle = Station.S_ChooseItemIdle
    end
    if v1 and typeof(S_ChooseItemIdle) == "string" then
        if not p1.idleStationTrack then
            p1.idleStationTrack = playCookingRigAnimation(v1, S_ChooseItemIdle, Idle, true)
        elseif not p1.idleStationTrack.IsPlaying then
            p1.idleStationTrack = playCookingRigAnimation(v1, S_ChooseItemIdle, Idle, true)
        end
    end
end
local function destroyObserverRigsUnderStation(p1) -- Line: 217 -- upvalues: useAnimatorObserver (val)
    local CookingAnimation = p1:FindFirstChild("CookingAnimation")
    if not CookingAnimation then
        return
    end
    for i, j in CookingAnimation:GetChildren() do
        if j.Name == "CookingObserverRig" and j:IsA("Model") then
            useAnimatorObserver.onStopRigAnimations(j, 0)
            j:Destroy()
        end
    end
end
local function stopSession(p1) -- Line: 231 -- upvalues: u170 (val), unbindObserverTargetCharacterHide (val), useAnimatorObserver (val), getStationAnimationModel (val), CookingVisuals (val), Station (val), destroyObserverRigsUnderStation (val)
    local v1 = u170[p1]
    if not v1 then
        return
    end
    u170[p1] = nil
    unbindObserverTargetCharacterHide(v1)
    if v1.idlePlayerTrack then
        v1.idlePlayerTrack:Stop(0)
        v1.idlePlayerTrack = nil
    end
    if v1.idleStationTrack then
        v1.idleStationTrack:Stop(0)
        v1.idleStationTrack = nil
    end
    local playerRig = v1.playerRig
    if playerRig and playerRig.Parent then
        useAnimatorObserver.onStopRigAnimations(playerRig, 0)
        playerRig:Destroy()
    end
    local v2 = getStationAnimationModel(v1.station)
    if v2 then
        useAnimatorObserver.onStopRigAnimations(v2, 0)
    end
    CookingVisuals.resetCookingStationVisuals(v1.station, Station.S_ChooseItemIdle)
    destroyObserverRigsUnderStation(v1.station)
end
local function spawnObserverRig(p1, p2) -- Line: 265 -- upvalues: CookingStation (val), Objects (val), hideCameraParts (val), Customization (val)
    local CookingAnimation = p2:FindFirstChild("CookingAnimation")
    if not CookingAnimation then
        return nil
    end
    local v1 = CookingStation.getSpawnWorldCFrame(p2, "CookingAnimation")
    if not v1 then
        return nil
    end
    local Requiem_PlayerCamera = Objects:FindFirstChild("Requiem_PlayerCamera")
    if not Requiem_PlayerCamera then
        return nil
    end
    local v2 = Requiem_PlayerCamera:Clone()
    v2.Name = "CookingObserverRig"
    v2.HumanoidRootPart.CFrame = v1
    v2.HumanoidRootPart.Anchored = true
    v2.Parent = CookingAnimation
    hideCameraParts(v2)
    Customization.decorateRigFromPlayer(v2, p1)
    return v2
end
local function playIntro(p1) -- Line: 293 -- upvalues: getStationAnimationModel (val), useAnimatorObserver (val), playCookingSoundFor (val), Player (val), playCookingRigAnimation (val), Station (val), ensureObserverIdle (val)
    local v1, v2, v3, v4
    local v5 = getStationAnimationModel(p1.station)
    useAnimatorObserver.onStopRigAnimations(p1.playerRig, 0)
    if v5 then
        useAnimatorObserver.onStopRigAnimations(v5, 0)
    end
    playCookingSoundFor(p1.station, "WalkToCut")
    local WalkToCut = Player.WalkToCut
    if typeof(WalkToCut) ~= "string" then
        v1 = nil
    else
        v1 = playCookingRigAnimation(p1.playerRig, WalkToCut, nil, false)
    end
    local S_WalkToCut = v5
    if S_WalkToCut then
        S_WalkToCut = Station.S_WalkToCut
    end
    if not v5 then
        v2 = nil
    elseif typeof(S_WalkToCut) == "string" then
        v2 = playCookingRigAnimation(v5, S_WalkToCut, nil, false)
    end
    if not v1 then
        v3 = 0
    else
        v3 = 1
    end
    if not v2 then
        v4 = 0
    else
        v4 = 1
    end
    local u61 = v3 + v4
    if u61 == 0 then
        ensureObserverIdle(p1)
        return
    end
    local function onTrackFinished() -- Line: 318 -- upvalues: u61 (ref), ensureObserverIdle (upval), p1 (val)
        u61 = u61 - 1
        if 0 < u61 then
            return
        end
        ensureObserverIdle(p1)
    end
    if v1 then
        v1.Stopped:Once(onTrackFinished)
    end
    if v2 then
        v2.Stopped:Once(onTrackFinished)
    end
end
local function playChooseAnimation(p1, p2, p3) -- Line: 334 -- upvalues: getStationAnimationModel (val), ensureObserverIdle (val), playCookingSoundFor (val), Player (val), playCookingRigAnimation (val), Action3 (val), Station (val), u170 (val), handlePotEffects (val), stopSession (val)
    local v1 = getStationAnimationModel(p1.station)
    p1.chooseAnimGeneration = p1.chooseAnimGeneration + 1
    local chooseAnimGeneration = p1.chooseAnimGeneration
    ensureObserverIdle(p1)
    if p3 then
        p1.itemsForSoup = table.clone(p3)
    end
    playCookingSoundFor(p1.station, p2)
    local v2 = Player[p2]
    local v3 = if typeof(v2) == "string" then playCookingRigAnimation(p1.playerRig, v2, Action3, false) else nil
    local v4 = v1
    if v4 then
        v4 = Station["S_" .. p2]
    end
    local v5 = nil
    if v1 and typeof(v4) == "string" then
        v5 = playCookingRigAnimation(v1, v4, Action3, false)
        task.delay(7.383, function() -- Line: 357 -- upvalues: u170 (upval), p1 (val), chooseAnimGeneration (val), handlePotEffects (upval)
            local v1 = u170[p1.userId]
            if v1 ~= p1 or chooseAnimGeneration ~= p1.chooseAnimGeneration then
                return
            end
            handlePotEffects(p1.station, p1.itemsForSoup)
        end)
    end
    if p2 ~= "ChoosePotRig" then
        return
    end
    local v6 = {}
    if v3 then
        table.insert(v6, v3)
    end
    if v5 then
        table.insert(v6, v5)
    end
    if #v6 == 0 then
        stopSession(p1.userId)
        return
    end
    local u90 = #v6
    local v7 = v6
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        j.Stopped:Once(function() -- Line: 381 -- upvalues: u90 (ref), stopSession (upval), p1 (val)
            u90 = u90 - 1
            if 0 < u90 then
                return
            end
            stopSession(p1.userId)
        end)
    end
end
return function(p1, p2, p3, p4, p5) -- Line: 392 -- upvalues: stopSession (val), spawnObserverRig (val), bindObserverTargetCharacterHide (val), u170 (val), playIntro (val), playChooseAnimation (val)
    local v1
    if not p1 or not p2 or not (p2:IsDescendantOf(workspace)) then
        return
    end
    local UserId = p1.UserId
    if p3 == "Stop" then
        stopSession(UserId)
        return
    end
    if p3 ~= "Start" then
        if p3 == "Play" then
            if not p4 then
                return
            end
            v1 = u170[UserId]
            if not v1 or v1.station ~= p2 then
                return
            end
            playChooseAnimation(v1, p4, p5)
            return
        end
        return
    end
    stopSession(UserId)
    v1 = spawnObserverRig(p1, p2)
    if not v1 then
        return
    end
    local Character = p1.Character
    local v2 = if Character then bindObserverTargetCharacterHide(Character) else nil
    local v3 = {
        chooseAnimGeneration = 0,
        userId = UserId,
        station = p2,
        playerRig = v1,
        itemsForSoup = {},
        hiddenCharacter = Character,
        hideCharacterConnection = v2,
    }
    u170[UserId] = v3
    playIntro(v3)
end