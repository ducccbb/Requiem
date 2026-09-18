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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Stick
--                              Dumped in 0.000652 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Tools = Types:WaitForChild("Tools")
local AnxietyStick = require(Tools:WaitForChild("AnxietyStick"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types_2 = Common_2:WaitForChild("Types")
local Item = require(Types_2:WaitForChild("Item"))
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
local Animations = Common_5:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Kpuff = require(Tools_2:WaitForChild("Kpuff"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Effects = Common_6:WaitForChild("Effects")
require(Effects:WaitForChild("Effects"))
local Constants = AnxietyStick.Constants
local v2 = {description = "A calming stick that eases anxiety with each use.", category = Item.CATEGORIES.Consumables, usageAmount = Constants.USAGE_AMOUNT}
local u144 = 0
local u145 = nil
local u146 = nil
local function releaseAnimations() -- Line: 42 -- upvalues: u146 (ref)
    if u146 then
        u146()
        u146 = nil
    end
end
local function playUseAnimation() -- Line: 49 -- upvalues: useAnimatorObserver (val), Kpuff (val), Constants (val)
    local v1 = useAnimatorObserver.play(Kpuff.SecondUse, Constants.ANIM_FADE)
    if not v1 or v1.KeyframeReached:Wait() ~= "SmokePuff" then
        return
    end
end
return {
    equipped = function(p1) -- Line: 61 -- upvalues: Character (val), releaseAnimations (val), u146 (ref), useAnimatorObserver (val), Kpuff (val), Constants (val), u145 (ref), UserInputService (val), u144 (ref), playUseAnimation (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 62 -- upvalues: releaseAnimations (upval), u146 (upval), useAnimatorObserver (upval), Kpuff (upval), Constants (upval)
            releaseAnimations()
            u146 = useAnimatorObserver.bind(p1.Humanoid.Animator, Kpuff, Constants.ANIM_PRIORITY)
        end)
        u145 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 67 -- upvalues: Character (upval), u144 (upval), Constants (upval), playUseAnimation (upval), p1 (val)
            if p2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            local v1 = Character.getCharacter()
            if not v1 or not v1.Humanoid.Animator then
                return
            end
            local v2 = tick()
            local v3 = v2 - u144
            if v3 < Constants.USE_COOLDOWN then
                return
            end
            u144 = v2
            playUseAnimation()
            p1({action = "Consume"})
        end)
    end,
    unequipped = function() -- Line: 94 -- upvalues: u145 (ref), releaseAnimations (val)
        if u145 then
            u145:Disconnect()
            u145 = nil
        end
        releaseAnimations()
    end,
    data = v2,
}