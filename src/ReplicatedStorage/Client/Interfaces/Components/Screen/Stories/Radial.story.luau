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
--   File: ReplicatedStorage.Client.Interfaces.Components.Screen.Stories.Radial.story
--                               Dumped in 0.00473 seconds
--                          Bytecode version 9  |  20 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Bindings = require(Utilities_2:WaitForChild("Bindings"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local u95 = {}
u95[2] = "rbxassetid://135683891024467"
u95[3] = "rbxassetid://114853532148402"
u95[4] = "rbxassetid://129527467340892"
u95[5] = "rbxassetid://74838677246901"
local u100 = {}
u100[2] = 135
u100[3] = -270
u100[4] = 135
u100[5] = 90
local u105 = {}
u105[2] = {2, 1}
u105[3] = {2, 1, 3}
u105[4] = {3, 2, 1, 4}
local v3 = {
    3,
    2,
    1,
    5,
    4,
}
u105[5] = v3
local u124 = {}
local v4 = {Name = "Test2", Image = "rbxassetid://11295273292"}
local v5 = {Name = "Test4", Image = "rbxassetid://11293977875"}
local v6 = {Name = "Test5", Image = "rbxassetid://11293977875"}
u124[1] = {Name = "Test1", Image = "rbxassetid://12966838487"}
u124[2] = v4
u124[3] = {Name = "Test3", Image = "rbxassetid://11293977875"}
u124[4] = v5
u124[5] = v6
local v7 = {Enabled = true}
local function AnimatedLabel(p1) -- Line: 78 -- upvalues: react (val), useMotion (val)
    local u14, u18, u22, u26, u5, v1, v2, v3, v4, v5, v6
    v1, u5 = react.useState(p1.Text)
    local Text = p1.Text
    local u10 = react.useRef(p1.Text)
    v4, u14 = useMotion(0)
    v5, u18 = useMotion(0)
    v6, u22 = useMotion(0)
    v2, u26 = useMotion(0)
    react.useEffect(function() -- Line: 91 -- upvalues: u10 (val), Text (val), u14 (val), u18 (val), u22 (val), u26 (val), u5 (val)
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
        local u81 = u22:onComplete(function() -- Line: 138 -- upvalues: u5 (upval), Text (upval)
            u5(Text)
        end)
        return function() -- Line: 142 -- upvalues: u81 (val)
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
            Position = v4:map(function(p1) -- Line: 163
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
        Position = v6:map(function(p1) -- Line: 182
            return UDim2.fromScale(0.5, p1 + 0.5)
        end),
        Size = UDim2.fromScale(1, 1),
        TextTransparency = v2,
    })
    return createElement(Fragment, {}, v9)
end
local function Segment(p1) -- Line: 203 -- upvalues: useMotion (val), react (val), Bindings (val)
    local u13, u4, u8, u9, v1, v2
    v1, u4 = useMotion(0)
    u8, u9 = react.useState(p1.Selected)
    v2, u13 = useMotion(0)
    react.useEffect(function() -- Line: 216 -- upvalues: u9 (val), u4 (val), u13 (val), p1 (val)
        u9(true)
        if p1.Selected then
            (function() -- Line: 221 -- upvalues: u4 (upval), u13 (upval)
                u4:spring(30, {frequency = 0.2})
                u13:spring(0, {frequency = 0.5})
            end)()
            return
        end
        ;(function() -- Line: 233 -- upvalues: u4 (upval), u13 (upval)
            u4:spring(0, {frequency = 0.1})
            u13:spring(0.4, {frequency = 0.1})
        end)()
    end, {p1.Selected})
    return react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = p1.Image,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = p1.Transparency:map(function(p1) -- Line: 254
            return 0.32 + 0.6799999999999999 * p1
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = Bindings.composeBindings(p1.Size, v1, function(p1, p2) -- Line: 260 -- upvalues: u8 (val)
            local v1
            if not u8 then
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
    }, {Icon = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = p1.Segment.Image,
        ImageTransparency = v2,
        Size = UDim2.fromScale(0.1, 0.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.125),
        Rotation = (360 / p1.Amount * (p1.Index - 1) + 180) * -1,
    }, {Ratio = react.createElement("UIAspectRatioConstraint")})})
end
local function Radial(p1) -- Line: 287 -- upvalues: useMotion (val), react (val), u95 (val), RunService (val), GuiService (val), UserInputService (val), u100 (val), u105 (val), Segment (val), AnimatedLabel (val)
    local Name, u0, u13, u4, u8, v1, v2, v3, v4, v5, v6, v7
    v1, u4 = useMotion(0)
    v5, u8 = useMotion(1)
    v6, u13 = react.useState(0)
    local u90 = react.useRef(nil)
    local u64 = #p1.Template
    if not (u95[u64]) then
        warn("Failed to find image label for amount: " .. u64)
        return react.createElement(react.Fragment, {})
    end
    react.useEffect(function() -- Line: 301 -- upvalues: u4 (val), u8 (val), RunService (upval), u90 (val), GuiService (upval), UserInputService (upval), u13 (val), u100 (upval), u64 (val), p1 (val)
        local u0 = nil
        if not p1.Enabled then
            (function() -- Line: 388 -- upvalues: u8 (upval), u4 (upval), u13 (upval)
                u8:tween(1, {time = 0.1, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.In})
                u4:tween(0, {time = 0.1, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.In})
                u13(0)
            end)()
        else
            (function() -- Line: 306 -- upvalues: u4 (upval), u8 (upval), u0 (ref), RunService (upval), u90 (upval), GuiService (upval), UserInputService (upval), u13 (upval), u100 (upval), u64 (upval)
                u4:immediate(-40)
                local v1 = {time = 0.2, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.Out}
                u4:tween(20, v1)
                u8:immediate(1)
                u8:spring(0)
                u0 = RunService.RenderStepped:Connect(function() -- Line: 317 -- upvalues: u90 (upval), GuiService (upval), UserInputService (upval), u13 (upval), u100 (upval), u64 (upval)
                    local current = u90.current
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
                        return
                    end
                    local v3 = -v2.Y
                    v3 = math.deg((math.atan2(v3, v2.X)))
                    if v3 < 0 then
                        v3 = v3 + 360
                    end
                    local v4 = ((v3 + (u100[u64] or 0)) % 360 - 180) % 360
                    if v4 < 0 then
                        v4 = v4 + 360
                    end
                    local v5 = math.floor(v4 / (360 / u64)) + 1
                    if v5 < 1 then
                        v5 = u64
                    elseif u64 < v5 then
                        v5 = 1
                    end
                    u13(v5)
                end)
            end)()
        end
        return function() -- Line: 414 -- upvalues: u0 (ref)
            if not u0 then
                return
            end
            u0:Disconnect()
        end
    end, {p1.Enabled, u64})
    v7 = {}
    local v8 = u64
    local v9 = 1
    for i = 1, v8, v9 do
        v2 = u105[u64][i] == v6
        v3 = tostring(i)
        v7[v3] = react.createElement(Segment, {
            Selected = v2,
            Image = u95[u64],
            Segment = u0.Template[i],
            Size = v1,
            Transparency = v5,
            Amount = u64,
            Index = i,
        })
    end
    local createElement = react.createElement
    local v10 = {
        BackgroundTransparency = 1,
        Visible = true,
        ref = u90,
        Position = UDim2.fromScale(0.333, 0.228),
        Size = UDim2.fromOffset(636, 636),
    }
    v2 = {Ratio = react.createElement("UIAspectRatioConstraint"), Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(638, 638), MinSize = Vector2.new(400, 400)})}
    local createElement_2 = react.createElement
    v4 = {
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.05),
    }
    local v11 = {}
    local createElement_3 = react.createElement
    local v12 = {}
    if not (u0.Template[v6]) then
        Name = ""
    else
        Name = u0.Template[v6].Name
        if not Name then
            Name = ""
        end
    end
    v12.Text = Name
    v11.Label = createElement_3(AnimatedLabel, v12)
    v2.LabelContainer = createElement_2("Frame", v4, v11)
    return createElement("Frame", v10, v2, v7)
end
return QuickStory(v7, function(p1) -- Line: 467 -- upvalues: react (val), Frame (val), Radial (val), u124 (val)
    return react.createElement(Frame, {}, {Radial = react.createElement(Radial, {Enabled = p1.Enabled, Template = u124})})
end)