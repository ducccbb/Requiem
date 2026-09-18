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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterPhysicsHandler
--                               Dumped in 0.00115 seconds
--                          Bytecode version 9  |  17 functions

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
local function getShifterRoot(p1) -- Line: 30
    if p1.root then
        return p1.root
    end
    if not p1.model then
        return nil
    end
    return (p1.model:FindFirstChild("HumanoidRootPart"))
end
local function getShifterMass(p1) -- Line: 47 -- upvalues: getShifterRoot (val)
    if not p1.model then
        return 100
    end
    local v1 = getShifterRoot(p1)
    if not v1 then
        local v2 = 0
        for i, j in p1.model:GetDescendants() do
            if j:IsA("BasePart") and not j.Massless then
                v2 = v2 + j.Mass
            end
        end
        return (math.max(v2, 100))
    elseif 0 < v1.AssemblyMass then
        return v1.AssemblyMass
    end
end
local function getBodyVelocityPower(p1, p2) -- Line: 69 -- upvalues: getShifterMass (val)
    return (p2 or 8000) * getShifterMass(p1)
end
local function clearRootMovementConstraints(p1) -- Line: 75
    local WallClimbPosition = p1:FindFirstChild("WallClimbPosition")
    if WallClimbPosition then
        WallClimbPosition:Destroy()
    end
end
local function applyRootVelocity(p1, p2, p3) -- Line: 84
    p2.Velocity = p3
    p1.AssemblyLinearVelocity = p3
end
return {
    getShifterMass = getShifterMass,
    onRunForwardVelocity = function(p1, p2, p3) -- Line: 218 -- upvalues: getShifterRoot (val), clearRootMovementConstraints (val), getBodyVelocityPower (val), RunService (val), applyRootVelocity (val)
        if not p1.model then
            return nil
        end
        local u7 = getShifterRoot(p1)
        if not u7 then
            return nil
        end
        clearRootMovementConstraints(u7)
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = "ShifterVelocity"
        BodyVelocity.Parent = u7
        BodyVelocity.Velocity = Vector3.zero
        BodyVelocity.MaxForce = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.P = getBodyVelocityPower(p1)
        local u25 = nil
        local u26 = 0
        u25 = RunService.Heartbeat:Connect(function(p1) -- Line: 239 -- upvalues: u26 (ref), p3 (val), u25 (ref), BodyVelocity (val), u7 (val), applyRootVelocity (upval), p2 (val)
            u26 = u26 + p1
            if not p3 or p3 > u26 then
                if not u7.Parent then
                    return
                end
                applyRootVelocity(u7, BodyVelocity, u7.CFrame.LookVector * p2)
                return
            end
            if u25 then
                u25:Disconnect()
                u25 = nil
            end
            if BodyVelocity.Parent then
                BodyVelocity:Destroy()
            end
        end)
        return function() -- Line: 261 -- upvalues: u25 (ref), BodyVelocity (val)
            if u25 then
                u25:Disconnect()
                u25 = nil
            end
            if BodyVelocity.Parent then
                BodyVelocity:Destroy()
            end
        end
    end,
    onRunVelocity = function(p1, p2, p3) -- Line: 157 -- upvalues: getShifterRoot (val), clearRootMovementConstraints (val), getBodyVelocityPower (val), applyRootVelocity (val), RunService (val)
        local BodyVelocity
        if not p1.model then
            return nil
        end
        local u7 = getShifterRoot(p1)
        if not u7 then
            return nil
        end
        local Magnitude = p2.Magnitude
        if Magnitude < 1e-05 then
            return nil
        end
        clearRootMovementConstraints(u7)
        for i, j in u7:GetChildren() do
            if j:IsA("BodyVelocity") then
                j:Destroy()
            end
        end
        BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = "ShifterVelocity"
        BodyVelocity.Parent = u7
        BodyVelocity.Velocity = Vector3.zero
        BodyVelocity.MaxForce = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.P = getBodyVelocityPower(p1)
        local u45 = p2 / Magnitude * p3
        applyRootVelocity(u7, BodyVelocity, u45)
        local u58 = RunService.Heartbeat:Connect(function() -- Line: 192 -- upvalues: u7 (val), applyRootVelocity (upval), BodyVelocity (val), u45 (val)
            if not u7.Parent then
                return
            end
            applyRootVelocity(u7, BodyVelocity, u45)
        end)
        return function() -- Line: 200 -- upvalues: u58 (ref), BodyVelocity (val)
            if u58 then
                u58:Disconnect()
                u58 = nil
            end
            if BodyVelocity.Parent then
                BodyVelocity:Destroy()
            end
        end
    end,
    onRunBezierCurve = function(p1, p2, p3) -- Line: 278 -- upvalues: getShifterRoot (val), clearRootMovementConstraints (val), getBodyVelocityPower (val), RunService (val), applyRootVelocity (val)
        if not p1.model then
            return
        end
        local u6 = getShifterRoot(p1)
        if not u6 then
            return
        end
        local Humanoid = p1.model:FindFirstChild("Humanoid")
        if not Humanoid then
            return
        end
        Humanoid.AutoRotate = false
        clearRootMovementConstraints(u6)
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = "ShifterVelocity"
        BodyVelocity.Parent = u6
        BodyVelocity.Velocity = Vector3.zero
        BodyVelocity.MaxForce = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.P = getBodyVelocityPower(p1)
        local u29 = 0
        local u30 = nil
    end,
    onLaunchFromCameraDirection = function(p1, p2, p3, p4) -- Line: 95 -- upvalues: getShifterRoot (val), clearRootMovementConstraints (val), getBodyVelocityPower (val), RunService (val), applyRootVelocity (val)
        if not p1.model then
            return nil
        end
        local u8 = getShifterRoot(p1)
        if not u8 then
            return nil
        end
        clearRootMovementConstraints(u8)
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Parent = u8
        BodyVelocity.Velocity = Vector3.zero
        BodyVelocity.MaxForce = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.P = getBodyVelocityPower(p1, p3)
        local u26 = nil
        local u27 = 0
        u26 = RunService.Heartbeat:Connect(function(p1) -- Line: 121 -- upvalues: u27 (ref), p4 (val), u26 (ref), BodyVelocity (val), applyRootVelocity (upval), u8 (val), p2 (val)
            u27 = u27 + p1
            if not p4 or p4 > u27 then
                applyRootVelocity(u8, BodyVelocity, workspace.CurrentCamera.CFrame.lookVector * p2)
                return
            end
            if u26 then
                u26:Disconnect()
                u26 = nil
            end
            if BodyVelocity.Parent then
                BodyVelocity:Destroy()
            end
        end)
        return function() -- Line: 139 -- upvalues: u26 (ref), BodyVelocity (val)
            if u26 then
                u26:Disconnect()
                u26 = nil
            end
            if BodyVelocity.Parent then
                BodyVelocity:Destroy()
            end
        end
    end,
}