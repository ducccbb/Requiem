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
--       File: ReplicatedStorage.Client.User.Equipment.Tools.Farmables.Onion Seed
--                              Dumped in 0.000431 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
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
local Animations = Common_4:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local u92 = require(Tools:WaitForChild("Seed Bag"))
local u93 = nil
return {
    equipped = function() -- Line: 32 -- upvalues: Character (val), u93 (ref), useAnimatorObserver (val), u92 (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 33 -- upvalues: u93 (upval), useAnimatorObserver (upval), u92 (upval)
            local Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
            local Animator = Humanoid
            if Animator then
                Animator = Humanoid:FindFirstChildWhichIsA("Animator")
            end
            if not Animator then
                return
            end
            if u93 then
                u93()
            end
            u93 = useAnimatorObserver.bind(Animator, {Idle = u92.Idle}, 2)
        end)
    end,
    unequipped = function() -- Line: 48 -- upvalues: u93 (ref)
        if u93 then
            u93()
            u93 = nil
        end
    end,
    data = {
        description = "Onion seeds for planting.",
        attributes = {"Farming", "Resource"},
        category = require(Types:WaitForChild("Item")).CATEGORIES.Resource,
    },
}