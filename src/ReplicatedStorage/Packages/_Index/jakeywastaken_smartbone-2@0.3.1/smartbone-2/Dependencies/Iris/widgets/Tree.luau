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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Tree
--                               Dumped in 0.00150 seconds
--                          Bytecode version 9  |  17 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local v1 = {
        hasState = true,
        hasChildren = true,
        Events = {
            collasped = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 10 -- upvalues: p1 (val)
                    local v1 = a1.lastCollapsedTick == p1._cycleTick
                    return v1
                end,
            },
            uncollapsed = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 16 -- upvalues: p1 (val)
                    local v1 = a1.lastUncollapsedTick == p1._cycleTick
                    return v1
                end,
            },
            hovered = p2.EVENTS.hover(function(p1) -- Line: 20
                return p1.Instance
            end),
        },
        Discard = function(p1) -- Line: 24 -- upvalues: p2 (val)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
        ChildAdded = function(p1) -- Line: 28
            local ChildContainer = p1.Instance.ChildContainer
            ChildContainer.Visible = p1.state.isUncollapsed.value
            return ChildContainer
        end,
        UpdateState = function(a1) -- Line: 36 -- upvalues: p2 (val), p1 (val)
            local DOWN_POINTING_TRIANGLE
            local value = a1.state.isUncollapsed.value
            local Instance = a1.Instance
            local ChildContainer = Instance.ChildContainer
            local Arrow = Instance.Header.Button.Arrow
            if not value then
                DOWN_POINTING_TRIANGLE = p2.ICONS.RIGHT_POINTING_TRIANGLE
            else
                DOWN_POINTING_TRIANGLE = p2.ICONS.DOWN_POINTING_TRIANGLE
                if not DOWN_POINTING_TRIANGLE then
                    DOWN_POINTING_TRIANGLE = p2.ICONS.RIGHT_POINTING_TRIANGLE
                end
            end
            Arrow.Image = DOWN_POINTING_TRIANGLE
            if not value then
                a1.lastCollapsedTick = p1._cycleTick + 1
            else
                a1.lastUncollapsedTick = p1._cycleTick + 1
            end
            ChildContainer.Visible = value
        end,
        GenerateState = function(a1) -- Line: 53 -- upvalues: p1 (val)
            if a1.state.isUncollapsed == nil then
                a1.state.isUncollapsed = p1._widgetState(a1, "isUncollapsed", false)
            end
        end,
    }
    local WidgetConstructor = p1.WidgetConstructor
    local v2 = {
        Args = {Text = 1, SpanAvailWidth = 2, NoIndent = 3},
    }
    function v2.Generate(a1) -- Line: 68 -- upvalues: p1 (val), p2 (val)
        local Frame = Instance.new("Frame")
        Frame.Name = "Iris_Tree"
        Frame.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, 0))
        Frame.AutomaticSize = Enum.AutomaticSize.Y
        Frame.BackgroundTransparency = 1
        Frame.BorderSizePixel = 0
        Frame.ZIndex = a1.ZIndex
        Frame.LayoutOrder = a1.ZIndex
        p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
        local Frame_2 = Instance.new("Frame")
        Frame_2.Name = "ChildContainer"
        Frame_2.Size = UDim2.fromScale(1, 0)
        Frame_2.AutomaticSize = Enum.AutomaticSize.Y
        Frame_2.BackgroundTransparency = 1
        Frame_2.BorderSizePixel = 0
        Frame_2.ZIndex = a1.ZIndex + 1
        Frame_2.LayoutOrder = a1.ZIndex + 1
        Frame_2.Visible = false
        p2.UIListLayout(Frame_2, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
        local v1 = p2.UIPadding(Frame_2, Vector2.new(0, 0))
        v1.PaddingTop = UDim.new(0, p1._config.ItemSpacing.Y)
        Frame_2.Parent = Frame
        local Frame_3 = Instance.new("Frame")
        Frame_3.Name = "Header"
        Frame_3.Size = UDim2.fromScale(1, 0)
        Frame_3.AutomaticSize = Enum.AutomaticSize.Y
        Frame_3.BackgroundTransparency = 1
        Frame_3.BorderSizePixel = 0
        Frame_3.ZIndex = a1.ZIndex
        Frame_3.LayoutOrder = a1.ZIndex
        Frame_3.Parent = Frame
        local TextButton = Instance.new("TextButton")
        TextButton.Name = "Button"
        TextButton.BackgroundTransparency = 1
        TextButton.BorderSizePixel = 0
        TextButton.Text = ""
        TextButton.ZIndex = a1.ZIndex
        TextButton.LayoutOrder = a1.ZIndex
        TextButton.AutoButtonColor = false
        p2.applyInteractionHighlights(TextButton, Frame_3, {
            ButtonTransparency = 1,
            ButtonColor = Color3.fromRGB(0, 0, 0),
            ButtonHoveredColor = p1._config.HeaderHoveredColor,
            ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
            ButtonActiveColor = p1._config.HeaderActiveColor,
            ButtonActiveTransparency = p1._config.HeaderActiveTransparency,
        })
        local v2 = p2.UIPadding(TextButton, Vector2.zero)
        v2.PaddingLeft = UDim.new(0, p1._config.FramePadding.X)
        local v3 = p2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.FramePadding.X))
        v3.VerticalAlignment = Enum.VerticalAlignment.Center
        TextButton.Parent = Frame_3
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "Arrow"
        ImageLabel.Size = UDim2.fromOffset(p1._config.TextSize, (math.floor(p1._config.TextSize * 0.7)))
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.BorderSizePixel = 0
        ImageLabel.ImageColor3 = p1._config.TextColor
        ImageLabel.ImageTransparency = p1._config.TextTransparency
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        ImageLabel.ZIndex = a1.ZIndex
        ImageLabel.LayoutOrder = a1.ZIndex
        ImageLabel.Parent = TextButton
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "TextLabel"
        TextLabel.Size = UDim2.fromOffset(0, 0)
        TextLabel.AutomaticSize = Enum.AutomaticSize.XY
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        TextLabel.ZIndex = a1.ZIndex
        TextLabel.LayoutOrder = a1.ZIndex
        local v4 = p2.UIPadding(TextLabel, Vector2.new(0, 0))
        v4.PaddingRight = UDim.new(0, 21)
        p2.applyTextStyle(TextLabel)
        TextLabel.Parent = TextButton
        TextButton.MouseButton1Click:Connect(function() -- Line: 160 -- upvalues: a1 (val)
            a1.state.isUncollapsed:set(not a1.state.isUncollapsed.value)
        end)
        return Frame
    end
    function v2.Update(a1) -- Line: 166 -- upvalues: p1 (val)
        local Instance = a1.Instance
        local Button = Instance.Header.Button
        local UIPadding = Instance.ChildContainer.UIPadding
        Button.TextLabel.Text = a1.arguments.Text or "Tree"
        if not a1.arguments.SpanAvailWidth then
            Button.AutomaticSize = Enum.AutomaticSize.XY
            Button.Size = UDim2.fromScale(0, 0)
        else
            Button.AutomaticSize = Enum.AutomaticSize.Y
            Button.Size = UDim2.fromScale(1, 0)
        end
        if a1.arguments.NoIndent then
            UIPadding.PaddingLeft = UDim.new(0, 0)
            return
        end
        UIPadding.PaddingLeft = UDim.new(0, p1._config.IndentSpacing)
    end
    WidgetConstructor("Tree", p2.extend(v1, v2))
    p1.WidgetConstructor("CollapsingHeader", p2.extend(v1, {
        Args = {Text = 1},
        Generate = function(a1) -- Line: 198 -- upvalues: p1 (val), p2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_CollapsingHeader"
            Frame.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "ChildContainer"
            Frame_2.Size = UDim2.fromScale(1, 0)
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            Frame_2.ZIndex = a1.ZIndex + 1
            Frame_2.LayoutOrder = a1.ZIndex + 1
            Frame_2.Visible = false
            p2.UIListLayout(Frame_2, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
            local v1 = p2.UIPadding(Frame_2, Vector2.new(0, 0))
            v1.PaddingTop = UDim.new(0, p1._config.ItemSpacing.Y)
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Header"
            Frame_3.Size = UDim2.fromScale(1, 0)
            Frame_3.AutomaticSize = Enum.AutomaticSize.Y
            Frame_3.BackgroundTransparency = 1
            Frame_3.BorderSizePixel = 0
            Frame_3.ZIndex = a1.ZIndex
            Frame_3.LayoutOrder = a1.ZIndex
            Frame_3.Parent = Frame
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Button"
            TextButton.Size = UDim2.new(1, 2 * p1._config.FramePadding.X, 0, 0)
            TextButton.Position = UDim2.fromOffset(-4, 0)
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.BackgroundColor3 = p1._config.HeaderColor
            TextButton.BackgroundTransparency = p1._config.HeaderTransparency
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.ZIndex = a1.ZIndex
            TextButton.LayoutOrder = a1.ZIndex
            TextButton.AutoButtonColor = false
            TextButton.ClipsDescendants = true
            p2.UIPadding(TextButton, Vector2.new(2 * p1._config.FramePadding.X, p1._config.FramePadding.Y))
            p2.applyFrameStyle(TextButton, true, true)
            local v2 = p2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, 2 * p1._config.FramePadding.X))
            v2.VerticalAlignment = Enum.VerticalAlignment.Center
            p2.applyInteractionHighlights(TextButton, TextButton, {
                ButtonColor = p1._config.HeaderColor,
                ButtonTransparency = p1._config.HeaderTransparency,
                ButtonHoveredColor = p1._config.HeaderHoveredColor,
                ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
                ButtonActiveColor = p1._config.HeaderActiveColor,
                ButtonActiveTransparency = p1._config.HeaderActiveTransparency,
            })
            TextButton.Parent = Frame_3
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Arrow"
            ImageLabel.Size = UDim2.fromOffset(p1._config.TextSize, (math.ceil(p1._config.TextSize * 0.8)))
            ImageLabel.AutomaticSize = Enum.AutomaticSize.Y
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = p1._config.TextColor
            ImageLabel.ImageTransparency = p1._config.TextTransparency
            ImageLabel.ScaleType = Enum.ScaleType.Fit
            ImageLabel.ZIndex = a1.ZIndex
            ImageLabel.LayoutOrder = a1.ZIndex
            ImageLabel.Parent = TextButton
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = a1.ZIndex
            TextLabel.LayoutOrder = a1.ZIndex
            local v3 = p2.UIPadding(TextLabel, Vector2.new(0, 0))
            v3.PaddingRight = UDim.new(0, 21)
            p2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            TextButton.MouseButton1Click:Connect(function() -- Line: 296 -- upvalues: a1 (val)
                a1.state.isUncollapsed:set(not a1.state.isUncollapsed.value)
            end)
            return Frame
        end,
        Update = function(p1) -- Line: 302
            p1.Instance.Header.Button.TextLabel.Text = p1.arguments.Text or "Collapsing Header"
        end,
    }))
end