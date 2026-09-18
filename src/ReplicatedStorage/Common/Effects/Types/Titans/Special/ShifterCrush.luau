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
--       File: ReplicatedStorage.Common.Effects.Types.Titans.Special.ShifterCrush
--                              Dumped in 0.000293 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Special = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Special")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return function(p1) -- Line: 25 -- upvalues: Special (val), Particles (val), Sounds (val), Titans (val)
    local Crush = Special:WaitForChild("Crush")
    local v1 = Crush:FindFirstChild("Attachment"):Clone()
    v1.Parent = p1:FindFirstChild("RightHand")
    Particles.deepEmitParticles(v1, true)
    local RightHand = p1:FindFirstChild("RightHand")
    Sounds.playFalloffSoundEffect(Titans.Crush, RightHand, 2000, 5, {min = 0.8, max = 1.2})
end