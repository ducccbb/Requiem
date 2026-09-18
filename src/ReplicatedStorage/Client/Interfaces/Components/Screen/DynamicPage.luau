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
--        File: ReplicatedStorage.Client.Interfaces.Components.Screen.DynamicPage
--                              Dumped in 0.000787 seconds
--                          Bytecode version 9  |  4 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks:WaitForChild("useTheme"))
local DynamicPageParticles = require(v1.Parent:WaitForChild("DynamicPageParticles"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
return function(p1) -- Line: 34 -- upvalues: useBlurEffect (val), useTheme (val), react (val), TransparencyGroup (val), DynamicPageParticles (val)
    local u3
    _, u3 = useBlurEffect()
    local v1 = useTheme()
    react.useEffect(function() -- Line: 38 -- upvalues: p1 (val), u3 (val)
        if not p1.Enabled then
            return
        end
        local u10 = u3("dynamic_page", 30, "set", 15, TweenInfo.new(0.3))
        return function() -- Line: 49 -- upvalues: u10 (val)
            u10(TweenInfo.new(0.3))
        end
    end, {p1.Enabled})
    return react.createElement(TransparencyGroup, {
        Enabled = p1.Enabled,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0, Disabled = 0.2},
    }, {Background = react.createElement("Frame", {ZIndex = -1, Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = v1.Background, BackgroundTransparency = p1.BackgroundTransparency or 0.1}, {
        Particles = react.createElement(DynamicPageParticles, {ZIndex = 1, Enabled = p1.Enabled, Color = Color3.fromRGB(255, 255, 255)}),
        Circle = react.createElement("ImageLabel", {
            Image = "rbxassetid://80886374823019",
            ImageTransparency = 0.95,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = v1.Accent,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.383, 0.604),
        }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}),
        Circle2 = react.createElement("ImageLabel", {
            Image = "rbxassetid://115008927542411",
            ImageTransparency = 0.95,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = v1.Accent,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.401, 0.633),
        }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}),
        Dotted = react.createElement("ImageLabel", {
            Image = "rbxassetid://127752913725408",
            ImageTransparency = 0.95,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = v1.Accent,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.421, 0.664),
        }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}),
        Vignette = react.createElement("ImageLabel", {
            Image = "rbxassetid://135589412519765",
            ImageTransparency = 0.68,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ImageColor3 = Color3.fromRGB(12, 17, 18),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(12, 17, 18),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.5, 1),
        }),
    })}, p1.children)
end