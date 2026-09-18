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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Mythic.Anamnesis
--                              Dumped in 0.000331 seconds
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
local Awakening = require(Namespaces:WaitForChild("Awakening"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
return {
    activated = function(p1, p2, p3, p4, p5) -- Line: 27 -- upvalues: Signals (val)
        Signals.Monologue:Fire("The strenth fueled by anamnesis, it wavers...")
        Signals.Monologue:Fire("I mourn those who have fallen...")
        Signals.Monologue:Fire("I will not falter, yet I am not strong enough...")
    end,
    verify = function() -- Line: 33 -- upvalues: Awakening (val)
        local v1 = Awakening.Awakening.client()
        if v1.has == 0 or v1.value < 100 then
            return false
        end
        local v2 = v1.value == 100
        return v2
    end,
    settings = {
        description = "Their deaths became my burden, and saving the living became my curse. I must learn more to unlock my true potential...",
        passive = false,
        upgradable = false,
        art = "rbxassetid://89402921332743",
        glow = Color3.fromRGB(255, 92, 92),
        embers = Color3.fromRGB(255, 67, 54),
        pulse = true,
    },
}