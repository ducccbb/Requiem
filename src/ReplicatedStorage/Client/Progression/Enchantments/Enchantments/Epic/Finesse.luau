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
--   File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Epic.Finesse
--                              Dumped in 0.000290 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
return {
    activated = function() -- Line: 27 -- upvalues: useAnimatorObserver (val), Gear (val)
        useAnimatorObserver.play(Gear.Counter, 0.1)
    end,
    requested = function() -- Line: 31 -- upvalues: useAnimatorObserver (val), Gear (val)
        useAnimatorObserver.play(Gear.Blades.Swings[1], 0.1)
        useAnimatorObserver.stop(Gear.Counter, 0.1)
    end,
    settings = {
        description = "Your unparalleled agility and mastery of evasive maneuvers have allowed you to outmaneuver the grasp of a titan unscathed.",
        passive = false,
        upgradable = false,
        prerequisites = {wall = "Maria", enchantments = {}},
        blades = true,
        aerial = true,
    },
}