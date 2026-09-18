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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Menu
--                               Dumped in 0.00316 seconds
--                          Bytecode version 9  |  44 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local u2 = false
    local u3 = nil
    local u4 = {}
    local function EmptyMenuStack(a1) -- Line: 8 -- upvalues: u4 (val), p1 (val), u2 (ref), u3 (ref)
        local v1, v2
        local v3 = #u4
        if not a1 then
            v1 = 1
        else
            v1 = a1 + 1
        end
        local v4 = -1
        for i = v3, v1, v4 do
            v2 = u4[i]
            v2.state.isOpened:set(false)
            v2.Instance.BackgroundColor3 = p1._config.HeaderColor
            v2.Instance.BackgroundTransparency = 1
            table.remove(u4, i)
        end
        if #u4 == 0 then
            u2 = false
            u3 = nil
        end
    end
    local function UpdateChildContainerTransform(a1) -- Line: 25 -- upvalues: p1 (val)
        local AbsoluteSize, Y, v1, v2
        local v3 = a1.parentWidget.type == "Menu"
        local Instance = a1.Instance
        local ChildContainer = a1.ChildContainer
        local v4 = math.max(ChildContainer.AbsoluteSize.X, Instance.AbsoluteSize.X)
        ChildContainer.Size = UDim2.fromOffset(v4, (math.max(ChildContainer.AbsoluteSize.Y, Instance.AbsoluteSize.Y)))
        if ChildContainer.Parent == nil then
            return
        end
        local AbsolutePosition = Instance.AbsolutePosition
        AbsoluteSize = Instance.AbsoluteSize
        local AbsoluteSize_2 = ChildContainer.AbsoluteSize
        local PopupBorderSize = p1._config.PopupBorderSize
        local AbsoluteSize_3 = ChildContainer.Parent.AbsoluteSize
        local v5 = AbsolutePosition.X + PopupBorderSize
        if a1.parentWidget.type == "Menu" then
            local X
            v2 = AbsolutePosition.X + AbsoluteSize_2.X
            if AbsoluteSize_3.X >= v2 then
                local X_2
                v2 = AbsolutePosition.X + PopupBorderSize
                if not v3 then
                    X_2 = 0
                else
                    X_2 = AbsoluteSize.X
                end
                v5 = v2 + X_2
            else
                v2 = AbsolutePosition.X - PopupBorderSize
                if not v3 then
                    X = 0
                else
                    X = AbsoluteSize_2.X
                end
                v5 = v2 - X
            end
        end
        v2 = AbsolutePosition.Y + AbsoluteSize_2.Y
        if AbsoluteSize_3.Y >= v2 then
            local Y_2
            if not v3 then
                Y_2 = AbsoluteSize.Y
            else
                Y_2 = 0
            end
            v1 = AbsolutePosition.Y + PopupBorderSize + Y_2
        else
            v2 = AbsolutePosition.Y - PopupBorderSize - AbsoluteSize_2.Y
            if not v3 then
                Y = 0
            else
                Y = AbsoluteSize.Y
                if not Y then
                    Y = 0
                end
            end
            v1 = v2 + Y
        end
        ChildContainer.Position = UDim2.fromOffset(v5, v1)
    end
    p2.UserInputService.InputBegan:Connect(function(p1) -- Line: 62 -- upvalues: u2 (ref), u3 (ref), p2 (val), u4 (val), EmptyMenuStack (val)
        if p1.UserInputType == Enum.UserInputType.MouseButton1 then
            local AbsolutePosition, v1, v2, v3, v4
            if u2 == false or u3 == nil then
                return
            end
            local v5 = false
            local v6 = p2.getMouseLocation()
            local v7 = u4
            local v8 = nil
            local v9 = nil
            for i, j in v7, v8, v9 do
                v3 = {j.ChildContainer, j.Instance}
                v4 = nil
                v1 = nil
                for k, n in v3, v4, v1 do
                    AbsolutePosition = n.AbsolutePosition
                    v2 = AbsolutePosition + n.AbsoluteSize
                    if p2.isPosInsideRect(v6, AbsolutePosition, v2) then
                        v5 = true
                        break
                    end
                end
            end
            if not v5 then
                EmptyMenuStack()
            end
            return
        elseif p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return
        end
    end)
    p1.WidgetConstructor("MenuBar", {
        hasState = false,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1) -- Line: 97 -- upvalues: p1 (val), p2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "MenuBar"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundColor3 = p1._config.MenubarBgColor
            Frame.BackgroundTransparency = p1._config.MenubarBgTransparency
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            Frame.ClipsDescendants = true
            p2.UIPadding(Frame, Vector2.new(p1._config.ItemSpacing.X, 2))
            local v1 = p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new())
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            return Frame
        end,
        Update = function(a1) -- Line: 114 -- upvalues: p1 (val)
            local parentWidget = a1.parentWidget
            if parentWidget.type ~= "Window" then
                if parentWidget.type == "Root" then
                    return
                end
                error("The MenuBar was not created directly under a window or root.")
                return
            end
            local Instance = parentWidget.Instance
            if Instance then
                Instance = parentWidget.Instance:FindFirstChild("WindowButton")
            end
            if Instance then
                a1.Instance.Parent = Instance
                local u15 = #p1._postCycleCallbacks + 1
                local u18 = p1._cycleTick + 1
                p1._postCycleCallbacks[u15] = function() -- Line: 125 -- upvalues: p1 (upval), u18 (val), parentWidget (val), u15 (val)
                    if p1._cycleTick == u18 then
                        p1._widgets.Window.Update(parentWidget)
                        p1._postCycleCallbacks[u15] = nil
                    end
                end
            end
        end,
        ChildAdded = function(p1) -- Line: 139
            return p1.Instance
        end,
        Discard = function(a1) -- Line: 142 -- upvalues: p1 (val)
            a1.Instance:Destroy()
            p1._widgets.Window.Update(a1.parentWidget)
        end,
    })
    p1.WidgetConstructor("Menu", {
        hasState = true,
        hasChildren = true,
        Args = {Text = 1},
        Events = {
            clicked = p2.EVENTS.click(function(p1) -- Line: 157
                return p1.Instance
            end),
            hovered = p2.EVENTS.hover(function(p1) -- Line: 160
                return p1.Instance
            end),
            opened = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 165 -- upvalues: p1 (val)
                    local v1 = a1.lastOpenedTick == p1._cycleTick
                    return v1
                end,
            },
            closed = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 171 -- upvalues: p1 (val)
                    local v1 = a1.lastClosedTick == p1._cycleTick
                    return v1
                end,
            },
        },
        Generate = function(a1) -- Line: 176 -- upvalues: p1 (val), p2 (val), u4 (val), u2 (ref), u3 (ref), EmptyMenuStack (val)
            local v1, v2
            local v3 = {
                ButtonTransparency = 1,
                ButtonColor = p1._config.HeaderColor,
                ButtonHoveredColor = p1._config.HeaderHoveredColor,
                ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
                ButtonActiveColor = p1._config.HeaderHoveredColor,
                ButtonActiveTransparency = p1._config.HeaderHoveredTransparency,
            }
            a1.ButtonColors = v3
            if a1.parentWidget.type ~= "Menu" then
                v1 = Instance.new("TextButton")
                v1.Name = "Menu"
                v1.Size = UDim2.fromScale(0, 0)
                v1.AutomaticSize = Enum.AutomaticSize.XY
                v1.BackgroundColor3 = p1._config.HeaderColor
                v1.BackgroundTransparency = 1
                v1.BorderSizePixel = 0
                v1.Text = ""
                v1.LayoutOrder = a1.ZIndex
                v1.ZIndex = a1.ZIndex
                v1.AutoButtonColor = false
                v1.ClipsDescendants = true
                p2.applyTextStyle(v1)
                p2.UIPadding(v1, Vector2.new(p1._config.ItemSpacing.X, p1._config.FramePadding.Y))
            else
                v1 = Instance.new("TextButton")
                v1.Name = "Menu"
                v1.BackgroundColor3 = p1._config.HeaderColor
                v1.BackgroundTransparency = 1
                v1.BorderSizePixel = 0
                v1.Size = UDim2.fromScale(1, 0)
                v1.Text = ""
                v1.AutomaticSize = Enum.AutomaticSize.Y
                v1.ZIndex = a1.ZIndex
                v1.LayoutOrder = a1.ZIndex
                v1.AutoButtonColor = false
                v3 = p2.UIPadding(v1, p1._config.FramePadding)
                v3.PaddingTop = v3.PaddingTop - UDim.new(0, 1)
                v2 = p2.UIListLayout(v1, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
                v2.VerticalAlignment = Enum.VerticalAlignment.Center
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Name = "TextLabel"
                TextLabel.AnchorPoint = Vector2.new(0, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.ZIndex = a1.ZIndex + 2
                TextLabel.LayoutOrder = a1.ZIndex + 2
                TextLabel.AutomaticSize = Enum.AutomaticSize.XY
                p2.applyTextStyle(TextLabel)
                TextLabel.Parent = v1
                local v4 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
                local v5 = v4 - math.round(v4 * 0.2) * 2
                local ImageLabel = Instance.new("ImageLabel")
                ImageLabel.Name = "Icon"
                ImageLabel.Size = UDim2.fromOffset(v5, v5)
                ImageLabel.BackgroundTransparency = 1
                ImageLabel.BorderSizePixel = 0
                ImageLabel.ImageColor3 = p1._config.TextColor
                ImageLabel.ImageTransparency = p1._config.TextTransparency
                ImageLabel.Image = p2.ICONS.RIGHT_POINTING_TRIANGLE
                ImageLabel.ZIndex = a1.ZIndex + 3
                ImageLabel.LayoutOrder = a1.ZIndex + 3
                ImageLabel.Parent = v1
            end
            p2.applyInteractionHighlights(v1, v1, a1.ButtonColors)
            v1.MouseButton1Click:Connect(function() -- Line: 252 -- upvalues: u4 (upval), a1 (val), u2 (upval), u3 (upval)
                local v1
                local v2 = #u4
                if v2 > 1 then
                    v1 = true
                else
                    v1 = not a1.state.isOpened.value
                end
                a1.state.isOpened:set(v1)
                u2 = v1
                if not v1 then
                    v2 = nil
                else
                    v2 = a1
                    if not v2 then
                        v2 = nil
                    end
                end
                u3 = v2
                v2 = #u4
                if v2 > 1 then
                    return
                end
                if v1 then
                    table.insert(u4, a1)
                    return
                end
                table.remove(u4)
            end)
            v1.MouseEnter:Connect(function() -- Line: 267 -- upvalues: u2 (upval), u3 (upval), a1 (val), u4 (upval), EmptyMenuStack (upval)
                if u2 and u3 and u3 ~= a1 then
                    local v1 = table.find(u4, a1.parentWidget)
                    EmptyMenuStack(v1)
                    a1.state.isOpened:set(true)
                    u3 = a1
                    u2 = true
                    table.insert(u4, a1)
                end
            end)
            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Name = "ChildContainer"
            ScrollingFrame.BackgroundColor3 = p1._config.WindowBgColor
            ScrollingFrame.BackgroundTransparency = p1._config.WindowBgTransparency
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.Size = UDim2.fromOffset(0, 0)
            ScrollingFrame.AutomaticSize = Enum.AutomaticSize.XY
            ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollingFrame.ScrollBarImageTransparency = p1._config.ScrollbarGrabTransparency
            ScrollingFrame.ScrollBarImageColor3 = p1._config.ScrollbarGrabColor
            ScrollingFrame.ScrollBarThickness = p1._config.ScrollbarSize
            ScrollingFrame.CanvasSize = UDim2.fromScale(0, 0)
            ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            ScrollingFrame.ZIndex = a1.ZIndex + 6
            ScrollingFrame.LayoutOrder = a1.ZIndex + 6
            ScrollingFrame.ClipsDescendants = true
            v2 = p2.UIListLayout(ScrollingFrame, Enum.FillDirection.Vertical, UDim.new(0, 1))
            v2.VerticalAlignment = Enum.VerticalAlignment.Top
            local _rootInstance = p1._rootInstance
            if _rootInstance then
                _rootInstance = p1._rootInstance:FindFirstChild("PopupScreenGui")
            end
            ScrollingFrame.Parent = _rootInstance
            a1.ChildContainer = ScrollingFrame
            p2.UIStroke(ScrollingFrame, p1._config.WindowBorderSize, p1._config.BorderColor, p1._config.BorderTransparency)
            p2.UIPadding(ScrollingFrame, Vector2.new(2, p1._config.WindowPadding.Y - p1._config.ItemSpacing.Y))
            return v1
        end,
        Update = function(p1) -- Line: 316
            local TextLabel
            local Instance = p1.Instance
            if p1.parentWidget.type ~= "Menu" then
                TextLabel = Instance
            else
                TextLabel = Instance.TextLabel
            end
            TextLabel.Text = p1.arguments.Text or "Menu"
        end,
        ChildAdded = function(p1, p2) -- Line: 326 -- upvalues: UpdateChildContainerTransform (val)
            UpdateChildContainerTransform(p1)
            return p1.ChildContainer
        end,
        ChildDiscarded = function(p1, p2) -- Line: 330 -- upvalues: UpdateChildContainerTransform (val)
            UpdateChildContainerTransform(p1)
        end,
        GenerateState = function(a1) -- Line: 333 -- upvalues: p1 (val)
            if a1.state.isOpened == nil then
                a1.state.isOpened = p1._widgetState(a1, "isOpened", false)
            end
        end,
        UpdateState = function(a1) -- Line: 338 -- upvalues: p1 (val), UpdateChildContainerTransform (val)
            local ChildContainer = a1.ChildContainer
            if not a1.state.isOpened.value then
                a1.lastClosedTick = p1._cycleTick + 1
                a1.ButtonColors.ButtonTransparency = 1
                ChildContainer.Visible = false
                return
            end
            a1.lastOpenedTick = p1._cycleTick + 1
            a1.ButtonColors.ButtonTransparency = p1._config.HeaderTransparency
            ChildContainer.Visible = true
            UpdateChildContainerTransform(a1)
        end,
        Discard = function(p1) -- Line: 353 -- upvalues: p2 (val)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
    })
    p1.WidgetConstructor("MenuItem", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1, KeyCode = 2, ModifierKey = 3},
        Events = {clicked = p2.EVENTS.click(function(p1) -- Line: 368
            return p1.Instance
        end), hovered = p2.EVENTS.hover(function(p1) -- Line: 371
            return p1.Instance
        end)},
        Generate = function(a1) -- Line: 375 -- upvalues: p2 (val), p1 (val), EmptyMenuStack (val), u2 (ref), u3 (ref), u4 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "MenuItem"
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Size = UDim2.fromScale(1, 0)
            TextButton.Text = ""
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.ZIndex = a1.ZIndex
            TextButton.LayoutOrder = a1.ZIndex
            TextButton.AutoButtonColor = false
            local v1 = p2.UIPadding(TextButton, p1._config.FramePadding)
            v1.PaddingTop = v1.PaddingTop - UDim.new(0, 1)
            p2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
            p2.applyInteractionHighlights(TextButton, TextButton, {
                ButtonTransparency = 1,
                ButtonColor = p1._config.HeaderColor,
                ButtonHoveredColor = p1._config.HeaderHoveredColor,
                ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
                ButtonActiveColor = p1._config.HeaderHoveredColor,
                ButtonActiveTransparency = p1._config.HeaderHoveredTransparency,
            })
            TextButton.MouseButton1Click:Connect(function() -- Line: 400 -- upvalues: EmptyMenuStack (upval)
                EmptyMenuStack()
            end)
            TextButton.MouseEnter:Connect(function() -- Line: 404 -- upvalues: a1 (val), u2 (upval), u3 (upval), u4 (upval), EmptyMenuStack (upval)
                local parentWidget = a1.parentWidget
                if u2 and u3 and u3 ~= parentWidget then
                    local v1 = table.find(u4, parentWidget)
                    EmptyMenuStack(v1)
                    u3 = parentWidget
                    u2 = true
                end
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.AnchorPoint = Vector2.new(0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = a1.ZIndex + 2
            TextLabel.LayoutOrder = a1.ZIndex + 2
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            p2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Shortcut"
            TextLabel_2.AnchorPoint = Vector2.new(0, 0)
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.ZIndex = a1.ZIndex + 3
            TextLabel_2.LayoutOrder = a1.ZIndex + 3
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            p2.applyTextStyle(TextLabel_2)
            TextLabel_2.Text = ""
            TextLabel_2.TextColor3 = p1._config.TextDisabledColor
            TextLabel_2.TextTransparency = p1._config.TextDisabledTransparency
            TextLabel_2.Parent = TextButton
            return TextButton
        end,
        Update = function(p1) -- Line: 447
            local Instance = p1.Instance
            Instance.TextLabel.Text = p1.arguments.Text
            if p1.arguments.KeyCode then
                Instance.Shortcut.Text = p1.arguments.ModifierKey.Name .. " + " .. p1.arguments.KeyCode.Name
            end
        end,
        Discard = function(p1) -- Line: 457
            p1.Instance:Destroy()
        end,
    })
    p1.WidgetConstructor("MenuToggle", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, KeyCode = 2, ModifierKey = 3},
        Events = {
            checked = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 473 -- upvalues: p1 (val)
                    local v1 = a1.lastCheckedTick == p1._cycleTick
                    return v1
                end,
            },
            unchecked = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 479 -- upvalues: p1 (val)
                    local v1 = a1.lastUncheckedTick == p1._cycleTick
                    return v1
                end,
            },
            hovered = p2.EVENTS.hover(function(p1) -- Line: 483
                return p1.Instance
            end),
        },
        Generate = function(a1) -- Line: 487 -- upvalues: p2 (val), p1 (val), EmptyMenuStack (val), u2 (ref), u3 (ref), u4 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "MenuItem"
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Size = UDim2.fromScale(1, 0)
            TextButton.Text = ""
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.ZIndex = a1.ZIndex
            TextButton.LayoutOrder = a1.ZIndex
            TextButton.AutoButtonColor = false
            local v1 = p2.UIPadding(TextButton, p1._config.FramePadding)
            v1.PaddingTop = v1.PaddingTop - UDim.new(0, 1)
            local v2 = p2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
            v2.VerticalAlignment = Enum.VerticalAlignment.Center
            p2.applyInteractionHighlights(TextButton, TextButton, {
                ButtonTransparency = 1,
                ButtonColor = p1._config.HeaderColor,
                ButtonHoveredColor = p1._config.HeaderHoveredColor,
                ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
                ButtonActiveColor = p1._config.HeaderHoveredColor,
                ButtonActiveTransparency = p1._config.HeaderHoveredTransparency,
            })
            TextButton.MouseButton1Click:Connect(function() -- Line: 512 -- upvalues: a1 (val), EmptyMenuStack (upval)
                a1.state.isChecked:set(not a1.state.isChecked.value)
                EmptyMenuStack()
            end)
            TextButton.MouseEnter:Connect(function() -- Line: 518 -- upvalues: a1 (val), u2 (upval), u3 (upval), u4 (upval), EmptyMenuStack (upval)
                local parentWidget = a1.parentWidget
                if u2 and u3 and u3 ~= parentWidget then
                    local v1 = table.find(u4, parentWidget)
                    EmptyMenuStack(v1)
                    u3 = parentWidget
                    u2 = true
                end
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.AnchorPoint = Vector2.new(0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = a1.ZIndex + 2
            TextLabel.LayoutOrder = a1.ZIndex + 2
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            p2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Shortcut"
            TextLabel_2.AnchorPoint = Vector2.new(0, 0)
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.ZIndex = a1.ZIndex + 3
            TextLabel_2.LayoutOrder = a1.ZIndex + 3
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            p2.applyTextStyle(TextLabel_2)
            TextLabel_2.Text = ""
            TextLabel_2.TextColor3 = p1._config.TextDisabledColor
            TextLabel_2.TextTransparency = p1._config.TextDisabledTransparency
            TextLabel_2.Parent = TextButton
            local v3 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
            local v4 = v3 - math.round(v3 * 0.2) * 2
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Icon"
            ImageLabel.Size = UDim2.fromOffset(v4, v4)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = p1._config.TextColor
            ImageLabel.ImageTransparency = p1._config.TextTransparency
            ImageLabel.Image = p2.ICONS.CHECK_MARK
            ImageLabel.ZIndex = a1.ZIndex + 4
            ImageLabel.LayoutOrder = a1.ZIndex + 4
            ImageLabel.Parent = TextButton
            return TextButton
        end,
        GenerateState = function(a1) -- Line: 578 -- upvalues: p1 (val)
            if a1.state.isChecked == nil then
                a1.state.isChecked = p1._widgetState(a1, "isChecked", false)
            end
        end,
        Update = function(p1) -- Line: 583
            local Instance = p1.Instance
            Instance.TextLabel.Text = p1.arguments.Text
            if p1.arguments.KeyCode then
                Instance.Shortcut.Text = p1.arguments.ModifierKey.Name .. " + " .. p1.arguments.KeyCode.Name
            end
        end,
        UpdateState = function(a1) -- Line: 593 -- upvalues: p2 (val), p1 (val)
            local Icon = a1.Instance.Icon
            if a1.state.isChecked.value then
                Icon.Image = p2.ICONS.CHECK_MARK
                a1.lastCheckedTick = p1._cycleTick + 1
                return
            end
            Icon.Image = ""
            a1.lastUncheckedTick = p1._cycleTick + 1
        end,
        Discard = function(p1) -- Line: 605 -- upvalues: p2 (val)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
    })
end