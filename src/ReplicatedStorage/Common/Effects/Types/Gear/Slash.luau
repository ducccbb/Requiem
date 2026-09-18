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
--                File: ReplicatedStorage.Common.Effects.Types.Gear.Slash
--                              Dumped in 0.000772 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Universal = script.Parent.Parent:WaitForChild("Universal")
local Blood = require(Universal:WaitForChild("Blood"))
return function(p1, p2, p3, p4) -- Line: 22 -- upvalues: ClientTitanHandler (val), Players (val), Blood (val), ReplicatedStorage (val), Particles (val)
    local v1
    if not p2 then
        v1 = p1
        if not v1 then
            return
        end
        local Character = Players.LocalPlayer.Character
        local HumanoidRootPart = Character
        if HumanoidRootPart then
            HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return
        end
        if p4 and p4 == HumanoidRootPart and (v1.Position - HumanoidRootPart.Position).Magnitude < 20 then
            Blood(1)
        end
        local v2 = ReplicatedStorage.Assets.Particles.Gore.Slash:Clone()
        v2.Parent = v1
        Particles.deepEmitParticles(v2, true)
        return
    elseif not p3 then
        v1 = p1
    else
        local v3 = ClientTitanHandler.getTitanById(p2)
        if not v3 then
            return
        end
        v1 = v3.model.client:FindFirstChild(p3)
    end
end