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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Firearms.Cannonball
--                              Dumped in 0.000368 seconds
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
local Cannonball = require(Tools:WaitForChild("Cannonball"))
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
local u93 = nil
return {
    equipped = function(p1) -- Line: 29 -- upvalues: Character (val), u93 (ref), useAnimatorObserver (val), Cannonball (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 30 -- upvalues: u93 (upval), useAnimatorObserver (upval), Cannonball (upval)
            u93 = useAnimatorObserver.bind(p1.Humanoid.Animator, Cannonball, 4)
        end)
        useAnimatorObserver.play(Cannonball.Idle, 0.1)
    end,
    unequipped = function(p1) -- Line: 40 -- upvalues: u93 (ref)
        if u93 then
            u93()
            u93 = nil
        end
    end,
    data = {
        description = "A standard cannonball, used for firing from a cannon.",
        attributes = {"Ammunition"},
        category = require(Types:WaitForChild("Item")).CATEGORIES.Weapon,
    },
}