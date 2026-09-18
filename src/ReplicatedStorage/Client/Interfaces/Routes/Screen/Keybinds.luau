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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Keybinds
--                               Dumped in 0.00171 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local function Keybind(p1) -- Line: 18 -- upvalues: react (val)
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.963),
        Size = UDim2.fromOffset(294, 31),
    }
    local v2 = {}
    local v3 = {BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BorderColor3 = Color3.fromRGB(0, 0, 0), Size = UDim2.fromScale(1.01, 1)}
    local v4 = {}
    local v5 = {}
    local v6 = {}
    local v7 = NumberSequenceKeypoint.new(0, 1)
    v6[1] = v7
    v6[2] = NumberSequenceKeypoint.new(1, 0.107)
    v5.Transparency = NumberSequence.new(v6)
    v4.uIGradient = react.createElement("UIGradient", v5)
    v4.label = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        Text = p1.Label,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(-0.0202, 6, 0.468, 0),
        Size = UDim2.fromScale(0.815, 0.592),
    })
    v4.keybind = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 14, 16),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.933, 0.468),
        Size = UDim2.fromScale(0.135, 1.29),
    }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint"), button = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = string.upper(p1.Keybind.Name),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 0.7),
    }), uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})})
    v4.extend = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.862, -0.004),
        Size = UDim2.new(0, 3, 1, 0),
    })
    v2.content = react.createElement("Frame", v3, v4)
    return react.createElement("Frame", v1, v2)
end
return function() -- Line: 105 -- upvalues: useInterfaceState (val), react (val), Keybind (val)
    local cooldowns_2, disabledControls_2, keybinds_2
    _, keybinds_2 = useInterfaceState("keybinds")
    _, cooldowns_2 = useInterfaceState("cooldowns")
    _, disabledControls_2 = useInterfaceState("disabledControls")
    local v1 = {}
    local v2 = keybinds_2
    if not v2 then
        v2 = {visible = false, binds = {}}
    end
    local v3 = v2
    v2 = disabledControls_2
    if not v2 then
        v2 = {}
    end
    for k, v in pairs(v3.binds) do
        if not (cooldowns_2[k]) and not (v2[k]) then
            v1[k] = react.createElement(Keybind, {Keybind = v, Label = k})
        end
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -10, 1, -300),
        Size = UDim2.fromOffset(294, 842),
        Visible = v3.visible,
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 15), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom})}, v1)
end