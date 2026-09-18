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
--  File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Rare.Coinflip
--                              Dumped in 0.000297 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
return {
    requested = function(p1) -- Line: 31 -- upvalues: Sounds (val)
        if p1 == 1 then
            Sounds.playGlobalSoundEffect("rbxassetid://137769880655473", 0.1, 1)
            return
        end
        Sounds.playGlobalSoundEffect("rbxassetid://89103412867424", 0.1, 1)
    end,
    activated = function() -- Line: 27 -- upvalues: useAnimatorObserver (val), Enchantments (val)
        useAnimatorObserver.play(Enchantments.Coinflip, 0.1)
    end,
    settings = {
        description = "Flip a coin, and test your luck.",
        passive = false,
        upgradable = true,
        prerequisites = {
            wall = "Maria",
            enchantments = {"Lucky"},
        },
    },
}