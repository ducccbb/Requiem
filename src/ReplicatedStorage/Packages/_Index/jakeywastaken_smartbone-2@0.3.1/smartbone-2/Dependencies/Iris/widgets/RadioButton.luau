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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.RadioButton
--                              Dumped in 0.000720 seconds
--                          Bytecode version 9  |  15 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    p1.WidgetConstructor("RadioButton", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, Index = 2},
        Events = {
            selected = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 14 -- upvalues: p1 (val)
                    local v1 = a1.lastSelectedTick == p1._cycleTick
                    return v1
                end,
            },
            unselected = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 20 -- upvalues: p1 (val)
                    local v1 = a1.lastUnselectedTick == p1._cycleTick
                    return v1
                end,
            },
            active = {
                Init = function(p1) end,
                Get = function(p1) -- Line: 26
                    local v1 = p1.state.index.value == p1.arguments.Index
                    return v1
                end,
            },
            hovered = p2.EVENTS.hover(function(p1) -- Line: 30
                return p1.Instance
            end),
        },
        Generate = function(a1) -- Line: 34 -- upvalues: p1 (val), p2 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Iris_RadioButton"
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Size = UDim2.fromOffset(0, 0)
            TextButton.Text = ""
            TextButton.AutomaticSize = Enum.AutomaticSize.XY
            TextButton.ZIndex = a1.ZIndex
            TextButton.AutoButtonColor = false
            TextButton.LayoutOrder = a1.ZIndex
            local v1 = p1._config.TextSize + 2 * (p1._config.FramePadding.Y - 1)
            local Frame = Instance.new("Frame")
            Frame.Name = "Button"
            Frame.Size = UDim2.fromOffset(v1, v1)
            Frame.ZIndex = a1.ZIndex + 1
            Frame.LayoutOrder = a1.ZIndex + 1
            Frame.Parent = TextButton
            Frame.BackgroundColor3 = p1._config.FrameBgColor
            Frame.BackgroundTransparency = p1._config.FrameBgTransparency
            p2.UICorner(Frame)
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Circle"
            Frame_2.Position = UDim2.fromOffset(p1._config.FramePadding.Y, p1._config.FramePadding.Y)
            Frame_2.Size = UDim2.fromOffset(p1._config.TextSize - 2, p1._config.TextSize - 2)
            Frame_2.ZIndex = a1.ZIndex + 1
            Frame_2.LayoutOrder = a1.ZIndex + 1
            Frame_2.Parent = Frame
            Frame_2.BackgroundColor3 = p1._config.CheckMarkColor
            Frame_2.BackgroundTransparency = p1._config.CheckMarkTransparency
            p2.UICorner(Frame_2)
            p2.applyInteractionHighlights(TextButton, Frame, {
                ButtonColor = p1._config.FrameBgColor,
                ButtonTransparency = p1._config.FrameBgTransparency,
                ButtonHoveredColor = p1._config.FrameBgHoveredColor,
                ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
                ButtonActiveColor = p1._config.FrameBgActiveColor,
                ButtonActiveTransparency = p1._config.FrameBgActiveTransparency,
            })
            TextButton.MouseButton1Click:Connect(function() -- Line: 78 -- upvalues: a1 (val)
                a1.state.index:set(a1.arguments.Index)
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            p2.applyTextStyle(TextLabel)
            TextLabel.Position = UDim2.new(0, v1 + p1._config.ItemInnerSpacing.X, 0.5, 0)
            TextLabel.ZIndex = a1.ZIndex + 1
            TextLabel.LayoutOrder = a1.ZIndex + 1
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.AnchorPoint = Vector2.new(0, 0.5)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.Parent = TextButton
            return TextButton
        end,
        Update = function(a1) -- Line: 96 -- upvalues: p1 (val)
            a1.Instance.TextLabel.Text = a1.arguments.Text or "Radio Button"
            if a1.state then
                p1._widgets[a1.type].UpdateState(a1)
            end
        end,
        Discard = function(p1) -- Line: 105 -- upvalues: p2 (val)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end,
        GenerateState = function(a1) -- Line: 109 -- upvalues: p1 (val)
            if a1.state.index == nil then
                a1.state.index = p1._widgetState(a1, "index", a1.arguments.Value)
            end
        end,
        UpdateState = function(a1) -- Line: 114 -- upvalues: p1 (val)
            local Circle = a1.Instance.Button.Circle
            if a1.state.index.value == a1.arguments.Index then
                Circle.BackgroundTransparency = p1._config.CheckMarkTransparency
                a1.lastSelectedTick = p1._cycleTick + 1
                return
            end
            Circle.BackgroundTransparency = 1
            a1.lastUnselectedTick = p1._cycleTick + 1
        end,
    })
end