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
--         File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Text
--                               Dumped in 0.00195 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local GlitchText = require(v1.Parent:WaitForChild("GlitchText"))
local ZalgoText = require(v1.Parent:WaitForChild("ZalgoText"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks_4:WaitForChild("useOrder"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local Hooks_6 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_6:WaitForChild("useTheme"))
local function SegmentedText(p1) -- Line: 58 -- upvalues: useConstants (val), useTextScale (val), useTheme (val), useMotion (val), react (val), RunService (val), useAsyncEffect (val), Promise (val), FillProps (val)
    local u10, u13, u14, u18, u26, u9, v1, v2
    local u2 = useConstants()
    local u4 = useTextScale()
    u9, u10 = useMotion(0)
    u13, u14 = useMotion(0)
    v2, u18 = useMotion(0)
    v1, u26 = react.useBinding(UDim2.fromOffset(0, 0))
    react.useEffect(function() -- Line: 69 -- upvalues: RunService (upval), u13 (val), u9 (val), u26 (val)
        local u5 = RunService.Heartbeat:Connect(function() -- Line: 70 -- upvalues: u13 (upval), u9 (upval), u26 (upval)
            local v1 = u13:getValue()
            local v2 = u9:getValue()
            u26(UDim2.fromOffset(v1, 5 + v2))
        end)
        return function() -- Line: 76 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    local v3 = react.useMemo(function() -- Line: 81 -- upvalues: p1 (val)
        return table.clone(p1)
    end, {p1})
    useAsyncEffect(function() -- Line: 85 -- upvalues: p1 (val), u10 (val), u4 (val), u2 (val), Promise (upval), u18 (val), u14 (val)
        if typeof(p1.Effect) ~= "string" then
            if typeof(p1.Effect) ~= "string" then
                if typeof(p1.Effect) == "string" then
                    if p1.Effect ~= "Shake" then
                        return Promise.resolve()
                    end
                    u14:immediate(0)
                    u18:immediate(0)
                    return Promise.delay(p1.LayoutOrder * 0.005):andThen(function() -- Line: 109 -- upvalues: u14 (upval), u4 (upval), u2 (upval), u18 (upval)
                        u14:shake(0, {frequency = 40, duration = 0.7, decay = 0.85, amplitude = u4(u2.TextSize.Body * 3)})
                        u18:shake(0, {amplitude = 10, frequency = 5, duration = 0.9, decay = 0.15})
                    end)
                end
                return Promise.resolve()
            end
            if p1.Effect == "Wobble" then
                u10:immediate(u4(u2.TextSize.Body * 4))
                u18:immediate(math.random(-10, 10))
                return Promise.delay(p1.LayoutOrder * 0.03):andThen(function() -- Line: 96 -- upvalues: u10 (upval), u18 (upval)
                    local v1
                    u10:spring(0)
                    local v2 = {tension = 200, friction = 12, damping = 0.1}
                    if math.random(1, 2) ~= 1 then
                        v1 = 1
                    else
                        v1 = -1
                    end
                    v2.impulse = v1
                    u18:spring(0, v2)
                end)
            end
            if typeof(p1.Effect) ~= "string" or p1.Effect ~= "Shake" then
                return Promise.resolve()
            end
            u14:immediate(0)
            u18:immediate(0)
            return Promise.delay(p1.LayoutOrder * 0.005):andThen(function() -- Line: 109 -- upvalues: u14 (upval), u4 (upval), u2 (upval), u18 (upval)
                u14:shake(0, {frequency = 40, duration = 0.7, decay = 0.85, amplitude = u4(u2.TextSize.Body * 3)})
                u18:shake(0, {amplitude = 10, frequency = 5, duration = 0.9, decay = 0.15})
            end)
        elseif p1.Effect == "Rise" then
            u10:immediate(u4(u2.TextSize.Body * 4))
            return Promise.delay(p1.LayoutOrder * 0.03):andThen(function() -- Line: 89 -- upvalues: u10 (upval)
                u10:spring(0)
            end)
        end
    end, {p1.Effect, u4, u2.TextSize.Body})
    v3.Text = p1.Characters[p1.Index]
    v3.Effect = nil
    v3.Size = UDim2.fromOffset(0, u4(u2.TextSize.Body))
    v3.Characters = nil
    v3.Index = nil
    v3.LayoutOrder = nil
    v3.Position = v1
    v3.Rotation = v2
    v3.AnchorPoint = Vector2.new(0, 0)
    local v4 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromOffset(0, u4(u2.TextSize.Body * 2.5)),
        AutomaticSize = Enum.AutomaticSize.X,
        LayoutOrder = p1.LayoutOrder,
    }
    local v5 = {}
    local v6 = FillProps(v3, {
        TextTransparency = 0.46,
        RichText = true,
        Text = p1.Characters[p1.Index],
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = useTheme().Primary,
        TextSize = u4(u2.TextSize.Body),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, u4(u2.TextSize.Body)),
        LayoutOrder = p1.LayoutOrder,
    })
    v5.Label = react.createElement("TextLabel", v6, p1.children)
    return react.createElement("Frame", v4, v5)
end
local function SpecialText(p1) -- Line: 179 -- upvalues: useConstants (val), useTextScale (val), useOrder (val), react (val), SegmentedText (val), Table (val)
    local v1, v2
    local v3 = useConstants()
    local v4 = useTextScale()
    local v5 = useOrder()
    local v6 = react.useMemo(function() -- Line: 184 -- upvalues: p1 (val)
        return table.clone(p1)
    end, {p1})
    p1.Effect = nil
    local v7 = react.useMemo(function() -- Line: 192 -- upvalues: p1 (val)
        return p1.Text:split("")
    end)
    local v8 = {}
    local v9 = #v7
    local v10 = 1
    for i = 1, v9, v10 do
        v1 = tostring(i) .. v7[i]
        v2 = Table.merge(v6, {Characters = v7, Index = i, LayoutOrder = v5()})
        v8[v1] = react.createElement(SegmentedText, v2, p1.children)
    end
    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, v4(v3.TextSize.Body)),
    }
    local AnchorPoint = p1.AnchorPoint
    if not AnchorPoint then
        AnchorPoint = Vector2.new(0, 0.5)
    end
    v11.AnchorPoint = AnchorPoint
    local Position = p1.Position
    if not Position then
        Position = UDim2.fromScale(0, 0.5)
    end
    v11.Position = Position
    return react.createElement("Frame", v11, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
    })}, v8)
end
return react.memo(function(p1) -- Line: 230 -- upvalues: useConstants (val), useTextScale (val), useTheme (val), react (val), GlitchText (val), ZalgoText (val), SpecialText (val), FillProps (val)
    local v1
    local v2 = useConstants()
    local v3 = useTextScale()
    if p1.Effect == "Radio" then
        v1 = table.clone(p1)
        v1.Effect = nil
        return react.createElement(GlitchText, v1)
    end
    if p1.Effect == "Zalgo" then
        v1 = table.clone(p1)
        v1.Effect = nil
        return react.createElement(ZalgoText, v1)
    end
    if p1.Effect then
        return react.createElement(SpecialText, p1)
    end
    local v4 = {
        TextTransparency = 0.46,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        RichText = true,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = useTheme().Primary,
        TextSize = v3(v2.TextSize.Body),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local v5 = UDim2.fromScale(0, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v3(v2.TextSize.Body))
    v4.AutomaticSize = Enum.AutomaticSize.X
    local v6 = FillProps(p1, v4)
    return react.createElement("TextLabel", v6, p1.children)
end)