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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.PacketFrames
--                               Dumped in 0.00254 seconds
--                          Bytecode version 9  |  30 functions

local u56
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = script.Parent.Parent
local Components = Parent.Components
local Modules = Parent.Modules
local Packages = require(Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local PacketSizeCounter = require(Packages.Directory.PacketSizeCounter)
local StudioTheme = require(Components.StudioTheme)
local CircularBuffer = require(Modules.CircularBuffer)
local PacketFrame = require(Components.PacketFrame)
local GuiInset = GuiService:GetGuiInset()
local u47 = Roact.Component:extend("PacketFrames")
local u51 = not RunService:IsRunning()
if not (RunService:IsClient()) then
    u56 = "OnServerEvent"
else
    u56 = "OnClientEvent"
end
local u62 = ReplicatedStorage:FindFirstChild("RemoteFunctionEvent.profiler", true)
function u47.init(p1) -- Line: 31 -- upvalues: Roact (val), u51 (val), CircularBuffer (val), u47 (val), RunService (val), PacketSizeCounter (val), GuiInset (val)
    local v1, v2, v3
    p1.Cleanup = {}
    p1.ProfilerBackgroundRef = Roact.createRef()
    p1.Enabled = not u51
    p1.PacketFrames = CircularBuffer.new(256)
    p1:setState({PacketFrames = u47})
    v1, v2 = Roact.createBinding(p1.PacketFrames)
    p1.PacketsChanged = v1
    p1.SetPacketsChanged = v2
    function p1.RemoteCallback(a1, p2, ...) -- Line: 43 -- upvalues: p1 (val), RunService (upval), PacketSizeCounter (upval)
        local v1, v2
        if not p1.Enabled then
            return
        end
        if not (RunService:IsClient()) then
            v1 = PacketSizeCounter.GetPacketSize({
                RunContext = "Server",
                RemoteType = a1.ClassName,
                PacketData = {...},
            })
        else
            v1 = PacketSizeCounter.GetPacketSize({
                RunContext = "Client",
                RemoteType = a1.ClassName,
                PacketData = {p2, ...},
            })
        end
        local CurrentFrame = p1.CurrentFrame
        CurrentFrame.TotalSize = CurrentFrame.TotalSize + v1
        local Packets = p1.CurrentFrame.Packets
        local v3 = {Remote = a1}
        if not (RunService:IsClient()) then
            v2 = {...}
        else
            v2 = {p2, ...}
            if not v2 then
                v2 = {...}
            end
        end
        v3.Data = v2
        v2 = {p2, ...}
        v3.RawData = v2
        v3.Size = v1
        if not (RunService:IsClient()) then
            v2 = "Server"
        else
            v2 = "Client"
        end
        v3.RunContext = v2
        table.insert(Packets, v3)
    end
    function p1.InputBegan(a1, p2) -- Line: 73 -- upvalues: p1 (val), GuiInset (upval)
        if p2.UserInputType == Enum.UserInputType.MouseButton1 then
            local v1 = p1.UpdateMouseData(p2.Position.X, p2.Position.Y + GuiInset.Y, true)
            if v1 then
                p1.props.Signals.ProfilerFrameSelected:Fire(v1)
            end
            p1.props.OnPacketProfilerPaused:Fire(true)
        end
    end
    v1, v2 = Roact.createBinding(Vector2.new(0, 0))
    p1.MousePosition = v1
    p1.SetMousePosition = v2
    v1, v2 = Roact.createBinding(false)
    p1.MouseOver = v1
    p1.SetMouseOver = v2
    local u36 = {Selected = false, Index = 0, TotalSize = 0, Packets = {}}
    v2, v3 = Roact.createBinding(u36)
    p1.SelectedFrameData = v2
    p1.SetSelectedFrameData = v3
    v2, v3 = Roact.createBinding(u36)
    p1.MouseFrameData = v2
    p1.SetMouseFrameData = v3
    function p1.UpdateMouseData(a1, p2, p3) -- Line: 96 -- upvalues: p1 (val), u36 (val)
        local v1
        p1.SetMousePosition(Vector2.new(a1, p2))
        local v2 = 256 - math.floor(a1 / (p1.ProfilerBackgroundRef:getValue().AbsoluteSize.X * 0.00390625))
        if 0 >= a1 then
            v1 = nil
        else
            v1 = p1.PacketFrames[v2]
            if not v1 then
                v1 = nil
            end
        end
        if not v1 then
            p1.SetMouseFrameData(u36)
            return v1
        end
        local v3 = {Selected = p3, Index = v2, TotalSize = v1.TotalSize, Packets = v1.Packets}
        if p3 then
            p1.SetSelectedFrameData(v3)
        end
        p1.SetMouseFrameData(v3)
        return v1
    end
    function p1.MouseEnter(a1, p2, p3) -- Line: 126 -- upvalues: u51 (upval), p1 (val)
        if u51 then
            return
        end
        p1.UpdateMouseData(p2, p3, false)
        p1.SetMouseOver(true)
    end
    function p1.MouseMoved(a1, p2, p3) -- Line: 134 -- upvalues: u51 (upval), p1 (val)
        if u51 then
            return
        end
        p1.UpdateMouseData(p2, p3, false)
    end
    function p1.MouseLeave(a1) -- Line: 141 -- upvalues: u51 (upval), p1 (val)
        if u51 then
            return
        end
        p1.UpdateMouseData(-1, -1, false)
        p1.SetMouseOver(false)
    end
    v2, v3 = Roact.createBinding(Vector2.zero)
    p1.TooltipSize = v2
    p1.SetTooltipSize = v3
end
function u47.didMount(p1) -- Line: 153 -- upvalues: u51 (val), RunService (val), u56 (val), u62 (ref), ReplicatedStorage (val)
    if not u51 then
        table.insert(p1.Cleanup, p1.props.OnPacketProfilerPaused:Connect(function(a1) -- Line: 155 -- upvalues: p1 (val)
            p1.Enabled = not a1
        end))
        local v1 = {TotalSize = 0, Time = os.clock()}
        local v2 = {}
        v1.Packets = v2
        p1.CurrentFrame = v1
        task.spawn(function() -- Line: 165 -- upvalues: RunService (upval), p1 (val), u56 (upval), u62 (upval), ReplicatedStorage (upval)
            local ServerScriptService, ServerStorage
            local v1 = {}
            local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
            local ReplicatedFirst = game:GetService("ReplicatedFirst")
            local StarterPlayer = game:GetService("StarterPlayer")
            local Workspace = game:GetService("Workspace")
            local StarterGui = game:GetService("StarterGui")
            local Players = game:GetService("Players")
            if not (RunService:IsServer()) then
                ServerScriptService = nil
            else
                ServerScriptService = game:GetService("ServerScriptService")
            end
            if not (RunService:IsServer()) then
                ServerStorage = nil
            else
                ServerStorage = game:GetService("ServerStorage")
            end
            v1[1] = ReplicatedStorage_2
            v1[2] = ReplicatedFirst
            v1[3] = StarterPlayer
            v1[4] = Workspace
            v1[5] = StarterGui
            v1[6] = Players
            v1[7] = ServerScriptService
            v1[8] = ServerStorage
            local v2 = v1
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                for k, n in j:GetDescendants() do
                    if n:IsA("RemoteEvent") then
                        table.insert(p1.Cleanup, n[u56]:Connect(function(...) -- Line: 181 -- upvalues: p1 (upval), n (val)
                            p1.RemoteCallback(n, ...)
                        end))
                    elseif not (n:IsA("UnreliableRemoteEvent")) then
                    end
                end
                table.insert(p1.Cleanup, j.DescendantAdded:Connect(function(a1) -- Line: 187 -- upvalues: p1 (upval), u56 (upval)
                    if a1:IsA("RemoteEvent") then
                        table.insert(p1.Cleanup, a1[u56]:Connect(function(...) -- Line: 189 -- upvalues: p1 (upval), a1 (val)
                            p1.RemoteCallback(a1, ...)
                        end))
                    elseif a1:IsA("UnreliableRemoteEvent") then
                        table.insert(p1.Cleanup, a1[u56]:Connect(function(...) -- Line: 189 -- upvalues: p1 (upval), a1 (val)
                            p1.RemoteCallback(a1, ...)
                        end))
                    end
                end))
            end
            if u62 ~= nil then
                table.insert(p1.Cleanup, u62.Event:Connect(p1.RemoteCallback))
            else
                local insert = nil
            end
            table.insert(p1.Cleanup, RunService.RenderStepped:Connect(function() -- Line: 208 -- upvalues: p1 (upval)
                if not p1.Enabled then
                    return
                end
                p1.PacketFrames:push(p1.CurrentFrame)
                p1.SetPacketsChanged(p1.PacketFrames)
                p1.CurrentFrame = {TotalSize = 0, Time = os.clock(), Packets = {}}
                if p1.MouseOver:getValue() then
                    local v1 = p1.MousePosition:getValue()
                    p1.UpdateMouseData(v1.X, v1.Y, p1.SelectedFrameData:getValue().Selected)
                end
            end))
        end)
    end
end
function u47.willUnmount(p1) -- Line: 230
    local Cleanup = p1.Cleanup
    local v1 = nil
    local v2 = nil
    for i, j in Cleanup, v1, v2 do
        j:Disconnect()
    end
end
function u47.render(p1) -- Line: 236 -- upvalues: Roact (val), PacketFrame (val), StudioTheme (val), u51 (val)
    local v1 = {}
    local v2 = 256
    local v3 = 1
    for i = 1, v2, v3 do
        v1[i] = Roact.createElement(PacketFrame, {MaxFrames = 256, Index = i, PacketsChanged = p1.PacketsChanged, MaxFrameSize = p1.props.MaxFrameSize})
    end
    local v4 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0}
    v4[Roact.Event.InputBegan] = p1.InputBegan
    v4[Roact.Event.MouseEnter] = p1.MouseEnter
    v4[Roact.Event.MouseMoved] = p1.MouseMoved
    v4[Roact.Event.MouseLeave] = p1.MouseLeave
    v4[Roact.Ref] = p1.ProfilerBackgroundRef
    local v5 = {Frames = Roact.createFragment(v1), SelectedHighlight = Roact.createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 2,
        Size = UDim2.fromScale(0.00390625, 1),
        Position = p1.SelectedFrameData:map(function(p1) -- Line: 263
            return UDim2.fromScale(1 - p1.Index / 256, 0)
        end),
        Visible = p1.SelectedFrameData:map(function(p1) -- Line: 267
            local Selected = p1
            if Selected then
                Selected = p1.Selected
            end
            return Selected
        end),
        BackgroundColor3 = Color3.fromHex("#34ff30"),
    }), FrameHighlight = Roact.createElement("Frame", {
        BackgroundTransparency = 0.25,
        ZIndex = 2,
        BorderSizePixel = 0,
        Size = p1.MouseFrameData:map(function(a1) -- Line: 274 -- upvalues: p1 (val)
            local v1 = math.min(a1.TotalSize / p1.props.MaxFrameSize, 1)
            return UDim2.fromScale(0.00390625, v1)
        end),
        AnchorPoint = Vector2.new(0, 1),
        Position = p1.MouseFrameData:map(function(p1) -- Line: 280
            return UDim2.fromScale(1 - p1.Index / 256, 1)
        end),
        Visible = p1.MouseFrameData:map(function(p1) -- Line: 285
            local v1 = p1.Index ~= 0
            return v1
        end),
        BackgroundColor3 = Color3.fromHex("#e8e8e8"),
    })}
    v5.FrameTooltip = StudioTheme(function(a1) -- Line: 290 -- upvalues: Roact (upval), p1 (val)
        local v1 = {AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = a1:GetColor("Dropdown"), BorderColor3 = a1:GetColor("Border")}
        v1.Position = p1.MousePosition:map(function(a1) -- Line: 295 -- upvalues: p1 (upval)
            local ViewportSize
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                ViewportSize = Vector2.new(0, 0)
            else
                ViewportSize = CurrentCamera.ViewportSize
                if not ViewportSize then
                    ViewportSize = Vector2.new(0, 0)
                end
            end
            local v1 = p1.TooltipSize:getValue()
            local v2 = math.min(a1.X, ViewportSize.X - v1.X)
            return UDim2.fromOffset(v2, a1.Y + 12)
        end)
        v1.Visible = p1.MouseOver
        v1.ZIndex = 2
        v1[Roact.Change.AbsoluteSize] = function(a1) -- Line: 307 -- upvalues: p1 (upval)
            p1.SetTooltipSize(a1.AbsoluteSize)
        end
        v1[Roact.Ref] = function(a1) -- Line: 310 -- upvalues: p1 (upval)
            if a1 then
                p1.SetTooltipSize(a1.AbsoluteSize)
            end
        end
        return Roact.createElement("Frame", v1, {UIListLayout = Roact.createElement("UIListLayout", {}), FrameLabel = Roact.createElement("TextLabel", {
            AutoLocalize = false,
            TextSize = 16,
            BackgroundTransparency = 1,
            Text = p1.MouseFrameData:map(function(p1) -- Line: 319
                return string.format("%d packets, %d bytes", #p1.Packets, p1.TotalSize)
            end),
            TextColor3 = a1:GetColor("BrightText"),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            Font = Enum.Font.SourceSans,
            Size = UDim2.fromOffset(200, 16),
        }), KBSent = Roact.createElement("TextLabel", {
            AutoLocalize = false,
            TextSize = 16,
            BackgroundTransparency = 1,
            Text = p1.MouseFrameData:map(function(p1) -- Line: 332
                return string.format("%.3f KB sent", p1.TotalSize / 1000)
            end),
            TextColor3 = a1:GetColor("BrightText"),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            Font = Enum.Font.SourceSans,
            Size = UDim2.fromOffset(200, 16),
        })})
    end)
    v5.EditModeNotifier = StudioTheme(function(p1) -- Line: 345 -- upvalues: Roact (upval), u51 (upval)
        return Roact.createElement("TextLabel", {
            AutoLocalize = false,
            BackgroundTransparency = 1,
            Text = "Start session to begin",
            TextSize = 20,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextColor3 = p1:GetColor("WarningText"),
            Font = Enum.Font.SourceSans,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            Visible = u51,
        })
    end)
    return Roact.createElement("Frame", v4, v5)
end
return u47