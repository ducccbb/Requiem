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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Crawler.Blitz
--                              Dumped in 0.000962 seconds
--                          Bytecode version 9  |  14 functions

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
local ClientShifterMovementHandler = require(Universal_2:WaitForChild("ClientShifterMovementHandler"))
local Universal_3 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterPhysicsHandler = require(Universal_3:WaitForChild("ClientShifterPhysicsHandler"))
local Universal_4 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_4:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
return {
    onAbilityRequested = function(p1, ...) -- Line: 116 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), ClientShifterMovementHandler (val), useWalkSpeed (val), Character (val), Effects (val), Debris (val), ClientShifterPhysicsHandler (val)
        local v1
        local v2 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not v2 or not p1.model then
            return
        end
        ClientShifterMovementHandler.onDisableIKController(p1.model)
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        local u19 = nil
        _, v1 = useWalkSpeed()
        local u31 = v1("Blitz", 0, "set", 20, TweenInfo.new(0.3))
        local function onSpawnRockWave(a1) -- Line: 139 -- upvalues: Character (upval), Effects (upval), HumanoidRootPart (val), Debris (upval), p1 (val)
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
        local function onLeapForward() -- Line: 154 -- upvalues: onSpawnRockWave (val), u19 (ref), ClientShifterPhysicsHandler (upval), p1 (val)
            onSpawnRockWave()
            u19 = ClientShifterPhysicsHandler.onLaunchFromCameraDirection(p1, 100000, 20000, 0.5)
        end
        local function onSwipe() -- Line: 165 -- upvalues: u19 (ref), HumanoidRootPart (val), Debris (upval), p1 (val), u31 (val)
            if u19 then
                u19()
            end
            task.delay(0.3, function() -- Line: 170 -- upvalues: HumanoidRootPart (upval), Debris (upval), p1 (upval), u31 (upval)
                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                Debris.shockwave(HumanoidRootPart.Position, (HumanoidRootPart.CFrame * CFrame.new(0, 0, -70)).Position, 12, 0.7, 0.05, {p1.model})
                u31(TweenInfo.new(1))
            end)
        end
        local u35 = nil
    end,
    onAbilityReplicated = function(p1) -- Line: 35 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), ClientShifterMovementHandler (val), Promise (val), RunService (val), Character (val)
        local u8 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not u8 or not p1.model then
            return
        end
        ClientShifterMovementHandler.onDisableIKController(p1.model)
        return Promise.new(function(a1) -- Line: 45 -- upvalues: u8 (val), ClientShifterMovementHandler (upval), p1 (val), RunService (upval), Character (upval)
            local u1 = nil
            local u2 = nil
            local u3 = nil
            local u4 = nil
            u1 = u8.Stopped:Connect(function() -- Line: 58 -- upvalues: a1 (val), u1 (ref), u2 (ref), u3 (ref)
                a1(false)
                u1:Disconnect()
                u2:Disconnect()
                u3:Disconnect()
            end)
        end):expect(), 1
    end,
}