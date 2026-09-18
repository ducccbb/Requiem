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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Combo
--                               Dumped in 0.00261 seconds
--                          Bytecode version 9  |  37 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local function onSelectionChange(p1) -- Line: 4
        if type(p1.state.index.value) == "boolean" then
            p1.state.index:set(not p1.state.index.value)
            return
        end
        p1.state.index:set(p1.arguments.Index)
    end
    p1.WidgetConstructor("Selectable", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, Index = 2, NoClick = 3},
        Events = {
            selected = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 23 -- upvalues: p1 (val)
                    local v1 = a1.lastSelectedTick == p1._cycleTick
                    return v1
                end,
            },
            unselected = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 29 -- upvalues: p1 (val)
                    local v1 = a1.lastUnselectedTick == p1._cycleTick
                    return v1
                end,
            },
            active = {
                Init = function(p1) end,
                Get = function(p1) -- Line: 35
                    local v1 = p1.state.index.value == p1.arguments.Index
                    return v1
                end,
            },
            clicked = p2.EVENTS.click(function(p1) -- Line: 39
                return p1.Instance.SelectableButton
            end),
            rightClicked = p2.EVENTS.rightClick(function(p1) -- Line: 43
                return p1.Instance.SelectableButton
            end),
            doubleClicked = p2.EVENTS.doubleClick(function(p1) -- Line: 47
                return p1.Instance.SelectableButton
            end),
            ctrlClicked = p2.EVENTS.ctrlClick(function(p1) -- Line: 51
                return p1.Instance.SelectableButton
            end),
            hovered = p2.EVENTS.hover(function(p1) -- Line: 55
                return p1.Instance.SelectableButton
            end),
        },
        Generate = function(a1) -- Line: 60 -- upvalues: p1 (val), p2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Selectable"
            Frame.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, p1._config.TextSize))
            Frame.AutomaticSize = Enum.AutomaticSize.None
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "SelectableButton"
            TextButton.Size = UDim2.new(1, 0, 1, p1._config.ItemSpacing.Y - 1)
            TextButton.Position = UDim2.fromOffset(0, -bit32.rshift(p1._config.ItemSpacing.Y, 1))
            TextButton.BackgroundColor3 = p1._config.HeaderColor
            TextButton.ZIndex = a1.ZIndex + 1
            TextButton.LayoutOrder = a1.ZIndex + 1
            p2.applyFrameStyle(TextButton)
            p2.applyTextStyle(TextButton)
            a1.ButtonColors = {
                ButtonTransparency = 1,
                ButtonColor = p1._config.HeaderColor,
                ButtonHoveredColor = p1._config.HeaderHoveredColor,
                ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
                ButtonActiveColor = p1._config.HeaderActiveColor,
                ButtonActiveTransparency = p1._config.HeaderActiveTransparency,
            }
            p2.applyInteractionHighlights(TextButton, TextButton, a1.ButtonColors)
            TextButton.MouseButton1Click:Connect(function() -- Line: 92 -- upvalues: a1 (val)
                if a1.arguments.NoClick == true then
                    return
                end
                local v1 = a1
                if type(v1.state.index.value) == "boolean" then
                    v1.state.index:set(not v1.state.index.value)
                    return
                end
                v1.state.index:set(v1.arguments.Index)
            end)
            TextButton.Parent = Frame
            return Frame
        end,
        Update = function(p1) -- Line: 102
            p1.Instance.SelectableButton.Text = p1.arguments.Text or "Selectable"
        end,
        Discard = function(p1) -- Line: 107 -- upvalues: p2 (val)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
        GenerateState = function(a1) -- Line: 111 -- upvalues: p1 (val)
            if a1.state.index == nil then
                if a1.arguments.Index ~= nil then
                    error("a shared state index is required for Selectables with an Index argument", 5)
                end
                a1.state.index = p1._widgetState(a1, "index", false)
            end
        end,
        UpdateState = function(a1) -- Line: 119 -- upvalues: p1 (val)
            local SelectableButton = a1.Instance.SelectableButton
            if not (a1.state.index.value ~= a1.arguments.Index or true) then
                a1.ButtonColors.ButtonTransparency = p1._config.HeaderTransparency
                SelectableButton.BackgroundTransparency = p1._config.HeaderTransparency
                a1.lastSelectedTick = p1._cycleTick + 1
                return
            end
            a1.ButtonColors.ButtonTransparency = 1
            SelectableButton.BackgroundTransparency = 1
            a1.lastUnselectedTick = p1._cycleTick + 1
        end,
    })
    local u46 = false
    local u47 = -1
    local u48 = nil
    local function UpdateChildContainerTransform(a1) -- Line: 138 -- upvalues: p1 (val)
        local PreviewContainer = a1.Instance.PreviewContainer
        local PreviewLabel = PreviewContainer.PreviewLabel
        local ChildContainer = a1.ChildContainer
        local v1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
        local PopupBorderSize = p1._config.PopupBorderSize
        local v2 = v1 * math.min(a1.ComboChildrenHeight, 8)
        local v3 = v2 - PopupBorderSize * 2 + 3 * p1._config.FramePadding.Y
        local v4 = UDim.new(0, PreviewContainer.AbsoluteSize.X - PopupBorderSize * 2)
        ChildContainer.Size = UDim2.new(v4, UDim.new(0, v3))
        local v5 = PreviewLabel.AbsolutePosition.Y + v1 + v3
        if ChildContainer.Parent.AbsoluteSize.Y < v5 then
            ChildContainer.Position = UDim2.new(0, PreviewLabel.AbsolutePosition.X + PopupBorderSize, 0, PreviewLabel.AbsolutePosition.Y - PopupBorderSize - v3)
            return
        end
        ChildContainer.Position = UDim2.new(0, PreviewLabel.AbsolutePosition.X + PopupBorderSize, 0, PreviewLabel.AbsolutePosition.Y + v1 + PopupBorderSize)
    end
    p2.UserInputService.InputBegan:Connect(function(a1) -- Line: 161 -- upvalues: u46 (ref), u47 (ref), p1 (val), p2 (val), u48 (ref)
        local ChildContainer, v1, v2
        if a1.UserInputType == Enum.UserInputType.MouseButton1 or a1.UserInputType == Enum.UserInputType.MouseButton2 then
            if u46 == false or u47 == p1._cycleTick then
                return
            end
            ChildContainer = u48.ChildContainer
            v1 = ChildContainer.AbsolutePosition - Vector2.new(0, u48.LabelHeight)
            v2 = ChildContainer.AbsolutePosition + ChildContainer.AbsoluteSize
            if not (p2.isPosInsideRect(p2.getMouseLocation(), v1, v2)) then
                u48.state.isOpened:set(false)
            end
            return
        end
        if a1.UserInputType ~= Enum.UserInputType.Touch or u46 == false or u47 == p1._cycleTick then
            return
        end
        ChildContainer = u48.ChildContainer
        v1 = ChildContainer.AbsolutePosition - Vector2.new(0, u48.LabelHeight)
        v2 = ChildContainer.AbsolutePosition + ChildContainer.AbsoluteSize
        if not (p2.isPosInsideRect(p2.getMouseLocation(), v1, v2)) then
            u48.state.isOpened:set(false)
        end
    end)
    p1.WidgetConstructor("Combo", {
        hasState = true,
        hasChildren = true,
        Args = {Text = 1, NoButton = 2, NoPreview = 3},
        Events = {
            opened = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 191 -- upvalues: p1 (val)
                    local v1 = a1.lastOpenedTick == p1._cycleTick
                    return v1
                end,
            },
            closed = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 197 -- upvalues: p1 (val)
                    local v1 = a1.lastClosedTick == p1._cycleTick
                    return v1
                end,
            },
            clicked = p2.EVENTS.click(function(p1) -- Line: 201
                return p1.Instance
            end),
            hovered = p2.EVENTS.hover(function(p1) -- Line: 204
                return p1.Instance
            end),
        },
        Generate = function(a1) -- Line: 208 -- upvalues: p1 (val), p2 (val), u46 (ref), u48 (ref)
            local v1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
            a1.ComboChildrenHeight = 0
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Combo"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.Y + 1))
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "PreviewContainer"
            TextButton.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.BackgroundTransparency = 1
            TextButton.Text = ""
            TextButton.ZIndex = a1.ZIndex + 2
            TextButton.LayoutOrder = a1.ZIndex + 2
            TextButton.AutoButtonColor = false
            p2.applyFrameStyle(TextButton, true, true)
            p2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, 0))
            TextButton.Parent = Frame
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "PreviewLabel"
            TextLabel.Size = UDim2.new(1, 0, 0, 0)
            TextLabel.AutomaticSize = Enum.AutomaticSize.Y
            TextLabel.BackgroundColor3 = p1._config.FrameBgColor
            TextLabel.BackgroundTransparency = p1._config.FrameBgTransparency
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = a1.ZIndex + 3
            TextLabel.LayoutOrder = a1.ZIndex + 3
            p2.applyTextStyle(TextLabel)
            p2.UIPadding(TextLabel, p1._config.FramePadding)
            TextLabel.Parent = TextButton
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "DropdownButton"
            TextLabel_2.Size = UDim2.new(0, v1, 0, v1)
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.BackgroundColor3 = p1._config.ButtonColor
            TextLabel_2.BackgroundTransparency = p1._config.ButtonTransparency
            TextLabel_2.Text = ""
            TextLabel_2.ZIndex = a1.ZIndex + 4
            TextLabel_2.LayoutOrder = a1.ZIndex + 4
            local v2 = math.round(v1 * 0.2)
            local v3 = v1 - v2 * 2
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Dropdown"
            ImageLabel.Size = UDim2.fromOffset(v3, v3)
            ImageLabel.Position = UDim2.fromOffset(v2, v2)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = p1._config.TextColor
            ImageLabel.ImageTransparency = p1._config.TextTransparency
            ImageLabel.ZIndex = a1.ZIndex + 5
            ImageLabel.LayoutOrder = a1.ZIndex + 5
            ImageLabel.Parent = TextLabel_2
            TextLabel_2.Parent = TextButton
            local v4 = {}
            local v5 = {}
            local v6 = {
                ButtonColor = p1._config.FrameBgColor,
                ButtonTransparency = p1._config.FrameBgTransparency,
                ButtonHoveredColor = p1._config.FrameBgHoveredColor,
                ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
                ButtonActiveColor = p1._config.FrameBgActiveColor,
                ButtonActiveTransparency = p1._config.FrameBgActiveTransparency,
            }
            v5[1] = TextLabel
            v5[2] = v6
            local v7 = {}
            local v8 = {
                ButtonColor = p1._config.ButtonColor,
                ButtonTransparency = p1._config.ButtonTransparency,
                ButtonHoveredColor = p1._config.ButtonHoveredColor,
                ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
                ButtonActiveColor = p1._config.ButtonHoveredColor,
                ButtonActiveTransparency = p1._config.ButtonHoveredColor,
            }
            v7[1] = TextLabel_2
            v7[2] = v8
            v4[1] = v5
            v4[2] = v7
            p2.applyInteractionHighlightsWithMultiHighlightee(TextButton, v4)
            TextButton.InputBegan:Connect(function(p1) -- Line: 308 -- upvalues: u46 (upval), u48 (upval), a1 (val)
                if not u46 then
                    if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                        a1.state.isOpened:set(not a1.state.isOpened.value)
                    elseif p1.UserInputType == Enum.UserInputType.Touch then
                        a1.state.isOpened:set(not a1.state.isOpened.value)
                    end
                    return
                elseif u48 ~= a1 then
                    return
                end
            end)
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Name = "TextLabel"
            TextLabel_3.Size = UDim2.fromOffset(0, v1)
            TextLabel_3.AutomaticSize = Enum.AutomaticSize.X
            TextLabel_3.BackgroundTransparency = 1
            TextLabel_3.BorderSizePixel = 0
            TextLabel_3.ZIndex = a1.ZIndex + 5
            TextLabel_3.LayoutOrder = a1.ZIndex + 5
            p2.applyTextStyle(TextLabel_3)
            TextLabel_3.Parent = Frame
            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Name = "ChildContainer"
            ScrollingFrame.BackgroundColor3 = p1._config.WindowBgColor
            ScrollingFrame.BackgroundTransparency = p1._config.WindowBgTransparency
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollingFrame.ScrollBarImageTransparency = p1._config.ScrollbarGrabTransparency
            ScrollingFrame.ScrollBarImageColor3 = p1._config.ScrollbarGrabColor
            ScrollingFrame.ScrollBarThickness = p1._config.ScrollbarSize
            ScrollingFrame.CanvasSize = UDim2.fromScale(0, 0)
            ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            ScrollingFrame.ZIndex = a1.ZIndex + 6
            ScrollingFrame.LayoutOrder = a1.ZIndex + 6
            ScrollingFrame.ClipsDescendants = true
            p2.UIStroke(ScrollingFrame, p1._config.WindowBorderSize, p1._config.BorderColor, p1._config.BorderTransparency)
            p2.UIPadding(ScrollingFrame, Vector2.new(2, 2 * p1._config.FramePadding.Y))
            v4 = p2.UIListLayout(ScrollingFrame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
            v4.VerticalAlignment = Enum.VerticalAlignment.Top
            local _rootInstance = p1._rootInstance
            if _rootInstance then
                _rootInstance = p1._rootInstance:WaitForChild("PopupScreenGui")
            end
            ScrollingFrame.Parent = _rootInstance
            a1.ChildContainer = ScrollingFrame
            return Frame
        end,
        Update = function(a1) -- Line: 365 -- upvalues: p1 (val)
            local Instance = a1.Instance
            local PreviewContainer = Instance.PreviewContainer
            local PreviewLabel = PreviewContainer.PreviewLabel
            local DropdownButton = PreviewContainer.DropdownButton
            Instance.TextLabel.Text = a1.arguments.Text or "Combo"
            if not a1.arguments.NoButton then
                DropdownButton.Visible = true
                PreviewLabel.Size = UDim2.new(1, -(p1._config.TextSize + 2 * p1._config.FramePadding.Y), 0, 0)
            else
                DropdownButton.Visible = false
                PreviewLabel.Size = UDim2.new(1, 0, 0, 0)
            end
            if a1.arguments.NoPreview then
                PreviewLabel.Visible = false
                PreviewContainer.Size = UDim2.new(0, 0, 0, 0)
                PreviewContainer.AutomaticSize = Enum.AutomaticSize.X
                return
            end
            PreviewLabel.Visible = true
            PreviewContainer.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
            PreviewContainer.AutomaticSize = Enum.AutomaticSize.Y
        end,
        ChildAdded = function(p1, p2) -- Line: 393 -- upvalues: UpdateChildContainerTransform (val)
            if p2.type == "Selectable" then
                p1.ComboChildrenHeight = p1.ComboChildrenHeight + 1
            else
                p1.ComboChildrenHeight = p1.ComboChildrenHeight + 10
            end
            UpdateChildContainerTransform(p1)
            return p1.ChildContainer
        end,
        ChildDiscarded = function(p1, p2) -- Line: 403
            if p2.type ~= "Selectable" then
                p1.ComboChildrenHeight = p1.ComboChildrenHeight - 10
                return
            end
            p1.ComboChildrenHeight = p1.ComboChildrenHeight - 1
        end,
        GenerateState = function(a1) -- Line: 410 -- upvalues: p1 (val)
            local state
            if a1.state.index == nil then
                state = a1.state
                state.index = p1._widgetState(a1, "index", "No Selection")
            end
            a1.state.index:onChange(function() -- Line: 414 -- upvalues: a1 (val)
                if a1.state.isOpened.value then
                    a1.state.isOpened:set(false)
                end
            end)
            if a1.state.isOpened == nil then
                local state_2 = a1.state
                state_2.isOpened = p1._widgetState(a1, "isOpened", false)
            end
        end,
        UpdateState = function(a1) -- Line: 423 -- upvalues: u46 (ref), u48 (ref), u47 (ref), p1 (val), p2 (val), UpdateChildContainerTransform (val)
            local Name, value
            local PreviewContainer = a1.Instance.PreviewContainer
            local PreviewLabel = PreviewContainer.PreviewLabel
            local Dropdown = PreviewContainer.DropdownButton.Dropdown
            local ChildContainer = a1.ChildContainer
            if not a1.state.isOpened.value then
                if u46 then
                    u46 = false
                    u48 = nil
                    a1.lastClosedTick = p1._cycleTick + 1
                end
                Dropdown.Image = p2.ICONS.DOWN_POINTING_TRIANGLE
                ChildContainer.Visible = false
            else
                u46 = true
                u48 = a1
                u47 = p1._cycleTick
                a1.lastOpenedTick = p1._cycleTick + 1
                Dropdown.Image = p2.ICONS.RIGHT_POINTING_TRIANGLE
                ChildContainer.Visible = true
                UpdateChildContainerTransform(a1)
            end
            value = a1.state.index.value
            if typeof(value) ~= "EnumItem" then
                Name = tostring(value)
            else
                Name = value.Name
            end
            PreviewLabel.Text = Name
        end,
        Discard = function(p1) -- Line: 455 -- upvalues: p2 (val)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
    })
end