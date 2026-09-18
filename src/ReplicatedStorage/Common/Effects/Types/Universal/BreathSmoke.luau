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
--          File: ReplicatedStorage.Common.Effects.Types.Universal.BreathSmoke
--                              Dumped in 0.000271 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local SmokeBreath = Particles_2:WaitForChild("SmokeBreath")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
return function(p1) -- Line: 19 -- upvalues: SmokeBreath (val), Particles (val)
    if not p1 then
        return
    end
    local Character = p1.Character
    if not Character then
        return
    end
    local Head = Character:FindFirstChild("Head")
    if not Head then
        return
    end
    local u13 = SmokeBreath:FindFirstChildWhichIsA("Attachment"):Clone()
    u13.Parent = Head
    Particles.deepEmitDelayedParticles(u13)
    task.delay(2.5, function() -- Line: 39 -- upvalues: u13 (val)
        u13:Destroy()
    end)
end