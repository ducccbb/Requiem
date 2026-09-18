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
--       File: ReplicatedStorage.Client.Interfaces.Components.Menu.Servers.Server
--                               Dumped in 0.00119 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local function Event(p1) -- Line: 35 -- upvalues: react (val)
    local v1 = {
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(45, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.615, 1),
        Visible = p1.Visible,
    }
    local v2 = {}
    local v3 = {}
    local v4 = {}
    local v5 = NumberSequenceKeypoint.new(0, 1)
    v4[1] = v5
    v4[2] = NumberSequenceKeypoint.new(1, 0)
    v3.Transparency = NumberSequence.new(v4)
    v2.Gradient = react.createElement("UIGradient", v3)
    v2.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})
    v2.Header = react.createElement("TextLabel", {
        Text = "PERMANENT DEATH",
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.28,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(118, 118, 118),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(1, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(61, 0, 1),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.867, 0.353),
        Size = UDim2.fromScale(0.545, 0.361),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 15), PaddingTop = UDim.new(0, 3)})})
    v3 = {
        Image = "rbxassetid://124811625794762",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(118, 118, 118),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.998, 0.5),
        Size = UDim2.fromOffset(61, 61),
    }
    local v6 = {}
    local v7 = {}
    local v8 = {}
    local v9 = NumberSequenceKeypoint.new(0, 0)
    local v10 = NumberSequenceKeypoint.new(0.467, 0)
    local v11 = NumberSequenceKeypoint.new(0.547, 1)
    v8[1] = v9
    v8[2] = v10
    v8[3] = v11
    v8[4] = NumberSequenceKeypoint.new(1, 1)
    v7.Transparency = NumberSequence.new(v8)
    v6.Gradient = react.createElement("UIGradient", v7)
    v2.Skull = react.createElement("ImageLabel", v3, v6)
    v2.Host = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.28,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "Hosted by " .. tostring(p1.Host),
        TextColor3 = Color3.fromRGB(118, 118, 118),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(1, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(61, 0, 1),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.867, 0.638),
        Size = UDim2.fromScale(0.524, 0.348),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 15), PaddingTop = UDim.new(0, 3)})})
    return react.createElement("Frame", v1, v2)
end
return function(p1) -- Line: 143 -- upvalues: useMotion (val), react (val), Event (val)
    local u4, v1
    v1, u4 = useMotion(0.73)
    local v2 = tostring(p1.Players) .. " Players"
    local v3 = v2
    local v4 = false
    if p1.Queue == 1 then
        v3 = v2 .. ("<font transparency=\"0.8\"> | %* Queued</font>"):format((tostring(p1.Queued or 0)))
        v4 = true
    end
    local v5 = react.useCallback(function() -- Line: 155 -- upvalues: u4 (val)
        u4:spring(0.5)
    end, {})
    local v6 = react.useCallback(function() -- Line: 159 -- upvalues: u4 (val)
        u4:spring(0.73)
    end, {})
    local v7 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.8,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.111),
    }
    v7[react.Event.MouseEnter] = v5
    v7[react.Event.MouseLeave] = v6
    local v8 = {}
    local Event_2 = p1.Event
    if Event_2 then
        Event_2 = react.createElement(Event, p1.Event)
    end
    v8.Event = Event_2
    local v9 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = ""}
    v9[react.Event.MouseButton1Click] = function() -- Line: 180 -- upvalues: p1 (val)
        p1.Clicked()
    end
    v8.Button = react.createElement("TextButton", v9)
    v8.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})
    v8.Server = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0564, 0.219),
        Size = UDim2.fromScale(0.539, 0.274),
    })
    v8.Players = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = v3,
        RichText = v4,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0564, 0.505),
        Size = UDim2.fromScale(0.458, 0.233),
    })
    v8.Stroke = react.createElement("UIStroke", {Color = Color3.fromRGB(53, 53, 53)})
    v8.Border = react.createElement("ImageLabel", {
        Image = "rbxassetid://132892752874729",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageTransparency = v1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(287, 219, 357, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -5, 1, -5),
    })
    return react.createElement("Frame", v7, v8)
end