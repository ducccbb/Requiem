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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Crawler.Aerial
--                               Dumped in 0.00127 seconds
--                          Bytecode version 9  |  18 functions

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
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterPhysicsHandler = require(Universal_2:WaitForChild("ClientShifterPhysicsHandler"))
local Universal_3 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_3:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local CustomBezier = require(Utilities:WaitForChild("CustomBezier"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 106 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), Character (val), Effects (val), Debris (val), CustomBezier (val), ClientShifterPhysicsHandler (val)
        local v1 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not v1 or not p1.model then
            return
        end
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        local CFrame = HumanoidRootPart.CFrame
        local u16 = 0
        local function onSpawnRockWave(a1) -- Line: 121 -- upvalues: Character (upval), Effects (upval), HumanoidRootPart (val), Debris (upval), p1 (val)
            local v1
            _, _, v1 = Character.isGrounded()
            if v1 and v1.Position then
                Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
            end
            local v2 = a1 or 3
            local v3 = 1
            for i = 1, v2, v3 do
                Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, {p1.model}, true)
            end
        end
        local function onApplySafeYHeight(a1, p2) -- Line: 138 -- upvalues: p1 (val)
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Exclude
            v1.FilterDescendantsInstances = {p1.model}
            v1.CollisionGroup = "Default"
            local v2 = a1 + Vector3.new(0, 500, 0)
            local v3 = Vector3.new(0, -1000, 0)
            local v4 = workspace:Raycast(v2, v3, v1)
            if not v4 then
                return a1
            end
            v3 = v4.Position.Y + p2
            return (Vector3.new(a1.X, v3, a1.Z))
        end
        local function onMoveLeft() -- Line: 157 -- upvalues: onSpawnRockWave (val), onApplySafeYHeight (val), CFrame (val), CustomBezier (upval), HumanoidRootPart (val), ClientShifterPhysicsHandler (upval), p1 (val)
            onSpawnRockWave()
            local v1 = onApplySafeYHeight((CFrame * CFrame.new(-300, 300, -300)).Position, 300)
            local v2 = onApplySafeYHeight((CFrame * CFrame.new(-600, 0, -600)).Position, 0)
            local v3 = CustomBezier.new({
                {strength = 1, point = HumanoidRootPart.Position},
                {strength = 1, point = v1},
                {strength = 1, point = v2},
            })
            ClientShifterPhysicsHandler.onRunBezierCurve(p1, v3, 0.55)
        end
        local function onMoveRight() -- Line: 185 -- upvalues: onSpawnRockWave (val), onApplySafeYHeight (val), CFrame (val), CustomBezier (upval), HumanoidRootPart (val), ClientShifterPhysicsHandler (upval), p1 (val)
            onSpawnRockWave()
            local v1 = onApplySafeYHeight((CFrame * CFrame.new(300, 300, -900)).Position, 300)
            local v2 = onApplySafeYHeight((CFrame * CFrame.new(600, 0, -1200)).Position, 5)
            local v3 = CustomBezier.new({
                {strength = 1, point = HumanoidRootPart.Position},
                {strength = 1, point = v1},
                {strength = 1, point = v2},
            })
            ClientShifterPhysicsHandler.onRunBezierCurve(p1, v3, 0.55)
        end
        local function onLeapCenter() -- Line: 213 -- upvalues: onSpawnRockWave (val), onApplySafeYHeight (val), CFrame (val), CustomBezier (upval), HumanoidRootPart (val), ClientShifterPhysicsHandler (upval), p1 (val)
            onSpawnRockWave()
            local v1 = onApplySafeYHeight((CFrame * CFrame.new(0, 150, -1500)).Position, 300)
            local v2 = onApplySafeYHeight((CFrame * CFrame.new(0, 300, -1500)).Position, 600)
            local v3 = CustomBezier.new({
                {strength = 1, point = HumanoidRootPart.Position},
                {strength = 1, point = v1},
                {strength = 1, point = v2},
            })
            ClientShifterPhysicsHandler.onRunBezierCurve(p1, v3, 1.05)
            task.delay(1.06, function() -- Line: 234 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (upval), onSpawnRockWave (upval)
                local u6 = ClientShifterPhysicsHandler.onLaunchFromCameraDirection(p1, 100000, 20000, 0.35)
                if not u6 then
                    return
                end
                task.delay(0.55, function() -- Line: 240 -- upvalues: u6 (val), onSpawnRockWave (upval)
                    u6()
                    task.delay(0.2, function() -- Line: 243 -- upvalues: onSpawnRockWave (upval)
                        onSpawnRockWave(12)
                    end)
                end)
            end)
        end
        local function onAppear() -- Line: 254 -- upvalues: u16 (ref)
            u16 = u16 + 1
        end
        local function onFistSlam() end
        local u24 = nil
    end,
    onAbilityReplicated = function(p1) -- Line: 34 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), Promise (val), RunService (val), Character (val)
        local u8 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u8 or not p1.model then
            return
        end
        return Promise.new(function(a1) -- Line: 41 -- upvalues: u8 (val), RunService (upval), p1 (val), Character (upval)
            local u1 = nil
            local u2 = nil
            local u3 = nil
            u1 = u8.Stopped:Connect(function() -- Line: 46 -- upvalues: a1 (val), u1 (ref), u2 (ref), u3 (ref)
                a1(false)
                u1:Disconnect()
                u2:Disconnect()
                u3:Disconnect()
            end)
        end):expect(), 1
    end,
}