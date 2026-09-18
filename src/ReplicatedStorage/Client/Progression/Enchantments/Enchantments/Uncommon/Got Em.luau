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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Uncommon.Got Em
--                              Dumped in 0.000806 seconds
--                          Bytecode version 9  |  5 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_2:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Miscellaneous = User_2:WaitForChild("Miscellaneous")
local ClientStrangerHandler = require(Miscellaneous:WaitForChild("ClientStrangerHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u101 = {
    "Got em.",
    "Hooked.",
    "Locked.",
    "Snagged.",
    "Mine.",
    "Caught.",
    "Reeled.",
    "Nailed.",
    "Tagged.",
    "Secured.",
    "There.",
    "Too slow.",
}
local u114 = {
    {text = "Looks like I'm hooking onto %s.", lowercase = true},
    {text = "Hooking onto %s.", lowercase = true},
    {text = "That's %s.", lowercase = true},
}
local u118 = 0
local u119 = nil
local function getPlayerGrappleTarget(p1) -- Line: 50 -- upvalues: Players (val)
    local Parent, Parent_2
    if not p1 or not p1.Parent then
        return nil
    end
    Parent = p1.Parent
    if not Parent then
        return nil
    end
    if not (Parent:IsA("Model")) then
        Parent_2 = Parent.Parent
    else
        Parent_2 = Parent
    end
    if not Parent_2 or not (Parent_2:IsA("Model")) then
        return nil
    end
    local PlayerFromCharacter = Players:GetPlayerFromCharacter(Parent_2)
    if not PlayerFromCharacter or PlayerFromCharacter == Players.LocalPlayer or Parent_2:HasTag("Shifter") or not (Parent_2:HasTag("Alive")) then
        return nil
    end
    return PlayerFromCharacter
end
local function getFriendOrFoeMessage(p1) -- Line: 77 -- upvalues: u114 (val), ClientStrangerHandler (val), Players (val)
    local v1 = u114[math.random(1, #u114)]
    local v2 = ClientStrangerHandler.getPlayerName(Players.LocalPlayer, p1, v1.lowercase)
    return string.format(v1.text, v2)
end
local function onGrappleLanded(p1, p2, p3) -- Line: 83 -- upvalues: getPlayerGrappleTarget (val), u119 (ref), u0 (val), u118 (ref), Signals (val), getFriendOrFoeMessage (val), u101 (val)
    if not p3 or not p1.hit then
        return
    end
    local v1 = getPlayerGrappleTarget(p1.hit)
    if not v1 then
        return
    end
    local ClientEnchantmentsHandler = u119
    if not ClientEnchantmentsHandler then
        ClientEnchantmentsHandler = require(u0.Parent.Parent.Parent:WaitForChild("ClientEnchantmentsHandler"))
    end
    u119 = ClientEnchantmentsHandler
    local v2 = u119.hasEnchantment("Got Em")
    local v3 = u119.hasEnchantment("Friend or Foe")
    if not v2 then
        return
    end
    local v4 = tick()
    local v5 = v4 - u118
    if v5 < 3 then
        return
    end
    u118 = v4
    if v3 then
        Signals.Monologue:Fire(getFriendOrFoeMessage(v1))
        return
    end
    Signals.Monologue:Fire(u101)
end
local function bindGear(p1) -- Line: 116 -- upvalues: onGrappleLanded (val)
    p1.trove:Add(p1.signals.grapple:Connect(onGrappleLanded))
end
ClientGearHandler.onGearAdded:Connect(bindGear)
local v2 = ClientGearHandler.getGearState()
if v2 then
    bindGear(v2)
end
return {
    settings = {
        description = "A short line appears when you land a player grapple.",
        passive = true,
        upgradable = false,
        prerequisites = {wall = "Maria", enchantments = {}},
    },
}