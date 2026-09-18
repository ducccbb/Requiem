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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Common.Tether Controller
--                              Dumped in 0.000236 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local u43 = {}
u43[0] = {"I'll keep my tethering straightforward.", "No need to shift up and down for now."}
u43[1] = {"Time to make full use of my gear.", "I'll shift up and down when I need to."}
return {
    activated = function(p1, p2, p3, p4, p5) -- Line: 28 -- upvalues: ClientAttributesHandler (val), Signals (val), u43 (val)
        local TetherControlState = ClientAttributesHandler.getAttribute("TetherControlState")
        Signals.Monologue:Fire(u43[TetherControlState])
    end,
    settings = {
        description = "You can now toggle your Tether Control Proficiency on and off.",
        passive = false,
        upgradable = false,
        prerequisites = {wall = "Maria", enchantments = {}},
    },
}