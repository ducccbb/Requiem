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
--               File: ReplicatedStorage.Common.Effects.Types.Titans.Nape
--                              Dumped in 0.000963 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local Blood = require(Universal:WaitForChild("Blood"))
local Universal_2 = v1.Parent.Parent:WaitForChild("Universal")
local Saturation = require(Universal_2:WaitForChild("Saturation"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Entities = Client_2:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans_2:WaitForChild("ClientTitanHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Gear = require(Types:WaitForChild("Gear"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Progression = Client_3:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_10:WaitForChild("Common")
local Alive = require(Common_6:WaitForChild("Alive"))
return function(p1, p2, p3, p4, p5) -- Line: 37 -- upvalues: ClientTitanHandler (val), Alive (val), ReplicatedStorage (val), Particles (val), Players (val), Blood (val), Signals (val), Sounds (val), Titans (val), Saturation (val), ClientAttributesHandler (val), ClientGearHandler (val), Gear (val)
    local v1 = (function(p1) -- Line: 40 -- upvalues: ClientTitanHandler (upval), Alive (upval)
        local v1 = ClientTitanHandler.getTitanById(p1)
        if v1 then
            if not v1 or not v1.model.client then
                return
            end
            return v1.model.client
        end
        local v2 = Alive.getAlivePlayerById(p1)
        if v2 then
            return Alive.getAliveCharacter(v2)
        end
        if not v1 or not v1.model.client then
            return
        end
        return v1.model.client
    end)(p1)
    if not v1 then
        return
    end
    local UpperTorso = v1:WaitForChild("UpperTorso")
    if not UpperTorso then
        return
    end
    local v2 = ReplicatedStorage.Assets.Particles.Titans.Damage.Nape:Clone()
    v2.Name = "NapeDamageFx"
    if v2:IsA("BasePart") then
        v2.Anchored = false
    end
    local v3 = UpperTorso.CFrame * CFrame.new(0, UpperTorso.Size.Y / 2, UpperTorso.Size.Z / 2)
    v2.Parent = UpperTorso
    v2.CFrame = UpperTorso.CFrame:ToObjectSpace(v3)
    Particles.deepEmitParticles(v2, true)
    if p2 == Players.LocalPlayer then
        Blood(1)
    end
    if p2 ~= Players.LocalPlayer then
        return
    end
    local v4 = math.floor(p3)
    Signals.Damage:Fire("Titan Nape", v4, p5)
    Sounds.playGlobalSoundEffect(Titans.Success, 0.1, 1.2, 8, NumberRange.new(1, 1.2))
    if not p4 then
        return
    end
    Saturation()
    local HasBloodIsFuel = ClientAttributesHandler.getAttribute("HasBloodIsFuel")
    if not HasBloodIsFuel or HasBloodIsFuel ~= 1 then
        return
    end
    local v5 = ClientGearHandler.getGearState()
    if not v5 then
        return
    end
    v5.gas = math.clamp(v5.gas + Gear.Constants.MAX_GAS * 0.08, 0, Gear.Constants.MAX_GAS)
end