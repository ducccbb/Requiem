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
--              File: ReplicatedStorage.Common.Effects.Types.Tools.Parried
--                              Dumped in 0.000248 seconds
--                          Bytecode version 9  |  3 functions

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
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Parries = Particles_2:WaitForChild("Tools"):WaitForChild("Parries")
return function(p1, p2) -- Line: 21 -- upvalues: Parries (val), Particles (val)
    local v1 = Parries:FindFirstChild(p2)
    if not v1 then
        return
    end
    local u10 = v1:Clone()
    u10.Parent = p1
    Particles.deepEmitParticles(u10)
    task.delay(1, function() -- Line: 32 -- upvalues: u10 (ref)
        u10:Destroy()
    end)
end