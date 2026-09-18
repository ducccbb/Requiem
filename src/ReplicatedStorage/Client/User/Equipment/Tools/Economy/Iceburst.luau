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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Economy.Iceburst
--                              Dumped in 0.000382 seconds
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
local Iceburst = require(Tools:WaitForChild("Iceburst"))
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
    description = "An iceburst, coming from the deepest mines of Eldia.",
    attributes = {"Iceburst"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Economy,
}
local u97 = nil
return {
    equipped = function() -- Line: 40 -- upvalues: Character (val), u97 (ref), useAnimatorObserver (val), Iceburst (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 41 -- upvalues: u97 (upval), useAnimatorObserver (upval), Iceburst (upval)
            u97 = useAnimatorObserver.bind(p1.Humanoid.Animator, Iceburst, 4)
        end)
    end,
    unequipped = function() -- Line: 49 -- upvalues: u97 (ref)
        if u97 then
            u97()
            u97 = nil
        end
    end,
    data = v2,
}