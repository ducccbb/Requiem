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
--    File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Checkbox
--                              Dumped in 0.000859 seconds
--                          Bytecode version 9  |  5 functions

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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
return react.memo(function(p1) -- Line: 39 -- upvalues: react (val), useTextScale (val), useRem (val), FillProps (val)
    local u4, u5, v1, v2
    u4, u5 = react.useState(p1.Default)
    local v3 = useTextScale()
    local v4 = useRem()
    local v5 = p1.Upscale or 1
    react.useEffect(function() -- Line: 47 -- upvalues: u5 (val), p1 (val)
        u5(p1.Default)
    end, {p1.Default})
    react.useEffect(function() -- Line: 52 -- upvalues: p1 (val), u4 (val)
        if p1.Toggled then
            p1.Toggled(u4)
        end
    end, {u4})
    local v6 = react.useCallback(function() -- Line: 58 -- upvalues: u5 (val), u4 (val)
        u5(not u4)
    end, {u4})
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v7 = FillProps(Native, {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(0, v4(14 * v5))})
    local v8 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5 * v5),
    })}
    local Label = p1.Label
    if Label then
        Label = react.createElement("TextLabel", {
            TextTransparency = 0.32,
            BackgroundTransparency = 1,
            ZIndex = 3,
            RichText = true,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = p1.Label,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v3(14 * v5),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromOffset(0, v4(14 * v5)),
            AutomaticSize = Enum.AutomaticSize.X,
        })
    end
    v8.Label = Label
    local createElement_2 = react.createElement
    local v9 = {BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(43, 177, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), Position = UDim2.fromScale(0, 0)}
    local v10 = v4(12 * v5)
    v9.Size = UDim2.fromOffset(v10, v4(12 * v5))
    if not u4 then
        v1 = 1
    else
        v1 = 0
    end
    v9.BackgroundTransparency = v1
    v1 = {}
    local createElement_3 = react.createElement
    local v11 = {Transparency = 0.73, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}
    if not u4 then
        v2 = Color3.fromRGB(200, 200, 200)
    else
        v2 = Color3.fromRGB(0, 0, 0)
        if not v2 then
            v2 = Color3.fromRGB(200, 200, 200)
        end
    end
    v11.Color = v2
    v1.Stroke = createElement_3("UIStroke", v11)
    v1.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4 * v5)})
    v11 = {BackgroundTransparency = 1, TextTransparency = 1, Text = "", Size = UDim2.fromScale(1.5, 1.5)}
    v11[react.Event.MouseButton1Click] = v6
    v1.Hitbox = react.createElement("TextButton", v11)
    v1.Checkmark = react.createElement("ImageLabel", {
        Image = "rbxassetid://17153645795",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.6),
        Visible = u4,
    })
    v1.Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.972})
    v8.Checkbox = createElement_2("Frame", v9, v1)
    return createElement("Frame", v7, v8)
end)