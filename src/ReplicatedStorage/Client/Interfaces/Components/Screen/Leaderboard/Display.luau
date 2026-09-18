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
--    File: ReplicatedStorage.Client.Interfaces.Components.Screen.Leaderboard.Display
--                               Dumped in 0.00105 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return function(p1) -- Line: 22 -- upvalues: react (val)
    return react.createElement(react.Fragment, {}, {Frame = react.createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(29, 31, 37),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(-0.0146, -0.00598),
        Size = UDim2.fromScale(1.01, 0.148),
    }, {
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}),
        frame2 = react.createElement("Frame", {
            BackgroundTransparency = 0.25,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(29, 31, 37),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(-0.022, 0.5),
            Size = UDim2.fromScale(0.176, 0.993),
        }, {(react.createElement("UIAspectRatioConstraint")), uICorner1 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), imageLabel = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = p1.Icon,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
        })}),
        uIPadding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 2)}),
        container = react.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(37, 39, 47),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.485, 0.681),
            Size = UDim2.fromScale(0.894, 0.0718),
        }, {uICorner2 = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), container1 = react.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(151, 255, 135),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.574),
            Size = UDim2.fromScale(p1.Health / p1.MaxHealth, 0.947),
        }, {uICorner3 = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}), uIAspectRatioConstraint2 = react.createElement("UIAspectRatioConstraint", {AspectRatio = 71.1})}),
        textLabel = react.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = p1.Username,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.0427, 0.2),
            Size = UDim2.fromScale(0.84, 0.373),
        }),
    })})
end