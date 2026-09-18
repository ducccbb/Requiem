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
--   File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Optimized Ration
--                              Dumped in 0.000254 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FoodClient = require(Utilities:WaitForChild("FoodClient"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local v2 = {description = "Military given ration.", usageAmount = 4, category = require(Types:WaitForChild("Item")).CATEGORIES.Consumables}
local u46 = nil
local u47 = nil
return {
    equipped = function(p1) -- Line: 26 -- upvalues: u46 (ref), FoodClient (val), u47 (ref)
        u46 = FoodClient.bindAnimations()
        u47 = FoodClient.connectInput(p1)
    end,
    unequipped = function() -- Line: 31 -- upvalues: u46 (ref), u47 (ref)
        if u46 then
            u46()
            u46 = nil
        end
        if u47 then
            u47:Disconnect()
            u47 = nil
        end
    end,
    data = v2,
}