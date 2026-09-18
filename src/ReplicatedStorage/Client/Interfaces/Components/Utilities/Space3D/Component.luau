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
--   File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Space3D.Component
--                               Dumped in 0.00233 seconds
--                          Bytecode version 9  |  18 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
require(script.Parent.Types)
local u21 = {}
u21.__index = u21
local function pivot(p1, p2, p3) -- Line: 19
    local v1 = p1:Inverse() * p2 * p3
    return v1 * p2:Inverse() * p1
end
local function getCenterPosition(p1) -- Line: 23
    local AnchorPoint = p1.AnchorPoint
    local Position = p1.Position
    local Size = p1.Size
    return UDim2.new(Position.X.Scale + (0.5 - AnchorPoint.X) * Size.X.Scale, Position.X.Offset + (0.5 - AnchorPoint.X) * Size.X.Offset, Position.Y.Scale + (0.5 - AnchorPoint.Y) * Size.Y.Scale, Position.Y.Offset + (0.5 - AnchorPoint.Y) * Size.Y.Offset)
end
function u21.new(p1, p2) -- Line: 36 -- upvalues: u21 (val)
    local v1 = setmetatable({
        enabled = false,
        _compatibility = false,
        component2D = p1,
        screen = p2,
        offset = CFrame.new(),
        viewportSize = p2:GetIntendedCanvasSize(),
        lastValidViewportSize = p2:GetIntendedCanvasSize(),
    }, u21)
    v1.viewportSize = v1:GetViewportSize()
    if p1.Parent and p1.Parent:IsA("GuiObject") then
        v1.parent2D = p1.Parent
    end
    return v1
end
function u21.EnableCompatibility(p1) -- Line: 63 -- upvalues: u21 (val)
    if p1._compatibility then
        return p1:Enable()
    end
    if not p1.parent2D then
        warn("[Space3D] Compatibility mode requires a GuiObject parent. Using standard enable.")
        return p1:Enable()
    end
    p1._compatibility = true
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    Frame.Name = "Space3DCompat"
    Frame_2.Name = "Space3DCompat"
    Frame.Parent = p1.parent2D
    Frame_2.Parent = Frame
    Frame.BackgroundTransparency = 1
    Frame_2.BackgroundTransparency = 1
    local v1 = u21.new(Frame, p1.screen)
    local v2 = u21.new(Frame_2, p1.screen)
    p1.screen.partIndex[Frame] = v1
    p1.screen.partIndex[Frame_2] = v2
    p1.compatibilityRoot = Frame
    p1.compatibilityParent3D = p1.parent3D
    p1.compatibilityParent2D = p1.parent2D
    p1.parent2D = Frame_2
    p1.parent3D = v2
    return p1:Enable()
end
function u21:Enable() -- Line: 103 -- upvalues: RunService (val)
    if self.enabled or not self.component2D then
        return self
    end
    self.enabled = true
    local SurfaceGui = Instance.new("SurfaceGui")
    local Part = Instance.new("Part")
    Part.Name = "Space3DAdornee"
    Part.CanCollide = false
    Part.Anchored = true
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Transparency = 1
    Part.Parent = workspace
    local parent2D = self.parent2D
    if not parent2D then
        parent2D = self.screen.rootGui
    end
    SurfaceGui.Parent = parent2D
    SurfaceGui.Face = Enum.NormalId.Back
    SurfaceGui.Adornee = Part
    SurfaceGui.AlwaysOnTop = true
    self.surfaceGui = SurfaceGui
    self.surfacePart = Part
    self.component2D.Visible = true
    self.component2D.Parent = SurfaceGui
    local HttpService = game:GetService("HttpService")
    local u37 = HttpService:GenerateGUID(false)
    self.conn = u37
    RunService:BindToRenderStep(u37, Enum.RenderPriority.Last.Value + 2, function() -- Line: 134 -- upvalues: self (val), u37 (val), RunService (upval), SurfaceGui (val)
        local compatibilityParent2D
        if self.conn ~= u37 or not self.surfaceGui or not self.surfacePart then
            RunService:UnbindFromRenderStep(u37)
            return
        end
        local SafeViewportSize = self:GetSafeViewportSize()
        if self._compatibility and self.parent2D and self.parent3D and self.parent3D.component2D and self.compatibilityParent2D then
            compatibilityParent2D = self.compatibilityParent2D
            self.parent3D.component2D.AnchorPoint = self.component2D.AnchorPoint
            self.parent3D.component2D.Position = self.component2D.Position
            self.parent2D.Position = UDim2.fromOffset(-self.component2D.AbsolutePosition.X, -self.component2D.AbsolutePosition.Y)
            self.parent2D.Size = UDim2.fromOffset(compatibilityParent2D.AbsoluteSize.X, compatibilityParent2D.AbsoluteSize.Y)
            self.parent3D.component2D.Size = UDim2.fromOffset(self.component2D.AbsoluteSize.X, self.component2D.AbsoluteSize.Y)
        end
        self.viewportSize = SafeViewportSize
        SurfaceGui.CanvasSize = SafeViewportSize
        self.surfacePart.Size = self:GetStudsScreenSize(SafeViewportSize)
        self.surfacePart.CFrame = self:ReadWorldCFrame()
    end)
    return self
end
function u21.Disable(p1) -- Line: 170 -- upvalues: RunService (val)
    local conn, rootGui
    if not p1.enabled then
        return p1
    end
    p1.enabled = false
    if p1.conn then
        RunService:UnbindFromRenderStep(p1.conn)
        p1.conn = nil
    end
    if p1.component2D then
        p1.component2D.Visible = false
        if not p1._compatibility then
            rootGui = p1.screen.rootGui
            if p1.parent2D and p1.parent2D.Parent ~= nil then
                local v1, v2
                v1, v2 = pcall(function() -- Line: 200 -- upvalues: p1 (val)
                    return p1.parent2D:IsDescendantOf(p1.screen.rootGui)
                end)
                if v1 and v2 then
                    rootGui = p1.parent2D
                end
            end
            pcall(function() -- Line: 208 -- upvalues: p1 (val), rootGui (ref)
                p1.component2D.Parent = rootGui
            end)
        else
            local compatibilityParent2D = p1.compatibilityParent2D
            if not compatibilityParent2D then
                compatibilityParent2D = p1.screen.rootGui
            end
            pcall(function() -- Line: 187 -- upvalues: p1 (val), compatibilityParent2D (val)
                p1.component2D.Parent = compatibilityParent2D
            end)
            if p1.compatibilityRoot then
                p1.compatibilityRoot:Destroy()
                p1.compatibilityRoot = nil
            end
            p1.parent2D = p1.compatibilityParent2D
            p1.parent3D = p1.compatibilityParent3D
            p1._compatibility = false
        end
    end
    rootGui = p1.surfacePart
    if rootGui then
        p1.surfacePart:Destroy()
        p1.surfacePart = nil
    end
    rootGui = p1.surfaceGui
    if rootGui then
        p1.surfaceGui:Destroy()
        p1.surfaceGui = nil
    end
    return p1
end
function u21:GetViewportSize() -- Line: 227
    if not self.parent3D then
        return self.screen:GetIntendedCanvasSize()
    end
    if self.parent3D.component2D then
        return self.parent3D.component2D.AbsoluteSize
    end
    return self.screen:GetIntendedCanvasSize()
end
function u21:GetSafeViewportSize() -- Line: 235
    local ViewportSize = self:GetViewportSize()
    if 8 > ViewportSize.X or 8 > ViewportSize.Y then
        return self.lastValidViewportSize
    end
    self.lastValidViewportSize = ViewportSize
    return ViewportSize
end
function u21:UDim2ToCFrame(p2) -- Line: 245
    if not self.component2D then
        return CFrame.new()
    end
    local SafeViewportSize = self:GetSafeViewportSize()
    if SafeViewportSize.X < 1 or SafeViewportSize.Y < 1 then
        return CFrame.new()
    end
    local StudsScreenSize = self:GetStudsScreenSize(SafeViewportSize)
    return CFrame.new(StudsScreenSize.X * (p2.X.Scale + p2.X.Offset / SafeViewportSize.X - 0.5), -StudsScreenSize.Y * (p2.Y.Scale + p2.Y.Offset / SafeViewportSize.Y - 0.5), 0)
end
function u21:GetStudsScreenSize(p2) -- Line: 262
    local RealCanvasSize = self.screen:GetRealCanvasSize()
    local FieldOfView = workspace.CurrentCamera.FieldOfView
    local v1 = RealCanvasSize.X / RealCanvasSize.Y * math.tan(math.rad(FieldOfView) / 2)
    local v2 = v1 * (p2.X / RealCanvasSize.X)
    local v3 = math.tan(math.rad(FieldOfView) / 2)
    local v4 = Vector3.new(v2, v3 * (p2.Y / RealCanvasSize.Y), 0)
    return v4 * self.screen.displayDistance
end
function u21:RecomputeParent() -- Line: 274
    if self.parent2D and self.parent2D:IsA("GuiObject") then
        self.parent3D = self.screen:GetComponent(self.parent2D)
    end
    if self.surfaceGui then
        local parent3D = self.parent3D
        local v1 = 0
        while parent3D do
            v1 = v1 + 1
            parent3D = parent3D.parent3D
        end
        self.surfaceGui.ZOffset = v1
    end
    return self
end
function u21:GetCompatibilityPosition() -- Line: 294
    if self.enabled or not self.component2D or not self.parent3D or not self.parent3D.component2D then
        return UDim2.new(0, 0, 0, 0)
    end
    local v1 = self.component2D.AbsolutePosition - self.parent3D.component2D.AbsolutePosition
    return UDim2.fromOffset(v1.X, v1.Y)
end
function u21:ReadWorldCFrame() -- Line: 303 -- upvalues: getCenterPosition (val), pivot (val)
    local v1, v2, v3
    if not self.component2D then
        return CFrame.new()
    end
    self:RecomputeParent()
    local v4 = self:UDim2ToCFrame(UDim2.fromScale(1, 1))
    if not self.parent3D then
        local Position_2
        local RealCanvasSize = self.screen:GetRealCanvasSize()
        local v5 = RealCanvasSize - self.screen:GetIntendedCanvasSize()
        v3 = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -self.screen.displayDistance / 2)
        v1 = v3 * self.screen.rootOffset
        local v6 = v5.X / 2
        v3 = self:UDim2ToCFrame((UDim2.new(0, v6, 0, v5.Y / 2)))
        v2 = v3 * self:UDim2ToCFrame(UDim2.fromScale(1, 1))
        v5 = v1 * v2
        if not self.enabled then
            Position_2 = self.component2D.Position
        else
            Position_2 = getCenterPosition(self.component2D)
        end
        if not self.enabled and self.parent3D and self.parent3D.component2D and not self.parent3D.enabled then
            Position_2 = self:GetCompatibilityPosition()
        end
        local v7 = v5 * v4:Inverse()
        return v5 * pivot(v5, v7 * self:UDim2ToCFrame(Position_2) * v4, self.offset)
    elseif not self.parent3D.component2D then
        return CFrame.new()
    else
        if not self.parent2D then
            return CFrame.new()
        end
        local AnchorPoint = self.parent3D.component2D.AnchorPoint
        v1 = self.parent3D:ReadWorldCFrame()
        local Position = self.parent3D.component2D.Position
        v3 = self:UDim2ToCFrame(UDim2.fromScale(-AnchorPoint.X + 0.5, -AnchorPoint.Y + 0.5))
        if not self.parent3D.enabled and self.parent3D.parent3D and self.parent3D.parent3D.component2D then
            Position = self.parent3D:GetCompatibilityPosition()
            v3 = CFrame.new()
        end
        local v8 = self.parent3D:UDim2ToCFrame(Position) * v4 * v3
        v2 = v8 * CFrame.Angles(0, 0, -math.rad(self.parent2D.Rotation))
    end
end
return u21