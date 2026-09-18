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
--       File: ReplicatedStorage.Client.Interfaces.Components.Menu.Servers.Create
--                              Dumped in 0.000638 seconds
--                          Bytecode version 9  |  5 functions

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
return function(p1) -- Line: 29 -- upvalues: useMotion (val), react (val)
    local u4, v1
    v1, u4 = useMotion(0.73)
    local v2 = react.useCallback(function() -- Line: 32 -- upvalues: u4 (val)
        u4:spring(0.5)
    end, {})
    local v3 = react.useCallback(function() -- Line: 36 -- upvalues: u4 (val)
        u4:spring(0.73)
    end, {})
    local v4 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.8,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.111),
        LayoutOrder = 100,
    }
    v4[react.Event.MouseEnter] = v2
    v4[react.Event.MouseLeave] = v3
    local v5 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})}
    local v6 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = ""}
    v6[react.Event.MouseButton1Click] = function() -- Line: 60 -- upvalues: p1 (val)
        p1.Clicked()
    end
    v5.Button = react.createElement("TextButton", v6)
    v5.Title = react.createElement("TextLabel", {
        Text = "Create Server",
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0564, 0.219),
        Size = UDim2.fromScale(0.539, 0.274),
    })
    v5.Description = react.createElement("TextLabel", {
        Text = "Click here to create a new server.",
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0564, 0.505),
        Size = UDim2.fromScale(0.458, 0.233),
    })
    v5.Stroke = react.createElement("UIStroke", {Color = Color3.fromRGB(53, 53, 53)})
    v5.Border = react.createElement("ImageLabel", {
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
    return react.createElement("Frame", v4, v5)
end