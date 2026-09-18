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
--      File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Cooked Fish
--                              Dumped in 0.000262 seconds
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
local v2 = {
    description = "A cooked fish.",
    category = require(Types:WaitForChild("Item")).CATEGORIES.Consumables,
    attributes = {"Food"},
}
local u48 = nil
local u49 = nil
return {
    equipped = function(p1) -- Line: 26 -- upvalues: u48 (ref), FoodClient (val), u49 (ref)
        u48 = FoodClient.bindAnimations()
        u49 = FoodClient.connectInput(p1)
    end,
    unequipped = function() -- Line: 31 -- upvalues: u48 (ref), u49 (ref)
        if u48 then
            u48()
            u48 = nil
        end
        if u49 then
            u49:Disconnect()
            u49 = nil
        end
    end,
    data = v2,
}