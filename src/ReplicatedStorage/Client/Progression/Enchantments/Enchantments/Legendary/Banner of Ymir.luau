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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Legendary.Banner of Ymir
--                              Dumped in 0.000469 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local u95 = 0
local u96 = nil
return {
    requested = function(p1) -- Line: 38 -- upvalues: u95 (ref), u96 (ref)
        u95 = p1.level
        u96 = p1.model
    end,
    activated = function(p1) -- Line: 31 -- upvalues: useAnimatorObserver (val), Enchantments (val), u95 (ref), u96 (ref)
        useAnimatorObserver.play(Enchantments.FlagDown, 0.1).KeyframeReached:Once(function() -- Line: 33 -- upvalues: p1 (val), u95 (upval), u96 (upval)
            p1(u95 or 0, u96)
        end)
    end,
    verify = function() -- Line: 43 -- upvalues: Server (val), Signals (val)
        local v1 = Server.Store.client()
        if not v1 then
            return false
        end
        if not v1.deadzone or v1.deadzone ~= 1 then
            return true
        end
        Signals.Toast:Fire({message = "You cannot use this enchantment in a deadzone.", type = "error"})
        return false
    end,
    settings = {
        description = "",
        passive = false,
        upgradable = false,
        prerequisites = {wall = "Sina", enchantments = {}},
        icon = "rbxassetid://108117311697557",
    },
}