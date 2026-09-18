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
-- File: ReplicatedStorage.Client.Progression.Shifter.Types.Helldiver Abnormal.Flashstep
--                               Dumped in 0.00115 seconds
--                          Bytecode version 9  |  12 functions

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
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterEffectHandler = require(Universal_2:WaitForChild("ClientShifterEffectHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local Utilities = Titans:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
local Debris = ClientShifterEffectHandler.Debris
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local function onAbilityReplicated(p1) -- Line: 34 -- upvalues: ClientShifterAnimationHandler (val), u0 (val), Promise (val), Debris (val), Character (val), HitboxTitanClient (val)
    local v1, v2, v3
    local u1 = nil
    local u9 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
    if not u9 then
        return false
    end
    local model = p1.model
    if not model then
        return false
    end
    local HumanoidRootPart = model:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false
    end
    local Position = HumanoidRootPart.Position
    local u19 = nil
    v1, v2, v3 = Promise.new(function(a1, p2) -- Line: 54 -- upvalues: u1 (ref), u19 (ref), Debris (upval), HumanoidRootPart (val), p1 (val), Character (upval), u9 (val), HitboxTitanClient (upval), model (val), Position (val)
        local function finish(p1, p2, p3) -- Line: 55 -- upvalues: u1 (upval), u19 (upval), a1 (val)
            if u1 then
                u1:Disconnect()
                u1 = nil
            end
            if u19 then
                u19.destroy()
                u19 = nil
            end
            a1(p1, p2, p3)
        end
        task.spawn(function() -- Line: 70 -- upvalues: Debris (upval), HumanoidRootPart (upval), p1 (upval), Character (upval), finish (val)
            local v1, v2, v3
            local v4 = 5
            local v5 = 1
            for i = 1, v4, v5 do
                Debris.circle(HumanoidRootPart.Position, i * 10 + 10, i * 2 + 5, 30, 0.3, {p1.model}, false)
            end
            _, _, v1 = Character.isGrounded(p1.model)
            if not v1 then
                return
            end
            v2, v3 = Character.getDistance(v1.Position + Vector3.new(0, -50, 0))
            if not v3 or 100 < v2 then
                return
            end
            finish(true, "stomp", v2)
        end)
        u1 = u9.KeyframeReached:Connect(function(a1) -- Line: 92 -- upvalues: u19 (upval), HitboxTitanClient (upval), p1 (upval), finish (val), model (upval), Position (upval), Debris (upval), Character (upval)
            if a1 ~= "FlashStepSlash" then
                return
            end
            local v1 = {
                model = {client = p1.model},
            }
            local v2 = {
                side = "Right",
                limb = "Arm",
                debounce = 0.2,
                priority = "Hand",
                collisionGroup = "Default",
            }
            local v3 = {
                shake = true,
                ungrapple = true,
                concuss = true,
                ragdoll = true,
                threshold = 5,
            }
            v2.wires = v3
            u19 = HitboxTitanClient.createLimbHitbox(v1, v2)
            u19.touched:Connect(function(p1) -- Line: 116 -- upvalues: u19 (upval), finish (upval)
                u19.destroy()
                finish(true, "slash", 0)
            end)
            task.delay(0.2, function() -- Line: 121 -- upvalues: model (upval), Position (upval), Debris (upval), p1 (upval), Character (upval), finish (upval)
                local v1, v2
                local HumanoidRootPart = model:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then
                    return
                end
                local Unit = (HumanoidRootPart.Position - Position).Unit
                local v3 = Position
                local v4 = 5
                local v5 = 1
                for i = 1, v4, v5 do
                    task.wait(0.1)
                    v3 = v3 + Unit * 100
                    Debris.circle(v3, 50, 20, 30, 0.3, {p1.model}, false)
                    Debris.rocks(v3, 10, 5, 30, 300, 60, {p1.model})
                    v1, v2 = Character.getDistance(v3 + Vector3.new(0, -50, 0))
                    if v2 and 100 >= v1 then
                        finish(true, "stomp", v1)
                    end
                end
            end)
        end)
        task.delay(u9.Length, function() -- Line: 153 -- upvalues: finish (val)
            finish(false)
        end)
    end):expect()
    task.delay(u9.Length, function() -- Line: 158 -- upvalues: u1 (ref), u19 (ref)
        if u1 then
            u1:Disconnect()
            u1 = nil
        end
        if u19 then
            u19.destroy()
            u19 = nil
        end
    end)
    return v1, v2, v3
end
return {
    onAbilityRequested = function(p1, ...) -- Line: 180 -- upvalues: useWalkSpeed (val), onAbilityReplicated (val)
        local v1
        _, v1 = useWalkSpeed()
        local u9 = v1("flashstep", 0, "set", 15)
        task.spawn(onAbilityReplicated, p1)
        task.delay(1, function() -- Line: 189 -- upvalues: u9 (val)
            u9(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = onAbilityReplicated,
}