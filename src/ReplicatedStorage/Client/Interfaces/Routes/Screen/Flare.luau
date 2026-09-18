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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Flare
--                               Dumped in 0.00107 seconds
--                          Bytecode version 9  |  7 functions

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
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local function ColorButton(p1) -- Line: 19 -- upvalues: useMotion (val), react (val)
    local u12, v1, v2, v3
    local color = p1.color
    local isSelected = p1.isSelected
    local onSelect = p1.onSelect
    if not p1.isSelected then
        v3 = 1
    else
        v3 = 0.1
    end
    v2, u12 = useMotion(v3)
    react.useEffect(function() -- Line: 27 -- upvalues: u12 (val), isSelected (val)
        local v1
        if not isSelected then
            v1 = 1
        else
            v1 = 0.1
        end
        u12:spring(v1)
    end, {p1.isSelected})
    local createElement = react.createElement
    local v4 = {BackgroundColor3 = p1.backgroundColor}
    if not isSelected then
        v1 = 0.35
    else
        v1 = 0.15
    end
    v4.BackgroundTransparency = v1
    if not isSelected then
        v1 = Color3.fromRGB(0, 0, 0)
    else
        v1 = Color3.fromRGB(255, 255, 255)
        if not v1 then
            v1 = Color3.fromRGB(0, 0, 0)
        end
    end
    v4.BorderColor3 = v1
    if not isSelected then
        v1 = 0
    else
        v1 = 2
    end
    v4.BorderSizePixel = v1
    v4.Size = UDim2.fromOffset(100, 100)
    v1 = {uICorner = react.createElement("UICorner", {CornerRadius = v2:map(function(p1) -- Line: 39
        return UDim.new(p1, 0)
    end)}), uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}
    local v5 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        TextTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
    }
    v5[react.Event.MouseButton1Click] = function() -- Line: 58 -- upvalues: onSelect (val), color (val)
        onSelect(color)
    end
    v1.textButton = react.createElement("TextButton", v5)
    return createElement("Frame", v4, v1)
end
return react.memo(function() -- Line: 67 -- upvalues: useInterfaceState (val), react (val), ColorButton (val)
    local flare, flare_2
    flare, flare_2 = useInterfaceState("flare")
    local v1 = flare_2
    if not v1 then
        v1 = {visible = false, color = "red"}
    end
    local v2 = v1
    local function handleColorSelect(p1) -- Line: 71 -- upvalues: flare (val)
        flare({visible = true, color = p1})
    end
    local v3 = {
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 14, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.00781, 0.987),
        Size = UDim2.fromScale(0.104, 0.117),
        Visible = v2.visible,
    }
    local v4 = {uICorner = react.createElement("UICorner"), uIGridLayout = react.createElement("UIGridLayout", {CellSize = UDim2.fromScale(0.31, 0.48), SortOrder = Enum.SortOrder.LayoutOrder})}
    local v5 = {color = "red", backgroundColor = Color3.fromRGB(162, 58, 60)}
    local v6 = v2.color == "red"
    v5.isSelected = v6
    v5.onSelect = handleColorSelect
    v4.red = react.createElement(ColorButton, v5)
    v4.uIPadding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})
    v5 = {color = "green", backgroundColor = Color3.fromRGB(29, 131, 36)}
    v6 = v2.color == "green"
    v5.isSelected = v6
    v5.onSelect = handleColorSelect
    v4.green = react.createElement(ColorButton, v5)
    v5 = {color = "blue", backgroundColor = Color3.fromRGB(56, 68, 230)}
    v6 = v2.color == "blue"
    v5.isSelected = v6
    v5.onSelect = handleColorSelect
    v4.blue = react.createElement(ColorButton, v5)
    v5 = {color = "yellow", backgroundColor = Color3.fromRGB(255, 228, 76)}
    v6 = v2.color == "yellow"
    v5.isSelected = v6
    v5.onSelect = handleColorSelect
    v4.yellow = react.createElement(ColorButton, v5)
    v5 = {color = "purple", backgroundColor = Color3.fromRGB(149, 66, 157)}
    v6 = v2.color == "purple"
    v5.isSelected = v6
    v5.onSelect = handleColorSelect
    v4.purple = react.createElement(ColorButton, v5)
    v5 = {color = "black", backgroundColor = Color3.fromRGB(40, 40, 40)}
    v6 = v2.color == "black"
    v5.isSelected = v6
    v5.onSelect = handleColorSelect
    v4.black = react.createElement(ColorButton, v5)
    v4.uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.46})
    v4.uISizeConstraint = react.createElement("UISizeConstraint", {MinSize = Vector2.new(200, 400)})
    return react.createElement("Frame", v3, v4)
end)