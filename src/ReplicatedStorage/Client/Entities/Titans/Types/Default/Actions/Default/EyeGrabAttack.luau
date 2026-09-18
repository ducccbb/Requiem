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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.EyeGrabAttack
--                               Dumped in 0.00168 seconds
--                          Bytecode version 9  |  10 functions

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
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterPredictionRunner = require(Character_2:WaitForChild("CharacterPredictionRunner"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_3:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_4 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u183 = {Head = true, UpperTorso = true}
local function safeCancelThread(p1) -- Line: 52
    if not p1 or coroutine.running() == p1 then
        return
    end
    pcall(task.cancel, p1)
end
local function predictPlayerPositionAt(p1, p2, p3) -- Line: 71 -- upvalues: CharacterPredictionRunner (val)
    local Position = p1.Position
    local AssemblyLinearVelocity = p1.AssemblyLinearVelocity
    if not p3 then
        return Position + AssemblyLinearVelocity * p2
    end
    local v1 = CharacterPredictionRunner.predictPlayerPositionCurved(p2)
    if not v1 then
        v1 = Position + AssemblyLinearVelocity * p2
    end
    return v1
end
local function predictClosestEyeApproach(p1, p2, p3, p4) -- Line: 92 -- upvalues: predictPlayerPositionAt (val)
    local Magnitude, v1, v2, v3, v4, v5
    local huge = math.huge
    local v6 = p3
    local v7 = 12
    local v8 = 1
    v3, v2, v4, v1 = p3, p2, p4, p1
    for i = 0, v7, v8 do
        v5 = v3 * (i / 12)
        Magnitude = (v1 - predictPlayerPositionAt(v2, v5, v4)).Magnitude
        if Magnitude < huge then
            huge = Magnitude
            v6 = v5
        end
    end
    return huge, v6
end
local function evaluateGrappleInFace(p1, p2, p3, p4, p5, p6) -- Line: 124 -- upvalues: predictClosestEyeApproach (val), predictPlayerPositionAt (val), u183 (val)
    local hit, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14
    local v15 = false
    local WorldPosition = p5.WorldPosition
    local Magnitude = p2.AssemblyLinearVelocity.Magnitude
    local Magnitude_2 = (WorldPosition - p2.Position).Magnitude
    local v16 = false
    for k, v in pairs(p3.grapples) do
        if v.active and v.hit and v.hit:IsDescendantOf(p1.model.client) then
            v16 = true
            break
        end
    end
    local v17 = v16
    if v17 then
        v17 = 0.5 < Magnitude
    end
    v2, v3 = predictClosestEyeApproach(WorldPosition, p2, 0.6, v17)
    local v18 = p6 * 1.5 * 1.08
    local v19 = p6 * 1.55 * 1.08
    local v20 = Magnitude_2 < p6 * 1
    local v21 = v2 <= v19 * 1
    local v22 = v3 <= 0.9199999999999999
    local v23 = Magnitude_2 <= p6 * 4.5
    local v24 = (WorldPosition - predictPlayerPositionAt(p2, 0.9199999999999999, v17)).Magnitude <= v19
    v1, v4, v14 = p1, p4, p6
    for k2, i in pairs(p3.grapples) do
        if i.hit and i.hit:IsDescendantOf(v1.model.client) and i.active then
            hit = i.hit
            v5 = u183[hit.Name] == true
            v6 = hit.CFrame * i.relative
            v7 = hit.CFrame.LookVector:Dot((v6.Position - hit.Position).Unit)
            v8 = v4.Position.Y - v14 * 2 < v6.Position.Y
            if not v5 then
                v9 = v18
            else
                v9 = v19
            end
            v10 = v2 <= v9
            v11 = v23
            if v11 then
                v11 = false
                if v2 <= v19 then
                    v11 = v22
                    if v11 then
                        v11 = v21 or v24
                    end
                end
            end
            v12 = v10
            if v12 then
                v12 = math.min(Magnitude_2, v2) <= v19
            end
            if not v5 then
                v13 = v10
            else
                v13 = v20
                if not v13 then
                    v13 = v11
                    if not v13 then
                        v13 = v12
                    end
                end
            end
            if Magnitude >= 0.5 and v7 > 0 then
                if not v5 then
                    if not v5 and v8 and v10 then
                        v15 = true
                    end
                elseif v13 or v20 then
                    v15 = true
                end
            end
        end
    end
    return v15
end
return {
    priority = 2,
    attempt = function(p1) -- Line: 289 -- upvalues: CooldownTitanClient (val), Character (val), ClientGearHandler (val), evaluateGrappleInFace (val)
        local Eyes, v1
        local v2 = {"EyeGrabAttackAttempt", "EyeGrabAttack"}
        if CooldownTitanClient.isOnCooldown(p1, v2) or CooldownTitanClient.isOnCooldown(p1, "Bite") then
            return false
        end
        local Head = p1.model.client:FindFirstChild("Head")
        if not Head then
            Eyes = nil
        else
            Eyes = Head:FindFirstChild("Eyes")
        end
        if not Head or not Eyes then
            return false
        end
        v2 = Character.getCharacter()
        local HumanoidRootPart = v2
        if HumanoidRootPart then
            HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
        end
        local v3 = ClientGearHandler.getGearState()
        if not HumanoidRootPart or not v3 then
            return false
        end
        local scale = p1.scale
        local v4 = evaluateGrappleInFace(p1, HumanoidRootPart, v3, Head, Eyes, scale)
        if (HumanoidRootPart.Position - Eyes.WorldPosition).Magnitude < scale * 1 then
            CooldownTitanClient.addClientCooldown(p1, {"EyeGrabAttackAttempt", "Arm"}, 0.5)
            if math.random(1, 2) ~= 1 then
                v1 = "Right"
            else
                v1 = "Left"
            end
            return true, v1
        end
        if not v4 then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"EyeGrabAttackAttempt", "Arm"}, 0.5)
        if math.random(1, 2) ~= 1 then
            v1 = "Right"
        else
            v1 = "Left"
        end
        return true, v1
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 222 -- upvalues: Sounds (val), Titans (val), CooldownTitanClient (val), HitboxTitanClient (val), safeCancelThread (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        CooldownTitanClient.addClientCooldown(p1, "EyeGrabAttack", 3)
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
        local u44 = false
        local u45 = nil
        u43.touched:Connect(function(p1) -- Line: 250 -- upvalues: u44 (ref), safeCancelThread (upval), u45 (ref), p4 (val), u43 (val)
            if u44 then
                return
            end
            if p1 == "Hand" then
                u44 = true
                safeCancelThread(u45)
                u45 = nil
                p4(p1)
                u43.destroy()
                return
            end
            if p1 ~= "LowerArm" then
                return
            end
            u44 = true
            safeCancelThread(u45)
            u45 = nil
            p4(p1)
            u43.destroy()
        end)
        u45 = task.delay(2, function() -- Line: 266 -- upvalues: u44 (ref), u43 (val)
            if u44 then
                return
            end
            u44 = true
            u43.destroy()
        end)
        p2:Add(function() -- Line: 274 -- upvalues: safeCancelThread (upval), u45 (ref), u44 (ref), u43 (val)
            safeCancelThread(u45)
            if not u44 then
                u43.destroy()
            end
        end)
        return true
    end,
}