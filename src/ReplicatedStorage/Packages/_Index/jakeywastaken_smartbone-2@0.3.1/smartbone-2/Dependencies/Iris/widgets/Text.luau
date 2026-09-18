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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Text
--                              Dumped in 0.000684 seconds
--                          Bytecode version 9  |  10 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    p1.WidgetConstructor("Text", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1, Wrapped = 2, Color = 3, RichText = 4},
        Events = {hovered = p2.EVENTS.hover(function(p1) -- Line: 14
            return p1.Instance
        end)},
        Generate = function(p1) -- Line: 18 -- upvalues: p2 (val)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "Iris_Text"
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = p1.ZIndex
            TextLabel.LayoutOrder = p1.ZIndex
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            p2.applyTextStyle(TextLabel)
            p2.UIPadding(TextLabel, Vector2.new(0, 2))
            return TextLabel
        end,
        Update = function(a1) -- Line: 33 -- upvalues: p1 (val)
            local Instance = a1.Instance
            if a1.arguments.Text == nil then
                error("Iris.Text Text Argument is required", 5)
            end
            if not a1.arguments.Wrapped then
                Instance.TextWrapped = false
            else
                Instance.TextWrapped = true
            end
            if not a1.arguments.Color then
                Instance.TextColor3 = p1._config.TextColor
            else
                Instance.TextColor3 = a1.arguments.Color
            end
            if not a1.arguments.RichText then
                Instance.RichText = false
            else
                Instance.RichText = true
            end
            Instance.Text = a1.arguments.Text
        end,
        Discard = function(p1) -- Line: 56
            p1.Instance:Destroy()
        end,
    })
    p1.WidgetConstructor("SeparatorText", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1},
        Events = {hovered = p2.EVENTS.hover(function(p1) -- Line: 68
            return p1.Instance
        end)},
        Generate = function(a1) -- Line: 72 -- upvalues: p2 (val), p1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_SeparatorText"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            Frame.ClipsDescendants = true
            p2.UIPadding(Frame, Vector2.new(0, p1._config.SeparatorTextPadding.Y))
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemSpacing.X))
            Frame.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.ZIndex = a1.ZIndex + 1
            TextLabel.LayoutOrder = a1.ZIndex + 1
            p2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Left"
            Frame_2.AnchorPoint = Vector2.new(1, 0.5)
            Frame_2.BackgroundColor3 = p1._config.SeparatorColor
            Frame_2.BackgroundTransparency = p1._config.SeparatorTransparency
            Frame_2.BorderSizePixel = 0
            Frame_2.Size = UDim2.fromOffset(p1._config.SeparatorTextPadding.X - p1._config.ItemSpacing.X, p1._config.SeparatorTextBorderSize)
            Frame_2.ZIndex = a1.ZIndex
            Frame_2.LayoutOrder = a1.ZIndex
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Right"
            Frame_3.AnchorPoint = Vector2.new(1, 0.5)
            Frame_3.BackgroundColor3 = p1._config.SeparatorColor
            Frame_3.BackgroundTransparency = p1._config.SeparatorTransparency
            Frame_3.BorderSizePixel = 0
            Frame_3.Size = UDim2.new(1, 0, 0, p1._config.SeparatorTextBorderSize)
            Frame_3.ZIndex = a1.ZIndex + 2
            Frame_3.LayoutOrder = a1.ZIndex + 2
            Frame_3.Parent = Frame
            return Frame
        end,
        Update = function(p1) -- Line: 126
            if p1.arguments.Text == nil then
                error("Iris.Text Text Argument is required", 5)
            end
            p1.Instance.TextLabel.Text = p1.arguments.Text
        end,
        Discard = function(p1) -- Line: 134
            p1.Instance:Destroy()
        end,
    })
end