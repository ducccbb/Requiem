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
--    File: ReplicatedStorage.Client.User.Equipment.Gear.Specials.ClientParrySpecials
--                               Dumped in 0.00203 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common_2:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear_2 = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ClientGearHandler = require(v1.Parent.Parent:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression_2:WaitForChild("ClientAttributesHandler"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local State_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_8:WaitForChild("Common")
local Effects_2 = Common_5:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_10:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Gear = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_11:WaitForChild("Common")
local Sounds_3 = Common_8:WaitForChild("Sounds")
local Universal = require(Sounds_3:WaitForChild("Universal"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_12:WaitForChild("Common")
local Signals = require(Common_9:WaitForChild("Signals"))
local v3 = {
    SHAKE_FADE_IN_TIME = 0.1,
    SHAKE_FADE_OUT_TIME = 0.3,
    SHAKE_FREQUENCY = 0.1,
    SHAKE_AMPLITUDE = 3,
    SHAKE_ROTATION_INFLUENCE = 0.03,
    CONCUSSED_DURATION = 0.6,
    OPPONENT_FORWARD_OFFSET = 10,
    OPPONENT_UPWARD_OFFSET = 8,
    BACKWARDS_PUSH = -40,
    MOVEMENT_DIRECTION_SCALE = 0.7,
    MOVEMENT_DIRECTION_CAP = 250,
    VECTOR_OFFSET_DOWNWARD = -60,
    MIN_STARTING_SPEED_FOR_STUN_PULL = 20,
    BODY_POSITION_P = 500,
    BODY_POSITION_D = 600,
    BODY_GYRO_P = 1000,
    BODY_GYRO_D = 20,
    CLEANUP_DELAY = 1.8,
    PARRY_STUN_FAILSAFE = 2.5,
    EXIT_VELOCITY_XZ_DAMPEN = 0.5,
    EXIT_VELOCITY_Y_DAMPEN = 0.2,
    EXIT_VELOCITY_UP_BOOST = 40,
    INDICATOR_LIFETIME = 3,
    PARRY_SOUND_VOLUME = 0.1,
    PARRY_SOUND_SPEED = 0.7,
    SOUND_ROLLOFF = 5,
}
local u280 = Config.define(v3)
local u282 = trove.new()
local u283 = 0
local function isFiniteNumber(p1) -- Line: 98
    if p1 ~= p1 then
        return false
    end
    local v1 = if p1 ~= math.huge then p1 ~= -math.huge else false
    return v1
end
local function isFiniteVector3(p1) -- Line: 112 -- upvalues: isFiniteNumber (val)
    local v1 = isFiniteNumber(p1.X)
    if v1 then
        v1 = isFiniteNumber(p1.Y)
        if v1 then
            v1 = isFiniteNumber(p1.Z)
        end
    end
    return v1
end
local function safeUnit(p1) -- Line: 121 -- upvalues: isFiniteNumber (val)
    local Magnitude = p1.Magnitude
    if Magnitude < 0.0001 or not (isFiniteNumber(Magnitude)) then
        return Vector3.zero
    end
    return p1 / Magnitude
end
local function onHandleClientParryStun(p1) -- Line: 134 -- upvalues: ClientGearHandler (val), ClientAttributesHandler (val), Character (val), ClientStateHandler (val), States (val), Shake (val), u280 (val), u282 (val), ClientStatusHandler (val), safeUnit (val), isFiniteVector3 (val), RunService (val), Sounds (val), Gear (val), Universal (val), u283 (ref)
    local u19
    local u3 = ClientGearHandler.getGearState()
    if not u3 or ClientAttributesHandler.getAttribute("AntiParry") == 1 then
        return
    end
    u3.signals.cancelBladeSwing:Fire()
    _, u19 = Character.getCharacterAsync():await()
    local HumanoidRootPart = u19.HumanoidRootPart
    local Humanoid = u19.Humanoid
    u3.no_physics = true
    if u3.animation then
        u3.animation:Stop()
    end
    if u3.priority then
        u3.priority:Stop()
    end
    ClientStateHandler.updateState(States.LOCKED, true)
    ClientStateHandler.updateState(States.STUNNED, true)
    local BodyGyro_2 = HumanoidRootPart:FindFirstChildWhichIsA("BodyGyro")
    if BodyGyro_2 then
        BodyGyro_2.Parent = nil
    end
    local CurrentCamera = workspace.CurrentCamera
    local v1 = Shake.new()
    v1.FadeInTime = u280.SHAKE_FADE_IN_TIME
    v1.FadeOutTime = u280.SHAKE_FADE_OUT_TIME
    v1.Frequency = u280.SHAKE_FREQUENCY
    v1.Amplitude = u280.SHAKE_AMPLITUDE
    v1.RotationInfluence = Vector3.new(u280.SHAKE_ROTATION_INFLUENCE, u280.SHAKE_ROTATION_INFLUENCE, u280.SHAKE_ROTATION_INFLUENCE)
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 189 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
    u282:Add(v1)
    ClientStatusHandler.addPlayerStatus(ClientStatusHandler.Statuses.CONCUSSED, u280.CONCUSSED_DURATION)
    local v2 = safeUnit(p1.AssemblyLinearVelocity)
    if v2 == Vector3.zero then
        v2 = safeUnit(p1.CFrame.LookVector)
    end
    local v3 = p1.Position + v2 * u280.OPPONENT_FORWARD_OFFSET + Vector3.new(0, u280.OPPONENT_UPWARD_OFFSET, 0)
    local v4 = CFrame.lookAt(HumanoidRootPart.Position, v3, (Vector3.new(0, 1, 0)))
    local v5 = v4.LookVector * u280.BACKWARDS_PUSH
    local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
    local v6 = math.min(HumanoidRootPart.AssemblyLinearVelocity.Magnitude * u280.MOVEMENT_DIRECTION_SCALE, u280.MOVEMENT_DIRECTION_CAP)
    local v7 = HumanoidRootPart.Position + safeUnit(HumanoidRootPart.AssemblyLinearVelocity) * v6 + v5
    local v8 = v7 + Vector3.new(0, u280.VECTOR_OFFSET_DOWNWARD, 0)
    if u280.MIN_STARTING_SPEED_FOR_STUN_PULL < AssemblyLinearVelocity.Magnitude and isFiniteVector3(v8) then
        Humanoid.PlatformStand = true
        Humanoid.AutoRotate = false
        local BodyPosition = Instance.new("BodyPosition")
        BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        BodyPosition.P = u280.BODY_POSITION_P
        BodyPosition.D = u280.BODY_POSITION_D
        BodyPosition.Position = v8
        BodyPosition.Parent = HumanoidRootPart
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        BodyGyro.P = u280.BODY_GYRO_P
        BodyGyro.D = u280.BODY_GYRO_D
        BodyGyro.CFrame = v4
        BodyGyro.Parent = HumanoidRootPart
        local v9 = RunService.RenderStepped:Connect(function(a1) -- Line: 256 -- upvalues: BodyGyro (val), HumanoidRootPart (val), p1 (val), u280 (upval)
            local v1 = p1.Position + Vector3.new(0, u280.OPPONENT_UPWARD_OFFSET, 0)
            BodyGyro.CFrame = CFrame.lookAt(HumanoidRootPart.Position, v1, (Vector3.new(0, 1, 0)))
        end)
        u282:Add(BodyPosition)
        u282:Add(BodyGyro)
        u282:Add(v9)
    end
    u282:Add(function() -- Line: 272 -- upvalues: u19 (val), u3 (val), ClientStateHandler (upval), States (upval)
        local Humanoid = u19:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.PlatformStand = false
            Humanoid.AutoRotate = true
        end
        u3.no_physics = false
        ClientStateHandler.updateState(States.LOCKED, false)
        ClientStateHandler.updateState(States.STUNNED, false)
        ClientStateHandler.updateState(States.GEAR_SWING, false)
        ClientStateHandler.updateState(States.PARRYING, false)
    end)
    Sounds.playGlobalSoundEffect(Gear.Blades.Parried, u280.PARRY_SOUND_VOLUME, u280.PARRY_SOUND_SPEED, u280.SOUND_ROLLOFF, NumberRange.new(0.9, 1.1))
    Sounds.playGlobalSoundEffect(Universal.MetalImpactRingShort, u280.PARRY_SOUND_VOLUME, u280.PARRY_SOUND_SPEED, u280.SOUND_ROLLOFF, NumberRange.new(0.9, 1.1))
    u283 = u283 + 1
    local u268 = u283
    u282:Add(task.delay(u280.CLEANUP_DELAY, function() -- Line: 306 -- upvalues: u283 (upval), u268 (val), u19 (val), AssemblyLinearVelocity (val), u280 (upval), u282 (upval)
        if u283 ~= u268 then
            return
        end
        u283 = u283 + 1
        local HumanoidRootPart = u19:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart and HumanoidRootPart.Parent then
            local v1 = AssemblyLinearVelocity * Vector3.new(u280.EXIT_VELOCITY_XZ_DAMPEN, u280.EXIT_VELOCITY_Y_DAMPEN, u280.EXIT_VELOCITY_XZ_DAMPEN)
            HumanoidRootPart.AssemblyLinearVelocity = v1 + Vector3.new(0, u280.EXIT_VELOCITY_UP_BOOST, 0)
        end
        u282:Clean()
    end))
    task.delay(u280.PARRY_STUN_FAILSAFE, function() -- Line: 328 -- upvalues: u283 (upval), u268 (val), u282 (upval)
        if u283 ~= u268 then
            return
        end
        u283 = u283 + 1
        u282:Clean()
    end)
end
Gear_2.Parry.listen(function(p1) -- Line: 343 -- upvalues: u283 (ref), u282 (val), onHandleClientParryStun (val), Sounds (val), Gear (val), u280 (val), ClientEnchantmentsHandler (val), Effects (val), Signals (val)
    if p1.stunned then
        u283 = u283 + 1
        u282:Clean()
        return onHandleClientParryStun(p1.opponentRoot)
    end
    Sounds.playGlobalSoundEffect(Gear.Blades.Parried, u280.PARRY_SOUND_VOLUME, u280.PARRY_SOUND_SPEED, u280.SOUND_ROLLOFF, NumberRange.new(0.9, 1.1))
    Sounds.playGlobalSoundEffect(Gear.Blades.SuccessfulParry, u280.PARRY_SOUND_VOLUME, 1, u280.SOUND_ROLLOFF, NumberRange.new(0.9, 1.1))
    if not (ClientEnchantmentsHandler.hasEnchantment("Don't Even Flinch")) then
        Effects.emitClientEffect("Parry")
    end
    Signals.Monologue:Fire("That was a close call, luckily I was able to parry it.")
    Signals.Indicator:Fire({lifetime = u280.INDICATOR_LIFETIME, location = p1.opponentRoot})
end)
return {}