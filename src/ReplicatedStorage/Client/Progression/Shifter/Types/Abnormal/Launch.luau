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
--       File: ReplicatedStorage.Client.Progression.Shifter.Types.Abnormal.Launch
--                               Dumped in 0.00119 seconds
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
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local function onAbilityReplicated(p1) -- Line: 41 -- upvalues: Character (val), Sounds (val), Titans (val), Effects (val), ClientShifterAnimationHandler (val), u0 (val)
    local v1, v2, v3, v4
    local model = p1.model
    if model then
        model = p1.model:FindFirstChild("HumanoidRootPart")
    end
    if not model then
        return false
    end
    _, _, v2 = Character.isGrounded(p1.model)
    if not v2 then
        return false
    end
    Sounds.playFalloffSoundEffect(Titans.Explosion, p1.root, 30000, 10)
    local v5 = {min = 0.8, max = 1.2}
    Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2500, 10, v5)
    Sounds.playFalloffSoundEffect(Titans.ShortRangeAttackGround1, p1.root, 2500, 15)
    Effects.clientEmitEffect("Launch", v2.Position, p1.model)
    local v6 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
    if not v6 or not p1.model then
        return false
    end
    while v6.KeyframeReached:Wait() ~= "Land" do end
    _, _, v3 = Character.isGrounded(v1.model)
    if not v3 then
        return false
    end
    v4, v5 = Character.getDistance(v3.Position + Vector3.new(0, -50, 0))
    if not v5 or 400 < v4 then
        return false
    end
    return true, v4
end
return {
    onAbilityRequested = function(p1, ...) -- Line: 103 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), onAbilityReplicated (val), ClientShifterPhysicsHandler (val), Debris (val)
        local v1
        _, v1 = useWalkSpeed()
        local u9 = v1("stomp", 0, "set", 10)
        local u17 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if u17 and p1.model then
            local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
            local u24 = {p1.model}
            local new = CustomBezier.new
            local v2 = {}
            local v3 = {strength = 1, point = HumanoidRootPart.Position}
            local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 500, -800)).Position}
            local v5 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -1600)).Position}
            v2[1] = v3
            v2[2] = v4
            v2[3] = v5
            local u49 = new(v2)
            task.delay(0.4, function() -- Line: 121 -- upvalues: onAbilityReplicated (upval), p1 (val), ClientShifterPhysicsHandler (upval), u49 (val), u17 (val), Debris (upval), HumanoidRootPart (val), u24 (val)
                task.spawn(onAbilityReplicated, p1)
                ClientShifterPhysicsHandler.onRunBezierCurve(p1, u49, u17.Length - 1)
                local v1 = 5
                local v2 = 1
                for i = 1, v1, v2 do
                    Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, u24)
                    task.wait(0.05)
                end
                v2 = u17.Length - 1.4
                task.delay(v2, function() -- Line: 135 -- upvalues: Debris (upval), HumanoidRootPart (upval), u24 (upval)
                    local v1 = 10
                    local v2 = 1
                    for i = 1, v1, v2 do
                        Debris.circle(HumanoidRootPart.Position, i * 12.5 + 20, i * 4 + 5, 30, 0.3, u24)
                        task.wait(0.05)
                    end
                end)
            end)
        end
        task.delay(6, function() -- Line: 144 -- upvalues: u9 (val)
            u9(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = onAbilityReplicated,
}