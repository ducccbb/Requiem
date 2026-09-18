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
--      File: ReplicatedStorage.Client.Interfaces.Components.Universal.Charts.Radar
--                               Dumped in 0.00226 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebounceState = require(Hooks:WaitForChild("useDebounceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTooltip = require(Hooks_3:WaitForChild("useTooltip"))
local u86 = Vector3.new(0, 0, 0)
local u88 = math.pi * 2
local function createWedgePart() -- Line: 41
    local WedgePart = Instance.new("WedgePart")
    WedgePart.Anchored = true
    WedgePart.CanCollide = false
    WedgePart.CastShadow = false
    WedgePart.TopSurface = Enum.SurfaceType.Smooth
    WedgePart.BottomSurface = Enum.SurfaceType.Smooth
    WedgePart.Material = Enum.Material.SmoothPlastic
    WedgePart.Transparency = 0
    return WedgePart
end
local function createLinePart() -- Line: 58
    local Part = Instance.new("Part")
    Part.Color = Color3.fromRGB(50, 50, 50)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Massless = true
    Part.CastShadow = false
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.BottomSurface = Enum.SurfaceType.Smooth
    Part.Material = Enum.Material.SmoothPlastic
    Part.Transparency = 0
    return Part
end
local function drawTriangle(p1, p2, p3, p4, p5, p6) -- Line: 82 -- upvalues: createWedgePart (val)
    local v1
    local v2 = p3[1]
    local v3 = p3[2]
    local v4 = p3[3]
    local v5 = v3 - v2
    local v6 = v4 - v2
    local v7 = v4 - v3
    local v8 = v5:Dot(v5)
    local v9 = v6:Dot(v6)
    local v10 = v7:Dot(v7)
    if v9 >= v8 then
        if v10 < v9 and v8 < v9 then
            v1 = v3
            v3 = v2
            v2 = v1
        end
    elseif v10 < v8 then
        v1 = v2
        v2 = v4
        v4 = v1
    end
    v5 = v3 - v2
    v6 = v4 - v2
    v7 = v4 - v3
    local Unit = v6:Cross(v5).Unit
    local Unit_2 = v7:Cross(Unit).Unit
    local Unit_3 = v7.Unit
    local v11 = math.abs((v5:Dot(Unit_2)))
    local v12 = createWedgePart()
    v12.Size = Vector3.new(0, v11, (math.abs((v5:Dot(Unit_3)))))
    local v13 = (v2 + v3) / 2
    v12.CFrame = CFrame.fromMatrix(v13, Unit, Unit_2, Unit_3)
    local v14 = createWedgePart()
    v14.Size = Vector3.new(0, v11, (math.abs((v6:Dot(Unit_3)))))
    local v15 = (v2 + v4) / 2
    v14.CFrame = CFrame.fromMatrix(v15, -Unit, Unit_2, -Unit_3)
    if p4 then
        v12.Size = v12.Size + p4
        v14.Size = v14.Size + p4
    end
    if p5 then
        v12.Position = v12.Position + p5
        v14.Position = v14.Position + p5
    end
    if p6 then
        v13 = p6
        v15 = nil
        local v16 = nil
        for i, j in v13, v15, v16 do
            v12[i] = j
            v14[i] = j
        end
    end
    table.insert(p2, v12)
    table.insert(p2, v14)
    v12.Parent = p1
    v14.Parent = p1
    return v12, v14
end
local function drawLine(p1, p2, p3, p4, p5) -- Line: 161 -- upvalues: createLinePart (val)
    local v1 = p3[1]
    local v2 = p3[2]
    local v3 = createLinePart()
    v3.Size = Vector3.new(0.85, 0.75, (v2 - v1).Magnitude)
    local v4 = (v1 + v2) / 2
    v3.CFrame = CFrame.new(v4, v2)
    if p4 then
        v3.Size = v3.Size + Vector3.new(p4, p4, p4)
    end
    if p5 then
        local v5 = p5
        v4 = nil
        local v6 = nil
        for i, j in v5, v4, v6 do
            v3[i] = j
        end
    end
    table.insert(p2, v3)
    v3.Parent = p1
    return v3
end
return function(p1) -- Line: 192 -- upvalues: react (val), useDebounceState (val), useTheme (val), useTooltip (val), u88 (val), u86 (val), drawTriangle (val), drawLine (val), Color (val)
    local u21, u22, u26, u27
    local u4 = react.useRef(nil)
    local u10 = react.useRef(Instance.new("Camera"))
    local v1 = {background = {}}
    local v2 = {}
    v1.chart = v2
    local u16 = react.useRef(v1)
    local v3 = {wait = 1, leading = true}
    u21, u22 = useDebounceState(Vector2.new(), v3)
    local u24 = useTheme()
    u26, u27 = useTooltip()
    local v4 = {u21, p1.Data, p1.Visible}
    local v5 = react.useMemo(function() -- Line: 308 -- upvalues: u21 (val), p1 (val), u88 (upval), react (upval), u26 (val), u27 (val)
        local v1, v2, v3, v4, v5, v6
        if u21.X == 0 or u21.Y == 0 then
            return {}
        end
        local v7 = {}
        local v8 = #p1.Data
        local Data = p1.Data
        local v9 = nil
        local v10 = nil
        for i, j in Data, v9, v10 do
            v4 = i * u88 / v8 + math.pi - u88 / v8
            v1 = math.sin(v4)
            v6 = Vector2.new(v1, (math.cos(v4)))
            v5 = v6 * (u21.X / 2)
            v6 = tostring(i)
            v2 = {Size = UDim2.fromOffset(10, 10), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.5, AnchorPoint = Vector2.new(0.5, 0.5)}
            v3 = math.round(v5.X)
            v2.Position = UDim2.new(0.5, v3, 0.5, (math.round(v5.Y)))
            v2[react.Event.MouseEnter] = function(...) -- Line: 328 -- upvalues: u26 (upval), j (val)
                local v1, v2
                if not j.tooltip then
                    v1 = "???"
                else
                    v1 = j.tooltip[1]
                end
                if not j.tooltip then
                    v2 = "Unknown description..."
                else
                    v2 = j.tooltip[2]
                    if not v2 then
                        v2 = "Unknown description..."
                    end
                end
                u26(v1, v2, ...)
            end
            v2[react.Event.MouseLeave] = function() -- Line: 336 -- upvalues: u27 (upval)
                u27()
            end
            v7[v6] = react.createElement("Frame", v2, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
        end
        return v7
    end, v4)
    react.useEffect(function() -- Line: 350 -- upvalues: u4 (val), u10 (val), u86 (upval)
        if not u4.current or not u10.current then
            return
        end
        local v1 = u86 + Vector3.new(0, 180, 0)
        local v2 = CFrame.new(v1, u86)
        u10.current.CFrame = v2 * CFrame.Angles(0, 0, math.pi / 2)
        u10.current.Parent = u4.current
        u4.current.LightDirection = -u10.current.CFrame.LookVector
        u4.current.CurrentCamera = u10.current
    end, {u4, u10})
    react.useEffect(function() -- Line: 257 -- upvalues: u4 (val), u16 (val), p1 (val), u88 (upval), u86 (upval), drawTriangle (upval), drawLine (upval)
        local color, v1, v2, v3, v4, v5, v6, v7, v8, value, value_2
        if not u4.current then
            return
        end
        local v9 = u16.current.chart
        local v10 = nil
        local v11 = nil
        for i, j in v9, v10, v11 do
            j:Destroy()
        end
        v10 = {}
        u16.current.chart = v10
        local chart = u16.current.chart
        if not p1.Visible then
            return
        end
        v9 = #p1.Data
        v10 = #p1.Data
        v11 = 1
        for k = 1, v10, v11 do
            value = p1.Data[k].value
            if not (p1.Data[k - 1]) then
                value_2 = p1.Data[#p1.Data].value
            else
                value_2 = p1.Data[k - 1].value
            end
            color = p1.Data[k].color
            if not color then
                color = Color3.fromRGB(0, 0, 0)
            end
            v7 = k * u88 / v9 + math.pi - u88 / v9
            v8 = v7 - u88 / v9
            v2 = math.sin(v8)
            v1 = Vector3.new(v2, 0, (math.cos(v8)))
            v3 = math.sin(v7)
            v2 = Vector3.new(v3, 0, (math.cos(v7)))
            v3 = u86 + v1 * 120 * math.min(1, value_2 / p1.Maximum)
            v4 = u86 + v2 * 120 * math.min(1, value / p1.Maximum)
            v5 = Vector3.new(0, 0, 0)
            v6 = Vector3.new(0, 1, 0)
            drawTriangle(u4.current, chart, {u86, v3, v4}, v5, v6, {Transparency = 0.5, Color = color})
            drawLine(u4.current, chart, {v3, v4}, 0.5, {Color = color})
        end
    end, {u4, u10, p1.Data, p1.Visible})
    local v6 = {}
    local v7 = #p1.Data
    v6[1] = u4
    v6[2] = u10
    v6[3] = v7
    v6[4] = p1.Visible
    react.useEffect(function() -- Line: 203 -- upvalues: u4 (val), u16 (val), u22 (val), p1 (val), u88 (upval), u86 (upval), drawTriangle (upval), u24 (val), drawLine (upval), Color (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        if not u4.current then
            return
        end
        local v12 = u16.current.background
        local v13 = nil
        local v14 = nil
        for i, j in v12, v13, v14 do
            j:Destroy()
        end
        v13 = {}
        u16.current.background = v13
        local background = u16.current.background
        u22(u4.current.AbsoluteSize)
        if not p1.Visible then
            return
        end
        v12 = #p1.Data
        v13 = v12
        v14 = 1
        for k = 1, v13, v14 do
            v7 = k * u88 / v12 + math.pi - u88 / v12
            v8 = v7 - u88 / v12
            v2 = math.sin(v8)
            v9 = u86 + Vector3.new(v2, 0, (math.cos(v8))) * 120
            v3 = math.sin(v7)
            v10 = u86 + Vector3.new(v3, 0, (math.cos(v7))) * 120
            v4 = Vector3.new(0, 0, 0)
            v5 = Vector3.new(0, 0, 0)
            drawTriangle(u4.current, background, {u86, v9, v10}, v4, v5, {Color = u24.PageBackground})
            drawLine(u4.current, background, {u86, v9}, 0.1, {Color = Color.Brighten(u24.PageBackground, 0.3)})
            v11 = 2
            v1 = 1
            for n = 1, v11, v1 do
                if n ~= 2 then
                    v6 = 0
                else
                    v6 = 0.2
                end
                drawLine(u4.current, background, {v9 * (n * 0.5), v10 * (n * 0.5)}, v6, {Color = Color.Brighten(u24.PageBackground, 0.3)})
            end
        end
    end, v6)
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {Viewport = react.createElement("ViewportFrame", {BackgroundTransparency = 1, ImageTransparency = 0.5, Size = UDim2.fromScale(1, 1), ref = u4}, {})}, v5)
end