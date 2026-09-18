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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Farmables.Raw Fish
--                              Dumped in 0.000429 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Food = Common_2:WaitForChild("Food")
local Monologues = require(Food:WaitForChild("Monologues"))
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FoodClient = require(Utilities:WaitForChild("FoodClient"))
local u91 = nil
local u92 = nil
return {
    equipped = function(p1) -- Line: 35 -- upvalues: u91 (ref), FoodClient (val), u92 (ref), ClientEnchantmentsHandler (val), Monologues (val)
        u91 = FoodClient.bindAnimations()
        u92 = FoodClient.connectInput(p1, {
            canEat = function() -- Line: 40 -- upvalues: ClientEnchantmentsHandler (upval)
                return ClientEnchantmentsHandler.hasEnchantment("Gut of Steel")
            end,
            blockedMonologue = Monologues.RAW_FISH,
        })
    end,
    unequipped = function() -- Line: 48 -- upvalues: u91 (ref), u92 (ref)
        if u91 then
            u91()
            u91 = nil
        end
        if u92 then
            u92:Disconnect()
            u92 = nil
        end
    end,
    data = {
        description = "A raw fish.",
        attributes = {"Food", "Resource"},
        category = Item.CATEGORIES.Resource,
    },
}