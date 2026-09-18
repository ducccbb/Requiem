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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Logistician.Emergency Eject
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  8 functions

local u222
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Effects_2 = Common_2:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_4:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Animations = Common_6:WaitForChild("Animations")
local Proficiencies = require(Animations:WaitForChild("Proficiencies"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Observers = Common_7:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Config = require(Common_8:WaitForChild("Config"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics = Common_9:WaitForChild("Statistics")
_, u222 = require(Statistics:WaitForChild("useFieldOfView"))()
local u224 = {
    "I need to get out now!",
    "This is bad!",
    "I can't stay here!",
    "I'm taking too much damage!",
    "I'm about to go down!",
    "This isn't working!",
    "I'm in trouble!",
    "I pushed too far!",
    "This is too risky!",
    "I'm losing this!",
    "I'm too exposed!",
    "This is falling apart!",
    "I'm slipping!",
    "I can't keep this up!",
    "This is over!",
}
local u240 = {
    "I'm getting out now!",
    "I'm pulling out!",
    "I'm falling back!",
    "I'm leaving!",
    "I'm done here!",
    "I'm not dying here!",
    "I'm breaking away!",
    "I'm getting clear!",
    "I'm out of this fight!",
    "I'm backing off!",
    "I'm gone!",
    "I'm disengaging!",
    "I'm resetting!",
    "I'm out!",
    "I'm retreating!",
}
return {
    unlocked = function() -- Line: 83 -- upvalues: Character (val), Vitality (val), ClientGearHandler (val), u222 (val), Signals (val), u224 (val), u240 (val), RunService (val), useAnimatorObserver (val), Proficiencies (val), Effects (val), Server (val), Config (val), UserInputService (val)
        local u0 = 0
        local u1 = 0
        local u2 = 0
        local u3 = 0
        local function onEmergencyEjectAttempt() -- Line: 96 -- upvalues: Character (upval), Vitality (upval), ClientGearHandler (upval), u2 (ref), u222 (upval), Signals (upval), u224 (upval), u240 (upval), RunService (upval), useAnimatorObserver (upval), Proficiencies (upval), Effects (upval)
            local u2 = Character.getCharacter()
            local u9 = ClientGearHandler.getGearState()
            if not u9 or not u9.enabled or not u2 or 30 < Vitality.Store.client().health then
                return
            end
            local v1 = tick() - u2
            if v1 < 600 or u9.gas <= 0 or not (u9.useGas(100)) then
                return
            end
            u2 = tick()
            local u33 = u222("Eject", 30, "add", 10, TweenInfo.new(0.1))
            u9.signals.ungrapple:Fire("Left")
            u9.signals.ungrapple:Fire("Right")
            u9.addTimeout(1)
            u9.no_physics = true
            u9.signals.clearMomentum:Fire()
            Signals.Monologue:Fire(u224)
            task.delay(0.1, function() -- Line: 134 -- upvalues: u9 (val), Signals (upval), u240 (upval)
                u9.signals.boosting:Fire(true)
                Signals.Monologue:Fire(u240)
            end)
            local u75 = (u2.HumanoidRootPart.CFrame.UpVector + -u2.HumanoidRootPart.CFrame.LookVector * 0.3).Unit * 400
            local u83 = RunService.RenderStepped:Connect(function() -- Line: 145 -- upvalues: u2 (val), u75 (val)
                u2.HumanoidRootPart.AssemblyLinearVelocity = u75
            end)
            useAnimatorObserver.play(Proficiencies.Eject, 0.1)
            Effects.sendReplicatedEffect("Dash")
            task.delay(0.2, function() -- Line: 154 -- upvalues: u83 (ref), u9 (val), u33 (val)
                u83:Disconnect()
                u9.signals.boosting:Fire(false)
                u9.no_physics = false
                u9.signals.beginSimulatedMomentum:Fire()
                u33(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
            end)
        end
        Signals.OnHealthChanged:Connect(function(p1, p2) -- Line: 169 -- upvalues: Server (upval), Config (upval), u3 (ref), u0 (ref), u1 (ref), Signals (upval)
            if Server.Store.client().event ~= 0 then
                if p1 <= 30 and 30 < p2 then
                    u3 = tick()
                    u0 = 0
                    u1 = 0
                    Signals.Monologue:Fire("I need to get out of here!", nil, nil, {fontSize = 35})
                    Signals.Monologue:Fire("Quickly, <font color='#b5caff'>double tap space</font> bar to eject!", nil, nil, {fontSize = 25})
                end
                return
            end
            if not Config.Constants.IsDebuggingPlace then
                return
            end
            if p1 <= 30 and 30 < p2 then
                u3 = tick()
                u0 = 0
                u1 = 0
                Signals.Monologue:Fire("I need to get out of here!", nil, nil, {fontSize = 35})
                Signals.Monologue:Fire("Quickly, <font color='#b5caff'>double tap space</font> bar to eject!", nil, nil, {fontSize = 25})
            end
        end)
        UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 191 -- upvalues: u3 (ref), u0 (ref), u1 (ref), onEmergencyEjectAttempt (val)
            if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or p1.KeyCode ~= Enum.KeyCode.Space then
                return
            end
            if u3 == 0 then
                u0 = 0
                u1 = 0
                return
            end
            local v1 = tick() - u3
            if 5 < v1 then
                u0 = 0
                u1 = 0
                return
            end
            v1 = tick()
            local v2 = v1 - u0
            if 0.3 < v2 then
                u0 = v1
                u1 = 1
                return
            end
            u1 = u1 + 1
            if 2 <= u1 then
                onEmergencyEjectAttempt()
                u3 = 0
                u0 = 0
                u1 = 0
            end
        end)
    end,
    settings = {},
}