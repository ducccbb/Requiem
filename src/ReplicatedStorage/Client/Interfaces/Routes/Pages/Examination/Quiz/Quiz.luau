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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Examination.Quiz.Quiz
--                               Dumped in 0.00271 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Exam = require(Namespaces:WaitForChild("Exam"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Quiz = require(Types:WaitForChild("Quiz"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_2 = Components_6:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives_3 = Components_7:WaitForChild("Primitives")
local Text = require(Primitives_3:WaitForChild("Text"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Utilities_2 = Components_8:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local useToast = require(Hooks_4:WaitForChild("useToast"))
local function Option(p1) -- Line: 58 -- upvalues: react (val), Text (val), Color (val)
    local v1 = {BackgroundTransparency = 1}
    local v2 = UDim2.fromScale(1, 0)
    v1.Size = v2 + UDim2.fromOffset(0, p1.rem(50))
    local v3 = {Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, p1.rem(10)), PaddingLeft = UDim.new(0, p1.rem(10)), PaddingRight = UDim.new(0, p1.rem(10)), PaddingTop = UDim.new(0, p1.rem(10))})}
    local v4 = {
        TextTransparency = 0.5,
        Text = p1.text,
        TextSize = p1.rem(14),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 0.5),
    }
    local v5 = UDim2.fromScale(0, 0.5)
    local v6 = p1.rem(35)
    v4.Position = v5 + UDim2.fromOffset(v6, 0)
    v3.Text = react.createElement(Text, v4)
    v4 = {BackgroundTransparency = 0.8}
    v5 = p1.rem(15)
    v4.Size = UDim2.fromOffset(v5, p1.rem(15))
    v5 = UDim2.fromScale(0, 0.5)
    v6 = p1.rem(5)
    v4.Position = v5 + UDim2.fromOffset(v6, 0)
    v4.AnchorPoint = Vector2.new(0, 0.5)
    local v7 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color.Darken(p1.theme.Primary, 0.75), BorderOffset = UDim.new(0, p1.rem(5))})}
    v6 = {BackgroundTransparency = 1, TextTransparency = 1, Text = "", Size = UDim2.fromScale(1, 1)}
    v6[react.Event.MouseButton1Click] = function() -- Line: 102 -- upvalues: p1 (val)
        p1.onSelect(p1.index)
    end
    v7.Hitbox = react.createElement("TextButton", v6)
    if not p1.isSelected then
        v5 = nil
    else
        v5 = react.createElement("Frame", {
            BackgroundTransparency = 0.4,
            BackgroundColor3 = p1.theme.Primary,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    end
    v7.Selected = v5
    v3.Button = react.createElement("Frame", v4, v7)
    return react.createElement("Frame", v1, v3)
end
local function Question(p1) -- Line: 125 -- upvalues: react (val), Option (val), Frame (val), Color (val), HeaderBodyComponent (val)
    local v1, v2, v3
    local v4 = react.useCallback(function(a1) -- Line: 126 -- upvalues: p1 (val)
        p1.onAnswerChange(p1.index, a1)
    end, {p1.index})
    local v5 = {}
    local options = p1.question.options
    local v6 = nil
    local v7 = nil
    local u139 = p1
    for i, j in options, v6, v7 do
        v3 = ("Option_%*"):format(i)
        v1 = {text = j, index = i}
        v2 = u139.selectedAnswer == i
        v1.isSelected = v2
        v1.onSelect = v4
        v1.theme = u139.theme
        v1.rem = u139.rem
        v5[v3] = react.createElement(Option, v1)
    end
    v7 = {BackgroundColor3 = Color.Darken(u139.theme.PageBackground, 0.725), BackgroundTransparency = u139.theme.PageTransparency}
    local v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, u139.rem(350))
    v7.LayoutOrder = u139.index
    local v9 = {Layout = react.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Padding = UDim.new(0, u139.rem(20)),
    }), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, u139.rem(20)), PaddingLeft = UDim.new(0, u139.rem(20)), PaddingRight = UDim.new(0, u139.rem(20)), PaddingTop = UDim.new(0, u139.rem(20))}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v10 = {Header = "Question " .. u139.index, Body = u139.question.question}
    local v11 = {LayoutOrder = -1}
    v2 = UDim2.fromScale(1, 0)
    v11.Size = v2 + UDim2.fromOffset(0, u139.rem(50))
    v10.Native = v11
    v9.Header = react.createElement(HeaderBodyComponent, v10)
    return react.createElement(Frame, v7, v9, v5)
end
return function() -- Line: 179 -- upvalues: useInterfaceState (val), useTheme (val), useToast (val), react (val), useRem (val), Quiz (val), Exam (val), Question (val), Color (val), Button (val), Frame (val), DynamicPage (val), TransparencyGroup (val), ScrollingFrame (val)
    local quiz, quiz_2, u16, u22, u23, v1, v2
    quiz, quiz_2 = useInterfaceState("quiz")
    local v3 = quiz_2
    if not v3 then
        v3 = {visible = false}
    end
    local u7 = v3
    v3 = useTheme()
    local u11 = useToast()
    v2, u16 = react.useState(u7.visible)
    local v4 = useRem()
    local v5 = {}
    u22, u23 = react.useState(v5)
    local u29 = react.useMemo(function() -- Line: 193 -- upvalues: Quiz (upval)
        return Quiz.create(20)
    end, {u7.visible})
    react.useEffect(function() -- Line: 197 -- upvalues: u16 (val), u7 (ref), u23 (val)
        u16(u7.visible)
        if u7.visible then
            u23({})
        end
    end, {u7.visible})
    local v6 = react.useCallback(function(p1, p2) -- Line: 205 -- upvalues: u23 (val)
        u23(function(a1) -- Line: 206 -- upvalues: p1 (val), p2 (val)
            local v1 = table.clone(a1)
            v1[p1] = p2
            return v1
        end)
    end, {})
    local v7 = {}
    local questions = u29.questions
    local v8 = nil
    local v9 = nil
    for i, j in questions, v8, v9 do
        v1 = ("Question_%*"):format(i)
        v7[v1] = react.createElement(Question, {
            question = j,
            index = i,
            theme = v3,
            rem = v4,
            onAnswerChange = v6,
            selectedAnswer = u22[i],
        })
    end
    v9 = {LayoutOrder = 50, BackgroundColor3 = Color.Darken(v3.PageBackground, 0.725), BackgroundTransparency = v3.PageTransparency}
    local v10 = UDim2.fromScale(1, 0)
    v9.Size = v10 + UDim2.fromOffset(0, v4(50))
    v9.Position = UDim2.fromScale(0.5, 0.9)
    v9.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.submit = react.createElement("Frame", v9, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Button = react.createElement(Button, {
        Text = "Submit",
        Clicked = function() -- Line: 213 -- upvalues: u29 (val), u22 (val), u11 (val), u16 (val), quiz (val), Exam (upval)
            local u30, v1
            local u46 = 0
            local v2 = 0
            local questions = u29.questions
            local v3 = nil
            local v4 = nil
            for i, j in questions, v3, v4 do
                v1 = u22[i]
                if v1 == nil then
                    v2 = v2 + 1
                elseif v1 == j.answer then
                    u46 = u46 + 1
                end
            end
            if 0 < v2 then
                u11({message = "You have unanswered questions.", type = "error"})
                return
            end
            u11({message = "Submitting and calculating your results...", type = "info"})
            if u46 ~= 0 then
                u30 = math.ceil(u46 / #u29.questions * 50)
            else
                u30 = 0
            end
            task.delay(0.1, function() -- Line: 239 -- upvalues: u11 (upval), u46 (ref), u30 (val), u16 (upval), quiz (upval)
                u11({type = "success", message = "You have answered " .. u46 .. " questions correctly" .. ". Your score is " .. u30 .. "/50."})
                u16(false)
                quiz({visible = false})
            end)
            Exam.Quiz.post(u30)
        end,
        Native = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)},
    })})
    return react.createElement(Frame, {}, {Page = react.createElement(DynamicPage, {BackgroundTransparency = 0, Enabled = v2}), Content = react.createElement(TransparencyGroup, {Enabled = v2, Tween = TweenInfo.new(0.3)}, {Content = react.createElement(ScrollingFrame, {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Layout = react.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, v4(20)),
    })}, v7)})})
end