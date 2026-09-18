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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Legendary.Light Reflex
--                              Dumped in 0.000286 seconds
--                          Bytecode version 9  |  2 functions

local u0 = script
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
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
Signals.PlayerDashBoosted:Connect(function() -- Line: 34 -- upvalues: u0 (val), Enchantments (val)
    if not (require(u0.Parent.Parent.Parent:WaitForChild("ClientEnchantmentsHandler")).hasEnchantment("Light Reflex")) then
        return
    end
    Enchantments.Request.unreliablePost("Light Reflex")
end)
return {
    settings = {
        description = "In the first 0.2 seconds of Upshift and Airshift you receive Iframes. If you get attacked while iframes, green pulse plays on success.",
        passive = true,
        upgradable = false,
        gear = true,
        aerial = true,
        prerequisites = {
            wall = "Maria",
            enchantments = {},
            sacraments = {Celerity = 5, Dexterity = 2},
            proficiency = {tree = "Skills", node = "Airshift"},
        },
    },
}