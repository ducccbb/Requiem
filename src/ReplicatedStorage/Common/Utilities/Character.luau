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
--                  File: ReplicatedStorage.Common.Utilities.Character
--                               Dumped in 0.00467 seconds
--                          Bytecode version 9  |  42 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Promise = require(u0.Parent.Parent:WaitForChild("Promise"))
local Alive = require(u0.Parent.Parent:WaitForChild("Alive"))
local u43 = nil
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Profiling = require(ReplicatedFirst:WaitForChild("Profiling"))
local Types = u0.Parent.Parent:WaitForChild("Types")
local Gear = require(Types:WaitForChild("Gear"))
local Observers = u0.Parent.Parent:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local u92 = CFrame.new(0, -1.05, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local u106 = CFrame.new(0, -1.05, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local u120 = CFrame.new(1, -0.749996185, -0.249969482, 1, 0, 0, 0, -0.866025448, 0.500000119, 0, -0.50000006, -0.866025448)
local u134 = CFrame.new(-1, -0.849998474, -0.25, 1, 0, 0, 0, -0.766044438, 0.642787576, 0, -0.642787576, -0.766044438)
local u135 = {}
local u136 = {}
local u137 = {}
local function getChrono() -- Line: 75 -- upvalues: u0 (val)
    return require(u0.Parent.Parent:WaitForChild("Chrono"))
end
local function getCFrame(p1) -- Line: 157 -- upvalues: RunService (val), Profiling (val), getChrono (val), Alive (val)
    local HumanoidRootPart, v1
    if not (RunService:IsServer()) then
        v1 = Alive.getAliveCharacter(p1)
        if not v1 then
            return CFrame.new()
        end
        HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return CFrame.new()
        end
        return HumanoidRootPart.CFrame
    end
    if Profiling.IS_USING_CUSTOM_REPLICATION then
        local v2 = getChrono().ChronoServer.GetLatestCFrame(p1)
        if not v2 then
            return CFrame.new()
        end
        return v2
    end
    v1 = Alive.getAliveCharacter(p1)
    if not v1 then
        return CFrame.new()
    end
    HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return CFrame.new()
    end
    return HumanoidRootPart.CFrame
end
local function createBoneBasePoint() -- Line: 746
    local Part = Instance.new("Part")
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CanCollide = false
    Part.Massless = true
    Part.Transparency = 1
    Part.Size = Vector3.new(0.2, 0.2, 0.2)
    return Part
end
local function waitForCharacterLoaded(p1) -- Line: 1110 -- upvalues: Promise (val)
    return Promise.new(function(a1, p2) -- Line: 1111 -- upvalues: p1 (val)
        local v1 = {
            "Torso",
            "HumanoidRootPart",
            "Head",
            "Humanoid",
            "Left Arm",
            "Right Arm",
            "Left Leg",
            "Right Leg",
        }
        for i, v in ipairs(v1) do
            p1:WaitForChild(v, 10)
        end
        a1()
    end)
end
local function getCharacter(p1) -- Line: 1130 -- upvalues: RunService (val), Players (val)
    if RunService:IsClient() then
        local LocalPlayer = p1
        if not LocalPlayer then
            LocalPlayer = Players.LocalPlayer
        end
        local Character = LocalPlayer.Character
        if not Character or not (Character:FindFirstChild("HumanoidRootPart")) then
            return nil
        end
        return Character
    elseif not p1 then
        return warn("getCharacter must be used on the client or with a target player")
    end
end
return {
    attachModelToBoneRigify = function(p1, p2, p3) -- Line: 641 -- upvalues: u136 (val)
        local v1 = u136[p1] or p1
        v1:PivotTo(p2.bone.CFrame)
        local Handle = v1:FindFirstChild("Handle")
        local v2 = v1:Clone()
        local Attribute = Handle
        if Attribute then
            Attribute = Handle:GetAttribute("Orientation")
        end
        local v3 = Attribute
        if not v3 then
            v3 = CFrame.new()
        end
        local u28 = v3
        if p3 then
            p3(v2)
        end
        v2:PivotTo(p2.bone.CFrame)
        if not Handle then
            local WeldConstraint_2
            v3 = p2.bone:Clone()
            v2:PivotTo(p2.bone.CFrame)
            v3.CFrame = v2:GetPivot()
            v3.Name = "Handle"
            v3.Parent = v2
            for k, v in pairs(v2:GetDescendants()) do
                if v:IsA("BasePart") and v ~= v3 then
                    WeldConstraint_2 = Instance.new("WeldConstraint")
                    WeldConstraint_2.Part0 = v3
                    WeldConstraint_2.Part1 = v
                    WeldConstraint_2.Parent = v3
                end
            end
            v3.CFrame = p2.bone.CFrame
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = p2.bone
            WeldConstraint.Part1 = v3
            WeldConstraint.Parent = p2.bone
        else
            local v4 = v2:FindFirstChild("Handle")
            local Handle_2 = p2.bone:FindFirstChild("Handle")
            if Handle_2 then
                Handle_2:Destroy()
            end
            v4.CFrame = p2.bone.CFrame
            local Motor6D = Instance.new("Motor6D")
            Motor6D.Part0 = p2.bone
            Motor6D.Part1 = v4
            Motor6D.C1 = u28
            Motor6D.Name = "Handle"
            Motor6D.Parent = p2.bone
            v4.CFrame = p2.bone.CFrame
            task.defer(function() -- Line: 681 -- upvalues: Motor6D (val), u28 (ref)
                Motor6D.C1 = u28
            end)
        end
        for k2, i in pairs(v2:GetDescendants()) do
            if i:IsA("BasePart") then
                i.Anchored = false
                i.CanCollide = false
                i.Massless = true
                i.CanTouch = false
                i.CanQuery = false
            end
        end
        v2.Parent = p2.bone.Parent
        return v2
    end,
    attachRigModelToCharacter = function(p1, p2) -- Line: 474
        local Folder, Parent, Parent_2, RootPart, v1, v2, v3, v4, v5, v6
        if not p1 or not p2 then
            return
        end
        local Name = p2.Name
        local v7 = p2:FindFirstChild(Name)
        if not v7 then
            return nil
        end
        if not (v7:IsA("Folder")) then
            v7:ScaleTo(p1:GetScale())
        end
        Folder = Instance.new("Folder")
        Folder.Name = "attachment_" .. p2.Name
        Folder.Parent = p1
        local v8 = {}
        local v9 = {}
        local v10 = {}
        local v11 = p1
        for k, v in pairs(p2:GetChildren()) do
            if v:IsA("BasePart") then
                for k2, i in pairs(v7:GetDescendants()) do
                    for k3, j in pairs(v:GetChildren()) do
                        if j:IsA("Motor6D") then
                            if j.Part1 == i then
                                Parent = i.Parent
                                if i.Name ~= "RootPart" then
                                    v1 = i:Clone()
                                    v1.Parent = Folder
                                    v2 = j:Clone()
                                    v2.Part0 = v11:FindFirstChild(v.Name)
                                    v2.Part1 = v1
                                    v2.Parent = v11:FindFirstChild(v.Name)
                                    for k4, k5 in pairs(i:GetChildren()) do
                                        if k5:IsA("Motor6D") then
                                            v5 = k5:Clone()
                                            v5.Parent = v1
                                            v6 = k5.Part1:Clone()
                                            if k5.Part1.Parent.Name == Folder.Name then
                                                v6.Parent = Folder
                                            elseif k5.Part1.Parent:IsA("Folder") then
                                                Parent_2 = k5.Part1.Parent
                                                if not (v9[Parent_2]) then
                                                    v9[Parent_2] = Instance.new("Folder")
                                                    v9[Parent_2].Name = Parent_2.Name
                                                    v9[Parent_2].Parent = Folder
                                                end
                                                v6.Parent = v9[Parent_2]
                                            elseif not (k5.Part1.Parent:IsA("Model")) then
                                            end
                                            v5.Part0 = v1
                                            v5.Part1 = v6
                                        elseif not (k5:IsA("Weld")) then
                                        end
                                    end
                                    table.insert(v8, v2)
                                elseif Parent ~= nil and Parent ~= v7 and Parent:IsA("Model") then
                                    v1 = v11:FindFirstChild(v.Name)
                                    if v1 then
                                        v2 = v10[Parent]
                                        if not v2 then
                                            v3 = Parent:Clone()
                                            v3.Parent = Folder
                                            v10[Parent] = v3
                                        else
                                            v3 = v2
                                        end
                                        RootPart = v3:FindFirstChild("RootPart")
                                        if RootPart then
                                            v4 = j:Clone()
                                            v4.Part0 = v1
                                            v4.Part1 = RootPart
                                            v4.Parent = v1
                                            table.insert(v8, v4)
                                        end
                                    end
                                end
                            elseif j.Part0 ~= i then
                            end
                        end
                    end
                end
            end
        end
        for k6, n in pairs(Folder:GetDescendants()) do
            if n:IsA("Motor6D") then
                n:SetAttribute("Ignore", true)
            end
        end
        return Folder
    end,
    disconnectModelsFromBone = function(p1) -- Line: 452
        local v1
        if not p1.connected then
            v1 = p1
        else
            v1 = p1
            for k, v in pairs(p1.connected) do
                if v.weld then
                    v.weld:Destroy()
                end
                if v.model then
                    v.model:Destroy()
                end
            end
        end
        v1.connected = {}
    end,
    createPlayerHandBones = function(p1) -- Line: 858 -- upvalues: u106 (val), createBoneBasePoint (val), u92 (val), u135 (val), useCharacterObserver (val)
        local v1
        local function createBoneFromArmToHand(p1, p2) -- Line: 864 -- upvalues: u106 (upval)
            local Motor6D = Instance.new("Motor6D")
            Motor6D.C0 = u106
            Motor6D.Parent = p1
            Motor6D.Part0 = p1
            Motor6D.Part1 = p2
            return Motor6D
        end
        local function createHandForArm(p1) -- Line: 879 -- upvalues: createBoneBasePoint (upval), u92 (upval)
            local v1 = createBoneBasePoint()
            v1.CFrame = p1.CFrame * u92
            return v1
        end
        local function createHandleFromArm(p1, p2) -- Line: 890 -- upvalues: createHandForArm (val), createBoneFromArmToHand (val)
            local v1 = p1:FindFirstChild(p2 .. "Hand")
            if v1 then
                v1:Destroy()
            end
            local v2 = p1:WaitForChild(p2 .. " Arm")
            local v3 = createHandForArm(v2)
            v3.Name = p2 .. "Hand"
            v3.Parent = p1
            local v4 = createBoneFromArmToHand(v2, v3)
            v4.Name = p2 .. "Handle"
            return v3, v4
        end
        v1 = u135[p1]
        if not v1 then
            v1 = {}
        end
        u135[p1] = v1
        return useCharacterObserver(function(a1) -- Line: 914 -- upvalues: createHandleFromArm (val), u135 (upval), p1 (val)
            local v1, v2, v3, v4
            v1, v2 = createHandleFromArm(a1, "Left")
            v3, v4 = createHandleFromArm(a1, "Right")
            local v5 = u135[p1]
            if not v5 then
                v5 = {}
            end
            u135[p1] = v5
            local v6 = u135[p1]
            v6.handles = {
                left = {bone = v1, motor = v2, connected = {}},
                right = {bone = v3, motor = v4, connected = {}},
            }
            return function() -- Line: 927 -- upvalues: u135 (upval), p1 (upval)
                if not (u135[p1]) then
                    return
                end
                local v1 = u135[p1]
                v1.handles = nil
                if not (u135[p1].holsters) then
                    u135[p1] = nil
                end
            end
        end, p1, "createPlayerHandBones")
    end,
    createPlayerHolsterBones = function(p1, p2) -- Line: 765 -- upvalues: u137 (val), Gear (val), createBoneBasePoint (val), u120 (val), u134 (val), u135 (val), useCharacterObserver (val)
        local v1
        u137[p1] = Gear.Generation.normalize(p2)
        local function createHolsterForSide(p1, p2, p3) -- Line: 772 -- upvalues: createBoneBasePoint (upval), u120 (upval), u134 (upval), Gear (upval)
            local v1
            local Torso = p1:WaitForChild("Torso")
            local v2 = createBoneBasePoint()
            local CFrame = Torso.CFrame
            if p2 ~= "Right" then
                v1 = u134
            else
                v1 = u120
                if not v1 then
                    v1 = u134
                end
            end
            v2.CFrame = CFrame * v1
            v2.Name = p2 .. "Holster"
            v2.Parent = p1
            local Motor6D = Instance.new("Motor6D")
            Motor6D.C0 = Gear.Generation.getHolsterC0(p2, p3)
            Motor6D.Part0 = Torso
            Motor6D.Part1 = v2
            Motor6D.Parent = Torso
            Motor6D.Name = p2 .. "HolsterBone"
            return v2, Motor6D
        end
        v1 = u135[p1]
        if not v1 then
            v1 = {}
        end
        u135[p1] = v1
        return useCharacterObserver(function(a1) -- Line: 798 -- upvalues: Gear (upval), p1 (val), u137 (upval), createHolsterForSide (val), u135 (upval)
            local v1, v2, v3, v4
            local v5 = Gear.Generation.getPlayerGeneration(p1, u137[p1])
            v1, v2 = createHolsterForSide(a1, "Left", v5)
            v3, v4 = createHolsterForSide(a1, "Right", v5)
            local v6 = u135[p1]
            if not v6 then
                v6 = {}
            end
            u135[p1] = v6
            local v7 = u135[p1]
            v7.holsters = {
                left = {bone = v1, motor = v2, connected = {}},
                right = {bone = v3, motor = v4, connected = {}},
            }
            return function() -- Line: 813 -- upvalues: u135 (upval), p1 (upval)
                if not (u135[p1]) then
                    return
                end
                local v1 = u135[p1]
                v1.holsters = nil
                if not (u135[p1].handles) then
                    u135[p1] = nil
                end
            end
        end, p1, "createPlayerHolsterBones")
    end,
    updatePlayerHolsterGeneration = function(p1, p2) -- Line: 832 -- upvalues: Gear (val), u137 (val), u135 (val)
        local v1 = Gear.Generation.normalize(p2)
        u137[p1] = v1
        local v2 = u135[p1]
        if not v2 or not v2.holsters then
            return
        end
        local motor = v2.holsters.left.motor
        local motor_2 = v2.holsters.right.motor
        if motor:IsA("Motor6D") then
            motor.C0 = Gear.Generation.getHolsterC0("Left", v1)
        end
        if motor_2:IsA("Motor6D") then
            motor_2.C0 = Gear.Generation.getHolsterC0("Right", v1)
        end
    end,
    connectModelToBasePart = function(p1, p2) -- Line: 389
        assert(p1.PrimaryPart, "Model must have a PrimaryPart to connect to a BasePart")
        p1:PivotTo(p2.CFrame)
        local Motor6D = Instance.new("Motor6D")
        Motor6D.C0 = CFrame.new()
        Motor6D.Part0 = p2
        Motor6D.Part1 = p1.PrimaryPart
        Motor6D.Parent = p2
    end,
    connectModelToBone = function(p1, p2) -- Line: 408
        assert(p1.PrimaryPart, "Model must have a PrimaryPart to connect to a BasePart")
        p1:PivotTo(p2.bone.CFrame)
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = p2.bone
        WeldConstraint.Part1 = p1.PrimaryPart
        WeldConstraint.Parent = p2.bone
        table.insert(p2.connected, {weld = WeldConstraint, model = p1})
        return p2
    end,
    connectBasePartToBone = function(p1, p2, p3) -- Line: 434
        p1.Anchored = false
        local v1 = p3
        if not v1 then
            v1 = CFrame.new()
        end
        p1:PivotTo(p2.bone.CFrame * v1)
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = p2.bone
        WeldConstraint.Part1 = p1
        WeldConstraint.Parent = p2.bone
        return WeldConstraint
    end,
    waitForCharacterLoaded = waitForCharacterLoaded,
    getCharacter = getCharacter,
    getCharacterAsync = function(p1) -- Line: 1176 -- upvalues: Players (val), Promise (val), waitForCharacterLoaded (val)
        local LocalPlayer = p1
        if not LocalPlayer then
            LocalPlayer = Players.LocalPlayer
        end
        return Promise.new(function(p1, p2) -- Line: 1179 -- upvalues: LocalPlayer (val), waitForCharacterLoaded (upval)
            local Character = LocalPlayer.Character
            if not Character then
                Character = LocalPlayer.CharacterAdded:Wait()
            end
            waitForCharacterLoaded(Character):andThen(function() -- Line: 1184 -- upvalues: p1 (val), Character (val)
                p1(Character)
            end)
        end)
    end,
    isGrounded = function(p1, p2) -- Line: 947 -- upvalues: Players (val), Workspace (val)
        local v1
        local Character = p1
        if not Character then
            Character = Players.LocalPlayer.Character
        end
        if not Character then
            return false, 5000, nil
        end
        local v2 = RaycastParams.new()
        v2.FilterType = Enum.RaycastFilterType.Exclude
        v2.FilterDescendantsInstances = {Character}
        local v3 = Character.HumanoidRootPart.Position + Vector3.new(0, 0.5, 0)
        local v4 = Vector3.new(0, -5000, 0)
        local v5 = Workspace:Raycast(v3, v4, v2)
        if not v5 then
            return false, 5000, nil
        end
        if v5.Distance < p2 or 5 then
            v1 = true
        else
            v1 = false
        end
        return v1, v5.Distance, v5
    end,
    isUnderRoof = function(p1) -- Line: 1016 -- upvalues: Players (val), Workspace (val)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local Character = p1
        if not Character then
            Character = Players.LocalPlayer.Character
        end
        if not Character then
            return false, 5000
        end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return false, 5000
        end
        local v9 = RaycastParams.new()
        v9.FilterType = Enum.RaycastFilterType.Exclude
        v9.FilterDescendantsInstances = {Character}
        local Position = HumanoidRootPart.Position
        local v10 = {}
        local v11 = 330
        local v12 = 30
        for i = 0, v11, v12 do
            v8 = math.rad(i)
            v2 = math.cos(v8)
            v1 = Vector3.new(v2, 0, (math.sin(v8)))
            table.insert(v10, {maxDist = 200, rayLen = 300, direction = v1})
        end
        table.insert(v10, {maxDist = 50, rayLen = 200, direction = Vector3.new(0, 1, 0)})
        v11 = math.rad(45)
        v12 = 315
        local v13 = 45
        for j = 0, v12, v13 do
            v4 = CFrame.Angles(0, math.rad(j), 0)
            v3 = v4 * CFrame.Angles(v11, 0, 0)
            table.insert(v10, {maxDist = 50, rayLen = 200, direction = v3 * Vector3.new(0, 1, 0)})
        end
        v12 = math.rad(22.5)
        v13 = 315
        v8 = 45
        for k = 0, v13, v8 do
            v5 = CFrame.Angles(0, math.rad(k), 0)
            v4 = v5 * CFrame.Angles(v12, 0, 0)
            table.insert(v10, {maxDist = 50, rayLen = 200, direction = v4 * Vector3.new(0, 1, 0)})
        end
        v13 = math.rad(67.5)
        v8 = 315
        v1 = 45
        for n = 0, v8, v1 do
            v6 = CFrame.Angles(0, math.rad(n), 0)
            v5 = v6 * CFrame.Angles(v13, 0, 0)
            table.insert(v10, {maxDist = 200, rayLen = 300, direction = v5 * Vector3.new(0, 1, 0)})
        end
        v1 = 0
        local Distance = 5000
        for i2, v in ipairs(v10) do
            v7 = Workspace:Raycast(Position, v.direction * v.rayLen, v9)
            if v7 and v7.Instance and 50 <= v7.Instance.Mass and v7.Distance <= v.maxDist then
                v1 = v1 + 1
                if 0.5 < v.direction.Y and v7.Distance < Distance then
                    Distance = v7.Distance
                end
            end
        end
        v4 = 0.9 <= v1 / #v10
        return v4, Distance
    end,
    isRagdolled = function(p1) -- Line: 633 -- upvalues: Players (val)
        local Character
        if p1 then
            Character = p1
        else
            Character = Players.LocalPlayer.Character
        end
        local v1 = Character:GetAttribute("Ragdolled") == true
        return v1
    end,
    isSeated = function(p1) -- Line: 995 -- upvalues: Players (val)
        local Character = p1
        if not Character then
            Character = Players.LocalPlayer.Character
        end
        if not Character then
            return false
        end
        local Humanoid = Character:WaitForChild("Humanoid")
        if not Humanoid then
            return false
        end
        local Sit = Humanoid.Sit
        if not Sit then
            Sit = Humanoid.SeatPart ~= nil
        end
        return Sit
    end,
    isActive = function(p1) -- Line: 976 -- upvalues: Players (val)
        local Character = p1
        if not Character then
            Character = Players.LocalPlayer.Character
        end
        if not Character then
            return false
        elseif not p1 then
            if not Character then
                if not (Character:FindFirstChild("HumanoidRootPart")) then
                    return false
                end
                return true
            end
            if Character.Parent == nil or not (Character:FindFirstChild("HumanoidRootPart")) then
                return false
            end
            return true
        elseif Character.Parent == nil then
            return false
        end
    end,
    getDistance = function(p1) -- Line: 1153 -- upvalues: RunService (val), getCharacter (val)
        if not (RunService:IsClient()) then
            warn("getDistance must be used on the client")
            return 0, false
        end
        local v1 = getCharacter()
        if not v1 then
            return 0, false
        end
        if typeof(p1) == "Vector3" then
            return (v1.HumanoidRootPart.Position - p1).Magnitude, true
        end
        return (v1.HumanoidRootPart.Position - p1.Position).Magnitude, true
    end,
    getPosition = function(p1) -- Line: 193 -- upvalues: getCFrame (val)
        return getCFrame(p1).Position
    end,
    getCFrame = getCFrame,
    getTorsoCFrame = function(p1) -- Line: 202 -- upvalues: RunService (val), Profiling (val), Alive (val), getChrono (val)
        local v1
        if RunService:IsClient() then
            v1 = Alive.getAliveCharacter(p1)
            if not v1 then
                return CFrame.new()
            end
            local HumanoidRootPart_2 = v1:FindFirstChild("HumanoidRootPart")
            local Torso_2 = v1:FindFirstChild("Torso")
            if not Torso_2 then
                Torso_2 = v1:FindFirstChild("UpperTorso")
            end
            if Torso_2 then
                return Torso_2.CFrame
            end
            if HumanoidRootPart_2 then
                return HumanoidRootPart_2.CFrame
            end
            return CFrame.new()
        elseif Profiling.IS_USING_CUSTOM_REPLICATION then
            v1 = getChrono()
            local ChronoServer = v1.ChronoServer
            local v2 = if ChronoServer and ChronoServer.GetLatestCFrame then ChronoServer.GetLatestCFrame(p1) else nil
            local Character = p1.Character
            if not Character and v1.Character and v1.Character.GetCharacter then
                Character = v1.Character.GetCharacter(p1)
            end
            if not Character then
                local v3 = v2
                if not v3 then
                    v3 = CFrame.new()
                end
                return v3
            end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            local Torso = Character:FindFirstChild("Torso")
            if not Torso then
                Torso = Character:FindFirstChild("UpperTorso")
            end
            if not HumanoidRootPart then
                if v2 then
                    return v2
                end
                if HumanoidRootPart then
                    return HumanoidRootPart.CFrame
                end
                return CFrame.new()
            end
            if Torso then
                local v4 = HumanoidRootPart.CFrame:ToObjectSpace(Torso.CFrame)
                if not v2 then
                    return Torso.CFrame
                end
                return v2 * v4
            end
            if v2 then
                return v2
            end
            if HumanoidRootPart then
                return HumanoidRootPart.CFrame
            end
            return CFrame.new()
        end
    end,
    getVelocity = function(p1, p2) -- Line: 275 -- upvalues: RunService (val), Profiling (val), Alive (val), getChrono (val)
        local snapshot, v1, v2, v3, v4, v5
        local v6 = math.max(p2 or 2, 2)
        if RunService:IsClient() or not Profiling.IS_USING_CUSTOM_REPLICATION then
            local v7 = Alive.getAliveCharacter(p1)
            if not v7 then
                return Vector3.zero
            end
            local HumanoidRootPart = v7:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return Vector3.zero
            end
            local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
            if not AssemblyLinearVelocity then
                return Vector3.zero
            end
            return AssemblyLinearVelocity
        end
        local ChronoServer = getChrono().ChronoServer
        if not ChronoServer or not ChronoServer.GetId or not ChronoServer.idMap then
            return Vector3.zero
        end
        local v8 = ChronoServer.GetId(p1)
        if not v8 then
            return Vector3.zero
        end
        local v9 = ChronoServer.idMap[v8]
        if not v9 or not v9.snapshot then
            return Vector3.zero
        end
        snapshot = v9.snapshot
        local cache = snapshot.cache
        local count = snapshot.count
        if not cache or count == 0 then
            return Vector3.zero
        end
        local u28 = #cache
        local head = snapshot.head
        local v10 = math.min(v6, count)
        if v10 < 2 then
            return Vector3.zero
        end
        local v11 = table.create(v10)
        local v12 = table.create(v10)
        local v13 = v10
        local v14 = 1
        for i = 1, v13, v14 do
            v1 = cache[(function(p1) -- Line: 326 -- upvalues: head (val), u28 (val)
                return (head + p1 - 2) % u28 + 1
            end)(count - (i - 1))]
            if not v1 then
                break
            end
            v11[i] = v1.t
            v12[i] = v1.value.Position
        end
        local zero = Vector3.zero
        v14 = 0
        local v15 = v10 - 1
        local v16 = 1
        for j = 1, v15, v16 do
            v1 = v11[j + 1]
            v2 = v11[j]
            if v1 and v2 then
                v3 = v2 - v1
                if v3 > 0.0001 then
                    v4 = v12[j + 1]
                    v5 = v12[j]
                    if v4 and v5 then
                        zero = zero + (v5 - v4) / v3
                        v14 = v14 + 1
                    end
                end
            end
        end
        if v14 == 0 then
            return Vector3.zero
        end
        return zero / v14
    end,
    setCustomReplicationEnabled = function(p1, p2) -- Line: 134 -- upvalues: RunService (val), Profiling (val), getChrono (val)
        if not (RunService:IsServer()) then
            warn("onSetReplicationEnabled can only be called on the server")
            return
        end
        if not Profiling.IS_USING_CUSTOM_REPLICATION then
            return
        end
        getChrono().ChronoServer.TogglePlayerReplication(p1, p2)
    end,
    setLockedCFrame = function(p1, p2, p3) -- Line: 86 -- upvalues: RunService (val), Profiling (val), u43 (ref), u0 (val)
        if not (RunService:IsServer()) then
            warn("setLockedCFrame can only be called on the server")
            return
        end
        if Profiling.IS_USING_CUSTOM_REPLICATION then
            local Effects = u43
            if not Effects then
                Effects = require(u0.Parent.Parent.Effects.Effects)
            end
            u43 = Effects
            u43.sendEffectRequestToPlayer(p1, "Lock", p2, p3)
            return
        end
        local Character = p1.Character
        if not Character then
            return
        end
        local HumanoidRootPart = Character
        if HumanoidRootPart then
            HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return
        end
        HumanoidRootPart.Anchored = true
        HumanoidRootPart.CFrame = p2
        task.delay(p3 - workspace:GetServerTimeNow(), function() -- Line: 114 -- upvalues: HumanoidRootPart (val)
            HumanoidRootPart.Anchored = false
        end)
    end,
    getCharacterBones = function(p1) -- Line: 1222 -- upvalues: u135 (val)
        return u135[p1]
    end,
}