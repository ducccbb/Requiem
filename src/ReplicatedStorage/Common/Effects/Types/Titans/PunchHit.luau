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
--             File: ReplicatedStorage.Common.Effects.Types.Titans.PunchHit
--                              Dumped in 0.000296 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return function(p1) -- Line: 16 -- upvalues: Alive (val), Sounds (val), Titans (val)
    local v1 = p1:IsA("Player")
    local v2 = p1:IsA("Model")
    local v3 = nil
    if not v1 then
        if v2 then
            v3 = p1:FindFirstChild("HumanoidRootPart")
        end
        if not v3 then
            return
        end
        Sounds.playFalloffSoundEffect(Titans.TitanPunchHit, v3, 2500, 3, 1)
        return
    end
    local v4 = Alive.getAliveCharacter(p1)
    if not v4 then
        return
    end
    v3 = v4:FindFirstChild("HumanoidRootPart")
    if not v3 then
        return
    end
    Sounds.playFalloffSoundEffect(Titans.TitanPunchHit, v3, 2500, 3, 1)
end