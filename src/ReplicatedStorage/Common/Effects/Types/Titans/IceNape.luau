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
--              File: ReplicatedStorage.Common.Effects.Types.Titans.IceNape
--                              Dumped in 0.000560 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Entities_2 = Client_2:WaitForChild("Entities")
local Titans_2 = Entities_2:WaitForChild("Titans")
local Utilities = Titans_2:WaitForChild("Utilities")
local NapeProtectionTitanClient = require(Utilities:WaitForChild("NapeProtectionTitanClient"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
return function(p1, p2, p3, p4, p5) -- Line: 20 -- upvalues: ClientTitanHandler (val), NapeProtectionTitanClient (val), ReplicatedStorage (val), Particles (val)
    local v1 = ClientTitanHandler.getTitanById(p1)
    local client = v1
    if client then
        client = v1.model.client
    end
    if not client then
        return
    end
    NapeProtectionTitanClient.applyLayerVisual(client, p3, p4, p5)
    local UpperTorso = client:FindFirstChild("UpperTorso")
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if UpperTorso and Assets then
        local v2 = Assets:FindFirstChild("Particles")
        if v2 then
            v2 = v2:FindFirstChild("Titans")
            if v2 then
                v2 = v2:FindFirstChild("Damage")
                if v2 then
                    local Nape = v2:FindFirstChild("Nape")
                    if Nape and Nape:IsA("BasePart") then
                        local v3 = Nape:Clone()
                        v3.Name = "NapeDamageFx"
                        v3.Anchored = false
                        local v4 = UpperTorso.CFrame * CFrame.new(0, UpperTorso.Size.Y / 2, UpperTorso.Size.Z / 2)
                        v3.CFrame = UpperTorso.CFrame:ToObjectSpace(v4)
                        v3.Parent = UpperTorso
                        Particles.deepEmitParticles(v3, true)
                    end
                end
            end
        end
    end
end