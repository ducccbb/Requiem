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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock.AboutPane
--                              Dumped in 0.000909 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
v2 = v1:FindFirstAncestorWhichIsA("Tool")
local Vendor = v2:WaitForChild("Vendor")
local UI = v2:WaitForChild("UI")
local Libraries = v2:WaitForChild("Libraries")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local ToolManualWindow = require(UI:WaitForChild("ToolManualWindow"))
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 43 -- upvalues: Roact (val), Maid (val)
    local v1, v2
    v1, v2 = Roact.createBinding(UDim2.new())
    p1.DockSize = v1
    p1.SetDockSize = v2
    p1.Maid = Maid.new()
end
function v3.willUnmount(p1) -- Line: 48
    p1.Maid:Destroy()
end
function v3.render(p1) -- Line: 52 -- upvalues: createElement (val), Roact (val), UserInputService (val), GuiService (val), ToolManualWindow (val)
    local v1
    local v2 = {
        Image = "",
        BackgroundTransparency = 0.75,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = p1.props.LayoutOrder,
        Size = UDim2.new(1, 0, 0, 32),
    }
    v2[Roact.Event.Activated] = function(a1) -- Line: 59 -- upvalues: p1 (val)
        p1:setState({IsManualOpen = not p1.state.IsManualOpen})
    end
    v2[Roact.Event.MouseButton1Down] = function(a1) -- Line: 64 -- upvalues: UserInputService (upval), GuiService (upval), p1 (val)
        local Parent = a1.Parent
        local MouseLocation = UserInputService:GetMouseLocation()
        local u10 = MouseLocation - GuiService:GetGuiInset()
        local Position = Parent.Position
        p1.Maid.DockDragging = UserInputService.InputChanged:Connect(function(p1) -- Line: 69 -- upvalues: u10 (val), a1 (val), Parent (val), Position (val)
            if p1.UserInputType.Name == "MouseMovement" then
                local v1 = Vector2.new(p1.Position.X, p1.Position.Y)
                if 3 < (v1 - u10).Magnitude then
                    a1.Active = false
                end
                Parent.Position = UDim2.new(Position.X.Scale, Position.X.Offset + (p1.Position.X - u10.X), Position.Y.Scale, Position.Y.Offset + (p1.Position.Y - u10.Y))
            elseif p1.UserInputType.Name ~= "Touch" then
            end
        end)
        p1.Maid.DockDraggingEnd = UserInputService.InputEnded:Connect(function(a1_2) -- Line: 87 -- upvalues: p1 (upval), a1 (val)
            if a1_2.UserInputType.Name == "MouseButton1" then
                p1.Maid.DockDragging = nil
                p1.Maid.DockDraggingEnd = nil
                a1.Active = true
            elseif a1_2.UserInputType.Name == "Touch" then
                p1.Maid.DockDragging = nil
                p1.Maid.DockDraggingEnd = nil
                a1.Active = true
            end
        end)
    end
    local v3 = {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), Signature = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://2326685066",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.new(1, 0, 0, 13),
        Position = UDim2.new(0, 6, 0.5, 0),
    }, {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 2.385})}), HelpIcon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://141911973",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(0, 30, 0, 30),
    })}
    local v4 = {target = p1.props.Core.UI}
    local v5 = {}
    if p1.state.IsManualOpen then
        v1 = createElement(ToolManualWindow, {Text = "<font face=\"GothamBlack\" size=\"16\">Building Tools by F3X  🛠</font>\nTo learn more about each tool, click on its ❔ icon at the top right corner.<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Selecting</b></font>\n <font color=\"rgb(150, 150, 150)\">•</font> Select individual parts by holding <b>Shift</b> and clicking each one.\n <font color=\"rgb(150, 150, 150)\">•</font> Rectangle select parts by holding <b>Shift</b>, clicking, and dragging.\n <font color=\"rgb(150, 150, 150)\">•</font> Press <b>Shift-K</b> to select parts inside of the selected parts.\n <font color=\"rgb(150, 150, 150)\">•</font> Press <b>Shift-R</b> to clear your selection.<font size=\"12\"><br /></font>\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Grouping</b></font>\n<font color=\"rgb(150, 150, 150)\">•</font> Group parts as a <i>model</i> by pressing <b>Shift-G</b>.\n<font color=\"rgb(150, 150, 150)\">•</font> Group parts into a <i>folder</i> by pressing <b>Shift-F</b>.\n<font color=\"rgb(150, 150, 150)\">•</font> Ungroup parts by pressing <b>Shift-U</b>.<font size=\"12\"><br /></font>\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Exporting your creations</b></font>\nYou can export your builds into a short code by clicking the export button, or pressing <b>Shift-P</b>.<font size=\"8\"><br /></font>\nInstall the import plugin in <b>Roblox Studio</b> to import your creation:\n<font color=\"rgb(150, 150, 150)\">roblox.com/library/142485815</font>", ThemeColor = Color3.fromRGB(255, 176, 0)})
    else
        v1 = nil
    end
    v5.ManualWindow = v1
    v3.ManualWindowPortal = createElement(Roact.Portal, v4, v5)
    return createElement("ImageButton", v2, v3)
end
return v3