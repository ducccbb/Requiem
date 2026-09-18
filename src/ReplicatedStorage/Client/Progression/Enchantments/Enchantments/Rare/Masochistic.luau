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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Rare.Masochistic
--                              Dumped in 0.000716 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment_2 = User_2:WaitForChild("Equipment")
local Tools = Equipment_2:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local u147 = {}
u147["Combat Knife"] = true
u147.Sabre = true
local function getEquippedToolName() -- Line: 43 -- upvalues: Inventory (val), Players (val), ClientInventoryHandler (val)
    local value
    local v1 = Inventory.Tool.get(Players.LocalPlayer)
    if not v1 then
        value = v1
    else
        value = v1.value
        if not value then
            value = v1
        end
    end
    if not value or value.hash == 0 then
        return nil
    end
    local v2 = ClientInventoryHandler.getItemNameFromHash(value.hash)
    if not v2 or v2 == "" then
        return nil
    end
    return v2
end
local function hasBladesOut() -- Line: 62 -- upvalues: ClientGearHandler (val)
    local v1 = ClientGearHandler.getGearState()
    local blades = false
    if v1 ~= nil then
        blades = v1.blades
        if blades then
            blades = v1.handles
        end
    end
    return blades
end
return {
    activated = function() -- Line: 93 -- upvalues: useAnimatorObserver (val), Enchantments (val)
        useAnimatorObserver.play(Enchantments.Masochistic, 0.1)
    end,
    requested = function(p1) -- Line: 101 -- upvalues: Signals (val)
        if p1.resetCooldown then
            Signals.EnchantmentCooldownAdjusted:Fire({name = "Masochistic", remaining = 0})
        end
    end,
    verify = function() -- Line: 71 -- upvalues: hasBladesOut (val), getEquippedToolName (val), u147 (val), Signals (val)
        if hasBladesOut() then
            return true
        end
        local v1 = getEquippedToolName()
        if not v1 then
            Signals.Toast:Fire({message = "You need to have your blades out or hold a Combat Knife or Sabre to use this enchantment.", type = "error"})
            return false
        end
        if u147[v1] then
            return true
        end
        Signals.Toast:Fire({message = "You need to have your blades out or hold a Combat Knife or Sabre to use this enchantment.", type = "error"})
        return false
    end,
    settings = {
        description = "Slice yourself, giving you a damage buff for a certain amount of time.",
        drawbacks = "You take twenty percent of your max health.",
        passive = false,
        upgradable = false,
        prerequisites = {wall = "Maria", enchantments = {}},
    },
}