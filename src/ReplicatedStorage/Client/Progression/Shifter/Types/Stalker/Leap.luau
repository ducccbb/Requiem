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
--         File: ReplicatedStorage.Client.Progression.Shifter.Types.Stalker.Leap
--                               Dumped in 0.00151 seconds
--                          Bytecode version 9  |  18 functions

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
local RunService = game:GetService("RunService")
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterPhysicsHandler = require(Universal_2:WaitForChild("ClientShifterPhysicsHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
local Universal_3 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local Debris = require(Universal_3:WaitForChild("ClientShifterEffectHandler")).Debris
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Effects_2 = Common_3:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local CustomBezier = require(Utilities_2:WaitForChild("CustomBezier"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Promise = require(Common_6:WaitForChild("Promise"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_4 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 162 -- upvalues: useWalkSpeed (val), u0 (val), ClientShifterAnimationHandler (val), CustomBezier (val), Sounds (val), Titans (val), ClientShifterPhysicsHandler (val), Debris (val)
        local u3
        _, u3 = useWalkSpeed()
        local u12 = u3("kicking", 0, "set", 18, TweenInfo.new(0.5))
        local u21 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u21 or not p1.model then
            return
        end
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        local new = CustomBezier.new
        local v1 = {}
        local v2 = {strength = 1, point = HumanoidRootPart.Position}
        local v3 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 80, -250)).Position}
        local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 10, -800)).Position}
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        local u51 = new(v1)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.BiteAllDirections, p1.root, 800, 10)
        local u75 = u21.KeyframeReached:Connect(function(a1) -- Line: 197 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (val), u51 (val), Debris (upval), HumanoidRootPart (val)
            if a1 == "Launch" then
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u51, 1.2)
                task.delay(1.2, function() -- Line: 201 -- upvalues: Debris (upval), HumanoidRootPart (upval), p1 (upval)
                    local v1 = 5
                    local v2 = 1
                    for i = 1, v1, v2 do
                        Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, {p1.model}, true)
                        task.wait(0.05)
                    end
                end)
            end
        end)
        task.delay(0.2, function() -- Line: 212 -- upvalues: u3 (val), u21 (val)
            local u5 = u3("Standing", 0, "set", 19)
            task.delay(u21.Length - 0.3, function() -- Line: 214 -- upvalues: u5 (val)
                u5(TweenInfo.new(0.7))
            end)
        end)
        task.delay(1, function() -- Line: 219 -- upvalues: u12 (val)
            u12(TweenInfo.new(1))
        end)
        task.delay(u21.Length + 0.5, function() -- Line: 223 -- upvalues: u75 (ref)
            if u75 then
                u75:Disconnect()
                u75 = nil
            end
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 46 -- upvalues: Sounds (val), Titans (val), u0 (val), ClientShifterAnimationHandler (val), Promise (val), HitboxTitanClient (val), RunService (val), Character (val), Effects (val)
        local v1, v2
        local model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        local v3 = {min = 0.8, max = 1.2}
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, v3)
        Sounds.playFalloffSoundEffect(Titans.JumpingMovementWoosh, p1.root, 800, 10)
        task.wait(0.2)
        local u38 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u38 then
            return false
        end
        local u40 = nil
        v1, v2, v3 = Promise.new(function(a1) -- Line: 67 -- upvalues: u40 (ref), HitboxTitanClient (upval), p1 (val), RunService (upval), Character (upval), model (val), u38 (val), Effects (upval), Sounds (upval), Titans (upval)
            local u1 = false
            local function finish(p1, p2, p3, p4) -- Line: 69 -- upvalues: u40 (upval), a1 (val)
                if u40 then
                    u40:Disconnect()
                    u40 = nil
                end
                if p4 then
                    p4:Disconnect()
                end
                a1(p1, p2, p3)
            end
            local function createGrabHitboxes() -- Line: 83 -- upvalues: HitboxTitanClient (upval), p1 (upval), u1 (ref), finish (val)
                local u7 = HitboxTitanClient.createLimbHitbox({
                    model = {client = p1.model},
                }, {side = "Both", limb = "Arm", debounce = 0.2, priority = "Hand"})
                u7.touched:Connect(function(p1) -- Line: 93 -- upvalues: u7 (val), u1 (upval), finish (upval)
                    u7.destroy()
                    u1 = true
                    finish(true, "grab", 0)
                end)
            end
            local function createMouthHitbox() -- Line: 100 -- upvalues: p1 (upval), RunService (upval), Character (upval), model (upval), finish (val)
                local model_2 = p1.model
                if model_2 then
                    model_2 = p1.model:FindFirstChild("Mouth")
                end
                if not model_2 then
                    return
                end
                local u9 = nil
                local huge = math.huge
                u9 = RunService.RenderStepped:Connect(function() -- Line: 110 -- upvalues: Character (upval), model_2 (val), model (upval), huge (ref), finish (upval), u9 (ref)
                    local v1 = Character.getDistance(model_2.Position + model.CFrame.LookVector * 10)
                    if v1 < huge then
                        huge = v1
                    end
                    if v1 >= 15 then
                        return
                    end
                    finish(true, "bite", v1, u9)
                end)
                task.delay(1.3, function() -- Line: 123 -- upvalues: finish (upval), u9 (ref)
                    finish(false, nil, nil, u9)
                end)
            end
            u40 = u38.KeyframeReached:Connect(function(a1) -- Line: 128 -- upvalues: createGrabHitboxes (val), createMouthHitbox (val), Effects (upval), model (upval), p1 (upval), Sounds (upval), Titans (upval), u1 (ref), u38 (upval), finish (val)
                if a1 == "Launch" then
                    createGrabHitboxes()
                    createMouthHitbox()
                    Effects.clientEmitEffect("Launch", model.Position, p1.model)
                    Sounds.playFalloffSoundEffect(Titans.Explosion, p1.root, 30000, 10)
                    return
                end
                if a1 == "Check" and not u1 then
                    u38:Stop()
                    finish(false, nil, nil)
                end
            end)
        end):expect()
        task.delay(u38.Length + 0.5, function() -- Line: 146 -- upvalues: u40 (ref)
            if u40 then
                u40:Disconnect()
                u40 = nil
            end
        end)
        return v1, v3, v2
    end,
}