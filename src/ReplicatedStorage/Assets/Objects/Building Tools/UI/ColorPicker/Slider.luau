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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ColorPicker.Slider
--                              Dumped in 0.000973 seconds
--                          Bytecode version 9  |  12 functions

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
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Roact = require(Vendor:WaitForChild("Roact"))
local Cryo = require(Libraries:WaitForChild("Cryo"))
local Maid = require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 23 -- upvalues: Maid (val)
    p1.Maid = Maid.new()
end
function v3.willUnmount(p1) -- Line: 27 -- upvalues: ContextActionService (val)
    p1.Maid:Destroy()
    ContextActionService:UnbindAction("SliderDragging")
end
function v3.render(p1) -- Line: 32 -- upvalues: createElement (val), Roact (val), Cryo (val)
    local Value
    local v1 = {
        Active = false,
        Size = p1.props.Size,
        BackgroundColor3 = p1.props.BackgroundColor3,
        LayoutOrder = p1.props.LayoutOrder,
        AutoButtonColor = false,
        BorderSizePixel = 0,
    }
    v1[Roact.Event.InputBegan] = function(a1, p2) -- Line: 40 -- upvalues: p1 (val)
        if p2.UserInputType.Name == "MouseButton1" then
            p1:HandleDragInput(a1, p2)
            p1:ListenToDragEvents(a1)
        elseif p2.UserInputType.Name == "Touch" then
            p1:HandleDragInput(a1, p2)
            p1:ListenToDragEvents(a1)
        end
    end
    local join = Cryo.Dictionary.join
    local v2 = p1.props[Roact.Children]
    if not v2 then
        v2 = {}
    end
    local v3 = {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}
    local v4 = {BorderSizePixel = 0, ZIndex = 2, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if typeof(p1.props.Value) ~= "number" then
        Value = p1.props.Value:map(function(p1) -- Line: 57
            return UDim2.new(p1, 0, 0.5, 0)
        end)
    else
        Value = p1.props.Value
        if not Value then
            Value = p1.props.Value:map(function(p1) -- Line: 57
                return UDim2.new(p1, 0, 0.5, 0)
            end)
        end
    end
    v4.Position = Value
    v4.Size = UDim2.new(0, 4, 0, 4)
    v3.Thumb = createElement("Frame", v4, {Corners = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Shadow = createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(56, 56, 56),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 6, 0, 6),
    }, {Corners = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    return createElement("ImageButton", v1, join(v2, v3))
end
function v3.IsDragInput(p1) -- Line: 81
    local v1 = if p1.UserInputType.Name ~= "MouseMovement" then if p1.UserInputType.Name ~= "MouseButton1" then p1.UserInputType.Name == "Touch" else true else true
    return v1
end
function v3:ListenToDragEvents(p2) -- Line: 87 -- upvalues: ContextActionService (val), UserInputService (val)
    ContextActionService:BindAction("SliderDragging", function(p1, p2, p3) -- Line: 88
        return Enum.ContextActionResult.Sink
    end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
    local Maid = self.Maid
    Maid.DragChangeListener = UserInputService.InputChanged:Connect(function(p1) -- Line: 97 -- upvalues: self (val), p2 (val)
        if self.IsDragInput(p1) then
            self:HandleDragInput(p2, p1)
        end
    end)
    local Maid_2 = self.Maid
    Maid_2.DragEndListener = UserInputService.InputEnded:Connect(function(p1) -- Line: 102 -- upvalues: self (val), p2 (val), ContextActionService (upval)
        if self.IsDragInput(p1) then
            self:HandleDragInput(p2, p1)
            self.Maid.DragChangeListener = nil
            self.Maid.DragEndListener = nil
            ContextActionService:UnbindAction("SliderDragging")
        end
    end)
end
function v3:HandleDragInput(p2, p3) -- Line: 112
    local v1 = math.clamp((p3.Position.X - p2.AbsolutePosition.X) / p2.AbsoluteSize.X, 0, 1)
    self.props.OnValueChanged(v1)
end
return v3