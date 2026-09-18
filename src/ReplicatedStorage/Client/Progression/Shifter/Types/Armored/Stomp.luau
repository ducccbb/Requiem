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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Armored.Stomp
--                              Dumped in 0.000918 seconds
--                          Bytecode version 9  |  6 functions

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
local Shifter = require(Types:WaitForChild("Shifter"))
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
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities_2 = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_2:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_4:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_2:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 81 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), Debris (val), Character (val), Effects (val), HitboxTitanClient (val), Player (val), Shifter (val)
        local v1
        _, v1 = useWalkSpeed()
        local u9 = v1("shatter", 0, "set", 15)
        local v2 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if v2 and p1.model then
            local u19 = {p1.model}
            local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
            v2.KeyframeReached:Once(function(p1) -- Line: 95 -- upvalues: Debris (upval), HumanoidRootPart (val), u19 (val), Character (upval), Effects (upval)
                local v1
                Debris.gravity(HumanoidRootPart.Position, 20, 15, 6, 70, 0.5, 4, u19)
                Debris.rocks(HumanoidRootPart.Position, 15, 10, 20, 200, 100, u19)
                _, _, v1 = Character.isGrounded()
                if v1 and v1.Position then
                    Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
                end
                local v2 = 5
                local v3 = 1
                for i = 1, v2, v3 do
                    Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, u19, false)
                end
            end)
        end
        task.delay(1, function() -- Line: 110 -- upvalues: u9 (val)
            u9(TweenInfo.new(1))
        end)
        if not v2 then
            return
        end
        task.delay(v2.Length / 2, function() -- Line: 123 -- upvalues: HitboxTitanClient (upval), p1 (val), Player (upval), Shifter (upval)
            local v1, v2
            v1, v2 = HitboxTitanClient.onCreateEnvironmentalHitbox(p1.root, (Vector3.new(0, -100, 0)))
            if v1 and v2 then
                Player.Shifter.post(Shifter.Effects.Environment, v2)
            end
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 42 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), u0 (val), Character (val)
        local v1, v2
        local v3 = {min = 0.8, max = 1.2}
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, v3)
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
        if not v3 or 200 < v2 then
            return false
        end
        return true, v2
    end,
}