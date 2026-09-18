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
-- File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Skills.Counter
--                              Dumped in 0.000919 seconds
--                          Bytecode version 9  |  4 functions

local u218
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Enchantments = require(Sounds_2:WaitForChild("Enchantments"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Network = Common_6:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear_2 = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear_3 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_3:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
_, u218 = require(Statistics:WaitForChild("useFieldOfView"))()
local u219 = nil
return {
    activated = function() -- Line: 59 -- upvalues: ClientGearHandler (val), ClientStateHandler (val), States (val), Sounds (val), Enchantments (val), Lighting (val), useAnimatorObserver (val), Gear (val), u218 (val), TweenService (val), ClientAttributesHandler (val), u219 (ref)
        local v1 = ClientGearHandler.getGearState()
        if not v1 then
            return
        end
        ClientStateHandler.updateState(States.COUNTERING, true)
        Sounds.playGlobalSoundEffect(Enchantments.Counter, 0.2, 2)
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Parent = Lighting
        useAnimatorObserver.play(Gear.Counter, 0.1)
        local v2 = u218("counter", 20, "subtract", 5, TweenInfo.new(0.2))
        local v3 = TweenInfo.new(0.2)
        TweenService:Create(ColorCorrectionEffect, v3, {Brightness = 0.1, Saturation = 0.6, Contrast = 0.2, TintColor = Color3.fromRGB(180, 193, 255)}):Play()
        local GearCounterWindowLength = ClientAttributesHandler.getAttribute("GearCounterWindowLength")
        u219 = task.delay(GearCounterWindowLength, function() -- Line: 89 -- upvalues: ClientStateHandler (upval), States (upval)
            ClientStateHandler.updateState(States.COUNTERING, false)
        end)
        v1.signals.cancelBladeSwing:Fire()
        task.wait(0.2)
        local v4 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v4, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v2(TweenInfo.new(1))
        task.wait(1)
        ColorCorrectionEffect:Destroy()
    end,
    requested = function() -- Line: 114 -- upvalues: useAnimatorObserver (val), Gear (val), Gear_2 (val), Signals (val), Sounds (val), Enchantments (val), u219 (ref), ClientStateHandler (val), States (val)
        useAnimatorObserver.play(Gear.Blades.Swings[1], 0.1)
        Gear_2.Swing.post(0)
        useAnimatorObserver.stop(Gear.Counter, 0.1)
        Signals.Monologue:Fire("It would appear my counter has helped me once more... ")
        Sounds.playGlobalSoundEffect(Enchantments.Angelic, 0.2, 0.75)
        if u219 then
            pcall(task.cancel, u219)
            task.wait(0.15)
            ClientStateHandler.updateState(States.COUNTERING, false)
        end
    end,
    settings = {
        blades = true,
        blocked_states = {States.GEAR_SWING, States.CLASHING, States.STUNNED, States.PARRYING},
    },
}