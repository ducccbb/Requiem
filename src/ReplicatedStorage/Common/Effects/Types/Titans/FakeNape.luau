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
--             File: ReplicatedStorage.Common.Effects.Types.Titans.FakeNape
--                              Dumped in 0.000442 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return function(p1, p2) -- Line: 24 -- upvalues: ReplicatedStorage (val), Particles (val), Signals (val), Sounds (val), Titans (val)
    if not p1 then
        return
    end
    local Parent = p1.Parent
    if not Parent then
        return
    end
    local Parent_2 = Parent.Parent
    if not Parent_2 or not Parent_2 then
        return
    end
    local UpperTorso = Parent_2:WaitForChild("UpperTorso")
    if not UpperTorso then
        return
    end
    local v1 = ReplicatedStorage.Assets.Particles.Titans.Damage.Nape:Clone()
    v1.Name = "NapeDamageFx"
    if v1:IsA("BasePart") then
        v1.Anchored = false
    end
    local v2 = UpperTorso.CFrame * CFrame.new(0, UpperTorso.Size.Y / 2, UpperTorso.Size.Z / 2)
    v1.Parent = UpperTorso
    v1.CFrame = UpperTorso.CFrame:ToObjectSpace(v2)
    Particles.deepEmitParticles(v1, true)
    local v3 = math.floor(p2)
    Signals.Damage:Fire("Titan Nape", v3, false)
    Sounds.playGlobalSoundEffect(Titans.Success, 0.1, 1.2, 8, NumberRange.new(1, 1.2))
end