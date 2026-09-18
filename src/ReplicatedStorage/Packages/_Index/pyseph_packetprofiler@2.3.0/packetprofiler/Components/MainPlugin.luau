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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.MainPlugin
--                              Dumped in 0.000826 seconds
--                          Bytecode version 9  |  9 functions

local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local u11 = Parent:FindFirstAncestorOfClass("Plugin")
local Components = Parent.Components
local Packages = require(Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local Signal = require(Packages.Directory.Signal)
Roact.setGlobalConfig({elementTracing = true})
local v1 = Roact.Component:extend("MainPlugin")
function v1.init(p1) -- Line: 18 -- upvalues: Signal (val), u11 (val), Packages (val)
    local v1, v2
    p1.OnPacketProfilerEnabled = Signal.new()
    if not u11 then
        v1 = false
    else
        v1 = u11:GetSetting("PacketChartEnabled") == true
    end
    p1.IsPacketChartEnabled = v1
    p1.OnPacketChartEnabled = Signal.new()
    local v3 = {}
    if not u11 then
        v2 = false
    else
        v2 = u11:GetSetting("PacketProfilerEnabled") == true
    end
    v3.PacketProfilerEnabled = v2
    p1:setState(v3)
    if Packages.IsPlugin then
        p1.props.PacketProfiler:SetActive(p1.state.PacketProfilerEnabled)
        p1.props.PacketChart:SetActive(p1.IsPacketChartEnabled)
    end
    p1.Connections = {}
    p1.Signals = {ProfilerFrameSelected = Signal.new(), ProfilerPaused = Signal.new()}
    function p1.OnPacketProfilerClicked() -- Line: 38 -- upvalues: p1 (val), u11 (upval)
        local v1 = not p1.state.PacketProfilerEnabled
        p1.OnPacketProfilerEnabled:Fire(v1)
        p1:setState({PacketProfilerEnabled = v1})
        if u11 then
            u11:SetSetting("PacketProfilerEnabled", v1)
        end
    end
    function p1.OnPacketChartClicked(a1) -- Line: 49 -- upvalues: p1 (val), u11 (upval)
        local v1
        if not a1 then
            v1 = not p1.IsPacketChartEnabled
        else
            v1 = a1
        end
        p1.IsPacketChartEnabled = v1
        p1.OnPacketChartEnabled:Fire(v1)
        if u11 then
            u11:SetSetting("PacketChartEnabled", v1)
        end
    end
end
function v1.didMount(p1) -- Line: 60 -- upvalues: Packages (val), UserInputService (val)
    if Packages.IsPlugin then
        table.insert(p1.Connections, p1.props.PacketProfiler.Click:Connect(p1.OnPacketProfilerClicked))
        table.insert(p1.Connections, p1.props.PacketChart.Click:Connect(p1.OnPacketChartClicked))
        return
    end
    table.insert(p1.Connections, UserInputService.InputBegan:Connect(function(a1) -- Line: 65 -- upvalues: UserInputService (upval), p1 (val)
        if not (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)) then
            return
        end
        if a1.KeyCode == Enum.KeyCode.F5 then
            p1.OnPacketProfilerClicked()
            return
        end
        if a1.KeyCode == Enum.KeyCode.P then
            p1.ProfilerPaused = not p1.ProfilerPaused
            p1.Signals.ProfilerPaused:Fire(p1.ProfilerPaused)
        end
    end))
    table.insert(p1.Connections, p1.Signals.ProfilerFrameSelected:Connect(function(a1) -- Line: 78 -- upvalues: p1 (val)
        if #a1.Packets == 0 then
            p1.OnPacketChartClicked(false)
            return
        end
        p1.OnPacketChartClicked(true)
    end))
end
function v1.render(p1) -- Line: 88 -- upvalues: Roact (val), Components (val), u11 (val)
    local Mouse, v1
    local createFragment = Roact.createFragment
    local v2 = {}
    if not p1.state.PacketProfilerEnabled then
        v1 = nil
    else
        local PacketProfiler = require(Components.PacketProfiler)
        v1 = Roact.createElement(PacketProfiler, {Enabled = true, OnEnabled = p1.OnPacketProfilerEnabled, Signals = p1.Signals})
    end
    v2.PacketProfiler = v1
    local createElement = Roact.createElement
    local PacketChart = require(Components.PacketChart)
    local v3 = {Enabled = p1.IsPacketChartEnabled, OnEnabled = p1.OnPacketChartEnabled, Signals = p1.Signals}
    if not u11 then
        Mouse = nil
    else
        Mouse = u11:GetMouse()
        if not Mouse then
            Mouse = nil
        end
    end
    v3.PluginMouse = Mouse
    v2.PacketChart = createElement(PacketChart, v3)
    return createFragment(v2)
end
function v1.willUnmount(p1) -- Line: 104
    local Connections = p1.Connections
    local v1 = nil
    local v2 = nil
    for i, j in Connections, v1, v2 do
        j:Disconnect()
    end
    table.clear(p1.Connections)
end
return v1