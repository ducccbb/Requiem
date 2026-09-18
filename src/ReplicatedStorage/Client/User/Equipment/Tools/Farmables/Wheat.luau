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
--          File: ReplicatedStorage.Client.User.Equipment.Tools.Farmables.Wheat
--                              Dumped in 0.000373 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
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
local Types = Common_4:WaitForChild("Types")
local v2 = {
    description = "Harvested wheat.",
    attributes = {"Food", "Resource"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Resource,
}
local u98 = nil
return {
    equipped = function(p1) -- Line: 28 -- upvalues: Character (val), u98 (ref), useAnimatorObserver (val), Food (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 29 -- upvalues: u98 (upval), useAnimatorObserver (upval), Food (upval)
            u98 = useAnimatorObserver.bind(p1.Humanoid.Animator, {Idle = Food.Idle}, 4)
        end)
    end,
    unequipped = function() -- Line: 36 -- upvalues: u98 (ref)
        if u98 then
            u98()
            u98 = nil
        end
    end,
    data = v2,
}