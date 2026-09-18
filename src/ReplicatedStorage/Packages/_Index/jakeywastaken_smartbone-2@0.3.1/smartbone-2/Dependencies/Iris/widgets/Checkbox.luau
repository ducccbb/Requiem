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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Checkbox
--                              Dumped in 0.000688 seconds
--                          Bytecode version 9  |  13 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local WidgetConstructor = p1.WidgetConstructor
    local v1 = {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1},
        Events = {
            checked = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 13 -- upvalues: p1 (val)
                    local v1 = a1.lastCheckedTick == p1._cycleTick
                    return v1
                end,
            },
            unchecked = {
                Init = function(p1) end,
                Get = function(a1) -- Line: 19 -- upvalues: p1 (val)
                    local v1 = a1.lastUncheckedTick == p1._cycleTick
                    return v1
                end,
            },
            hovered = p2.EVENTS.hover(function(p1) -- Line: 23
                return p1.Instance
            end),
        },
    }
    function v1.Generate(a1) -- Line: 27 -- upvalues: p1 (val), p2 (val)
        local TextButton = Instance.new("TextButton")
        TextButton.Name = "Iris_Checkbox"
        TextButton.BackgroundTransparency = 1
        TextButton.BorderSizePixel = 0
        TextButton.Size = UDim2.fromOffset(0, 0)
        TextButton.Text = ""
        TextButton.AutomaticSize = Enum.AutomaticSize.XY
        TextButton.ZIndex = a1.ZIndex
        TextButton.AutoButtonColor = false
        TextButton.LayoutOrder = a1.ZIndex
        local v1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
        local Frame = Instance.new("Frame")
        Frame.Name = "CheckboxBox"
        Frame.Size = UDim2.fromOffset(v1, v1)
        Frame.BackgroundColor3 = p1._config.FrameBgColor
        Frame.BackgroundTransparency = p1._config.FrameBgTransparency
        Frame.ZIndex = a1.ZIndex + 1
        Frame.LayoutOrder = a1.ZIndex + 1
        p2.applyFrameStyle(Frame, true)
        p2.applyInteractionHighlights(TextButton, Frame, {
            ButtonColor = p1._config.FrameBgColor,
            ButtonTransparency = p1._config.FrameBgTransparency,
            ButtonHoveredColor = p1._config.FrameBgHoveredColor,
            ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
            ButtonActiveColor = p1._config.FrameBgActiveColor,
            ButtonActiveTransparency = p1._config.FrameBgActiveTransparency,
        })
        Frame.Parent = TextButton
        local v2 = math.ceil(v1 * 0.1)
        local v3 = v1 - v2 * 2
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "Checkmark"
        ImageLabel.Size = UDim2.fromOffset(v3, v3)
        ImageLabel.Position = UDim2.fromOffset(v2, v2)
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.ImageColor3 = p1._config.CheckMarkColor
        ImageLabel.ImageTransparency = p1._config.CheckMarkTransparency
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        ImageLabel.ZIndex = a1.ZIndex + 2
        ImageLabel.LayoutOrder = a1.ZIndex + 2
        ImageLabel.Parent = TextButton
        TextButton.MouseButton1Click:Connect(function() -- Line: 77 -- upvalues: a1 (val)
            a1.state.isChecked:set(not a1.state.isChecked.value)
        end)
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "TextLabel"
        p2.applyTextStyle(TextLabel)
        TextLabel.AnchorPoint = Vector2.new(0, 0.5)
        TextLabel.Position = UDim2.new(0, v1 + p1._config.ItemInnerSpacing.X, 0.5, 0)
        TextLabel.ZIndex = a1.ZIndex + 1
        TextLabel.LayoutOrder = a1.ZIndex + 1
        TextLabel.AutomaticSize = Enum.AutomaticSize.XY
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        TextLabel.Parent = TextButton
        return TextButton
    end
    function v1.Update(p1) -- Line: 96
        p1.Instance.TextLabel.Text = p1.arguments.Text or "Checkbox"
    end
    function v1.Discard(p1) -- Line: 100 -- upvalues: p2 (val)
        p1.Instance:Destroy()
        p2.discardState(p1)
    end
    function v1.GenerateState(a1) -- Line: 104 -- upvalues: p1 (val)
        if a1.state.isChecked == nil then
            a1.state.isChecked = p1._widgetState(a1, "checked", false)
        end
    end
    function v1.UpdateState(a1) -- Line: 109 -- upvalues: p2 (val), p1 (val)
        local Checkmark = a1.Instance.Checkmark
        if a1.state.isChecked.value then
            Checkmark.Image = p2.ICONS.CHECK_MARK
            a1.lastCheckedTick = p1._cycleTick + 1
            return
        end
        Checkmark.Image = ""
        a1.lastUncheckedTick = p1._cycleTick + 1
    end
    WidgetConstructor("Checkbox", v1)
end