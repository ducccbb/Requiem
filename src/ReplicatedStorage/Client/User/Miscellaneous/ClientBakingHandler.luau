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
--         File: ReplicatedStorage.Client.User.Miscellaneous.ClientBakingHandler
--                               Dumped in 0.00242 seconds
--                          Bytecode version 9  |  23 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Baking_2 = require(Animations:WaitForChild("Baking"))
local Player = Baking_2.Player
local Station = Baking_2.Station
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Alive = require(Common_3:WaitForChild("Alive"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Baking_3 = Common_4:WaitForChild("Baking")
local BakingSounds = require(Baking_3:WaitForChild("BakingSounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Network = Common_6:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Baking = require(Namespaces:WaitForChild("Baking"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Signals = require(Common_7:WaitForChild("Signals"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Promise = require(Common_8:WaitForChild("Promise"))
useAnimatorObserver.preload(Baking_2)
task.spawn(BakingSounds.preload)
local u191 = {}
local u192 = {}
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local u201 = nil
local u202 = nil
local u203 = nil
local u204 = nil
local u205 = nil
local u206 = 0
local u207 = nil
local function getSpawnWorldCFrame(p1) -- Line: 57
    if not p1 then
        return nil
    end
    local Spawn = p1:FindFirstChild("Spawn")
    if not Spawn then
        return nil
    end
    if Spawn:IsA("Model") then
        return Spawn:GetPivot()
    end
    if Spawn:IsA("BasePart") then
        return Spawn.CFrame
    end
    return nil
end
local function restoreBakingCutsceneCharacterVisibility() -- Line: 76 -- upvalues: u205 (ref)
    local v1 = u205
    u205 = nil
    if not v1 or not v1.Parent then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
        HumanoidRootPart.Anchored = false
    end
    for i, j in v1:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 0
        end
        if j:IsA("Decal") then
            j.Transparency = 0
        end
    end
end
local function hideBakingCutsceneCharacter(p1) -- Line: 99 -- upvalues: u205 (ref)
    u205 = p1
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 1
        end
        if j:IsA("Decal") then
            j.Transparency = 1
        end
    end
end
local function cleanupBakingCamera() -- Line: 112 -- upvalues: u207 (ref), u206 (ref), u202 (ref), u201 (ref), useAnimatorObserver (val), u204 (ref), u203 (ref), restoreBakingCutsceneCharacterVisibility (val), ClientStateHandler (val), Baking (val), u191 (val), u192 (val)
    local v1 = u207 ~= nil
    u206 = u206 + 1
    if u202 then
        u202:Disconnect()
        u202 = nil
    end
    if u201 then
        useAnimatorObserver.onStopRigAnimations(u201, 0)
        u201:Destroy()
        u201 = nil
    end
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        if u204 then
            CurrentCamera.CameraType = u204
            u204 = nil
        end
        if u203 then
            CurrentCamera.CFrame = u203
            u203 = nil
        end
    end
    restoreBakingCutsceneCharacterVisibility()
    ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
    if v1 then
        Baking.BakingStop.post()
    end
    u207 = nil
    table.clear(u191)
    table.clear(u192)
end
local function getAnimatorFromModel(p1) -- Line: 153
    local Animator_2, Animator_3, Humanoid
    local AnimationController = p1:FindFirstChildWhichIsA("AnimationController")
    if not AnimationController then
        Animator_2 = p1:FindFirstChildWhichIsA("Animator")
        if Animator_2 then
            return Animator_2
        end
        Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
        if Humanoid then
            Animator_3 = Humanoid:FindFirstChildWhichIsA("Animator")
            if Animator_3 then
                return Animator_3
            end
            return nil
        end
        return nil
    end
    local Animator = AnimationController:FindFirstChildWhichIsA("Animator")
    if Animator then
        return Animator
    end
    Animator_2 = p1:FindFirstChildWhichIsA("Animator")
    if Animator_2 then
        return Animator_2
    end
    Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
    if not Humanoid then
        return nil
    end
    Animator_3 = Humanoid:FindFirstChildWhichIsA("Animator")
    if Animator_3 then
        return Animator_3
    end
    return nil
end
local function getStationAnimationModel(p1) -- Line: 175
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
local function awaitAnimationAssetsLoaded() -- Line: 195 -- upvalues: Player (val), Station (val), ContentProvider (val)
    local Animation, Animation_2
    local v1 = {}
    local v2 = Player
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if typeof(j) == "string" then
            Animation_2 = Instance.new("Animation")
            Animation_2.AnimationId = j
            table.insert(v1, Animation_2)
        end
    end
    v2 = Station
    v3 = nil
    v4 = nil
    for k, n in v2, v3, v4 do
        if typeof(n) == "string" then
            Animation = Instance.new("Animation")
            Animation.AnimationId = n
            table.insert(v1, Animation)
        end
    end
    if #v1 == 0 then
        return
    end
    ContentProvider:PreloadAsync(v1)
    v2 = v1
    v3 = nil
    v4 = nil
    for m, i5 in v2, v3, v4 do
        i5:Destroy()
    end
end
local function prepareBakingTrack(p1, p2) -- Line: 225 -- upvalues: useAnimatorObserver (val)
    if p1:GetAttribute("Ragdolled") then
        return nil
    end
    local v1 = useAnimatorObserver.loadAnimationOnRig(p1, p2)
    v1.Looped = false
    v1.TimePosition = 0
    return v1
end
local function awaitTracksReady(p1) -- Line: 237
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j.Length == 0 then
            while true do
                task.wait()
                if 0 < j.Length then
                    break
                end
            end
        end
    end
end
local function playTracksTogether(p1) -- Line: 247
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        j.TimePosition = 0
    end
    v1 = p1
    v2 = nil
    v3 = nil
    for k, n in v1, v2, v3 do
        n:Play(0)
    end
end
local function connectBakingCameraRig(p1, p2) -- Line: 257 -- upvalues: getSpawnWorldCFrame (val), Objects (val), Alive (val), Customization (val), u203 (ref), u204 (ref), u202 (ref), RunService (val), u201 (ref)
    local BakingAnimation = p1:FindFirstChild("BakingAnimation")
    if not BakingAnimation then
        return nil
    end
    local v1 = getSpawnWorldCFrame(BakingAnimation)
    if not v1 then
        return nil
    end
    local Requiem_PlayerCamera = Objects:FindFirstChild("Requiem_PlayerCamera")
    if not Requiem_PlayerCamera then
        return nil
    end
    local u19 = Requiem_PlayerCamera:Clone()
    u19.Name = "BakingCameraRig"
    u19.HumanoidRootPart.CFrame = v1
    u19.HumanoidRootPart.Anchored = true
    u19.Parent = BakingAnimation
    local LocalPlayer = Alive.LocalPlayer
    if not LocalPlayer then
        u19:Destroy()
        return nil
    end
    Customization.decorateRigFromPlayer(u19, LocalPlayer)
    local CurrentCamera = workspace.CurrentCamera
    u203 = CurrentCamera.CFrame
    u204 = CurrentCamera.CameraType
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    u202 = RunService.RenderStepped:Connect(function() -- Line: 293 -- upvalues: u19 (val)
        workspace.CurrentCamera.CFrame = u19.Camera.Camera.CFrame
    end)
    u201 = u19
    return u19
end
local function loadBakingAnimations(p1, p2) -- Line: 302 -- upvalues: u191 (val), u192 (val), Player (val), prepareBakingTrack (val), getStationAnimationModel (val), Station (val)
    local v1, v2
    table.clear(u191)
    table.clear(u192)
    local v3 = Player
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if typeof(j) == "string" then
            v1, v2 = pcall(function() -- Line: 308 -- upvalues: prepareBakingTrack (upval), p2 (val), j (val)
                return prepareBakingTrack(p2, j)
            end)
            if v1 and v2 then
                u191[i] = v2
            end
        end
    end
    local u21 = getStationAnimationModel(p1)
    if u21 then
        local v6
        v4 = Station
        v5 = nil
        local v7 = nil
        for k, n in v4, v5, v7 do
            if typeof(n) == "string" then
                v2, v6 = pcall(function() -- Line: 321 -- upvalues: prepareBakingTrack (upval), u21 (val), n (val)
                    return prepareBakingTrack(u21, n)
                end)
                if v2 and v6 then
                    u192[k] = v6
                end
            end
        end
    end
end
local function playPairedBakingAnimation(p1, p2) -- Line: 332 -- upvalues: getStationAnimationModel (val), useAnimatorObserver (val), u191 (val), u192 (val), BakingSounds (val), awaitTracksReady (val), playTracksTogether (val)
    local v1 = getStationAnimationModel(p1)
    useAnimatorObserver.onStopRigAnimations(p2, 0)
    if v1 then
        useAnimatorObserver.onStopRigAnimations(v1, 0)
    end
    local BakeBread = u191.BakeBread
    local S_BakeBread = u192.S_BakeBread
    local v2 = {}
    if BakeBread then
        table.insert(v2, BakeBread)
    end
    if S_BakeBread then
        table.insert(v2, S_BakeBread)
    end
    if 0 < #v2 then
        BakingSounds.playSoundAtStation(p1, "BakeBread")
        awaitTracksReady(v2)
        playTracksTogether(v2)
    end
    return BakeBread, S_BakeBread
end
local function attachPlayerToStation(p1) -- Line: 363 -- upvalues: Alive (val), getSpawnWorldCFrame (val)
    local LocalPlayer = Alive.LocalPlayer
    if not LocalPlayer then
        return
    end
    local Character = LocalPlayer.Character
    if not Character then
        return
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local BakingAnimation = p1:FindFirstChild("BakingAnimation")
    if not BakingAnimation then
        return
    end
    local v1 = getSpawnWorldCFrame(BakingAnimation)
    if not v1 then
        return
    end
    HumanoidRootPart.Anchored = true
    Character:PivotTo(v1)
end
local function onBakingAnimationFinished(p1) -- Line: 394 -- upvalues: u206 (ref), Baking (val), cleanupBakingCamera (val)
    if p1 ~= u206 then
        return
    end
    Baking.BakeBread.post()
    cleanupBakingCamera()
end
Baking.Baking.listen(function(p1) -- Line: 403 -- upvalues: Signals (val), cleanupBakingCamera (val), ClientStateHandler (val), u207 (ref), Alive (val), Promise (val), attachPlayerToStation (val), connectBakingCameraRig (val), hideBakingCutsceneCharacter (val), awaitAnimationAssetsLoaded (val), BakingSounds (val), loadBakingAnimations (val), u206 (ref), playPairedBakingAnimation (val), onBakingAnimationFinished (val)
    if not p1 then
        Signals.Monologue:Fire({"Where's the baking station...?", "This doesn't look like the right spot to bake."})
        return
    end
    cleanupBakingCamera()
    ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, true)
    u207 = p1
    local LocalPlayer = Alive.LocalPlayer
    local Character = LocalPlayer
    if Character then
        Character = LocalPlayer.Character
    end
    Promise.new(function(p1) -- Line: 420 -- upvalues: Character (val)
        local v1 = Character ~= nil
        p1(v1)
    end):andThen(function(a1) -- Line: 422 -- upvalues: Character (val), LocalPlayer (val), ClientStateHandler (upval), cleanupBakingCamera (upval), attachPlayerToStation (upval), p1 (val), connectBakingCameraRig (upval), Signals (upval), hideBakingCutsceneCharacter (upval), awaitAnimationAssetsLoaded (upval), BakingSounds (upval), loadBakingAnimations (upval), u206 (upval), playPairedBakingAnimation (upval), onBakingAnimationFinished (upval)
        local v1, v2
        if not a1 or not Character or not LocalPlayer then
            ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
            cleanupBakingCamera()
            return
        end
        attachPlayerToStation(p1)
        local v3 = connectBakingCameraRig(p1, Character)
        if not v3 then
            cleanupBakingCamera()
            ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
            Signals.Monologue:Fire({"Something's off with this oven... I can't get started.", "This station doesn't seem set up right."})
            return
        end
        hideBakingCutsceneCharacter(Character)
        awaitAnimationAssetsLoaded()
        BakingSounds.preload()
        loadBakingAnimations(p1, v3)
        local u39 = u206
        v1, v2 = playPairedBakingAnimation(p1, v3)
        local v4 = {}
        if v1 then
            table.insert(v4, v1)
        end
        if v2 then
            table.insert(v4, v2)
        end
        if #v4 == 0 then
            onBakingAnimationFinished(u39)
            return
        end
        local u63 = #v4
        local v5 = v4
        local v6 = nil
        local v7 = nil
        for i, j in v5, v6, v7 do
            j.Stopped:Once(function() -- Line: 466 -- upvalues: u63 (ref), onBakingAnimationFinished (upval), u39 (val)
                u63 = u63 - 1
                if 0 < u63 then
                    return
                end
                onBakingAnimationFinished(u39)
            end)
        end
    end)
end)
return {}