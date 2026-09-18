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
--                             File: ReplicatedFirst.Loading
--                               Dumped in 0.00134 seconds
--                          Bytecode version 9  |  2 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")
require(script.Parent:WaitForChild("Profiling"))
if StarterGui:GetAttribute("LOADING_SCREEN") or _G.LOADING_SCREEN or shared.LOADING_SCREEN then
    return
end
shared.LOADING_SCREEN = true
_G.LOADING_SCREEN = true
StarterGui:SetAttribute("LOADING_SCREEN", true)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
local StarterGui_2 = game:GetService("StarterGui")
StarterGui_2:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
local GuiService = game:GetService("GuiService")
GuiService.AutoSelectGuiEnabled = false
local Frame = Instance.new("Frame")
Frame.Name = "Screen"
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(1, 2, 11)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.fromScale(0.5, 0.5)
Frame.Size = UDim2.fromScale(1.5, 1.5)
local Frame_2 = Instance.new("Frame")
Frame_2.Name = "Loading"
Frame_2.AnchorPoint = Vector2.new(0.5, 1)
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BackgroundTransparency = 0.75
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.fromScale(0.5, 0.744)
Frame_2.Size = UDim2.fromScale(0.303, 0.00865)
Frame_2.ZIndex = 7
local Frame_3 = Instance.new("Frame")
Frame_3.Name = "Bar"
Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_3.BackgroundColor3 = Color3.fromRGB(189, 189, 189)
Frame_3.BackgroundTransparency = 0.7
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.fromScale(0.499, 0.5)
Frame_3.Size = UDim2.fromScale(1, 1)
local Frame_4 = Instance.new("Frame")
Frame_4.Name = "Fill"
Frame_4.AnchorPoint = Vector2.new(0, 0.5)
Frame_4.BackgroundColor3 = Color3.fromRGB(10, 31, 76)
Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.fromScale(0, 0.5)
Frame_4.Size = UDim2.fromScale(0, 1)
Frame_4.Parent = Frame_3
Frame_3.Parent = Frame_2
local UIPadding = Instance.new("UIPadding")
UIPadding.Name = "UIPadding"
UIPadding.PaddingBottom = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = Frame_2
local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 0.7
UIStroke.Parent = Frame_2
local Frame_5 = Instance.new("Frame")
Frame_5.Name = "Frame"
Frame_5.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_5.BackgroundTransparency = 1
Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.fromScale(0.499, 0.5)
Frame_5.Size = UDim2.new(1, 20, 1, 20)
local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Name = "UIStroke"
UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
UIStroke_2.Transparency = 0.8
UIStroke_2.Parent = Frame_5
Frame_5.Parent = Frame_2
Frame_2.Parent = Frame
local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "TextLabel"
TextLabel.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json")
TextLabel.Text = "Loading Assets"
TextLabel.TextColor3 = Color3.fromRGB(229, 229, 229)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextTransparency = 0.18
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.fromScale(0.5, 0.721)
TextLabel.Size = UDim2.fromScale(0.303, 0.0127)
TextLabel.ZIndex = 8
TextLabel.Parent = Frame
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Image = "rbxassetid://135024828537951"
ImageLabel.ImageTransparency = 0.95
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.fromScale(0.481, 0.5)
ImageLabel.Size = UDim2.fromScale(0.8, 0.8)
ImageLabel.Visible = false
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint.AspectRatio = 1.78
UIAspectRatioConstraint.Parent = ImageLabel
ImageLabel.Parent = Frame
local ImageLabel_2 = Instance.new("ImageLabel")
ImageLabel_2.Name = "ImageLabel"
ImageLabel_2.Image = "rbxassetid://135589412519765"
ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(12, 17, 18)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5)
ImageLabel_2.Size = UDim2.fromScale(1.5, 1)
ImageLabel_2.ZIndex = 3
ImageLabel_2.Parent = Frame
local ImageLabel_3 = Instance.new("ImageLabel")
ImageLabel_3.Name = "ImageLabel"
ImageLabel_3.Image = "rbxassetid://135589412519765"
ImageLabel_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(12, 17, 18)
ImageLabel_3.BackgroundTransparency = 1
ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.BorderSizePixel = 0
ImageLabel_3.Position = UDim2.fromScale(0.5, 0.5)
ImageLabel_3.Size = UDim2.fromScale(1.5, 1)
ImageLabel_3.ZIndex = 3
ImageLabel_3.Parent = Frame
local ImageLabel_4 = Instance.new("ImageLabel")
ImageLabel_4.Name = "ImageLabel"
ImageLabel_4.Image = "rbxassetid://70767138808432"
ImageLabel_4.ImageColor3 = Color3.fromRGB(35, 95, 173)
ImageLabel_4.ImageTransparency = 0.97
ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_4.BackgroundTransparency = 1
ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_4.BorderSizePixel = 0
ImageLabel_4.Position = UDim2.fromScale(0.5, 0.5)
ImageLabel_4.Size = UDim2.fromOffset(3000, 3000)
ImageLabel_4.ZIndex = 2
ImageLabel_4.Parent = Frame
Frame.Parent = ScreenGui
ScreenGui.Name = "Loading"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local v3 = ScreenGui:Clone()
v3.Name = "Teleport"
local Screen = v3:WaitForChild("Screen")
Screen.Visible = false
v3.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TeleportService:SetTeleportGui(v3)
while true do
    v1 = pcall(function() -- Line: 200 -- upvalues: StarterGui (val)
        StarterGui:SetCore("ResetButtonCallback", false)
    end)
    task.wait(1)
    if v1 then
        break
    end
end