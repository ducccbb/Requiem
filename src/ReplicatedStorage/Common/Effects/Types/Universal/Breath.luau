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
--             File: ReplicatedStorage.Common.Effects.Types.Universal.Breath
--                              Dumped in 0.000273 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Breath = Particles_2:WaitForChild("Breath")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
return function(p1) -- Line: 19 -- upvalues: Breath (val), Particles (val)
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
    local u13 = Breath:FindFirstChildWhichIsA("Attachment"):Clone()
    u13.Parent = Head
    Particles.emitParticle(u13.ColdBreath)
    task.delay(0.6, function() -- Line: 39 -- upvalues: u13 (val)
        u13.ColdBreath.Enabled = false
    end)
    task.delay(2.5, function() -- Line: 43 -- upvalues: u13 (val)
        u13:Destroy()
    end)
end