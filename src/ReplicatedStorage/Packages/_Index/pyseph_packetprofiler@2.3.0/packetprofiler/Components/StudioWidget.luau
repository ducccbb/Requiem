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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.StudioWidget
--                              Dumped in 0.000348 seconds
--                          Bytecode version 9  |  8 functions

local u4 = script:FindFirstAncestorOfClass("Plugin")
local Packages = require(u4:FindFirstChildOfClass("Script").Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local v1 = Roact.Component:extend("StudioWidget")
function v1.init(p1) -- Line: 10 -- upvalues: u4 (val)
    local v1 = DockWidgetPluginGuiInfo.new(p1.props.InitialDockState, p1.props.Enabled, false, p1.props.DefaultSize.X, p1.props.DefaultSize.Y, p1.props.MinimumSize.X, p1.props.MinimumSize.Y)
    local v2 = u4:CreateDockWidgetPluginGui(p1.props.WidgetId, v1)
    v2.Title = p1.props.WidgetTitle
    v2.Name = p1.props.WidgetId
    local ZIndexBehavior = p1.props.ZIndexBehavior
    if not ZIndexBehavior then
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    end
    v2.ZIndexBehavior = ZIndexBehavior
    p1.Widget = v2
end
function v1.didMount(p1) -- Line: 29
    p1.OnEnabled = p1.props.OnEnabled:Connect(function(a1) -- Line: 30 -- upvalues: p1 (val)
        p1.Widget.Enabled = a1
    end)
    p1.Widget:BindToClose(function() -- Line: 33 -- upvalues: p1 (val)
        p1.Widget.Enabled = false
    end)
end
function v1.render(p1) -- Line: 38 -- upvalues: Roact (val)
    return Roact.createElement(Roact.Portal, {target = p1.Widget}, p1.props[Roact.Children])
end
function v1.didUpdate(p1, p2) -- Line: 44
    if p1.props.Enabled ~= p2.Enabled then
        p1.Widget.Enabled = p1.props.Enabled
    end
end
function v1.willUnmount(p1) -- Line: 50
    p1.OnEnabled:Disconnect()
end
return v1