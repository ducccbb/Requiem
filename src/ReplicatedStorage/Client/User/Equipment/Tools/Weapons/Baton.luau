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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Weapons.Baton
--                              Dumped in 0.000316 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local Character = script.Parent.Parent.Parent.Parent:WaitForChild("Character")
local CharacterCombatHandler = require(Character:WaitForChild("CharacterCombatHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Sabre = require(Tools:WaitForChild("Sabre"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
return {
    equipped = function(p1, p2) -- Line: 39 -- upvalues: CharacterCombatHandler (val), Sabre (val)
        CharacterCombatHandler.onLoadClientCombat({animations = Sabre}, "Baton")
    end,
    unequipped = function() -- Line: 48 -- upvalues: CharacterCombatHandler (val)
        local v1, v2
        v1, v2 = CharacterCombatHandler.isCombatLoaded()
        if v1 and v2 == "Baton" then
            CharacterCombatHandler.onUnloadClientCombat()
        end
    end,
    data = {description = "A standard baton, used for striking enemies.", category = require(Types:WaitForChild("Item")).CATEGORIES.Weapon},
}