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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.NapeGrabAttack
--                               Dumped in 0.00171 seconds
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
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_2:WaitForChild("HitboxTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanCoreActionClient = require(Utilities_3:WaitForChild("TitanCoreActionClient"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_4 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local function pickGrabSide(p1, p2) -- Line: 62
    if 0 <= p1.root.CFrame:PointToObjectSpace(p2.Position).X then
        return "Right"
    end
    return "Left"
end
local function getNapeContext(p1, p2) -- Line: 67
    local HumanoidRootPart = p1.model.client:FindFirstChild("HumanoidRootPart")
    local Head = p1.model.client:FindFirstChild("Head")
    local UpperTorso = p1.model.client:FindFirstChild("UpperTorso")
    local Nape = UpperTorso
    if Nape then
        Nape = UpperTorso:FindFirstChild("Nape")
    end
    if not HumanoidRootPart or not Head or not Nape then
        return nil
    end
    local v1 = HumanoidRootPart.CFrame.LookVector:Dot((p2.Position - HumanoidRootPart.Position).Unit)
    local scale = p1.scale
    return {
        root = HumanoidRootPart,
        head = Head,
        napeAttachment = Nape,
        distanceToNape = (p2.Position - Nape.WorldPosition).Magnitude,
        behindDot = v1,
        scale = scale,
        directNapeThreshold = scale * 1.1,
        lenientNapeThreshold = scale * 1.45,
        hugNapeThreshold = scale * 0.75,
        closeNapeThreshold = scale * 0.75,
        napeRadius = scale * 2.75,
    }
end
local function isPlayerBehind(p1, p2) -- Line: 96
    local v1 = p1.behindDot < p2
    return v1
end
local function isDirectlyAtNape(p1) -- Line: 100 -- upvalues: isPlayerBehind (val)
    if not (isPlayerBehind(p1, 0.05)) then
        return false
    end
    local distanceToNape = p1.distanceToNape
    local behindDot = p1.behindDot
    local v1 = true
    if behindDot >= 0 then
        if distanceToNape < p1.hugNapeThreshold then
            v1 = true
            if behindDot < 0.25 then end
        elseif distanceToNape >= p1.directNapeThreshold then
            v1 = if distanceToNape < p1.lenientNapeThreshold then behindDot < 0.4 else false
        else
            v1 = true
            if behindDot < 0.35 then end
        end
    end
    local v2 = if distanceToNape < p1.lenientNapeThreshold then v1 else false
    return v2
end
local function willReachNapeSoon(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 116
    if p7 >= p8 then
        return false
    end
    local Magnitude = p1.AssemblyLinearVelocity.Magnitude
    if Magnitude < 20 then
        return false
    end
    local v1 = math.min(p3, p6)
    local v2 = p1.Position + p1.AssemblyLinearVelocity.Unit * v1
    local v3 = if (v2 - p2.WorldPosition).Magnitude <= p4 then v1 / Magnitude < p5 else false
    return v3
end
local function tryOrbitNapeGrab(p1, p2, p3) -- Line: 144 -- upvalues: isPlayerBehind (val), willReachNapeSoon (val)
    if not (isPlayerBehind(p3, 0.05)) or 0.4 < p3.behindDot then
        return false
    end
    if p3.distanceToNape >= p3.closeNapeThreshold then
        if p3.distanceToNape < p3.lenientNapeThreshold then
            if p3.behindDot < 0.35 then
                return true
            end
            return willReachNapeSoon(p2, p3.napeAttachment, p3.distanceToNape, p3.napeRadius, 0.55, 100, p3.behindDot, 0.35)
        end
        return willReachNapeSoon(p2, p3.napeAttachment, p3.distanceToNape, p3.napeRadius, 0.55, 100, p3.behindDot, 0.35)
    end
    if isPlayerBehind(p3, 0.35) then
        return true
    end
    if p3.distanceToNape >= p3.lenientNapeThreshold then
        return willReachNapeSoon(p2, p3.napeAttachment, p3.distanceToNape, p3.napeRadius, 0.55, 100, p3.behindDot, 0.35)
    end
    if p3.behindDot < 0.35 then
        return true
    end
    return willReachNapeSoon(p2, p3.napeAttachment, p3.distanceToNape, p3.napeRadius, 0.55, 100, p3.behindDot, 0.35)
end
local function tryGrappleNapeGrab(p1, p2, p3, p4) -- Line: 176 -- upvalues: isPlayerBehind (val), willReachNapeSoon (val)
    local hit, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = p4.head.Position.Y - p4.scale * 3
    local Magnitude = p2.AssemblyLinearVelocity.Magnitude
    local v12 = p4.scale * 1.15
    v1, v2, v10 = p1, p2, p4
    for k, v in pairs(p3.grapples) do
        if v.hit and v.hit:IsDescendantOf(v1.model.client) and v.active then
            v3 = v.hit.CFrame * v.relative
            hit = v.hit
            v4 = hit.CFrame.LookVector:Dot((v3.Position - hit.Position).Unit)
            v5 = hit.CFrame.LookVector:Dot((v2.Position - hit.Position).Unit)
            v6 = v11 < v3.Position.Y
            v7 = if v5 >= 0 then if v10.distanceToNape < v12 then v5 < 0.4 else false else true
            v8 = if v10.distanceToNape < v10.closeNapeThreshold then isPlayerBehind(v10, 0.35) else false
            v9 = if v10.distanceToNape < v10.directNapeThreshold then isPlayerBehind(v10, 0.35) else false
            if v6 and v7 then
                if 0 <= v4 and not v8 and not v9 then
                    continue
                end
                if Magnitude <= 0 then
                    if not v8 and not v9 then
                        continue
                    end
                    return true
                end
                if not (willReachNapeSoon(v2, v10.napeAttachment, v10.distanceToNape, v10.napeRadius, 0.55, 100, v10.behindDot, 0.35)) and not v8 and not v9 then
                    continue
                end
                return true
            end
            if not v8 and not v9 then end
        end
    end
    return false
end
return {
    priority = 0,
    cancelsNonDefaultMoves = true,
    attempt = function(p1) -- Line: 302 -- upvalues: TitanCoreActionClient (val), CooldownTitanClient (val), Players (val), ClientGearHandler (val), getNapeContext (val), isPlayerBehind (val), pickGrabSide (val), isDirectlyAtNape (val), tryOrbitNapeGrab (val), tryGrappleNapeGrab (val)
        if TitanCoreActionClient.isCoreActionInProgress(p1) then
            return false
        end
        local v1 = {"NapeGrabAttackAttempt", "NapeGrabAttack"}
        if CooldownTitanClient.isOnCooldown(p1, v1) then
            return false
        end
        v1 = {"Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v1) then
            return false
        end
        local Character = Players.LocalPlayer.Character
        local PrimaryPart = Character
        if PrimaryPart then
            PrimaryPart = Character.PrimaryPart
        end
        local v2 = ClientGearHandler.getGearState()
        if not PrimaryPart or not v2 then
            return false
        end
        local v3 = getNapeContext(p1, PrimaryPart)
        if not v3 or not (isPlayerBehind(v3, 0.05)) then
            return false
        end
        local v4 = pickGrabSide(p1, PrimaryPart)
        local v5 = isDirectlyAtNape(v3)
        if not v5 then
            v5 = tryOrbitNapeGrab(p1, PrimaryPart, v3)
            if not v5 then
                v5 = tryGrappleNapeGrab(p1, PrimaryPart, v2, v3)
            end
        end
        if not v5 then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"NapeGrabAttackAttempt", "Arm"}, 0.5)
        return true, v4
    end,
    execute = function(p1, p2, p3, p4, p5, ...) -- Line: 250 -- upvalues: Sounds (val), Titans (val), CooldownTitanClient (val), HitboxTitanClient (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        CooldownTitanClient.addClientCooldown(p1, "NapeGrabAttack", 3)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 2)
        local u43 = HitboxTitanClient.createLimbHitbox(p1, {
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            side = p5,
            wires = {shake = true, ungrapple = true},
        })
        u43.touched:Connect(function(p1) -- Line: 276 -- upvalues: p4 (val), u43 (val)
            if p1 == "Hand" then
                p4(p1)
                u43.destroy()
                return
            end
            if p1 ~= "LowerArm" then
                return
            end
            p4(p1)
            u43.destroy()
        end)
        p2:Add(task.delay(2, function() -- Line: 285 -- upvalues: u43 (val)
            u43.destroy()
        end))
        p2:Add(function() -- Line: 289 -- upvalues: u43 (val)
            u43.destroy()
        end)
        return true
    end,
}