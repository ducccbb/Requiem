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
--         File: ReplicatedStorage.Client.Interfaces.Components.Displays.Compass
--                              Dumped in 0.000710 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return {
    CreateCompassNodeFrame = function(p1, p2) -- Line: 14
        local CanvasGroup = Instance.new("CanvasGroup")
        CanvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
        local color = p2.color
        if not color then
            color = Color3.fromRGB(0, 0, 0)
        end
        CanvasGroup.BackgroundColor3 = color
        CanvasGroup.BackgroundTransparency = 0
        CanvasGroup.BorderSizePixel = 0
        CanvasGroup.Name = p1
        CanvasGroup.Position = UDim2.fromScale(0.5, 0.5)
        CanvasGroup.Size = UDim2.fromScale(0.055, 0.7)
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
        UIAspectRatioConstraint.AspectRatio = 1
        UIAspectRatioConstraint.Parent = CanvasGroup
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(1, 0)
        UICorner.Parent = CanvasGroup
        local TextLabel = Instance.new("TextLabel")
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Font = Enum.Font.SourceSansBold
        TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        TextLabel.Name = "north"
        TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
        TextLabel.Text = string.upper(p1)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14
        TextLabel.TextWrapped = true
        TextLabel.Visible = false
        TextLabel.Parent = CanvasGroup
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel.BackgroundTransparency = 1
        local icon = p2.icon
        if icon == nil then
            icon = "rbxassetid://11422924261"
        end
        ImageLabel.Image = icon
        ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        ImageLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
        ImageLabel.Parent = CanvasGroup
        local v1 = p2.icon ~= nil
        ImageLabel.Visible = v1
        ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        return CanvasGroup
    end,
    CreateCompassDirectionFrame = function(p1) -- Line: 61
        local CanvasGroup = Instance.new("CanvasGroup")
        CanvasGroup.Name = p1
        CanvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
        CanvasGroup.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        CanvasGroup.BackgroundTransparency = 1
        CanvasGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
        CanvasGroup.BorderSizePixel = 0
        CanvasGroup.Position = UDim2.fromScale(0.5, 0.5)
        CanvasGroup.Size = UDim2.fromScale(0.054, 0.769)
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
        UIAspectRatioConstraint.AspectRatio = 1
        UIAspectRatioConstraint.Parent = CanvasGroup
        local Frame = Instance.new("Frame")
        Frame.Name = "label"
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BackgroundTransparency = 0.45
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.fromScale(0.5, 0.5)
        Frame.Size = UDim2.fromScale(1, 1)
        local UICorner = Instance.new("UICorner")
        UICorner.Name = "UICorner"
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Frame
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "north"
        TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        TextLabel.Text = string.upper(p1)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14
        TextLabel.TextWrapped = true
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.fromScale(0.5, 0.5)
        TextLabel.Size = UDim2.fromScale(0.8, 0.8)
        TextLabel.Parent = Frame
        Frame.Parent = CanvasGroup
        return CanvasGroup
    end,
    CompassComponent = function(p1) -- Line: 108 -- upvalues: react (val)
        return react.createElement(react.Fragment, {}, {Compass = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.00671),
            Size = UDim2.fromScale(0.45, 0.0556),
            Visible = p1.Visible,
            ref = p1.Ref,
        })})
    end,
}