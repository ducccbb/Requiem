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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Other.Skin
--                              Dumped in 0.000909 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local AnimalSkinInteraction = require(Utilities:WaitForChild("AnimalSkinInteraction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Inventory = require(Namespaces_2:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Knife = require(Tools:WaitForChild("Knife"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics_2 = Common_8:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local u181 = nil
local function getClientInventoryHandler() -- Line: 24 -- upvalues: u181 (ref)
    local ClientInventoryHandler = u181
    if not ClientInventoryHandler then
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Client = ReplicatedStorage:WaitForChild("Client")
        local User = Client:WaitForChild("User")
        local Equipment = User:WaitForChild("Equipment")
        local Tools = Equipment:WaitForChild("Tools")
        ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
    end
    u181 = ClientInventoryHandler
    return u181
end
local function equippedToolName() -- Line: 34 -- upvalues: Inventory (val), Players (val), getClientInventoryHandler (val)
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
    local v2 = getClientInventoryHandler().getItemNameFromHash(value.hash)
    if not v2 or v2 == "" then
        return nil
    end
    return v2
end
local function hasCombatKnifeEquipped() -- Line: 49 -- upvalues: equippedToolName (val)
    local v1 = equippedToolName() == "Combat Knife"
    return v1
end
local v2 = {
    header = "Skin",
    body = "Press \"%s\" to skin the bear.",
    visible = function(p1) -- Line: 57 -- upvalues: hasCombatKnifeEquipped (val)
        if p1:GetAttribute("Skinned") or p1:GetAttribute("Dead") ~= true then
            return false
        end
        return hasCombatKnifeEquipped()
    end,
}
local u187 = false
return {
    interacted = function(p1) -- Line: 72 -- upvalues: u187 (ref), hasCombatKnifeEquipped (val), Character (val), Interaction (val), useWalkSpeed (val), useJumpPower (val), useAnimatorObserver (val), Knife (val), AnimalSkinInteraction (val)
        local v1, v2
        if u187 or not (hasCombatKnifeEquipped()) or p1:GetAttribute("Skinned") or p1:GetAttribute("Dead") ~= true then
            return
        end
        u187 = true
        local u15 = Character.getCharacter()
        if not u15 or not (u15:FindFirstChildWhichIsA("Humanoid")) then
            u187 = false
            Interaction.Event.unreliablePost(p1)
            return
        end
        _, v1 = useWalkSpeed()
        _, v2 = useJumpPower()
        local u31 = v1("skinning", 4, "set", 500)
        local u37 = v2("skinning", 0, "set", 500)
        local u38 = nil
        local v3 = pcall(function() -- Line: 100 -- upvalues: u38 (ref), useAnimatorObserver (upval), u15 (val), Knife (upval)
            u38 = useAnimatorObserver.playAnimationOnRig(u15, Knife.Skinning, 0.1, Enum.AnimationPriority.Action)
        end)
        local u42 = false
        local function commit() -- Line: 105 -- upvalues: u42 (ref), Interaction (upval), p1 (val), AnimalSkinInteraction (upval), u187 (upval), u31 (val), u37 (val)
            if u42 then
                return
            end
            u42 = true
            Interaction.Event.unreliablePost(p1)
            AnimalSkinInteraction.onBearSkinnedFromInteraction(p1)
            u187 = false
            u31()
            u37()
        end
        if not v3 or not u38 then
            commit()
            return
        end
        u38.Stopped:Once(commit)
    end,
    display = v2,
}