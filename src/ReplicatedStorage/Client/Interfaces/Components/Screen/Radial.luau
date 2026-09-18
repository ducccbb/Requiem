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
--          File: ReplicatedStorage.Client.Interfaces.Components.Screen.Radial
--                               Dumped in 0.00448 seconds
--                          Bytecode version 9  |  32 functions

local Segment
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Bindings = require(Utilities_2:WaitForChild("Bindings"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientCursorHandler = require(State_2:WaitForChild("ClientCursorHandler"))
local DynamicPage = require(v1.Parent:WaitForChild("DynamicPage"))
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local AnimationViewport = require(Universal:WaitForChild("AnimationViewport"))
local Universal_2 = v1.Parent.Parent:WaitForChild("Universal")
local ModelViewport = require(Universal_2:WaitForChild("ModelViewport"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_2:WaitForChild("Utilities")
local State = require(Utilities_3:WaitForChild("State"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local u202 = {}
u202[2] = "rbxassetid://135683891024467"
u202[3] = "rbxassetid://114853532148402"
u202[4] = "rbxassetid://129527467340892"
u202[5] = "rbxassetid://74838677246901"
local u207 = {}
u207[2] = 135
u207[3] = -270
u207[4] = 135
u207[5] = 90
local u212 = {}
u212[2] = {2, 1}
u212[3] = {2, 1, 3}
u212[4] = {3, 2, 1, 4}
local v3 = {
    3,
    2,
    1,
    5,
    4,
}
u212[5] = v3
local u232 = Signal.new()
local function Label(p1) -- Line: 84 -- upvalues: react (val), useMotion (val)
    local u14, u18, u22, u26, u5, v1, v2, v3, v4, v5, v6
    v1, u5 = react.useState(p1.Text)
    local Text = p1.Text
    local u10 = react.useRef(p1.Text)
    v4, u14 = useMotion(0)
    v5, u18 = useMotion(0)
    v6, u22 = useMotion(0)
    v2, u26 = useMotion(0)
    react.useEffect(function() -- Line: 97 -- upvalues: p1 (val), u14 (val), u18 (val), u22 (val), u26 (val)
        if not p1.Enabled then
            u14:immediate(0)
            u18:immediate(1)
            u22:immediate(0)
            u26:immediate(1)
        end
    end, {p1.Enabled})
    react.useEffect(function() -- Line: 106 -- upvalues: u10 (val), Text (val), u14 (val), u18 (val), u22 (val), u26 (val), u5 (val)
        if u10.current == Text then
            u14:immediate(0)
            u18:immediate(0)
            u22:immediate(0)
            u26:immediate(0)
            u5(Text)
            return
        end
        u10.current = Text
        u5(u10.current)
        u14:immediate(0)
        u18:immediate(0)
        u14:spring(1, {frequency = 0.5, damping = 1})
        u18:spring(1, {frequency = 0.5, damping = 1})
        u22:immediate(-1)
        u26:immediate(1)
        u22:spring(0, {frequency = 0.5, damping = 1})
        u26:spring(0, {frequency = 0.5, damping = 1})
        local u81 = u22:onComplete(function() -- Line: 153 -- upvalues: u5 (upval), Text (upval)
            u5(Text)
        end)
        return function() -- Line: 157 -- upvalues: u81 (val)
            u81()
        end
    end, {Text})
    local v7 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local v8 = v1 ~= Text
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v9 = {}
    if not v8 then
        v3 = nil
    else
        v3 = react.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = string.upper(v1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            FontFace = v7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v4:map(function(p1) -- Line: 178
                return UDim2.fromScale(0.5, p1 + 0.5)
            end),
            Size = UDim2.fromScale(1, 1),
            TextTransparency = v5,
        })
        if not v3 then
            v3 = nil
        end
    end
    v9.OldText = v3
    v9.NewText = react.createElement("TextLabel", {
        TextScaled = true,
        BackgroundTransparency = 1,
        Text = string.upper(Text),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        FontFace = v7,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v6:map(function(p1) -- Line: 197
            return UDim2.fromScale(0.5, p1 + 0.5)
        end),
        Size = UDim2.fromScale(1, 1),
        TextTransparency = v2,
    })
    return createElement(Fragment, {}, v9)
end
function Segment(p1) -- Line: 218 -- upvalues: useTheme (val), useMotion (val), react (val), Bindings (val), ModelViewport (val), AnimationViewport (val)
    local Selected, u10, u11, u15, u6, v1, v2, v3
    v2, u6 = useMotion(0)
    u10, u11 = react.useState(p1.Selected)
    v3, u15 = useMotion(0)
    react.useEffect(function() -- Line: 235 -- upvalues: u11 (val), u6 (val), u15 (val), p1 (val)
        u11(true)
        if p1.Selected then
            (function() -- Line: 240 -- upvalues: u6 (upval), u15 (upval), p1 (upval)
                local v1
                u6:spring(30, {frequency = 0.2})
                if not p1.Enabled then
                    v1 = 1
                else
                    v1 = 0
                end
                u15:spring(v1, {frequency = 0.5})
            end)()
            return
        end
        ;(function() -- Line: 252 -- upvalues: u6 (upval), u15 (upval), p1 (upval)
            local v1
            u6:spring(0, {frequency = 0.1})
            if not p1.Enabled then
                v1 = 1
            else
                v1 = 0.4
            end
            u15:spring(v1, {frequency = 0.1})
        end)()
    end, {p1.Selected, p1.Enabled})
    react.useEffect(function() -- Line: 270 -- upvalues: p1 (val), u15 (val)
        if not p1.Enabled then
            u15:spring(1)
            return
        end
        u15:spring(0.4)
    end, {p1.Enabled})
    local createElement = react.createElement
    local v4 = {
        BackgroundTransparency = 1,
        Image = p1.Image,
        ImageColor3 = useTheme().Background,
        ImageTransparency = p1.Transparency:map(function(p1) -- Line: 281
            return 0.32 + 0.6799999999999999 * p1
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = Bindings.composeBindings(p1.Size, v2, function(p1, p2) -- Line: 287 -- upvalues: u10 (val)
            local v1
            if not u10 then
                v1 = 0
            else
                v1 = p2
                if not v1 then
                    v1 = 0
                end
            end
            local v2 = UDim2.fromScale(1, 1)
            return v2 + UDim2.fromOffset(p1 + v1, p1 + v1)
        end),
        Rotation = 360 / p1.Amount * (p1.Index - 1) + 180,
    }
    local v5 = {}
    if p1.Segment.Model then
        v1 = react.createElement(ModelViewport, {
            Spins = false,
            Model = p1.Segment.Model,
            Native = {
                Rotation = (360 / p1.Amount * (p1.Index - 1) + 180) * -1,
                Size = UDim2.fromScale(0.15, 0.15),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.125),
                ImageTransparency = v3,
            },
        }, {Ratio = react.createElement("UIAspectRatioConstraint")})
    elseif not p1.Segment.Animation then
        v1 = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = p1.Segment.Image,
            ImageTransparency = v3,
            Size = UDim2.fromScale(0.1, 0.1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.125),
            Rotation = (360 / p1.Amount * (p1.Index - 1) + 180) * -1,
        }, {Ratio = react.createElement("UIAspectRatioConstraint")})
    else
        local v6 = {Animation = p1.Segment.Animation, Offset = p1.Segment.Offset}
        Selected = p1.Selected
        if Selected then
            Selected = p1.Enabled
        end
        v6.Selected = Selected
        v6.Rendered = v3:map(function(p1) -- Line: 314
            local v1 = p1 == 1
            return not v1
        end)
        v6.Native = {
            Rotation = (360 / p1.Amount * (p1.Index - 1) + 180) * -1,
            Size = UDim2.fromScale(0.15, 0.15),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.125),
            ImageTransparency = v3,
        }
        v1 = react.createElement(AnimationViewport, v6, {Ratio = react.createElement("UIAspectRatioConstraint")})
    end
    v5.Icon = v1
    return createElement("ImageLabel", v4, v5)
end
local function calculatePaginationLayout(p1, p2) -- Line: 349
    local v1, v2, v3, v4, v5, v6
    if p1 <= 5 then
        return {totalPages = 1, startIndex = 1, items = p1, endIndex = p1}
    end
    local v7 = p1 % 5
    if 3 <= v7 then
        v2 = math.ceil(p1 / 5)
        v3 = {}
        v4 = v2 - 1
        v5 = 1
        for i = 1, v4, v5 do
            v3[i] = 5
        end
        v3[v2] = p1 - 5 * (v2 - 1)
        v1 = p2
    elseif v7 ~= 0 then
        v2 = math.ceil(p1 / 5)
        v4 = math.floor(p1 / v2)
        v5 = p1 % v2
        v3 = {}
        v6 = v2
        local v8 = 1
        for j = 1, v6, v8 do
            if j > v5 then
                v3[j] = v4
            else
                v3[j] = v4 + 1
            end
        end
    end
    v4 = 1
    v5 = v1 - 1
    v6 = 1
    for k = 1, v5, v6 do
        v4 = v4 + v3[k]
    end
    return {items = v3[v1], totalPages = v2, startIndex = v4, endIndex = v4 + v3[v1] - 1}
end
local function Radial(p1) -- Line: 407 -- upvalues: useMotion (val), react (val), calculatePaginationLayout (val), ContextActionService (val), UserInputService (val), u212 (val), u232 (val), RunService (val), GuiService (val), u207 (val), ClientCursorHandler (val), Segment (val), u202 (val), Label (val)
    local u13, u17, u18, u199, u27, u297, u4, u8, v1, v2, v3, v4, v5, v6
    v1, u4 = useMotion(0)
    v6, u8 = useMotion(1)
    u199, u13 = react.useState(0)
    u17, u18 = react.useState(false)
    local u222 = react.useRef(nil)
    u297, u27 = react.useState(1)
    local Template = p1.Template
    if not Template then
        Template = {}
    end
    p1.Template = Template
    local v7 = #p1.Template
    local u286 = 5 < v7
    local u43 = calculatePaginationLayout(v7, u297)
    local totalPages = u43.totalPages
    local Template_2 = {}
    if not u286 then
        Template_2 = p1.Template
    else
        local endIndex = u43.endIndex
        v2 = 1
        for i = u43.startIndex, endIndex, v2 do
            table.insert(Template_2, p1.Template[i])
        end
    end
    local u168 = #Template_2
    react.useEffect(function() -- Line: 439 -- upvalues: p1 (val), u27 (val)
        if p1.Enabled then
            u27(1)
        end
    end, {p1.Enabled})
    react.useEffect(function() -- Line: 446 -- upvalues: u13 (val)
        u13(0)
    end, {u297})
    react.useEffect(function() -- Line: 451 -- upvalues: u4 (val), u8 (val), u286 (val), ContextActionService (upval), u297 (val), totalPages (val), u27 (val), UserInputService (upval), u212 (upval), u168 (val), u43 (val), u232 (upval), p1 (val), RunService (upval), u222 (val), GuiService (upval), u13 (val), u207 (upval)
        local u0 = nil
        local u1 = nil
        local u2 = 0
        local u3 = 0
        if not p1.Enabled then
            (function() -- Line: 597 -- upvalues: u8 (upval), u4 (upval), u13 (upval), u286 (upval), ContextActionService (upval)
                u8:tween(1, {time = 0.1, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.In})
                u4:tween(0, {time = 0.1, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.In})
                u13(0)
                if u286 then
                    ContextActionService:UnbindAction("RadialMenuScroll")
                end
            end)()
        else
            (function() -- Line: 460 -- upvalues: u4 (upval), u8 (upval), u286 (upval), ContextActionService (upval), u3 (ref), u297 (upval), totalPages (upval), u27 (upval), u1 (ref), UserInputService (upval), u2 (ref), u212 (upval), u168 (upval), u43 (upval), u232 (upval), p1 (upval), u0 (ref), RunService (upval), u222 (upval), GuiService (upval), u13 (upval), u207 (upval)
                u4:immediate(-40)
                local v1 = {time = 0.2, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.Out}
                u4:tween(20, v1)
                u8:immediate(1)
                u8:spring(0)
                if u286 then
                    ContextActionService:BindAction("RadialMenuScroll", function(p1, p2, p3) -- Line: 473 -- upvalues: u3 (upval), u297 (upval), totalPages (upval), u27 (upval)
                        local v1
                        if p2 ~= Enum.UserInputState.Change or p3.UserInputType ~= Enum.UserInputType.MouseWheel then
                            return Enum.ContextActionResult.Pass
                        end
                        local v2 = os.clock()
                        local v3 = v2 - u3
                        if v3 < 0.2 then
                            return Enum.ContextActionResult.Sink
                        end
                        u3 = v2
                        local Z = p3.Position.Z
                        if 0 < Z then
                            v1 = u297 - 1
                            if v1 < 1 then
                                v1 = totalPages
                            end
                            u27(v1)
                        elseif Z < 0 then
                            v1 = u297 + 1
                            if totalPages < v1 then
                                v1 = 1
                            end
                            u27(v1)
                        end
                        return Enum.ContextActionResult.Sink
                    end, false, Enum.UserInputType.MouseWheel)
                end
                u1 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 508 -- upvalues: u2 (upval), u212 (upval), u168 (upval), u286 (upval), u43 (upval), u232 (upval), p1 (upval)
                    if p2 or not u2 or u2 == 0 then
                        return
                    end
                    if a1.UserInputType == Enum.UserInputType.MouseButton1 then
                        local v1 = u212[u168]
                        local v2 = v1[u2]
                        if not u286 then
                            v1 = v2
                        else
                            v1 = u43.startIndex + v2 - 1
                            if not v1 then
                                v1 = v2
                            end
                        end
                        u232:Fire(p1.Template[v1])
                    end
                end)
                u0 = RunService.RenderStepped:Connect(function() -- Line: 523 -- upvalues: u222 (upval), GuiService (upval), UserInputService (upval), u13 (upval), u2 (upval), u207 (upval), u168 (upval)
                    local current = u222.current
                    if not current then
                        return
                    end
                    local GuiInset = GuiService:GetGuiInset()
                    local MouseLocation = UserInputService:GetMouseLocation()
                    local v1 = Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
                    local AbsolutePosition = current.AbsolutePosition
                    local AbsoluteSize = current.AbsoluteSize
                    local v2 = v1 - Vector2.new(AbsolutePosition.X + AbsoluteSize.X / 2, AbsolutePosition.Y + AbsoluteSize.Y / 2)
                    if AbsoluteSize.X / 2 < v2.Magnitude then
                        u13(0)
                        u2 = 0
                        return
                    end
                    local v3 = -v2.Y
                    v3 = math.deg((math.atan2(v3, v2.X)))
                    if v3 < 0 then
                        v3 = v3 + 360
                    end
                    local v4 = ((v3 + (u207[u168] or 0)) % 360 - 180) % 360
                    if v4 < 0 then
                        v4 = v4 + 360
                    end
                    local v5 = math.floor(v4 / (360 / u168)) + 1
                    if v5 < 1 then
                        v5 = u168
                    elseif u168 < v5 then
                        v5 = 1
                    end
                    u2 = v5
                    u13(v5)
                end)
            end)()
        end
        return function() -- Line: 628 -- upvalues: u1 (ref), u286 (upval), ContextActionService (upval), u0 (ref)
            if u1 then
                u1:Disconnect()
            end
            if u286 then
                ContextActionService:UnbindAction("RadialMenuScroll")
            end
            if not u0 then
                return
            end
            u0:Disconnect()
        end
    end, {
        p1.Enabled,
        u168,
        u286,
        u297,
        totalPages,
    })
    react.useEffect(function() -- Line: 649 -- upvalues: u17 (val), ClientCursorHandler (upval)
        if u17 then
            ClientCursorHandler.setCursorIcon("rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png")
            return
        end
        ClientCursorHandler.restoreCursorIcon()
    end, {u17})
    react.useEffect(function() -- Line: 657 -- upvalues: u199 (val), u17 (val), u18 (val)
        if u199 ~= 0 then
            if 0 < u199 and not u17 then
                u18(true)
            end
            return
        end
        if u17 then
            u18(false)
            return
        end
        if 0 < u199 and not u17 then
            u18(true)
        end
    end, {u199, u17})
    v2 = {}
    local v8 = u168
    local v9 = 1
    for j = 1, v8, v9 do
        v3 = u212[u168][j] == u199
        v4 = tostring(j)
        v2[v4] = react.createElement(Segment, {
            Selected = v3,
            Image = u202[u168],
            Segment = Template_2[j],
            Size = v1,
            Transparency = v6,
            Amount = u168,
            Index = j,
            Enabled = u0.Enabled,
            Data = Template_2[j].Data,
        })
    end
    v8 = u212[u168]
    if v8 then
        v8 = u212[u168][u199]
    end
    local Name = v8
    if Name then
        Name = Template_2[v8]
        if Name then
            Name = Template_2[v8].Name
        end
    end
    local createElement = react.createElement
    v4 = {
        BackgroundTransparency = 1,
        Visible = true,
        ref = u222,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v10 = {Ratio = react.createElement("UIAspectRatioConstraint"), Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(638, 638), MinSize = Vector2.new(400, 400)}), Label = react.createElement("Frame", {
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.05),
    }, {Label = react.createElement(Label, {Text = Name or "", Enabled = u0.Enabled})})}
    if not u286 then
        v5 = nil
    else
        v5 = react.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = string.format("PAGE %d OF %d", u297, totalPages),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.6),
            Size = UDim2.fromScale(0.3, 0.03),
            TextTransparency = v6:map(function(p1) -- Line: 731
                return p1
            end),
        })
        if not v5 then
            v5 = nil
        end
    end
    v10.PageIndicator = v5
    return createElement("Frame", v4, v10, v2)
end
return {
    updateRadialMenu = function(p1) -- Line: 767 -- upvalues: State (val), u232 (val)
        local radial, radial_2
        radial, radial_2 = State("radial")
        if not p1.options and radial_2 and radial_2.options then
            p1.options = radial_2.options
        end
        u232:DisconnectAll()
        radial(p1)
        return u232
    end,
    Component = function() -- Line: 744 -- upvalues: useInterfaceState (val), react (val), Frame (val), DynamicPage (val), Radial (val)
        local radial_2
        _, radial_2 = useInterfaceState("radial")
        local v1 = radial_2
        if not v1 then
            v1 = {enabled = false, options = {}}
        end
        local v2 = v1
        v1 = v2.key or "default"
        local v3 = {Page = react.createElement(DynamicPage, {Enabled = v2.enabled})}
        v3[v1] = react.createElement(Radial, {Enabled = v2.enabled, Template = v2.options})
        return react.createElement(Frame, {}, v3)
    end,
}