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
--         File: ReplicatedStorage.Client.User.Character.CharacterMovementRunner
--                               Dumped in 0.00921 seconds
--                          Bytecode version 9  |  80 functions

local onCheckForSplattingAnimation
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Effects_2 = Common_2:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Noclip = require(Utilities_2:WaitForChild("Noclip"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Raycast = require(Utilities_3:WaitForChild("Raycast"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_4 = Common_6:WaitForChild("Utilities")
local Shake = require(Utilities_4:WaitForChild("Shake"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_5 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_6 = Common_9:WaitForChild("Utilities")
local Statistics = require(Utilities_6:WaitForChild("Statistics"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Utilities_7 = Common_10:WaitForChild("Utilities")
local State = require(Utilities_7:WaitForChild("State"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Animations = Common_11:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_12:WaitForChild("Common")
local Animations_2 = Common_12:WaitForChild("Animations")
local Gear = require(Animations_2:WaitForChild("Gear"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_13:WaitForChild("Common")
local Signals = require(Common_13:WaitForChild("Signals"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_14:WaitForChild("Common")
local Observers = Common_14:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_15:WaitForChild("Common")
local Statistics_2 = Common_15:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_16:WaitForChild("Common")
local Statistics_3 = Common_16:WaitForChild("Statistics")
local useJumpPower = require(Statistics_3:WaitForChild("useJumpPower"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_17 = ReplicatedStorage_17:WaitForChild("Common")
local Utilities_8 = Common_17:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_8:WaitForChild("useNumberEasing"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_18 = ReplicatedStorage_18:WaitForChild("Common")
local Statistics_4 = Common_18:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_4:WaitForChild("useWalkSpeed"))
local useAnimatorObserver_2 = useAnimatorObserver.useAnimatorObserver
local CharacterRagdollHandler = require(v1.Parent:WaitForChild("CharacterRagdollHandler"))
local CharacterInjuryHandler = require(v1.Parent:WaitForChild("CharacterInjuryHandler"))
local Equipment = v1.Parent.Parent:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local State_2 = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local State_3 = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State_3:WaitForChild("ClientSettingsHandler"))
local Progression = v1.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local State_4 = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler_2 = require(State_4:WaitForChild("ClientSettingsHandler"))
local States = ClientStateHandler.States
require(v1.Parent:WaitForChild("CharacterSmartPhysicsRunner"))
local u462 = NumberRange.new(10, 30)
local u463 = 0
local u465 = Vector3.new()
local u466 = nil
local u467 = {}
local u468 = {}
local u469 = nil
local u470 = 0
local u471 = nil
local u472 = 0
local u473 = 0
local u474 = {}
local u475 = {}
local function remapShiftlockKeybind() -- Line: 107 -- upvalues: Players (val)
    local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts")
    local PlayerModule = PlayerScripts:WaitForChild("PlayerModule")
    local CameraModule = PlayerModule:WaitForChild("CameraModule")
    local MouseLockController = CameraModule:WaitForChild("MouseLockController")
    local BoundKeys = MouseLockController:FindFirstChild("BoundKeys")
    if not BoundKeys then
        BoundKeys = Instance.new("StringValue")
    end
    BoundKeys.Value = "LeftAlt"
    BoundKeys.Name = "BoundKeys"
    BoundKeys.Parent = MouseLockController
end
local function getHighestMovementHeight() -- Line: 126 -- upvalues: u468 (val)
    local Y = 0
    local v1 = u468
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if Y < j.Y then
            Y = j.Y
        end
    end
    return Y
end
local function onCheckForSkydivingAnimation() -- Line: 141 -- upvalues: Character (val), ClientGearHandler (val), ClientAttributesHandler (val), ClientStateHandler (val), States (val), useAnimatorObserver (val), Default (val), ClientSettingsHandler_2 (val), RunService (val)
    local u2 = Character.getCharacter()
    if not u2 then
        return
    end
    local u5 = ClientGearHandler.getGearState()
    local Humanoid = u2:WaitForChild("Humanoid")
    local HumanoidRootPart = u2:WaitForChild("HumanoidRootPart")
    local u14 = nil
    local u15 = nil
    local u16 = 0
    local u17 = false
    local u18 = nil
    local u19 = nil
    local u22 = workspace.Gravity * 0.1
    local u23 = nil
    local u24 = false
    local GearSkydiveConsumptionDrainMultiplier = ClientAttributesHandler.getAttribute("GearSkydiveConsumptionDrainMultiplier")
    local function onCancelSkydive() -- Line: 174 -- upvalues: u14 (ref), u15 (ref), u18 (ref), ClientStateHandler (upval), States (upval), Humanoid (val), u19 (ref), u5 (ref), u24 (ref)
        if u14 then
            u14:Disconnect()
        end
        if u15 then
            u15:Disconnect()
        end
        if u18 then
            u18:Stop(0.3)
            u18 = nil
        end
        if not (ClientStateHandler.isStateBusy(States.GRAPPLING)) then
            Humanoid.AutoRotate = true
        end
        if u19 then
            u19:Destroy()
            u19 = nil
        end
        if u5 and u24 then
            u5.signals.boosting:Fire(false)
            u24 = false
        end
    end
    local function onBeginSkydiving() -- Line: 206 -- upvalues: u17 (ref), u16 (ref), u18 (ref), useAnimatorObserver (upval), Default (upval), u23 (ref), u2 (val)
        if u17 then
            return
        end
        u17 = true
        u16 = 0
        u18 = useAnimatorObserver.play(Default.Skydiving, 0.5)
        u23 = u2.HumanoidRootPart.AssemblyLinearVelocity
    end
    local function onSkydiveStepped(p1) -- Line: 223 -- upvalues: ClientSettingsHandler_2 (upval), ClientGearHandler (upval), u5 (ref), u23 (ref), GearSkydiveConsumptionDrainMultiplier (val), Humanoid (val), u19 (ref), HumanoidRootPart (val), u24 (ref), u22 (val), u16 (ref), u2 (val)
        local v1 = ClientSettingsHandler_2.isKeyPressed("Gas Boost")
        local v2 = ClientGearHandler.getGearState()
        local enabled = v2
        if enabled then
            enabled = v2.enabled
        end
        local v3 = v2
        if not v3 then
            v3 = u5
        end
        u5 = v3
        if not v1 then
            Humanoid.AutoRotate = true
            if u19 then
                u19:Destroy()
                u19 = nil
            end
            if u5 and u24 then
                u5.signals.boosting:Fire(false)
                u24 = false
            end
            return
        elseif u23 and enabled and v2 and v2.useGas(v2.gasConsumption * GearSkydiveConsumptionDrainMultiplier * p1) then
            Humanoid.AutoRotate = false
            if not u19 then
                local BodyGyro = Instance.new("BodyGyro")
                BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                BodyGyro.P = 1000
                BodyGyro.D = 100
                BodyGyro.Parent = HumanoidRootPart
                u19 = BodyGyro
                if not u24 then
                    v2.signals.boosting:Fire(true)
                    u24 = true
                end
            end
            if not u19 then
                return
            end
            v3 = workspace.CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1) * 200
            u19.CFrame = CFrame.new(HumanoidRootPart.Position, HumanoidRootPart.Position + v3)
            local Y = u23.Y
            if 0 < Y then
                Y = math.min(Y * 0.15, 20)
            end
            local v4 = math.clamp(Y - u22 * u16, -100, 20)
            local v5 = u2.HumanoidRootPart.CFrame.LookVector * 200
            u2.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v5.X, v4, v5.Z)
            return
        end
    end
end
function onCheckForSplattingAnimation() -- Line: 344 -- upvalues: CharacterInjuryHandler (val), Character (val), u474 (val), u473 (ref), RunService (val), onCheckForSplattingAnimation (val), ClientStateHandler (val), States (val), Raycast (val), ClientGearHandler (val), Workspace (val), Shake (val), Signals (val), useAnimatorObserver (val), Default (val), CharacterRagdollHandler (val)
    local v1, v2, v3, v4
    if CharacterInjuryHandler.getCanSafelyMount() then
        return
    end
    _, v1 = Character.getCharacterAsync():await()
    local HumanoidRootPart = v1.HumanoidRootPart
    local Humanoid = v1:WaitForChild("Humanoid")
    local function onDisconnect() -- Line: 353 -- upvalues: u474 (upval)
        if u474.connection then
            u474.connection:Disconnect()
            u474.connection = nil
        end
    end
    local v5 = tick() - u473
    if v5 < 3 or ClientStateHandler.isStateBusy(States.LOCKED) or ClientStateHandler.isStateBusy(States.SLIDING) or ClientStateHandler.isStateBusy(States.GRAPPLING) or ClientStateHandler.isStateBusy(States.TURBINE) or HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 100 then
        return onDisconnect()
    end
    v2, v3, v4 = Raycast.checkForWallInfront({
        camera = false,
        x = 3,
        y = 5,
        totalSuccessfulPoints = 10,
        maximumDistance = 10,
    })
    if not v2 then
        return (function() -- Line: 364 -- upvalues: u474 (upval), RunService (upval), onCheckForSplattingAnimation (upval), onDisconnect (val)
            if not u474.enabled and not u474.connection then
                u474.connection = RunService.RenderStepped:Connect(onCheckForSplattingAnimation)
                task.delay(0.4, onDisconnect)
            end
        end)()
    end
    local v6 = v4:Dot(Vector3.yAxis)
    if 0.2 < v6 then
        return (function() -- Line: 364 -- upvalues: u474 (upval), RunService (upval), onCheckForSplattingAnimation (upval), onDisconnect (val)
            if not u474.enabled and not u474.connection then
                u474.connection = RunService.RenderStepped:Connect(onCheckForSplattingAnimation)
                task.delay(0.4, onDisconnect)
            end
        end)()
    end
    v6 = ClientGearHandler.getGearState()
    if v6 then
        v6.addTimeout(2)
    end
    if v6 and v6.animation then
        v6.animation:Stop(0.2)
        v6.animation = nil
    end
    local CurrentCamera = Workspace.CurrentCamera
    local v7 = Shake.new()
    v7.FadeInTime = 0.2
    v7.FadeOutTime = 0.5
    v7.Frequency = 0.05
    v7.Amplitude = 2
    v7.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
    v7:Start()
    v7:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 422 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
    local v8 = CFrame.new(v3, v3 + v4)
    local v9 = v8 * CFrame.new(0, 0, -1.5)
    v8 = math.random(1, 2) == 1
    Signals.Monologue:Fire("My injured legs can't take this sort of impact...")
    if not v8 then
        HumanoidRootPart.AssemblyLinearVelocity = -CFrame.new(v9.Position, v3).LookVector * 300
        CharacterRagdollHandler.ragdoll(1.5)
    else
        Humanoid.PlatformStand = true
        Humanoid.AutoRotate = false
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        BodyGyro.P = 1000
        BodyGyro.D = 100
        BodyGyro.Parent = HumanoidRootPart
        local BodyPosition = Instance.new("BodyPosition")
        BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        BodyPosition.P = 1000
        BodyPosition.D = 100
        BodyPosition.Position = v9.Position
        BodyPosition.Parent = HumanoidRootPart
        BodyGyro.CFrame = CFrame.new(v9.Position, v3)
        ClientStateHandler.updateState(States.LOCKED, true)
        useAnimatorObserver.play(Default.Splat, 0.05)
        task.delay(0.5, function() -- Line: 457 -- upvalues: ClientStateHandler (upval), States (upval), BodyGyro (val), BodyPosition (val), Character (upval), Humanoid (val), HumanoidRootPart (val), CharacterRagdollHandler (upval)
            ClientStateHandler.updateState(States.LOCKED, false)
            BodyGyro:Destroy()
            BodyPosition:Destroy()
            if not (Character.isRagdolled()) then
                Humanoid.PlatformStand = false
                Humanoid.AutoRotate = true
            end
            HumanoidRootPart.AssemblyLinearVelocity = -HumanoidRootPart.CFrame.LookVector * 50
            CharacterRagdollHandler.ragdoll(1.5)
        end)
    end
    u473 = tick()
    onDisconnect()
end
local function _onAttemptLandingAnimation() -- Line: 489 -- upvalues: Character (val), Statistics (val), ClientGearHandler (val), getHighestMovementHeight (val), ClientAttributesHandler (val), u472 (ref), Gear (val), Default (val), useAnimatorObserver (val), RunService (val), useWalkSpeed (val)
    local v1
    if Character.isRagdolled() then
        return
    end
    _, v1 = Character.getCharacterAsync():await()
    local Humanoid = v1:WaitForChild("Humanoid")
    local v2 = Statistics.Contains("walkspeed", "sprint")
    if v2 then
        v2 = 0 < Humanoid.MoveDirection.Magnitude
    end
    local v3 = ClientGearHandler.getGearState()
    local handles = v3
    if handles then
        handles = v3.handles
        if handles then
            handles = v3.enabled
        end
    end
    local v4 = getHighestMovementHeight() - v1.HumanoidRootPart.Position.Y
    local v5 = if ClientAttributesHandler.getAttribute("NoSupermanLanding") == 0 then 100 < v4 else false
    local v6 = v5
    if v6 then
        local v7 = tick() - u472
        v6 = 20 <= v7
    end
    if v6 then
        local Running
        if not v2 then
            if not v6 then
                Running = Default.Landing.Regular
            else
                Running = Default.Landing.Large
            end
        elseif not v6 then
            if not handles then
                Running = Default.Landing.Running
            else
                Running = Gear.Landing.Running
            end
        end
        if v6 then
            u472 = tick()
        end
        local u90 = useAnimatorObserver.play(Running, 0.2)
        if v2 then
            local u96 = nil
            local u98 = tick()
            u96 = RunService.RenderStepped:Connect(function() -- Line: 532 -- upvalues: Humanoid (val), Statistics (upval), u98 (val), u90 (val), u96 (ref)
                local v1 = true
                if Humanoid.MoveDirection.Magnitude ~= 0 then
                    v1 = not Statistics.Contains("walkspeed", "sprint")
                    if not v1 then
                        local v2 = tick() - u98
                        if u90.Length >= v2 then
                            v1 = not u90.IsPlaying
                        else
                            v1 = if 0 >= u90.Length then not u90.IsPlaying else true
                        end
                    end
                end
                if v1 then
                    u96:Disconnect()
                    u90:Stop(0.2)
                end
            end)
            task.delay(2, function() -- Line: 545 -- upvalues: u96 (ref)
                u96:Disconnect()
            end)
        end
        if not v2 then
            local v8, v9
            _, v8 = useWalkSpeed()
            if not v6 then
                v9 = 5
            else
                v9 = 2
            end
            local u136 = v8("landing", v9, "set", 10)
            if not v6 then
                v9 = 0.1
            else
                v9 = 1
            end
            task.delay(v9, function() -- Line: 557 -- upvalues: u136 (val)
                u136(TweenInfo.new(0.3))
            end)
            return
        elseif not v6 then
            return
        end
    elseif v2 then
        return
    end
end
local function onHumanoidStateChanged(p1, p2) -- Line: 568 -- upvalues: onCheckForSkydivingAnimation (val), onCheckForSplattingAnimation (val), Players (val), u471 (ref), useAnimatorObserver (val), Default (val)
    if p2 == Enum.HumanoidStateType.Freefall then
        onCheckForSkydivingAnimation()
        onCheckForSplattingAnimation()
        return
    end
    local Character = Players.LocalPlayer.Character
    if Character then
        Character = Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    end
    if not Character then
        if Character and p1 == Enum.HumanoidStateType.Seated and p2 ~= Enum.HumanoidStateType.Seated and u471 then
            u471:Stop(0.2)
            u471 = nil
        end
        return
    end
    if p2 == Enum.HumanoidStateType.Seated then
        local SeatPart = Character.SeatPart
        if not SeatPart or not (SeatPart:HasTag("Seating")) then
            return
        end
        u471 = useAnimatorObserver.play(Default.Sits[1], 0.2)
        return
    end
    if Character and p1 == Enum.HumanoidStateType.Seated and p2 ~= Enum.HumanoidStateType.Seated and u471 then
        u471:Stop(0.2)
        u471 = nil
    end
end
local function onSlideStateChanged(p1) -- Line: 601 -- upvalues: Players (val), ClientStateHandler (val), States (val), u475 (val), useAnimatorObserver (val), Gear (val), Character (val), ClientGearHandler (val), Workspace (val), Effects (val), useWalkSpeed (val), useFieldOfView (val), ClientAttributesHandler (val), UserInputService (val), useJumpPower (val), RunService (val)
    local Character_2 = Players.LocalPlayer.Character
    local HumanoidRootPart = Character_2
    if HumanoidRootPart then
        HumanoidRootPart = Character_2:FindFirstChild("HumanoidRootPart")
    end
    local Humanoid = Character_2
    if Humanoid then
        Humanoid = Character_2:FindFirstChildOfClass("Humanoid")
    end
    if not Character_2 or not HumanoidRootPart or not Humanoid then
        return ClientStateHandler.updateState(States.SLIDING, false)
    end
    local function onDisconnect() -- Line: 613 -- upvalues: u475 (upval)
        if u475.connection then
            u475.connection:Disconnect()
            u475.connection = nil
        end
    end
    local function onDestroyActiveReferences() -- Line: 622 -- upvalues: u475 (upval)
        if u475.active then
            u475.active.gyro:Destroy()
            u475.active.velocity:Destroy()
            u475.active = nil
        end
    end
    local function onGetLatestReferences() -- Line: 659 -- upvalues: u475 (upval), Character_2 (val)
        local v1 = {}
        local GearGyro = Character_2.HumanoidRootPart:FindFirstChild("GearGyro")
        if not GearGyro then
            GearGyro = u475.references
            if GearGyro then
                GearGyro = u475.references.gyro
            end
        end
        v1.gyro = GearGyro
        local GearVelocity = Character_2.HumanoidRootPart:FindFirstChild("GearVelocity")
        if not GearVelocity then
            GearVelocity = u475.references
            if GearVelocity then
                GearVelocity = u475.references.velocity
            end
        end
        v1.velocity = GearVelocity
        u475.references = v1
    end
    local function createActiveReferences() -- Line: 670 -- upvalues: u475 (upval)
        local active
        local references = u475.references
        if not references then
            return
        end
        if u475.active then
            return u475.active
        end
        u475.active = {gyro = Instance.new("BodyGyro"), velocity = Instance.new("BodyVelocity")}
        active = u475.active
        active.gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        active.velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        active.gyro.CFrame = references.gyro.CFrame
        active.velocity.Velocity = references.velocity.Velocity
        active.gyro.Name = "SlideGearGyro"
        active.velocity.Name = "SlideGearVelocity"
        active.gyro.P = 1000
        active.velocity.P = 1000
        active.gyro.D = 50
        return u475.active
    end
    local function updateActiveParents() -- Line: 706 -- upvalues: u475 (upval), HumanoidRootPart (val)
        local references = u475.references
        local active = u475.active
        if not references or not active then
            return
        end
        if not references.gyro.Parent then
            active.gyro.Parent = HumanoidRootPart
        end
        if not references.velocity.Parent then
            active.velocity.Parent = HumanoidRootPart
        end
    end
    local function onPointLaunch() -- Line: 725 -- upvalues: ClientStateHandler (upval), States (upval), u475 (upval), ClientGearHandler (upval), HumanoidRootPart (val), Workspace (upval), useAnimatorObserver (upval), Gear (upval), Effects (upval)
        local LookVector, v1, v2, v3, v4, v5
        if ClientStateHandler.isStateBusy(States.SWIMMING) then
            return
        end
        if not u475.timestamp then
            v1 = ClientGearHandler.getGearState()
            if not v1 or not (v1.useGas(60)) then
                return
            end
            v2 = HumanoidRootPart
            v4 = math.min(v2.AssemblyLinearVelocity.Magnitude, 150)
            LookVector = Workspace.CurrentCamera.CFrame.LookVector
            v5 = math.max(2, v4 / 50)
            v2.AssemblyLinearVelocity = Vector3.new(LookVector.X, 0, LookVector.Z).Unit * (v5 * 95) + Vector3.new(0, v5 * 60, 0)
            v3 = Gear.Launches[math.random(1, #Gear.Launches)]
            useAnimatorObserver.play(v3, 0.2)
            Effects.sendReplicatedEffect("Dash")
            ClientStateHandler.updateState(States.TURBINE, true)
            ClientStateHandler.updateState(States.SLIDING, false)
            task.delay(0.7, function() -- Line: 773 -- upvalues: ClientStateHandler (upval), States (upval)
                ClientStateHandler.updateState(States.TURBINE, false)
            end)
            return
        end
        v1 = tick() - u475.timestamp
        if v1 < 0.2 then
            return
        end
        v1 = ClientGearHandler.getGearState()
        if not v1 or not (v1.useGas(60)) then
            return
        end
        v2 = HumanoidRootPart
        v4 = math.min(v2.AssemblyLinearVelocity.Magnitude, 150)
        LookVector = Workspace.CurrentCamera.CFrame.LookVector
        v5 = math.max(2, v4 / 50)
        v2.AssemblyLinearVelocity = Vector3.new(LookVector.X, 0, LookVector.Z).Unit * (v5 * 95) + Vector3.new(0, v5 * 60, 0)
        v3 = Gear.Launches[math.random(1, #Gear.Launches)]
        useAnimatorObserver.play(v3, 0.2)
        Effects.sendReplicatedEffect("Dash")
        ClientStateHandler.updateState(States.TURBINE, true)
        ClientStateHandler.updateState(States.SLIDING, false)
        task.delay(0.7, function() -- Line: 773 -- upvalues: ClientStateHandler (upval), States (upval)
            ClientStateHandler.updateState(States.TURBINE, false)
        end)
    end
    local function onInstantStop() -- Line: 780 -- upvalues: Gear (upval), useAnimatorObserver (upval), useWalkSpeed (upval), useFieldOfView (upval), u475 (upval)
        local v1, v2
        local Recoveries = Gear.Recoveries
        local v3 = Recoveries[math.random(1, #Recoveries)]
        useAnimatorObserver.play(v3, 0.2)
        _, v1 = useWalkSpeed()
        _, v2 = useFieldOfView()
        local v4 = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local v5 = v1("sliding", 5, "set", 10)
        local u35 = v2("sliding", 90, "set", 10, v4)
        task.delay(0.5, v5)
        task.delay(0.4, function() -- Line: 796 -- upvalues: u35 (val)
            u35(TweenInfo.new(1.75))
        end)
        useAnimatorObserver.stop(Gear.Slide, 0.2)
        u475.stopping = true
    end
    if not HumanoidRootPart or not Humanoid then
        return ClientStateHandler.updateState(States.SLIDING, false)
    end
    onDisconnect()
    onDestroyActiveReferences()
    if not p1 then
        (function() -- Line: 632 -- upvalues: onDisconnect (val), useAnimatorObserver (upval), Gear (upval), ClientStateHandler (upval), States (upval), Character (upval), Humanoid (val), u475 (upval), onDestroyActiveReferences (val)
            onDisconnect()
            useAnimatorObserver.stop(Gear.Slide, 0.2)
            ClientStateHandler.updateState(States.SLIDING, false)
            if not (ClientStateHandler.isStateBusy(States.GRAPPLING)) and not (Character.isRagdolled()) then
                Humanoid.PlatformStand = false
                Humanoid.AutoRotate = true
            end
            if u475.removeJumpPower then
                u475.removeJumpPower()
            end
            u475.stopping = false
            u475.active = nil
            u475.references = nil
            u475.timestamp = nil
            onDestroyActiveReferences()
        end)()
        return
    end
    ;(function() -- Line: 888 -- upvalues: ClientStateHandler (upval), States (upval), onGetLatestReferences (val), useAnimatorObserver (upval), Gear (upval), useJumpPower (upval), u475 (upval)
        local v1
        if ClientStateHandler.isStateBusy(States.SWIMMING) then
            return
        end
        onGetLatestReferences()
        useAnimatorObserver.play(Gear.Slide, 0.2)
        _, v1 = useJumpPower()
        local v2 = v1("sliding", 0, "set", 10)
        u475.removeJumpPower = v2
    end)()
    u475.connection = RunService.RenderStepped:Connect(function(p1) -- Line: 807 -- upvalues: ClientStateHandler (upval), States (upval), Character (upval), Character_2 (val), u475 (upval), onGetLatestReferences (val), onDestroyActiveReferences (val), createActiveReferences (val), Humanoid (val), ClientAttributesHandler (upval), HumanoidRootPart (val), UserInputService (upval), onInstantStop (val), onPointLaunch (val), updateActiveParents (val)
        local v1, v2
        if ClientStateHandler.isStateBusy(States.SWIMMING) then
            return ClientStateHandler.updateState(States.SLIDING, false)
        end
        _, v1 = Character.isGrounded()
        if math.max(1, Character_2:GetScale()) * 4 < v1 or ClientStateHandler.isStateBusy(States.GEAR_SWING) then
            return ClientStateHandler.updateState(States.SLIDING, false)
        end
        if ClientStateHandler.isStateBusy(States.GRAPPLING) or not u475.references then
            onGetLatestReferences()
            onDestroyActiveReferences()
            u475.stopping = false
            u475.timestamp = nil
            return
        end
        if not u475.references.gyro or not u475.references.velocity then
            return
        end
        local v3 = createActiveReferences()
        if not v3 then
            return
        end
        if not u475.timestamp then
            u475.timestamp = tick()
        end
        Humanoid.PlatformStand = true
        Humanoid.AutoRotate = false
        if not u475.stopping then
            v2 = ClientAttributesHandler.getAttribute("GearGroundSlidingLength") * 0.8
        else
            v2 = 3
        end
        local v4 = v2
        local v5 = Vector3.new(1, 0, 1)
        v3.velocity.Velocity = v3.velocity.Velocity * v5:Lerp(Vector3.new(), v4 * p1)
        v3.velocity.P = math.lerp(v3.velocity.P, 0, v4 * p1)
        v3.gyro.CFrame = CFrame.new(HumanoidRootPart.Position, HumanoidRootPart.Position + v3.velocity.Velocity)
        v3.gyro.P = math.lerp(v3.gyro.P, 0, v4 * p1)
        if v3.velocity.Velocity.Magnitude < 50 then
            return ClientStateHandler.updateState(States.SLIDING, false)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not u475.stopping then
            u475.stopping = true
            onInstantStop()
        end
        if not (UserInputService:IsKeyDown(Enum.KeyCode.Space)) or not u475.timestamp then
            updateActiveParents()
            return
        end
        v2 = tick() - u475.timestamp
        if 0.3 < v2 then
            return onPointLaunch()
        end
        updateActiveParents()
    end)
end
local function onCrouchingRequestBegan() -- Line: 927 -- upvalues: Character (val), useWalkSpeed (val), useJumpPower (val), ClientStateHandler (val), States (val), useAnimatorObserver (val), Default (val), ClientSettingsHandler_2 (val), u463 (ref), Sounds (val), Universal (val), useNumberEasing (val), RunService (val), Signals (val), Statistics (val), ClientAttributesHandler (val)
    local u20, u23
    local u2 = Character.getCharacter()
    local Humanoid = u2
    if Humanoid then
        Humanoid = u2:FindFirstChildWhichIsA("Humanoid")
    end
    local HumanoidRootPart = u2
    if HumanoidRootPart then
        HumanoidRootPart = u2:FindFirstChild("HumanoidRootPart")
    end
    if not u2 or not Humanoid or not HumanoidRootPart then
        return
    end
    _, u20 = useWalkSpeed()
    _, u23 = useJumpPower()
    local u24 = false
    local u25 = nil
    local u26 = nil
    local u27 = nil
    local u28 = nil
    local u29 = -1
    local u30 = 0
    local function onCrouchingCancelled() -- Line: 960 -- upvalues: u26 (ref), u27 (ref), u28 (ref), ClientStateHandler (upval), States (upval), u24 (ref)
        if u26 and u27 then
            u26()
            u27()
        end
        if u28 then
            u28()
        end
        ClientStateHandler.updateState(States.CROUCHING, false)
        u24 = false
    end
    local function onCrouchingTerminated() -- Line: 978 -- upvalues: u25 (ref), onCrouchingCancelled (val)
        if u25 then
            u25:Disconnect()
        end
        onCrouchingCancelled()
    end
    local function onCrouchingStarted() -- Line: 989 -- upvalues: u24 (ref), u26 (ref), u20 (val), u27 (ref), u23 (val), u28 (ref), useAnimatorObserver (upval), u2 (val), Default (upval), ClientStateHandler (upval), States (upval)
        if u24 then
            return
        end
        u24 = true
        u26 = u20("crouch", 8, "set", 15)
        u27 = u23("crouch", 0, "set", 4)
        u28 = useAnimatorObserver.bind(u2.Humanoid.Animator, Default.Crouch, 3)
        ClientStateHandler.updateState(States.CROUCHING, true)
    end
    if ClientStateHandler.isStateBusy(States.HANDCUFFED) then
        return onCrouchingCancelled()
    end
    ClientStateHandler.updateState(States.CROUCHING, true)
    local v1 = Statistics.Contains("walkspeed", "sprint")
    if v1 then
        v1 = 0 < Humanoid.MoveDirection.Magnitude
    end
    if v1 and ClientAttributesHandler.getAttribute("CanRoll") ~= 0 then
        local v2 = tick() - u463
        if 5 <= v2 then
            (function() -- Line: 1041 -- upvalues: u463 (upval), u30 (ref), useAnimatorObserver (upval), Default (upval), Sounds (upval), Universal (upval), HumanoidRootPart (val), u29 (ref), useNumberEasing (upval), RunService (upval), u2 (val), onCrouchingCancelled (val), Signals (upval)
                local u31, u32, u33
                u463 = tick()
                u30 = tick() + 1
                local u11 = useAnimatorObserver.play(Default.Crouch.Dive, 0.2)
                if not u11 then
                    return
                end
                Sounds.playRangedSoundEffect(Universal.RollingSFX, HumanoidRootPart, 60, 0.5, {min = 0.95, max = 1.05})
                if u29 == -1 then
                    u29 = useAnimatorObserver.getAnimationLength(u11)
                end
                local LookVector = HumanoidRootPart.CFrame.LookVector
                u31, u32, u33 = useNumberEasing(0)
                u32(90, TweenInfo.new(0.1))
                local u40 = nil
                u40 = RunService.RenderStepped:Connect(function(p1) -- Line: 1069 -- upvalues: u2 (upval), HumanoidRootPart (upval), LookVector (val), u40 (ref), onCrouchingCancelled (upval), u31 (val)
                    local v1 = RaycastParams.new()
                    v1.FilterType = Enum.RaycastFilterType.Exclude
                    v1.FilterDescendantsInstances = {u2}
                    local v2 = LookVector * 5
                    if workspace:Raycast(HumanoidRootPart.Position, v2, v1) then
                        u40:Disconnect()
                        return onCrouchingCancelled()
                    end
                    HumanoidRootPart.AssemblyLinearVelocity = LookVector * u31()
                end)
                Signals.Buff:Fire({id = "Dive", length = 5})
                task.delay(u29 - 0.15, function() -- Line: 1089 -- upvalues: u11 (val)
                    u11:Stop(0.15)
                end)
                task.delay(0.3, function() -- Line: 1094 -- upvalues: u32 (val)
                    u32(0, TweenInfo.new(0.3))
                end)
                task.delay(0.4, function() -- Line: 1099 -- upvalues: u40 (ref), u33 (val)
                    u40:Disconnect()
                    u33()
                end)
            end)()
        end
    end
end
local function onPostSimulation() -- Line: 1127 -- upvalues: Players (val), u466 (ref), u465 (ref), ClientStateHandler (val), States (val), u470 (ref), CollectionService (val)
    local Character = Players.LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return
    end
    if Character ~= u466 then
        u466 = Character
        u465 = HumanoidRootPart.AssemblyLinearVelocity
    end
    if ClientStateHandler.isStateBusy(States.SWIMMING) then
        u465 = HumanoidRootPart.AssemblyLinearVelocity
        return
    end
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    local v2 = {Character}
    v1.FilterDescendantsInstances = v2
    if HumanoidRootPart.Position.Y < -2000 then
        v2 = HumanoidRootPart.Position + Vector3.new(0, 5000, 0)
        local v3 = Vector3.new(0, -8000, 0)
        local v4 = workspace:Raycast(v2, v3, v1)
        if not v4 then
            HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 2000, 0))
            u470 = u470 + 1
        elseif v4.Position then
            HumanoidRootPart.CFrame = CFrame.new(v4.Position + Vector3.new(0, 2, 0))
            u470 = 0
        end
        if 2 <= u470 then
            local Tagged = CollectionService:GetTagged("Spawn")
            if 0 < #Tagged then
                HumanoidRootPart.CFrame = Tagged[math.random(1, #Tagged)].CFrame
                u470 = 0
            end
        end
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end
    if 2500 < (HumanoidRootPart.AssemblyLinearVelocity - u465).Magnitude or 2500 < HumanoidRootPart.AssemblyLinearVelocity.Magnitude then
        HumanoidRootPart.AssemblyLinearVelocity = u465
        return
    end
    u465 = HumanoidRootPart.AssemblyLinearVelocity
end
local function onBindKeypresses() -- Line: 1187 -- upvalues: remapShiftlockKeybind (val), Players (val), useWalkSpeed (val), useFieldOfView (val), useJumpPower (val), ClientAttributesHandler (val), Constants (val), ClientStateHandler (val), States (val), ClientSettingsHandler (val), UserInputService (val), onSlideStateChanged (val), ClientSettingsHandler_2 (val), onCrouchingRequestBegan (val)
    local u11, u14, u8
    remapShiftlockKeybind()
    Players.LocalPlayer.CameraMaxZoomDistance = 45
    local u5 = false
    _, u8 = useWalkSpeed()
    _, u11 = useFieldOfView()
    _, u14 = useJumpPower()
    local u15 = nil
    local u16 = nil
    local u17 = nil
    local u18 = nil
    local function resolveRunSpeedMultiplier(p1) -- Line: 1205 -- upvalues: ClientAttributesHandler (upval)
        local v1
        if typeof(p1) ~= "number" then
            local BasePlayerRunMultiplier = ClientAttributesHandler.getAttribute("BasePlayerRunMultiplier")
            if typeof(BasePlayerRunMultiplier) ~= "number" then
                v1 = p1
            elseif 0 >= BasePlayerRunMultiplier then
                v1 = p1
            else
                v1 = BasePlayerRunMultiplier
            end
        elseif p1 > 0 then
            v1 = p1
        end
        if typeof(v1) ~= "number" or v1 <= 0 then
            return 1.5
        end
        return v1
    end
    local function applySprintSpeed(p1) -- Line: 1220 -- upvalues: resolveRunSpeedMultiplier (val), u15 (ref), u8 (val)
        local v1 = resolveRunSpeedMultiplier(p1)
        u15 = u8("sprint", v1, "multiply", 5, TweenInfo.new(0.2))
    end
    ClientSettingsHandler.onKeybindPressed("Sprint"):Connect(function() -- Line: 1237 -- upvalues: Constants (upval), ClientStateHandler (upval), States (upval), ClientAttributesHandler (upval), u5 (ref), applySprintSpeed (val), u16 (ref), u11 (val)
        if game.PlaceId == Constants.Places.Lobby then
            return
        end
        local v1 = {
            States.GRAPPLING,
            States.LIMPING,
            States.BEING_CARRIED,
            States.FREECAM,
            States.POISONED,
        }
        if ClientStateHandler.isAnyStateBusy(v1) then
            return
        end
        if not (ClientStateHandler.isStateBusy(States.CARRYING)) then
            if u5 then
                return
            end
            u5 = true
            applySprintSpeed()
            u16 = u11("sprint", 20, "add", 5, TweenInfo.new(1))
            return
        end
        if ClientAttributesHandler.getAttribute("CanSprintWhileCarrying") == 0 or u5 then
            return
        end
        u5 = true
        applySprintSpeed()
        u16 = u11("sprint", 20, "add", 5, TweenInfo.new(1))
    end)
    ClientSettingsHandler.onKeybindReleased("Sprint"):Connect(function() -- Line: 1279 -- upvalues: u5 (ref), u15 (ref), u16 (ref)
        if not u5 then
            return
        end
        u5 = false
        u15()
        u16(TweenInfo.new(1))
    end)
    ClientAttributesHandler.onAttributeChanged("BasePlayerRunMultiplier"):Connect(function(p1) -- Line: 1225 -- upvalues: u5 (ref), applySprintSpeed (val)
        if not u5 then
            return
        end
        applySprintSpeed(p1)
    end)
    UserInputService.JumpRequest:Connect(function() -- Line: 1310 -- upvalues: Players (upval), u17 (ref), u14 (val)
        local Character = Players.LocalPlayer.Character
        if not Character then
            return
        end
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not Humanoid or Humanoid.JumpPower == 0 then
            return
        end
        task.wait(0.3)
        if Humanoid.JumpPower == 0 then
            return
        end
        u17 = u14("cooldown", 0, "set", 100)
        task.wait(2)
        if Humanoid.JumpPower == 0 then
            u17()
        end
    end)
    ClientStateHandler.onStateChanged(States.CARRYING):Connect(function(p1) -- Line: 1296 -- upvalues: ClientAttributesHandler (upval), u18 (ref), u8 (val)
        local CarrySpeedMultiplier = ClientAttributesHandler.getAttribute("CarrySpeedMultiplier")
        if not p1 then
            if not p1 and u18 then
                u18()
                u18 = nil
            end
            return
        end
        if not u18 then
            u18 = u8("carrying", CarrySpeedMultiplier, "multiply", 10)
            return
        end
        if not p1 and u18 then
            u18()
            u18 = nil
        end
    end)
    ClientStateHandler.onStateChanged(States.SLIDING):Connect(onSlideStateChanged)
    ClientSettingsHandler_2.onKeybindPressed("Crouch"):Connect(onCrouchingRequestBegan)
end
local function onCreateStationaryIdles() -- Line: 1366 -- upvalues: Players (val), u462 (val), ClientGearHandler (val), useAnimatorObserver (val), Default (val), RunService (val), ClientStateHandler (val), States (val), ClientSettingsHandler_2 (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return
    end
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local Humanoid = Character:WaitForChild("Humanoid")
    local u11 = nil
    local u12 = nil
    local u13 = 0
    local u14 = 120
    local u15 = false
    local u16 = false
    local function rollStationaryIdleDelay() -- Line: 1389 -- upvalues: u462 (upval)
        local Min = u462.Min
        return 120 + Min + (u462.Max - Min) * math.random()
    end
    local function onResetStationaryState() -- Line: 1398 -- upvalues: u16 (ref), u15 (ref), u13 (ref), u12 (ref), u11 (ref)
        u16 = false
        u15 = false
        u13 = 0
        if u12 then
            u12:Disconnect()
            u12 = nil
        end
        u11 = nil
    end
    local function onCancelStationaryIdling() -- Line: 1413 -- upvalues: u11 (ref), onResetStationaryState (val)
        local v1 = u11
        onResetStationaryState()
        if v1 and v1.IsPlaying then
            v1:Stop(0.2)
        end
    end
    local function onPlayStationaryIdle() -- Line: 1424 -- upvalues: u16 (ref), ClientGearHandler (upval), useAnimatorObserver (upval), Default (upval), u11 (ref), u12 (ref), onResetStationaryState (val)
        local u22
        if u16 then
            return
        end
        u16 = true
        local v1 = ClientGearHandler.getGearState()
        if not v1 then
            u22 = useAnimatorObserver.play(Default.Idles, 0.2)
        elseif not v1.enabled then
            u22 = useAnimatorObserver.play(Default.Idles, 0.2)
        elseif not v1.handles then
            u22 = useAnimatorObserver.play(Default.Idles, 0.2)
        else
            u22 = useAnimatorObserver.play(v1.getAnimations().Idles, 0.2)
        end
        u11 = u22
        if not u22 then
            u16 = false
        else
            u12 = u22.Stopped:Connect(function() -- Line: 1445 -- upvalues: u11 (upval), u22 (ref), onResetStationaryState (upval)
                if u11 ~= u22 then
                    return
                end
                onResetStationaryState()
            end)
        end
    end
    local u26 = RunService.RenderStepped:Connect(function(p1) -- Line: 1458 -- upvalues: HumanoidRootPart (val), Humanoid (val), ClientStateHandler (upval), States (upval), ClientSettingsHandler_2 (upval), u16 (ref), onCancelStationaryIdling (val), u15 (ref), u13 (ref), u14 (ref), rollStationaryIdleDelay (val), onPlayStationaryIdle (val)
        local v1 = HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 0.2
        local v2 = true
        local State = Humanoid:GetState()
        if State == Enum.HumanoidStateType.Running then
            v2 = ClientStateHandler.isAnyStateBusy({
                States.GRAPPLING,
                States.CARRYING,
                States.REFILLING,
                States.RAGDOLLED,
                States.NO_ITEM_EQUIPPING,
                States.WALL_HANGING,
                States.TOOL,
                States.SWIMMING,
            })
            if not v2 then
                v2 = ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE)
                if not v2 then
                    v2 = ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_GRAPPLING)
                end
            end
        end
        if not (ClientSettingsHandler_2.getSettingFromName("Play Stationary Animations")) then
            return
        end
        if v2 then
            if u16 then
                onCancelStationaryIdling()
            end
            return
        end
        if not v1 then
            if not v1 and u15 then
                u15 = false
            end
        elseif not u15 then
            u15 = true
            u13 = tick()
            u14 = rollStationaryIdleDelay()
        end
        if not v1 and u16 then
            onCancelStationaryIdling()
        end
        if u15 then
            local v3 = tick() - u13
            if u14 < v3 then
                onPlayStationaryIdle()
            end
        end
    end)
    return function() -- Line: 1510 -- upvalues: u26 (val), u12 (ref)
        if u26 then
            u26:Disconnect()
        end
        if u12 then
            u12:Disconnect()
            u12 = nil
        end
    end
end
local function onCreateBodyLeaning() -- Line: 1526 -- upvalues: Players (val), RunService (val), ClientStateHandler (val), States (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return
    end
    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
    if not Humanoid or Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
        return function() end
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Torso = Character:FindFirstChild("Torso")
    if not HumanoidRootPart or not Torso then
        return function() end
    end
    local RootJoint = HumanoidRootPart:FindFirstChild("RootJoint")
    local u24 = Torso:FindFirstChild("Left Hip")
    local u28 = Torso:FindFirstChild("Right Hip")
    if not RootJoint or not u24 or not u28 then
        return function() end
    end
    local u29 = nil
    local u30 = nil
    local u31 = 0
    local u32 = 0
    local C0 = RootJoint.C0
    local C0_2 = u24.C0
    local C0_3 = u28.C0
    local Scale = Character:GetScale()
    local LookVector = HumanoidRootPart.CFrame.LookVector
    local u41 = 0
    local u47 = RunService.RenderStepped:Connect(function(p1) -- Line: 1587 -- upvalues: ClientStateHandler (upval), States (upval), Character (val), Scale (ref), C0 (ref), C0_2 (ref), C0_3 (ref), u29 (ref), HumanoidRootPart (val), u30 (ref), u31 (ref), u32 (ref), LookVector (ref), u41 (ref), RootJoint (val), u24 (val), u28 (val)
        local Magnitude, v1, v2, v3
        if ClientStateHandler.isStateBusy(States.SWIMMING) then
            return
        end
        local Scale_2 = Character:GetScale()
        if Scale_2 ~= Scale and 0 < Scale then
            v2 = Scale_2 / Scale
            C0 = C0 - C0.Position + C0.Position * v2
            C0_2 = C0_2 - C0_2.Position + C0_2.Position * v2
            C0_3 = C0_3 - C0_3.Position + C0_3.Position * v2
            Scale = Scale_2
        end
        u29 = HumanoidRootPart.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
        if 2 >= u29.Magnitude then
            u31 = 0
            u32 = 0
        else
            u30 = u29.Unit
            u31 = HumanoidRootPart.CFrame.RightVector:Dot(u30)
            u32 = HumanoidRootPart.CFrame.LookVector:Dot(u30)
        end
        v2 = HumanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)
        local v4 = LookVector * Vector3.new(1, 0, 1)
        local v5 = 0
        if 0.01 < v2.Magnitude and 0.01 < v4.Magnitude and 0 < p1 then
            local v6
            local Unit = v2.Unit
            local Unit_2 = v4.Unit
            v3 = Unit_2:Cross(Unit)
            local v7 = Unit_2:Dot(Unit)
            local v8 = math.clamp(v7, -1, 1)
            Magnitude = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
            if Magnitude > 16 then
                v6 = 1 + (Magnitude - 16) * 0.03571428571428571
            else
                v6 = Magnitude / 16
            end
            v1 = math.deg(math.atan2(v3.Y, v8) / p1) * 4 / 90 * v6
            v5 = math.clamp(v1, -9, 9)
        end
        LookVector = HumanoidRootPart.CFrame.LookVector
        u41 = math.lerp(u41, v5, (math.clamp(p1 * 10, 0, 1)))
        v3 = p1 * 4
        v1 = math.rad(u32 * 10)
        local v9 = math.rad(-u31 * 10 + u41)
        local v10 = C0 * CFrame.Angles(v1, v9, (math.rad(u41)))
        RootJoint.C0 = RootJoint.C0:Lerp(v10, v3)
        v1 = math.rad(u31 * 10)
        v10 = C0_2 * CFrame.Angles(v1, 0, 0)
        u24.C0 = u24.C0:Lerp(v10, v3)
        v1 = math.rad(-u31 * 10)
        v10 = C0_3 * CFrame.Angles(v1, 0, 0)
        u28.C0 = u28.C0:Lerp(v10, v3)
    end)
    return function() -- Line: 1669 -- upvalues: u47 (val)
        if u47 then
            u47:Disconnect()
        end
    end
end
local function onAnimatePlayer() -- Line: 1680 -- upvalues: CollectionService (val), Players (val), useAnimatorObserver_2 (val), u469 (ref), useAnimatorObserver (val), Default (val), Statistics (val), useWalkSpeed (val), useJumpPower (val), ClientAttributesHandler (val), RunService (val), onHumanoidStateChanged (val), onCreateBodyLeaning (val), onCreateStationaryIdles (val)
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Focusable")
    InstanceAddedSignal:Connect(function(p1) -- Line: 1681 -- upvalues: Players (upval), CollectionService (upval)
        local Character = Players.LocalPlayer.Character
        if not Character then
            return
        end
        if p1:IsDescendantOf(Character) then
            CollectionService:RemoveTag(p1, "Focusable")
        end
    end)
    useAnimatorObserver_2(function(p1, p2) -- Line: 1692 -- upvalues: u469 (upval), useAnimatorObserver (upval), Default (upval), Statistics (upval), useWalkSpeed (upval), useJumpPower (upval), ClientAttributesHandler (upval), RunService (upval), onHumanoidStateChanged (upval), CollectionService (upval), onCreateBodyLeaning (upval), onCreateStationaryIdles (upval)
        local Humanoid, u45, v1
        if u469 then
            u469()
        end
        if workspace.CurrentCamera and not (workspace.CurrentCamera.CameraSubject:IsDescendantOf(workspace)) then
            task.spawn(function() -- Line: 1699 -- upvalues: p2 (val)
                local Humanoid = p2:WaitForChild("Humanoid")
                workspace.CurrentCamera.CameraSubject = Humanoid
                print("[Requiem] Resetting camera subject to character humanoid.")
            end)
        end
        u469 = useAnimatorObserver.bind(p1, Default, 1, nil, false)
        Statistics.Reset("jumppower", {"injured"})
        Statistics.Reset("walkspeed", {"injured"})
        _, v1 = useWalkSpeed()
        _, u45 = useJumpPower()
        local BasePlayerWalkSpeed = ClientAttributesHandler.getAttribute("BasePlayerWalkSpeed")
        v1("default", BasePlayerWalkSpeed or 16, "set", 1)
        local function syncJumpPower() -- Line: 1718 -- upvalues: ClientAttributesHandler (upval), u45 (val)
            local BasePlayerJumpHeight = ClientAttributesHandler.getAttribute("BasePlayerJumpHeight")
            local BasePlayerJumpMultiplier = ClientAttributesHandler.getAttribute("BasePlayerJumpMultiplier")
            u45("default", (BasePlayerJumpHeight or 50) * (BasePlayerJumpMultiplier or 1), "set", 1)
        end
        syncJumpPower()
        local u66 = ClientAttributesHandler.onAttributeChanged("BasePlayerJumpHeight"):Connect(syncJumpPower)
        local u74 = ClientAttributesHandler.onAttributeChanged("BasePlayerJumpMultiplier"):Connect(syncJumpPower)
        Humanoid = p2:WaitForChild("Humanoid")
        local u81 = nil
        local function setRagdollPhysics(p1) -- Line: 1734 -- upvalues: u81 (ref), Humanoid (val), RunService (upval)
            if u81 then
                u81:Disconnect()
                u81 = nil
            end
            if not p1 then
                Humanoid.PlatformStand = false
                Humanoid.AutoRotate = true
                return
            end
            Humanoid.PlatformStand = true
            Humanoid.AutoRotate = false
            u81 = RunService.RenderStepped:Connect(function() -- Line: 1744 -- upvalues: Humanoid (upval)
                Humanoid.PlatformStand = true
                Humanoid.AutoRotate = false
            end)
        end
        local AttributeChangedSignal = p2:GetAttributeChangedSignal("Ragdolled")
        local u91 = AttributeChangedSignal:Connect(function() -- Line: 1754 -- upvalues: setRagdollPhysics (val), p2 (val)
            local v1 = p2:GetAttribute("Ragdolled") == true
            setRagdollPhysics(v1)
        end)
        local v2 = p2:GetAttribute("Ragdolled") == true
        setRagdollPhysics(v2)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        local u112 = Humanoid.StateChanged:Connect(onHumanoidStateChanged)
        local HumanoidRootPart = p2:WaitForChild("HumanoidRootPart")
        CollectionService:RemoveTag(HumanoidRootPart, "Focusable")
        local u125 = onCreateBodyLeaning()
        local u127 = onCreateStationaryIdles()
        return function() -- Line: 1773 -- upvalues: u112 (val), u66 (val), u74 (val), u91 (ref), setRagdollPhysics (val), u125 (val), u127 (val)
            u112:Disconnect()
            u66:Disconnect()
            u74:Disconnect()
            if u91 then
                u91:Disconnect()
            end
            setRagdollPhysics(false)
            if u125 then
                u125()
            end
            if u127 then
                u127()
            end
        end
    end)
end
local v3 = coroutine.create(function() -- Line: 1808 -- upvalues: Players (val), u468 (val), u467 (val)
    local Character, PrimaryPart, v1
    local Position = Vector3.new()
    while task.wait(0.2) do
        Character = Players.LocalPlayer.Character
        if Character and Character.PrimaryPart then
            PrimaryPart = Character.PrimaryPart
            if (PrimaryPart.Position - Position).Magnitude >= 2 then
                Position = PrimaryPart.Position
                table.insert(u468, PrimaryPart.Position)
                v1 = #u468
                if 10 < v1 then
                    table.remove(u468, 1)
                end
                if #u467 ~= 0 then
                    for i, v in ipairs(u467) do
                        v(PrimaryPart.Position)
                    end
                end
            end
        end
    end
end)
coroutine.resume(v3)
;(function() -- Line: 1843 -- upvalues: State (val), onAnimatePlayer (val), onBindKeypresses (val), RunService (val), onPostSimulation (val), Players (val), Noclip (val)
    local loading, loading_3
    _, loading_3, loading = State("loading")
    local function onLoad(p1) -- Line: 1846 -- upvalues: onAnimatePlayer (upval), onBindKeypresses (upval)
        if p1 ~= false then
            return
        end
        onAnimatePlayer()
        onBindKeypresses()
    end
    if loading_3 == nil then
        loading(onLoad)
    elseif loading_3 ~= true then
        onLoad(false)
    else
        loading(onLoad)
    end
    RunService.PostSimulation:Connect(onPostSimulation)
    local AttributeChangedSignal = Players.LocalPlayer:GetAttributeChangedSignal("Noclip")
    AttributeChangedSignal:Connect(function() -- Line: 1863 -- upvalues: Players (upval), Noclip (upval)
        if Players.LocalPlayer:GetAttribute("Noclip") then
            Noclip:Enable()
            return
        end
        Noclip:Disable()
    end)
end)()
return {
    useMovementObserver = function(p1) -- Line: 1795 -- upvalues: u467 (val)
        table.insert(u467, p1)
        return function() -- Line: 1798 -- upvalues: u467 (upval), p1 (val)
            local v1 = table.find(u467, p1)
            if v1 then
                table.remove(u467, v1)
            end
        end
    end,
}