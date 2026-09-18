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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Sentinel.Starbust Stream
--                              Dumped in 0.000786 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Proficiencies = require(Animations:WaitForChild("Proficiencies"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local States = require(State:WaitForChild("ClientStateHandler")).States
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local u142 = require(Common_4:WaitForChild("Config")).define({
    STARBUST_SOUND_FADE_TIME = 0.1,
    STARBUST_SOUND_START_TIME = 0.5,
    STARBUST_SOUND_MAX_DISTANCE_STUDS = 10,
    STARBUST_NO_PHYSICS_DURATION_SEC = 2.3,
    STARBUST_ANIMATION_FADE_TIME = 0.1,
    STARBUST_MIN_LAUNCH_SPEED_STUDS = 100,
    STARBUST_TARGET_SPEED_STUDS = 350,
    STARBUST_SPEED_EASE_DURATION_SEC = 2.5,
    STARBUST_BLADE_SWING_DELAY_SEC = 0.2,
    STARBUST_SIMULATE_BLADE_SWING_VALUE = 1.45,
    STARBUST_ACTIVE_DURATION_SEC = 2.5,
})
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Proficiencies_2 = require(Sounds_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_3:WaitForChild("useNumberEasing"))
return {
    activated = function() -- Line: 88 -- upvalues: ClientGearHandler (val), Character (val), Sounds (val), Proficiencies_2 (val), u142 (val), useAnimatorObserver (val), Proficiencies (val), useNumberEasing (val), RunService (val)
        local u52, u54, v1
        local u2 = ClientGearHandler.getGearState()
        if not u2 then
            return
        end
        local u5 = Character.getCharacter()
        if not u5 then
            return
        end
        Sounds.playGlobalSoundEffect(Proficiencies_2.Starbust, u142.STARBUST_SOUND_FADE_TIME, u142.STARBUST_SOUND_START_TIME, u142.STARBUST_SOUND_MAX_DISTANCE_STUDS)
        u2.no_physics = true
        u2.addTimeout(u142.STARBUST_NO_PHYSICS_DURATION_SEC)
        u2.signals.ungrapple:Fire("Left")
        u2.signals.ungrapple:Fire("Right")
        useAnimatorObserver.play(Proficiencies.Starbust, u142.STARBUST_ANIMATION_FADE_TIME)
        local v2 = math.max(u5.HumanoidRootPart.AssemblyLinearVelocity.Magnitude, u142.STARBUST_MIN_LAUNCH_SPEED_STUDS)
        u52, v1, u54 = useNumberEasing(v2)
        local v3 = math.max(v2, u142.STARBUST_TARGET_SPEED_STUDS)
        v1(v3, TweenInfo.new(u142.STARBUST_SPEED_EASE_DURATION_SEC, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
        task.delay(u142.STARBUST_BLADE_SWING_DELAY_SEC, function() -- Line: 130 -- upvalues: u2 (val), u142 (upval)
            u2.signals.simulateBladeSwing:Fire(u142.STARBUST_SIMULATE_BLADE_SWING_VALUE)
            u2.signals.boosting:Fire(true)
        end)
        u2.signals.cancelBladeSwing:Fire()
        local u78 = nil
        u78 = RunService.RenderStepped:Connect(function(p1) -- Line: 139 -- upvalues: Character (upval), u78 (ref), u2 (val), u5 (val), u52 (val)
            if not (Character.isActive()) then
                u78:Disconnect()
                return
            end
            u2.signals.clearMomentum:Fire()
            u5.HumanoidRootPart.AssemblyLinearVelocity = workspace.CurrentCamera.CFrame.LookVector * u52()
        end)
        task.delay(u142.STARBUST_ACTIVE_DURATION_SEC, function() -- Line: 153 -- upvalues: u78 (ref), u54 (val), u2 (val)
            u78:Disconnect()
            u54()
            u2.signals.beginSimulatedMomentum:Fire()
            u2.no_physics = false
            u2.signals.boosting:Fire(false)
        end)
    end,
    settings = {
        blades = true,
        blocked_states = {
            States.GEAR_SWING,
            States.CLASHING,
            States.STUNNED,
            States.PARRYING,
            States.WALL_HANGING,
        },
    },
}