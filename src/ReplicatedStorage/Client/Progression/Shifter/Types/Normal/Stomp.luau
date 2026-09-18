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
--         File: ReplicatedStorage.Client.Progression.Shifter.Types.Normal.Stomp
--                              Dumped in 0.000485 seconds
--                          Bytecode version 9  |  4 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 72 -- upvalues: useWalkSpeed (val)
        local v1
        _, v1 = useWalkSpeed()
        local u9 = v1("shatter", 0, "set", 15)
        task.delay(1, function() -- Line: 76 -- upvalues: u9 (val)
            u9(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 33 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), u0 (val), Character (val)
        local v1, v2
        local v3 = {min = 0.8, max = 1.2}
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 6, v3)
        local v4 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if v4 and p1.model then
            v4.KeyframeReached:Wait()
        end
        Sounds.playFalloffSoundEffect(Titans.JumpingMovementWoosh, p1.root, 800, 10)
        _, _, v1 = Character.isGrounded(p1.model)
        if not v1 then
            return false
        end
        v2, v3 = Character.getDistance(v1.Position + Vector3.new(0, -50, 0))
        if not v3 or 70 < v2 then
            return false
        end
        return true, v2
    end,
}