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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Duff
--                               Dumped in 0.00130 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Effects_2 = Common:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types_2 = Common_3:WaitForChild("Types")
local Tools = Types_2:WaitForChild("Tools")
local Duff_2 = require(Tools:WaitForChild("Duff"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Bottle = require(Tools_2:WaitForChild("Bottle"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_6:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local State = script.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Animations_2 = Common_7:WaitForChild("Animations")
local Tools_3 = Animations_2:WaitForChild("Tools")
local Duff = require(Tools_3:WaitForChild("Duff"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Network = Common_8:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Signals = require(Common_9:WaitForChild("Signals"))
local States = ClientStateHandler.States
local Constants = Duff_2.Constants
local v2 = {description = "An unknown substance.", category = require(Types:WaitForChild("Item")).CATEGORIES.Consumables, usageAmount = Constants.USAGE_AMOUNT}
local u225 = 0
local u226 = 0
local u227 = 0
local u228 = false
local u229 = 0.2
local u230 = nil
local u231 = nil
local u232 = nil
local u234 = nil
local function isPoisoned() -- Line: 57 -- upvalues: ClientStateHandler (val), States (val)
    return ClientStateHandler.isStateBusy(States.POISONED)
end
local function releaseAnimations() -- Line: 61 -- upvalues: u231 (ref), u232 (ref)
    if u231 then
        u231()
        u231 = nil
    end
    if u232 then
        u232()
        u232 = nil
    end
end
local function bindEquippedAnimations(p1) -- Line: 73 -- upvalues: isPoisoned (val), u232 (ref), useAnimatorObserver (val), Duff (val), Constants (val), u231 (ref), Bottle (val)
    local Animator = p1.Humanoid.Animator
    if isPoisoned() then
        u232 = useAnimatorObserver.bind(Animator, Duff.BottleEquipped, Constants.ANIM_PRIORITY)
        return
    end
    u231 = useAnimatorObserver.bind(Animator, Bottle, Constants.ANIM_PRIORITY)
end
local function playConsumeAnimation(p1) -- Line: 82 -- upvalues: isPoisoned (val), releaseAnimations (val), useAnimatorObserver (val), Duff (val), Constants (val), Character (val), bindEquippedAnimations (val), Bottle (val)
    local v1
    if not (isPoisoned()) then
        v1 = useAnimatorObserver.play(Bottle.Use, Constants.ANIM_FADE)
        if not v1 then
            return
        end
        v1.Ended:Wait()
        return
    end
    releaseAnimations()
    v1 = useAnimatorObserver.play(Duff.PoisonedDrink, Constants.ANIM_FADE)
    if not v1 then
        return
    end
    v1.Ended:Wait()
    local v2 = Character.getCharacter()
    if not v2 then
        return
    end
    bindEquippedAnimations(v2)
end
local function tryApplyEffect() -- Line: 110 -- upvalues: u228 (ref), Effects (val), Constants (val)
    if u228 then
        return
    end
    Effects.sendReplicatedEffect("Duff", Constants.EFFECT_DURATION)
    u228 = true
    task.delay(Constants.EFFECT_DURATION, function() -- Line: 118 -- upvalues: u228 (upval)
        u228 = false
    end)
end
local u250 = ClientStateHandler.onStateChanged(States.POISONED):Connect(function(p1) -- Line: 218 -- upvalues: u234 (ref), Constants (val), ClientStateHandler (val), States (val), releaseAnimations (val), useAnimatorObserver (val), Duff (val)
    if not p1 or u234 then
        return
    end
    u234 = task.delay(Constants.POISONED_DURATION, function() -- Line: 227 -- upvalues: ClientStateHandler (upval), States (upval), releaseAnimations (upval), useAnimatorObserver (upval), Duff (upval), Constants (upval)
        ClientStateHandler.updateState(States.POISONED, false)
        releaseAnimations()
        useAnimatorObserver.play(Duff.CleanseTransition, Constants.ANIM_FADE)
    end)
end)
Players.PlayerRemoving:Connect(function(p1) -- Line: 237 -- upvalues: Players (val), u250 (ref)
    if p1 ~= Players.LocalPlayer then
        return
    end
    if u250 then
        u250:Disconnect()
        u250 = nil
    end
end)
return {
    equipped = function(p1, p2) -- Line: 125 -- upvalues: Character (val), releaseAnimations (val), bindEquippedAnimations (val), u230 (ref), UserInputService (val), Server (val), Signals (val), u225 (ref), Constants (val), u226 (ref), u227 (ref), u229 (ref), ClientStateHandler (val), States (val), playConsumeAnimation (val), tryApplyEffect (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 126 -- upvalues: releaseAnimations (upval), bindEquippedAnimations (upval)
            releaseAnimations()
            bindEquippedAnimations(p1)
        end)
        u230 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 131 -- upvalues: Character (upval), Server (upval), Signals (upval), u225 (upval), Constants (upval), u226 (upval), u227 (upval), u229 (upval), ClientStateHandler (upval), States (upval), playConsumeAnimation (upval), p1 (val), tryApplyEffect (upval)
            if p2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            local v1 = Character.getCharacter()
            if not v1 then
                return
            end
            local Animator = v1.Humanoid.Animator
            if not Animator then
                return
            end
            if Server.Store.client().event ~= 1 then
                Signals.Toast:Fire({message = "Event must be enabled to use this tool.", type = "error"})
                return
            end
            local v2 = tick()
            local v3 = v2 - u225
            if v3 < Constants.CONSUMPTION_COOLDOWN then
                return
            end
            u225 = v2
            if u226 == 0 then
                u226 = v2
                u227 = 0
            else
                v3 = v2 - u226
                if Constants.CONSUMPTION_WINDOW > v3 then end
            end
            v3 = math.random()
            u227 = u227 + 1
            local v4 = Constants.CONSUMPTION_LIMIT <= u227
            print(u229)
            local v5 = {action = "Consume"}
            local v6 = v3 < u229
            v5.poisoned = v6
            if v4 and v3 < u229 then
                ClientStateHandler.updateState(States.POISONED, true)
                u229 = 0.2
            end
            if u229 < v3 then
                u229 = u229 + 0.2
            end
            playConsumeAnimation(Animator)
            p1(v5)
            if v4 then
                return
            end
            tryApplyEffect()
        end)
    end,
    unequipped = function() -- Line: 199 -- upvalues: u230 (ref), releaseAnimations (val), Character (val), isPoisoned (val), u232 (ref), useAnimatorObserver (val), Duff (val), Constants (val)
        if u230 then
            u230:Disconnect()
            u230 = nil
        end
        releaseAnimations()
        Character.getCharacterAsync():andThen(function(p1) -- Line: 207 -- upvalues: isPoisoned (upval), u232 (upval), useAnimatorObserver (upval), Duff (upval), Constants (upval)
            if not (isPoisoned()) then
                return
            end
            u232 = useAnimatorObserver.bind(p1.Humanoid.Animator, Duff.BottleUnequipped, Constants.ANIM_PRIORITY)
        end)
    end,
    data = v2,
}