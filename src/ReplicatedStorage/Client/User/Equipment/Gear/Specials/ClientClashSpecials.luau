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
--    File: ReplicatedStorage.Client.User.Equipment.Gear.Specials.ClientClashSpecials
--                               Dumped in 0.00114 seconds
--                          Bytecode version 9  |  8 functions

local u209
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
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ClientGearHandler = require(v1.Parent.Parent:WaitForChild("ClientGearHandler"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
_, u209 = require(Statistics:WaitForChild("useFieldOfView"))()
local u212 = Config.define({
    CLASH_LENGTH_FAILSAFE = 2.5,
    CAMERA_LERP_HEIGHT_OFFSET = 2.5,
    CAMERA_LERP_BACK_OFFSET = 8,
    CAMERA_LERP_SPEED = 30,
    SHAKE_FADE_IN_TIME = 0.1,
    SHAKE_FADE_OUT_TIME = 0.3,
    SHAKE_FREQUENCY = 0.1,
    SHAKE_AMPLITUDE = 3,
    SHAKE_ROTATION_INFLUENCE = 0.05,
    FOV_SET_DELAY = 0.2,
    FOV_SET_VALUE = 50,
    FOV_SET_PRIORITY = 10,
    FOV_SET_TWEEN_DURATION = 1,
    FOV_RESET_TWEEN_DURATION = 0.3,
    EXIT_VELOCITY_SPEED = 150,
    UNLOCK_DELAY = 0.2,
})
local u214 = trove.new()
local CLASH_LENGTH_FAILSAFE = u212.CLASH_LENGTH_FAILSAFE
local u216 = 0
Gear.Clash.listen(function(p1) -- Line: 90 -- upvalues: u216 (ref), u214 (val), ClientGearHandler (val), ClientStateHandler (val), States (val), Character (val), RunService (val), u212 (val), Sounds (val), Universal (val), Shake (val), u209 (val), CLASH_LENGTH_FAILSAFE (val)
    local u41
    if p1.isEnded then
        u216 = u216 + 1
        u214:Clean()
        return
    end
    local u10 = ClientGearHandler.getGearState()
    if not u10 then
        return
    end
    u10.no_physics = true
    if u10.animation then
        u10.animation:Stop()
    end
    if u10.priority then
        u10.priority:Stop()
    end
    ClientStateHandler.updateState(States.LOCKED, true)
    ClientStateHandler.updateState(States.CLASHING, true)
    _, u41 = Character.getCharacterAsync():await()
    u41.Humanoid.PlatformStand = true
    u41.Humanoid.AutoRotate = false
    local CurrentCamera = workspace.CurrentCamera
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    local ServerTimeNow = workspace:GetServerTimeNow()
    local u54 = nil
    local HumanoidRootPart = u41.HumanoidRootPart
    local u62 = RunService.RenderStepped:Connect(function(p1) -- Line: 146 -- upvalues: ServerTimeNow (ref), HumanoidRootPart (val), CurrentCamera (val), u212 (upval)
        ServerTimeNow = ServerTimeNow + p1
        if not HumanoidRootPart.Parent then
            return
        end
        local v1 = HumanoidRootPart.CFrame * CFrame.new(0, u212.CAMERA_LERP_HEIGHT_OFFSET, u212.CAMERA_LERP_BACK_OFFSET)
        CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(v1, u212.CAMERA_LERP_SPEED * p1)
    end)
    Sounds.playGlobalSoundEffect(Universal.MetalImpactRing, 0.1, 0.8, 5, NumberRange.new(0.9, 1.1))
    local v1 = Shake.new()
    v1.FadeInTime = u212.SHAKE_FADE_IN_TIME
    v1.FadeOutTime = u212.SHAKE_FADE_OUT_TIME
    v1.Frequency = u212.SHAKE_FREQUENCY
    v1.Amplitude = u212.SHAKE_AMPLITUDE
    v1.RotationInfluence = Vector3.new(u212.SHAKE_ROTATION_INFLUENCE, u212.SHAKE_ROTATION_INFLUENCE, u212.SHAKE_ROTATION_INFLUENCE)
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 175 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
    u214:Add(v1)
    task.delay(u212.FOV_SET_DELAY, function() -- Line: 182 -- upvalues: u54 (ref), u209 (upval), u212 (upval)
        u54 = u209("clash", u212.FOV_SET_VALUE, "set", u212.FOV_SET_PRIORITY, TweenInfo.new(u212.FOV_SET_TWEEN_DURATION, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    end)
    u214:Add(function() -- Line: 196 -- upvalues: u62 (ref), CurrentCamera (val), u41 (val), u212 (upval), u54 (ref), ClientStateHandler (upval), States (upval), u10 (val)
        u62:Disconnect()
        CurrentCamera.CameraType = Enum.CameraType.Custom
        local Humanoid = u41:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.PlatformStand = false
            Humanoid.AutoRotate = true
        end
        local HumanoidRootPart = u41:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart and HumanoidRootPart.Parent then
            HumanoidRootPart.AssemblyLinearVelocity = (-HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 1, 0)).Unit * u212.EXIT_VELOCITY_SPEED
        end
        if u54 then
            u54(TweenInfo.new(u212.FOV_RESET_TWEEN_DURATION, Enum.EasingStyle.Back))
        end
        ClientStateHandler.updateState(States.CLASHING, false)
        task.delay(u212.UNLOCK_DELAY, function() -- Line: 220 -- upvalues: u10 (upval), ClientStateHandler (upval), States (upval), CurrentCamera (upval)
            u10.no_physics = false
            ClientStateHandler.updateState(States.LOCKED, false)
            ClientStateHandler.updateState(States.GEAR_SWING, false)
            CurrentCamera.CameraType = Enum.CameraType.Custom
        end)
    end)
    u216 = u216 + 1
    local u124 = u216
    task.delay(CLASH_LENGTH_FAILSAFE, function() -- Line: 240 -- upvalues: u216 (upval), u124 (val), u214 (upval)
        if u216 ~= u124 then
            return
        end
        u216 = u216 + 1
        u214:Clean()
    end)
end)
return {}