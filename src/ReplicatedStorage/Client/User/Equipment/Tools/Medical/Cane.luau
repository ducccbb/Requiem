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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Medical.Cane
--                              Dumped in 0.000420 seconds
--                          Bytecode version 9  |  4 functions

local u118
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
local Cane = require(Tools:WaitForChild("Cane"))
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
local v2 = {description = "A cane which can be used to walk.", category = require(Types:WaitForChild("Item")).CATEGORIES.Medical}
local u95 = nil
local u96 = nil
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
_, u118 = require(Statistics:WaitForChild("useWalkSpeed"))()
return {
    equipped = function(p1, p2) -- Line: 42 -- upvalues: Character (val), u96 (ref), u118 (val), u95 (ref), useAnimatorObserver (val), Cane (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 43 -- upvalues: u96 (upval), u118 (upval), u95 (upval), useAnimatorObserver (upval), Cane (upval)
            u96 = u118("cane", 8, "set", 20)
            u95 = useAnimatorObserver.bind(p1.Humanoid.Animator, Cane, 4)
        end)
    end,
    unequipped = function() -- Line: 53 -- upvalues: u95 (ref), u96 (ref)
        if u95 then
            u95()
            u95 = nil
        end
        if u96 then
            u96()
            u96 = nil
        end
    end,
    data = v2,
}