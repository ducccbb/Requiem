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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterEffectHandler
--                              Dumped in 0.000539 seconds
--                          Bytecode version 9  |  8 functions

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
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
local function onReplicateDebris(p1, ...) -- Line: 21 -- upvalues: Player (val), Shifter (val)
    Player.Shifter.post(Shifter.Effects.Debris, p1, ...)
end
return {
    Debris = {
        circle = function(p1, p2, p3, p4, p5, p6, p7) -- Line: 34 -- upvalues: onReplicateDebris (val), Shifter (val)
            onReplicateDebris(Shifter.Effects.Debris, "circular", p1, p2, p3, p4, p5, p6, p7)
        end,
        shockwave = function(p1, p2, p3, p4, p5, p6) -- Line: 55 -- upvalues: onReplicateDebris (val), Shifter (val)
            onReplicateDebris(Shifter.Effects.Debris, "shockwave", p1, p2, p3, p4, p5, p6)
        end,
        gravity = function(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 75 -- upvalues: onReplicateDebris (val), Shifter (val)
            onReplicateDebris(Shifter.Effects.Debris, "gravity", p1, p2, p3, p4, p5, p6, p7, p8)
        end,
        rocks = function(p1, p2, p3, p4, p5, p6, p7) -- Line: 97 -- upvalues: onReplicateDebris (val), Shifter (val)
            onReplicateDebris(Shifter.Effects.Debris, "rocks", p1, p2, p3, p4, p5, p6, p7)
        end,
    },
    Effects = {
        particle = function(p1, ...) -- Line: 115 -- upvalues: Player (val), Shifter (val)
            Player.Shifter.post(Shifter.Effects.Particle, p1, ...)
        end,
        sound = function(p1, ...) -- Line: 125 -- upvalues: Player (val), Shifter (val)
            Player.Shifter.post(Shifter.Effects.Sound, p1, ...)
        end,
    },
}