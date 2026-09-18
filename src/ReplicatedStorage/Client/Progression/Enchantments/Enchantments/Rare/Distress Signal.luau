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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Rare.Distress Signal
--                              Dumped in 0.000402 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u67 = {}
u67[0] = {"I'll keep my distress signal to myself.", "No flare when I'm out of gas."}
u67[1] = {"If I run dry, they'll see the signal.", "My distress flare is armed."}
Signals.OnGasDepleted:Connect(function() -- Line: 29 -- upvalues: ClientAttributesHandler (val), Enchantments (val)
    if ClientAttributesHandler.getAttribute("DistressSignalState") ~= 1 then
        return
    end
    Enchantments.Request.unreliablePost("Distress Signal")
end)
return {
    activated = function(p1) -- Line: 37 -- upvalues: ClientAttributesHandler (val), Signals (val), u67 (val)
        local v1
        if ClientAttributesHandler.getAttribute("DistressSignalState") ~= 0 then
            v1 = 0
        else
            v1 = 1
        end
        Signals.Monologue:Fire(u67[v1])
    end,
    requested = function() end,
    settings = {
        description = "When your gas reaches 0%, you fire a purple flare. Toggle on or off with a hotkey.",
        passive = false,
        upgradable = false,
        prerequisites = {
            wall = "Maria",
            enchantments = {"Emergency Flare"},
        },
    },
}