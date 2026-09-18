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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Handles
--                               Dumped in 0.00200 seconds
--                          Bytecode version 9  |  23 functions

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
function u56.new(p1) -- Line: 23 -- upvalues: u56 (val), Maid (val), UserInputService (val), Workspace (val), GuiService (val), SupportLibrary (val)
    local v1 = setmetatable({}, u56)
    v1.Maid = Maid.new()
    local ScreenGui = Instance.new("ScreenGui")
    v1.Gui = ScreenGui
    ScreenGui.Name = "BTHandles"
    ScreenGui.IgnoreGuiInset = true
    v1.Maid.Gui = ScreenGui
    v1.IsMouseAvailable = UserInputService.MouseEnabled
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
function u56:CreateHandles(p2) -- Line: 56 -- upvalues: Maid (val), SupportLibrary (val)
    local v1
    self.Handles = {}
    local v2 = {}
    self.HandleStates = v2
    for i, v in ipairs(Enum.NormalId:GetEnumItems()) do
        local ImageButton = Instance.new("ImageButton")
        ImageButton.Name = v.Name
        ImageButton.Image = "rbxassetid://2347145012"
        ImageButton.ImageColor3 = p2.Color
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
        local u55 = Maid.new()
        self.Maid[v.Name] = u55
        u55.HoverStart = ImageButton.MouseEnter:Connect(function() -- Line: 89 -- upvalues: ImageButton (val)
            ImageButton.ImageTransparency = 0
        end)
        u55.HoverEnd = ImageButton.MouseLeave:Connect(function() -- Line: 92 -- upvalues: ImageButton (val)
            ImageButton.ImageTransparency = 0.33
        end)
        u55.DragStart = ImageButton.MouseButton1Down:Connect(function(p1, a2) -- Line: 97 -- upvalues: self (val), ImageButton (val), p2 (val), v (val), Maid (upval), u55 (val), SupportLibrary (upval)
            local u5 = self.HandleStates[ImageButton]
            local PlaneNormal = u5.PlaneNormal
            local HandleNormal = u5.HandleNormal
            local Position = u5.HandleCFrame.Position
            local Unit = (u5.HandleViewportPosition - u5.AdorneeViewportPosition).Unit
            local v1 = Vector2.new(p1, a2)
            local v2 = Unit:Dot(v1 - u5.AdorneeViewportPosition) * Unit
            v1 = v2 + u5.AdorneeViewportPosition
            v2 = self.Camera:ViewportPointToRay(v1.X, v1.Y)
            local v3 = (Position - v2.Origin):Dot(PlaneNormal)
            local v4 = v3 / v2.Direction:Dot(PlaneNormal) * v2.Direction
            local u53 = HandleNormal:Dot(v4 + v2.Origin - Position)
            if p2.OnDragStart then
                p2.OnDragStart()
            end
            local function ProcessDragChange(p1) -- Line: 122 -- upvalues: u5 (val), self (upval), Position (val), PlaneNormal (val), HandleNormal (val), u53 (val), p2 (upval), v (upval)
                local Unit = (u5.HandleViewportPosition - u5.AdorneeViewportPosition).Unit
                local v1 = u5.AdorneeViewportPosition - self.GuiInset
                local v2 = Unit:Dot(Vector2.new(p1.X, p1.Y) - v1) * Unit + v1
                local v3 = self.Camera:ScreenPointToRay(v2.X, v2.Y)
                local v4 = (Position - v3.Origin):Dot(PlaneNormal)
                local v5 = v4 / v3.Direction:Dot(PlaneNormal) * v3.Direction
                local v6 = HandleNormal:Dot(v5 + v3.Origin - Position)
                v5 = v6 - u53
                if p2.OnDrag then
                    p2.OnDrag(v, v5)
                end
            end
            local v5 = Maid.new()
            u55.Dragging = v5
            v5.Drag = SupportLibrary.AddUserInputListener("Changed", {"MouseMovement", "Touch"}, true, function(p1) -- Line: 151 -- upvalues: ProcessDragChange (val)
                ProcessDragChange(p1.Position)
            end)
            v5.InHandleDrag = ImageButton.MouseMoved:Connect(function(p1, p2) -- Line: 156 -- upvalues: self (upval), ProcessDragChange (val)
                local v1 = Vector2.new(p1, p2)
                ProcessDragChange(v1 - self.GuiInset)
            end)
            v5.DragEnd = SupportLibrary.AddUserInputListener("Ended", {"MouseButton1", "Touch"}, true, function(p1) -- Line: 162 -- upvalues: u55 (upval)
                u55.Dragging = nil
            end)
            function v5.Callback() -- Line: 167 -- upvalues: p2 (upval)
                coroutine.wrap(p2.OnDragEnd)()
            end
        end)
        u55.InHandleDragEnd = ImageButton.MouseButton1Up:Connect(function() -- Line: 174 -- upvalues: u55 (val)
            u55.Dragging = nil
        end)
        ImageButton.Parent = self.Gui
        self.Handles[v.Name] = ImageButton
    end
end
function u56:Hide() -- Line: 186
    if not self.Running then
        return self
    end
    self:Pause()
    self.Gui.Enabled = false
end
function u56:Pause() -- Line: 201
    self.Running = false
end
local function IsFirstPerson(p1) -- Line: 205
    local v1 = (p1.CFrame.p - p1.Focus.p).magnitude <= 0.6
    return v1
end
function u56:Resume() -- Line: 209 -- upvalues: RunService (val), Players (val), IsFirstPerson (val), SupportLibrary (val)
    if self.Running then
        return self
    end
    self.Running = true
    for k, v in pairs(self.Handles) do
        local u27 = Vector3.FromNormalId(k)
        coroutine.wrap(function() -- Line: 222 -- upvalues: self (val), v (val), u27 (val), RunService (upval)
            while self.Running do
                self:UpdateHandle(v, u27)
                RunService.RenderStepped:Wait()
            end
        end)()
    end
    if Players.LocalPlayer then
        coroutine.wrap(function() -- Line: 232 -- upvalues: self (val), IsFirstPerson (upval), Players (upval), SupportLibrary (upval)
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
function u56:SetAdornee(p2) -- Line: 250
    local v1
    self.Adornee = p2
    if not p2 then
        v1 = nil
    else
        v1 = p2:IsA("Model")
        if not v1 then
            v1 = nil
        end
    end
    self.IsAdorneeModel = v1
    if p2 then
        self:Resume()
        return self
    end
    self:Hide()
    return self
end
local function WorldToViewportPoint(p1, p2) -- Line: 269
    local v1, v2
    v1, v2 = p1:WorldToViewportPoint(p2)
    local Z = v1.Z
    v1 = Vector2.new(v1.X, v1.Y)
    if Z < 0 then
        v1 = p1.ViewportSize - v1
    end
    return v1, Z, v2
end
function u56.BlacklistObstacle(p1, p2) -- Line: 286 -- upvalues: SupportLibrary (val)
    if p2 then
        p1.ObstacleBlacklistIndex[p2] = true
        p1.ObstacleBlacklist = SupportLibrary.Keys(p1.ObstacleBlacklistIndex)
    end
end
function u56:UpdateHandle(p2, p3) -- Line: 293 -- upvalues: WorldToViewportPoint (val), Workspace (val)
    local LookVector, ModelCFrame, ModelSize, v1, v2, v3, v4, v5, v6, v7
    local Camera = self.Camera
    if not self.Adornee then
        p2.Visible = false
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
    local magnitude = (ModelSize * p3 / 2).magnitude
    local v8 = ModelCFrame * CFrame.new(magnitude * p3)
    v6, v7 = WorldToViewportPoint(Camera, v8.p)
    local v9 = math.max(1, math.tan(math.rad(Camera.FieldOfView) / 2) * 2 * v7 / Camera.ViewportSize.X * 14)
    if not self.IsMouseAvailable then
        v1 = 1.6
    else
        v1 = 1
    end
    v1 = ModelCFrame * CFrame.new((magnitude + 2 * (v9 * v1)) * p3)
    local unit = (v1.p - ModelCFrame.p).unit
    v2, v3, v4 = WorldToViewportPoint(Camera, v1.p)
    p2.Visible = v4
    local v10 = math.max(12, 0.5 * (Camera.ViewportSize.X / (math.tan(math.rad(Camera.FieldOfView) / 2) * 2 * v3)))
    if not self.IsMouseAvailable then
        v5 = 1.6
    else
        v5 = 1
    end
    local v11 = v10 * v5
    p2.Size = UDim2.new(0, v11, 0, v11)
    p2.Position = UDim2.new(0, v2.X, 0, v2.Y)
    if p2.Name == "Top" then
        LookVector = ModelCFrame.LookVector
        if not LookVector then
            LookVector = ModelCFrame.UpVector
        end
    elseif p2.Name ~= "Bottom" then
    end
    v5 = self.HandleStates[p2]
    if not v5 then
        v5 = {}
    end
    self.HandleStates[p2] = v5
    v5.PlaneNormal = LookVector
    v5.HandleCFrame = v1
    v5.HandleNormal = unit
    v5.AdorneeViewportPosition = v6
    v5.HandleViewportPosition = v2
    local v12 = Camera:ViewportPointToRay(v2.X, v2.Y)
    local v13 = Ray.new(v12.Origin, v12.Direction * (v3 - 0.25))
    local v14 = Workspace:FindPartOnRayWithIgnoreList(v13, self.ObstacleBlacklist)
    if v14 then
        p2.ImageTransparency = 1
        return
    end
    if p2.ImageTransparency == 1 then
        p2.ImageTransparency = 0.33
    end
end
function u56:Destroy() -- Line: 365
    self.Running = nil
    self.Maid:Destroy()
end
return u56