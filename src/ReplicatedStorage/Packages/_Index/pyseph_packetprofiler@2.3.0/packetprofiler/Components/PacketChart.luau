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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.PacketChart
--                               Dumped in 0.00320 seconds
--                          Bytecode version 9  |  19 functions

local GetRemoteData, v1
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = script.Parent.Parent
local Components = Parent.Components
local Modules = Parent.Modules
local Packages = require(Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local Signal = require(Packages.Directory.Signal)
local PacketSizeCounter = require(Packages.Directory.PacketSizeCounter)
local StudioTheme = require(Components.StudioTheme)
local PacketCircleArcs = require(Components.PacketCircleArcs)
local PacketChartItems = require(Components.PacketChartItems)
local ChartResize = require(Components.ChartResize)
local TableToSyntaxString = require(Modules.TableToSyntaxString)
local u48 = not RunService:IsRunning()
local u49 = 0
local function GetRemoteColor() -- Line: 29 -- upvalues: u49 (ref)
    u49 = (u49 + 0.6180339887498949) % 1
    return (Color3.fromHSV(u49, 0.5, 0.95))
end
local v2 = ReplicatedStorage:FindFirstChild("RemoteName.profiler", true)
local u79 = nil
if v2 ~= nil then
    v1 = typeof(require(v2)) == "function"
    assert(v1, "Return of RemoteName.profiler must be a function")
    GetRemoteData = require(v2)
    u79 = GetRemoteData
else
    GetRemoteData = nil
end
function GetRemoteData(p1, ...) -- Line: 53 -- upvalues: u79 (ref)
    local v1 = u79
    if v1 then
        v1 = u79(p1, ...)
    end
    if not v1 then
        return (("%*.%*"):format(p1.Parent, p1.Name))
    end
    return v1
end
v1 = Roact.Component:extend("PacketChart")
function v1.init(p1) -- Line: 65 -- upvalues: Signal (val), Roact (val)
    local v1, v2
    p1.ArcsUpdated = Signal.new()
    p1.OnArcClicked = Signal.new()
    v1, v2 = Roact.createBinding(false)
    p1.ChartEnabled = v1
    p1.SetChartEnabled = v2
    v1, v2 = Roact.createBinding({Size = 0, Visible = false})
    p1.ScrollBarChanged = v1
    p1.SetScrollBarChanged = v2
    p1.OpenRemoteData = Signal.new()
    p1:setState({Arcs = {}})
end
function v1.didMount(p1) -- Line: 81 -- upvalues: GetRemoteData (val), TableToSyntaxString (val), PacketSizeCounter (val), u49 (ref)
    p1.props.Signals.ProfilerFrameSelected:Connect(function(a1) -- Line: 82 -- upvalues: GetRemoteData (upval), TableToSyntaxString (upval), PacketSizeCounter (upval), u49 (upval), p1 (val)
        local Data, Name, Size, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = {}
        local Packets = a1.Packets
        local v11 = nil
        local v12 = nil
        local v13 = a1
        for i, j in Packets, v11, v12 do
            v8 = GetRemoteData(j.Remote, unpack(j.RawData))
            Size = j.Size
            if typeof(v8) ~= "string" then
                v9 = 0
                v1 = {}
                v2 = v8
                v3 = nil
                v4 = nil
                for k, n in v2, v3, v4 do
                    v7 = PacketSizeCounter.GetPacketSize({RemoteType = "RemoteEvent", RunContext = j.RunContext, PacketData = n.Arguments})
                    v6 = v7 - PacketSizeCounter.BaseRemoteOverhead
                    if j.RunContext == "Client" then
                        v6 = v6 - PacketSizeCounter.ClientToServerOverhead
                    end
                    v1[k] = v6
                    v9 = v9 + v6
                end
                v2 = v8
                v3 = nil
                v4 = nil
                for m, i5 in v2, v3, v4 do
                    Name = i5.Name
                    if not (v10[Name]) then
                        v10[Name] = {Size = 0, Data = {}}
                    end
                    v7 = v10[Name]
                    v7.Size = v7.Size + v1[m] / v9 * Size
                    v10[Name].Data[#v10[Name].Data + 1] = {Name = i5.Name, Packet = TableToSyntaxString(i5.Arguments, true)}
                end
            else
                if not (v10[v8]) then
                    v10[v8] = {Size = 0, Data = {}}
                end
                v9 = v10[v8]
                v9.Size = v9.Size + Size
                v9 = #v10[v8].Data + 1
                Data = v10[v8].Data
                v2 = {Name = ("Remote call %*:"):format(v9)}
                if not j.Data then
                    v5 = "[None]"
                else
                    v5 = TableToSyntaxString(j.Data)
                end
                v2.Packet = ("%*"):format(v5)
                Data[v9] = v2
            end
        end
        local v14 = {}
        v12 = v10
        local v15 = nil
        local v16 = nil
        for i6, i7 in v12, v15, v16 do
            u49 = (u49 + 0.6180339887498949) % 1
            table.insert(v14, {
                Name = i6,
                DataSize = i7.Size,
                Percent = i7.Size / v13.TotalSize * 100,
                Color = Color3.fromHSV(u49, 0.5, 0.95),
                RemoteData = i7.Data,
            })
        end
        table.sort(v14, function(p1, p2) -- Line: 159
            local v1 = p2.Percent < p1.Percent
            return v1
        end)
        p1:setState({Arcs = v14})
    end)
    p1.props.Signals.ProfilerPaused:Connect(function(a1) -- Line: 167 -- upvalues: p1 (val)
        p1.SetChartEnabled(a1)
    end)
    p1.props.OnEnabled:Connect(function(a1) -- Line: 170 -- upvalues: p1 (val)
        p1.SetChartEnabled(a1)
    end)
end
function v1.render(p1) -- Line: 175 -- upvalues: Roact (val), Packages (val), Components (val), StudioTheme (val), ChartResize (val), u48 (val), PacketCircleArcs (val), PacketChartItems (val)
    local StudioWidget
    local createElement = Roact.createElement
    if not Packages.IsPlugin then
        StudioWidget = "ScreenGui"
    else
        StudioWidget = require(Components.StudioWidget)
        if not StudioWidget then
            StudioWidget = "ScreenGui"
        end
    end
    local v1 = {
        Plugin = {
            WidgetId = "PacketChart",
            WidgetTitle = "Packet Chart",
            InitialDockState = Enum.InitialDockState.Float,
            Enabled = p1.props.Enabled,
            OnEnabled = p1.props.OnEnabled,
            DefaultSize = Vector2.new(350, 200),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            MinimumSize = Vector2.new(300, 100),
        },
    }
    local v2 = {IgnoreGuiInset = true, ResetOnSpawn = false, Enabled = p1.ChartEnabled, ZIndexBehavior = Enum.ZIndexBehavior.Sibling}
    v1.Client = v2
    if not Packages.IsPlugin then
        v2 = "Client"
    else
        v2 = "Plugin"
    end
    local v3 = v1[v2]
    v1 = {}
    v1.Holder = StudioTheme(function(a1) -- Line: 194 -- upvalues: ChartResize (upval), Roact (upval), Packages (upval), u48 (upval), p1 (val), PacketCircleArcs (upval), PacketChartItems (upval)
        return ChartResize(function(a1_2) -- Line: 195 -- upvalues: Roact (upval), Packages (upval), a1 (val), u48 (upval), p1 (upval), PacketCircleArcs (upval), PacketChartItems (upval)
            local SetSizeTarget, UISize, v1
            local createElement = Roact.createElement
            local v2 = "Frame"
            local v3 = {BackgroundTransparency = 1}
            if not Packages.IsPlugin then
                v1 = Vector2.new(1, 0)
            else
                v1 = Vector2.new()
            end
            v3.AnchorPoint = v1
            if not Packages.IsPlugin then
                v1 = UDim2.new(1, 0, 0, 61)
            else
                v1 = UDim2.new()
            end
            v3.Position = v1
            if not Packages.IsPlugin then
                UISize = a1_2.UISize
            else
                UISize = UDim2.fromScale(1, 1)
            end
            v3.Size = UISize
            local Ref = Roact.Ref
            if Packages.IsPlugin then
                SetSizeTarget = nil
            else
                SetSizeTarget = a1_2.SetSizeTarget
                if not SetSizeTarget then
                    SetSizeTarget = nil
                end
            end
            v3[Ref] = SetSizeTarget
            v1 = {Background = Roact.createElement("Frame", {BorderSizePixel = 0, ZIndex = 0, BackgroundColor3 = a1:GetColor("MainBackground"), Size = UDim2.fromScale(1, 1)}, {Notches = Roact.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://18701486909",
                ImageTransparency = 0.5,
                AnchorPoint = Vector2.new(0, 1),
                ImageColor3 = a1:GetColor("BrightText"),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.fromOffset(16, 16),
            })}), UIStroke = Roact.createElement("UIStroke", {Thickness = 1, Color = a1:GetColor("DropShadow")})}
            local v4 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(100, 100), Visible = not u48, Position = UDim2.fromOffset(8, 8)}
            local v5 = {}
            local v6 = {BackgroundColor3 = a1:GetColor("ScrollBarBackground"), Size = UDim2.fromScale(1, 1)}
            local v7 = #p1.state.Arcs
            local v8 = 0 < v7
            v6.Visible = v8
            v5.BackgroundUI = Roact.createElement("Frame", v6, {UIStroke = Roact.createElement("UIStroke", {Transparency = 0.5, Color = a1:GetColor("DropShadow"), LineJoinMode = Enum.LineJoinMode.Round}), UICorner = Roact.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})})
            v5.PacketCircle = Roact.createElement(PacketCircleArcs, {
                Arcs = p1.state.Arcs,
                PluginMouse = p1.props.PluginMouse,
                OnArcClicked = function(a1) -- Line: 247 -- upvalues: p1 (upval)
                    p1.OnArcClicked:Fire(a1)
                end,
            })
            v1.BackgroundCircle = Roact.createElement("Frame", v4, v5)
            v4 = {
                BackgroundColor3 = a1:GetColor("MainBackground"),
                Size = UDim2.new(1, -121, 1, -1),
                Position = UDim2.new(1, -1, 0, 0),
                AnchorPoint = Vector2.new(1, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Visible = not u48,
                ZIndex = 2,
                BottomImage = "rbxassetid://5234388158",
                MidImage = "rbxassetid://5234388158",
                TopImage = "rbxassetid://5234388158",
                ScrollBarImageColor3 = a1:GetColor("Light"),
                ScrollBarThickness = 10,
            }
            v4[Roact.Change.AbsoluteCanvasSize] = function(a1) -- Line: 269 -- upvalues: p1 (upval)
                local v1 = {Size = a1.AbsoluteSize.Y}
                local v2 = a1.AbsoluteSize.Y < a1.AbsoluteCanvasSize.Y
                v1.Visible = v2
                p1.SetScrollBarChanged(v1)
            end
            v4[Roact.Change.AbsoluteSize] = function(a1) -- Line: 275 -- upvalues: p1 (upval)
                local v1 = {Size = a1.AbsoluteSize.Y}
                local v2 = a1.AbsoluteSize.Y < a1.AbsoluteCanvasSize.Y
                v1.Visible = v2
                p1.SetScrollBarChanged(v1)
            end
            v5 = {}
            v6 = {SortOrder = Enum.SortOrder.LayoutOrder, FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}
            v6[Roact.Change.AbsoluteContentSize] = function(p1) -- Line: 287
                p1.Parent.CanvasSize = UDim2.fromOffset(0, p1.AbsoluteContentSize.Y)
            end
            v5.UIListLayout = Roact.createElement("UIListLayout", v6)
            v5.Items = Roact.createElement(PacketChartItems, {Arcs = p1.state.Arcs, ScrollBarChanged = p1.ScrollBarChanged, OnArcClicked = p1.OnArcClicked})
            v5.UIPadding = Roact.createElement("UIPadding", {PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8)})
            v1.DataList = Roact.createElement("ScrollingFrame", v4, v5)
            v1.EditModeNotifier = Roact.createElement("TextLabel", {
                AutoLocalize = false,
                BackgroundTransparency = 1,
                Text = "Start session to begin",
                TextSize = 20,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = a1:GetColor("WarningText"),
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                Visible = u48,
            })
            v1.ScrollBarOutline = Roact.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = a1:GetColor("ScrollBarBackground"),
                Size = p1.ScrollBarChanged:map(function(p1) -- Line: 318
                    return UDim2.fromOffset(12, p1.Size)
                end),
                Position = UDim2.new(1, 0, 0, 0),
                AnchorPoint = Vector2.new(1, 0),
                Visible = p1.ScrollBarChanged:map(function(p1) -- Line: 323
                    return p1.Visible
                end),
            })
            return createElement(v2, v3, v1)
        end)
    end)
    return createElement(StudioWidget, v3, v1)
end
return v1