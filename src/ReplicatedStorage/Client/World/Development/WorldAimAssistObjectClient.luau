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
--      File: ReplicatedStorage.Client.World.Development.WorldAimAssistObjectClient
--                              Dumped in 0.000816 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local CustomBezier = require(Utilities:WaitForChild("CustomBezier"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Draw = require(Utilities_2:WaitForChild("Draw"))
local v2 = {}
local v3 = {strength = 1, point = Vector3.new(-270, 95.5, -245)}
local v4 = {strength = 1, point = Vector3.new(-210, 260.5, -420)}
local v5 = {strength = 1, point = Vector3.new(-85, 155.5, -450)}
local v6 = {strength = 1, point = Vector3.new(20, 75.5, -305)}
local v7 = {strength = 1, point = Vector3.new(180, 75.5, -185)}
local v8 = {strength = 1, point = Vector3.new(-40, 140.5, -85)}
local v9 = {strength = 1, point = Vector3.new(-230, 90.5, -85)}
v2[1] = v3
v2[2] = v4
v2[3] = v5
v2[4] = v6
v2[5] = v7
v2[6] = v8
v2[7] = v9
local u123 = {}
local u124 = nil
local function onRunBezierCurve(p1) -- Line: 41 -- upvalues: u123 (ref), Workspace (val), RunService (val), u124 (ref)
    local Part
    p1.Position = u123[1]
    p1.Anchored = false
    ;(function(p1) -- Line: 42
        local Part = Instance.new("Part")
        Part.Name = "__DecoyAimAssist"
        Part.Size = Vector3.new(5, 5, 5)
        Part.Anchored = false
        Part.CanCollide = false
        Part.Massless = true
        Part.CollisionGroup = "Characters"
        Part.Transparency = 0.5
        Part.Color = Color3.fromRGB(255, 0, 0)
        Part.CFrame = p1.CFrame
        Part.Shape = Enum.PartType.Ball
        Part.Parent = p1.Parent
        Part:AddTag("GrappleAimAssist")
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = p1
        WeldConstraint.Part1 = Part
        WeldConstraint.Parent = Part
    end)(p1)
    Part = Instance.new("Part")
    Part.Color = Color3.fromRGB(0, 255, 0)
    Part.Size = Vector3.new(2, 2, 2)
    Part.Transparency = 0.5
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.Parent = Workspace
    local BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Parent = p1
    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
    BodyVelocity.MaxForce = Vector3.new(50000, 50000, 50000)
    BodyVelocity.P = 5000
    local u40 = 0
    RunService.RenderStepped:Connect(function(a1) -- Line: 91 -- upvalues: u40 (ref), u124 (upval), p1 (val), BodyVelocity (val), Part (val)
        u40 = u40 + a1
        if 5 < u40 then
            u40 = 0
        end
        local v1 = u124:Get(u40 / 5)
        BodyVelocity.Velocity = (v1 - p1.Position).Unit * ((v1 - p1.Position).Magnitude * 3)
        Part.Position = v1
    end)
end
if RunService:IsStudio() and _G.__PVP_DEBUGGING__ and Constants.IsDevelopmentPlace then
    local v10, v11, v12
    u124 = CustomBezier.new(v2, true)
    u123 = u124:GetPathBySegmentLength(10)
    local Folder = Instance.new("Folder")
    Folder.Name = "__DecoyAimAssistFolder"
    Folder.Parent = Workspace
    v7 = #u123
    v8 = 1
    for i = 1, v7, v8 do
        v10 = u123[i + 1]
        if v10 then
            v11 = u123[i]
            v12 = Color3.fromRGB(255, 0, 0)
            Draw.line(v11, v10, v12, 0.5, 0.5).Parent = Folder
        end
    end
    for j, k in CollectionService:GetTagged("WorldAimAssistObject") do
        onRunBezierCurve(k)
    end
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("WorldAimAssistObject")
    InstanceAddedSignal:Connect(function(p1) -- Line: 129 -- upvalues: onRunBezierCurve (val)
        onRunBezierCurve(p1)
    end)
end
return {}