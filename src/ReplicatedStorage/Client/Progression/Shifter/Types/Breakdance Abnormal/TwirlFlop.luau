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
--File: ReplicatedStorage.Client.Progression.Shifter.Types.Breakdance Abnormal.TwirlFlop
--                               Dumped in 0.00136 seconds
--                          Bytecode version 9  |  16 functions

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
    onAbilityRequested = function(p1, ...) -- Line: 136 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), Character (val), Effects (val), Debris (val), Sounds (val), Titans (val), ClientShifterPhysicsHandler (val)
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
        local v3 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 100, -250)).Position}
        local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -200)).Position}
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        local u50 = new(v1)
        local function onLand() -- Line: 161 -- upvalues: Character (upval), Effects (upval), HumanoidRootPart (val), Debris (upval), p1 (val)
            local v1
            _, _, v1 = Character.isGrounded()
            if v1 and v1.Position then
                Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
            end
            Debris.circle(HumanoidRootPart.Position, 40, 8, 30, 0.6, {p1.model}, false)
            local v2 = 8
            local v3 = 1
            for i = 1, v2, v3 do
                Debris.circle(HumanoidRootPart.Position, i * 10 + 40, i * 2 + 8, 30, 0.6, {p1.model}, false)
            end
        end
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.BiteAllDirections, p1.root, 800, 10)
        local u75 = u20.KeyframeReached:Connect(function(a1) -- Line: 180 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (val), u50 (val), onLand (val)
            if a1 == "Launch" then
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u50, 0.5)
                return
            end
            if a1 == "Crash" then
                onLand()
            end
        end)
        task.delay(0.2, function() -- Line: 189 -- upvalues: u3 (val), u20 (val)
            local u5 = u3("Standing", 0, "set", 19)
            task.delay(u20.Length - 0.3, function() -- Line: 191 -- upvalues: u5 (val)
                u5(TweenInfo.new(0.7))
            end)
        end)
        task.delay(1, function() -- Line: 196 -- upvalues: u12 (val)
            u12(TweenInfo.new(1))
        end)
        task.delay(u20.Length + 0.5, function() -- Line: 200 -- upvalues: u75 (ref)
            if u75 then
                u75:Disconnect()
                u75 = nil
            end
        end)
    end,
    onAbilityReplicated = function(p1) -- Line: 43 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), u0 (val), Promise (val), HitboxTitanClient (val), Character (val)
        local v1, v2, v3
        local model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.JumpingMovementWoosh, p1.root, 800, 10)
        task.wait(0.2)
        local u37 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u37 then
            return false
        end
        local u39 = nil
        v1, v2, v3 = Promise.new(function(a1) -- Line: 62 -- upvalues: u39 (ref), HitboxTitanClient (upval), p1 (val), Character (upval), model (val), u37 (val)
            local function finish(p1, p2, p3) -- Line: 63 -- upvalues: u39 (upval), a1 (val)
                if u39 then
                    u39:Disconnect()
                    u39 = nil
                end
                a1(p1, p2, p3)
            end
            local function onKick() -- Line: 72 -- upvalues: HitboxTitanClient (upval), p1 (upval), finish (val)
                local u8 = HitboxTitanClient.createLimbHitbox({
                    model = {client = p1.model},
                }, {
                    side = "Right",
                    limb = "Leg",
                    debounce = 0.2,
                    priority = "Leg",
                    collisionGroup = "Default",
                    wires = {shake = true, ungrapple = true, concuss = true, ragdoll = true},
                })
                u8.touched:Connect(function(p1) -- Line: 89 -- upvalues: u8 (val), finish (upval)
                    u8.destroy()
                    finish(true, "kick", 0)
                end)
            end
            local function onLand() -- Line: 95 -- upvalues: Character (upval), model (upval), finish (val)
                local v1, v2
                v1, v2 = Character.getDistance(model.Position + Vector3.new(0, -50, 0))
                if not v2 or 250 < v1 then
                    return
                end
                finish(true, "stomp", v1)
            end
            u39 = u37.KeyframeReached:Connect(function(p1) -- Line: 111 -- upvalues: onKick (val), onLand (val)
                if p1 == "Kick" then
                    onKick()
                    return
                end
                if p1 == "Crash" then
                    onLand()
                end
            end)
        end):expect()
        task.delay(u37.Length + 0.5, function() -- Line: 120 -- upvalues: u39 (ref)
            if u39 then
                u39:Disconnect()
                u39 = nil
            end
        end)
        return v1, v2, v3
    end,
}