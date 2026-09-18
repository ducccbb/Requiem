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
--         File: ReplicatedStorage.Common.Effects.Types.Titans.BerserkUniversal
--                              Dumped in 0.000323 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return function(p1) -- Line: 15 -- upvalues: Sounds (val), Titans (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    Sounds.playFalloffSoundEffect(Titans.BerserkRoar1, HumanoidRootPart, 15000, 2)
    Sounds.playGlobalSoundEffect(Titans.BerserkHeartbeat, 1, 2, 30, nil, 5)
    task.delay(1.3, function() -- Line: 24 -- upvalues: Sounds (upval), Titans (upval), HumanoidRootPart (val)
        Sounds.playFalloffSoundEffect(Titans.BerserkDowner, HumanoidRootPart, 15000, 3)
        task.wait(0.5)
        Sounds.playFalloffSoundEffect(Titans.BerserkDowner2, HumanoidRootPart, 15000, 4)
    end)
end