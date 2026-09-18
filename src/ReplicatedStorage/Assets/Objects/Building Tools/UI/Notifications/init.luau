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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Notifications
--                              Dumped in 0.000692 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
v2 = v1:FindFirstAncestorWhichIsA("Tool")
local Libraries = v2:WaitForChild("Libraries")
local Vendor = v2:WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local fastSpawn = require(Libraries:WaitForChild("fastSpawn"))
local createElement = Roact.createElement
local NotificationDialog = require(v1:WaitForChild("NotificationDialog"))
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 23 -- upvalues: fastSpawn (val)
    p1.Active = true
    p1:setState({ShouldWarnAboutHttpService = false, ShouldWarnAboutUpdate = false})
    fastSpawn(function() -- Line: 30 -- upvalues: p1 (val)
        if p1.Active then
            p1:setState({ShouldWarnAboutUpdate = p1.props.Core.IsVersionOutdated()})
        end
    end)
    fastSpawn(function() -- Line: 38 -- upvalues: p1 (val)
        local Core = p1.props.Core
        local v1 = if Core.Mode == "Tool" then not Core.SyncAPI:Invoke("IsHttpServiceEnabled") else false
        if p1.Active then
            p1:setState({ShouldWarnAboutHttpService = v1})
        end
    end)
end
function v3.willUnmount(p1) -- Line: 50
    p1.Active = false
end
function v3.render(p1) -- Line: 54 -- upvalues: createElement (val), NotificationDialog (val)
    local v1
    local v2 = {}
    local v3 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 300, 1, 0)}
    local v4 = {}
    local v5 = {
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }
    v4.Layout = createElement("UIListLayout", v5)
    if p1.state.ShouldWarnAboutUpdate then
        local v6
        v5 = {LayoutOrder = 1, NoticeText = "This version of Building Tools is <b>outdated.</b>", ThemeColor = Color3.fromRGB(255, 170, 0)}
        if p1.props.Core.Mode ~= "Plugin" then
            v6 = "Own this place? Simply <b>reinsert</b> the Building Tools model."
        else
            v6 = "To update plugins, go to\n<b>PLUGINS</b> > <b>Manage Plugins</b> :-)"
        end
        v5.DetailText = v6
        function v5.OnDismiss() -- Line: 76 -- upvalues: p1 (val)
            p1:setState({ShouldWarnAboutUpdate = false})
        end
        v1 = createElement(NotificationDialog, v5)
    else
        v1 = nil
    end
    v4.UpdateNotification = v1
    if p1.state.ShouldWarnAboutHttpService then
        v1 = createElement(NotificationDialog, {
            LayoutOrder = 0,
            NoticeText = "HTTP requests must be <b>enabled</b> for some features of Building Tools to work, including exporting.",
            DetailText = "Own this place? Edit it in Studio, and toggle on\nHOME > <b>Game Settings</b> > Security > <b>Allow HTTP Requests</b> :-)",
            ThemeColor = Color3.fromRGB(255, 0, 4),
            OnDismiss = function() -- Line: 87 -- upvalues: p1 (val)
                p1:setState({ShouldWarnAboutHttpService = false})
            end,
        })
    else
        v1 = nil
    end
    v4.HTTPEnabledNotification = v1
    v2.Container = createElement("Frame", v3, v4)
    return createElement("ScreenGui", {}, v2)
end
return v3