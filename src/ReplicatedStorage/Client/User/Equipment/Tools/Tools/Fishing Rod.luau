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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Fishing Rod
--                               Dumped in 0.00377 seconds
--                          Bytecode version 9  |  43 functions

local u353
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Effects_2 = Common_3:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local FishingBobberState = require(Utilities_2:WaitForChild("FishingBobberState"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_5:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Network_2 = Common_8:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_9:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local Miscellaneous = script.Parent.Parent.Parent.Parent:WaitForChild("Miscellaneous")
local ClientFishingMinigameHandler = require(Miscellaneous:WaitForChild("ClientFishingMinigameHandler"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics = Common_9:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Sounds_2 = Common_10:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local u263 = require(Tools:WaitForChild("Fishing Rod"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_12:WaitForChild("Common")
local Types = Common_11:WaitForChild("Types")
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_13:WaitForChild("Common")
local Animations = Common_12:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local u306 = require(Tools_2:WaitForChild("Fishing Rod"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_14:WaitForChild("Common")
local Observers = Common_13:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
useAnimatorObserver.preload(u306)
task.spawn(function() -- Line: 46 -- upvalues: u263 (val), ContentProvider (val)
    local Sound
    local v1 = {}
    local v2 = u263
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if typeof(j) == "string" then
            Sound = Instance.new("Sound")
            Sound.SoundId = j
            table.insert(v1, Sound)
        end
    end
    if 0 < #v1 then
        ContentProvider:PreloadAsync(v1)
        v2 = v1
        v3 = nil
        v4 = nil
        for k, n in v2, v3, v4 do
            n:Destroy()
        end
    end
end)
local u332 = {Idle = u306.NonActiveIdle}
local u334 = nil
local u335 = nil
local u336 = nil
local u337 = nil
local u338 = nil
local u339 = false
local u340 = false
local u341 = nil
local u342 = nil
local u343 = nil
local u344 = 0
local u345 = nil
local u346 = nil
local u347 = nil
local u348 = nil
local u349 = nil
local u350 = nil
_, u353 = useWalkSpeed()
local u354 = nil
local u355 = nil
local u356 = {
    "Something's biting...",
    "I've got a bite!",
    "There's a tug on the line.",
    "A fish! Reel it in!",
    "The line's pulling!",
}
local u362 = {"It got away...", "The line went slack.", "Lost it.", "So close..."}
local u367 = {
    "Got it!",
    "That's a keeper.",
    "Fresh catch.",
    "Not bad at all.",
    "Hook, line, and sinker.",
    "Reeled it in.",
    "That'll do for a meal.",
    "Another one for the pile.",
}
local u377 = Constants.Exhaustion / 10
local u378 = {"My arms are too tired to keep fishing...", "I need to rest before I cast again...", "I've fished enough for now..."}
local function isFishingEventActive() -- Line: 165 -- upvalues: Server (val)
    local v1 = Server.Store.client()
    local v2 = if v1 ~= nil then if v1.event ~= 1 then v1.event == 2 else true else false
    return v2
end
local function isTooExhaustedToFish() -- Line: 174 -- upvalues: isFishingEventActive (val), Vitality (val), u377 (val), Constants (val)
    local exhaustion
    if isFishingEventActive() then
        return false
    end
    local v1 = Vitality.Store.client()
    if not v1 then
        exhaustion = 0
    else
        exhaustion = v1.exhaustion
        if not exhaustion then
            exhaustion = 0
        end
    end
    local v2 = exhaustion + u377
    local v3 = Constants.Exhaustion < v2
    return v3
end
local function getEquippedToolModel() -- Line: 184 -- upvalues: u336 (ref)
    if not u336 then
        return nil
    end
    local RightHand = u336:FindFirstChild("RightHand")
    if not RightHand then
        return nil
    end
    local Handle = RightHand:FindFirstChild("Handle")
    if not Handle or not Handle.Part1 then
        return nil
    end
    return Handle.Part1:FindFirstAncestorWhichIsA("Model")
end
local function getCastTrajectory() -- Line: 202 -- upvalues: u336 (ref), getEquippedToolModel (val), Players (val), Workspace (val)
    local WorldPosition, v1
    if not u336 then
        return nil
    end
    local v2 = getEquippedToolModel()
    local Tip = v2
    if Tip then
        Tip = v2:FindFirstChild("Tip", true)
    end
    if not Tip then
        local HumanoidRootPart
        if not Tip then
            HumanoidRootPart = u336:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return nil
            end
            WorldPosition = HumanoidRootPart.CFrame * Vector3.new(0, 1.2, -2)
            if not WorldPosition then
                return nil
            end
            v1 = Vector3.new(0, -Workspace.Gravity * 0.45, 0)
            return {startPos = WorldPosition, velocity = (Players.LocalPlayer:GetMouse().Hit.Position - WorldPosition).Unit * 90, gravity = v1}
        end
        if Tip:IsA("BasePart") then
            WorldPosition = Tip.Position
            if not WorldPosition then
                return nil
            end
            v1 = Vector3.new(0, -Workspace.Gravity * 0.45, 0)
            return {startPos = WorldPosition, velocity = (Players.LocalPlayer:GetMouse().Hit.Position - WorldPosition).Unit * 90, gravity = v1}
        end
        HumanoidRootPart = u336:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return nil
        end
        WorldPosition = HumanoidRootPart.CFrame * Vector3.new(0, 1.2, -2)
        if not WorldPosition then
            return nil
        end
        v1 = Vector3.new(0, -Workspace.Gravity * 0.45, 0)
        return {startPos = WorldPosition, velocity = (Players.LocalPlayer:GetMouse().Hit.Position - WorldPosition).Unit * 90, gravity = v1}
    elseif Tip:IsA("Attachment") then
        WorldPosition = Tip.WorldPosition
        if not WorldPosition then
            return nil
        end
        v1 = Vector3.new(0, -Workspace.Gravity * 0.45, 0)
        return {startPos = WorldPosition, velocity = (Players.LocalPlayer:GetMouse().Hit.Position - WorldPosition).Unit * 90, gravity = v1}
    end
end
local function destroyActiveBobber() -- Line: 241 -- upvalues: u341 (ref), Effects (val)
    if not u341 then
        return
    end
    Effects.emitClientEffect("Bobber", {action = "destroy", bobberId = u341})
    u341 = nil
end
local function spawnBobber(p1) -- Line: 253 -- upvalues: getCastTrajectory (val), u341 (ref), destroyActiveBobber (val), Effects (val)
    local v1 = getCastTrajectory()
    if not v1 then
        return false
    end
    if u341 then
        destroyActiveBobber()
    end
    local v2 = math.random(1, 2147483647)
    u341 = v2
    local v3 = {
        action = "cast",
        skip = true,
        bobberId = v2,
        startPos = v1.startPos,
        velocity = v1.velocity,
        gravity = v1.gravity,
    }
    Effects.emitClientEffect("Bobber", v3)
    v3.skip = false
    p1({action = "cast", data = v3})
    return true
end
local function hasToolAnimator(p1) -- Line: 284
    local v1
    local AnimationController = p1:FindFirstChildWhichIsA("AnimationController", true)
    if not AnimationController then
        v1 = p1:FindFirstChildWhichIsA("Animator", true) ~= nil
        return v1
    end
    if AnimationController:FindFirstChildWhichIsA("Animator") then
        return true
    end
    v1 = p1:FindFirstChildWhichIsA("Animator", true) ~= nil
    return v1
end
local function stopToolRigAnimations(p1) -- Line: 293 -- upvalues: getEquippedToolModel (val), useAnimatorObserver (val)
    local v1 = getEquippedToolModel()
    if not v1 then
        return
    end
    useAnimatorObserver.onStopRigAnimations(v1, p1)
end
local function playOnToolRig(p1, p2, p3) -- Line: 302 -- upvalues: getEquippedToolModel (val), hasToolAnimator (val), useAnimatorObserver (val)
    local v1 = getEquippedToolModel()
    if not v1 or not (hasToolAnimator(v1)) then
        return nil
    end
    local v2 = useAnimatorObserver.playAnimationOnRig(v1, p1, p2)
    if v2 and p3 then
        v2.Looped = true
    end
    return v2
end
local function playPairedAnimation(p1, p2, p3) -- Line: 316 -- upvalues: useAnimatorObserver (val), playOnToolRig (val)
    local v1 = useAnimatorObserver.play(p1, p2)
    playOnToolRig(p1, p2, p3)
    if v1 and p3 then
        v1.Looped = true
    end
    return v1
end
local function stopAllPlayerAnimations(p1) -- Line: 332 -- upvalues: u306 (val), useAnimatorObserver (val)
    local v1 = u306
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if typeof(j) == "string" then
            useAnimatorObserver.stop(j, p1)
        end
    end
end
local v2 = {description = "A fishing rod, used for catching fish.", attributes = {}, category = require(Types:WaitForChild("Item")).CATEGORIES.Tool}
local function applyCastWalkSpeed() -- Line: 351 -- upvalues: u354 (ref), u353 (val)
    if u354 then
        return
    end
    u354 = u353("fishing_cast", 0.5, "multiply", 5, TweenInfo.new(0.2))
end
local function clearCastWalkSpeed() -- Line: 365 -- upvalues: u354 (ref)
    if u354 then
        u354(TweenInfo.new(0.2))
        u354 = nil
    end
end
local function applyMinigameWalkSpeed() -- Line: 372 -- upvalues: u355 (ref), u353 (val)
    if u355 then
        return
    end
    u355 = u353("fishing_minigame", 0, "set", 20)
end
local function clearMinigameWalkSpeed() -- Line: 380 -- upvalues: u355 (ref)
    if u355 then
        u355()
        u355 = nil
    end
end
local function stopBiteLoop() -- Line: 387 -- upvalues: u343 (ref), u344 (ref)
    if u343 then
        u343:Disconnect()
        u343 = nil
    end
    u344 = 0
end
local function stopMinigameReeling() -- Line: 396 -- upvalues: u348 (ref)
    if u348 then
        u348({action = "stop_reeling"})
    end
end
local function onFishBite() -- Line: 402 -- upvalues: ClientFishingMinigameHandler (val), u336 (ref), Sounds (val), u263 (val), stopMinigameReeling (val), u348 (ref), u337 (ref), u338 (ref), playPairedAnimation (val), u306 (val), applyMinigameWalkSpeed (val), Signals (val), u356 (val)
    if not (ClientFishingMinigameHandler.start()) then
        return
    end
    local HumanoidRootPart = u336
    if HumanoidRootPart then
        HumanoidRootPart = u336:FindFirstChild("HumanoidRootPart")
    end
    if HumanoidRootPart then
        Sounds.playRangedSoundEffect(u263.BobberCaught, HumanoidRootPart, 80, 1)
    end
    stopMinigameReeling()
    if u348 then
        u348({action = "start_reeling"})
    end
    if u337 then
        u337:Stop(0.1)
        u337 = nil
    end
    u338 = playPairedAnimation(u306.Reeling, 0.1, true)
    applyMinigameWalkSpeed()
    Signals.Monologue:Fire(u356)
end
local function startBiteLoop() -- Line: 433 -- upvalues: stopBiteLoop (val), u343 (ref), RunService (val), FishingBobberState (val), u341 (ref), u336 (ref), u349 (ref), ClientFishingMinigameHandler (val), u344 (ref), ClientAttributesHandler (val), onFishBite (val)
    stopBiteLoop()
    u343 = RunService.RenderStepped:Connect(function(p1) -- Line: 436 -- upvalues: FishingBobberState (upval), u341 (upval), u336 (upval), u349 (upval), ClientFishingMinigameHandler (upval), u344 (upval), ClientAttributesHandler (upval), onFishBite (upval)
        local v1 = FishingBobberState.getBobberPosition(u341)
        local HumanoidRootPart = u336
        if HumanoidRootPart then
            HumanoidRootPart = u336:FindFirstChild("HumanoidRootPart")
        end
        if not v1 then
            if ClientFishingMinigameHandler.active or not (FishingBobberState.isBobberInWater(u341)) then
                return
            end
            u344 = u344 + p1
            if u344 < 5 then
                return
            end
            u344 = u344 - 5
            local FishingChanceMultiplier = ClientAttributesHandler.getAttribute("FishingChanceMultiplier")
            if typeof(FishingChanceMultiplier) ~= "number" then
                FishingChanceMultiplier = 1
            end
            if math.random() <= FishingChanceMultiplier * 0.25 then
                onFishBite()
            end
            return
        elseif HumanoidRootPart and 100 < (HumanoidRootPart.Position - v1).Magnitude then
            if u349 then
                u349()
            end
            return
        end
    end)
end
local function stopReeling() -- Line: 479 -- upvalues: u338 (ref), stopToolRigAnimations (val)
    if u338 then
        u338:Stop(0.1)
        u338 = nil
    end
    stopToolRigAnimations(0.1)
end
local function stopActiveIdle() -- Line: 488 -- upvalues: stopBiteLoop (val), u337 (ref), stopToolRigAnimations (val), u339 (ref)
    stopBiteLoop()
    if u337 then
        u337:Stop(0.1)
        u337 = nil
    end
    stopToolRigAnimations(0.1)
    u339 = false
end
local function playActiveIdle() -- Line: 500 -- upvalues: stopActiveIdle (val), stopReeling (val), u339 (ref), u337 (ref), playPairedAnimation (val), u306 (val), startBiteLoop (val)
    stopActiveIdle()
    stopReeling()
    u339 = true
    u337 = playPairedAnimation(u306.FishingActiveIdle, 0.1, true)
    startBiteLoop()
end
local function returnToIdle() -- Line: 510 -- upvalues: stopActiveIdle (val), stopReeling (val), clearMinigameWalkSpeed (val), clearCastWalkSpeed (val), playPairedAnimation (val), u306 (val)
    stopActiveIdle()
    stopReeling()
    clearMinigameWalkSpeed()
    clearCastWalkSpeed()
    playPairedAnimation(u306.NonActiveIdle, 0.1, true)
end
function u349() -- Line: 524 -- upvalues: u350 (ref), ClientFishingMinigameHandler (val), stopBiteLoop (val), stopMinigameReeling (val), u348 (ref), destroyActiveBobber (val), returnToIdle (val)
    if u350 then
        u350()
    end
    if ClientFishingMinigameHandler.active then
        ClientFishingMinigameHandler.abort()
    end
    stopBiteLoop()
    stopMinigameReeling()
    if u348 then
        u348({action = "retrieve"})
    end
    destroyActiveBobber()
    returnToIdle()
end
local function onMinigameResult(p1) -- Line: 545 -- upvalues: stopMinigameReeling (val), clearMinigameWalkSpeed (val), u339 (ref), Signals (val), u362 (val), Sounds (val), u263 (val), stopBiteLoop (val), u348 (ref), destroyActiveBobber (val), returnToIdle (val), u336 (ref), stopActiveIdle (val), stopReeling (val), playPairedAnimation (val), u306 (val), u367 (val), u341 (ref), Effects (val)
    stopMinigameReeling()
    clearMinigameWalkSpeed()
    if not u339 then
        return
    end
    if not p1 then
        Signals.Monologue:Fire(u362)
        Sounds.playGlobalSoundEffect(u263.MinigameFailed, 0, 1, 5)
        stopBiteLoop()
        if u348 then
            u348({action = "retrieve"})
        end
        destroyActiveBobber()
        returnToIdle()
        return
    end
    stopBiteLoop()
    local HumanoidRootPart = u336
    if HumanoidRootPart then
        HumanoidRootPart = u336:FindFirstChild("HumanoidRootPart")
    end
    if HumanoidRootPart then
        Sounds.playRangedSoundEffect(u263.BobberCaught, HumanoidRootPart, 80, 1)
    end
    stopActiveIdle()
    stopReeling()
    playPairedAnimation(u306.FishCaughtOnHook, 0.1)
    Signals.Monologue:Fire(u367)
    local v1 = u341
    if v1 then
        Effects.emitClientEffect("Bobber", {action = "reel", duration = 0.6, skip = true, bobberId = v1})
        if u348 then
            u348({action = "reel", duration = 0.6})
        end
    end
    task.delay(0.6, function() -- Line: 602 -- upvalues: u348 (upval), u341 (upval), returnToIdle (upval)
        if u348 then
            u348({action = "catch"})
        end
        u341 = nil
        returnToIdle()
    end)
end
local function onDamageTaken() -- Line: 612 -- upvalues: u340 (ref), u339 (ref), u341 (ref), ClientFishingMinigameHandler (val), u349 (ref)
    if u340 or u339 or u341 then
        if u349 then
            u349()
        end
        return
    end
    if not ClientFishingMinigameHandler.active then
        return
    end
    if u349 then
        u349()
    end
end
local function onRetrieve(p1) -- Line: 624 -- upvalues: destroyActiveBobber (val), returnToIdle (val)
    destroyActiveBobber()
    returnToIdle()
    p1({action = "retrieve"})
end
local function onSecondClick(p1) -- Line: 630 -- upvalues: u339 (ref), onRetrieve (val)
    if not u339 then
        return
    end
    onRetrieve(p1)
end
local function onRodReady() end
local function onReelShoot(p1) -- Line: 643 -- upvalues: spawnBobber (val)
    return spawnBobber(p1)
end
local function onCast(p1) -- Line: 647 -- upvalues: u340 (ref), u339 (ref), u341 (ref), isTooExhaustedToFish (val), Signals (val), u378 (val), stopActiveIdle (val), stopReeling (val), applyCastWalkSpeed (val), u342 (ref), playPairedAnimation (val), u306 (val), playActiveIdle (val), returnToIdle (val), u350 (ref), useAnimatorObserver (val), onRodReady (val), onReelShoot (val)
    if u340 or u339 or u341 then
        return
    end
    if isTooExhaustedToFish() then
        Signals.Monologue:Fire(u378)
        return
    end
    u340 = true
    stopActiveIdle()
    stopReeling()
    applyCastWalkSpeed()
    if u342 then
        u342:Disconnect()
        u342 = nil
    end
    local u25 = false
    local u26 = false
    local u31 = playPairedAnimation(u306.Casting, 0.1)
    p1({action = "cast_sound"})
    local function finishCast() -- Line: 675 -- upvalues: u26 (ref), u341 (upval), playActiveIdle (upval), returnToIdle (upval), u340 (upval), u350 (upval)
        if u26 then
            return
        end
        if not u341 then
            returnToIdle()
        else
            playActiveIdle()
        end
        u340 = false
        u350 = nil
    end
    function u350() -- Line: 692 -- upvalues: u26 (ref), u25 (ref), u342 (upval), u31 (val), u340 (upval), u350 (upval)
        u26 = true
        u25 = true
        if u342 then
            u342:Disconnect()
            u342 = nil
        end
        if u31 then
            u31:Stop(0.1)
        end
        u340 = false
        u350 = nil
    end
    if not u31 then
        onRodReady()
        onReelShoot(p1)
        finishCast()
    else
        u342 = useAnimatorObserver.onKeyframeReachedSwitch(u31, {
            RodReady = onRodReady,
            ReelShoot = function() -- Line: 712 -- upvalues: u25 (ref), onReelShoot (upval), p1 (val)
                if u25 then
                    return
                end
                u25 = true
                onReelShoot(p1)
            end,
        })
        u31.Stopped:Once(function() -- Line: 722 -- upvalues: u342 (upval), finishCast (val)
            u342 = nil
            finishCast()
        end)
    end
end
return {
    equipped = function(p1) -- Line: 736 -- upvalues: u348 (ref), Character (val), u336 (ref), u334 (ref), useAnimatorObserver (val), u332 (val), u347 (ref), Signals (val), onDamageTaken (val), u345 (ref), ClientFishingMinigameHandler (val), onMinigameResult (val), u346 (ref), stopMinigameReeling (val), u335 (ref), UserInputService (val), u340 (ref), u339 (ref), onSecondClick (val), onCast (val)
        u348 = p1
        Character.getCharacterAsync():andThen(function(p1) -- Line: 739 -- upvalues: u336 (upval), u334 (upval), useAnimatorObserver (upval), u332 (upval)
            u336 = p1
            u334 = useAnimatorObserver.bind(p1.Humanoid.Animator, u332, 2)
        end)
        u347 = Signals.OnHealthChanged:Connect(onDamageTaken)
        u345 = ClientFishingMinigameHandler.onResult:Connect(onMinigameResult)
        u346 = ClientFishingMinigameHandler.onAbort:Connect(stopMinigameReeling)
        u335 = UserInputService.InputBegan:Connect(function(a1) -- Line: 754 -- upvalues: u334 (upval), u340 (upval), ClientFishingMinigameHandler (upval), u339 (upval), onSecondClick (upval), p1 (val), onCast (upval)
            if not u334 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u340 or ClientFishingMinigameHandler.active then
                return
            end
            if u339 then
                onSecondClick(p1)
                return
            end
            onCast(p1)
        end)
    end,
    unequipped = function() -- Line: 776 -- upvalues: stopAllPlayerAnimations (val), u334 (ref), u335 (ref), u342 (ref), u345 (ref), u346 (ref), u347 (ref), u350 (ref), ClientFishingMinigameHandler (val), stopBiteLoop (val), stopActiveIdle (val), stopReeling (val), stopMinigameReeling (val), clearMinigameWalkSpeed (val), clearCastWalkSpeed (val), destroyActiveBobber (val), stopToolRigAnimations (val), u336 (ref), u348 (ref), u340 (ref)
        stopAllPlayerAnimations(0.1)
        if u334 then
            u334()
            u334 = nil
        end
        if u335 then
            u335:Disconnect()
            u335 = nil
        end
        if u342 then
            u342:Disconnect()
            u342 = nil
        end
        if u345 then
            u345:Disconnect()
            u345 = nil
        end
        if u346 then
            u346:Disconnect()
            u346 = nil
        end
        if u347 then
            u347:Disconnect()
            u347 = nil
        end
        if u350 then
            u350()
        end
        ClientFishingMinigameHandler.abort()
        stopBiteLoop()
        stopActiveIdle()
        stopReeling()
        stopMinigameReeling()
        clearMinigameWalkSpeed()
        clearCastWalkSpeed()
        destroyActiveBobber()
        stopToolRigAnimations(0.1)
        u336 = nil
        u348 = nil
        u340 = false
    end,
    data = v2,
}