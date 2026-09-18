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
--     File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Housing.Default
--                               Dumped in 0.00241 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
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
local Config = require(Common_4:WaitForChild("Config"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_2:WaitForChild("useNumberEasing"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Gear_2 = require(Common_7:WaitForChild("Logger"))("Gear")
local v2 = {
    GROUND_DISTANCE_THRESHOLD = 10,
    WALL_BELOW_RAYCAST_DISTANCE = 5,
    WALL_GRID_X_MIN = -2,
    WALL_GRID_X_MAX = 2,
    WALL_GRID_Y_MIN = 0,
    WALL_GRID_Y_MAX = 10,
    WALL_GRID_Y_STEP = 2,
    WALL_GRID_OFFSET_SCALE = 1.5,
    WALL_FORWARD_RAYCAST_DISTANCE = 10,
    WALL_FLAT_DOT_THRESHOLD = 0.2,
    MIN_SUCCESSFUL_WALL_POINTS = 20,
    MAX_WALL_DISTANCE = 5,
    STOP_ANIMATION_EASING = 0.2,
    KICKFLIP_ANIMATION_EASING = 0.2,
    WALLRUN_ANIMATION_EASING = 0.2,
    KICKFLIP_POWER_MULTIPLIER = 1.5,
    KICKFLIP_MIN_POWER = 120,
    DETACH_COOLDOWN = 1,
    WALLRUN_FORWARD_OFFSET = -3,
    WALLRUN_INITIAL_PUSH = -10,
    WALLRUN_ORIENTATION_X_DEGREES = 90,
    VELOCITY_MAX_FORCE = 50000,
    GYRO_MAX_TORQUE = 500000,
    INITIAL_GYRO_D = 500,
    EASE_IN_DURATION = 0.3,
    EASE_IN_P = 5000,
    EASE_IN_GYRO_D = 100,
    INITIAL_SPEED_MULTIPLIER = 1.5,
    MAX_WALLRUN_SPEED = 130,
    FORWARD_BASE_SPEED_OFFSET = 20,
    WALL_CHECK_DELAY = 0.25,
    SLOWDOWN_START_DELAY = 0.3,
    SLOWDOWN_DURATION = 3,
    MIN_CONTINUE_SPEED = 30,
    MIN_ENTRY_SPEED = 40,
}
local u235 = Config.define(v2)
local v3 = {}
function v3.initialized(p1, p2) -- Line: 83 -- upvalues: Character (val), Gear_2 (val), u235 (val), ClientStateHandler (val), States (val), useAnimatorObserver (val), Gear (val), TweenService (val), useNumberEasing (val), RunService (val), UserInputService (val), ClientAttributesHandler (val)
    local onSoftCheckKeybindHeld
    local trove = p2.trove
    local u5 = Character.getCharacter()
    if not u5 then
        Gear_2.warn("No character found while on housing initialized")
        return
    end
    local Humanoid = u5:WaitForChild("Humanoid")
    local HumanoidRootPart = u5.HumanoidRootPart
    local Part = Instance.new("Part")
    Part.Size = Vector3.new(1, 1, 1)
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Transparency = 1
    Part.Anchored = true
    Part.Shape = Enum.PartType.Ball
    Part.Color = Color3.fromRGB(255, 0, 0)
    local u34 = false
    local u36 = tick()
    local u37 = nil
    local u38 = nil
    local u39 = nil
    local u40 = nil
    local u41 = nil
    local u42 = nil
    local function onCheckGroundDistance() -- Line: 117 -- upvalues: Character (upval), u235 (upval)
        local v1
        _, v1 = Character.isGrounded()
        local v2 = not v1
        if not v2 then
            v2 = u235.GROUND_DISTANCE_THRESHOLD < v1
        end
        return v2
    end
    local function onCheckForWallBelow() -- Line: 122 -- upvalues: u5 (val), HumanoidRootPart (val), u235 (upval)
        local v1 = RaycastParams.new()
        v1.FilterType = Enum.RaycastFilterType.Exclude
        v1.FilterDescendantsInstances = {u5}
        return workspace:Raycast(HumanoidRootPart.Position, -HumanoidRootPart.CFrame.UpVector * u235.WALL_BELOW_RAYCAST_DISTANCE, v1)
    end
    local function onCheckForWallInfront() -- Line: 131 -- upvalues: HumanoidRootPart (val), u5 (val), u235 (upval)
        local WALL_GRID_Y_MAX, WALL_GRID_Y_STEP, v1, v2, v3
        local v4 = workspace.CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1)
        local Unit = ((v4 + HumanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)) / 2).Unit
        local Position = HumanoidRootPart.Position
        local v5 = RaycastParams.new()
        v5.FilterType = Enum.RaycastFilterType.Exclude
        v5.FilterDescendantsInstances = {u5}
        local v6 = 0
        local v7 = -1
        local v8 = Vector3.new(0, 0, 0)
        local v9 = Vector3.new(0, 0, 0)
        local WALL_GRID_X_MAX = u235.WALL_GRID_X_MAX
        local v10 = 1
        for i = u235.WALL_GRID_X_MIN, WALL_GRID_X_MAX, v10 do
            WALL_GRID_Y_MAX = u235.WALL_GRID_Y_MAX
            WALL_GRID_Y_STEP = u235.WALL_GRID_Y_STEP
            for j = u235.WALL_GRID_Y_MIN, WALL_GRID_Y_MAX, WALL_GRID_Y_STEP do
                v2 = CFrame.new(Position, Position + Unit)
                v1 = v2 * CFrame.new(i * u235.WALL_GRID_OFFSET_SCALE, j * u235.WALL_GRID_OFFSET_SCALE, 0)
                v2 = workspace:Raycast(v1.Position, v1.LookVector * u235.WALL_FORWARD_RAYCAST_DISTANCE, v5)
                if v2 and v2.Normal then
                    v3 = v2.Normal:Dot(Vector3.yAxis)
                    if v3 < u235.WALL_FLAT_DOT_THRESHOLD and -u235.WALL_FLAT_DOT_THRESHOLD < v3 then
                        v6 = v6 + 1
                        v7 = math.max(v7, v2.Distance)
                        v8 = v8 + v2.Normal
                        v9 = v9 + v2.Position
                    end
                end
            end
        end
        local v11 = if u235.MIN_SUCCESSFUL_WALL_POINTS <= v6 then v7 < u235.MAX_WALL_DISTANCE else false
        return v11, v9 / v6, v8 / v6
    end
    local function onCreatePhysicInstances() -- Line: 185 -- upvalues: u235 (upval), HumanoidRootPart (val)
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(u235.VELOCITY_MAX_FORCE, u235.VELOCITY_MAX_FORCE, u235.VELOCITY_MAX_FORCE)
        BodyVelocity.P = 0
        BodyVelocity.Parent = HumanoidRootPart
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.MaxTorque = Vector3.new(u235.GYRO_MAX_TORQUE, u235.GYRO_MAX_TORQUE, u235.GYRO_MAX_TORQUE)
        BodyGyro.P = 0
        BodyGyro.D = u235.INITIAL_GYRO_D
        BodyGyro.Parent = HumanoidRootPart
        return BodyVelocity, BodyGyro
    end
    local function onStopWallRunning(p1) -- Line: 201 -- upvalues: ClientStateHandler (upval), States (upval), p2 (val), u38 (ref), u39 (ref), u40 (ref), u37 (ref), u235 (upval), useAnimatorObserver (upval), Gear (upval), HumanoidRootPart (val), u42 (ref), Character (upval), Humanoid (val), u36 (ref)
        ClientStateHandler.updateState(States.WALL_SLIDING, false)
        p2.wall_sliding = false
        if u38 and u39 and u40 and u37 then
            u38:Destroy()
            u39:Destroy()
            u40:Disconnect()
            u37:Stop(u235.STOP_ANIMATION_EASING)
        end
        if p1 then
            p2.animation = useAnimatorObserver.play(Gear.WallrunKickflip, u235.KICKFLIP_ANIMATION_EASING)
            local v1 = math.max(HumanoidRootPart.AssemblyLinearVelocity.Magnitude * u235.KICKFLIP_POWER_MULTIPLIER, u235.KICKFLIP_MIN_POWER)
            HumanoidRootPart.AssemblyLinearVelocity = (HumanoidRootPart.CFrame.UpVector + Vector3.new(0, 1, 0)).Unit * v1
        end
        if u42 then
            u42()
            u42 = nil
        end
        if not (Character.isRagdolled()) then
            Humanoid.PlatformStand = false
            Humanoid.AutoRotate = true
        end
        u36 = tick()
    end
    local function onStopHeldKeybind() -- Line: 239 -- upvalues: u41 (ref)
        if u41 then
            u41:Disconnect()
            u41 = nil
        end
    end
    local function onStartWallRunning(p1, a2) -- Line: 246 -- upvalues: u36 (ref), u235 (upval), trove (val), Character (upval), ClientStateHandler (upval), States (upval), Part (val), p2 (val), Humanoid (val), u38 (ref), u39 (ref), onCreatePhysicInstances (val), TweenService (upval), HumanoidRootPart (val), useNumberEasing (upval), u42 (ref), u37 (ref), useAnimatorObserver (upval), Gear (upval), u40 (ref), RunService (upval), onStopWallRunning (val), onCheckForWallBelow (val), UserInputService (upval)
        local u115, u116, v1
        local v2 = tick() - u36
        if v2 < u235.DETACH_COOLDOWN or trove._cleaning or not (Character.isActive()) or ClientStateHandler.isStateBusy(States.SWIMMING) then
            return
        end
        local v3 = CFrame.new(p1, p1 + a2)
        local v4 = v3 * CFrame.new(0, 0, u235.WALLRUN_FORWARD_OFFSET)
        local v5 = math.rad(u235.WALLRUN_ORIENTATION_X_DEGREES)
        Part.CFrame = v4 * CFrame.Angles(v5, 0, 0)
        v2 = Part
        v2.CFrame = v2.CFrame * CFrame.new(0, 0, u235.WALLRUN_INITIAL_PUSH)
        Part.Parent = workspace
        ClientStateHandler.updateState(States.WALL_SLIDING, true)
        p2.wall_sliding = true
        Humanoid.PlatformStand = true
        Humanoid.AutoRotate = false
        Humanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding)
        v2, v1 = onCreatePhysicInstances()
        u38 = v2
        u39 = v1
        v3 = TweenInfo.new(u235.EASE_IN_DURATION)
        TweenService:Create(u38, v3, {P = u235.EASE_IN_P}):Play()
        v3 = TweenInfo.new(u235.EASE_IN_DURATION)
        v5 = {P = u235.EASE_IN_P, D = u235.EASE_IN_GYRO_D}
        TweenService:Create(u39, v3, v5):Play()
        v1 = HumanoidRootPart.AssemblyLinearVelocity.Magnitude * u235.INITIAL_SPEED_MULTIPLIER
        v2 = math.clamp(v1, 0, u235.MAX_WALLRUN_SPEED)
        u115, u116, v3 = useNumberEasing(v2)
        u42 = v3
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        if p2.animation then
            p2.animation:Stop(u235.STOP_ANIMATION_EASING)
        end
        u37 = useAnimatorObserver.play(Gear.Wallrun, u235.WALLRUN_ANIMATION_EASING)
        p2.animation = u37
        local u143 = tick()
        local u144 = false
        u40 = RunService.RenderStepped:Connect(function(p1) -- Line: 310 -- upvalues: ClientStateHandler (upval), States (upval), onStopWallRunning (upval), Part (upval), u115 (val), u235 (upval), HumanoidRootPart (upval), u38 (upval), u39 (upval), a2 (val), onCheckForWallBelow (upval), u143 (val), u144 (ref), TweenService (upval), u116 (val), UserInputService (upval)
            if ClientStateHandler.isStateBusy(States.SWIMMING) then
                return onStopWallRunning()
            end
            local v1 = Part
            v1.CFrame = v1.CFrame * CFrame.new(0, 0, -(u115() + u235.FORWARD_BASE_SPEED_OFFSET) * p1)
            u38.Velocity = (Part.Position - HumanoidRootPart.Position).Unit * u115()
            u39.CFrame = CFrame.lookAt(HumanoidRootPart.Position, Part.Position, a2)
            local v2 = tick() - u143
            if u235.WALL_CHECK_DELAY >= v2 then
                v2 = tick() - u143
                if u235.SLOWDOWN_START_DELAY < v2 and not u144 then
                    u144 = true
                    local v3 = TweenInfo.new(u235.SLOWDOWN_DURATION)
                    TweenService:Create(u38, v3, {P = 0}):Play()
                    u116(0, TweenInfo.new(u235.SLOWDOWN_DURATION))
                end
                if u115() < u235.MIN_CONTINUE_SPEED or not (UserInputService:IsKeyDown(Enum.KeyCode.Space)) then
                    return onStopWallRunning(true)
                end
                return
            elseif not (onCheckForWallBelow()) then
                return onStopWallRunning()
            end
        end)
        trove:Add(u40)
    end
    function onSoftCheckKeybindHeld() -- Line: 350 -- upvalues: ClientAttributesHandler (upval), UserInputService (upval), p2 (val), ClientStateHandler (upval), States (upval), onStopHeldKeybind (val), u41 (ref), RunService (upval), onSoftCheckKeybindHeld (val), u34 (ref), onCheckGroundDistance (val), HumanoidRootPart (val), u235 (upval), onCheckForWallInfront (val), onStartWallRunning (val)
        local v1, v2, v3
        if ClientAttributesHandler.getAttribute("GearCanWallrun") == 0 then
            return
        end
        local u8 = UserInputService:IsKeyDown(Enum.KeyCode.Space)
        local v4 = p2.busy()
        if not v4 then
            v4 = ClientStateHandler.isStateBusy(States.WALL_SLIDING)
            if not v4 then
                v4 = ClientStateHandler.isStateBusy(States.SLIDING)
                if not v4 then
                    v4 = ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE)
                    if not v4 then
                        v4 = ClientStateHandler.isStateBusy(States.SWIMMING)
                    end
                end
            end
        end
        local function onFailedAttempt() -- Line: 365 -- upvalues: u8 (val), onStopHeldKeybind (upval), u41 (upval), RunService (upval), onSoftCheckKeybindHeld (upval)
            if not u8 then
                onStopHeldKeybind()
                return
            end
            if u8 and not u41 then
                u41 = RunService.RenderStepped:Connect(onSoftCheckKeybindHeld)
            end
        end
        if ClientStateHandler.isStateBusy(States.SWIMMING) then
            return onFailedAttempt()
        end
        if not u8 or not u34 or not (onCheckGroundDistance()) or v4 then
            onFailedAttempt()
            return
        end
        if u235.MIN_ENTRY_SPEED >= HumanoidRootPart.AssemblyLinearVelocity.Magnitude then
            return onFailedAttempt()
        end
        v1, v2, v3 = onCheckForWallInfront()
        if not v1 then
            return onFailedAttempt()
        end
        onStopHeldKeybind()
        onStartWallRunning(v2, v3)
    end
    trove:Add(Humanoid.StateChanged:Connect(function(p1, p2) -- Line: 397 -- upvalues: u34 (ref), onSoftCheckKeybindHeld (val)
        local v1 = p2 == Enum.HumanoidStateType.Freefall
        u34 = v1
        if u34 then
            onSoftCheckKeybindHeld()
        end
    end))
    trove:Add(UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 407 -- upvalues: onSoftCheckKeybindHeld (val)
        if p2 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Space then
            onSoftCheckKeybindHeld()
        end
    end))
    trove:Add(UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 417 -- upvalues: u41 (ref), onStopHeldKeybind (val)
        if p2 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Space and u41 then
            onStopHeldKeybind()
        end
    end))
end
return v3