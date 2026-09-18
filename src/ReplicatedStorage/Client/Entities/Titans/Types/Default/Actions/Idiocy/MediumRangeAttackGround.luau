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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Idiocy.MediumRangeAttackGround
--                              Dumped in 0.000437 seconds
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
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("DetectionBoxTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_3:WaitForChild("HitboxTitanClient"))
return {
    detection = {box = "MediumRangeAttackGround", impactAt = 0.32360000000000005},
    attempt = function(p1) -- Line: 101
        return false
    end,
    execute = function(p1, p2, p3, p4) -- Line: 34 -- upvalues: CooldownTitanClient (val), HitboxTitanClient (val)
        CooldownTitanClient.addClientCooldown(p1, "MediumRangeAttackGround", 15)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 4)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 4)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 4)
        local u33 = HitboxTitanClient.createLimbHitbox(p1, {
            side = "Both",
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            delayed = 0.5,
            wires = {shake = true, concuss = true, ungrapple = true},
        })
        u33.touched:Connect(function(a1, p2) -- Line: 69 -- upvalues: HitboxTitanClient (upval), p1 (val), p4 (val), u33 (val)
            if a1 == "Hand" then
                p4(p2)
                u33.destroy()
                return
            end
            if a1 ~= "LowerArm" then
                return HitboxTitanClient.onKnockbackFromLimb(p1, a1, p2)
            end
            p4(p2)
            u33.destroy()
        end)
        p2:Add(task.delay(3.5, function() -- Line: 81 -- upvalues: u33 (val)
            u33.destroy()
        end))
        p2:Add(function() -- Line: 87 -- upvalues: u33 (val)
            u33.destroy()
        end)
        return true
    end,
}