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
--    File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Container
--                               Dumped in 0.00108 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Layouts = v1.Parent:WaitForChild("Layouts")
local Horizontal = require(Layouts:WaitForChild("Horizontal"))
local Layouts_2 = v1.Parent:WaitForChild("Layouts")
local Vertical = require(Layouts_2:WaitForChild("Vertical"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
return react.memo(function(p1) -- Line: 39 -- upvalues: useConstants (val), react (val), FillProps (val), Vertical (val), Horizontal (val)
    local AnchorPoint, Position_2, u18, v1, v2
    local v3 = useConstants().Padding.Universal[p1.Padding or "Large"]
    local Position = p1.Position
    if not Position then
        Position = UDim2.fromScale(0.5, 0.5)
    end
    v2, u18 = react.useBinding(Position)
    local u22 = react.useRef(false)
    local u29 = react.useRef(Vector2.new(0, 0))
    local u33 = react.useRef(nil)
    local v4 = react.useCallback(function(a1, p2) -- Line: 49 -- upvalues: p1 (val), u33 (val), u22 (val), u29 (val)
        if not p1.Draggable or p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        local current = u33.current
        if not current or not current.Parent then
            return
        end
        u22.current = true
        local AnchorPoint = p1.AnchorPoint
        if not AnchorPoint then
            AnchorPoint = Vector2.new(0.5, 0.5)
        end
        u29.current = Vector2.new(p2.Position.X - (current.AbsolutePosition.X + current.AbsoluteSize.X * AnchorPoint.X), p2.Position.Y - (current.AbsolutePosition.Y + current.AbsoluteSize.Y * AnchorPoint.Y))
    end, {p1.Draggable, p1.AnchorPoint})
    local v5 = react.useCallback(function(a1, p2) -- Line: 73 -- upvalues: p1 (val), u22 (val), u33 (val), u29 (val), u18 (val)
        local Parent, current
        if not p1.Draggable or not u22.current or p2.UserInputType ~= Enum.UserInputType.MouseMovement then
            return
        end
        current = u33.current
        if not current or not current.Parent then
            return
        end
        Parent = current.Parent
        local AbsolutePosition = Parent.AbsolutePosition
        local AbsoluteSize = Parent.AbsoluteSize
        u18(UDim2.fromScale((p2.Position.X - u29.current.X - AbsolutePosition.X) / AbsoluteSize.X, (p2.Position.Y - u29.current.Y - AbsolutePosition.Y) / AbsoluteSize.Y))
    end, {p1.Draggable})
    local v6 = react.useCallback(function(a1, p2) -- Line: 100 -- upvalues: p1 (val), u22 (val)
        if not p1.Draggable then
            return
        end
        if p2.UserInputType == Enum.UserInputType.MouseButton1 then
            u22.current = false
        end
    end, {p1.Draggable})
    react.useEffect(function() -- Line: 110 -- upvalues: u33 (val)
        if not u33.current then
            return
        end
        u33.current:SetAttribute("no_click", true)
    end, {u33, u33.current})
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v7 = {AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = Color3.fromRGB(14, 14, 17), BackgroundTransparency = 0.03}
    AnchorPoint = p1.AnchorPoint
    if not AnchorPoint then
        AnchorPoint = Vector2.new(0.5, 0.5)
    end
    v7.AnchorPoint = AnchorPoint
    if not p1.Draggable then
        Position_2 = p1.Position
        if not Position_2 then
            Position_2 = UDim2.fromScale(0.5, 0.5)
        end
    else
        Position_2 = v2
    end
    v7.Position = Position_2
    v7.ref = u33
    local InputBegan = react.Event.InputBegan
    if not p1.Draggable then
        v1 = nil
    else
        v1 = v4
    end
    v7[InputBegan] = v1
    local InputChanged = react.Event.InputChanged
    if not p1.Draggable then
        v1 = nil
    else
        v1 = v5
    end
    v7[InputChanged] = v1
    local InputEnded = react.Event.InputEnded
    if not p1.Draggable then
        v1 = nil
    else
        v1 = v6
    end
    v7[InputEnded] = v1
    local v8 = FillProps(Native, v7)
    local v9 = {Padding = react.createElement("UIPadding", v3), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}
    if p1.Layout == "Vertical" then
        v7 = react.createElement(Vertical, {Spacing = p1.Spacing or 5})
    elseif p1.Layout ~= "Horizontal" then
        v7 = nil
    else
        v7 = react.createElement(Horizontal, {Spacing = p1.Spacing or 5})
        if not v7 then
            v7 = nil
        end
    end
    v9.Layout = v7
    return createElement("Frame", v8, v9, p1.children)
end)