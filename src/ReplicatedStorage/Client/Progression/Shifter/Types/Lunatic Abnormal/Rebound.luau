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
--   File: ReplicatedStorage.Client.Progression.Shifter.Types.Lunatic Abnormal.Rebound
--                               Dumped in 0.00169 seconds
--                          Bytecode version 9  |  21 functions

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
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
local Universal_3 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_3:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local CustomBezier = require(Utilities_2:WaitForChild("CustomBezier"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Promise = require(Common_5:WaitForChild("Promise"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_4 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 184 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), ClientShifterPhysicsHandler (val), Character (val), Effects (val), Debris (val), Sounds (val), Titans (val)
        local u3
        _, u3 = useWalkSpeed()
        local u12 = u3("kicking", 0, "set", 18, TweenInfo.new(0.5))
        local u20 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u20 or not p1.model then
            return
        end
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        local new = CustomBezier.new
        local v1 = {}
        local v2 = {strength = 1, point = HumanoidRootPart.Position}
        local v3 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 65, -150)).Position}
        local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -200)).Position}
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        local u50 = new(v1)
        local function launchForward() -- Line: 209 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (val), HumanoidRootPart (val)
            local u7 = ClientShifterPhysicsHandler.onRunVelocity(p1, HumanoidRootPart.CFrame.LookVector, 500)
            task.delay(0.1, function() -- Line: 216 -- upvalues: u7 (val), HumanoidRootPart (upval)
                if u7 then
                    u7()
                end
                HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            end)
        end
        local function onLand() -- Line: 224 -- upvalues: Character (upval), Effects (upval), HumanoidRootPart (val), Debris (upval), p1 (val)
            local v1
            _, _, v1 = Character.isGrounded()
            if v1 and v1.Position then
                Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
            end
            Debris.circle(HumanoidRootPart.Position, 40, 8, 30, 0.6, {p1.model}, true)
            local v2 = 2
            local v3 = 1
            for i = 1, v2, v3 do
                Debris.circle(HumanoidRootPart.Position, i * 10 + 40, i * 2 + 8, 30, 0.6, {p1.model}, true)
            end
        end
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.BiteAllDirections, p1.root, 800, 10)
        local TimeOfKeyframe = u20:GetTimeOfKeyframe("LaunchTwirl")
        local u80 = u20.KeyframeReached:Connect(function(a1) -- Line: 244 -- upvalues: launchForward (val), ClientShifterPhysicsHandler (upval), p1 (val), u50 (val), u20 (val), TimeOfKeyframe (val), onLand (val)
            if a1 == "Swipe" then
                launchForward()
                return
            end
            if a1 == "LaunchTwirl" then
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u50, u20.Length - TimeOfKeyframe - 0.9)
                return
            end
            if a1 == "Land" then
                onLand()
            end
        end)
        task.delay(0.2, function() -- Line: 255 -- upvalues: u3 (val), u20 (val)
            local u5 = u3("Standing", 0, "set", 19)
            task.delay(u20.Length - 0.3, function() -- Line: 257 -- upvalues: u5 (val)
                u5(TweenInfo.new(0.7))
            end)
        end)
        task.delay(1, function() -- Line: 262 -- upvalues: u12 (val)
            u12(TweenInfo.new(1))
        end)
        task.delay(u20.Length + 0.5, function() -- Line: 266 -- upvalues: u80 (ref)
            if u80 then
                u80:Disconnect()
                u80 = nil
            end
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 43 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), u0 (val), Promise (val), Character (val), HitboxTitanClient (val)
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
        local huge = math.huge
        local u38 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        v1, v2 = Promise.new(function(a1) -- Line: 58 -- upvalues: Character (upval), model (val), huge (ref), HitboxTitanClient (upval), p1 (val), u38 (val)
            local u1 = false
            local u2 = nil
            local u3 = nil
            local function destroyHitboxes() -- Line: 63 -- upvalues: u2 (ref)
                if u2 then
                    u2.destroy()
                    u2 = nil
                end
            end
            local function finish(p1, p2) -- Line: 70 -- upvalues: u1 (ref), destroyHitboxes (val), u3 (ref), a1 (val)
                if u1 then
                    return
                end
                u1 = true
                destroyHitboxes()
                if u3 then
                    u3:Disconnect()
                    u3 = nil
                end
                a1(p1, p2)
            end
            local function onHit() -- Line: 86 -- upvalues: Character (upval), model (upval), huge (upval), finish (val)
                local v1, v2
                v1, v2 = Character.getDistance(model.Position)
                if v2 and v1 < huge then
                    huge = v1
                end
                finish(true, "grab")
            end
            local function createHandHitbox() -- Line: 95 -- upvalues: u1 (ref), u2 (ref), HitboxTitanClient (upval), p1 (upval), onHit (val)
                if u1 or u2 then
                    return
                end
                local v1 = HitboxTitanClient.createLimbHitbox({
                    model = {client = p1.model},
                }, {
                    side = "Right",
                    limb = "Arm",
                    debounce = 0.2,
                    priority = "Hand",
                    collisionGroup = "Default",
                    wires = {
                        shake = true,
                        ungrapple = true,
                        concuss = true,
                        ragdoll = true,
                        threshold = 15,
                    },
                })
                u2 = v1
                v1.touched:Connect(onHit)
                task.delay(0.7, function() -- Line: 120 -- upvalues: u2 (upval)
                    if u2 then
                        u2.destroy()
                        u2 = nil
                    end
                end)
            end
            local function createLandHitbox() -- Line: 128 -- upvalues: Character (upval), p1 (upval), finish (val)
                local v1, v2, v3
                _, _, v1 = Character.isGrounded(p1.model)
                if not v1 then
                    return false
                end
                v2, v3 = Character.getDistance(v1.Position + Vector3.new(0, -50, 0))
                if not v3 or 100 < v2 then
                    return false
                end
                finish(true)
                return true, v2
            end
            if not u38 then
                createHandHitbox()
                task.delay(2, createLandHitbox)
                task.delay(5, function() -- Line: 169 -- upvalues: finish (val)
                    finish(false)
                end)
            else
                task.delay(u38.Length + 1, function() -- Line: 163 -- upvalues: finish (val)
                    finish(false)
                end)
            end
        end):expect()
        if huge ~= math.huge then
            v3 = huge
        else
            v3 = 1
        end
        return v1, v3, v2
    end,
}