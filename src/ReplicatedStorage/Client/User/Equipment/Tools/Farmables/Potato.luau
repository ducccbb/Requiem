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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Farmables.Potato
--                              Dumped in 0.000286 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FoodClient = require(Utilities:WaitForChild("FoodClient"))
local u49 = nil
local u50 = nil
return {
    equipped = function(p1) -- Line: 27 -- upvalues: u49 (ref), FoodClient (val), u50 (ref)
        u49 = FoodClient.bindAnimations()
        u50 = FoodClient.connectInput(p1)
    end,
    unequipped = function() -- Line: 32 -- upvalues: u49 (ref), u50 (ref)
        if u49 then
            u49()
            u49 = nil
        end
        if u50 then
            u50:Disconnect()
            u50 = nil
        end
    end,
    data = {
        description = "A potato.",
        attributes = {"Food", "Resource"},
        category = Item.CATEGORIES.Resource,
    },
}