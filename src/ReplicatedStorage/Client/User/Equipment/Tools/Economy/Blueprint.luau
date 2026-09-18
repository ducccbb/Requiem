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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Economy.Blueprint
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Prefabs = require(Types:WaitForChild("Prefabs"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Types_2 = Common_4:WaitForChild("Types")
local u110 = nil
local u111 = nil
local u112 = nil
local u115 = tick() - 10
return {
    equipped = function(p1, p2) -- Line: 56 -- upvalues: Prefabs (val), Character (val), Workspace (val), Players (val), u110 (ref), UserInputService (val), u115 (ref), Signals (val), u111 (ref), RunService (val), CollectionService (val), u112 (ref)
        local BoundingBox, BoundingBox_2, u19
        local v1 = p2
        if v1 then
            v1 = p2.tags[1]
        end
        if not v1 or not (Prefabs.Prefabs[v1]) then
            return
        end
        local v2 = Prefabs.getPrefabModelByName(v1)
        if not v2 then
            return
        end
        _, u19 = Character.getCharacterAsync():await()
        BoundingBox_2, BoundingBox = v2:GetBoundingBox()
        v2 = v2:Clone()
        local Model = Instance.new("Model")
        v2.Parent = Model
        local Part = Instance.new("Part")
        Part.Size = BoundingBox
        Part.Anchored = true
        Part.CanCollide = false
        Part.Transparency = 1
        Part.CFrame = BoundingBox_2
        Part.Parent = Model
        v2.PrimaryPart = Part
        local SelectionBox = Instance.new("SelectionBox")
        SelectionBox.Color3 = Color3.fromRGB(19, 157, 255)
        SelectionBox.LineThickness = 0.025
        SelectionBox.SurfaceColor3 = Color3.fromRGB(105, 163, 239)
        SelectionBox.SurfaceTransparency = 0.9
        SelectionBox.Adornee = Part
        SelectionBox.Parent = Part
        local CurrentCamera = Workspace.CurrentCamera
        local Mouse = Players.LocalPlayer:GetMouse()
        local Highlight = Instance.new("Highlight")
        Highlight.OutlineColor = Color3.fromRGB(19, 157, 255)
        Highlight.FillColor = Color3.fromRGB(65, 157, 255)
        Highlight.OutlineTransparency = 0
        Highlight.FillTransparency = 0.65
        Highlight.Adornee = v2
        Highlight.Parent = v2
        for k, v in pairs(v2:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.CanQuery = false
            end
        end
        Model.Parent = Workspace
        local u90 = nil
        u110 = UserInputService.InputBegan:Connect(function(a1) -- Line: 124 -- upvalues: u115 (upval), Signals (upval), u90 (ref), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            local v1 = tick() - u115
            if v1 < 10 then
                return Signals.Toast:Fire({type = "info", message = string.format("You must wait %d seconds before placing another blueprint.", (math.floor(10 - (tick() - u115))))})
            end
            u115 = tick()
            if not u90 then
                return
            end
            p1(u90)
        end)
        u111 = RunService.RenderStepped:Connect(function() -- Line: 149 -- upvalues: Mouse (val), CurrentCamera (val), CollectionService (upval), Part (val), Model (val), Workspace (upval), u19 (val), BoundingBox (val), u90 (ref)
            local Position_2, Position_3
            local unit = (Mouse.Hit.Position - CurrentCamera.CFrame.Position).unit
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Exclude
            local v2 = {}
            local Tagged = CollectionService:GetTagged("Character")
            v2[1] = Tagged
            v2[2] = Part
            v2[3] = Model
            v1.FilterDescendantsInstances = v2
            v2 = Workspace:Raycast(CurrentCamera.CFrame.Position, unit * 1000, v1)
            local Position = v2
            if Position then
                Position = v2.Position
            end
            local PrimaryPart = u19.PrimaryPart
            if not PrimaryPart then
                return
            end
            if not Position then
                Position = CurrentCamera.CFrame.Position + unit * 100
            end
            local v3 = Position + Vector3.new(0, 2, 0)
            local v4 = Vector3.new(0, -2000, 0)
            local v5 = Workspace:Raycast(v3, v4, v1)
            if not v5 then
                Position_2 = Position
            else
                Position_2 = v5.Position
            end
            local v6 = Position_2
            v3 = math.clamp(v6.X, PrimaryPart.Position.X - 10, PrimaryPart.Position.X + 10)
            v4 = math.clamp(v6.Y, PrimaryPart.Position.Y - 10, PrimaryPart.Position.Y + 10)
            local v7 = PrimaryPart.Position.Z - 10
            v6 = Vector3.new(v3, v4, (math.clamp(v6.Z, v7, PrimaryPart.Position.Z + 10)))
            v4 = v6 + Vector3.new(0, 2, 0)
            local v8 = Vector3.new(0, -2000, 0)
            v5 = Workspace:Raycast(v4, v8, v1)
            if not v5 then
                Position_3 = v6
            else
                Position_3 = v5.Position
                if not Position_3 then
                    Position_3 = v6
                end
            end
            v6 = Position_3
            local v9 = Vector3.new(PrimaryPart.Position.X, v6.Y + BoundingBox.Y / 2, PrimaryPart.Position.Z)
            v4 = v6 + Vector3.new(0, BoundingBox.Y / 2, 0)
            v3 = CFrame.new(v4, v9)
            Model:PivotTo(v3)
            u90 = v3
        end)
        u112 = Model
    end,
    unequipped = function() -- Line: 195 -- upvalues: u111 (ref), u112 (ref), u110 (ref)
        if u111 then
            u111:Disconnect()
            u111 = nil
        end
        if u112 then
            u112:Destroy()
            u112 = nil
        end
        if u110 then
            u110:Disconnect()
            u110 = nil
        end
    end,
    data = {
        description = "A blueprint for a building, which will be constructed when placed.",
        attributes = {"Building"},
        category = require(Types_2:WaitForChild("Item")).CATEGORIES.Building,
    },
}