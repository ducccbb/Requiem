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
--               File: ReplicatedStorage.Common.Effects.Types.Titans.Eyes
--                              Dumped in 0.000584 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local Universal = script.Parent.Parent:WaitForChild("Universal")
local Blood = require(Universal:WaitForChild("Blood"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
return function(p1, p2, p3, p4) -- Line: 23 -- upvalues: ClientTitanHandler (val), ReplicatedStorage (val), Particles (val), Players (val), Blood (val), Signals (val)
    local v1 = ClientTitanHandler.getTitanById(p1)
    if not v1 then
        return
    end
    local client = v1.model.client
    if not client then
        return
    end
    local Splatters = ReplicatedStorage.Assets.Particles.Titans.Damage.Splatters
    local v2 = client:FindFirstChild("Eye.L")
    local v3 = client:FindFirstChild("Eye.R")
    if not v2 or not v3 then
        return
    end
    local u26 = Splatters:Clone()
    local u29 = Splatters:Clone()
    u26.Parent = v2
    u29.Parent = v3
    Particles.deepEnableParticles(u26)
    Particles.deepEnableParticles(u29)
    task.delay(0.4, function() -- Line: 52 -- upvalues: Particles (upval), u26 (val), u29 (val)
        Particles.deepDisableParticles(u26)
        Particles.deepDisableParticles(u29)
        task.wait(2)
        u26:Destroy()
        u29:Destroy()
    end)
    if p2 == Players.LocalPlayer then
        Blood(1)
    end
    if p2 == Players.LocalPlayer then
        local v4 = math.floor(p3)
        Signals.Damage:Fire("Titan Eyes", v4, p4)
    end
end