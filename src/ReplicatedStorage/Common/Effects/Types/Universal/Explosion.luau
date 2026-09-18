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
--           File: ReplicatedStorage.Common.Effects.Types.Universal.Explosion
--                              Dumped in 0.000436 seconds
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
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_2:WaitForChild("CharacterRagdollHandler"))
local Impulse = require(script.Parent:WaitForChild("Impulse"))
return function(p1) -- Line: 25 -- upvalues: Particles (val), Sounds (val), Universal (val), Character (val), CharacterRagdollHandler (val), Impulse (val)
    local v1, v2
    Particles.deepEmitParticles(p1)
    Sounds.playFalloffSoundEffect(Universal.ExplosionFar, p1, 6000, 1.5)
    Sounds.playFalloffSoundEffect(Universal.ExplosionNear, p1, 1000, 5)
    local v3 = Character.getCharacter()
    if not v3 then
        return
    end
    v1, v2 = Character.getDistance(p1.Position)
    if not v2 then
        return
    end
    if v1 < p1:GetAttribute("FalloffEndRadius") or 80 then
        CharacterRagdollHandler.ragdoll(2)
        local v4 = (v3.HumanoidRootPart.Position - p1.Position).Unit * Vector3.new(1, 0, 1)
        local v5 = v4 + Vector3.new(0, 1, 0)
        Impulse(v5 * 70, 0.8)
    end
end