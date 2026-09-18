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
--        File: ReplicatedStorage.Client.User.Miscellaneous.ClientAmbienceRunner
--                              Dumped in 0.000669 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Sounds_2 = Common:WaitForChild("Sounds")
local Ambience = require(Sounds_2:WaitForChild("Ambience"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_3 = Common_4:WaitForChild("Sounds")
local Universal = require(Sounds_3:WaitForChild("Universal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local PlaceId = game.PlaceId
local u117 = Sounds.createSoundFromId(Ambience.Daytime)
local u120 = Sounds.createSoundFromId(Ambience.Nighttime)
u117.Looped = true
u120.Looped = true
u117:AddTag("WorldAmbienceSoundEffect")
u120:AddTag("WorldAmbienceSoundEffect")
;(function() -- Line: 35 -- upvalues: PlaceId (val), Constants (val), useCharacterObserver (val), RunService (val), Lighting (val), u117 (val), u120 (val), Sounds (val), Universal (val)
    local u0 = nil
    local u1 = {}
    if PlaceId == Constants.Places.Lobby then
        return
    end
    useCharacterObserver(function(p1) -- Line: 43 -- upvalues: u0 (ref), RunService (upval), Lighting (upval), u1 (val), u117 (upval), u120 (upval), Sounds (upval), Universal (upval)
        u0 = RunService.RenderStepped:Connect(function() -- Line: 44 -- upvalues: p1 (val), Lighting (upval), u1 (upval), u117 (upval), u120 (upval), Sounds (upval), Universal (upval)
            local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart or p1:WaitForChild("Humanoid").Sit then
                return
            end
            local ClockTime = Lighting.ClockTime
            local v1 = if 6 <= ClockTime then ClockTime <= 18 else false
            if v1 ~= u1.Daytime or false then
                u1.Daytime = v1
                if not v1 then
                    u117:Stop()
                else
                    u117:Play()
                end
            end
            if not v1 ~= u1.Nighttime or false then
                u1.Nighttime = not v1
                if v1 then
                    u120:Stop()
                else
                    u120:Play()
                end
            end
            local Magnitude = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
            if 55 >= Magnitude then
                if Magnitude < 55 and u1.Wind then
                    u1.Wind = false
                    Sounds.stopGlobalSoundEffect(Universal.Wind, 2)
                end
                return
            end
            if not u1.Wind then
                u1.Wind = true
                Sounds.playGlobalSoundEffect(Universal.Wind, 2, 0.3)
                return
            end
            if Magnitude < 55 and u1.Wind then
                u1.Wind = false
                Sounds.stopGlobalSoundEffect(Universal.Wind, 2)
            end
        end)
        return function() -- Line: 91 -- upvalues: u0 (upval)
            u0:Disconnect()
        end
    end)
end)()
return {}