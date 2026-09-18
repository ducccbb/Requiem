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
--        File: ReplicatedStorage.Client.User.Miscellaneous.ClientCookingHandler
--                               Dumped in 0.00556 seconds
--                          Bytecode version 9  |  51 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ContentProvider = game:GetService("ContentProvider")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Cooking_3 = require(Animations:WaitForChild("Cooking"))
local Player = Cooking_3.Player
local Station = Cooking_3.Station
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local Equipment = v1.Parent.Parent:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Alive = require(Common_3:WaitForChild("Alive"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network = Common_5:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Network_2 = Common_6:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Cooking = require(Namespaces_2:WaitForChild("Cooking"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Signals = require(Common_7:WaitForChild("Signals"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Promise = require(Common_8:WaitForChild("Promise"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Cooking_4 = Common_9:WaitForChild("Cooking")
local Cooking_2 = require(Cooking_4:WaitForChild("Cooking"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Cooking_5 = Common_10:WaitForChild("Cooking")
local CookingSounds = require(Cooking_5:WaitForChild("CookingSounds"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_12:WaitForChild("Common")
local Cooking_6 = Common_11:WaitForChild("Cooking")
local CookingVisuals = require(Cooking_6:WaitForChild("CookingVisuals"))
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local u290 = nil
local u291 = nil
local u292 = {}
local u293 = nil
local u294 = nil
local u295 = nil
local u296 = nil
local u297 = nil
local u298 = nil
local u299 = nil
local u300 = 0
local u301 = nil
local u302 = nil
local u303 = 0
local u304 = false
local u305 = false
local u306 = 0
local u307 = nil
useAnimatorObserver.preload({
    Player = {WalkToCut = Player.WalkToCut},
})
task.spawn(CookingSounds.preload)
local Idle = Enum.AnimationPriority.Idle
local Action3 = Enum.AnimationPriority.Action3
local u318 = {
    "Meat",
    "Carrot",
    "Onion",
    "Potato",
    "Tomato",
}
local u324 = {}
local u325 = {}
local u326 = nil
local u327 = nil
local function countIngredientInPot(p1) -- Line: 105 -- upvalues: u324 (ref)
    local v1 = 0
    local v2 = u324
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j == p1 then
            v1 = v1 + 1
        end
    end
    return v1
end
local function handleStationEffects(p1) -- Line: 115 -- upvalues: ClientInventoryHandler (val), u318 (val), countIngredientInPot (val), u325 (val)
    local v1, v2, v3, v4, v5
    local CookingArea = p1:FindFirstChild("CookingArea")
    if not CookingArea then
        return
    end
    local Rigs = CookingArea:FindFirstChild("Rigs")
    if not Rigs then
        return
    end
    local v6 = ClientInventoryHandler.getItemCountByNamesFromSnapshot(ClientInventoryHandler.getPlayerInventory(), u318)
    local v7 = u318
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        v1 = countIngredientInPot(j)
        v3 = v6[j] - v1
        v2 = 0 < v3
        v4 = v6[j] - (u325[j] or 0)
        v3 = 0 < v4
        v4 = Rigs:FindFirstChild(j)
        if v4 then
            v4:SetAttribute("Selectable", v2)
            for k, n in v4:GetChildren() do
                if not (n:HasTag("DoNotHide")) and n:IsA("BasePart") then
                    if not v3 then
                        v5 = 1
                    else
                        v5 = 0
                    end
                    n.Transparency = v5
                end
            end
        end
    end
end
local function handlePotEffects(p1, p2) -- Line: 155 -- upvalues: Cooking_2 (val), TweenService (val), u325 (val), handleStationEffects (val)
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
        v2 = v2:Lerp(Cooking_2.Colors[j], 0.5)
    end
    local v6 = TweenInfo.new(0.25)
    TweenService:Create(SoupColor, v6, {Color = v2}):Play()
    SoupColor.Transparency = 0
    for k, n in Pot:FindFirstChild("Vegetables"):GetChildren() do
        v1 = p2[tonumber(n.Name)]
        if v1 and n:IsA("BasePart") then
            n.Color = Cooking_2.Colors[v1]
            n.Transparency = 0
        end
    end
    table.clear(u325)
    v4 = p2
    v5 = nil
    v6 = nil
    for m, i5 in v4, v5, v6 do
        u325[i5] = (u325[i5] or 0) + 1
    end
    handleStationEffects(p1)
end
local function cancelCookingHighlightTween() -- Line: 213 -- upvalues: u299 (ref)
    local v1 = u299
    if v1 then
        v1:Cancel()
        u299 = nil
    end
end
local function destroyCookingHighlightsUnder(p1) -- Line: 221
    for i, j in p1:GetChildren() do
        if j:IsA("Highlight") then
            j:Destroy()
        end
    end
end
local function clearCookingHoverHighlight() -- Line: 229 -- upvalues: cancelCookingHighlightTween (val), u298 (ref), destroyCookingHighlightsUnder (val)
    cancelCookingHighlightTween()
    local v1 = u298
    u298 = nil
    if not v1 then
        return
    end
    destroyCookingHighlightsUnder(v1)
end
local function isCookingAnimInteractionBlocked() -- Line: 240 -- upvalues: u303 (ref)
    local v1 = 0 < u303
    return v1
end
local function isCookingSelectionInputAllowed() -- Line: 244 -- upvalues: u304 (ref), isCookingAnimInteractionBlocked (val)
    local v1 = u304
    if v1 then
        v1 = not isCookingAnimInteractionBlocked()
    end
    return v1
end
local function registerCookingAnimBlockUntilTracksStopped(p1) -- Line: 249 -- upvalues: u303 (ref)
    local v1 = #p1
    if v1 == 0 then
        return
    end
    u303 = u303 + 1
    local u4 = v1
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        j.Stopped:Once(function() -- Line: 258 -- upvalues: u4 (ref), u303 (upval)
            u4 = u4 - 1
            if u4 <= 0 then
                u303 = u303 - 1
                if u303 < 0 then
                    u303 = 0
                end
            end
        end)
    end
end
local function higlightSelectedObject(p1) -- Line: 270 -- upvalues: isCookingSelectionInputAllowed (val), clearCookingHoverHighlight (val), u298 (ref), destroyCookingHighlightsUnder (val), TweenService (val), u299 (ref)
    if not (isCookingSelectionInputAllowed()) or not p1 then
        clearCookingHoverHighlight()
        return
    end
    local Parent = p1.Parent
    if not Parent or not (Parent:IsA("Model")) or not (Parent:GetAttribute("Selectable")) then
        clearCookingHoverHighlight()
        return
    end
    if Parent == u298 then
        return
    end
    clearCookingHoverHighlight()
    u298 = Parent
    destroyCookingHighlightsUnder(Parent)
    local Highlight = Instance.new("Highlight")
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    Highlight.FillColor = Color3.fromRGB(255, 255, 255)
    Highlight.Adornee = Parent
    Highlight.OutlineTransparency = 1
    Highlight.FillTransparency = 1
    Highlight.Parent = Parent
    local v1 = TweenInfo.new(0.2)
    local u45 = TweenService:Create(Highlight, v1, {OutlineTransparency = 0, FillTransparency = 0.8})
    u299 = u45
    u45.Completed:Once(function(p1) -- Line: 310 -- upvalues: u299 (upval), u45 (val)
        if u299 == u45 then
            u299 = nil
        end
    end)
    u45:Play()
    return Highlight
end
local function restoreCookingCutsceneCharacterVisibility() -- Line: 320 -- upvalues: u297 (ref)
    local v1 = u297
    u297 = nil
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
local function hideCookingCutsceneCharacter(p1) -- Line: 343 -- upvalues: u297 (ref)
    u297 = p1
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 1
        end
        if j:IsA("Decal") then
            j.Transparency = 1
        end
    end
end
local function getSpawnWorldCFrame(p1) -- Line: 356
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
local function cleanupCookingCamera() -- Line: 375 -- upvalues: u326 (ref), u300 (ref), u301 (ref), u302 (ref), u303 (ref), u304 (ref), u305 (ref), u306 (ref), clearCookingHoverHighlight (val), u291 (ref), u290 (ref), useAnimatorObserver (val), u296 (ref), u295 (ref), restoreCookingCutsceneCharacterVisibility (val), ClientStateHandler (val), u292 (val), u293 (ref), u294 (ref), u327 (ref), CookingVisuals (val), Station (val), Cooking (val), u324 (ref), u325 (val), u307 (ref)
    local v1 = u326 ~= nil
    u300 = u300 + 1
    u301 = nil
    u302 = nil
    u303 = 0
    u304 = false
    u305 = false
    u306 = u306 + 1
    clearCookingHoverHighlight()
    if u291 then
        u291:Disconnect()
        u291 = nil
    end
    if u290 then
        useAnimatorObserver.onStopRigAnimations(u290, 0)
        u290:Destroy()
        u290 = nil
    end
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        if u296 then
            CurrentCamera.CameraType = u296
            u296 = nil
        end
        if u295 then
            CurrentCamera.CFrame = u295
            u295 = nil
        end
    end
    restoreCookingCutsceneCharacterVisibility()
    ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
    local v2 = u292
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        j:Disconnect()
    end
    table.clear(u292)
    u293 = nil
    u294 = nil
    if u327 then
        u327()
        u327 = nil
    end
    if v1 and u326 then
        CookingVisuals.resetCookingStationVisuals(u326, Station.S_ChooseItemIdle)
    end
    if v1 then
        Cooking.CookingObserve.post("Stop")
    end
    u326 = nil
    table.clear(u324)
    table.clear(u325)
    u307 = nil
end
local function awaitIntroAnimationAssetsLoaded() -- Line: 442 -- upvalues: Player (val), ContentProvider (val)
    local WalkToCut = Player.WalkToCut
    if typeof(WalkToCut) ~= "string" then
        return
    end
    local Animation = Instance.new("Animation")
    Animation.AnimationId = WalkToCut
    ContentProvider:PreloadAsync({Animation})
    Animation:Destroy()
end
local function prepareCookingTrack(p1, p2, p3) -- Line: 454 -- upvalues: useAnimatorObserver (val)
    if p1:GetAttribute("Ragdolled") then
        return nil
    end
    local v1 = useAnimatorObserver.loadAnimationOnRig(p1, p2)
    v1.Looped = p3
    v1.TimePosition = 0
    return v1
end
local function awaitTracksReady(p1) -- Line: 466
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
local function playTracksTogether(p1) -- Line: 476
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
local function preloadIntroAnimation(p1) -- Line: 486 -- upvalues: u307 (ref), Player (val), prepareCookingTrack (val), awaitTracksReady (val)
    local v1, v2
    u307 = nil
    local WalkToCut = Player.WalkToCut
    if typeof(WalkToCut) ~= "string" then
        return
    end
    v1, v2 = pcall(function() -- Line: 494 -- upvalues: prepareCookingTrack (upval), p1 (val), WalkToCut (val)
        return prepareCookingTrack(p1, WalkToCut, false)
    end)
    if not v1 or not v2 then
        return
    end
    u307 = v2
    awaitTracksReady({v2})
end
local function connectCookingCameraRig(p1, p2) -- Line: 505 -- upvalues: getSpawnWorldCFrame (val), Objects (val), Customization (val), Alive (val), u295 (ref), u296 (ref), u291 (ref), RunService (val), isCookingSelectionInputAllowed (val), u294 (ref), higlightSelectedObject (val), u293 (ref), UserInputService (val), GuiService (val), u290 (ref)
    local CookingAnimation = p1:FindFirstChild("CookingAnimation")
    if not CookingAnimation then
        return nil
    end
    local v1 = getSpawnWorldCFrame(CookingAnimation)
    if not v1 then
        return nil
    end
    local Requiem_PlayerCamera = Objects:FindFirstChild("Requiem_PlayerCamera")
    if not Requiem_PlayerCamera then
        return nil
    end
    local u19 = Requiem_PlayerCamera:Clone()
    u19.Name = "CookingCameraRig"
    u19.HumanoidRootPart.CFrame = v1
    u19.HumanoidRootPart.Anchored = true
    u19.Parent = CookingAnimation
    Customization.decorateRigFromPlayer(u19, Alive.LocalPlayer)
    local CurrentCamera = workspace.CurrentCamera
    u295 = CurrentCamera.CFrame
    u296 = CurrentCamera.CameraType
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    u291 = RunService.RenderStepped:Connect(function() -- Line: 535 -- upvalues: u19 (val), isCookingSelectionInputAllowed (upval), u294 (upval), higlightSelectedObject (upval), u293 (upval), UserInputService (upval), GuiService (upval)
        local CurrentCamera = workspace.CurrentCamera
        CurrentCamera.CFrame = u19.Camera.Camera.CFrame
        if not (isCookingSelectionInputAllowed()) then
            u294 = nil
            higlightSelectedObject(nil)
            return
        end
        local v1 = u293
        if not v1 then
            u294 = nil
            higlightSelectedObject(nil)
            return
        end
        local MouseLocation = UserInputService:GetMouseLocation()
        local GuiInset = GuiService:GetGuiInset()
        local v2 = CurrentCamera:ScreenPointToRay(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
        u294 = workspace:Raycast(v2.Origin, v2.Direction * 1000, v1)
        if not u294 then
            higlightSelectedObject(nil)
            return
        end
        if u294.Instance then
            higlightSelectedObject(u294.Instance)
            return
        end
        higlightSelectedObject(nil)
    end)
    u290 = u19
    return u19
end
local function getAnimatorFromModel(p1) -- Line: 569
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
local function stopRigExceptIdleTracks(p1, p2) -- Line: 591 -- upvalues: getAnimatorFromModel (val)
    if not p1 then
        return
    end
    local v1 = getAnimatorFromModel(p1)
    if not v1 then
        return
    end
    local v2 = p2
    for i, j in v1:GetPlayingAnimationTracks() do
        if not v2 then
            j:Stop(0)
        elseif j ~= v2 then
        end
    end
end
local function getStationAnimationModel(p1) -- Line: 608
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
local function playCookingRigAnimation(p1, p2, p3, p4, p5) -- Line: 629 -- upvalues: useAnimatorObserver (val)
    local v1 = useAnimatorObserver.loadAnimationOnRig(p1, p2)
    v1.Looped = p5
    if p4 then
        v1.Priority = p4
    end
    if not (p1:GetAttribute("Ragdolled")) then
        v1:Play(p3)
    end
    return v1
end
local function addItemToSoup(p1) -- Line: 649 -- upvalues: u324 (ref), Signals (val), u326 (ref), handleStationEffects (val)
    if p1 == "Pot" then
        return false
    end
    local v1 = #u324
    if 3 <= v1 then
        Signals.Monologue:Fire({"The soup is full. I should probably go cook it...", "Seems like I should go cook the soup... there's too many ingredients in it.", "This soup is overflowing! I should probably cook it."})
        return false
    end
    table.insert(u324, p1)
    if u326 then
        handleStationEffects(u326)
    end
    return true
end
local function playCookingSoundFor(p1, p2) -- Line: 673 -- upvalues: CookingSounds (val)
    CookingSounds.playSoundAtStation(p1, p2)
end
local function ensurePersistentItemIdle(p1, p2) -- Line: 677 -- upvalues: Player (val), u301 (ref), playCookingRigAnimation (val), Idle (val), getStationAnimationModel (val), Station (val), u302 (ref), u304 (ref)
    local ChooseItemIdle = Player.ChooseItemIdle
    if typeof(ChooseItemIdle) == "string" then
        if u301 and not u301.Parent then
            u301 = nil
        end
        if not u301 then
            u301 = playCookingRigAnimation(p2, ChooseItemIdle, 0, Idle, true)
        elseif not u301.IsPlaying then
            u301:Play(0)
        end
    end
    local v1 = getStationAnimationModel(p1)
    local S_ChooseItemIdle = v1
    if S_ChooseItemIdle then
        S_ChooseItemIdle = Station.S_ChooseItemIdle
    end
    if v1 and typeof(S_ChooseItemIdle) == "string" then
        if u302 and not u302.Parent then
            u302 = nil
        end
        if not u302 then
            u302 = playCookingRigAnimation(v1, S_ChooseItemIdle, 0, Idle, true)
        elseif not u302.IsPlaying then
            u302:Play(0)
        end
    end
    if typeof(ChooseItemIdle) ~= "string" then
        if typeof(ChooseItemIdle) ~= "string" then
            u304 = true
        end
        return
    end
    if u301 then
        u304 = true
        return
    end
    if typeof(ChooseItemIdle) ~= "string" then
        u304 = true
    end
end
local function playPairedCookingAnimation(p1, p2, p3, p4) -- Line: 722 -- upvalues: getStationAnimationModel (val), useAnimatorObserver (val), u306 (ref), ensurePersistentItemIdle (val), stopRigExceptIdleTracks (val), u301 (ref), u302 (ref), playCookingSoundFor (val), u307 (ref), playTracksTogether (val), registerCookingAnimBlockUntilTracksStopped (val), Action3 (val), Player (val), playCookingRigAnimation (val), Station (val), handlePotEffects (val), u324 (ref)
    local v1 = nil
    local v2 = nil
    local v3 = getStationAnimationModel(p1)
    if p4 ~= "intro" then
        u306 = u306 + 1
        ensurePersistentItemIdle(p1, p2)
        v3 = getStationAnimationModel(p1)
        stopRigExceptIdleTracks(p2, u301)
        stopRigExceptIdleTracks(v3, u302)
        playCookingSoundFor(p1, p3)
        if p4 ~= "intro" then
            local v4
            if p4 ~= "choose" then
                v4 = nil
            else
                v4 = Action3
            end
            if Player[p3] then
                v1 = playCookingRigAnimation(p2, Player[p3], 0, v4, false)
            end
            if v3 and Station["S_" .. p3] then
                local u98 = u306
                v2 = playCookingRigAnimation(v3, Station["S_" .. p3], 0, v4, false)
                task.delay(7.383, function() -- Line: 775 -- upvalues: u98 (val), u306 (upval), handlePotEffects (upval), p1 (val), u324 (upval)
                    if u98 ~= u306 then
                        return
                    end
                    handlePotEffects(p1, u324)
                end)
            end
            local v5 = {}
            if v1 then
                table.insert(v5, v1)
            end
            if v2 then
                table.insert(v5, v2)
            end
            registerCookingAnimBlockUntilTracksStopped(v5)
            return v1, v2, nil
        elseif p3 == "WalkToCut" and u307 then
            playTracksTogether({u307})
            registerCookingAnimBlockUntilTracksStopped({u307})
            return u307, nil, nil
        end
    else
        local CookingAnimation = p1:FindFirstChild("CookingAnimation")
        if not CookingAnimation then
            return nil, nil, nil
        else
            if not (CookingAnimation:FindFirstChild("Spawn")) then
                return nil, nil, nil
            end
            useAnimatorObserver.onStopRigAnimations(p2, 0)
            if v3 then
                useAnimatorObserver.onStopRigAnimations(v3, 0)
            end
        end
    end
end
local function attemptToCookSoup(p1, p2, p3, p4) -- Line: 795 -- upvalues: u324 (ref), playPairedCookingAnimation (val), Cooking (val), u301 (ref), u302 (ref), u304 (ref), u305 (ref), u306 (ref), useAnimatorObserver (val), CookingVisuals (val), Station (val), u325 (val), handleStationEffects (val), cleanupCookingCamera (val)
    local v1
    local v2 = #u324
    if v2 < 3 or p4 ~= "Pot" then
        return false
    end
    v2, v1 = playPairedCookingAnimation(p1, p2, p3, "choose")
    if v2 then
        Cooking.CookingObserve.post("Play", p3, table.clone(u324))
    elseif not v1 then
    end
    if not v2 or not v1 then
        return false
    end
    if u301 then
        u301:Stop(0)
        u301 = nil
    end
    if u302 then
        u302:Stop(0)
        u302 = nil
    end
    u304 = false
    u305 = true
    local function finishPotCookSequence() -- Line: 831 -- upvalues: u305 (upval), u306 (upval), useAnimatorObserver (upval), p2 (val), CookingVisuals (upval), p1 (val), Station (upval), Cooking (upval), u324 (upval), u325 (upval), handleStationEffects (upval), cleanupCookingCamera (upval)
        if not u305 then
            return
        end
        u305 = false
        u306 = u306 + 1
        useAnimatorObserver.onStopRigAnimations(p2, 0)
        CookingVisuals.resetCookingStationVisuals(p1, Station.S_ChooseItemIdle)
        Cooking.CookSoup.post(u324)
        u324 = {}
        table.clear(u325)
        handleStationEffects(p1)
        cleanupCookingCamera()
    end
    local v3 = {v2, v1}
    local u63 = #v3
    local v4 = v3
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        j.Stopped:Once(function() -- Line: 854 -- upvalues: u63 (ref), finishPotCookSequence (val)
            u63 = u63 - 1
            if 0 < u63 then
                return
            end
            finishPotCookSequence()
        end)
    end
    return true
end
local function listenToMouseInputs(p1, p2) -- Line: 866 -- upvalues: CollectionService (val), u293 (ref), u292 (val), UserInputService (val), isCookingSelectionInputAllowed (val), u294 (ref), Player (val), Station (val), attemptToCookSoup (val), addItemToSoup (val), u300 (ref), playPairedCookingAnimation (val), Cooking (val), u324 (ref)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Include
    v1.FilterDescendantsInstances = CollectionService:GetTagged("Food")
    u293 = v1
    u292[1] = UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 873 -- upvalues: isCookingSelectionInputAllowed (upval), u294 (upval), Player (upval), Station (upval), attemptToCookSoup (upval), p1 (val), p2 (val), addItemToSoup (upval), u300 (upval), playPairedCookingAnimation (upval), Cooking (upval), u324 (upval)
        if a2 or not (isCookingSelectionInputAllowed()) then
            return
        end
        local v1 = u294
        if not v1 then
            return
        end
        local Instance = v1.Instance
        if not Instance then
            return
        end
        local Parent = Instance.Parent
        if not Parent or not (Parent:IsA("Model")) or not (Parent:GetAttribute("Selectable")) or a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        local v2 = "Choose" .. Parent.Name .. "Rig"
        local v3 = Player[v2] ~= nil
        local v4 = Station["S_" .. v2] ~= nil
        if v3 then
            if attemptToCookSoup(p1, p2, v2, Parent.Name) or not (addItemToSoup(Parent.Name)) then
                return
            end
            u300 = u300 + 1
            playPairedCookingAnimation(p1, p2, v2, "choose")
            Cooking.CookingObserve.post("Play", v2, table.clone(u324))
            return
        end
        if not v4 or attemptToCookSoup(p1, p2, v2, Parent.Name) or not (addItemToSoup(Parent.Name)) then
            return
        end
        u300 = u300 + 1
        playPairedCookingAnimation(p1, p2, v2, "choose")
        Cooking.CookingObserve.post("Play", v2, table.clone(u324))
    end)
end
local function loadCookingAnimations(p1, p2) -- Line: 922 -- upvalues: Player (val), useAnimatorObserver (val), getStationAnimationModel (val), Station (val)
    for k, v in pairs(Player) do
        if typeof(v) == "string" then
            pcall(function() -- Line: 925 -- upvalues: useAnimatorObserver (upval), p2 (val), v (val)
                useAnimatorObserver.loadAnimationOnRig(p2, v)
            end)
        end
    end
    local u17 = getStationAnimationModel(p1)
    if u17 then
        for k2, i in pairs(Station) do
            if typeof(i) == "string" then
                pcall(function() -- Line: 935 -- upvalues: useAnimatorObserver (upval), u17 (val), i (val)
                    useAnimatorObserver.loadAnimationOnRig(u17, i)
                end)
            end
        end
    end
    return true
end
local function onAttemptToStartSequence(p1, p2, p3) -- Line: 945 -- upvalues: playPairedCookingAnimation (val), handleStationEffects (val), u300 (ref), ensurePersistentItemIdle (val), u303 (ref)
    local v1, v2
    v1, v2 = playPairedCookingAnimation(p1, p2, "WalkToCut", "intro")
    handleStationEffects(p1)
    local function finishIntroToIdle() -- Line: 950 -- upvalues: p3 (val), u300 (upval), ensurePersistentItemIdle (upval), p1 (val), p2 (val), u303 (upval)
        if p3 ~= u300 then
            return
        end
        ensurePersistentItemIdle(p1, p2)
        u303 = 0
    end
    local v3 = {}
    if v1 then
        table.insert(v3, v1)
    end
    if v2 then
        table.insert(v3, v2)
    end
    if #v3 == 0 then
        finishIntroToIdle()
        return
    end
    local u31 = #v3
    local v4 = v3
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        j.Stopped:Once(function() -- Line: 975 -- upvalues: u31 (ref), p3 (val), u300 (upval), finishIntroToIdle (val)
            u31 = u31 - 1
            if 0 < u31 or p3 ~= u300 then
                return
            end
            finishIntroToIdle()
        end)
    end
end
local function attachPlayerToStation(p1) -- Line: 988 -- upvalues: Alive (val), getSpawnWorldCFrame (val)
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
    local CookingAnimation = p1:FindFirstChild("CookingAnimation")
    if not CookingAnimation then
        return
    end
    local v1 = getSpawnWorldCFrame(CookingAnimation)
    if not v1 then
        return
    end
    HumanoidRootPart.Anchored = true
    Character:PivotTo(v1)
end
Cooking.Cooking.listen(function(p1) -- Line: 1019 -- upvalues: Signals (val), cleanupCookingCamera (val), ClientStateHandler (val), Alive (val), Promise (val), attachPlayerToStation (val), connectCookingCameraRig (val), listenToMouseInputs (val), hideCookingCutsceneCharacter (val), awaitIntroAnimationAssetsLoaded (val), CookingSounds (val), preloadIntroAnimation (val), loadCookingAnimations (val), u326 (ref), u327 (ref), Inventory (val), handleStationEffects (val), u300 (ref), onAttemptToStartSequence (val)
    if not p1 then
        Signals.Monologue:Fire({"Something's wrong with this cooking station...", "Can't seem to use this station properly."})
        return
    end
    cleanupCookingCamera()
    ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, true)
    local LocalPlayer = Alive.LocalPlayer
    local Character = LocalPlayer
    if Character then
        Character = LocalPlayer.Character
    end
    Promise.new(function(p1) -- Line: 1035 -- upvalues: Character (val)
        local v1 = Character ~= nil
        p1(v1)
    end):andThen(function(a1) -- Line: 1037 -- upvalues: Character (val), LocalPlayer (val), ClientStateHandler (upval), attachPlayerToStation (upval), p1 (val), connectCookingCameraRig (upval), cleanupCookingCamera (upval), Signals (upval), listenToMouseInputs (upval), hideCookingCutsceneCharacter (upval), awaitIntroAnimationAssetsLoaded (upval), CookingSounds (upval), preloadIntroAnimation (upval), loadCookingAnimations (upval), u326 (upval), Alive (upval), u327 (upval), Inventory (upval), handleStationEffects (upval), u300 (upval), onAttemptToStartSequence (upval)
        if not a1 or not Character or not LocalPlayer then
            ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
            return
        end
        attachPlayerToStation(p1)
        local u9 = connectCookingCameraRig(p1, Character)
        if not u9 then
            cleanupCookingCamera()
            ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
            Signals.Monologue:Fire({"Something's off — I can't get started here.", "This station doesn't seem set up right."})
            return
        end
        listenToMouseInputs(p1, u9)
        hideCookingCutsceneCharacter(Character)
        awaitIntroAnimationAssetsLoaded()
        CookingSounds.preload()
        preloadIntroAnimation(u9)
        task.spawn(function() -- Line: 1064 -- upvalues: loadCookingAnimations (upval), p1 (upval), u9 (val)
            loadCookingAnimations(p1, u9)
        end)
        u326 = p1
        local LocalPlayer_2 = Alive.LocalPlayer
        if LocalPlayer_2 then
            u327 = Inventory.Store.observe(LocalPlayer_2, function() -- Line: 1071 -- upvalues: u326 (upval), handleStationEffects (upval)
                if u326 then
                    handleStationEffects(u326)
                end
            end)
        end
        onAttemptToStartSequence(p1, u9, u300)
    end)
end)
return {playPairedCookingAnimation = playPairedCookingAnimation}