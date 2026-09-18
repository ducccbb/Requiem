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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.PacketProfiler
--                               Dumped in 0.00107 seconds
--                          Bytecode version 9  |  18 functions

local CoreGui
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local Components = Parent.Components
local Packages = require(Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local Signal = require(Packages.Directory.Signal)
local StudioTheme = require(Components.StudioTheme)
local PacketFrames = require(Components.PacketFrames)
local TopbarButtonsGroup = require(Components.TopbarButtonsGroup)
local TopbarButton = require(Components.TopbarButton)
if not Packages.IsPlugin then
    CoreGui = Players.LocalPlayer.PlayerGui
else
    CoreGui = game:GetService("CoreGui")
    if not CoreGui then
        CoreGui = Players.LocalPlayer.PlayerGui
    end
end
local v1 = Roact.Component:extend("PacketProfiler")
function v1.init(p1) -- Line: 22 -- upvalues: Roact (val), Signal (val)
    local v1, v2
    p1:setState({MaxFrameSize = 1000})
    p1.Cleanup = {}
    v1, v2 = Roact.createBinding(false)
    p1.PacketProfilerPaused = v1
    p1.SetPacketProfilerPaused = v2
    p1.OnPacketProfilerPaused = Signal.new()
    table.insert(p1.Cleanup, p1.OnPacketProfilerPaused:Connect(function(a1) -- Line: 32 -- upvalues: p1 (val)
        p1.SetPacketProfilerPaused(a1)
    end))
    function p1.Pause(a1) -- Line: 36 -- upvalues: p1 (val)
        p1.OnPacketProfilerPaused:Fire(a1)
    end
end
function v1.didMount(p1) -- Line: 41
    table.insert(p1.Cleanup, p1.props.Signals.ProfilerPaused:Connect(function(a1) -- Line: 42 -- upvalues: p1 (val)
        p1.Pause(a1)
    end))
end
function v1.willUnmount(p1) -- Line: 46
    local Cleanup = p1.Cleanup
    local v1 = nil
    local v2 = nil
    for i, j in Cleanup, v1, v2 do
        j:Disconnect()
    end
end
function v1.render(p1) -- Line: 52 -- upvalues: Packages (val), Roact (val), CoreGui (val), StudioTheme (val), PacketFrames (val), TopbarButton (val), TopbarButtonsGroup (val)
    local u4, u8
    if not Packages.IsPlugin then
        u4 = "Right"
    else
        u4 = "Left"
    end
    if not Packages.IsPlugin then
        u8 = 1
    else
        u8 = -1
    end
    local v1 = {}
    local v2 = {DisplayOrder = 10, IgnoreGuiInset = true, ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling}
    local v3 = {Background = StudioTheme(function(a1) -- Line: 65 -- upvalues: Roact (upval), PacketFrames (upval), p1 (val)
        return Roact.createElement("Frame", {
            BorderSizePixel = 1,
            BackgroundColor3 = a1:GetColor("Light"),
            BorderColor3 = a1:GetColor("Border"),
            Size = UDim2.new(1, 0, 0, 50),
            Position = UDim2.fromOffset(0, 10),
        }, {PacketFrames = Roact.createElement(PacketFrames, {
            Enabled = p1.props.Enabled,
            MaxFrameSize = p1.state.MaxFrameSize,
            OnPacketProfilerPaused = p1.OnPacketProfilerPaused,
            OnPacketProfilerEnabled = p1.props.OnEnabled,
            Signals = p1.props.Signals,
        })})
    end)}
    v3.Topbar = StudioTheme(function(a1) -- Line: 82 -- upvalues: Roact (upval), u4 (val), TopbarButton (upval), u8 (val), TopbarButtonsGroup (upval), p1 (val)
        local Left
        local createElement = Roact.createElement
        local v1 = {BorderSizePixel = 0, ZIndex = 2, BackgroundColor3 = a1:GetColor("Item"), Size = UDim2.new(1, 0, 0, 10)}
        local v2 = {}
        local createElement_2 = Roact.createElement
        local v3 = {FillDirection = Enum.FillDirection.Horizontal}
        if u4 ~= "Left" then
            Left = Enum.HorizontalAlignment.Right
        else
            Left = Enum.HorizontalAlignment.Left
            if not Left then
                Left = Enum.HorizontalAlignment.Right
            end
        end
        v3.HorizontalAlignment = Left
        v3.VerticalAlignment = Enum.VerticalAlignment.Center
        v3.SortOrder = Enum.SortOrder.LayoutOrder
        v3.Padding = UDim.new(0, 5)
        v2.UIListLayout = createElement_2("UIListLayout", v3)
        v2.Title = Roact.createElement(TopbarButton, {Text = "PacketProfiler", Theme = a1, LayoutOrder = u8})
        v3 = {Text = "Max KB scale", Theme = a1}
        local v4 = {}
        local v5 = {
            Name = "10 B",
            Callback = function() -- Line: 107 -- upvalues: p1 (upval)
                p1:setState({MaxFrameSize = 10})
            end,
        }
        local v6 = {
            Name = "100 B",
            Callback = function() -- Line: 115 -- upvalues: p1 (upval)
                p1:setState({MaxFrameSize = 100})
            end,
        }
        local v7 = {
            Name = "1 KB",
            Callback = function() -- Line: 123 -- upvalues: p1 (upval)
                p1:setState({MaxFrameSize = 1000})
            end,
        }
        local v8 = {
            Name = "10 KB",
            Callback = function() -- Line: 131 -- upvalues: p1 (upval)
                p1:setState({MaxFrameSize = 10000})
            end,
        }
        local v9 = {
            Name = "50 KB",
            Callback = function() -- Line: 139 -- upvalues: p1 (upval)
                p1:setState({MaxFrameSize = 50000})
            end,
        }
        local v10 = {
            Name = "100 KB",
            Callback = function() -- Line: 147 -- upvalues: p1 (upval)
                p1:setState({MaxFrameSize = 100000})
            end,
        }
        v4[1] = v5
        v4[2] = v6
        v4[3] = v7
        v4[4] = v8
        v4[5] = v9
        v4[6] = v10
        v3.Options = v4
        v3.LayoutOrder = u8 * 2
        v2.MaxKBScale = Roact.createElement(TopbarButtonsGroup, v3)
        v2.PausedLabel = Roact.createElement(TopbarButton, {
            Text = p1.PacketProfilerPaused:map(function(p1) -- Line: 157
                if p1 then
                    return "[Paused]"
                end
                return "[Running]"
            end),
            Theme = a1,
            OnClick = function() -- Line: 161 -- upvalues: p1 (upval)
                p1.props.Signals.ProfilerPaused:Fire(not p1.PacketProfilerPaused:getValue())
            end,
            LayoutIndex = u8 * 3,
        })
        return createElement("Frame", v1, v2)
    end)
    v1.PacketProfiler = Roact.createElement("ScreenGui", v2, v3)
    return Roact.createElement(Roact.Portal, {target = CoreGui}, v1)
end
return v1