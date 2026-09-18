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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.PacketCircleArcs
--                               Dumped in 0.00149 seconds
--                          Bytecode version 9  |  12 functions

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Packages = require(script.Parent.Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local v1 = Roact.Component:extend("PacketCircleArcs")
local function lerp(p1, p2, p3) -- Line: 13
    return p1 + (p2 - p1) * p3
end
local function CircleArc(p1) -- Line: 17 -- upvalues: Roact (val)
    local v1, v2, v3
    local EndPercent = p1.Data.EndPercent
    local StartPercent = p1.Data.StartPercent
    local VisiblePercent = p1.Data.VisiblePercent
    local v4 = {BackgroundTransparency = 1, Image = "rbxassetid://3587367081", ImageColor3 = p1.Highlighted:map(function(a1) -- Line: 25 -- upvalues: StartPercent (val), EndPercent (val), p1 (val)
        if StartPercent > a1 or a1 >= EndPercent then
            return p1.Data.Color
        end
        local v1 = Color3.new(1, 1, 1)
        return p1.Data.Color:Lerp(v1, 0.5)
    end), Size = UDim2.fromScale(2, 1)}
    if p1.Side ~= "Left" then
        v3 = -1
    else
        v3 = 0
    end
    v4.Position = UDim2.fromScale(v3, 0)
    v4.ZIndex = p1.ZIndex
    local v5 = {}
    local v6 = {Rotation = p1.AnimationAlpha:map(function(a1) -- Line: 37 -- upvalues: p1 (val), VisiblePercent (val)
        local v1
        if p1.Side == "Left" then
            v1 = math.clamp(a1 * 2, 0, 1)
            return -3.6 * (0 + (VisiblePercent - 0) * v1) + 180
        end
        v1 = math.clamp(a1 * 2 - 1, 0, 1)
        return (0 + -180 * ((0 + (VisiblePercent - 50 - 0) * v1) / 100)) * 2
    end)}
    local v7 = {}
    local v8 = NumberSequenceKeypoint.new(0, 0)
    if p1.Side ~= "Left" then
        v1 = 0.5
    else
        v1 = 0.498
    end
    local v9 = NumberSequenceKeypoint.new(v1, 0)
    if p1.Side ~= "Left" then
        v2 = 0.501
    else
        v2 = 0.499
    end
    v1 = NumberSequenceKeypoint.new(v2, 1)
    v7[1] = v8
    v7[2] = v9
    v7[3] = v1
    v7[4] = NumberSequenceKeypoint.new(1, 1)
    v6.Transparency = NumberSequence.new(v7)
    v5.UIGradient = Roact.createElement("UIGradient", v6)
    return Roact.createElement("ImageLabel", v4, v5)
end
function v1.init(p1) -- Line: 57 -- upvalues: Roact (val), Packages (val), Players (val), RunService (val), TweenService (val)
    local PluginMouse, v1, v2
    v1, v2 = Roact.createBinding(0)
    p1.AnimationAlpha = v1
    p1.SetAnimationAlpha = v2
    v1, v2 = Roact.createBinding(0)
    p1.ActualAlpha = v1
    p1.SetActualAlpha = v2
    v1, v2 = Roact.createBinding(Vector2.zero)
    p1.MousePosition = v1
    p1.SetMousePosition = v2
    v1, v2 = Roact.createBinding(-1)
    p1.HighlightedPercent = v1
    p1.SetHighlightedPercent = v2
    v1, v2 = Roact.createBinding(UDim2.fromOffset(0, 0))
    p1.DebugMousePos = v1
    p1.SetDebugMousePos = v2
    v1, v2 = Roact.createBinding(false)
    p1.ShowDebug = v1
    p1.SetShowDebug = v2
    if not Packages.IsPlugin then
        PluginMouse = Players.LocalPlayer:GetMouse()
    else
        PluginMouse = p1.props.PluginMouse
        if not PluginMouse then
            PluginMouse = Players.LocalPlayer:GetMouse()
        end
    end
    RunService.RenderStepped:Connect(function(a1) -- Line: 68 -- upvalues: PluginMouse (val), p1 (val), TweenService (upval)
        local v1 = Vector2.new(PluginMouse.X, PluginMouse.Y)
        p1.SetMousePosition(v1)
        local v2 = p1.ActualAlpha:getValue()
        p1.SetAnimationAlpha(TweenService:GetValue(v2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
        local v3 = v2 + a1 * 2
        p1.SetActualAlpha((math.clamp(v3, 0, 1)))
    end)
end
function v1.render(p1) -- Line: 79 -- upvalues: CircleArc (val), Roact (val)
    local v1, v2, v3
    local v4 = {Left = {}, Right = {}}
    local v5 = 0
    p1.SetActualAlpha(0)
    local u78 = {}
    local v6 = #p1.props.Arcs
    local Arcs = p1.props.Arcs
    local v7 = nil
    local v8 = nil
    local u69 = p1
    for i, j in Arcs, v7, v8 do
        v1 = v6 - i + 2
        v2 = math.min(v5 + j.Percent, 100)
        if 100 < v5 then
            break
        end
        v3 = {StartPercent = v5, EndPercent = v2, Color = j.Color, Name = j.Name}
        u78[i] = v3
        if 50 < v2 and v5 <= 50 then
            v4.Left[i] = CircleArc({
                Side = "Left",
                ZIndex = v1,
                Data = {VisiblePercent = 50, StartPercent = v5, EndPercent = v2, Color = j.Color},
                AnimationAlpha = u69.AnimationAlpha,
                Highlighted = u69.HighlightedPercent,
            })
        end
        if 50 >= v2 then
            v3 = "Left"
        else
            v3 = "Right"
        end
        v4[v3][i] = CircleArc({
            ZIndex = v1,
            Data = {StartPercent = v5, EndPercent = v2, VisiblePercent = v2, Color = j.Color},
            Side = v3,
            AnimationAlpha = u69.AnimationAlpha,
            Highlighted = u69.HighlightedPercent,
        })
        v5 = v5 + j.Percent
    end
    v8 = {BackgroundTransparency = 1, Size = UDim2.new(1, -8, 1, -8), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    v8[Roact.Event.MouseEnter] = function(p1, p2, p3) -- Line: 143 -- upvalues: u69 (val)
        u69.MouseOver = true
        u69.SetShowDebug(true)
    end
    v8[Roact.Event.MouseLeave] = function() -- Line: 147 -- upvalues: u69 (val)
        u69.MouseOver = false
        u69.SetHighlightedPercent(-1)
        u69.SetShowDebug(false)
    end
    v8[Roact.Event.MouseMoved] = function(p1, p2, p3) -- Line: 152 -- upvalues: u69 (val)
        if u69.MouseOver then
            local v1 = Vector2.new(p2, p3)
            local v2 = p1.AbsolutePosition + p1.AbsoluteSize / 2
            u69.SetDebugMousePos(UDim2.fromOffset(p2 - 1, p3 - 1))
            local v3 = v1.Y - v2.Y
            local v4 = math.deg((math.atan2(v3, -(v1.X - v2.X)))) + 90
            if v4 < 0 then
                v4 = v4 + 360
            end
            u69.SetHighlightedPercent(v4 / 360 * 100)
        end
    end
    v8[Roact.Event.InputEnded] = function(p1, p2) -- Line: 168 -- upvalues: u69 (val), u78 (val)
        if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        local v1 = u69.HighlightedPercent:getValue()
        if v1 == -1 then
            return
        end
        local v2 = u78
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if j.StartPercent <= v1 and v1 < j.EndPercent then
                if not u69.props.OnArcClicked then
                    break
                end
                u69.props.OnArcClicked(j.Name)
                break
            end
        end
        u69.SetHighlightedPercent(-1)
    end
    return Roact.createElement("Frame", v8, {Left = Roact.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = true, Size = UDim2.fromScale(0.5, 1)}, {Arcs = Roact.createFragment(v4.Left)}), Right = Roact.createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0.5, 1),
    }, {Arcs = Roact.createFragment(v4.Right)})})
end
return v1