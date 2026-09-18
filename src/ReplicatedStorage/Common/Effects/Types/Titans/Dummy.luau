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
--               File: ReplicatedStorage.Common.Effects.Types.Titans.Dummy
--                              Dumped in 0.000527 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
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
local Training = require(Sounds_2:WaitForChild("Training"))
local Universal = script.Parent.Parent:WaitForChild("Universal")
local Saturation = require(Universal:WaitForChild("Saturation"))
return function(p1, p2, p3, p4) -- Line: 27 -- upvalues: Sounds (val), Training (val), ReplicatedStorage (val), Particles (val), Signals (val), Workspace (val), Saturation (val)
    local u43, v1
    local Parent = p2.Parent
    local Parent_2 = Parent
    if Parent_2 then
        Parent_2 = Parent.Parent
    end
    if not Parent_2 then
        u43 = ReplicatedStorage.Assets.Particles.Titans.Damage.Dummy:Clone()
        u43.Parent = p2
        Particles.deepEmitParticles(u43)
        Signals.Damage:Fire("Dummy Nape", (math.floor(p4)))
        v1 = Workspace:GetAttribute("Napes") or 0
        Workspace:SetAttribute("Napes", v1 + 1)
        task.delay(5, function() -- Line: 55 -- upvalues: u43 (val)
            u43:Destroy()
        end)
        Saturation()
        return
    end
    if Parent_2:GetAttribute("Knocked") then
        return
    end
    Sounds.playGlobalSoundEffect(Training.Hit, 0.1, 2.5)
    Sounds.playGlobalSoundEffect(Training.Sand, 0.1, 2.5)
    Parent_2:SetAttribute("Knocked", true)
    task.delay(15, function() -- Line: 41 -- upvalues: Parent_2 (val)
        Parent_2:SetAttribute("Knocked", false)
    end)
    u43 = ReplicatedStorage.Assets.Particles.Titans.Damage.Dummy:Clone()
    u43.Parent = p2
    Particles.deepEmitParticles(u43)
    Signals.Damage:Fire("Dummy Nape", (math.floor(p4)))
    v1 = Workspace:GetAttribute("Napes") or 0
    Workspace:SetAttribute("Napes", v1 + 1)
    task.delay(5, function() -- Line: 55 -- upvalues: u43 (val)
        u43:Destroy()
    end)
    Saturation()
end