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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Refining.Subpages.MinigamePage
--                               Dumped in 0.00136 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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
local Universal = Components:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_3 = Components_4:WaitForChild("Universal")
local Progress = require(Universal_3:WaitForChild("Progress"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_9:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
return function(p1) -- Line: 49 -- upvalues: useTheme (val), useRem (val), useOrder (val), react (val), useMotion (val), RunService (val), GuiService (val), UserInputService (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Progress (val)
    local u10, u11, u17, u18, u22, u23, u34, u44, u45, v1
    local v2 = useTheme()
    local u4 = useRem()
    local v3 = useOrder()
    u10, u11 = react.useBinding(0.25)
    u17, u18 = react.useBinding(tick() - 5)
    u22, u23 = react.useBinding(3)
    local u27 = react.useRef(nil)
    v1, u34 = useMotion(UDim2.fromScale(0.5, 0.5))
    local v4 = u4(90)
    u44, u45 = useMotion(UDim2.fromOffset(v4, u4(90)))
    react.useEffect(function() -- Line: 63 -- upvalues: p1 (val), u11 (val), u18 (val), u23 (val), RunService (upval), u27 (val), GuiService (upval), UserInputService (upval), u17 (val), u22 (val), u44 (val), u4 (val), u45 (val), u34 (val), u10 (val)
        if p1.Enabled then
            local u13 = nil
            u13 = RunService.RenderStepped:Connect(function(a1) -- Line: 74 -- upvalues: u27 (upval), GuiService (upval), UserInputService (upval), u17 (upval), u22 (upval), u18 (upval), u44 (upval), u4 (upval), u45 (upval), u34 (upval), u23 (upval), u11 (upval), u10 (upval), p1 (upval), u13 (ref)
                local v1, v2
                if not u27.current then
                    return
                end
                local GuiInset = GuiService:GetGuiInset()
                local v3 = u27.current.AbsolutePosition + u27.current.AbsoluteSize / 2
                v3 = tick() - u17:getValue()
                if u22:getValue() * 0.5 <= v3 then
                    u18(tick())
                    local v4 = u44:getValue().X.Offset - u4(5)
                    v1 = u4(50)
                    v3 = math.clamp(v4, v1, u4(90))
                    v1 = u44:getValue().Y.Offset - u4(5)
                    v2 = u4(50)
                    v4 = math.clamp(v1, v2, u4(90))
                    local v5 = UDim2.fromOffset(v3, v4)
                    u45:spring(v5, {frequency = 0.3})
                    v2 = math.random(10, 90) / 100
                    v1 = UDim2.fromScale(v2, math.random(10, 90) / 100)
                    u34:spring(v1, {frequency = u22:getValue()})
                    local v6 = u22:getValue() - 0.2
                    u23((math.clamp(v6, 1.6, 3)))
                end
                if (v3 - (UserInputService:GetMouseLocation() - GuiInset)).Magnitude >= u44:getValue().X.Offset / 2 then
                    v2 = u10:getValue()
                    v1 = v2 - 0.05 * a1
                    u11((math.clamp(v1, 0, 1)))
                else
                    v2 = u10:getValue()
                    v1 = v2 + 0.125 * a1
                    u11((math.clamp(v1, 0, 1)))
                end
                v3 = u10:getValue()
                if 1 <= v3 then
                    p1.Completed(true)
                    return u13:Disconnect()
                end
                v3 = u10:getValue()
                if v3 > 0 then
                    return
                end
                p1.Completed(false)
                return u13:Disconnect()
            end)
            return function() -- Line: 117 -- upvalues: u13 (ref)
                u13:Disconnect()
            end
        end
        u11(0.25)
        u18(tick() - 5)
        u23(3)
    end, {p1.Enabled, u27})
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top, Spacing = u4(10)}), Header = react.createElement(Form.Form, {
        Height = "P_30",
        Native = {LayoutOrder = v3()},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Refine your Item", Body = "Polish and perfect your item.", Wrap = true})})}), Progress = react.createElement(Progress, {
        Header = "Progress",
        Body = "Keep your mouse within the circle.",
        Enabled = true,
        Value = u10,
        Native = {LayoutOrder = v3()},
    }), Minigame = react.createElement(Frame, {
        ClipsDescendants = true,
        LayoutOrder = v3(),
        Size = UDim2.new(1, 0, 0.8, 0),
        BackgroundColor3 = v2.PageBackground,
        BackgroundTransparency = v2.PageTransparency,
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Frame = react.createElement(Frame, {
        BackgroundTransparency = 0.98,
        Size = u44,
        Position = v1,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Reference = u27,
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)}), Icon = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ImageTransparency = 0.5,
        Image = "rbxassetid://11295279987",
        Size = UDim2.fromScale(0.7, 0.7),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    })})})})
end