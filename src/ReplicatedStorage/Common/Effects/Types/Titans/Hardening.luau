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
--             File: ReplicatedStorage.Common.Effects.Types.Titans.Hardening
--                              Dumped in 0.000756 seconds
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
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Alive = require(Common_4:WaitForChild("Alive"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans_2:WaitForChild("ClientTitanHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Gear_2 = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_3 = Common_7:WaitForChild("Sounds")
local Titans = require(Sounds_3:WaitForChild("Titans"))
local u174 = {"My blades can't pierce through this!", "This is too hard for my blades to break through!", "My blades are too weak to break through this!"}
return function(p1, p2, p3, p4, p5, p6, p7) -- Line: 35 -- upvalues: ClientTitanHandler (val), Alive (val), ReplicatedStorage (val), Particles (val), Players (val), Signals (val), Gear (val), Sounds (val), Gear_2 (val), u174 (val), Titans (val)
    local Pivot, v1, v2, v3
    if typeof(p1) ~= "number" then
        v3 = p1
    else
        v3 = (function(p1) -- Line: 46 -- upvalues: ClientTitanHandler (upval), Alive (upval)
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
    end
    if not v3 then
        return
    end
    local UpperTorso = v3:WaitForChild("UpperTorso")
    if not UpperTorso then
        return
    end
    if not p6 then
        Pivot = UpperTorso.CFrame
    else
        Pivot = p6:GetPivot()
    end
    local v4 = p6 or UpperTorso
    local v5 = ReplicatedStorage.Assets.Particles.Titans.Damage.Hardening:Clone()
    local v6 = v4.Size.Y / 2
    v5.Parent = v4
    v5.CFrame = Pivot:ToObjectSpace(Pivot * CFrame.new(0, v6, v4.Size.Z / 2))
    Particles.deepEmitParticles(v5, true)
    if not p5 then
        v1, v2 = p3, p4
    elseif p7 then
        v1, v2 = p3, p4
    else
        v1 = 0
        v2 = false
    end
    if p2 == Players.LocalPlayer then
        local v7
        if not p5 then
            v7 = "Titan Ice"
        elseif not p7 then
            v7 = "Hardening"
        end
        local v8 = math.floor(v1)
        Signals.Damage:Fire(v7, v8, v2)
        if p5 and not p7 then
            Gear.Blades.unreliablePost(0, 1)
            Sounds.playGlobalSoundEffect(Gear_2.Blades.Break, 0.1, 2, 8, NumberRange.new(0.7, 1.2))
            v6 = u174[math.random(1, #u174)]
            Signals.Monologue:Fire(v6)
        end
        Sounds.playGlobalSoundEffect(Titans.Success, 0.1, 1.2, 8, NumberRange.new(1, 1.2))
        Sounds.playGlobalSoundEffect(Titans.HarendingBladeClash, 0.1, 0.8, 8, NumberRange.new(0.7, 1.2))
    end
end