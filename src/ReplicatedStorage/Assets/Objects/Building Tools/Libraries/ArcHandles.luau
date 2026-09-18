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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.ArcHandles
--                               Dumped in 0.00244 seconds
--                          Bytecode version 9  |  27 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Maid = require(v1.Parent:WaitForChild("Maid"))
local SupportLibrary = require(v1.Parent:WaitForChild("SupportLibrary"))
local u56 = {}
u56.__index = u56
u56.SideToAxis = {
    Top = "Z",
    Bottom = "Z",
    Left = "Y",
    Right = "Y",
    Front = "X",
    Back = "X",
}
u56.AxisToSide = {X = "Front", Y = "Right", Z = "Top"}
u56.AxisColors = {X = Color3.new(1, 0, 0), Y = Color3.new(0, 1, 0), Z = Color3.new(0, 0, 1)}
u56.CircleSlices = 60
function u56.new(p1) -- Line: 48 -- upvalues: u56 (val), Maid (val), UserInputService (val), Workspace (val), GuiService (val), SupportLibrary (val)
    local v1 = setmetatable({}, u56)
    v1.Maid = Maid.new()
    local ScreenGui = Instance.new("ScreenGui")
    v1.Gui = ScreenGui
    ScreenGui.Name = "BTArcHandles"
    ScreenGui.IgnoreGuiInset = true
    v1.Maid.Gui = ScreenGui
    v1.IsMouseAvailable = UserInputService.MouseEnabled
    v1:CreateCircles()
    v1:CreateHandles(p1)
    v1.Camera = Workspace.CurrentCamera
    v1.GuiInset = GuiService:GetGuiInset()
    local ObstacleBlacklist = p1.ObstacleBlacklist
    if not ObstacleBlacklist then
        ObstacleBlacklist = {}
    end
    v1.ObstacleBlacklistIndex = SupportLibrary.FlipTable(ObstacleBlacklist)
    v1.ObstacleBlacklist = SupportLibrary.Keys(v1.ObstacleBlacklistIndex)
    v1:SetAdornee(p1.Adornee)
    v1.Gui.Parent = p1.Parent
    return v1
end
function u56:CreateCircles() -- Line: 82
    local CircleSlices, CylinderHandleAdornment, v1, v2, v3
    local Folder = Instance.new("Folder")
    Folder.Name = "AxisCircles"
    Folder.Parent = self.Gui
    local v4 = {}
    self.AxisCircles = v4
    local v5 = 2 * math.pi
    local v6 = self
    for i, v in ipairs(Enum.Axis:GetEnumItems()) do
        v1 = Instance.new("Folder", Folder)
        v1.Name = v.Name
        v2 = {}
        v4[v.Name] = v2
        CircleSlices = v6.CircleSlices
        v3 = 1
        for i2 = 1, CircleSlices, v3 do
            CylinderHandleAdornment = Instance.new("CylinderHandleAdornment")
            CylinderHandleAdornment.Transparency = 0.4
            CylinderHandleAdornment.Color3 = v6.AxisColors[v.Name]
            CylinderHandleAdornment.Radius = 0
            CylinderHandleAdornment.Height = 0
            CylinderHandleAdornment.Parent = v1
            v2[i2] = CylinderHandleAdornment
        end
    end
end
function u56:CreateHandles(p2) -- Line: 118 -- upvalues: Maid (val), SupportLibrary (val)
    local v1, v2
    local Folder = Instance.new("Folder")
    Folder.Name = "Handles"
    Folder.Parent = self.Gui
    self.Handles = {}
    local v3 = {}
    self.HandleStates = v3
    for i, v in ipairs(Enum.NormalId:GetEnumItems()) do
        local u27 = self.SideToAxis[v.Name]
        v2 = self.AxisColors[u27]
        local ImageButton = Instance.new("ImageButton")
        ImageButton.Name = v.Name
        ImageButton.Image = "rbxassetid://2347145012"
        ImageButton.ImageColor3 = v2
        ImageButton.ImageTransparency = 0.33
        ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageButton.BackgroundTransparency = 1
        ImageButton.BorderSizePixel = 0
        ImageButton.ZIndex = 1
        ImageButton.Visible = false
        v1 = ImageButton:Clone()
        v1.Active = false
        v1.Size = UDim2.new(0, 4, 0, 4)
        v1.Position = UDim2.new(0.5, 0, 0.5, 0)
        v1.Visible = true
        v1.Parent = ImageButton
        v1.ZIndex = 0
        local u64 = Maid.new()
        self.Maid[v.Name] = u64
        u64.HoverStart = ImageButton.MouseEnter:Connect(function() -- Line: 160 -- upvalues: ImageButton (val), self (val), u27 (val)
            ImageButton.ImageTransparency = 0
            self:SetCircleTransparency(u27, 0)
        end)
        u64.HoverEnd = ImageButton.MouseLeave:Connect(function() -- Line: 164 -- upvalues: ImageButton (val), self (val), u27 (val)
            ImageButton.ImageTransparency = 0.33
            self:SetCircleTransparency(u27, 0.4)
        end)
        u64.DragStart = ImageButton.MouseButton1Down:Connect(function(p1, a2) -- Line: 170 -- upvalues: self (val), ImageButton (val), p2 (val), u27 (val), Maid (upval), u64 (val), SupportLibrary (upval)
            local PlaneNormal = self.HandleStates[ImageButton].PlaneNormal
            local HandleCFrame = self.HandleStates[ImageButton].HandleCFrame
            local AdorneeCFrame = self.HandleStates[ImageButton].AdorneeCFrame
            local v1 = self.Camera:ViewportPointToRay(p1, a2)
            local v2 = (HandleCFrame.p - v1.Origin):Dot(PlaneNormal)
            local v3 = v2 / v1.Direction:Dot(PlaneNormal) * v1.Direction
            local u44 = AdorneeCFrame:PointToObjectSpace(v3 + v1.Origin)
            if p2.OnDragStart then
                p2.OnDragStart()
            end
            local function ProcessDragChange(p1) -- Line: 186 -- upvalues: self (upval), HandleCFrame (val), PlaneNormal (val), AdorneeCFrame (val), u27 (upval), u44 (val), p2 (upval)
                local v1
                local v2 = self.Camera:ScreenPointToRay(p1.X, p1.Y)
                local v3 = (HandleCFrame.p - v2.Origin):Dot(PlaneNormal)
                local v4 = v3 / v2.Direction:Dot(PlaneNormal) * v2.Direction
                v4 = AdorneeCFrame:PointToObjectSpace(v4 + v2.Origin)
                local v5 = nil
                if u27 == "X" then
                    v1 = math.atan2(u44.Y, -u44.Z)
                    v5 = math.atan2(v4.Y, -v4.Z) - v1
                elseif u27 == "Y" then
                    v1 = math.atan2(u44.X, u44.Z)
                    v5 = math.atan2(v4.X, v4.Z) - v1
                elseif u27 == "Z" then
                    v1 = math.atan2(u44.X, u44.Y)
                    v5 = math.atan2(-v4.X, v4.Y) - v1
                end
                if p2.OnDrag then
                    p2.OnDrag(u27, v5)
                end
            end
            local v4 = Maid.new()
            u64.Dragging = v4
            v4.Drag = SupportLibrary.AddUserInputListener("Changed", {"MouseMovement", "Touch"}, true, function(p1) -- Line: 219 -- upvalues: ProcessDragChange (val)
                ProcessDragChange(p1.Position)
            end)
            v4.InHandleDrag = ImageButton.MouseMoved:Connect(function(p1, p2) -- Line: 224 -- upvalues: self (upval), ProcessDragChange (val)
                local v1 = Vector2.new(p1, p2)
                ProcessDragChange(v1 - self.GuiInset)
            end)
            v4.DragEnd = SupportLibrary.AddUserInputListener("Ended", {"MouseButton1", "Touch"}, true, function(p1) -- Line: 230 -- upvalues: u64 (upval)
                u64.Dragging = nil
            end)
            function v4.Callback() -- Line: 235 -- upvalues: p2 (upval)
                coroutine.wrap(p2.OnDragEnd)()
            end
        end)
        u64.InHandleDragEnd = ImageButton.MouseButton1Up:Connect(function() -- Line: 242 -- upvalues: u64 (val)
            u64.Dragging = nil
        end)
        ImageButton.Parent = Folder
        self.Handles[v.Name] = ImageButton
    end
end
function u56:Hide() -- Line: 254
    if not self.Running then
        return self
    end
    self:Pause()
    self.Gui.Enabled = false
end
function u56:Pause() -- Line: 269
    self.Running = false
end
local function IsFirstPerson(p1) -- Line: 273
    local v1 = (p1.CFrame.p - p1.Focus.p).magnitude <= 0.6
    return v1
end
function u56:Resume() -- Line: 277 -- upvalues: RunService (val), Players (val), IsFirstPerson (val), SupportLibrary (val)
    if self.Running then
        return self
    end
    self.Running = true
    for k, v in pairs(self.Handles) do
        coroutine.wrap(function() -- Line: 289 -- upvalues: self (val), k (val), v (val), RunService (upval)
            while self.Running do
                self:UpdateHandle(k, v)
                RunService.RenderStepped:Wait()
            end
        end)()
    end
    for k2, i in pairs(self.AxisCircles) do
        coroutine.wrap(function() -- Line: 299 -- upvalues: self (val), k2 (val), i (val), RunService (upval)
            while self.Running do
                self:UpdateCircle(k2, i)
                RunService.RenderStepped:Wait()
            end
        end)()
    end
    if Players.LocalPlayer then
        coroutine.wrap(function() -- Line: 309 -- upvalues: self (val), IsFirstPerson (upval), Players (upval), SupportLibrary (upval)
            local Character, v1, v2
            while self.Running do
                v1 = IsFirstPerson(self.Camera)
                Character = Players.LocalPlayer.Character
                if Character then
                    if not v1 then
                        v2 = nil
                    else
                        v2 = true
                    end
                    self.ObstacleBlacklistIndex[Character] = v2
                    self.ObstacleBlacklist = SupportLibrary.Keys(self.ObstacleBlacklistIndex)
                end
                wait(0.2)
            end
        end)()
    end
    self.Gui.Enabled = true
end
function u56:SetAdornee(p2) -- Line: 327
    local v1, v2, v3
    self.Adornee = p2
    if not p2 then
        v3 = nil
    else
        v3 = p2:IsA("Model")
    end
    self.IsAdorneeModel = v3
    v2, v1 = p2, self
    for k, v in pairs(self.AxisCircles) do
        for i, i2 in ipairs(v) do
            i2.Adornee = v2
        end
    end
    if v2 then
        v1:Resume()
        return v1
    end
    v1:Hide()
    return v1
end
function u56:SetCircleTransparency(p2, p3) -- Line: 353
    for i, v in ipairs(self.AxisCircles[p2]) do
        v.Transparency = p3
    end
end
local function WorldToViewportPoint(p1, p2) -- Line: 359
    local v1, v2
    v1, v2 = p1:WorldToViewportPoint(p2)
    local Z = v1.Z
    v1 = Vector2.new(v1.X, v1.Y)
    if Z < 0 then
        v1 = p1.ViewportSize - v1
    end
    return v1, Z, v2
end
function u56.BlacklistObstacle(p1, p2) -- Line: 376 -- upvalues: SupportLibrary (val)
    if p2 then
        p1.ObstacleBlacklistIndex[p2] = true
        p1.ObstacleBlacklist = SupportLibrary.Keys(p1.ObstacleBlacklistIndex)
    end
end
function u56:UpdateHandle(p2, p3) -- Line: 383 -- upvalues: WorldToViewportPoint (val), Workspace (val)
    local ModelCFrame, ModelSize, v1, v2, v3, v4, v5, v6
    local Camera = self.Camera
    if not self.Adornee then
        p3.Visible = false
        return
    end
    if not self.IsAdorneeModel then
        ModelCFrame = self.Adornee.CFrame
    else
        ModelCFrame = self.Adornee:GetModelCFrame()
    end
    if not self.IsAdorneeModel then
        ModelSize = self.Adornee.Size
    else
        ModelSize = self.Adornee:GetModelSize()
    end
    _, v6 = WorldToViewportPoint(Camera, ModelCFrame.p)
    local v7 = math.max(1, math.tan(math.rad(Camera.FieldOfView) / 2) * 2 * v6 / Camera.ViewportSize.X * 14)
    if not self.IsMouseAvailable then
        v1 = 1.6
    else
        v1 = 1
    end
    v1 = ModelSize.magnitude / 2 + 2 * (v7 * v1)
    local v8 = ModelCFrame * CFrame.new(v1 * Vector3.FromNormalId(p2))
    v2, v3, v4 = WorldToViewportPoint(Camera, v8.p)
    p3.Visible = v4
    local v9 = math.max(12, 0.5 * (Camera.ViewportSize.X / (math.tan(math.rad(Camera.FieldOfView) / 2) * 2 * v3)))
    if not self.IsMouseAvailable then
        v5 = 1.6
    else
        v5 = 1
    end
    local v10 = v9 * v5
    p3.Size = UDim2.new(0, v10, 0, v10)
    p3.Position = UDim2.new(0, v2.X, 0, v2.Y)
    v9 = self.HandleStates[p3]
    if not v9 then
        v9 = {}
    end
    self.HandleStates[p3] = v9
    v9.HandleCFrame = v8
    v9.PlaneNormal = (ModelCFrame * Vector3.FromAxis(self.SideToAxis[p2]) - ModelCFrame.p).unit
    v9.AdorneeCFrame = ModelCFrame
    v5 = Camera:ViewportPointToRay(v2.X, v2.Y)
    local v11 = Ray.new(v5.Origin, v5.Direction * (v3 - 0.25))
    local v12 = Workspace:FindPartOnRayWithIgnoreList(v11, self.ObstacleBlacklist)
    if v12 then
        p3.ImageTransparency = 1
        return
    end
    if p3.ImageTransparency == 1 then
        p3.ImageTransparency = 0.33
    end
end
function u56:UpdateCircle(p2, p3) -- Line: 450 -- upvalues: WorldToViewportPoint (val)
    local ModelCFrame, ModelSize, v1, v2, v3, v4, v5, v6, v7
    local Camera = self.Camera
    if not self.IsAdorneeModel then
        ModelCFrame = self.Adornee.CFrame
    else
        ModelCFrame = self.Adornee:GetModelCFrame()
    end
    if not self.IsAdorneeModel then
        ModelSize = self.Adornee.Size
    else
        ModelSize = self.Adornee:GetModelSize()
    end
    local v8 = Vector3.FromAxis(p2)
    local v9 = Vector3.FromNormalId(self.AxisToSide[p2])
    _, v7 = WorldToViewportPoint(Camera, ModelCFrame.p)
    local v10 = math.max(1, math.tan(math.rad(Camera.FieldOfView) / 2) * 2 * v7 / Camera.ViewportSize.X * 14)
    if not self.IsMouseAvailable then
        v1 = 1.6
    else
        v1 = 1
    end
    v1 = ModelSize.magnitude / 2 + 2 * (v10 * v1)
    local v11 = 2 * math.pi / #p3
    for i, v in ipairs(p3) do
        v3 = CFrame.fromAxisAngle(v8, v11 * (i - 1))
        v2 = v3 * (v9 * v1)
        v4 = CFrame.fromAxisAngle(v8, v11 * i)
        v3 = v4 * (v9 * v1)
        v4 = v2:Lerp(v3, 0.5)
        _, v5 = WorldToViewportPoint(Camera, ModelCFrame * v4)
        v.Radius = 1.5 * (math.tan(math.rad(Camera.FieldOfView) / 2) * 2 * v5 / Camera.ViewportSize.X) / 2
        v6 = CFrame.new(v4, v3)
        v.CFrame = v6 * CFrame.new(0, 0, v.Radius / 2)
        v.Height = (v3 - v2).magnitude
    end
end
function u56:Destroy() -- Line: 505
    self.Running = nil
    self.Maid:Destroy()
end
return u56