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
-- File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.BackGrab
--                               Dumped in 0.00167 seconds
--                          Bytecode version 9  |  11 functions

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
    box = "BackGrab",
    impactAt = 0.32360000000000005,
    activeWindow = 0.12,
    innerBoxScale = 0.93,
    proximityDistance = 90,
    proximityBoxScale = 1.14,
    playerSpeedMin = 35,
    playerSpeedMax = 280,
    animSpeedMin = 0.75,
    animSpeedMax = 1,
}
local function getBehindDot(p1, p2) -- Line: 59
    local HumanoidRootPart = p1.model.client:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return nil
    end
    local v1 = p2.Position - HumanoidRootPart.Position
    if v1.Magnitude < 0.001 then
        return nil
    end
    return HumanoidRootPart.CFrame.LookVector:Dot(v1.Unit)
end
local function pickGrabSide(p1, p2) -- Line: 79
    if 0 <= p1.root.CFrame:PointToObjectSpace(p2.Position).X then
        return "Right"
    end
    return "Left"
end
local function isPlayerBehind(p1, p2, p3) -- Line: 91 -- upvalues: getBehindDot (val)
    local v1 = getBehindDot(p1, p2)
    local v2 = if v1 ~= nil then v1 < p3 else false
    return v2
end
local function tryBehindProximityGrab(p1, p2) -- Line: 102 -- upvalues: getBehindDot (val), pickGrabSide (val)
    local Magnitude
    local v1 = getBehindDot(p1, p2)
    if not v1 then
        return false
    end
    local UpperTorso = p1.model.client:FindFirstChild("UpperTorso")
    local Nape = UpperTorso
    if Nape then
        Nape = UpperTorso:FindFirstChild("Nape")
    end
    if not Nape then
        Magnitude = (p2.Position - p1.root.Position).Magnitude
    else
        Magnitude = (p2.Position - Nape.WorldPosition).Magnitude
    end
    local v2 = p1.scale * 0.85
    local v3 = p1.scale * 1.6
    local v4 = true
    if v1 >= 0.15 then
        if Magnitude >= v2 then
            v4 = if Magnitude < v3 then v1 < 0.25 else false
        else
            v4 = true
            if v1 < 0.35 then end
        end
    end
    if not v4 or v3 < Magnitude then
        return false
    end
    if p2.AssemblyLinearVelocity.Magnitude >= 12 then
        return true, pickGrabSide(p1, p2)
    end
    if v2 < Magnitude then
        return false
    end
    return true, pickGrabSide(p1, p2)
end
local function tryGrappleBehindGrab(p1, p2, p3) -- Line: 143 -- upvalues: tryBehindProximityGrab (val)
    local v1, v2
    if not p3 then
        return false
    end
    for k, v in pairs(p3.grapples) do
        if v.hit and v.hit:IsDescendantOf(p1.model.client) and v.active then
            v1, v2 = tryBehindProximityGrab(p1, p2)
            if v1 and v2 then
                return true, v2
            end
        end
    end
    return false
end
return {
    priority = 1,
    engageRangeStuds = 180,
    detection = u180,
    attempt = function(p1) -- Line: 226 -- upvalues: CooldownTitanClient (val), Character (val), Players (val), DetectionBoxTitanClient (val), u180 (val), isPlayerBehind (val), tryBehindProximityGrab (val), ClientGearHandler (val), tryGrappleBehindGrab (val)
        local v1
        local v2 = {"BackGrabAttempt", "BackGrab"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        local v3 = Character.getCharacter(Players.LocalPlayer)
        local PrimaryPart = v3
        if PrimaryPart then
            PrimaryPart = v3.PrimaryPart
        end
        if not PrimaryPart then
            return false
        end
        v2, v1 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u180)
        if v2 and v1 and not (isPlayerBehind(p1, PrimaryPart, 0.15)) then
            v2 = false
            v1 = nil
        end
        if not v2 then
            local v4, v5
            v4, v5 = tryBehindProximityGrab(p1, PrimaryPart)
            if not v4 then
                local v6, v7
                v6, v7 = tryGrappleBehindGrab(p1, PrimaryPart, (ClientGearHandler.getGearState()))
                if v6 and v7 then
                    v2 = true
                    v1 = v7
                end
            elseif v5 then
                v2 = true
                v1 = v5
            end
        end
        if not v2 or not v1 then
            return false
        end
        local v8 = {v1 .. "Arm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v8) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"BackGrabAttempt", v1 .. "Arm"}, 0.65)
        return true, v1
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 177 -- upvalues: Sounds (val), Titans (val), CooldownTitanClient (val), HitboxTitanClient (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        CooldownTitanClient.addClientCooldown(p1, "BackGrab", 2)
        CooldownTitanClient.addClientCooldown(p1, p5 .. "Arm", 1)
        local u33 = HitboxTitanClient.createLimbHitbox(p1, {
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            side = p5,
            wires = {shake = true, concuss = true, ungrapple = true},
        })
        u33.touched:Connect(function(a1) -- Line: 201 -- upvalues: HitboxTitanClient (upval), p1 (val), p5 (val), p4 (val), u33 (val)
            if a1 == "Hand" then
                p4(a1)
                u33.destroy()
                return
            end
            if a1 ~= "LowerArm" then
                return HitboxTitanClient.onKnockbackFromLimb(p1, a1, p5)
            end
            p4(a1)
            u33.destroy()
        end)
        p2:Add(task.delay(1, function() -- Line: 210 -- upvalues: u33 (val)
            u33.destroy()
        end))
        p2:Add(function() -- Line: 214 -- upvalues: u33 (val)
            u33.destroy()
        end)
        return true
    end,
}