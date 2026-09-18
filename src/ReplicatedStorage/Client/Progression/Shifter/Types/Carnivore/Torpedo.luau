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
--   File: ReplicatedStorage.Client.Progression.Shifter.Types.Lunatic Abnormal.Torpedo
--                               Dumped in 0.00113 seconds
--                          Bytecode version 9  |  11 functions

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
local Debris = require(Universal_3:WaitForChild("ClientShifterEffectHandler")).Debris
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local CustomBezier = require(Utilities_2:WaitForChild("CustomBezier"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Effects_2 = Common_5:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Promise = require(Common_6:WaitForChild("Promise"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local function onAbilityReplicated(p1) -- Line: 42 -- upvalues: Character (val), Sounds (val), Titans (val), ClientShifterAnimationHandler (val), u0 (val), Promise (val), Effects (val)
    local u15, v1, v2
    local model = p1.model
    if model then
        model = p1.model:FindFirstChild("HumanoidRootPart")
    end
    if not model then
        return false
    end
    _, _, u15 = Character.isGrounded(p1.model)
    if not u15 then
        return false
    end
    Sounds.playFalloffSoundEffect(Titans.Explosion, p1.root, 30000, 10)
    Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2500, 10, {min = 0.8, max = 1.2})
    Sounds.playFalloffSoundEffect(Titans.ShortRangeAttackGround1, p1.root, 2500, 15)
    local u49 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
    if not u49 then
        return false
    end
    v1, v2 = Promise.new(function(a1) -- Line: 68 -- upvalues: u49 (val), Effects (upval), u15 (val), p1 (val), Character (upval)
        local u1 = false
        local u2 = nil
        local function finish(p1, p2) -- Line: 72 -- upvalues: u1 (ref), u2 (ref), a1 (val)
            if u1 then
                return
            end
            u1 = true
            if u2 then
                u2:Disconnect()
                u2 = nil
            end
            a1(p1, p2)
        end
        task.delay(u49.Length, function() -- Line: 119 -- upvalues: finish (val)
            finish(false)
        end)
    end):expect()
    return v1, v2
end
return {
    onAbilityRequested = function(p1, ...) -- Line: 132 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), onAbilityReplicated (val), ClientShifterPhysicsHandler (val), Debris (val)
        local v1
        _, v1 = useWalkSpeed()
        local u9 = v1("stomp", 0, "set", 10)
        local u17 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u17 or not p1.model then
            return
        end
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        local u24 = {p1.model}
        local new = CustomBezier.new
        local v2 = {}
        local v3 = {strength = 1, point = HumanoidRootPart.Position}
        local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 300, -650)).Position}
        local v5 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -1000)).Position}
        v2[1] = v3
        v2[2] = v4
        v2[3] = v5
        local u49 = new(v2)
        local u50 = nil
        task.delay(0.4, function() -- Line: 159 -- upvalues: onAbilityReplicated (upval), p1 (val), ClientShifterPhysicsHandler (upval), u49 (val), u17 (val), Debris (upval), HumanoidRootPart (val), u24 (val), u50 (ref)
            task.spawn(onAbilityReplicated, p1)
            u50 = u17.KeyframeReached:Connect(function(a1) -- Line: 163 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (upval), u49 (upval), u17 (upval), Debris (upval), HumanoidRootPart (upval), u24 (upval)
                if a1 ~= "Launch" then
                    return
                end
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u49, u17.Length - 1)
                local v1 = 5
                local v2 = 1
                for i = 1, v1, v2 do
                    Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, u24)
                    task.wait(0.05)
                end
                task.delay(u17.Length - 1.4, function() -- Line: 178 -- upvalues: Debris (upval), HumanoidRootPart (upval), u24 (upval)
                    local v1 = 10
                    local v2 = 1
                    for i = 1, v1, v2 do
                        Debris.circle(HumanoidRootPart.Position, i * 12.5 + 20 + 5, i * 4 + 5, 30, 0.3, u24)
                        task.wait(0.05)
                    end
                end)
            end)
        end)
        task.delay(6, function() -- Line: 189 -- upvalues: u9 (val), u50 (ref)
            u9(TweenInfo.new(1))
            if u50 then
                u50:Disconnect()
                u50 = nil
            end
        end)
    end,
    onAbilityReplicated = onAbilityReplicated,
}