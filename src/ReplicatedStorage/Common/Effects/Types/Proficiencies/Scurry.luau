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
--           File: ReplicatedStorage.Common.Effects.Types.Proficiencies.Scurry
--                              Dumped in 0.000251 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Proficiencies = require(Sounds_2:WaitForChild("Proficiencies"))
local Effects = require(script.Parent.Parent.Parent:WaitForChild("Effects"))
return function() -- Line: 17 -- upvalues: Sounds (val), Proficiencies (val), Effects (val)
    Sounds.playGlobalSoundEffect(Proficiencies.Scurry, 0.2, 0.3, 5)
    Sounds.playGlobalSoundEffect(Proficiencies.Heartbeat, 0.2, 0.7, 5)
    Effects.Screen.__createClientScreenEffect({name = "Heal", color = Color3.fromRGB(0, 255, 94)})
    task.wait(5)
    Effects.Screen.__removeClientScreenEffect("Heal")
end