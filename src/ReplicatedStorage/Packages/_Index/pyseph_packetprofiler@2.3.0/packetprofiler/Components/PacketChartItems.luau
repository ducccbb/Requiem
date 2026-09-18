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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.PacketChartItems
--                               Dumped in 0.00185 seconds
--                          Bytecode version 9  |  18 functions

local TweenService = game:GetService("TweenService")
local Parent = script.Parent.Parent
local Packages = require(Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local StudioTheme = require(Parent.Components.StudioTheme)
local function GetSizeUnit(p1) -- Line: 12
    if p1 < 1000 then
        return p1, "bytes"
    end
    if p1 < 1000000 then
        return p1 / 1000, "kilobytes"
    end
    return p1 / 1000000, "megabytes"
end
local u25 = Roact.Component:extend("DataChartItem")
function u25.init(p1) -- Line: 24 -- upvalues: Roact (val)
    local v1, v2
    v1, v2 = Roact.createBinding(false)
    p1.RemoteData = v1
    p1.ShowRemoteData = v2
    v1, v2 = Roact.createBinding(Vector2.zero)
    p1.Size = v1
    p1.SetSize = v2
    v1, v2 = Roact.createBinding(1)
    p1.HighlightTransparency = v1
    p1.SetHighlightTransparency = v2
    p1.HighlightFrame = Roact.createRef()
    p1.FadeInTween = nil
    p1.FadeOutTween = nil
    p1.HighlightTask = nil
end
function u25.didMount(p1) -- Line: 35 -- upvalues: TweenService (val)
    if p1.props.OnArcClicked then
        p1.ArcClickConnection = p1.props.OnArcClicked:Connect(function(a1) -- Line: 37 -- upvalues: p1 (val), TweenService (upval)
            if a1 == p1.props.Arc.Name then
                p1.ShowRemoteData(true)
                if p1.FadeInTween then
                    p1.FadeInTween:Cancel()
                end
                if p1.FadeOutTween then
                    p1.FadeOutTween:Cancel()
                end
                if p1.HighlightTask then
                    task.cancel(p1.HighlightTask)
                end
                local u33 = p1.HighlightFrame:getValue()
                if u33 then
                    u33.BackgroundTransparency = 1
                    local v1 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    p1.FadeInTween = TweenService:Create(u33, v1, {BackgroundTransparency = 0.7})
                    p1.FadeInTween:Play()
                    p1.HighlightTask = task.delay(0.25, function() -- Line: 62 -- upvalues: p1 (upval), TweenService (upval), u33 (val)
                        local v1 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                        p1.FadeOutTween = TweenService:Create(u33, v1, {BackgroundTransparency = 1})
                        p1.FadeOutTween:Play()
                    end)
                end
            end
        end)
    end
end
function u25.willUnmount(p1) -- Line: 76
    if p1.ArcClickConnection then
        p1.ArcClickConnection:Disconnect()
    end
    if p1.FadeInTween then
        p1.FadeInTween:Cancel()
    end
    if p1.FadeOutTween then
        p1.FadeOutTween:Cancel()
    end
    if p1.HighlightTask then
        task.cancel(p1.HighlightTask)
    end
end
function u25.render(p1) -- Line: 91 -- upvalues: StudioTheme (val), Roact (val), GetSizeUnit (val)
    local Arc = p1.props.Arc
    local u3 = {}
    local RemoteData = p1.props.RemoteData
    local v1 = nil
    local v2 = nil
    for i, j in RemoteData, v1, v2 do
        local Packet = j.Packet
        u3[i] = StudioTheme(function(a1) -- Line: 97 -- upvalues: i (val), Roact (upval), j (val), p1 (val), Packet (val)
            local v1 = Roact.createElement("TextButton", {
                AutoLocalize = false,
                RichText = true,
                TextSize = 14,
                BackgroundTransparency = 1,
                Selectable = false,
                LayoutOrder = i * 2,
                Font = Enum.Font.SourceSans,
                Text = j.Name,
                TextColor3 = a1:GetColor("BrightText"),
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.new(1, 0, 0, 20),
                Visible = p1.RemoteData,
            }, {Padding = Roact.createElement("UIPadding", {PaddingBottom = UDim.new(0, 4)})})
            local v2 = {
                AutomaticSize = Enum.AutomaticSize.Y,
                AutomaticCanvasSize = Enum.AutomaticSize.X,
                LayoutOrder = i * 2 + 1,
                BackgroundColor3 = a1:GetColor("ScrollBarBackground"),
                Position = UDim2.fromOffset(0, 20),
                Size = UDim2.new(1, -12, 0, 0),
                ClipsDescendants = true,
                BorderSizePixel = 0,
                ScrollBarImageColor3 = a1:GetColor("ScrollBar"),
                ScrollBarThickness = 4,
                ScrollingDirection = Enum.ScrollingDirection.X,
                Visible = p1.RemoteData,
            }
            v2[Roact.Ref] = function(p1) -- Line: 132
                if p1 ~= nil then
                    task.delay(0.1, function() -- Line: 137 -- upvalues: p1 (val)
                        local UICorner = Instance.new("UICorner")
                        UICorner.CornerRadius = UDim.new(0, 4)
                        UICorner.Parent = p1
                    end)
                end
            end
            local v3 = Roact.createElement("ScrollingFrame", v2, {UIStroke = Roact.createElement("UIStroke", {Transparency = 0.5, Color = a1:GetColor("DropShadow"), LineJoinMode = Enum.LineJoinMode.Round}), Text = Roact.createElement("TextLabel", {
                AutoLocalize = false,
                RichText = true,
                TextSize = 12,
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Font = Enum.Font.Code,
                Text = Packet,
                TextColor3 = a1:GetColor("BrightText"),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                AutomaticSize = Enum.AutomaticSize.XY,
                Size = UDim2.fromScale(1, 1),
            }, {Padding = Roact.createElement("UIPadding", {PaddingBottom = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingLeft = UDim.new(0, 4), PaddingTop = UDim.new(0, 4)})})})
            return Roact.createFragment({v1, v3})
        end)
    end
    return StudioTheme(function(a1) -- Line: 177 -- upvalues: Roact (upval), Arc (val), p1 (val), GetSizeUnit (upval), u3 (val)
        local v1 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 22), AutomaticSize = Enum.AutomaticSize.Y}
        local v2 = {}
        local v3 = {
            BackgroundColor3 = Arc.Color,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0),
            ZIndex = 1,
            BorderSizePixel = 0,
        }
        v3[Roact.Ref] = p1.HighlightFrame
        v2.HighlightEffect = Roact.createElement("Frame", v3)
        v3 = {AutoLocalize = false, Font = Enum.Font.SourceSans}
        local v4 = Arc.Color:ToHex()
        v3.Text = string.format("<font color=\"#%s\"><b>%s</b></font>: %.1f%%, %d %s", v4, Arc.Name, Arc.Percent, GetSizeUnit(Arc.DataSize))
        v3.RichText = true
        v3.TextColor3 = a1:GetColor("BrightText")
        v3.TextSize = 14
        v3.TextXAlignment = Enum.TextXAlignment.Left
        v3.BackgroundTransparency = 1
        v3.Size = UDim2.new(1, -18, 0, 20)
        v3.Position = UDim2.fromOffset(18, 0)
        v3.ZIndex = 3
        v3[Roact.Event.Activated] = function() -- Line: 204 -- upvalues: p1 (upval)
            p1.ShowRemoteData(not p1.RemoteData:getValue())
        end
        v2.Information = Roact.createElement("TextButton", v3, {Padding = Roact.createElement("UIPadding", {PaddingBottom = UDim.new(0, 4)})})
        v2.Chevron = Roact.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 3,
            Image = p1.RemoteData:map(function(p1) -- Line: 214
                if p1 then
                    return "rbxassetid://18699144520"
                end
                return "rbxassetid://18699113012"
            end),
            ImageColor3 = a1:GetColor("BrightText"),
            Size = UDim2.fromOffset(16, 16),
            Position = UDim2.fromOffset(0, 2),
        })
        v3 = {AutomaticSize = Enum.AutomaticSize.Y, Size = p1.props.ScrollBarChanged:map(function(p1) -- Line: 224
            local v1
            if not p1.Visible then
                v1 = 0
            else
                v1 = -12
            end
            return UDim2.new(1, v1, 0, 0)
        end), Position = UDim2.fromOffset(8, 24), Transparency = 1}
        v3[Roact.Change.AbsoluteSize] = function(a1) -- Line: 229 -- upvalues: p1 (upval)
            p1.SetSize(a1.AbsoluteSize)
        end
        v2.Container = Roact.createElement("Frame", v3, {RemoteData = Roact.createFragment(u3), UIListLayout = Roact.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 0),
        })})
        v2.Divider = Roact.createElement("Frame", {
            Transparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = 2,
            BackgroundColor3 = a1:GetColor("DropShadow"),
            Size = p1.Size:map(function(p1) -- Line: 246
                return UDim2.new(0, 1, 0, p1.Y)
            end),
            Position = UDim2.fromOffset(0, 26),
        })
        return Roact.createElement("Frame", v1, v2)
    end)
end
return function(p1) -- Line: 256 -- upvalues: Roact (val), u25 (val)
    local v1 = {}
    local v2 = 0
    local Arcs = p1.Arcs
    local v3 = nil
    local v4 = nil
    for i, j in Arcs, v3, v4 do
        v2 = v2 - j.Percent
        v1[v2] = Roact.createElement(u25, {Arc = j, RemoteData = j.RemoteData, ScrollBarChanged = p1.ScrollBarChanged, OnArcClicked = p1.OnArcClicked})
    end
    return Roact.createFragment(v1)
end