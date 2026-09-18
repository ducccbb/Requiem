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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Ice.AngryStomp
--                               Dumped in 0.00108 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
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
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_2:WaitForChild("ClientShifterEffectHandler"))
local Debris = ClientShifterEffectHandler.Debris
local Effects = ClientShifterEffectHandler.Effects
return {
    onAbilityRequested = function(p1, p2, ...) -- Line: 26 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), Debris (val), Character (val), Effects (val)
        local v1
        _, v1 = useWalkSpeed()
        local u10 = v1("stomp", 0, "set", 10)
        if not p1.model then
            return
        end
        local v2 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations.AngryStomp)
        if not v2 then
            return
        end
        local u18 = {p1.model}
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        local u29 = v2.KeyframeReached:Connect(function(p1) -- Line: 42 -- upvalues: Debris (upval), HumanoidRootPart (val), u18 (val), Character (upval), Effects (upval)
            local v1
            local v2 = 3
            local v3 = 1
            for i = 0, v2, v3 do
                Debris.circle(HumanoidRootPart.Position, i * 10 + 20, i * 2 + 5, 30, 0.3, u18, true)
                Debris.rocks(HumanoidRootPart.Position, 15, 5, 8, 150, 75, u18)
                _, _, v1 = Character.isGrounded()
                if v1 and v1.Position then
                    Effects.particle("Shockwave", v1.Position, HumanoidRootPart.Parent)
                end
            end
        end)
        task.delay(4, function() -- Line: 53 -- upvalues: u29 (val)
            u29:Disconnect()
        end)
        task.delay(3.5, function() -- Line: 57 -- upvalues: u10 (val)
            u10(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = function(p1, p2, p3, ...) -- Line: 62 -- upvalues: ClientShifterAnimationHandler (val), Character (val)
        local v1, v2, v3
        local v4 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations.AngryStomp)
        if not v4 then
            return false
        end
        v4.KeyframeReached:Wait()
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