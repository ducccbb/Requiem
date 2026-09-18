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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Teacup
--                              Dumped in 0.000531 seconds
--                          Bytecode version 9  |  5 functions

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
local Teacup = require(Tools:WaitForChild("Teacup"))
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
local Types = Common_4:WaitForChild("Types")
local v2 = {description = "A bottle which can be used to drink.", category = require(Types:WaitForChild("Item")).CATEGORIES.Consumables}
local u100 = nil
local u101 = nil
local u102 = 0
return {
    equipped = function(p1, p2) -- Line: 48 -- upvalues: Character (val), u100 (ref), useAnimatorObserver (val), Teacup (val), u101 (ref), UserInputService (val), u102 (ref)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 49 -- upvalues: u100 (upval), useAnimatorObserver (upval), Teacup (upval)
            u100 = useAnimatorObserver.bind(p1.Humanoid.Animator, Teacup, 4)
        end)
        u101 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 53 -- upvalues: u102 (upval), useAnimatorObserver (upval), Teacup (upval)
            if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            local v1 = tick()
            local v2 = v1 - u102
            if v2 < 3 then
                return
            end
            u102 = v1
            useAnimatorObserver.play(Teacup.Use, 0.1)
        end)
    end,
    unequipped = function() -- Line: 75 -- upvalues: u100 (ref), u101 (ref)
        if u100 then
            u100()
            u100 = nil
        end
        if u101 then
            u101:Disconnect()
            u101 = nil
        end
    end,
    data = v2,
}