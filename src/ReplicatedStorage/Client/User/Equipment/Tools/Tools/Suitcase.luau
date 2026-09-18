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
--          File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Suitcase
--                              Dumped in 0.000341 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Suitcase = require(Tools:WaitForChild("Suitcase"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local v2 = {description = "A suitcase.", category = require(Types:WaitForChild("Item")).CATEGORIES.Tool}
local u95 = nil
return {
    equipped = function() -- Line: 31 -- upvalues: Character (val), u95 (ref), useAnimatorObserver (val), Suitcase (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 32 -- upvalues: u95 (upval), useAnimatorObserver (upval), Suitcase (upval)
            u95 = useAnimatorObserver.bind(p1.Humanoid.Animator, {Idle = Suitcase.Idle}, 2)
        end)
    end,
    unequipped = function() -- Line: 37 -- upvalues: u95 (ref)
        if u95 then
            u95()
            u95 = nil
        end
    end,
    data = v2,
}