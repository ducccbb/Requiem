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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Tools.Gizmo
--                               Dumped in 0.00182 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Chunk = Common_2:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Icon = require(Universal_2:WaitForChild("Icon"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildEnabled = require(Hooks:WaitForChild("useBuildEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSandbox = require(Hooks_2:WaitForChild("useBuildSandbox"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildTool = require(Hooks_3:WaitForChild("useBuildTool"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_3:WaitForChild("Hooks")
local useOrder = require(Hooks_4:WaitForChild("useOrder"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_4:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
return function() -- Line: 34 -- upvalues: useRem (val), useBuildTool (val), useBuildSandbox (val), useBuildEnabled (val), react (val), RunService (val), Workspace (val), Zone (val), useOrder (val), Container (val), Icon (val), Signals (val)
    local u13, u17, u18, u4, v1, v2
    local v3 = useRem()
    v1, u4 = useBuildTool()
    local u6 = useBuildSandbox()
    local u8 = useBuildEnabled()
    v2, u13 = react.useState(false)
    u17, u18 = react.useState(nil)
    react.useEffect(function() -- Line: 44 -- upvalues: u8 (val), u6 (val), RunService (upval), Workspace (upval), Zone (upval), u13 (val), u18 (val)
        local u0 = nil
        if not u8 then
            u13(false)
        elseif u6 then
            u13(false)
        else
            u0 = RunService.RenderStepped:Connect(function() -- Line: 48 -- upvalues: Workspace (upval), Zone (upval), u13 (upval), u18 (upval)
                local v1, v2
                local v3 = Zone.getZoneFromPosition(Workspace.CurrentCamera.CFrame.Position)
                v1, v2 = Zone.canAccessZone(v3)
                if not v1 then
                    u13(false)
                elseif not v2 then
                    u13(false)
                else
                    u13(true)
                end
                u18(Zone.getZoneId(v3))
            end)
        end
        return function() -- Line: 68 -- upvalues: u0 (ref)
            if u0 then
                u0:Disconnect()
            end
        end
    end, {u8, u6})
    local v4 = useOrder()
    local createElement = react.createElement
    local v5 = {BackgroundTransparency = 1}
    local v6 = v3(265)
    v5.Size = UDim2.fromOffset(v6, v3(50))
    v5.AnchorPoint = Vector2.new(0, 1)
    v6 = UDim2.fromScale(0, 1)
    local v7 = v3(265)
    v5.Position = v6 + UDim2.fromOffset(v7, -v3(330))
    local v8 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v3(5)),
    })}
    local createElement_2 = react.createElement
    v7 = {Padding = "Large", Layout = "Horizontal", Spacing = 20}
    local v9 = {AnchorPoint = Vector2.new(0, 1)}
    local v10 = UDim2.fromScale(0, 1)
    local v11 = v3(265)
    v9.Position = v10 + UDim2.fromOffset(v11, -v3(330))
    v7.Native = v9
    v9 = {}
    local v12 = {Image = "rbxassetid://12974400739"}
    v11 = v1 == "Mouse"
    v12.Selected = v11
    function v12.Clicked() -- Line: 106 -- upvalues: u4 (val)
        u4("Mouse")
    end
    v11 = {LayoutOrder = v4()}
    v12.Native = v11
    v9.Mouse = react.createElement(Icon, v12)
    v12 = {Image = "rbxassetid://12967714846"}
    v11 = v1 == "Move"
    v12.Selected = v11
    function v12.Clicked() -- Line: 117 -- upvalues: u4 (val)
        u4("Move")
    end
    v11 = {LayoutOrder = v4()}
    v12.Native = v11
    v9.Move = react.createElement(Icon, v12)
    v12 = {Image = "rbxassetid://11419705585"}
    v11 = v1 == "Rotate"
    v12.Selected = v11
    function v12.Clicked() -- Line: 128 -- upvalues: u4 (val)
        u4("Rotate")
    end
    v11 = {LayoutOrder = v4()}
    v12.Native = v11
    v9.Rotate = react.createElement(Icon, v12)
    local v13 = u6
    if v13 then
        v12 = {Image = "rbxassetid://11430238329", Disabled = true}
        v11 = v1 == "Stamp"
        v12.Selected = v11
        v12.Native = {LayoutOrder = v4()}
        v13 = react.createElement(Icon, v12)
    end
    v9.Stamp = v13
    v8.Tools = createElement_2(Container, v7, v9)
    v6 = not u6
    if v6 then
        v6 = v2
        if v6 then
            v7 = {Padding = "Large", Layout = "Horizontal", Spacing = 20}
            v9 = {AnchorPoint = Vector2.new(0, 1)}
            v10 = UDim2.fromScale(0, 1)
            v11 = v3(265)
            v9.Position = v10 + UDim2.fromOffset(v11, -v3(330))
            v7.Native = v9
            v6 = react.createElement(Container, v7, {ManageAccess = react.createElement(Icon, {
                Image = "rbxassetid://11422144827",
                Clicked = function() -- Line: 156 -- upvalues: Signals (upval), u17 (val)
                    Signals.Editor.Building.UpdateZonePermissionPage:Fire(u17)
                end,
                Native = {LayoutOrder = v4()},
            })})
        end
    end
    v8.Access = v6
    v6 = u6
    if v6 then
        v7 = {Padding = "Large", Layout = "Horizontal", Spacing = 20}
        v9 = {AnchorPoint = Vector2.new(0, 1)}
        v10 = UDim2.fromScale(0, 1)
        v11 = v3(265)
        v9.Position = v10 + UDim2.fromOffset(v11, -v3(330))
        v7.Native = v9
        v9 = {}
        v12 = {Image = "rbxassetid://12974227834"}
        v11 = v1 == "AddPlot"
        v12.Selected = v11
        function v12.Clicked() -- Line: 180 -- upvalues: u4 (val)
            u4("AddPlot")
        end
        v11 = {LayoutOrder = v4()}
        v12.Native = v11
        v9.AddPlot = react.createElement(Icon, v12)
        v12 = {Image = "rbxassetid://12966398330"}
        v11 = v1 == "RemovePlot"
        v12.Selected = v11
        function v12.Clicked() -- Line: 191 -- upvalues: u4 (val)
            u4("RemovePlot")
        end
        v12.Native = {LayoutOrder = v4()}
        v9.RemovePlot = react.createElement(Icon, v12)
        v6 = react.createElement(Container, v7, v9)
    end
    v8.Plots = v6
    return createElement("Frame", v5, v8)
end