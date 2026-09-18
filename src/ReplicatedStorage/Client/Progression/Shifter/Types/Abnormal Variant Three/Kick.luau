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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Abnormal.Kick
--                              Dumped in 0.000844 seconds
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
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterPhysicsHandler = require(Universal_2:WaitForChild("ClientShifterPhysicsHandler"))
local Universal_3 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_3:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local CustomBezier = require(Utilities:WaitForChild("CustomBezier"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 78 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), ClientShifterPhysicsHandler (val), Character (val), Effects (val), Debris (val)
        local u3
        _, u3 = useWalkSpeed()
        local u12 = u3("kicking", 0, "set", 18, TweenInfo.new(0.5))
        local u20 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if u20 and p1.model then
            local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
            local new = CustomBezier.new
            local v1 = {}
            local v2 = {strength = 1, point = HumanoidRootPart.Position}
            local v3 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 10, -50)).Position}
            local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -100)).Position}
            v1[1] = v2
            v1[2] = v3
            v1[3] = v4
            local u50 = new(v1)
            task.delay(0.4, function() -- Line: 97 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (val), u50 (val), u20 (val), Character (upval), Effects (upval), HumanoidRootPart (val), Debris (upval), u3 (val)
                local v1
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u50, u20.Length - 0.5)
                _, _, v1 = Character.isGrounded()
                if v1 and v1.Position then
                    Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
                end
                Debris.circle(HumanoidRootPart.Position, 20, 5, 30, 0.3, {p1.model}, true)
                Debris.shockwave(HumanoidRootPart.Position, (HumanoidRootPart.CFrame * CFrame.new(0, 0, -100)).Position, 12, 0.7, 0.05, {p1.model})
                local u59 = u3("Standing", 0, "set", 19)
                task.delay(u20.Length - 0.5, function() -- Line: 117 -- upvalues: u59 (val)
                    u59(TweenInfo.new(0.4))
                end)
            end)
        end
        task.delay(1, function() -- Line: 123 -- upvalues: u12 (val)
            u12(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 36 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), Character (val)
        local model, v1, v2, v3
        local v4 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if v4 and p1.model then
            v4.KeyframeReached:Wait()
        end
        model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        _, _, v1 = Character.isGrounded(p1.model)
        if not v1 then
            return false
        end
        v2, v3 = Character.getDistance(v1.Position + model.CFrame.lookVector * 60 + Vector3.new(0, -25, 0))
        if not v3 or 150 < v2 then
            return false
        end
        return true, v2
    end,
}