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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Medical.Heat Pack
--                              Dumped in 0.000793 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Bandages = require(Tools:WaitForChild("Bandages"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations_2 = Common_2:WaitForChild("Animations")
local Tools_2 = Animations_2:WaitForChild("Tools")
local Food = require(Tools_2:WaitForChild("Food"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Tools_3 = Sounds_2:WaitForChild("Tools")
local Bandage = require(Tools_3:WaitForChild("Bandage"))
local v2 = {
    description = "A disposable heat pack that warms the body when applied.",
    attributes = {"Medical"},
    category = Item.CATEGORIES.Medical,
}
local u182 = {"I feel warm.", "That's better... I'm warming up.", "The heat is spreading through me.", "Much warmer now."}
local u187 = nil
local u188 = nil
local u189 = nil
local u190 = 0
local function playUseAnimation() -- Line: 53 -- upvalues: useAnimatorObserver (val), Food (val), Bandages (val)
    useAnimatorObserver.stop(Food.Idle, 0.2)
    return (useAnimatorObserver.play(Bandages.Self, 0.2, Enum.AnimationPriority.Action2))
end
return {
    equipped = function(p1) -- Line: 62 -- upvalues: Character (val), u187 (ref), useAnimatorObserver (val), Food (val), u188 (ref), UserInputService (val), u190 (ref), u189 (ref), playUseAnimation (val), Sounds (val), Bandage (val), Signals (val), u182 (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 63 -- upvalues: u187 (upval), useAnimatorObserver (upval), Food (upval)
            u187 = useAnimatorObserver.bind(p1.Humanoid.Animator, Food, 4)
        end)
        u188 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 67 -- upvalues: u190 (upval), u189 (upval), playUseAnimation (upval), Character (upval), Sounds (upval), Bandage (upval), Signals (upval), u182 (upval), p1 (val)
            if p2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or tick() < u190 then
                return
            end
            u190 = tick() + 2
            u189 = playUseAnimation()
            local v1 = Character.getCharacter()
            local HumanoidRootPart = v1
            if HumanoidRootPart then
                HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
            end
            if HumanoidRootPart then
                Sounds.playRangedSoundEffect(Bandage.Bandage, HumanoidRootPart, 60, 1)
            end
            task.delay(1.7, function() -- Line: 86 -- upvalues: u189 (upval)
                if u189 then
                    u189:Stop(0.2)
                    u189 = nil
                end
            end)
            task.delay(2, function() -- Line: 93 -- upvalues: Signals (upval), u182 (upval), p1 (upval)
                Signals.Monologue:Fire(u182)
                p1()
            end)
        end)
    end,
    unequipped = function() -- Line: 103 -- upvalues: u187 (ref), u188 (ref), u189 (ref)
        if u187 then
            u187()
            u187 = nil
        end
        if u188 then
            u188:Disconnect()
            u188 = nil
        end
        if u189 then
            u189:Stop(0.2)
            u189 = nil
        end
    end,
    data = v2,
}