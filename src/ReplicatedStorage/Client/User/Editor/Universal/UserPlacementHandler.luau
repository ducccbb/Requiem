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
--       File: ReplicatedStorage.Client.User.Editor.Universal.UserPlacementHandler
--                               Dumped in 0.00252 seconds
--                          Bytecode version 9  |  23 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local Wireframe = require(Utilities_3:WaitForChild("Wireframe"))
local v2 = {snapping = 1}
local v3 = {
    translucent = false,
    invisible = false,
    highlighted = true,
    collisions = false,
    lookat = false,
}
local v4 = {enabled = false, shape = "Box", scale = false, direction = false}
v3.wireframe = v4
local u120 = NumberRange.new(100, 3000)
local u121 = {user = Table.copy(v2), prop = Table.copy(v3)}
local u129 = trove.new()
local u131 = Signal.new()
local u132 = nil
local u133 = true
local function hasHingeDescendant(p1) -- Line: 222
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            if j.Name ~= "Hinge" and j.Name ~= "Hinge1" and j.Name ~= "Hinge2" then
                continue
            end
            return true
        end
    end
    return false
end
local function removeDoorChildrenFromPlacementModel(p1) -- Line: 233 -- upvalues: hasHingeDescendant (val)
    local v1
    local v2 = {}
    for i, j in p1:GetChildren() do
        if j:IsA("Model") then
            v1 = string.lower(j.Name)
            if j.Name == "Door" then
                table.insert(v2, j)
            elseif not (string.find(v1, "door")) and hasHingeDescendant(j) then
                table.insert(v2, j)
            end
        end
    end
    local v3 = v2
    local v4 = nil
    local v5 = nil
    for k, n in v3, v4, v5 do
        n:Destroy()
    end
end
local function createPlacementModel(p1) -- Line: 253 -- upvalues: removeDoorChildrenFromPlacementModel (val), u121 (val), Wireframe (val)
    local v1 = p1:Clone()
    removeDoorChildrenFromPlacementModel(v1)
    local v2 = {}
    local Folder = Instance.new("Folder")
    Folder.Parent = v1
    for i, j in v1:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
            j.Anchored = true
            j.Parent = Folder
        end
    end
    if u121.prop.wireframe.enabled then
        local v3, v4
        v3, v4 = Wireframe.createWireframeModelFromReference(p1, u121.prop.wireframe.shape, u121.prop.wireframe.direction)
        v3.Parent = v1
        v2 = v4
    end
    if u121.prop.translucent then
        for k, n in v1:GetDescendants() do
            if n:IsA("BasePart") then
                if u121.prop.invisible then
                    n.Transparency = 1
                elseif 1 > n.Transparency then
                    n.Transparency = 0.8
                else
                    n.Transparency = 1
                end
            end
        end
    elseif not u121.prop.invisible then
    end
    if u121.prop.highlighted then
        local Highlight = Instance.new("Highlight")
        Highlight.OutlineColor = Color3.fromRGB(25, 153, 255)
        Highlight.OutlineTransparency = 0
        Highlight.FillTransparency = 1
        Highlight.Adornee = v1
        Highlight.Parent = v1
    end
    if u121.prop.invisible then
        Folder:Destroy()
    end
    v1.Name = "ACTIVE_PLACEMENT_MODEL"
    v1.Parent = workspace
    return v1, v2
end
local function getTransformation(p1, p2, p3) -- Line: 339
    if p2 == 0 then
        return CFrame.new(p1) * p3
    end
    local v1 = math.round(p1.X / p2) * p2
    return CFrame.new((Vector3.new(v1, p1.Y, math.round(p1.Z / p2) * p2))) * p3
end
return {
    onBeginModelPlacement = function(p1, p2) -- Line: 381 -- upvalues: u129 (val), createPlacementModel (val), Signal (val), RunService (val), UserInputService (val), CollectionService (val), getTransformation (val), u121 (val), u120 (val), Players (val), u133 (ref), u131 (val), u132 (ref)
        local u10, u11, v1, v2
        u129:Clean()
        local CurrentCamera = workspace.CurrentCamera
        u10, u11 = createPlacementModel(p1)
        local u12 = 0
        local u15 = Signal.new()
        local u16 = false
        v2 = RunService.RenderStepped:Connect(function() -- Line: 393 -- upvalues: UserInputService (upval), CurrentCamera (val), u10 (val), CollectionService (upval), p1 (val), u12 (ref), p2 (val), getTransformation (upval), u121 (upval), u11 (val), u120 (upval)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
            local v2 = RaycastParams.new()
            v2.FilterDescendantsInstances = {u10, CollectionService:GetTagged("Alive")}
            v2.FilterType = Enum.RaycastFilterType.Exclude
            local v3 = v1.Direction * 10000
            local v4 = workspace:Raycast(v1.Origin, v3, v2)
            if v4 then
                local BoundingBox, BoundingBox_2, v5
                BoundingBox, BoundingBox_2 = u10:GetBoundingBox()
                v3 = BoundingBox.Position.Y - BoundingBox_2.Y / 2
                local Attribute = p1:GetAttribute("offset")
                if not Attribute then
                    Attribute = Vector3.new(0, 0, 0)
                end
                local v6 = v4.Position + Vector3.new(0, u10:GetPivot().Position.Y - v3, 0)
                local v7 = math.rad((math.round(u12)))
                local v8 = CFrame.Angles(0, v7, 0)
                if not p2 then
                    v5 = getTransformation(v6, u121.user.snapping, v8)
                else
                    v7 = CFrame.new(v6) * v8
                    v5 = p2(v7, u10)
                end
                if not u121.prop.lookat then
                    u10:PivotTo(v5 * CFrame.new(Attribute))
                else
                    local Position = CurrentCamera.CFrame.Position
                    local v9 = Vector3.new(Position.X, v5.Position.Y, Position.Z)
                    local v10 = CFrame.new(v5.Position, v9) * v8
                    u10:PivotTo(v10 * CFrame.new(Attribute))
                end
            end
            if u11 then
                local v11 = #u11
                if 0 < v11 and u121.prop.wireframe.scale then
                    v3 = (CurrentCamera.CFrame.Position - u10:GetPivot().Position).Magnitude - u120.Min
                    v3 = math.clamp(0.025 + v3 / (u120.Max - u120.Min) * 4.975, 0.025, 5)
                    local v12 = u11
                    local v13 = nil
                    local v14 = nil
                    for i, j in v12, v13, v14 do
                        j.Width0 = v3
                        j.Width1 = v3
                    end
                end
            end
        end)
        local function onHandleZRotation() -- Line: 464 -- upvalues: u16 (ref), UserInputService (upval), u12 (ref), u129 (upval)
            u16 = true
            local u2 = nil
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
            local u11 = UserInputService.InputChanged:Connect(function(p1) -- Line: 476 -- upvalues: u12 (upval)
                if p1.UserInputType ~= Enum.UserInputType.MouseMovement then
                    return
                end
                u12 = u12 + p1.Delta.X * UserSettings():GetService("UserGameSettings").MouseSensitivity * 0.7
            end)
            u2 = UserInputService.InputEnded:Connect(function(p1) -- Line: 488 -- upvalues: u16 (upval), u2 (ref), u11 (ref), UserInputService (upval)
                if p1.KeyCode ~= Enum.KeyCode.Z then
                    return
                end
                u16 = false
                u2:Disconnect()
                u11:Disconnect()
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end)
            u129:Add(u2)
            u129:Add(u11)
            u129:Add(function() -- Line: 506 -- upvalues: UserInputService (upval)
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end)
        end
        v1 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 512 -- upvalues: Players (upval), u133 (upval), u131 (upval), u10 (val), u15 (val), u12 (ref), u16 (ref), onHandleZRotation (val)
            if p2 then
                return
            end
            local v1 = Players.LocalPlayer.PlayerGui:GetGuiObjectsAtPosition(p1.Position.X, p1.Position.Y)
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.Visible and j:GetAttribute("no_click") then
                    return
                end
            end
            if p1.UserInputType == Enum.UserInputType.MouseButton1 and u133 then
                u131:Fire(u10)
                u15:Fire(u10)
            end
            if p1.KeyCode == Enum.KeyCode.R then
                u12 = u12 + 90
                return
            end
            if p1.KeyCode == Enum.KeyCode.Z and not u16 then
                onHandleZRotation()
            end
        end)
        u129:Add(v2)
        u129:Add(u10)
        u129:Add(v1)
        u129:Add(u15)
        u129:Add(function() -- Line: 553 -- upvalues: u132 (upval)
            u132 = nil
        end)
        u132 = u10
        return u15
    end,
    onEndModelPlacement = function() -- Line: 565 -- upvalues: u129 (val)
        u129:Clean()
    end,
    getModelFromAssets = function(p1) -- Line: 204 -- upvalues: ReplicatedStorage (val)
        local Assets = ReplicatedStorage:WaitForChild("Assets")
        local v1 = string.split(p1, "/")
        local v2 = Assets
        local v3 = v1
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if not v2 then
                return nil, false
            end
            v2 = v2:FindFirstChild(j)
        end
        v4 = v2 == Assets
        return v2, v4
    end,
    setSettings = function(p1) -- Line: 160 -- upvalues: u121 (val)
        u121.user = u121.user
        u121.prop = u121.prop
    end,
    setPropSettings = function(p1) -- Line: 169 -- upvalues: u121 (val)
        u121.prop = p1
    end,
    setWireframeSettings = function(p1) -- Line: 177 -- upvalues: u121 (val)
        u121.prop.wireframe = p1
    end,
    setUserSettings = function(p1) -- Line: 185 -- upvalues: u121 (val)
        u121.user = p1
    end,
    setSnapping = function(p1) -- Line: 193 -- upvalues: u121 (val)
        u121.user.snapping = p1
    end,
    onSuccessfulPlacement = function() -- Line: 572 -- upvalues: u132 (ref), u121 (val), TweenService (val), u129 (val)
        if not u132 or u121.prop.invisible then
            return
        end
        local Highlight = Instance.new("Highlight")
        Highlight.OutlineTransparency = 1
        Highlight.FillTransparency = 1
        Highlight.FillColor = Color3.fromRGB(4, 163, 255)
        Highlight.Parent = u132
        Highlight.Adornee = u132
        local v1 = TweenInfo.new(0.1)
        local v2 = TweenService:Create(Highlight, v1, {FillTransparency = 0.25, FillColor = Color3.fromRGB(255, 255, 255)})
        v2:Play()
        v2.Completed:Connect(function() -- Line: 595 -- upvalues: TweenService (upval), Highlight (val)
            local v1 = TweenInfo.new(0.2)
            TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
            task.wait(0.2)
            Highlight:Destroy()
        end)
        u129:Add(Highlight)
        u129:Add(v2)
    end,
    setIsValidPlacement = function(p1) -- Line: 355 -- upvalues: u133 (ref), u132 (ref)
        local v1
        if u133 == p1 then
            v1 = p1
        else
            local Highlight = u132
            if Highlight then
                Highlight = u132:FindFirstChild("Highlight")
            end
            if Highlight then
                local v2
                if not p1 then
                    v2 = Color3.fromRGB(255, 77, 77)
                else
                    v2 = Color3.fromRGB(25, 153, 255)
                    if not v2 then
                        v2 = Color3.fromRGB(255, 77, 77)
                    end
                end
                Highlight.OutlineColor = v2
                v1 = p1
            elseif not u132 then
                v1 = p1
            else
                local Attribute, new, v3
                v1 = p1
                for i, j in u132:GetDescendants() do
                    if j:IsA("Beam") and j:GetAttribute("color") then
                        Attribute = j:GetAttribute("color")
                        new = ColorSequence.new
                        if not v1 then
                            v3 = Color3.fromRGB(255, 77, 77)
                        else
                            v3 = Attribute
                        end
                        j.Color = new(v3)
                    end
                end
            end
        end
        u133 = v1
    end,
    Placed = u131,
    Presets = {
        Default = v3,
        WireframeLookAt = {
            translucent = false,
            invisible = false,
            highlighted = false,
            collisions = false,
            lookat = true,
            wireframe = {enabled = true, shape = "Box", direction = true, scale = true},
        },
        WireframeBox = {
            translucent = false,
            invisible = false,
            highlighted = false,
            collisions = false,
            lookat = false,
            wireframe = {enabled = true, shape = "Box", direction = true, scale = true},
        },
        WireframeSphere = {
            translucent = false,
            invisible = true,
            highlighted = false,
            collisions = false,
            lookat = false,
            wireframe = {enabled = true, shape = "Sphere", direction = true, scale = true},
        },
    },
}