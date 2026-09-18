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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterMovementHandler
--                               Dumped in 0.00596 seconds
--                          Bytecode version 9  |  44 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local CustomBezier = require(Utilities:WaitForChild("CustomBezier"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local Shoulder = Utilities_3:WaitForChild("Shoulder")
local Camera = require(Shoulder:WaitForChild("Camera"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_4 = Common_8:WaitForChild("Utilities")
local Statistics = require(Utilities_4:WaitForChild("Statistics"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Observers_2 = Common_9:WaitForChild("Observers")
local useCharacterObserver = require(Observers_2:WaitForChild("useCharacterObserver"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics_2 = Common_10:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ClientShifterHealthHandler = require(v1.Parent:WaitForChild("ClientShifterHealthHandler"))
local ClientShifterPhysicsHandler = require(v1.Parent:WaitForChild("ClientShifterPhysicsHandler"))
local ClientShifterEffectHandler = require(v1.Parent:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
local u254 = {Forward = "rbxassetid://85755631710046", Backward = "rbxassetid://120798218943047", Left = "rbxassetid://106229012979795", Right = "rbxassetid://73816583325269"}
local u255 = {Forward = Vector3.new(0, 0, -1), Backward = Vector3.new(0, 0, 1), Left = Vector3.new(-1, 0, 0), Right = Vector3.new(1, 0, 0)}
local u276 = nil
local u277 = 0
local u278 = {}
local u279 = {}
local u280 = nil
local function onLoadIKController(p1) -- Line: 120 -- upvalues: Players (val), u278 (val), u279 (val), RunService (val)
    local UpperTorso = p1:FindFirstChild("UpperTorso")
    local Head = p1:FindFirstChild("Head")
    if not UpperTorso or not Head then
        return
    end
    if p1 ~= Players.LocalPlayer.Character then
        local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            HumanoidRootPart:AddTag("Ungrappleable")
            HumanoidRootPart.CollisionGroup = "TitanBoundaryBox"
        end
    end
    local IKControl = Instance.new("IKControl")
    IKControl.Type = Enum.IKControlType.LookAt
    IKControl.ChainRoot = UpperTorso
    IKControl.EndEffector = Head
    IKControl.SmoothTime = 0.175
    IKControl.Parent = p1:FindFirstChildWhichIsA("Humanoid")
    u278[p1] = Instance.new("Part")
    local v1 = u278[p1]
    v1.Name = "IKGoal"
    v1 = u278[p1]
    v1.Anchored = true
    v1 = u278[p1]
    v1.Transparency = 1
    v1 = u278[p1]
    v1.Color = Color3.fromRGB(255, 0, 0)
    v1 = u278[p1]
    v1.CanQuery = false
    v1 = u278[p1]
    v1.CanTouch = false
    v1 = u278[p1]
    v1.CanCollide = false
    v1 = u278[p1]
    v1.Size = Vector3.new(5, 5, 5)
    v1 = u278[p1]
    v1.Parent = workspace
    IKControl.Target = u278[p1]
    IKControl.Weight = 0.99
    IKControl.Enabled = true
    local u76 = nil
    local u77 = nil
    local u78 = nil
    local u79 = nil
    local function onCleanup() -- Line: 170 -- upvalues: u76 (ref), u77 (ref), u78 (ref), u79 (ref), u278 (upval), p1 (val), IKControl (val)
        if u76 then
            u76:Disconnect()
        end
        if u77 then
            u77:Disconnect()
        end
        if u78 then
            u78:Disconnect()
        end
        if u79 then
            u79:Disconnect()
        end
        u278[p1]:Destroy()
        u278[p1] = nil
        IKControl:Destroy()
    end
    u279[p1] = IKControl
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Disabled")
    local AttributeChangedSignal_2 = p1:GetAttributeChangedSignal("TemporarilyDisabled")
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("IKController")
InstanceAddedSignal:Connect(onLoadIKController)
for i, j in CollectionService:GetTagged("IKController") do
    onLoadIKController(j)
end
return {
    onLoadMovementController = function(p1) -- Line: 281 -- upvalues: u280 (ref), Statistics (val), useWalkSpeed (val), useCharacterObserver (val), useAnimatorObserver (val), u276 (ref), Camera (val), Player (val), Shifter (val), ClientShifterPhysicsHandler (val), UserInputService (val), ClientShifterHealthHandler (val), u277 (ref), Signals (val), CustomBezier (val), Character (val), Effects (val), Debris (val), u254 (val), u255 (val), ContextActionService (val), RunService (val)
        local u60
        local model = p1.model
        if model then
            model = p1.model:FindFirstChildWhichIsA("Humanoid")
        end
        if not model then
            return
        end
        u280 = p1.state
        if model then
            model:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            model:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
            model:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            model:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            model:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            model:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
            model:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
            model:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            model:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
        end
        Statistics.ClearAll()
        _, u60 = useWalkSpeed()
        u60("walking", p1.walkSpeed, "set", 2)
        useCharacterObserver.retriggerObservers()
        local u71 = false
        local u72 = false
        local u73 = false
        local u74 = nil
        local u75 = nil
        local u76 = 0
        local u77 = 0
        local u78 = nil
        local u79 = nil
        local u80 = nil
        local u81 = nil
        local u82 = 0
        local u83 = 0
        local u85 = -math.huge
        local u86 = false
        local u88 = -math.huge
        local u89 = {ShifterDashForward = "Forward", ShifterDashLeft = "Left", ShifterDashBackward = "Backward", ShifterDashRight = "Right"}
        local u90 = {ShifterDashForward = -math.huge, ShifterDashLeft = -math.huge, ShifterDashBackward = -math.huge, ShifterDashRight = -math.huge}
        local u99 = nil
        local function getWallClimbRoot() -- Line: 353 -- upvalues: p1 (val)
            if p1.root then
                return p1.root
            end
            if not p1.model then
                return nil
            end
            return (p1.model:FindFirstChild("HumanoidRootPart"))
        end
        local function isValidWallClimbHit(p1) -- Line: 370
            local Instance = p1.Instance
            if not Instance then
                return false
            end
            local Parent = Instance.Parent
            if not Parent then
                return false
            end
            local v1 = if Parent.Name == "Wall" then Parent:IsA("Model") else false
            return v1
        end
        local function getWallClimbMaxDistance(p1) -- Line: 386
            local v1 = 40
            if p1 then
                v1 = v1 + 5
            end
            return v1
        end
        local function canBeginWallClimb() -- Line: 398 -- upvalues: u77 (ref)
            local v1 = u77 <= tick()
            return v1
        end
        local function getWallClimbRaycastOrigin(p1) -- Line: 404 -- upvalues: u75 (ref)
            if not u75 then
                return p1.Position
            end
            local v1 = -u75
            if v1.Magnitude < 0.01 then
                return p1.Position
            end
            local v2 = math.min(23.8, 24)
            return p1.Position + v1.Unit * v2
        end
        local function isNearStoredWallPlane(p1) -- Line: 420 -- upvalues: u75 (ref), u74 (ref)
            if not u75 or not u74 then
                return false
            end
            local v1 = math.abs(((p1 - (u74 - u75 * 28)):Dot(u75))) <= 34
            return v1
        end
        local function getWallClimbRaycast() -- Line: 436 -- upvalues: getWallClimbRoot (val), p1 (val), getWallClimbRaycastOrigin (val), u75 (ref), isValidWallClimbHit (val)
            local v1
            local v2 = getWallClimbRoot()
            if not v2 or not p1.model then
                return nil
            end
            local v3 = RaycastParams.new()
            v3.FilterType = Enum.RaycastFilterType.Exclude
            v3.FilterDescendantsInstances = {p1.model}
            local v4 = getWallClimbRaycastOrigin(v2)
            local v5 = {}
            if u75 then
                local v6 = -u75
                if 0.01 < v6.Magnitude then
                    table.insert(v5, v6.Unit)
                end
            end
            local LookVector = v2.CFrame.LookVector
            if 0.01 < LookVector.Magnitude then
                table.insert(v5, LookVector.Unit)
            end
            local v7 = v5
            local v8 = nil
            local v9 = nil
            for i, j in v7, v8, v9 do
                v1 = workspace:Raycast(v4, j * 55, v3)
                if v1 and isValidWallClimbHit(v1) then
                    return v1
                end
            end
            return nil
        end
        local function playWallClimbAnimation(a1) -- Line: 477 -- upvalues: u79 (ref), p1 (val), u78 (ref), useAnimatorObserver (upval)
            local Climb
            if u79 == a1 then
                return
            end
            if a1 ~= "climb" then
                Climb = p1.animations.ClimbIdle
            else
                Climb = p1.animations.Climb
            end
            if not Climb then
                return
            end
            if u78 then
                u78:Stop(0.5)
                u78 = nil
            end
            local v1 = useAnimatorObserver.play(Climb, 0.5, Enum.AnimationPriority.Action)
            if v1 then
                v1.Looped = true
                u78 = v1
                u79 = a1
            end
        end
        local function onVerifyWallClimb(p1) -- Line: 504 -- upvalues: getWallClimbRoot (val), getWallClimbRaycast (val), u73 (ref), u76 (ref), u75 (ref), u74 (ref), isNearStoredWallPlane (val), isValidWallClimbHit (val), getWallClimbMaxDistance (val)
            local u2 = getWallClimbRoot()
            local v1 = getWallClimbRaycast()
            local function canUseRayMissGrace() -- Line: 508 -- upvalues: p1 (val), u73 (upval), u76 (upval), u75 (upval), u74 (upval), u2 (val), isNearStoredWallPlane (upval)
                local v1 = false
                if p1 == true then
                    v1 = u73
                    if v1 then
                        v1 = if u76 <= 8 then if u75 ~= nil then if u74 ~= nil then if u2 ~= nil then isNearStoredWallPlane(u2.Position) else false else false else false else false
                    end
                end
                return v1
            end
            if not v1 or not (isValidWallClimbHit(v1)) then
                return canUseRayMissGrace()
            end
            local v2 = v1.Distance < getWallClimbMaxDistance(p1)
            return v2
        end
        local function canWallClimb() -- Line: 533 -- upvalues: u280 (upval), p1 (val)
            if not u280 then
                return false
            end
            local hardening = u280.hardening
            if not hardening then
                hardening = p1.variant == "Armored"
            end
            return hardening
        end
        local function getWallClimbLookVector() -- Line: 543 -- upvalues: u75 (ref)
            if not u75 then
                return nil
            end
            local v1 = -u75
            local v2 = Vector3.new(v1.X, 0, v1.Z)
            if v2.Magnitude < 0.01 then
                return nil
            end
            return v2.Unit
        end
        local function onStopSprint() -- Line: 561 -- upvalues: u71 (ref), u85 (ref), u276 (upval)
            if not u71 then
                return
            end
            u71 = false
            u85 = tick()
            if u276 then
                u276(TweenInfo.new(2))
            end
        end
        local function onEndWallClimbing() -- Line: 578 -- upvalues: u73 (ref), u74 (ref), u75 (ref), u76 (ref), Camera (upval), Player (upval), Shifter (upval), u81 (ref), u78 (ref), u79 (ref), u80 (ref)
            if not u73 then
                return
            end
            u73 = false
            u74 = nil
            u75 = nil
            u76 = 0
            Camera.clearLookAtOverride()
            Player.Shifter.post(Shifter.Internal.EnableKinematics)
            if u81 then
                u81(TweenInfo.new(0.2))
                u81 = nil
            end
            if u78 then
                u78:Stop(0.5)
                u78 = nil
            end
            u79 = nil
            if u80 then
                u80:Destroy()
                u80 = nil
            end
        end
        local function onWallClimbVault(a1) -- Line: 615 -- upvalues: onEndWallClimbing (val), p1 (val), useAnimatorObserver (upval), ClientShifterPhysicsHandler (upval)
            local Unit
            local LookVector = a1.CFrame.LookVector
            local v1 = Vector3.new(LookVector.X, 0, LookVector.Z)
            if v1.Magnitude >= 0.01 then
                Unit = v1.Unit
            else
                Unit = Vector3.new(0, 0, -1)
            end
            local Unit_2 = (Vector3.yAxis * 1.35 + Unit * 0.65).Unit
            onEndWallClimbing()
            local Vault = p1.animations.Vault
            if Vault then
                useAnimatorObserver.play(Vault, 0.3, Enum.AnimationPriority.Action4)
            end
            a1.AssemblyLinearVelocity = Unit_2 * 400
            a1.AssemblyAngularVelocity = Vector3.zero
            local u44 = ClientShifterPhysicsHandler.onRunVelocity(p1, Unit_2, 400)
            task.delay(0.35, function() -- Line: 638 -- upvalues: u44 (val), a1 (val)
                if u44 then
                    u44()
                end
                if a1.Parent then
                    a1.AssemblyLinearVelocity = Vector3.zero
                end
            end)
        end
        local function onWallClimbPushOff() -- Line: 653 -- upvalues: getWallClimbRoot (val), u73 (ref), u75 (ref), u77 (ref), onEndWallClimbing (val), ClientShifterPhysicsHandler (upval), p1 (val)
            local Unit, v1
            local u1 = getWallClimbRoot()
            if not u1 or not u73 then
                return
            end
            if not u75 then
                local LookVector = u1.CFrame.LookVector
                v1 = Vector3.new(LookVector.X, 0, LookVector.Z)
                if v1.Magnitude >= 0.01 then
                    Unit = (-v1.Unit + Vector3.yAxis * 0.2).Unit
                else
                    Unit = Vector3.new(0, 0.45, 1).Unit
                end
            else
                local v2 = u75
                v1 = Vector3.new(v2.X, 0, v2.Z)
                if 0.01 >= v1.Magnitude then
                    Unit = (v2.Unit + Vector3.yAxis * 0.2).Unit
                else
                    Unit = (v1.Unit + Vector3.yAxis * 0.2).Unit
                end
            end
            u77 = tick() + 0.9
            onEndWallClimbing()
            u1.AssemblyLinearVelocity = Unit * 400
            u1.AssemblyAngularVelocity = Vector3.zero
            local u58 = ClientShifterPhysicsHandler.onRunVelocity(p1, Unit, 400)
            task.delay(0.28, function() -- Line: 687 -- upvalues: u58 (val), u1 (val)
                if u58 then
                    u58()
                end
                if u1.Parent then
                    u1.AssemblyLinearVelocity = Vector3.zero
                end
            end)
        end
        local function onHandleWallClimb(p1) -- Line: 703 -- upvalues: getWallClimbRoot (val), u74 (ref), getWallClimbRaycast (val), UserInputService (upval), isValidWallClimbHit (val), u76 (ref), u75 (ref), isNearStoredWallPlane (val), playWallClimbAnimation (val), u80 (ref), onWallClimbVault (val)
            local v1 = getWallClimbRoot()
            if not v1 then
                return false
            else
                local v2, v3
                if not u74 then
                    return false
                end
                local v4 = getWallClimbRaycast()
                local v5 = UserInputService:IsKeyDown(Enum.KeyCode.W)
                if not v4 then
                    u76 = u76 + 1
                    if u76 > 8 or not u75 or not u74 or not (isNearStoredWallPlane(v1.Position)) then
                        if v5 then
                            onWallClimbVault(v1)
                        end
                        return false
                    end
                    if not v5 then
                        v3 = "idle"
                    else
                        v3 = "climb"
                    end
                    playWallClimbAnimation(v3)
                    v2 = math.min(1, p1 * 10)
                    v3 = v1.Position:Lerp(u74, v2)
                    if u80 then
                        u80.Position = v3
                    end
                    return true
                elseif isValidWallClimbHit(v4) then
                    local v6
                    u76 = 0
                    u75 = v4.Normal
                    v2 = v4.Position + v4.Normal * 28
                    if v5 then
                        u74 = u74 + Vector3.yAxis * 30 * p1
                    end
                    if not v5 then
                        v6 = "idle"
                    else
                        v6 = "climb"
                    end
                    playWallClimbAnimation(v6)
                    u74 = Vector3.new(v2.X, u74.Y, v2.Z)
                    v3 = math.min(1, p1 * 10)
                    v6 = v1.Position:Lerp(u74, v3)
                    if u80 then
                        u80.Position = v6
                    end
                    return true
                end
            end
        end
        local function onBeginWallClimbing() -- Line: 768 -- upvalues: u73 (ref), u76 (ref), Camera (upval), getWallClimbLookVector (val), Player (upval), Shifter (upval), onStopSprint (val), u72 (ref), u276 (upval), u99 (ref), Statistics (upval), u81 (ref), u60 (val), UserInputService (upval), p1 (val), playWallClimbAnimation (val), getWallClimbRaycast (val), isValidWallClimbHit (val), u75 (ref), u74 (ref), getWallClimbRoot (val), u80 (ref)
            local v1
            if u73 then
                return
            end
            u73 = true
            u76 = 0
            Camera.setLookAtOverride(getWallClimbLookVector)
            Player.Shifter.post(Shifter.Internal.DisableKinematics)
            onStopSprint()
            if u72 then
                u72 = false
                if u276 then
                    u276(TweenInfo.new(0))
                    u276 = nil
                end
                if u99 then
                    u99()
                    u99 = nil
                end
            end
            if Statistics.Contains("walkspeed", "super_sprint") then
                Statistics.Remove("walkspeed", "super_sprint", TweenInfo.new(0))
            end
            u81 = u60("wall_climbing", 0, "set", 100, TweenInfo.new(0))
            local v2 = UserInputService:IsKeyDown(Enum.KeyCode.W)
            if p1.animations.ClimbIdle then
                if not v2 then
                    v1 = "idle"
                else
                    v1 = "climb"
                end
                playWallClimbAnimation(v1)
            elseif v2 and p1.animations.Climb then
                playWallClimbAnimation("climb")
            end
            local v3 = getWallClimbRaycast()
            if v3 and isValidWallClimbHit(v3) then
                u75 = v3.Normal
                u74 = v3.Position + v3.Normal * 28
            end
            v1 = getWallClimbRoot()
            if v1 then
                v1.AssemblyLinearVelocity = Vector3.zero
                v1.AssemblyAngularVelocity = Vector3.zero
                local BodyPosition = Instance.new("BodyPosition")
                BodyPosition.Name = "WallClimbPosition"
                BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                BodyPosition.P = 100000
                BodyPosition.D = 1000
                BodyPosition.Position = v1.Position
                BodyPosition.Parent = v1
                u80 = BodyPosition
            end
        end
        local function onHandleDash(a1, p2, p3) -- Line: 1044 -- upvalues: u73 (ref), u89 (val), u90 (val), u88 (ref), p1 (val), Signals (upval), useAnimatorObserver (upval), u254 (upval), Effects (upval), u255 (upval), ClientShifterPhysicsHandler (upval)
            if u73 then
                return Enum.ContextActionResult.Sink
            end
            local v1 = u89[a1]
            if not v1 or p2 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass
            end
            local v2 = tick()
            local v3 = u90[a1]
            if not v3 then
                v3 = -math.huge
            end
            u90[a1] = v2
            if 0.3 < v2 - v3 then
                return Enum.ContextActionResult.Pass
            end
            local v4 = v2 - u88
            if v4 < 3.5 or p1.state.stunned then
                return Enum.ContextActionResult.Pass
            end
            local v5 = {id = "Dash", length = 3.5}
            Signals.Buff:Fire(v5)
            u88 = v2
            v4 = useAnimatorObserver.play(u254[v1], 0.2)
            v4:AdjustSpeed(1.35)
            while true do
                task.wait()
                if v4.IsPlaying and 0 < v4.Length then
                    break
                end
            end
            task.delay(0.2, function() -- Line: 1089 -- upvalues: Effects (upval), p1 (upval)
                Effects.particle("ShifterDash", p1.root)
            end)
            local root = p1.root
            if not root then
                return Enum.ContextActionResult.Pass
            end
            v5 = u255[v1]
            local v6 = (root.CFrame * CFrame.new(v5.X * 100, 0, v5.Z * 100)).Position - root.Position
            if v6.Magnitude < 1e-05 then
                return Enum.ContextActionResult.Pass
            end
            local u85 = ClientShifterPhysicsHandler.onRunVelocity(p1, v6.Unit, 675)
            if not u85 then
                return Enum.ContextActionResult.Pass
            end
            task.delay(v4.Length * 0.7407407407407407 - 0.2, function() -- Line: 1114 -- upvalues: u85 (val), root (val)
                if u85 then
                    u85()
                end
                root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end)
            return Enum.ContextActionResult.Sink
        end
        local Value = Enum.ContextActionPriority.High.Value
        ContextActionService:BindActionAtPriority("ShifterSprint", function(a1, p2, p3) -- Line: 834 -- upvalues: u73 (ref), u72 (ref), ClientShifterHealthHandler (upval), p1 (val), Player (upval), Shifter (upval), u71 (ref), u276 (upval), u60 (val), onStopSprint (val)
            if u73 then
                return Enum.ContextActionResult.Sink
            end
            if p2 ~= Enum.UserInputState.Begin then
                if p2 == Enum.UserInputState.End then
                    onStopSprint()
                    Player.Shifter.post(Shifter.Internal.EnableKinematics)
                end
                return Enum.ContextActionResult.Sink
            end
            if u72 then
                return Enum.ContextActionResult.Sink
            end
            local v1 = ClientShifterHealthHandler.getCurrentSprintStamina(p1)
            if v1 <= 0 then
                return Enum.ContextActionResult.Sink
            end
            Player.Shifter.post(Shifter.Internal.DisableKinematics)
            u71 = true
            u276 = u60("sprint", p1.runSpeed, "set", 3, TweenInfo.new(2))
            return Enum.ContextActionResult.Sink
        end, false, Value, Enum.KeyCode.LeftShift)
        ContextActionService:BindActionAtPriority("ShifterJump", function(a1, p2, p3) -- Line: 861 -- upvalues: u73 (ref), onWallClimbPushOff (val), p1 (val), u72 (ref), u277 (upval), Signals (upval), CustomBezier (upval), useAnimatorObserver (upval), u60 (val), Character (upval), Effects (upval), Debris (upval), ClientShifterPhysicsHandler (upval)
            if u73 then
                if p2 == Enum.UserInputState.Begin then
                    onWallClimbPushOff()
                end
                return Enum.ContextActionResult.Sink
            end
            if p2 ~= Enum.UserInputState.Begin or not p1.movement.jump.active then
                return Enum.ContextActionResult.Pass
            end
            if u72 or p1.state.stunned then
                return Enum.ContextActionResult.Sink
            end
            local v1 = tick()
            local v2 = v1 - u277
            if v2 < p1.movement.jump.cooldown then
                return Enum.ContextActionResult.Sink
            end
            local model = p1.model
            if model then
                model = p1.model:FindFirstChild("HumanoidRootPart")
            end
            if not model then
                return Enum.ContextActionResult.Pass
            end
            Signals.Buff:Fire({id = "Jump", length = p1.movement.jump.cooldown})
            u277 = v1
            local v3 = {}
            local v4 = {strength = 1, point = model.Position}
            local v5 = {strength = 1}
            local v6 = p1.movement.jump.middle
            if not v6 then
                v6 = CFrame.new(0, 60, -100)
            end
            v5.point = (model.CFrame * v6).Position
            local v7 = {strength = 1}
            local v8 = p1.movement.jump.ending
            if not v8 then
                v8 = CFrame.new(0, 0, -200)
            end
            v7.point = (model.CFrame * v8).Position
            v3[1] = v4
            v3[2] = v5
            v3[3] = v7
            local u129 = CustomBezier.new(v3)
            local u130 = useAnimatorObserver.play(p1.animations.Jump)
            while true do
                task.wait()
                if u130.IsPlaying and 0 < u130.Length then
                    break
                end
            end
            local u119 = u60("jumping", p1.walkSpeed / 6, "set", 4)
            task.delay(0.2, function() -- Line: 929 -- upvalues: model (val), Character (upval), Effects (upval), Debris (upval), ClientShifterPhysicsHandler (upval), p1 (upval), u129 (val), u130 (val), u119 (val)
                local v1
                local u0 = {model.Parent}
                _, _, v1 = Character.isGrounded()
                if v1 and v1.Position then
                    Effects.particle("Launch", v1.Position, model.Parent)
                end
                Debris.circle(model.Position, 30, 5, 30, 0.3, u0, true)
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u129, u130.Length - 0.6)
                task.delay(u130.Length - 0.4, function() -- Line: 946 -- upvalues: p1 (upval), Debris (upval), model (upval), u0 (val)
                    local v1 = p1.movement.jump.rings or 3
                    local v2 = 1
                    for i = 1, v1, v2 do
                        Debris.circle(model.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, u0, true)
                    end
                end)
                task.wait(u130.Length - 0.4)
                u130:Stop(u130.Length - u130.TimePosition)
                u119()
            end)
            return Enum.ContextActionResult.Sink
        end, false, Value, Enum.KeyCode.Space)
        ContextActionService:BindActionAtPriority("ShifterDashForward", onHandleDash, false, Value, Enum.KeyCode.W)
        ContextActionService:BindActionAtPriority("ShifterDashLeft", onHandleDash, false, Value, Enum.KeyCode.A)
        ContextActionService:BindActionAtPriority("ShifterDashBackward", onHandleDash, false, Value, Enum.KeyCode.S)
        ContextActionService:BindActionAtPriority("ShifterDashRight", onHandleDash, false, Value, Enum.KeyCode.D)
        ContextActionService:BindActionAtPriority("ShifterCrouch", function(a1, p2, p3) -- Line: 972 -- upvalues: u73 (ref), p1 (val), u71 (ref), u72 (ref), u276 (upval), u60 (val), Statistics (upval), u99 (ref), useAnimatorObserver (upval)
            if u73 then
                return Enum.ContextActionResult.Sink
            end
            if not p1.animations.CrouchIdle then
                return Enum.ContextActionResult.Pass
            end
            if p2 ~= Enum.UserInputState.Begin then
                if p2 == Enum.UserInputState.End then
                    u72 = false
                    if u276 then
                        u276(TweenInfo.new(2))
                    end
                    if u99 then
                        u99()
                        u99 = nil
                    end
                end
                return Enum.ContextActionResult.Sink
            end
            if u71 then
                return Enum.ContextActionResult.Sink
            end
            local model = p1.model
            local Humanoid = model
            if Humanoid then
                Humanoid = model:FindFirstChildWhichIsA("Humanoid")
            end
            if not Humanoid then
                return Enum.ContextActionResult.Pass
            end
            local Animator = Humanoid
            if Animator then
                Animator = Humanoid:FindFirstChild("Animator")
            end
            if not Animator then
                return Enum.ContextActionResult.Pass
            end
            u72 = true
            u276 = u60("crouching", p1.walkSpeed / 2, "set", 3, TweenInfo.new(2))
            if Statistics.Contains("walkspeed", "super_sprint") then
                Statistics.Remove("walkspeed", "super_sprint", TweenInfo.new(2))
            end
            u99 = useAnimatorObserver.bind(Animator, {Idle = p1.animations.CrouchIdle, Walk = p1.animations.CrouchWalk}, 4, nil, true)
            return Enum.ContextActionResult.Sink
        end, false, Value, Enum.KeyCode.LeftControl)
        local v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 1147 -- upvalues: p1 (val), u82 (ref), u71 (ref), ClientShifterHealthHandler (upval), u86 (ref), Player (upval)
            local v1, v2, v3
            local v4 = p1.staminaDecayRate or 0
            if v4 <= 0 then
                return
            end
            u82 = u82 + a1
            while 1 <= u82 do
                u82 = u82 - 1
                v1 = if u71 then p1.staminaSprintMultiplier or 1 else 1
                v2 = v4 * math.max(v1, 0)
                if 0 < v2 then
                    ClientShifterHealthHandler.onReduceStamina(p1, v2)
                end
                v3 = ClientShifterHealthHandler.getCurrentStamina(p1)
                if v3 <= 0 and not u86 then
                    u86 = true
                    Player.Transform.post({action = "Detransform"})
                end
            end
        end)
        p1.trove:Add(function() -- Line: 1179 -- upvalues: onEndWallClimbing (val), ContextActionService (upval), Statistics (upval), useCharacterObserver (upval)
            onEndWallClimbing()
            ContextActionService:UnbindAction("ShifterSprint")
            ContextActionService:UnbindAction("ShifterJump")
            ContextActionService:UnbindAction("ShifterCrouch")
            Statistics.ClearAll()
            useCharacterObserver.retriggerObservers()
        end)
        p1.trove:Add(v1)
        local v2 = RunService.Heartbeat:Connect(function(a1) -- Line: 1197 -- upvalues: p1 (val), u83 (ref), u71 (ref), ClientShifterHealthHandler (upval), onStopSprint (val), u85 (ref)
            local v1
            local maxSprintStamina = p1.maxSprintStamina
            if maxSprintStamina <= 0 then
                return
            end
            u83 = u83 + a1
            while 1 <= u83 do
                u83 = u83 - 1
                if not u71 then
                    v1 = tick() - u85
                    if v1 >= 5 and maxSprintStamina > ClientShifterHealthHandler.getCurrentSprintStamina(p1) then
                        ClientShifterHealthHandler.onRestoreSprintStamina(p1, 1.75)
                    end
                else
                    ClientShifterHealthHandler.onReduceSprintStamina(p1, 1)
                    v1 = ClientShifterHealthHandler.getCurrentSprintStamina(p1)
                    if v1 <= 0 then
                        onStopSprint()
                    end
                end
            end
        end)
        p1.trove:Add(v2)
        local u213 = false
        local u218 = Vector3.new(0, 0, 0)
        local huge = math.huge
        local CurrentCamera = workspace.CurrentCamera
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.MaxTorque = Vector3.new(math.huge, 0, math.huge)
        BodyGyro.P = 99999999
        BodyGyro.D = 500
        BodyGyro.CFrame = CFrame.new()
        BodyGyro.Name = "Stabilizer"
        BodyGyro.Parent = p1.root
        u280 = p1.state
        local v3 = RunService.RenderStepped:Connect(function(a1) -- Line: 1258 -- upvalues: u73 (ref), onHandleWallClimb (val), canWallClimb (val), onVerifyWallClimb (val), onEndWallClimbing (val), p1 (val), getWallClimbLookVector (val), BodyGyro (val), canBeginWallClimb (val), onBeginWallClimbing (val), model (val), u213 (ref), CurrentCamera (val), u218 (ref), huge (ref), Player (upval), Shifter (upval)
            local v1, v2
            if u73 then
                local v3 = onHandleWallClimb(a1)
                v1 = canWallClimb()
                if v1 then
                    v1 = onVerifyWallClimb(true)
                end
                if not v3 or not v1 then
                    onEndWallClimbing()
                    return
                end
                local root = p1.root
                if root and root.Parent then
                    local Unit
                    v2 = getWallClimbLookVector()
                    if not v2 then
                        local LookVector = root.CFrame.LookVector
                        local v4 = Vector3.new(LookVector.X, 0, LookVector.Z)
                        if v4.Magnitude >= 0.01 then
                            Unit = v4.Unit
                        else
                            Unit = Vector3.new(0, 0, -1)
                        end
                    else
                        Unit = v2
                    end
                    BodyGyro.CFrame = CFrame.lookAt(root.Position, root.Position + Unit)
                end
                return
            end
            if not (canWallClimb()) then
                local root_2 = p1.root
                if root_2 and root_2.Parent then
                    local Unit_2
                    local AssemblyLinearVelocity = root_2.AssemblyLinearVelocity
                    if 1500 < AssemblyLinearVelocity.Magnitude then
                        root_2.AssemblyLinearVelocity = AssemblyLinearVelocity.Unit * 1500
                    end
                    local State = model:GetState()
                    if State == Enum.HumanoidStateType.FallingDown then
                        model:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    end
                    local LookVector_2 = root_2.CFrame.LookVector
                    v2 = Vector3.new(LookVector_2.X, 0, LookVector_2.Z)
                    if v2.Magnitude >= 0.01 then
                        Unit_2 = v2.Unit
                    else
                        Unit_2 = Vector3.new(0, 0, -1)
                    end
                    BodyGyro.CFrame = CFrame.lookAt(root_2.Position, root_2.Position + Unit_2)
                end
                if u213 then
                    return
                end
                v1 = CurrentCamera.CFrame.lookVector:Dot(u218)
                if 0.99 < v1 then
                    return
                end
                local function onInformServer() -- Line: 1330 -- upvalues: huge (upval), u218 (upval), CurrentCamera (upval), Player (upval), Shifter (upval)
                    huge = tick()
                    u218 = CurrentCamera.CFrame.lookVector
                    Player.Shifter.post(Shifter.Effects.LookVector, u218)
                end
                local v5 = tick() - huge
                if v5 <= 0 or 0.1 < v5 then
                    onInformServer()
                    return
                end
                u213 = true
                task.wait(0.1 - v5)
                u213 = false
                onInformServer()
                return
            elseif canBeginWallClimb() and onVerifyWallClimb(false) then
                onBeginWallClimbing()
                onHandleWallClimb(a1)
                return
            end
        end)
        p1.trove:Add(v3)
    end,
    onDisableIKController = function(p1) -- Line: 247 -- upvalues: u279 (val)
        local v1 = u279[p1]
        if not v1 then
            warn("No IK controller found for model: " .. p1.Name)
            return
        end
        warn("Disabling IK controller for model: " .. p1.Name)
        v1.Enabled = false
    end,
    onEnableIKController = function(p1) -- Line: 264 -- upvalues: u279 (val)
        local v1 = u279[p1]
        if not v1 then
            warn("No IK controller found for model: " .. p1.Name)
            return
        end
        warn("Enabling IK controller for model: " .. p1.Name)
        v1.Enabled = true
    end,
    onUpdateStates = function(p1) -- Line: 111 -- upvalues: u280 (ref)
        u280 = p1
    end,
}