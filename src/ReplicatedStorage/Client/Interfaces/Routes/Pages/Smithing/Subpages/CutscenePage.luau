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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Smithing.Subpages.CutscenePage
--                               Dumped in 0.00183 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Progress = require(Universal_3:WaitForChild("Progress"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_2 = Components_6:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks = Interfaces_7:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_10:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local function SmithingCircleComponent(p1) -- Line: 48 -- upvalues: useMotion (val), react (val), Frame (val)
    local u4, v1
    v1, u4 = useMotion(1)
    react.useEffect(function() -- Line: 51 -- upvalues: u4 (val), p1 (val)
        u4:linear(0, {speed = 1 / p1.Speed})
    end, {})
    react.useEffect(function() -- Line: 57 -- upvalues: p1 (val), u4 (val)
        if not p1.Struck then
            return
        end
        u4:linear(1, {speed = 1})
    end, {p1.Struck})
    return react.createElement(react.Fragment, {}, {Shrink = react.createElement(Frame, {BackgroundTransparency = 1, Size = v1:map(function(p1) -- Line: 69
        return UDim2.new(0, p1 * 900, 0, p1 * 900)
    end)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(255, 255, 255), Transparency = v1:map(function(p1) -- Line: 82
        if p1 <= 0.5 then
            return 1 - p1 / 0.5 * 0.7
        end
        return (p1 - 0.5) / 0.5 * 0.7 + 0.3
    end)})})})
end
return function(p1) -- Line: 96 -- upvalues: react (val), useTheme (val), useRem (val), useOrder (val), RunService (val), SmithingCircleComponent (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Progress (val), Button (val)
    local u10, u14, u15, u25, u26, u30, u31, u36, u4, u40, u41, u5, u9, v1
    u4, u5 = react.useState(0)
    u9, u10 = react.useBinding(0)
    u14, u15 = react.useBinding(2)
    local v2 = useTheme()
    local v3 = useOrder()
    u25, u26 = react.useState(0)
    u30, u31 = react.useState(0)
    v1, u36 = react.useState(false)
    u40, u41 = react.useBinding(0.25)
    react.useEffect(function() -- Line: 111 -- upvalues: p1 (val), u5 (val), u10 (val), u15 (val), u26 (val), u31 (val), u36 (val), u41 (val), u9 (val), RunService (upval), u14 (val), u4 (val), u25 (val), u30 (val), u40 (val)
        local u31
        if p1.Enabled then
            if u9:getValue() == 0 then
                u10(tick())
            end
            u31 = nil
            u31 = RunService.RenderStepped:Connect(function(a1) -- Line: 132 -- upvalues: u9 (upval), u14 (upval), u5 (upval), u4 (upval), u10 (upval), u36 (upval), u15 (upval), u25 (upval), u30 (upval), u41 (upval), u40 (upval), p1 (upval), u31 (ref)
                local v1, v2
                local v3 = tick() - u9:getValue()
                if u14:getValue() < v3 then
                    u5(u4 + 1)
                    u10(tick())
                    u36(false)
                    v1 = u14:getValue() - 0.08
                    u15((math.max(v1, 0.7)))
                end
                v3 = tick() - u25
                if v3 >= 0.5 then
                    v3 = tick() - u30
                    if v3 >= 1 then
                        v2 = u40:getValue()
                        v1 = v2 - 0.05 * a1
                        u41((math.clamp(v1, 0, 1)))
                    else
                        v2 = u40:getValue()
                        v1 = v2 - 0.2 * a1
                        u41((math.clamp(v1, 0, 1)))
                    end
                    if u40:getValue() ~= 0 then
                        return
                    end
                    p1.Completed(false)
                    return u31:Disconnect()
                else
                    v3 = tick() - u30
                    if 1 < v3 then
                        v2 = u40:getValue()
                        v1 = v2 + 0.25 * a1
                        u41((math.clamp(v1, 0, 1)))
                        if u40:getValue() ~= 1 then
                            return
                        end
                        u41(0)
                        p1.Completed(true)
                        return u31:Disconnect()
                    end
                end
            end)
            return function() -- Line: 163 -- upvalues: u31 (ref)
                u31:Disconnect()
            end
        end
        u5(0)
        u10(0)
        u15(2)
        u26(0)
        u31(0)
        u36(false)
        u41(0.25)
    end, {p1.Enabled, u4, u25, u30})
    local v4 = {}
    local v5 = tostring(u4)
    v4[v5] = react.createElement(SmithingCircleComponent, {Speed = u14:getValue(), Struck = v1})
    local v6 = {Visible = p1.Enabled}
    local v7 = {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top, Spacing = useRem()(10)})}
    local v8 = {
        Height = "P_30",
        Native = {LayoutOrder = v3()},
    }
    local v9 = {}
    local v10 = {Label = react.createElement(HeaderBodyComponent, {Header = "Maintain the Rythm", Body = "Maintain the rythm of the hammer to smith.", Wrap = true})}
    v9.Left = react.createElement(Form.Divider, {Side = "Left"}, v10)
    v7.Header = react.createElement(Form.Form, v8, v9)
    v7.Progress = react.createElement(Progress, {
        Header = "Progress",
        Body = "Smith your component by striking your hammer.",
        Enabled = true,
        Value = u40,
        Native = {LayoutOrder = v3()},
    })
    v8 = {
        ClipsDescendants = true,
        LayoutOrder = v3(),
        Size = UDim2.new(1, 0, 0.8, 0),
        BackgroundColor3 = v2.PageBackground,
        BackgroundTransparency = v2.PageTransparency,
    }
    v9 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v11 = {Text = "Strike Hammer"}
    local v12 = tick() - u30
    v10 = v12 < 1
    v11.Disabled = v10
    function v11.Clicked() -- Line: 227 -- upvalues: u9 (val), u14 (val), u36 (val), u26 (val), u31 (val)
        local v1 = math.abs(tick() - u9:getValue() - u14:getValue() / 2)
        if v1 >= 0.04 then
            u31(tick())
            return
        end
        u36(true)
        u26(tick())
    end
    v11.Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    v9.Button = react.createElement(Button, v11)
    v11 = {
        Image = "rbxassetid://127752913725408",
        ImageTransparency = 0.7,
        BackgroundTransparency = 1,
        ZIndex = 2,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v12 = UDim2.new(0, 450, 0, 450)
    v11.Size = v12 + UDim2.fromOffset(20, 20)
    v9.Outer = react.createElement("ImageLabel", v11, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")})
    v11 = {
        Image = "rbxassetid://127752913725408",
        ImageTransparency = 0.7,
        BackgroundTransparency = 1,
        ZIndex = 2,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v12 = UDim2.new(0, 450, 0, 450)
    v11.Size = v12 + UDim2.fromOffset(-20, -20)
    v9.Inner = react.createElement("ImageLabel", v11, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")})
    v7.Minigame = react.createElement(Frame, v8, v9, v4)
    return react.createElement(Frame, v6, v7)
end