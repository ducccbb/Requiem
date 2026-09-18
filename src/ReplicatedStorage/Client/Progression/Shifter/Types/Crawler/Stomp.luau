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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Abnormal.Stomp
--                              Dumped in 0.000652 seconds
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
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_2:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
return {
    onAbilityRequested = function(p1, ...) -- Line: 32 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), Debris (val), Character (val), Effects (val)
        local v1
        _, v1 = useWalkSpeed()
        local u9 = v1("stomp", 0, "set", 10)
        local v2 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if v2 and p1.model then
            local delay = 0
            local u20 = {p1.model}
            local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
            local u31 = v2.KeyframeReached:Connect(function(p1) -- Line: 46 -- upvalues: Debris (upval), HumanoidRootPart (val), delay (ref), u20 (val), Character (upval), Effects (upval)
                local v1
                Debris.circle(HumanoidRootPart.Position, delay * 10 + 20, delay * 2 + 5, 30, 0.3, u20, true)
                Debris.rocks(HumanoidRootPart.Position, 15, 5, 8, 150, 75, u20)
                _, _, v1 = Character.isGrounded()
                if v1 and v1.Position then
                    Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
                end
                delay = delay + 1
            end)
            task.delay(4, function() -- Line: 59 -- upvalues: u31 (val)
                u31:Disconnect()
            end)
        end
        task.delay(3.5, function() -- Line: 64 -- upvalues: u9 (val)
            u9(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 74 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), Character (val)
        local v1, v2, v3
        local v4 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if v4 and p1.model then
            v4.KeyframeReached:Wait()
        end
        _, _, v1 = Character.isGrounded(p1.model)
        if not v1 then
            return false
        end
        v2, v3 = Character.getDistance(v1.Position + Vector3.new(0, -25, 0))
        if not v3 or 150 < v2 then
            return false
        end
        return true, v2
    end,
}