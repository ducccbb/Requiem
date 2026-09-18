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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.ShortRangeSwat
--                               Dumped in 0.00131 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local DetectionBoxTitanClient = require(Utilities_3:WaitForChild("DetectionBoxTitanClient"))
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_4:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_5 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u180 = {
    box = "ShortRangeSwat",
    impactAt = 0.30742,
    activeWindow = 0.12,
    innerBoxScale = 0.94,
    proximityDistance = 95,
    proximityBoxScale = 1.14,
    playerSpeedMin = 25,
    playerSpeedMax = 280,
    animSpeedMin = 0.7,
    animSpeedMax = 1,
}
local function getCloseSwatDistance(p1) -- Line: 53
    local v1 = p1.scale * 2.4
    return (math.max(v1, 30))
end
local function getApproachSwatDistance(p1) -- Line: 57
    local v1 = p1.scale * 3.8
    return (math.max(v1, 55))
end
local function pickSwatSide(p1, p2) -- Line: 61
    if 0 <= p1.root.CFrame:PointToObjectSpace(p2.Position).X then
        return "Right"
    end
    return "Left"
end
local function isInSwatArc(p1, p2) -- Line: 66
    local HumanoidRootPart = p1.model.client:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return true
    end
    local v1 = p2.Position - HumanoidRootPart.Position
    if v1.Magnitude < 0.001 then
        return true
    end
    local v2 = HumanoidRootPart.CFrame.LookVector:Dot(v1.Unit)
    local v3 = -0.25 < v2
    return v3
end
local function tryCloseSwatFallback(p1, p2) -- Line: 81 -- upvalues: isInSwatArc (val), getCloseSwatDistance (val), pickSwatSide (val)
    if not (isInSwatArc(p1, p2)) then
        return false
    end
    local Magnitude = (p2.Position - p1.root.Position).Magnitude
    if getCloseSwatDistance(p1) < Magnitude then
        return false
    end
    if p2.AssemblyLinearVelocity.Magnitude >= 10 then
        return true, pickSwatSide(p1, p2)
    end
    if p1.scale * 1.2 < Magnitude then
        return false
    end
    return true, pickSwatSide(p1, p2)
end
local function tryApproachSwatFallback(p1, p2) -- Line: 100 -- upvalues: isInSwatArc (val), getApproachSwatDistance (val), pickSwatSide (val)
    if not (isInSwatArc(p1, p2)) or getApproachSwatDistance(p1) < (p2.Position - p1.root.Position).Magnitude or p2.AssemblyLinearVelocity.Magnitude < 10 then
        return false
    end
    local v1 = p2.AssemblyLinearVelocity.Unit:Dot((p1.root.Position - p2.Position).Unit)
    if v1 < 0.2 then
        return false
    end
    return true, pickSwatSide(p1, p2)
end
local function tryGrappleCloseSwatFallback(p1, p2, p3) -- Line: 125 -- upvalues: getApproachSwatDistance (val), isInSwatArc (val), pickSwatSide (val)
    if not p3 then
        return false
    end
    local v1 = getApproachSwatDistance(p1)
    for k, v in pairs(p3.grapples) do
        if v.hit and v.hit:IsDescendantOf(p1.model.client) and v.active and (p2.Position - p1.root.Position).Magnitude <= v1 and isInSwatArc(p1, p2) then
            return true, pickSwatSide(p1, p2)
        end
    end
    return false
end
return {
    priority = 1,
    engageRangeStuds = 140,
    detection = u180,
    attempt = function(p1) -- Line: 196 -- upvalues: CooldownTitanClient (val), Character (val), Players (val), DetectionBoxTitanClient (val), u180 (val), tryCloseSwatFallback (val), tryApproachSwatFallback (val), ClientGearHandler (val), tryGrappleCloseSwatFallback (val)
        local v1, v2
        local v3 = {"ShortRangeSwatAttempt", "ShortRangeSwat"}
        if CooldownTitanClient.isOnCooldown(p1, v3) then
            return false
        end
        local v4 = Character.getCharacter(Players.LocalPlayer)
        local PrimaryPart = v4
        if PrimaryPart then
            PrimaryPart = v4.PrimaryPart
        end
        if not PrimaryPart then
            return false
        end
        v3, v1 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u180)
        if not v3 then
            local v5, v6
            v5, v6 = tryCloseSwatFallback(p1, PrimaryPart)
            if not v5 then
                local v7
                v2, v7 = tryApproachSwatFallback(p1, PrimaryPart)
                if not v2 then
                    local v8, v9
                    v8, v9 = tryGrappleCloseSwatFallback(p1, PrimaryPart, (ClientGearHandler.getGearState()))
                    if v8 and v9 then
                        v3 = true
                        v1 = v9
                    end
                elseif v7 then
                    v3 = true
                    v1 = v7
                end
            elseif v6 then
                v3 = true
                v1 = v6
            end
        end
        if not v3 or not v1 then
            return false
        end
        v2 = {v1 .. "Arm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"ShortRangeSwatAttempt", v1 .. "Arm"}, 0.45)
        return true, v1
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 152 -- upvalues: CooldownTitanClient (val), Sounds (val), Titans (val), HitboxTitanClient (val)
        CooldownTitanClient.addClientCooldown(p1, "ShortRangeSwat", 2)
        CooldownTitanClient.addClientCooldown(p1, p5 .. "Arm", 1)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15)
        local u32 = HitboxTitanClient.createLimbHitbox(p1, {
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            side = p5,
            wires = {shake = true, concuss = true, ungrapple = true},
        })
        u32.touched:Connect(function(a1) -- Line: 176 -- upvalues: HitboxTitanClient (upval), p1 (val), p5 (val), p4 (val), u32 (val)
            if a1 == "Hand" then
                p4(a1)
                u32.destroy()
                return
            end
            if a1 ~= "LowerArm" then
                return HitboxTitanClient.onKnockbackFromLimb(p1, a1, p5)
            end
            p4(a1)
            u32.destroy()
        end)
        p2:Add(task.delay(1, function() -- Line: 185 -- upvalues: u32 (val)
            u32.destroy()
        end))
        p2:Add(function() -- Line: 189 -- upvalues: u32 (val)
            u32.destroy()
        end)
        return true
    end,
}