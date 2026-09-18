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
--        File: ReplicatedStorage.Common.Effects.Types.Universal.EnableAttachment
--                              Dumped in 0.000325 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
return function(p1) -- Line: 15 -- upvalues: Particles (val), TweenService (val)
    local Attribute, Volume, v1
    Particles.deepEnableParticles(p1)
    local v2 = p1
    for k, v in pairs(p1:GetChildren()) do
        if v:IsA("Sound") and v.Name ~= "ACTIVE_SOUND_____" then
            if v then
                v = v:Clone()
                v.Name = "ACTIVE_SOUND_____"
                v.Parent = v2
            end
            if v then
                Volume = v.Volume
                v.Volume = 0
                v.Pitch = math.random(95, 110) / 100
                if not (v:GetAttribute("Volume")) then
                    v:SetAttribute("Volume", Volume)
                end
                Attribute = v:GetAttribute("Volume")
                v1 = TweenInfo.new(0.2)
                TweenService:Create(v, v1, {Volume = Attribute}):Play()
                v:Play()
            end
        end
    end
end