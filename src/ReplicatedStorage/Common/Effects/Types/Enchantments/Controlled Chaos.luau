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
--      File: ReplicatedStorage.Common.Effects.Types.Enchantments.Controlled Chaos
--                              Dumped in 0.000284 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Enchantments = Particles_2:WaitForChild("Enchantments")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
return function(p1) -- Line: 19 -- upvalues: Enchantments (val), Particles (val)
    if not p1 then
        return
    end
    local v1 = Enchantments:WaitForChild("Controlled Chaos")
    local Buff = v1:WaitForChild("Buff")
    local u16 = Buff:FindFirstChildWhichIsA("Attachment"):Clone()
    u16.Parent = p1
    Particles.deepEmitParticles(u16)
    task.delay(1.5, function() -- Line: 30 -- upvalues: u16 (val)
        u16:Destroy()
    end)
end