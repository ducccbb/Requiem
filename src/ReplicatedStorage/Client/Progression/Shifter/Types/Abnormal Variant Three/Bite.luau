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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Abnormal.Bite
--                               Dumped in 0.00119 seconds
--                          Bytecode version 9  |  11 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
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
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Promise = require(Common_5:WaitForChild("Promise"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 111 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), Sounds (val), Titans (val), ClientShifterPhysicsHandler (val), Character (val), Effects (val), Debris (val)
        local u3
        _, u3 = useWalkSpeed()
        local u12 = u3("kicking", 0, "set", 18, TweenInfo.new(0.5))
        local u20 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if u20 and p1.model then
            local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
            local new = CustomBezier.new
            local v1 = {}
            local v2 = {strength = 1, point = HumanoidRootPart.Position}
            local v3 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 10, -100)).Position}
            local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -200)).Position}
            v1[1] = v2
            v1[2] = v3
            v1[3] = v4
            local u50 = new(v1)
            Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
            Sounds.playFalloffSoundEffect(Titans.BiteAllDirections, p1.root, 800, 10)
            task.delay(0.2, function() -- Line: 140 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (val), u50 (val), u20 (val), Character (upval), Effects (upval), HumanoidRootPart (val), Debris (upval), u3 (val)
                local v1
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u50, u20.Length - 0.65)
                _, _, v1 = Character.isGrounded()
                if v1 and v1.Position then
                    Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
                end
                Debris.circle(HumanoidRootPart.Position, 20, 5, 30, 0.3, {p1.model}, true)
                task.delay(u20.Length - 0.65, function() -- Line: 151 -- upvalues: Debris (upval), HumanoidRootPart (upval), p1 (upval)
                    local v1 = 3
                    local v2 = 1
                    for i = 1, v1, v2 do
                        Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, {p1.model}, true)
                    end
                end)
                local u45 = u3("Standing", 0, "set", 19)
                task.delay(u20.Length - 0.3, function() -- Line: 158 -- upvalues: u45 (val)
                    u45(TweenInfo.new(0.7))
                end)
            end)
        end
        task.delay(1, function() -- Line: 164 -- upvalues: u12 (val)
            u12(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 43 -- upvalues: Sounds (val), Titans (val), Promise (val), RunService (val), Character (val)
        local model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        local model_2 = p1.model
        if model_2 then
            model_2 = p1.model:FindFirstChild("Mouth")
        end
        if not model_2 then
            return false
        end
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.JumpingMovementWoosh, p1.root, 800, 10)
        task.wait(0.2)
        local huge = math.huge
        local v1 = Promise.new(function(p1) -- Line: 64 -- upvalues: RunService (upval), Character (upval), model_2 (val), model (val), huge (ref)
            local u1 = false
            local function finish(a1, p2) -- Line: 69 -- upvalues: u1 (ref), p1 (val)
                if u1 then
                    return
                end
                u1 = true
                p2:Disconnect()
                p1(a1)
            end
            local u3 = nil
            u3 = RunService.RenderStepped:Connect(function() -- Line: 84 -- upvalues: Character (upval), model_2 (upval), model (upval), huge (upval), finish (val), u3 (ref)
                local v1 = Character.getDistance(model_2.Position + model.CFrame.lookVector * 10)
                if v1 < huge then
                    huge = v1
                end
                if v1 >= 15 then
                    return
                end
                finish(true, u3)
            end)
            task.delay(0.7, function() -- Line: 97 -- upvalues: finish (val), u3 (ref)
                finish(false, u3)
            end)
        end):expect()
        if v1 then
            v1 = huge < 15
        end
        return v1, huge
    end,
}