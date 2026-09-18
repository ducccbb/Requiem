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
--   File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Rare.Control
--                              Dumped in 0.000345 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local u49 = {
    {"I don't care to protect my friends anymore.", "My friends are on their own."},
}
u49[0] = {"My friends are my responsibility.", "I will protect them at all costs."}
return {
    verify = function() -- Line: 30 -- upvalues: Players (val), Signals (val)
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer or not (LocalPlayer:GetAttribute("Actor")) then
            return true
        end
        Signals.Toast:Fire({message = "Discipline cannot be used on an actor slot.", type = "error"})
        return false
    end,
    activated = function(p1, p2, p3, p4, p5) -- Line: 43 -- upvalues: ClientAttributesHandler (val), Signals (val), u49 (val)
        local DisciplineControlState = ClientAttributesHandler.getAttribute("DisciplineControlState")
        Signals.Monologue:Fire(u49[DisciplineControlState])
    end,
    settings = {
        description = "Toggle your discipline protections on or off.",
        passive = false,
        upgradable = false,
        prerequisites = {
            wall = "Maria",
            enchantments = {"Discipline"},
        },
    },
}