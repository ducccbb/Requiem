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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Window
--                               Dumped in 0.00468 seconds
--                          Bytecode version 9  |  41 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local function relocateTooltips() -- Line: 4 -- upvalues: p1 (val), p2 (val)
        if p1._rootInstance == nil then
            return
        end
        local PopupScreenGui = p1._rootInstance:FindFirstChild("PopupScreenGui")
        if not PopupScreenGui then
            return
        end
        local TooltipContainer = PopupScreenGui.TooltipContainer
        local v1 = p2.findBestWindowPosForPopup(p2.getMouseLocation(), TooltipContainer.AbsoluteSize, p1._config.DisplaySafeAreaPadding, PopupScreenGui.AbsoluteSize)
        TooltipContainer.Position = UDim2.fromOffset(v1.X, v1.Y)
    end
    p2.UserInputService.InputChanged:Connect(relocateTooltips)
    local v1 = {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1},
    }
    local v2 = {}
    v1.Events = v2
    function v1.Generate(a1) -- Line: 32 -- upvalues: p1 (val), p2 (val)
        a1.parentWidget = p1._rootWidget
        local Frame = Instance.new("Frame")
        Frame.Name = "Iris_Tooltip"
        Frame.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
        Frame.AutomaticSize = Enum.AutomaticSize.Y
        Frame.BorderSizePixel = 0
        Frame.BackgroundTransparency = 1
        Frame.ZIndex = a1.ZIndex + 1
        Frame.LayoutOrder = a1.ZIndex + 1
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "TooltipText"
        TextLabel.Size = UDim2.fromOffset(0, 0)
        TextLabel.AutomaticSize = Enum.AutomaticSize.XY
        TextLabel.BackgroundColor3 = p1._config.WindowBgColor
        TextLabel.BackgroundTransparency = p1._config.WindowBgTransparency
        TextLabel.BorderSizePixel = p1._config.PopupBorderSize
        TextLabel.TextWrapped = true
        TextLabel.ZIndex = a1.ZIndex + 1
        TextLabel.LayoutOrder = a1.ZIndex + 1
        p2.applyTextStyle(TextLabel)
        p2.UIStroke(TextLabel, p1._config.WindowBorderSize, p1._config.BorderActiveColor, p1._config.BorderActiveTransparency)
        p2.UIPadding(TextLabel, p1._config.WindowPadding)
        if 0 < p1._config.PopupRounding then
            p2.UICorner(TextLabel, p1._config.PopupRounding)
        end
        TextLabel.Parent = Frame
        return Frame
    end
    function v1.Update(p1) -- Line: 66 -- upvalues: relocateTooltips (val)
        if p1.arguments.Text == nil then
            error("Iris.Text Text Argument is required", 5)
        end
        p1.Instance.TooltipText.Text = p1.arguments.Text
        relocateTooltips()
    end
    function v1.Discard(p1) -- Line: 75
        p1.Instance:Destroy()
    end
    p1.WidgetConstructor("Tooltip", v1)
    local u19 = 0
    local u20 = nil
    local u21 = false
    local u22 = nil
    local u23 = nil
    local u24 = false
    local u25 = false
    local u26 = false
    local Top = Enum.TopBottom.Top
    local Left = Enum.LeftRight.Left
    local u29 = nil
    local u30 = nil
    local u31 = false
    local u32 = {}
    local function quickSwapWindows() -- Line: 99 -- upvalues: p1 (val), u32 (val)
        local DisplayOrder
        if p1._config.UseScreenGUIs == false then
            return
        end
        local v1 = 65535
        local v2 = nil
        local v3 = u32
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j.state.isOpened.value and not j.arguments.NoNav and j.Instance:IsA("ScreenGui") then
                DisplayOrder = j.Instance.DisplayOrder
                if DisplayOrder < v1 then
                    v1 = DisplayOrder
                    v2 = j
                end
            end
        end
        if v2.state.isUncollapsed.value == false then
            v2.state.isUncollapsed:set(true)
        end
        p1.SetFocusedWindow(v2)
    end
    local function fitSizeToWindowBounds(a1, a2) -- Line: 126 -- upvalues: p1 (val), p2 (val)
        local v1 = Vector2.new(a1.state.position.value.X, a1.state.position.value.Y)
        local v2 = (p1._config.TextSize + p1._config.FramePadding.Y * 2) * 2
        local v3 = p2.getScreenSizeForWindow(a1)
        local v4 = Vector2.new(p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.X, p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.Y)
        local v5 = v3 - v1 - v4
        local v6 = math.clamp(a2.X, v2, (math.max(v5.X, v2)))
        return Vector2.new(v6, (math.clamp(a2.Y, v2, (math.max(v5.Y, v2)))))
    end
    local function fitPositionToWindowBounds(a1, a2) -- Line: 142 -- upvalues: p2 (val), p1 (val)
        local Instance = a1.Instance
        local v1 = p2.getScreenSizeForWindow(a1)
        local v2 = Vector2.new(p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.X, p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.Y)
        local v3 = v1.X - Instance.WindowButton.AbsoluteSize.X
        local v4 = math.clamp(a2.X, v2.X, (math.max(v2.X, v3 - v2.X)))
        local v5 = v1.Y - Instance.WindowButton.AbsoluteSize.Y
        return Vector2.new(v4, (math.clamp(a2.Y, v2.Y, (math.max(v2.Y, v5 - v2.Y)))))
    end
    function p1.SetFocusedWindow(a1) -- Line: 164 -- upvalues: u30 (ref), u31 (ref), u32 (val), p1 (val), u19 (ref), p2 (val)
        if u30 == a1 then
            return
        end
        if u31 and u30 ~= nil then
            if u32[u30.ID] then
                local WindowButton = u30.Instance.WindowButton
                local TitleBar = WindowButton.TitleBar
                if not u30.state.isUncollapsed.value then
                    TitleBar.BackgroundColor3 = p1._config.TitleBgCollapsedColor
                    TitleBar.BackgroundTransparency = p1._config.TitleBgCollapsedTransparency
                else
                    TitleBar.BackgroundColor3 = p1._config.TitleBgColor
                    TitleBar.BackgroundTransparency = p1._config.TitleBgTransparency
                end
                WindowButton.UIStroke.Color = p1._config.BorderColor
            end
            u31 = false
            u30 = nil
        end
        if a1 == nil then
            return
        end
        u31 = true
        u30 = a1
        local Instance = a1.Instance
        local WindowButton_2 = Instance.WindowButton
        local TitleBar_2 = WindowButton_2.TitleBar
        TitleBar_2.BackgroundColor3 = p1._config.TitleBgActiveColor
        TitleBar_2.BackgroundTransparency = p1._config.TitleBgActiveTransparency
        WindowButton_2.UIStroke.Color = p1._config.BorderActiveColor
        u19 = u19 + 1
        if a1.usesScreenGUI then
            Instance.DisplayOrder = u19 + p1._config.DisplayOrderOffset
        end
        if a1.state.isUncollapsed.value == false then
            a1.state.isUncollapsed:set(true)
        end
        if not p2.GuiService.SelectedObject then
            return
        end
        if TitleBar_2.Visible then
            p2.GuiService:Select(TitleBar_2)
            return
        end
        p2.GuiService:Select(Instance.ChildContainer)
    end
    p2.UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 221 -- upvalues: p1 (val), p2 (val), quickSwapWindows (val), u25 (ref), u26 (ref), u31 (ref), u30 (ref), Top (ref), Left (ref), u24 (ref), u23 (ref)
        if not a2 and a1.UserInputType == Enum.UserInputType.MouseButton1 then
            p1.SetFocusedWindow(nil)
        end
        if a1.KeyCode == Enum.KeyCode.Tab then
            if p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                quickSwapWindows()
            elseif not (p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
            end
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton1 and u25 and not u26 and u31 and u30 then
            local v1 = p2.getMouseLocation() - (u30.state.position.value + u30.state.size.value * 0.5)
            local v2 = math.abs(v1.X)
            local v3 = v2 * u30.state.size.value.Y
            local v4 = math.abs(v1.Y)
            if v4 * u30.state.size.value.X > v3 then
                local Top_2
                Left = Enum.LeftRight.Center
                if math.sign(v1.Y) ~= -1 then
                    Top_2 = Enum.TopBottom.Bottom
                else
                    Top_2 = Enum.TopBottom.Top
                end
                Top = Top_2
            else
                local Left_2
                Top = Enum.TopBottom.Center
                if math.sign(v1.X) ~= -1 then
                    Left_2 = Enum.LeftRight.Right
                else
                    Left_2 = Enum.LeftRight.Left
                end
                Left = Left_2
            end
            u24 = true
            u23 = u30
        end
    end)
    p2.UserInputService.TouchTapInWorld:Connect(function(a1, p2) -- Line: 252 -- upvalues: p1 (val)
        if not p2 then
            p1.SetFocusedWindow(nil)
        end
    end)
    p2.UserInputService.InputChanged:Connect(function(p1) -- Line: 258 -- upvalues: u21 (ref), u20 (ref), p2 (val), u22 (ref), fitPositionToWindowBounds (val), u24 (ref), u23 (ref), u29 (ref), Left (ref), Top (ref), fitSizeToWindowBounds (val)
        if u21 and u20 then
            local v1
            if p1.UserInputType ~= Enum.UserInputType.Touch then
                v1 = p2.getMouseLocation()
            else
                local Position = p1.Position
                v1 = Vector2.new(Position.X, Position.Y)
            end
            local v2 = fitPositionToWindowBounds(u20, v1 - u22)
            u20.Instance.WindowButton.Position = UDim2.fromOffset(v2.X, v2.Y)
            u20.state.position.value = v2
        end
        if u24 and u23 and u23.arguments.NoResize ~= true then
            local Delta, X, X_2, Y, Y_2
            local WindowButton = u23.Instance.WindowButton
            local v3 = Vector2.new(WindowButton.Position.X.Offset, WindowButton.Position.Y.Offset)
            local v4 = Vector2.new(WindowButton.Size.X.Offset, WindowButton.Size.Y.Offset)
            if p1.UserInputType ~= Enum.UserInputType.Touch then
                Delta = p2.getMouseLocation() - u29
            else
                Delta = p1.Delta
            end
            if Left ~= Enum.LeftRight.Left then
                X = 0
            else
                X = Delta.X
            end
            if Top ~= Enum.TopBottom.Top then
                Y = 0
            else
                Y = Delta.Y
            end
            if Left == Enum.LeftRight.Left then
                X_2 = -Delta.X
            elseif Left ~= Enum.LeftRight.Right then
                X_2 = 0
            else
                X_2 = Delta.X
            end
            if Top == Enum.TopBottom.Top then
                Y_2 = -Delta.Y
            elseif Top ~= Enum.TopBottom.Bottom then
                Y_2 = 0
            else
                Y_2 = Delta.Y
            end
            local v5 = v4 + Vector2.new(X_2, Y_2)
            local v6 = fitSizeToWindowBounds(u23, v5)
            local v7 = fitPositionToWindowBounds(u23, v3 + Vector2.new(X, Y))
            WindowButton.Size = UDim2.fromOffset(v6.X, v6.Y)
            u23.state.size.value = v6
            WindowButton.Position = UDim2.fromOffset(v7.X, v7.Y)
            u23.state.position.value = v7
        end
        u29 = p2.getMouseLocation()
    end)
    p2.UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 319 -- upvalues: u21 (ref), u20 (ref), u24 (ref), u23 (ref), quickSwapWindows (val)
        if p1.UserInputType == Enum.UserInputType.MouseButton1 then
            if u21 and u20 then
                local WindowButton = u20.Instance.WindowButton
                u21 = false
                u20.state.position:set(Vector2.new(WindowButton.Position.X.Offset, WindowButton.Position.Y.Offset))
            end
        elseif p1.UserInputType ~= Enum.UserInputType.Touch then
        end
        if p1.UserInputType == Enum.UserInputType.MouseButton1 then
            if u24 and u23 then
                u24 = false
                u23.state.size:set(u23.Instance.WindowButton.AbsoluteSize)
            end
        elseif p1.UserInputType ~= Enum.UserInputType.Touch then
        end
        if p1.KeyCode == Enum.KeyCode.ButtonX then
            quickSwapWindows()
        end
    end)
    p1.WidgetConstructor("Window", {
        hasState = true,
        hasChildren = true,
        Args = {
            Title = 1,
            NoTitleBar = 2,
            NoBackground = 3,
            NoCollapse = 4,
            NoClose = 5,
            NoMove = 6,
            NoScrollbar = 7,
            NoResize = 8,
            NoNav = 9,
            NoMenu = 10,
        },
        Events = {
            closed = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 363 -- upvalues: p1 (val)
                    local v1 = a1.lastClosedTick == p1._cycleTick
                    return v1
                end,
            },
            opened = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 369 -- upvalues: p1 (val)
                    local v1 = a1.lastOpenedTick == p1._cycleTick
                    return v1
                end,
            },
            collapsed = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 375 -- upvalues: p1 (val)
                    local v1 = a1.lastCollapsedTick == p1._cycleTick
                    return v1
                end,
            },
            uncollapsed = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 381 -- upvalues: p1 (val)
                    local v1 = a1.lastUncollapsedTick == p1._cycleTick
                    return v1
                end,
            },
            hovered = p2.EVENTS.hover(function(p1) -- Line: 385
                return p1.Instance.WindowButton
            end),
        },
        Generate = function(a1) -- Line: 390 -- upvalues: p1 (val), u32 (val), p2 (val), u20 (ref), u21 (ref), u22 (ref), u31 (ref), u30 (ref), u24 (ref), Top (ref), Left (ref), u23 (ref), u25 (ref), u26 (ref)
            local v1
            a1.parentWidget = p1._rootWidget
            a1.usesScreenGUI = p1._config.UseScreenGUIs
            u32[a1.ID] = a1
            if not a1.usesScreenGUI then
                v1 = Instance.new("Folder")
            else
                v1 = Instance.new("ScreenGui")
                v1.ResetOnSpawn = false
                v1.DisplayOrder = p1._config.DisplayOrderOffset
                v1.IgnoreGuiInset = p1._config.IgnoreGuiInset
            end
            v1.Name = "Iris_Window"
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "WindowButton"
            TextButton.Size = UDim2.fromOffset(0, 0)
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.ClipsDescendants = false
            TextButton.AutoButtonColor = false
            TextButton.Selectable = false
            TextButton.SelectionImageObject = p1.SelectionImageObject
            TextButton.ZIndex = a1.ZIndex + 1
            TextButton.LayoutOrder = a1.ZIndex + 1
            TextButton.SelectionGroup = true
            TextButton.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
            TextButton.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
            TextButton.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
            TextButton.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            p2.UIStroke(TextButton, p1._config.WindowBorderSize, p1._config.BorderColor, p1._config.BorderTransparency)
            TextButton.Parent = v1
            TextButton.InputBegan:Connect(function(a1_2) -- Line: 430 -- upvalues: a1 (val), p1 (upval), u20 (upval), u21 (upval), u22 (upval), p2 (upval)
                if a1_2.UserInputType == Enum.UserInputType.MouseMovement or a1_2.UserInputType == Enum.UserInputType.Keyboard then
                    return
                end
                if a1.state.isUncollapsed.value then
                    p1.SetFocusedWindow(a1)
                end
                if not a1.arguments.NoMove and a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
                    u20 = a1
                    u21 = true
                    u22 = p2.getMouseLocation() - a1.state.position.value
                end
            end)
            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Name = "ChildContainer"
            ScrollingFrame.Size = UDim2.fromScale(1, 1)
            ScrollingFrame.Position = UDim2.fromOffset(0, 0)
            ScrollingFrame.BackgroundColor3 = p1._config.WindowBgColor
            ScrollingFrame.BackgroundTransparency = p1._config.WindowBgTransparency
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollingFrame.ScrollBarImageTransparency = p1._config.ScrollbarGrabTransparency
            ScrollingFrame.ScrollBarImageColor3 = p1._config.ScrollbarGrabColor
            ScrollingFrame.CanvasSize = UDim2.fromScale(0, 1)
            ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            ScrollingFrame.ZIndex = a1.ZIndex + 3
            ScrollingFrame.LayoutOrder = a1.ZIndex + 3
            ScrollingFrame.ClipsDescendants = true
            p2.UIPadding(ScrollingFrame, p1._config.WindowPadding)
            ScrollingFrame.Parent = TextButton
            local PropertyChangedSignal = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition")
            PropertyChangedSignal:Connect(function() -- Line: 466 -- upvalues: a1 (val), ScrollingFrame (val)
                a1.state.scrollDistance.value = ScrollingFrame.CanvasPosition.Y
            end)
            ScrollingFrame.InputBegan:Connect(function(a1_2) -- Line: 471 -- upvalues: a1 (val), p1 (upval)
                if a1_2.UserInputType == Enum.UserInputType.MouseMovement or a1_2.UserInputType == Enum.UserInputType.Keyboard then
                    return
                end
                if a1.state.isUncollapsed.value then
                    p1.SetFocusedWindow(a1)
                end
            end)
            local Frame = Instance.new("Frame")
            Frame.Name = "TerminatingFrame"
            Frame.Size = UDim2.fromOffset(0, p1._config.WindowPadding.Y + p1._config.FramePadding.Y)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = 2147483632
            local v2 = p2.UIListLayout(ScrollingFrame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
            v2.VerticalAlignment = Enum.VerticalAlignment.Top
            Frame.Parent = ScrollingFrame
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "TitleBar"
            Frame_2.Size = UDim2.fromScale(1, 0)
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.BorderSizePixel = 0
            Frame_2.ZIndex = a1.ZIndex + 1
            Frame_2.LayoutOrder = a1.ZIndex + 1
            Frame_2.ClipsDescendants = true
            Frame_2.Parent = TextButton
            Frame_2.InputBegan:Connect(function(p1) -- Line: 504 -- upvalues: a1 (val), u20 (upval), u21 (upval), u22 (upval)
                if p1.UserInputType == Enum.UserInputType.Touch and not a1.arguments.NoMove then
                    u20 = a1
                    u21 = true
                    local Position = p1.Position
                    local v1 = Vector2.new(Position.X, Position.Y)
                    u22 = v1 - a1.state.position.value
                end
            end)
            local v3 = p1._config.TextSize + (p1._config.FramePadding.Y - 1) * 2
            local TextButton_2 = Instance.new("TextButton")
            TextButton_2.Name = "CollapseButton"
            TextButton_2.AnchorPoint = Vector2.new(0, 0.5)
            TextButton_2.Size = UDim2.fromOffset(v3, v3)
            TextButton_2.Position = UDim2.new(0, p1._config.FramePadding.X + 1, 0.5, 0)
            TextButton_2.AutomaticSize = Enum.AutomaticSize.None
            TextButton_2.BackgroundTransparency = 1
            TextButton_2.BorderSizePixel = 0
            TextButton_2.AutoButtonColor = false
            TextButton_2.Text = ""
            TextButton_2.ZIndex = a1.ZIndex + 4
            p2.UICorner(TextButton_2)
            TextButton_2.Parent = Frame_2
            TextButton_2.MouseButton1Click:Connect(function() -- Line: 533 -- upvalues: a1 (val)
                a1.state.isUncollapsed:set(not a1.state.isUncollapsed.value)
            end)
            local v4 = {
                ButtonTransparency = 1,
                ButtonColor = p1._config.ButtonColor,
                ButtonHoveredColor = p1._config.ButtonHoveredColor,
                ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
                ButtonActiveColor = p1._config.ButtonActiveColor,
                ButtonActiveTransparency = p1._config.ButtonActiveTransparency,
            }
            p2.applyInteractionHighlights(TextButton_2, TextButton_2, v4)
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Arrow"
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            local v5 = math.floor(v3 * 0.7)
            ImageLabel.Size = UDim2.fromOffset(v5, (math.floor(v3 * 0.7)))
            ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Image = p2.ICONS.MULTIPLICATION_SIGN
            ImageLabel.ImageColor3 = p1._config.TextColor
            ImageLabel.ImageTransparency = p1._config.TextTransparency
            ImageLabel.ZIndex = a1.ZIndex + 5
            ImageLabel.Parent = TextButton_2
            local TextButton_3 = Instance.new("TextButton")
            TextButton_3.Name = "CloseButton"
            TextButton_3.AnchorPoint = Vector2.new(1, 0.5)
            TextButton_3.Size = UDim2.fromOffset(v3, v3)
            TextButton_3.Position = UDim2.new(1, -(p1._config.FramePadding.X + 1), 0.5, 0)
            TextButton_3.AutomaticSize = Enum.AutomaticSize.None
            TextButton_3.BackgroundTransparency = 1
            TextButton_3.BorderSizePixel = 0
            TextButton_3.Text = ""
            TextButton_3.ZIndex = a1.ZIndex + 4
            TextButton_3.AutoButtonColor = false
            p2.UICorner(TextButton_3)
            TextButton_3.MouseButton1Click:Connect(function() -- Line: 574 -- upvalues: a1 (val)
                a1.state.isOpened:set(false)
            end)
            p2.applyInteractionHighlights(TextButton_3, TextButton_3, {
                ButtonTransparency = 1,
                ButtonColor = p1._config.ButtonColor,
                ButtonHoveredColor = p1._config.ButtonHoveredColor,
                ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
                ButtonActiveColor = p1._config.ButtonActiveColor,
                ButtonActiveTransparency = p1._config.ButtonActiveTransparency,
            })
            TextButton_3.Parent = Frame_2
            local ImageLabel_2 = Instance.new("ImageLabel")
            ImageLabel_2.Name = "Icon"
            ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
            local v6 = math.floor(v3 * 0.7)
            ImageLabel_2.Size = UDim2.fromOffset(v6, (math.floor(v3 * 0.7)))
            ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5)
            ImageLabel_2.BackgroundTransparency = 1
            ImageLabel_2.BorderSizePixel = 0
            ImageLabel_2.Image = p2.ICONS.MULTIPLICATION_SIGN
            ImageLabel_2.ImageColor3 = p1._config.TextColor
            ImageLabel_2.ImageTransparency = p1._config.TextTransparency
            ImageLabel_2.ZIndex = a1.ZIndex + 5
            ImageLabel_2.Parent = TextButton_3
            if p1._config.WindowTitleAlign == Enum.LeftRight.Left then
                v4 = 0
            elseif p1._config.WindowTitleAlign ~= Enum.LeftRight.Center then
                v4 = 1
            else
                v4 = 0.5
            end
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "Title"
            TextLabel.AnchorPoint = Vector2.new(v4, 0)
            TextLabel.Position = UDim2.fromScale(v4, 0)
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BorderSizePixel = 0
            TextLabel.BackgroundTransparency = 1
            TextLabel.ZIndex = a1.ZIndex + 3
            p2.applyTextStyle(TextLabel)
            p2.UIPadding(TextLabel, p1._config.FramePadding)
            TextLabel.Parent = Frame_2
            local v7 = p1._config.TextSize + p1._config.FramePadding.X
            local TextButton_4 = Instance.new("TextButton")
            TextButton_4.Name = "ResizeGrip"
            TextButton_4.AnchorPoint = Vector2.new(1, 1)
            TextButton_4.Size = UDim2.fromOffset(v7, v7)
            TextButton_4.Position = UDim2.fromScale(1, 1)
            TextButton_4.AutoButtonColor = false
            TextButton_4.BorderSizePixel = 0
            TextButton_4.BackgroundTransparency = 1
            TextButton_4.Text = p2.ICONS.BOTTOM_RIGHT_CORNER
            TextButton_4.TextSize = v7
            TextButton_4.TextColor3 = p1._config.ButtonColor
            TextButton_4.TextTransparency = p1._config.ButtonTransparency
            TextButton_4.LineHeight = 1.1
            TextButton_4.Selectable = false
            TextButton_4.ZIndex = a1.ZIndex + 3
            TextButton_4.Parent = TextButton
            p2.applyTextInteractionHighlights(TextButton_4, TextButton_4, {
                ButtonColor = p1._config.ButtonColor,
                ButtonTransparency = p1._config.ButtonTransparency,
                ButtonHoveredColor = p1._config.ButtonHoveredColor,
                ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
                ButtonActiveColor = p1._config.ButtonActiveColor,
                ButtonActiveTransparency = p1._config.ButtonActiveTransparency,
            })
            TextButton_4.MouseButton1Down:Connect(function() -- Line: 655 -- upvalues: u31 (upval), u30 (upval), a1 (val), p1 (upval), u24 (upval), Top (upval), Left (upval), u23 (upval)
                if not u31 then
                    p1.SetFocusedWindow(a1)
                elseif u30 ~= a1 then
                    p1.SetFocusedWindow(a1)
                end
                u24 = true
                Top = Enum.TopBottom.Bottom
                Left = Enum.LeftRight.Right
                u23 = a1
            end)
            local TextButton_5 = Instance.new("TextButton")
            TextButton_5.Name = "ResizeBorder"
            TextButton_5.Size = UDim2.new(1, p1._config.WindowResizePadding.X * 2, 1, p1._config.WindowResizePadding.Y * 2)
            TextButton_5.Position = UDim2.fromOffset(-p1._config.WindowResizePadding.X, -p1._config.WindowResizePadding.Y)
            TextButton_5.BackgroundTransparency = 1
            TextButton_5.BorderSizePixel = 0
            TextButton_5.Text = ""
            TextButton_5.AutoButtonColor = false
            TextButton_5.Active = true
            TextButton_5.Selectable = false
            TextButton_5.ZIndex = a1.ZIndex
            TextButton_5.LayoutOrder = a1.ZIndex
            TextButton_5.ClipsDescendants = false
            TextButton_5.Parent = TextButton
            TextButton_5.MouseEnter:Connect(function() -- Line: 681 -- upvalues: u30 (upval), a1 (val), u25 (upval)
                if u30 == a1 then
                    u25 = true
                end
            end)
            TextButton_5.MouseLeave:Connect(function() -- Line: 686 -- upvalues: u30 (upval), a1 (val), u25 (upval)
                if u30 == a1 then
                    u25 = false
                end
            end)
            TextButton.MouseEnter:Connect(function() -- Line: 692 -- upvalues: u30 (upval), a1 (val), u26 (upval)
                if u30 == a1 then
                    u26 = true
                end
            end)
            TextButton.MouseLeave:Connect(function() -- Line: 697 -- upvalues: u30 (upval), a1 (val), u26 (upval)
                if u30 == a1 then
                    u26 = false
                end
            end)
            return v1
        end,
        Update = function(a1) -- Line: 705 -- upvalues: p1 (val)
            local WindowButton = a1.Instance.WindowButton
            local TitleBar = WindowButton.TitleBar
            local Title = TitleBar.Title
            local MenuBar = WindowButton:FindFirstChild("MenuBar")
            local ChildContainer = WindowButton.ChildContainer
            local ResizeGrip = WindowButton.ResizeGrip
            local v1 = 0
            local v2 = 0
            if a1.arguments.NoResize == true then
                ResizeGrip.Visible = false
            else
                ResizeGrip.Visible = true
            end
            if not a1.arguments.NoScrollbar then
                ChildContainer.ScrollBarThickness = p1._config.ScrollbarSize
            else
                ChildContainer.ScrollBarThickness = 0
            end
            if not a1.arguments.NoTitleBar then
                TitleBar.Visible = true
                local Y = TitleBar.AbsoluteSize.Y
                v1 = v1 + Y
                v2 = v2 + Y
            else
                TitleBar.Visible = false
            end
            if MenuBar then
                if not a1.arguments.NoMenu then
                    MenuBar.Visible = true
                    v1 = v1 + MenuBar.AbsoluteSize.Y
                else
                    MenuBar.Visible = false
                end
                MenuBar.Position = UDim2.fromOffset(0, v2)
            end
            if not a1.arguments.NoBackground then
                ChildContainer.BackgroundTransparency = p1._config.WindowBgTransparency
            else
                ChildContainer.BackgroundTransparency = 1
            end
            local v3 = p1._config.FramePadding.X + p1._config.TextSize + p1._config.FramePadding.X * 2
            if not a1.arguments.NoCollapse then
                TitleBar.CollapseButton.Visible = true
                TitleBar.Title.UIPadding.PaddingLeft = UDim.new(0, v3)
            else
                TitleBar.CollapseButton.Visible = false
                TitleBar.Title.UIPadding.PaddingLeft = UDim.new(0, p1._config.FramePadding.X)
            end
            if not a1.arguments.NoClose then
                TitleBar.CloseButton.Visible = true
                TitleBar.Title.UIPadding.PaddingRight = UDim.new(0, v3)
            else
                TitleBar.CloseButton.Visible = false
                TitleBar.Title.UIPadding.PaddingRight = UDim.new(0, p1._config.FramePadding.X)
            end
            ChildContainer.Size = UDim2.new(1, 0, 1, -v1)
            ChildContainer.CanvasSize = UDim2.new(0, 0, 1, -v1)
            ChildContainer.Position = UDim2.fromOffset(0, v1)
            Title.Text = a1.arguments.Title or ""
        end,
        Discard = function(p1) -- Line: 775 -- upvalues: u30 (ref), u31 (ref), u20 (ref), u21 (ref), u23 (ref), u24 (ref), u32 (val), p2 (val)
            if u30 == p1 then
                u30 = nil
                u31 = false
            end
            if u20 == p1 then
                u20 = nil
                u21 = false
            end
            if u23 == p1 then
                u23 = nil
                u24 = false
            end
            u32[p1.ID] = nil
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
        ChildAdded = function(p1) -- Line: 792
            return p1.Instance.WindowButton.ChildContainer
        end,
        UpdateState = function(a1) -- Line: 797 -- upvalues: p1 (val), p2 (val)
            local value_2 = a1.state.size.value
            local value_3 = a1.state.position.value
            local value_4 = a1.state.isUncollapsed.value
            local value_5 = a1.state.isOpened.value
            local value = a1.state.scrollDistance.value
            local Instance = a1.Instance
            local WindowButton = Instance.WindowButton
            local TitleBar = WindowButton.TitleBar
            local ChildContainer = WindowButton.ChildContainer
            local ResizeGrip = WindowButton.ResizeGrip
            WindowButton.Size = UDim2.fromOffset(value_2.X, value_2.Y)
            WindowButton.Position = UDim2.fromOffset(value_3.X, value_3.Y)
            if not value_5 then
                if not a1.usesScreenGUI then
                    WindowButton.Visible = false
                else
                    Instance.Enabled = false
                    WindowButton.Visible = false
                end
                a1.lastClosedTick = p1._cycleTick + 1
            else
                if not a1.usesScreenGUI then
                    WindowButton.Visible = true
                else
                    Instance.Enabled = true
                    WindowButton.Visible = true
                end
                a1.lastOpenedTick = p1._cycleTick + 1
            end
            if not value_4 then
                TitleBar.CollapseButton.Arrow.Image = p2.ICONS.RIGHT_POINTING_TRIANGLE
                ChildContainer.Visible = false
                ResizeGrip.Visible = false
                WindowButton.Size = UDim2.fromOffset(value_2.X, TitleBar.AbsoluteSize.Y)
                a1.lastCollapsedTick = p1._cycleTick + 1
            else
                TitleBar.CollapseButton.Arrow.Image = p2.ICONS.DOWN_POINTING_TRIANGLE
                ChildContainer.Visible = true
                if a1.arguments.NoResize ~= true then
                    ResizeGrip.Visible = true
                end
                WindowButton.AutomaticSize = Enum.AutomaticSize.None
                a1.lastUncollapsedTick = p1._cycleTick + 1
            end
            if not value_5 then
                TitleBar.BackgroundColor3 = p1._config.TitleBgCollapsedColor
                TitleBar.BackgroundTransparency = p1._config.TitleBgCollapsedTransparency
                WindowButton.UIStroke.Color = p1._config.BorderColor
                p1.SetFocusedWindow(nil)
            elseif not value_4 then
                TitleBar.BackgroundColor3 = p1._config.TitleBgCollapsedColor
                TitleBar.BackgroundTransparency = p1._config.TitleBgCollapsedTransparency
                WindowButton.UIStroke.Color = p1._config.BorderColor
                p1.SetFocusedWindow(nil)
            else
                p1.SetFocusedWindow(a1)
            end
            if value and value ~= 0 then
                local u136 = #p1._postCycleCallbacks + 1
                local u139 = p1._cycleTick + 1
                p1._postCycleCallbacks[u136] = function() -- Line: 863 -- upvalues: p1 (upval), u139 (val), ChildContainer (val), value (val), u136 (val)
                    if p1._cycleTick == u139 then
                        ChildContainer.CanvasPosition = Vector2.new(0, value)
                        p1._postCycleCallbacks[u136] = nil
                    end
                end
            end
        end,
        GenerateState = function(a1) -- Line: 871 -- upvalues: p1 (val), u31 (ref), u30 (ref), fitPositionToWindowBounds (val), fitSizeToWindowBounds (val)
            local state
            if a1.state.size == nil then
                a1.state.size = p1._widgetState(a1, "size", Vector2.new(400, 300))
            end
            if a1.state.position == nil then
                local v1
                state = a1.state
                local _widgetState = p1._widgetState
                if not u31 then
                    v1 = Vector2.new(150, 250)
                elseif u30 then
                    v1 = u30.state.position.value + Vector2.new(15, 45)
                end
                state.position = _widgetState(a1, "position", v1)
            end
            a1.state.position.value = fitPositionToWindowBounds(a1, a1.state.position.value)
            a1.state.size.value = fitSizeToWindowBounds(a1, a1.state.size.value)
            if a1.state.isUncollapsed == nil then
                a1.state.isUncollapsed = p1._widgetState(a1, "isUncollapsed", true)
            end
            if a1.state.isOpened == nil then
                a1.state.isOpened = p1._widgetState(a1, "isOpened", true)
            end
            if a1.state.scrollDistance == nil then
                a1.state.scrollDistance = p1._widgetState(a1, "scrollDistance", 0)
            end
        end,
    })
end