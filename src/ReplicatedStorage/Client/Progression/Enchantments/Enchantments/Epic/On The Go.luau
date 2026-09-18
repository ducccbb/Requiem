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
--  File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Epic.On The Go
--                              Dumped in 0.000520 seconds
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
local Gear = require(Animations:WaitForChild("Gear"))
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
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
return {
    settings = {
        description = "You have become accustomed to wearing a gaspack, be able to refill half of your gas off your own gaspack.",
        passive = false,
        upgradable = false,
        prerequisites = {wall = "Maria", enchantments = {}},
        blocks = {enchantments = {}},
    },
    activated = function(p1) end,
    requested = function(p1) -- Line: 39 -- upvalues: useAnimatorObserver (val), Gear (val)
        if not (useAnimatorObserver.play(Gear.BladeRefill, 0.1)) then
            return
        end
    end,
    verify = function() -- Line: 46 -- upvalues: Character (val), ClientGearHandler (val), Signals (val)
        local Attribute, Interaction
        local v1 = Character.getCharacter()
        if not v1 then
            return false
        end
        local v2 = ClientGearHandler.getGearState()
        if not v2 or not v2.enabled then
            return false
        end
        for i, j in v1:GetChildren() do
            if j:HasTag("Accessory") and j.Name:gsub("attachment_", "") == "Gaspack" then
                Interaction = j:FindFirstChild("Interaction", true)
                if not Interaction then
                    Signals.Toast:Fire({message = "This gaspack is not equipped.", type = "error"})
                    return false
                end
                Attribute = Interaction:GetAttribute("Amount")
                if not Attribute then
                    print("no gas amount found on the gaspack.")
                    return false
                end
                if Attribute > 0 then
                    return true
                end
                Signals.Toast:Fire({message = "You have no gas in your gaspack.", type = "error"})
                return false
            end
        end
        Signals.Toast:Fire({message = "You must be wearing a gaspack to use this enchantment.", type = "error"})
        return false
    end,
}