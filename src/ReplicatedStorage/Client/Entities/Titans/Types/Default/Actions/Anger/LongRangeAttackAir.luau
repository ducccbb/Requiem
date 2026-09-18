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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Anger.LongRangeAttackAir
--                              Dumped in 0.000663 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local AnimationTitanClient = require(Utilities:WaitForChild("AnimationTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local DetectionBoxTitanClient = require(Utilities_3:WaitForChild("DetectionBoxTitanClient"))
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_4:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_5 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u144 = {box = "LongRangeAttackAir", impactAt = 0.4854}
return {
    detection = u144,
    attempt = function(p1) -- Line: 102 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u144 (val)
        local v1 = {"LongRangeAttackAirAttempt", "LongRangeAttackAir"}
        if CooldownTitanClient.isOnCooldown(p1, v1) or math.random() < 0.925 or not (DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u144)) then
            return false
        end
        local v2 = {"LeftArm", "RightArm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"LongRangeAttackAirAttempt", "LeftArm", "RightArm"}, 0.5)
        return true
    end,
    execute = function(p1, p2, p3, p4) -- Line: 40 -- upvalues: AnimationTitanClient (val), Sounds (val), Titans (val), CooldownTitanClient (val), HitboxTitanClient (val)
        local v1 = AnimationTitanClient.getAnimationFromName(p1, "LongRangeAttackAir")
        if not v1 then
            return false
        end
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.ShortRangeAttackGround1, p1.root, 500, 15)
        CooldownTitanClient.addClientCooldown(p1, "LongRangeAttackAir", 2)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 5)
        local v2 = 1 + (1 - (v1.speed or 1))
        local u62 = HitboxTitanClient.createMouthHitbox(p1, {debounce = 0.1, distance = 1.5, indicate = true, delayed = 0.5 * v2})
        u62.touched:Connect(function(p1) -- Line: 77 -- upvalues: p4 (val), u62 (val)
            p4(p1)
            u62.destroy()
        end)
        p2:Add(task.delay(1 * v2, function() -- Line: 84 -- upvalues: u62 (val)
            u62.destroy()
        end))
        p2:Add(function() -- Line: 89 -- upvalues: u62 (val)
            u62.destroy()
        end)
        return true
    end,
}