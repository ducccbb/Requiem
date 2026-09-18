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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Enchantments.Circle
--                               Dumped in 0.00156 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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
return function() -- Line: 33 -- upvalues: useInterfaceState (val), useMotion (val), react (val), ClientAttributesHandler (val), RunService (val), UserInputService (val), Frame (val), TransparencyGroup (val)
    local Circle_2, u12, u13, u21, u25, u26, u8, v1, v2
    _, Circle_2 = useInterfaceState("Circle")
    local u4 = Circle_2 or 0
    v1, u8 = useMotion(0)
    u12, u13 = react.useBinding(0)
    v2, u21 = react.useBinding(UDim2.fromOffset(0, 0))
    u25, u26 = react.useState(nil)
    local MaximumBladeCharges = ClientAttributesHandler.getAttribute("MaximumBladeCharges")
    local LengthPerBladeChargeMultiplier = ClientAttributesHandler.getAttribute("LengthPerBladeChargeMultiplier")
    react.useEffect(function() -- Line: 49 -- upvalues: u4 (ref), u25 (val), u26 (val), ClientAttributesHandler (upval), RunService (upval), u13 (val), u12 (val), UserInputService (upval), u21 (val), u8 (val)
        local u18
        if 0 >= u4 then
            u8:spring(0)
            u13(0)
            u18 = u25
            if u18 then
                u25:Disconnect()
                u26(nil)
            end
            return
        end
        if u25 then
            u25:Disconnect()
            u26(nil)
        end
        local MaximumBladeCharges = ClientAttributesHandler.getAttribute("MaximumBladeCharges")
        u18 = MaximumBladeCharges * ClientAttributesHandler.getAttribute("LengthPerBladeChargeMultiplier")
        u26(RunService.RenderStepped:Connect(function(p1) -- Line: 62 -- upvalues: u4 (upval), u18 (ref), u13 (upval), u12 (upval), UserInputService (upval), u21 (upval)
            if u18 * 50 <= u4 then
                local v1 = u12:getValue()
                u13(v1 + 15 * p1)
            end
            local MouseLocation = UserInputService:GetMouseLocation()
            u21(UDim2.fromOffset(MouseLocation.X, MouseLocation.Y))
        end))
        u8:tween(u4, {time = 0.3, style = Enum.EasingStyle.Sine, direction = Enum.EasingDirection.Out})
    end, {u4})
    local v3 = {}
    local v4 = if 0 < u4 then v1:map(function(p1) -- Line: 93
    local v1
    v1 = p1 == 0
    return not v1
end) else false
    v3.Visible = v4
    v4 = {}
    local v5 = {Tween = TweenInfo.new(1)}
    local v6 = 0 < u4
    v5.Enabled = v6
    v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2,
        Size = v1:map(function(p1) -- Line: 108
            return UDim2.fromOffset(p1, p1)
        end),
    }
    local v8 = {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}
    local v9 = {Thickness = 2, Transparency = 0, Color = Color3.fromRGB(255, 255, 255)}
    local v10 = {}
    local v11 = {}
    local v12 = {}
    local v13 = NumberSequenceKeypoint.new(0, 0)
    local v14 = NumberSequenceKeypoint.new(0.169, 0)
    local v15 = NumberSequenceKeypoint.new(0.17, 1)
    local v16 = NumberSequenceKeypoint.new(0.824, 1)
    local v17 = NumberSequenceKeypoint.new(0.829, 0)
    v12[1] = v13
    v12[2] = v14
    v12[3] = v15
    v12[4] = v16
    v12[5] = v17
    v12[6] = NumberSequenceKeypoint.new(1, 0)
    v11.Transparency = NumberSequence.new(v12)
    v10.uIGradient = react.createElement("UIGradient", v11)
    v8.uIStroke = react.createElement("UIStroke", v9, v10)
    v6.Circle = react.createElement("Frame", v7, v8)
    v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2,
        Size = v1:map(function(p1) -- Line: 143
            return UDim2.fromOffset(p1 + 15, p1 + 15)
        end),
    }
    v8 = {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}
    v9 = {Thickness = 1, Transparency = 0, Color = Color3.fromRGB(255, 255, 255)}
    v10 = {}
    v11 = {}
    v12 = {}
    v13 = NumberSequenceKeypoint.new(0, 0)
    v14 = NumberSequenceKeypoint.new(0.169, 0)
    v15 = NumberSequenceKeypoint.new(0.17, 1)
    v16 = NumberSequenceKeypoint.new(0.824, 1)
    v17 = NumberSequenceKeypoint.new(0.829, 0)
    v12[1] = v13
    v12[2] = v14
    v12[3] = v15
    v12[4] = v16
    v12[5] = v17
    v12[6] = NumberSequenceKeypoint.new(1, 0)
    v11.Transparency = NumberSequence.new(v12)
    v10.uIGradient = react.createElement("UIGradient", v11)
    v8.uIStroke = react.createElement("UIStroke", v9, v10)
    v6.Detail = react.createElement("Frame", v7, v8)
    v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2,
    }
    if (MaximumBladeCharges or 0) * (LengthPerBladeChargeMultiplier or 1) * 50 <= u4 then
        v8 = true
    else
        v8 = false
    end
    v7.Visible = v8
    v7.Size = u12:map(function(p1) -- Line: 179
        local v1 = UDim2.fromScale(0.2, 0.2)
        return v1 + UDim2.fromOffset(p1 * 60, p1 * 60)
    end)
    v6.Outer = react.createElement("Frame", v7, {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint"), uIStroke = react.createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(255, 255, 255)})})
    v4.Transparency = react.createElement(TransparencyGroup, v5, v6)
    return react.createElement(Frame, v3, v4)
end