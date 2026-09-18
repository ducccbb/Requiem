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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets
--                               Dumped in 0.00264 seconds
--                          Bytecode version 9  |  58 functions

require(script.Parent.Types)
local u5 = {}
return function(p1) -- Line: 5 -- upvalues: u5 (val)
    local v1
    u5.GuiService = game:GetService("GuiService")
    u5.RunService = game:GetService("RunService")
    u5.UserInputService = game:GetService("UserInputService")
    u5.ContextActionService = game:GetService("ContextActionService")
    u5.TextService = game:GetService("TextService")
    local v2 = {
        RIGHT_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_right.png",
        DOWN_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_down.png",
        MULTIPLICATION_SIGN = "rbxasset://textures/AnimationEditor/icon_close.png",
        BOTTOM_RIGHT_CORNER = "◢",
        CHECK_MARK = "rbxasset://textures/AnimationEditor/icon_checkmark.png",
        ALPHA_BACKGROUND_TEXTURE = "rbxasset://textures/meshPartFallback.png",
    }
    u5.ICONS = v2
    u5.GuiInset = u5.GuiService:GetGuiInset()
    u5.IS_STUDIO = u5.RunService:IsStudio()
    function u5.getTime() -- Line: 24 -- upvalues: u5 (upval)
        if u5.IS_STUDIO then
            return os.clock()
        end
        return time()
    end
    function u5.getMouseLocation() -- Line: 33 -- upvalues: u5 (upval)
        local MouseLocation = u5.UserInputService:GetMouseLocation()
        return MouseLocation - u5.GuiInset
    end
    function u5.findBestWindowPosForPopup(p1, p2, p3, p4) -- Line: 37
        local v1
        local v2 = p1.X + p2.X + 20
        if p4.X >= v2 then
            v1 = p1 + Vector2.new(20, 0)
        else
            v2 = p1.Y + p2.Y + 20
            if p4.Y >= v2 then
                v1 = p1 + Vector2.new(0, 20)
            else
                v1 = p1 + Vector2.new(0, -(20 + p2.Y))
            end
        end
        local v3 = math.min(v1.X + p2.X, p4.X)
        local v4 = math.max(v3 - p2.X, p3.X)
        local v5 = math.min(v1.Y + p2.Y, p4.Y)
        v3 = v5 - p2.Y
        return (Vector2.new(v4, (math.max(v3, p3.Y))))
    end
    function u5.isPosInsideRect(p1, p2, p3) -- Line: 57
        local v1 = if p2.X < p1.X then if p1.X < p3.X then if p2.Y < p1.Y then p1.Y < p3.Y else false else false else false
        return v1
    end
    function u5.extend(p1, p2) -- Line: 61
        local v1 = table.clone(p1)
        local v2 = p2
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1[i] = j
        end
        return v1
    end
    function u5.UIPadding(p1, p2) -- Line: 69
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingLeft = UDim.new(0, p2.X)
        UIPadding.PaddingRight = UDim.new(0, p2.X)
        UIPadding.PaddingTop = UDim.new(0, p2.Y)
        UIPadding.PaddingBottom = UDim.new(0, p2.Y)
        UIPadding.Parent = p1
        return UIPadding
    end
    function u5.UIListLayout(p1, p2, p3) -- Line: 79
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = p3
        UIListLayout.FillDirection = p2
        UIListLayout.Parent = p1
        return UIListLayout
    end
    function u5.UIStroke(p1, p2, p3, p4) -- Line: 88
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Thickness = p2
        UIStroke.Color = p3
        UIStroke.Transparency = p4
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Parent = p1
        return UIStroke
    end
    function u5.UICorner(p1, p2) -- Line: 99
        local v1
        local UICorner = Instance.new("UICorner")
        if not p2 then
            v1 = 1
        else
            v1 = 0
        end
        UICorner.CornerRadius = UDim.new(v1, p2 or 0)
        UICorner.Parent = p1
        return UICorner
    end
    function u5.UISizeConstraint(p1, p2, p3) -- Line: 106
        local UISizeConstraint = Instance.new("UISizeConstraint")
        local MinSize = p2
        if not MinSize then
            MinSize = UISizeConstraint.MinSize
        end
        UISizeConstraint.MinSize = MinSize
        local MaxSize = p3
        if not MaxSize then
            MaxSize = UISizeConstraint.MaxSize
        end
        UISizeConstraint.MaxSize = MaxSize
        UISizeConstraint.Parent = p1
        return UISizeConstraint
    end
    function u5.UIReference(p1, p2, p3) -- Line: 114
        local ObjectValue = Instance.new("ObjectValue")
        ObjectValue.Name = p3
        ObjectValue.Value = p2
        ObjectValue.Parent = p1
        return ObjectValue
    end
    function u5.getScreenSizeForWindow(p1) -- Line: 123
        if p1.usesScreenGUI then
            return p1.Instance.AbsoluteSize
        end
        local Parent = p1.Instance.Parent
        if Parent:IsA("GuiBase2d") or Parent.Parent:IsA("GuiBase2d") then
            return Parent.AbsoluteSize
        end
        return workspace.CurrentCamera.ViewportSize
    end
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Font = p1._config.TextFont
    GetTextBoundsParams.Size = p1._config.TextSize
    GetTextBoundsParams.Width = (1 / 0)
    function u5.calculateTextSize(p1, p2) -- Line: 148 -- upvalues: GetTextBoundsParams (val), u5 (upval)
        if p2 then
            GetTextBoundsParams.Width = p2
        end
        GetTextBoundsParams.Text = p1
        local TextBoundsAsync = u5.TextService:GetTextBoundsAsync(GetTextBoundsParams)
        if p2 then
            GetTextBoundsParams.Width = (1 / 0)
        end
        return TextBoundsAsync
    end
    function u5.applyTextStyle(a1) -- Line: 163 -- upvalues: p1 (val)
        a1.FontFace = p1._config.TextFont
        a1.TextSize = p1._config.TextSize
        a1.TextColor3 = p1._config.TextColor
        a1.TextTransparency = p1._config.TextTransparency
        a1.TextXAlignment = Enum.TextXAlignment.Left
        a1.AutoLocalize = false
        a1.RichText = false
    end
    function u5.applyInteractionHighlights(a1, p2, p3) -- Line: 174 -- upvalues: p1 (val)
        local u3 = false
        a1.MouseEnter:Connect(function() -- Line: 176 -- upvalues: p2 (val), p3 (val), u3 (ref)
            p2.BackgroundColor3 = p3.ButtonHoveredColor
            p2.BackgroundTransparency = p3.ButtonHoveredTransparency
            u3 = false
        end)
        a1.MouseLeave:Connect(function() -- Line: 183 -- upvalues: p2 (val), p3 (val), u3 (ref)
            p2.BackgroundColor3 = p3.ButtonColor
            p2.BackgroundTransparency = p3.ButtonTransparency
            u3 = true
        end)
        a1.InputBegan:Connect(function(p1) -- Line: 190 -- upvalues: p2 (val), p3 (val)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                p2.BackgroundColor3 = p3.ButtonActiveColor
                p2.BackgroundTransparency = p3.ButtonActiveTransparency
                return
            end
            if p1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
            p2.BackgroundColor3 = p3.ButtonActiveColor
            p2.BackgroundTransparency = p3.ButtonActiveTransparency
        end)
        a1.InputEnded:Connect(function(p1) -- Line: 198 -- upvalues: u3 (ref), p2 (val), p3 (val)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                if u3 then
                    return
                end
                if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                    p2.BackgroundColor3 = p3.ButtonHoveredColor
                    p2.BackgroundTransparency = p3.ButtonHoveredTransparency
                end
                if p1.UserInputType == Enum.UserInputType.Gamepad1 then
                    p2.BackgroundColor3 = p3.ButtonColor
                    p2.BackgroundTransparency = p3.ButtonTransparency
                end
                return
            elseif p1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
        end)
        a1.SelectionImageObject = p1.SelectionImageObject
    end
    function u5.applyInteractionHighlightsWithMultiHighlightee(a1, p2) -- Line: 215 -- upvalues: p1 (val)
        local u2 = false
        a1.MouseEnter:Connect(function() -- Line: 217 -- upvalues: p2 (val), u2 (ref)
            local v1 = p2
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j[1].BackgroundColor3 = j[2].ButtonHoveredColor
                j[1].BackgroundTransparency = j[2].ButtonHoveredTransparency
                u2 = false
            end
        end)
        a1.MouseLeave:Connect(function() -- Line: 226 -- upvalues: p2 (val), u2 (ref)
            local v1 = p2
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j[1].BackgroundColor3 = j[2].ButtonColor
                j[1].BackgroundTransparency = j[2].ButtonTransparency
                u2 = true
            end
        end)
        a1.InputBegan:Connect(function(p1) -- Line: 235 -- upvalues: p2 (val)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                local v1 = p2
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    j[1].BackgroundColor3 = j[2].ButtonActiveColor
                    j[1].BackgroundTransparency = j[2].ButtonActiveTransparency
                end
                return
            elseif p1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
        end)
        a1.InputEnded:Connect(function(p1) -- Line: 245 -- upvalues: u2 (ref), p2 (val)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                if u2 then
                    return
                end
                local v1 = p2
                local v2 = nil
                local v3 = nil
                local v4 = p1
                for i, j in v1, v2, v3 do
                    if v4.UserInputType == Enum.UserInputType.MouseButton1 then
                        j[1].BackgroundColor3 = j[2].ButtonHoveredColor
                        j[1].BackgroundTransparency = j[2].ButtonHoveredTransparency
                    end
                    if v4.UserInputType == Enum.UserInputType.Gamepad1 then
                        j[1].BackgroundColor3 = j[2].ButtonColor
                        j[1].BackgroundTransparency = j[2].ButtonTransparency
                    end
                end
                return
            elseif p1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
        end)
        a1.SelectionImageObject = p1.SelectionImageObject
    end
    function u5.applyTextInteractionHighlights(a1, p2, p3) -- Line: 264 -- upvalues: p1 (val)
        local u3 = false
        a1.MouseEnter:Connect(function() -- Line: 266 -- upvalues: p2 (val), p3 (val), u3 (ref)
            p2.TextColor3 = p3.ButtonHoveredColor
            p2.TextTransparency = p3.ButtonHoveredTransparency
            u3 = false
        end)
        a1.MouseLeave:Connect(function() -- Line: 273 -- upvalues: p2 (val), p3 (val), u3 (ref)
            p2.TextColor3 = p3.ButtonColor
            p2.TextTransparency = p3.ButtonTransparency
            u3 = true
        end)
        a1.InputBegan:Connect(function(p1) -- Line: 280 -- upvalues: p2 (val), p3 (val)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                p2.TextColor3 = p3.ButtonActiveColor
                p2.TextTransparency = p3.ButtonActiveTransparency
                return
            end
            if p1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
            p2.TextColor3 = p3.ButtonActiveColor
            p2.TextTransparency = p3.ButtonActiveTransparency
        end)
        a1.InputEnded:Connect(function(p1) -- Line: 288 -- upvalues: u3 (ref), p2 (val), p3 (val)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                if u3 then
                    return
                end
                if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                    p2.TextColor3 = p3.ButtonHoveredColor
                    p2.TextTransparency = p3.ButtonHoveredTransparency
                end
                if p1.UserInputType == Enum.UserInputType.Gamepad1 then
                    p2.TextColor3 = p3.ButtonColor
                    p2.TextTransparency = p3.ButtonTransparency
                end
                return
            elseif p1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
        end)
        a1.SelectionImageObject = p1.SelectionImageObject
    end
    function u5.applyFrameStyle(a1, p2, p3) -- Line: 305 -- upvalues: p1 (val), u5 (upval)
        local FrameBorderSize = p1._config.FrameBorderSize
        local BorderColor = p1._config.BorderColor
        local FrameRounding = p1._config.FrameRounding
        if 0 >= FrameBorderSize then
            if FrameBorderSize >= 1 then
                if FrameRounding < 1 then
                    a1.BorderSizePixel = FrameBorderSize
                    a1.BorderColor3 = BorderColor
                    a1.BorderMode = Enum.BorderMode.Inset
                    if not p2 then
                        u5.UIPadding(a1, p1._config.FramePadding - Vector2.new(FrameBorderSize, FrameBorderSize))
                        return
                    end
                    if not p3 then
                        u5.UIPadding(a1, -Vector2.new(FrameBorderSize, FrameBorderSize))
                    end
                    return
                end
                return
            end
            if 0 < FrameRounding then
                a1.BorderSizePixel = 0
                u5.UICorner(a1, FrameRounding)
                if p2 then
                    return
                end
                u5.UIPadding(a1, p1._config.FramePadding)
                return
            end
            if FrameRounding >= 1 then
                return
            end
            a1.BorderSizePixel = FrameBorderSize
            a1.BorderColor3 = BorderColor
            a1.BorderMode = Enum.BorderMode.Inset
            if not p2 then
                u5.UIPadding(a1, p1._config.FramePadding - Vector2.new(FrameBorderSize, FrameBorderSize))
                return
            end
            if not p3 then
                u5.UIPadding(a1, -Vector2.new(FrameBorderSize, FrameBorderSize))
            end
            return
        elseif 0 < FrameRounding then
            a1.BorderSizePixel = 0
            local UIStroke = Instance.new("UIStroke")
            UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke.LineJoinMode = Enum.LineJoinMode.Round
            UIStroke.Transparency = p1._config.ButtonTransparency
            UIStroke.Thickness = FrameBorderSize
            UIStroke.Color = BorderColor
            u5.UICorner(a1, FrameRounding)
            UIStroke.Parent = a1
            if p2 then
                return
            end
            u5.UIPadding(a1, p1._config.FramePadding)
            return
        end
    end
    function u5.discardState(p1) -- Line: 350
        local state = p1.state
        local v1 = nil
        local v2 = nil
        for i, j in state, v1, v2 do
            j.ConnectedWidgets[p1.ID] = nil
        end
    end
    v1 = {
        hover = function(p1) -- Line: 357
            local v1 = {}
            function v1.Init(a1) -- Line: 359 -- upvalues: p1 (val)
                local v1 = p1(a1)
                v1.MouseEnter:Connect(function() -- Line: 361 -- upvalues: a1 (val)
                    a1.isHoveredEvent = true
                end)
                v1.MouseLeave:Connect(function() -- Line: 364 -- upvalues: a1 (val)
                    a1.isHoveredEvent = false
                end)
                a1.isHoveredEvent = false
            end
            function v1.Get(p1) -- Line: 369
                return p1.isHoveredEvent
            end
            return v1
        end,
        click = function(a1) -- Line: 375 -- upvalues: p1 (val)
            local v1 = {}
            function v1.Init(a1_2) -- Line: 377 -- upvalues: a1 (val), p1 (upval)
                local v1 = a1(a1_2)
                a1_2.lastClickedTick = -1
                v1.MouseButton1Click:Connect(function() -- Line: 381 -- upvalues: a1_2 (val), p1 (upval)
                    a1_2.lastClickedTick = p1._cycleTick + 1
                end)
            end
            function v1.Get(a1) -- Line: 385 -- upvalues: p1 (upval)
                local v1 = a1.lastClickedTick == p1._cycleTick
                return v1
            end
            return v1
        end,
        rightClick = function(a1) -- Line: 391 -- upvalues: p1 (val)
            local v1 = {}
            function v1.Init(a1_2) -- Line: 393 -- upvalues: a1 (val), p1 (upval)
                local v1 = a1(a1_2)
                a1_2.lastRightClickedTick = -1
                v1.MouseButton2Click:Connect(function() -- Line: 397 -- upvalues: a1_2 (val), p1 (upval)
                    a1_2.lastRightClickedTick = p1._cycleTick + 1
                end)
            end
            function v1.Get(a1) -- Line: 401 -- upvalues: p1 (upval)
                local v1 = a1.lastRightClickedTick == p1._cycleTick
                return v1
            end
            return v1
        end,
    }
    function v1.doubleClick(a1) -- Line: 407 -- upvalues: u5 (upval), p1 (val)
        local v1 = {}
        function v1.Init(a1_2) -- Line: 409 -- upvalues: a1 (val), u5 (upval), p1 (upval)
            local v1 = a1(a1_2)
            a1_2.lastClickedTime = -1
            a1_2.lastClickedPosition = Vector2.zero
            a1_2.lastDoubleClickedTick = -1
            v1.MouseButton1Down:Connect(function(a1, p2) -- Line: 415 -- upvalues: u5 (upval), a1_2 (val), p1 (upval)
                local v1 = u5.getTime()
                local v2 = v1 - a1_2.lastClickedTime
                local v3 = v2 < p1._config.MouseDoubleClickTime
                if not v3 then
                    a1_2.lastClickedTime = v1
                    a1_2.lastClickedPosition = Vector2.new(a1, p2)
                    return
                end
                local v4 = Vector2.new(a1, p2)
                if (v4 - a1_2.lastClickedPosition).Magnitude < p1._config.MouseDoubleClickMaxDist then
                    a1_2.lastDoubleClickedTick = p1._cycleTick + 1
                    return
                end
                a1_2.lastClickedTime = v1
                a1_2.lastClickedPosition = Vector2.new(a1, p2)
            end)
        end
        function v1.Get(a1) -- Line: 426 -- upvalues: p1 (upval)
            local v1 = a1.lastDoubleClickedTick == p1._cycleTick
            return v1
        end
        return v1
    end
    function v1.ctrlClick(a1) -- Line: 432 -- upvalues: u5 (upval), p1 (val)
        local v1 = {}
        function v1.Init(a1_2) -- Line: 434 -- upvalues: a1 (val), u5 (upval), p1 (upval)
            local v1 = a1(a1_2)
            a1_2.lastCtrlClickedTick = -1
            v1.MouseButton1Click:Connect(function() -- Line: 438 -- upvalues: u5 (upval), a1_2 (val), p1 (upval)
                if u5.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    a1_2.lastCtrlClickedTick = p1._cycleTick + 1
                elseif u5.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                    a1_2.lastCtrlClickedTick = p1._cycleTick + 1
                end
            end)
        end
        function v1.Get(a1) -- Line: 444 -- upvalues: p1 (upval)
            local v1 = a1.lastCtrlClickedTick == p1._cycleTick
            return v1
        end
        return v1
    end
    function v1.shortcut(a1) -- Line: 450 -- upvalues: u5 (upval), p1 (val)
        local v1 = {}
        function v1.Init(a1_2) -- Line: 452 -- upvalues: a1 (val), u5 (upval), p1 (upval)
            local u4, v1
            v1, u4 = a1(a1_2)
            a1_2.lastShortcutTick = -1
            u5.ContextActionService:BindAction(a1_2.ID, function(a1, p2, p3) -- Line: 456 -- upvalues: u4 (val), a1_2 (val), p1 (upval)
                if p2 == Enum.UserInputState.Begin and p3:IsModifierKeyDown(u4) then
                    a1_2.lastShortcutTick = p1._cycleTick + 1
                end
            end, false, v1)
        end
        function v1.Get(a1) -- Line: 464 -- upvalues: p1 (upval)
            local v1 = a1.lastShortcutTick == p1._cycleTick
            return v1
        end
        return v1
    end
    u5.EVENTS = v1
    local Root = require(script.Root)
    Root(p1, u5)
    local Window = require(script.Window)
    Window(p1, u5)
    local Menu = require(script.Menu)
    Menu(p1, u5)
    local Format = require(script.Format)
    Format(p1, u5)
    local Text = require(script.Text)
    Text(p1, u5)
    local Button = require(script.Button)
    Button(p1, u5)
    local Checkbox = require(script.Checkbox)
    Checkbox(p1, u5)
    local RadioButton = require(script.RadioButton)
    RadioButton(p1, u5)
    local Tree = require(script.Tree)
    Tree(p1, u5)
    local Input = require(script.Input)
    Input(p1, u5)
    local Combo = require(script.Combo)
    Combo(p1, u5)
    local Table = require(script.Table)
    Table(p1, u5)
end