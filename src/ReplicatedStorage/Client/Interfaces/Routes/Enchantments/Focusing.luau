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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Enchantments.Focusing
--                               Dumped in 0.00283 seconds
--                          Bytecode version 9  |  11 functions

local u207, u210
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useThrottleCallback = require(Hooks_4:WaitForChild("useThrottleCallback"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Statistics = Common:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Statistics_2 = Common_2:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
_, u207 = useBlurEffect()
_, u210 = useFieldOfView()
local u211 = nil
local u212 = nil
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
ColorCorrectionEffect.Parent = Lighting
local u216 = 300
return function() -- Line: 60 -- upvalues: useInterfaceState (val), useMotion (val), useRem (val), react (val), useThrottleCallback (val), CollectionService (val), Players (val), u216 (ref), ClientAttributesHandler (val), UserInputService (val), Workspace (val), u211 (ref), u210 (val), TweenService (val), ColorCorrectionEffect (val), u212 (ref), u207 (val), RunService (val), Frame (val), TransparencyGroup (val)
    local Focusing, u10, u11, u17, u18, u26, u30, u31, u7, v1, v2, v3, v4, v5
    _, Focusing = useInterfaceState("Focusing")
    v2, u7 = useMotion(1)
    u10, u11 = useMotion(1)
    local u13 = useRem()
    u17, u18 = react.useBinding(0)
    v5, u26 = react.useBinding(UDim2.fromOffset(0, 0))
    u30, u31 = react.useState(nil)
    if Focusing == nil then
        Focusing = false
    end
    local v6 = {wait = 0.02}
    local u38 = useThrottleCallback(function(p1, p2) -- Line: 77 -- upvalues: CollectionService (upval), Players (upval), u216 (upval), ClientAttributesHandler (upval), u13 (val), u10 (val), UserInputService (upval), Workspace (upval)
        local Magnitude, MouseLocation, unit, v1, v2, v3, v4, v5, v6
        local Tagged = CollectionService:GetTagged("Focusable")
        local Character = Players.LocalPlayer.Character
        local HumanoidRootPart = Character
        if HumanoidRootPart then
            HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        end
        if not Character or not HumanoidRootPart then
            return
        end
        u216 = ClientAttributesHandler.getAttribute("GrappleFocusAimCircleRadius") * 300
        local CurrentCamera = workspace.CurrentCamera
        local v7 = u13(u216 * u10:getValue())
        local huge = math.huge
        local v8 = nil
        for k, v in pairs(Tagged) do
            unit = (v.Position - CurrentCamera.CFrame.Position).unit
            v2 = math.acos((unit:Dot(CurrentCamera.CFrame.LookVector)))
            v1 = v2 * (180 / math.pi)
            if 90 >= v1 and (v.Position - HumanoidRootPart.Position).Magnitude < 1200 then
                MouseLocation = UserInputService:GetMouseLocation()
                v3, v4 = CurrentCamera:WorldToViewportPoint(v.Position)
                v5 = Vector2.new(v3.X, v3.Y)
                v6 = Workspace:Raycast(Workspace.CurrentCamera.CFrame.Position, unit * 1500)
                if v6 then
                    if v6.Instance == v then
                        Magnitude = (v5 - MouseLocation).Magnitude
                        if Magnitude < v7 / 2 and Magnitude < huge and v4 then
                            v8 = v
                            huge = Magnitude
                        end
                    elseif v6.Instance.Parent ~= v.Parent then
                    end
                end
            end
        end
        return v8
    end, v6)
    react.useEffect(function() -- Line: 131 -- upvalues: ClientAttributesHandler (upval), Focusing (ref), u7 (val), u211 (upval), u210 (upval), TweenService (upval), ColorCorrectionEffect (upval), u212 (upval), u207 (upval), u11 (val), u31 (val), RunService (upval), u18 (val), u17 (val), UserInputService (upval), u26 (val), u38 (val), CollectionService (upval), u30 (val)
        local u70, v1
        local v2 = ClientAttributesHandler.getAttribute("HasVigilant") == 1
        if not Focusing then
            local v3
            if not v2 then
                u7:spring(1)
                local v4 = TweenInfo.new(1)
                TweenService:Create(ColorCorrectionEffect, v4, {Saturation = 0, Contrast = 0, Brightness = 0}):Play()
                if u211 then
                    u211(TweenInfo.new(1))
                end
            end
            if u30 then
                u30:Disconnect()
                u31(nil)
            end
            v3, v1, u70 = pairs(CollectionService:GetTagged("Focused"))
            for k, v in pairs(CollectionService:GetTagged("Focused")) do
                CollectionService:RemoveTag(v, "Focused")
            end
            return
        end
        local GrappleFocusBaseLength = ClientAttributesHandler.getAttribute("GrappleFocusBaseLength")
        local GrappleFocusLengthMultiplier = ClientAttributesHandler.getAttribute("GrappleFocusLengthMultiplier")
        if not v2 then
            u7:spring(0, {frequency = 3})
            u211 = u210("Focusing", 20, "add", 3, 0.7, function(p1) -- Line: 144
                local v1 = math.pow(p1 - 1, 3) * 6 + 1
                return v1 + math.pow(p1 - 1, 2) * 5
            end)
            local v5 = TweenInfo.new(0.5)
            TweenService:Create(ColorCorrectionEffect, v5, {Saturation = -0.9, Contrast = 0.2, Brightness = -0.1}):Play()
            u212 = u207("Focusing", 20, "set", 5, TweenInfo.new(0.2))
            task.delay(0.2, function() -- Line: 157 -- upvalues: u212 (upval)
                u212(TweenInfo.new(0.4))
            end)
        end
        u11:immediate(1)
        u11:tween(0, {time = GrappleFocusBaseLength * GrappleFocusLengthMultiplier, style = Enum.EasingStyle.Linear})
        u70 = nil
        u31(RunService.RenderStepped:Connect(function(p1) -- Line: 170 -- upvalues: u18 (upval), u17 (upval), UserInputService (upval), u26 (upval), u38 (upval), u70 (ref), CollectionService (upval)
            local v1 = u17:getValue()
            u18(v1 + 15 * p1)
            local MouseLocation = UserInputService:GetMouseLocation()
            u26(UDim2.fromOffset(MouseLocation.X, MouseLocation.Y))
            v1 = UDim2.fromOffset(MouseLocation.X, MouseLocation.Y)
            local v2 = u38.run(v1, u70)
            if v2 then
                if v2 then
                    u70 = v2.Parent
                    CollectionService:AddTag(u70, "Focused")
                end
                return
            end
            if u70 then
                CollectionService:RemoveTag(u70, "Focused")
                u70 = nil
                return
            end
            if v2 then
                u70 = v2.Parent
                CollectionService:AddTag(u70, "Focused")
            end
        end))
    end, {Focusing})
    v1 = {Visible = v2:map(function(p1) -- Line: 211
        local v1 = p1 < 1
        return v1
    end)}
    local v7 = {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(12, 17, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ImageTransparency = v2:map(function(p1) -- Line: 224
            return p1
        end),
    })}
    v3 = {
        Tween = TweenInfo.new(1),
        Enabled = Focusing,
        Delays = {Enabled = 0.3},
    }
    v4 = {Circle = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u17:map(function(p1) -- Line: 243
            local v1 = UDim2.fromScale(0.2, 0.2)
            return v1 + UDim2.fromOffset(p1 * 60, p1 * 60)
        end),
    }, {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint"), uIStroke = react.createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(255, 255, 255)})})}
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v5,
        Size = u10:map(function(p1) -- Line: 267 -- upvalues: u13 (val), u216 (upval)
            local v1 = u13(u216 * p1)
            return UDim2.fromOffset(v1, u13(u216 * p1))
        end),
    }
    local v9 = {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint"), uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v10 = {Thickness = 3, Color = Color3.fromRGB(255, 255, 255)}
    local v11 = {}
    local v12 = {}
    local v13 = {}
    local v14 = NumberSequenceKeypoint.new(0, 0)
    local v15 = NumberSequenceKeypoint.new(0.169, 0)
    local v16 = NumberSequenceKeypoint.new(0.17, 1)
    local v17 = NumberSequenceKeypoint.new(0.824, 1)
    local v18 = NumberSequenceKeypoint.new(0.829, 0)
    v13[1] = v14
    v13[2] = v15
    v13[3] = v16
    v13[4] = v17
    v13[5] = v18
    v13[6] = NumberSequenceKeypoint.new(1, 0)
    v12.Transparency = NumberSequence.new(v13)
    v11.uIGradient = react.createElement("UIGradient", v12)
    v9.uIStroke = react.createElement("UIStroke", v10, v11)
    v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v19 = UDim2.fromScale(1, 1)
    v10.Size = v19 + UDim2.fromOffset(15, 15)
    v11 = {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    v12 = {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(255, 255, 255)}
    local v20 = {}
    v15 = {}
    v17 = {}
    v18 = NumberSequenceKeypoint.new(0, 0)
    local v21 = NumberSequenceKeypoint.new(0.169, 0)
    local v22 = NumberSequenceKeypoint.new(0.17, 1)
    local v23 = NumberSequenceKeypoint.new(0.824, 1)
    local v24 = NumberSequenceKeypoint.new(0.829, 0)
    v17[1] = v18
    v17[2] = v21
    v17[3] = v22
    v17[4] = v23
    v17[5] = v24
    v17[6] = NumberSequenceKeypoint.new(1, 0)
    v15.Transparency = NumberSequence.new(v17)
    v20.uIGradient = react.createElement("UIGradient", v15)
    v11.uIStroke = react.createElement("UIStroke", v12, v20)
    v9.Test = react.createElement("Frame", v10, v11)
    v9.Full = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), uIStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.5, Color = Color3.fromRGB(255, 255, 255)})})
    v4.Inner = react.createElement("Frame", v8, v9)
    v7.Transparency = react.createElement(TransparencyGroup, v3, v4)
    return react.createElement(Frame, v1, v7)
end