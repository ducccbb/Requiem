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
--       File: ReplicatedStorage.Client.User.Equipment.Tools.Utilities.FoodClient
--                               Dumped in 0.00107 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Food = require(Tools:WaitForChild("Food"))
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
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Emotes = require(Utilities_2:WaitForChild("Emotes"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Food_3 = Common_5:WaitForChild("Food")
local Monologues = require(Food_3:WaitForChild("Monologues"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Food_2 = require(Sounds_2:WaitForChild("Food"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_3 = Common_8:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Network = Common_9:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local u197 = 0
local u198 = 0
local function canEatMoreHunger() -- Line: 45 -- upvalues: Vitality (val), Players (val)
    local v1
    local v2 = Vitality.Store.get(Players.LocalPlayer)
    if not v2 then
        return true
    end
    local v3 = v2.maxHunger or 100
    if v2.hunger or 0 < v3 then
        v1 = true
    else
        v1 = false
    end
    return v1
end
local function playNodNo() -- Line: 57 -- upvalues: Emotes (val), useAnimatorObserver (val)
    local NodNo = Emotes.getAnimationId("NodNo")
    if not NodNo then
        return
    end
    useAnimatorObserver.play(NodNo, 0.1, Enum.AnimationPriority.Action3)
end
local function isEating() -- Line: 69 -- upvalues: u197 (ref)
    local v1 = tick() < u197
    return v1
end
local function rejectEat(p1, p2, p3) -- Line: 73 -- upvalues: u198 (ref), Signals (val), playNodNo (val)
    u198 = p1
    if p2 then
        Signals.Monologue:Fire(p2)
    end
    if p3 then
        p3()
    end
    playNodNo()
end
local function eat(p1, p2) -- Line: 89 -- upvalues: u198 (ref), isEating (val), rejectEat (val), canEatMoreHunger (val), Monologues (val), useAnimatorObserver (val), Food (val), u197 (ref), Character (val), Food_2 (val), Sounds (val)
    local v1 = tick()
    local v2 = v1 - u198
    if v2 < 2 then
        return false
    else
        if isEating() then
            return false
        end
        if not p2 then
            u198 = v1
            local liquid = p2
            if liquid then
                liquid = p2.liquid
            end
            if liquid then
                local v3
                p1()
                local v4 = useAnimatorObserver.play(Food.Eat, 0.1)
                if not v4 then
                    v3 = 2
                else
                    v3 = useAnimatorObserver.getAnimationLength(v4)
                end
                u197 = tick() + v3
                local v5 = Character.getCharacter()
                local HumanoidRootPart = v5
                if HumanoidRootPart then
                    HumanoidRootPart = v5:FindFirstChild("HumanoidRootPart")
                end
                if HumanoidRootPart then
                    local Drink
                    if not p2 then
                        Drink = Food_2.Eat
                    elseif not p2.liquid then
                        Drink = Food_2.Eat
                    else
                        Drink = Food_2.Drink
                    end
                    Sounds.playRangedSoundEffect(Drink, HumanoidRootPart, 60, 1)
                end
                return true
            elseif not (canEatMoreHunger()) then
                rejectEat(v1, Monologues.FULL_HUNGER)
                return false
            end
        elseif p2.canEat and not (p2.canEat()) then
            rejectEat(v1, p2.blockedMonologue, p2.onBlocked)
            return false
        end
    end
end
return {
    isEating = isEating,
    eat = eat,
    bindAnimations = function() -- Line: 127 -- upvalues: Character (val), useAnimatorObserver (val), Food (val)
        local u0 = nil
        Character.getCharacterAsync():andThen(function(p1) -- Line: 130 -- upvalues: u0 (ref), useAnimatorObserver (upval), Food (upval)
            u0 = useAnimatorObserver.bind(p1.Humanoid.Animator, Food, 4)
        end)
        return function() -- Line: 134 -- upvalues: u0 (ref)
            if u0 then
                u0()
                u0 = nil
            end
        end
    end,
    connectInput = function(p1, p2) -- Line: 147 -- upvalues: UserInputService (val), eat (val)
        return UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 148 -- upvalues: eat (upval), p1 (val), p2 (val)
            if a2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            eat(p1, p2)
        end)
    end,
}