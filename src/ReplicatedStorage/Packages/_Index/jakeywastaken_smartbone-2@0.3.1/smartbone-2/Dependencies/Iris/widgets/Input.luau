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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Input
--                               Dumped in 0.00925 seconds
--                          Bytecode version 9  |  59 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local v1, v2, v3, v4
    local u2 = {
        Init = function(p1) end,
        Get = function(a1) -- Line: 6 -- upvalues: p1 (val)
            local v1 = a1.lastNumberChangedTick == p1._cycleTick
            return v1
        end,
    }
    local function getValueByIndex(p1, p2, p3) -- Line: 11
        local v1, v2, v3
        if typeof(p1) == "number" then
            return p1
        end
        if typeof(p1) == "Vector2" then
            if p2 == 1 then
                return p1.X
            end
            if p2 == 2 then
                return p1.Y
            end
            v1, v2 = p1, p2
            v3 = typeof(v1)
            error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
            return
        end
        if typeof(p1) == "Vector3" then
            if p2 == 1 then
                return p1.X
            end
            if p2 == 2 then
                return p1.Y
            end
            if p2 == 3 then
                return p1.Z
            end
            v1, v2 = p1, p2
            v3 = typeof(v1)
            error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
            return
        end
        if typeof(p1) == "UDim" then
            if p2 == 1 then
                return p1.Scale
            end
            if p2 == 2 then
                return p1.Offset
            end
            v1, v2 = p1, p2
            v3 = typeof(v1)
            error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
            return
        end
        if typeof(p1) == "UDim2" then
            if p2 == 1 then
                return p1.X.Scale
            end
            if p2 == 2 then
                return p1.X.Offset
            end
            if p2 == 3 then
                return p1.Y.Scale
            end
            if p2 == 4 then
                return p1.Y.Offset
            end
            v1, v2 = p1, p2
            v3 = typeof(v1)
            error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
            return
        end
        if typeof(p1) == "Color3" then
            local v4
            if not p3.UseHSV then
                v4 = {p1.R, p1.G, p1.B}
            else
                v4 = {p1:ToHSV()}
                if not v4 then
                    v4 = {p1.R, p1.G, p1.B}
                end
            end
            if p2 == 1 then
                return v4[1]
            end
            if p2 == 2 then
                return v4[2]
            end
            if p2 == 3 then
                return v4[3]
            end
            v1, v2 = p1, p2
            v3 = typeof(v1)
            error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
            return
        end
        if typeof(p1) ~= "Rect" then
            if typeof(p1) == "table" then
                return p1[p2]
            end
            v1, v2 = p1, p2
            v3 = typeof(v1)
            error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
            return
        end
        if p2 == 1 then
            return p1.Min.X
        end
        if p2 == 2 then
            return p1.Min.Y
        end
        if p2 == 3 then
            return p1.Max.X
        end
        if p2 == 4 then
            return p1.Max.Y
        end
        v1, v2 = p1, p2
        v3 = typeof(v1)
        error((("Incorrect datatype or value: %* %* %*"):format(v1, v3, v2)))
    end
    local function updateValueByIndex(p1, p2, p3, p4) -- Line: 70
        local v1, v2, v3, v4, v5, v6
        if typeof(p1) == "number" then
            return p3
        end
        if typeof(p1) == "Vector2" then
            if p2 == 1 then
                return Vector2.new(p3, p1.Y)
            end
            if p2 == 2 then
                return Vector2.new(p1.X, p3)
            end
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        if typeof(p1) == "Vector3" then
            if p2 == 1 then
                return (Vector3.new(p3, p1.Y, p1.Z))
            end
            if p2 == 2 then
                return (Vector3.new(p1.X, p3, p1.Z))
            end
            if p2 == 3 then
                return (Vector3.new(p1.X, p1.Y, p3))
            end
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        if typeof(p1) == "UDim" then
            if p2 == 1 then
                return UDim.new(p3, p1.Offset)
            end
            if p2 == 2 then
                return UDim.new(p1.Scale, p3)
            end
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        if typeof(p1) == "UDim2" then
            if p2 == 1 then
                v4 = UDim.new(p3, p1.X.Offset)
                return UDim2.new(v4, p1.Y)
            end
            if p2 == 2 then
                v4 = UDim.new(p1.X.Scale, p3)
                return UDim2.new(v4, p1.Y)
            end
            if p2 == 3 then
                return UDim2.new(p1.X, UDim.new(p3, p1.Y.Offset))
            end
            if p2 == 4 then
                return UDim2.new(p1.X, UDim.new(p1.Y.Scale, p3))
            end
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        if typeof(p1) == "Rect" then
            if p2 == 1 then
                v4 = Vector2.new(p3, p1.Min.Y)
                return Rect.new(v4, p1.Max)
            end
            if p2 == 2 then
                v4 = Vector2.new(p1.Min.X, p3)
                return Rect.new(v4, p1.Max)
            end
            if p2 == 3 then
                return Rect.new(p1.Min, Vector2.new(p3, p1.Max.Y))
            end
            if p2 == 4 then
                return Rect.new(p1.Min, Vector2.new(p1.Max.X, p3))
            end
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        if typeof(p1) ~= "Color3" then
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        if not p4.UseHSV then
            if p2 == 1 then
                return Color3.new(p3, p1.G, p1.B)
            end
            if p2 == 2 then
                return Color3.new(p1.R, p3, p1.B)
            end
            if p2 == 3 then
                return Color3.new(p1.R, p1.G, p3)
            end
            v1, v2 = p1, p2
            v6 = typeof(v1)
            error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
            return
        end
        v3, v4, v5 = p1:ToHSV()
        if p2 == 1 then
            return Color3.fromHSV(p3, v4, v5)
        end
        if p2 == 2 then
            return Color3.fromHSV(v3, p3, v5)
        end
        if p2 == 3 then
            return Color3.fromHSV(v3, v4, p3)
        end
        if p2 == 1 then
            return Color3.new(p3, p1.G, p1.B)
        end
        if p2 == 2 then
            return Color3.new(p1.R, p3, p1.B)
        end
        if p2 == 3 then
            return Color3.new(p1.R, p1.G, p3)
        end
        v1, v2 = p1, p2
        v6 = typeof(v1)
        error((("Incorrect datatype or value %* %* %*"):format(v1, v6, v2)))
    end
    local u7 = {
        Num = {1},
        Vector2 = {1, 1},
        Vector3 = {1, 1, 1},
        UDim = {0.01, 1},
        UDim2 = {0.01, 1, 0.01, 1},
        Color3 = {1, 1, 1},
        Color4 = {1, 1, 1, 1},
    }
    v2 = {1, 1, 1, 1}
    u7.Rect = v2
    local u39 = {
        Num = {0},
        Vector2 = {0, 0},
        Vector3 = {0, 0, 0},
        UDim = {0, 0},
        UDim2 = {0, 0, 0, 0},
    }
    v3 = {0, 0, 0, 0}
    u39.Rect = v3
    local u62 = {
        Num = {100},
        Vector2 = {100, 100},
        Vector3 = {100, 100, 100},
        UDim = {1, 960},
        UDim2 = {1, 960, 1, 960},
    }
    v4 = {960, 960, 960, 960}
    u62.Rect = v4
    local u85 = {
        Num = {""},
        Vector2 = {"X: ", "Y: "},
        Vector3 = {"X: ", "Y: ", "Z: "},
        UDim = {"", ""},
        UDim2 = {"", "", "", ""},
        Color3_RGB = {"R: ", "G: ", "B: "},
        Color3_HSV = {"H: ", "S: ", "V: "},
        Color4_RGB = {"R: ", "G: ", "B: ", "T: "},
        Color4_HSV = {"H: ", "S: ", "V: ", "T: "},
    }
    local v5 = {"X: ", "Y: ", "X: ", "Y: "}
    u85.Rect = v5
    local u126 = {
        Num = {0},
        Vector2 = {0, 0},
        Vector3 = {0, 0, 0},
        UDim = {3, 0},
        UDim2 = {3, 0, 3, 0},
        Color3 = {0, 0, 0},
        Color4 = {0, 0, 0, 0},
    }
    local v6 = {0, 0, 0, 0}
    u126.Rect = v6
    local function generateButtons(a1, a2, p3, p4) -- Line: 194 -- upvalues: p1 (val), p2 (val), getValueByIndex (val)
        local v1 = p3 + (2 * p1._config.ItemInnerSpacing.X + p4 * 2)
        local v2 = p2.abstractButton.Generate(a1)
        v2.Name = "SubButton"
        v2.ZIndex = a1.ZIndex + 5
        v2.LayoutOrder = a1.ZIndex + 5
        v2.TextXAlignment = Enum.TextXAlignment.Center
        v2.Text = "-"
        v2.Size = UDim2.fromOffset(p1._config.TextSize + 2 * p1._config.FramePadding.Y, p1._config.TextSize)
        v2.Parent = a2
        v2.MouseButton1Click:Connect(function() -- Line: 206 -- upvalues: p2 (upval), a1 (val), getValueByIndex (upval), p1 (upval)
            local v1, v2
            local v3 = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
            if not v3 then
                v3 = p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
            end
            if not a1.arguments.Increment then
                v1 = 1
            else
                v1 = getValueByIndex(a1.arguments.Increment, 1, a1.arguments)
            end
            if not v3 then
                v2 = 1
            else
                v2 = 100
            end
            v1 = a1.state.number.value - v1 * v2
            if a1.arguments.Min ~= nil then
                v1 = math.max(v1, getValueByIndex(a1.arguments.Min, 1, a1.arguments))
            end
            if a1.arguments.Max ~= nil then
                v1 = math.min(v1, getValueByIndex(a1.arguments.Max, 1, a1.arguments))
            end
            a1.state.number:set(v1)
            a1.lastNumberChangedTick = p1._cycleTick + 1
        end)
        local v3 = p2.abstractButton.Generate(a1)
        v3.Name = "AddButton"
        v3.ZIndex = a1.ZIndex + 6
        v3.LayoutOrder = a1.ZIndex + 6
        v3.TextXAlignment = Enum.TextXAlignment.Center
        v3.Text = "+"
        v3.Size = UDim2.fromOffset(p1._config.TextSize + 2 * p1._config.FramePadding.Y, p1._config.TextSize)
        v3.Parent = a2
        v3.MouseButton1Click:Connect(function() -- Line: 232 -- upvalues: p2 (upval), a1 (val), getValueByIndex (upval), p1 (upval)
            local v1, v2
            local v3 = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
            if not v3 then
                v3 = p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
            end
            if not a1.arguments.Increment then
                v1 = 1
            else
                v1 = getValueByIndex(a1.arguments.Increment, 1, a1.arguments)
            end
            if not v3 then
                v2 = 1
            else
                v2 = 100
            end
            v1 = a1.state.number.value + v1 * v2
            if a1.arguments.Min ~= nil then
                v1 = math.max(v1, getValueByIndex(a1.arguments.Min, 1, a1.arguments))
            end
            if a1.arguments.Max ~= nil then
                v1 = math.min(v1, getValueByIndex(a1.arguments.Max, 1, a1.arguments))
            end
            a1.state.number:set(v1)
            a1.lastNumberChangedTick = p1._cycleTick + 1
        end)
        return v1
    end
    local function generateInputScalar(a1, a2, p3) -- Line: 252 -- upvalues: u2 (val), p2 (val), p1 (val), generateButtons (val), getValueByIndex (val), updateValueByIndex (val), u126 (val), u85 (val)
        local v1 = {
            hasState = true,
            hasChildren = false,
            Args = {
                Text = 1,
                Increment = 2,
                Min = 3,
                Max = 4,
                Format = 5,
            },
            Events = {numberChanged = u2, hovered = p2.EVENTS.hover(function(p1) -- Line: 265
                return p1.Instance
            end)},
        }
        function v1.Generate(a1_2) -- Line: 269 -- upvalues: a1 (val), p2 (upval), p1 (upval), a2 (val), generateButtons (upval), getValueByIndex (upval), updateValueByIndex (upval)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Input" .. a1
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
            local v1 = 0
            local v2 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
            if a2 == 1 then
                v1 = generateButtons(a1_2, Frame, v1, v2)
            end
            local v3 = UDim.new(p1._config.ContentWidth.Scale / a2, (p1._config.ContentWidth.Offset - p1._config.ItemInnerSpacing.X * (a2 - 1) - v1) / a2)
            local v4 = UDim.new(v3.Scale * (a2 - 1), v3.Offset * (a2 - 1) + p1._config.ItemInnerSpacing.X * (a2 - 1) + v1)
            local v5 = p1._config.ContentWidth - v4
            local v6 = a2
            local v7 = 1
            local u157 = a1_2
            for i = 1, v6, v7 do
                local TextBox = Instance.new("TextBox")
                TextBox.Name = "InputField" .. tostring(i)
                TextBox.ZIndex = u157.ZIndex + i
                TextBox.LayoutOrder = u157.ZIndex + i
                if i ~= a2 then
                    TextBox.Size = UDim2.new(v3, UDim.new())
                else
                    TextBox.Size = UDim2.new(v5, UDim.new())
                end
                TextBox.AutomaticSize = Enum.AutomaticSize.Y
                TextBox.BackgroundColor3 = p1._config.FrameBgColor
                TextBox.BackgroundTransparency = p1._config.FrameBgTransparency
                TextBox.ClearTextOnFocus = false
                TextBox.TextTruncate = Enum.TextTruncate.AtEnd
                TextBox.ClipsDescendants = true
                p2.applyFrameStyle(TextBox)
                p2.applyTextStyle(TextBox)
                p2.UISizeConstraint(TextBox, Vector2.new(1, 0))
                TextBox.Parent = Frame
                TextBox.FocusLost:Connect(function() -- Line: 325 -- upvalues: TextBox (val), u157 (val), getValueByIndex (upval), i (val), updateValueByIndex (upval), p1 (upval)
                    local v1
                    local v2 = tonumber(TextBox.Text:match("-?%d*%.?%d*"))
                    if v2 ~= nil then
                        if u157.arguments.Min ~= nil then
                            v2 = math.max(v2, getValueByIndex(u157.arguments.Min, i, u157.arguments))
                        end
                        if u157.arguments.Max ~= nil then
                            v2 = math.min(v2, getValueByIndex(u157.arguments.Max, i, u157.arguments))
                        end
                        if u157.arguments.Increment then
                            v1 = math.round(v2 / getValueByIndex(u157.arguments.Increment, i, u157.arguments))
                            v2 = v1 * getValueByIndex(u157.arguments.Increment, i, u157.arguments)
                        end
                        u157.state.number:set(updateValueByIndex(u157.state.number.value, i, v2, u157.arguments))
                        u157.lastNumberChangedTick = p1._cycleTick + 1
                    end
                    v1 = u157.arguments.Format[i]
                    if not v1 then
                        v1 = u157.arguments.Format[1]
                    end
                    if u157.arguments.Prefix then
                        v1 = u157.arguments.Prefix[i] .. v1
                    end
                    TextBox.Text = string.format(v1, getValueByIndex(u157.state.number.value, i, u157.arguments))
                    u157.state.editingText:set(0)
                end)
                TextBox.Focused:Connect(function() -- Line: 352 -- upvalues: TextBox (val), u157 (val), i (val)
                    TextBox.CursorPosition = #TextBox.Text + 1
                    TextBox.SelectionStart = 1
                    u157.state.editingText:set(i)
                end)
            end
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.Size = UDim2.fromOffset(0, v2)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = u157.ZIndex + 7
            TextLabel.LayoutOrder = u157.ZIndex + 7
            TextLabel.AutomaticSize = Enum.AutomaticSize.X
            p2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame
            return Frame
        end
        function v1.Update(p1) -- Line: 376 -- upvalues: a1 (val), a2 (val), u126 (upval), getValueByIndex (upval), u85 (upval)
            local Instance = p1.Instance
            local Text = p1.arguments.Text
            if not Text then
                Text = ("Input %*"):format(a1)
            end
            Instance.TextLabel.Text = Text
            if a2 == 1 then
                Instance.SubButton.Visible = not p1.arguments.NoButtons
                Instance.AddButton.Visible = not p1.arguments.NoButtons
            end
            if not p1.arguments.Format then
                local v1, v2, v3, v4
                local v5 = {}
                local v6 = a2
                local v7 = 1
                local v8 = p1
                for i = 1, v6, v7 do
                    v3 = u126[a1][i]
                    if v8.arguments.Increment then
                        v4 = getValueByIndex(v8.arguments.Increment, i, v8.arguments)
                        if v4 ~= 0 then
                            v2 = v4
                        else
                            v2 = 1
                        end
                        v1 = math.ceil(-math.log10(v2))
                        v3 = math.max(v3, v1, v3)
                    end
                    if v8.arguments.Max then
                        v4 = getValueByIndex(v8.arguments.Max, i, v8.arguments)
                        if v4 ~= 0 then
                            v2 = v4
                        else
                            v2 = 1
                        end
                        v1 = math.ceil(-math.log10(v2))
                        v3 = math.max(v3, v1, v3)
                    end
                    if v8.arguments.Min then
                        v4 = getValueByIndex(v8.arguments.Min, i, v8.arguments)
                        if v4 ~= 0 then
                            v2 = v4
                        else
                            v2 = 1
                        end
                        v1 = math.ceil(-math.log10(v2))
                        v3 = math.max(v3, v1, v3)
                    end
                    if 0 >= v3 then
                        v5[i] = "%d"
                    else
                        v5[i] = ("%%.%*f"):format(v3)
                    end
                end
                v8.arguments.Format = v5
                v8.arguments.Prefix = u85[a1]
                return
            elseif typeof(p1.arguments.Format) ~= "table" then
                p1.arguments.Format = {p1.arguments.Format}
                return
            end
        end
        function v1.Discard(p1) -- Line: 421 -- upvalues: p2 (upval)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end
        function v1.GenerateState(a1) -- Line: 425 -- upvalues: p1 (upval), p3 (val)
            if a1.state.number == nil then
                a1.state.number = p1._widgetState(a1, "number", p3)
            end
            if a1.state.editingText == nil then
                a1.state.editingText = p1._widgetState(a1, "editingText", 0)
            end
        end
        function v1.UpdateState(p1) -- Line: 433 -- upvalues: a2 (val), getValueByIndex (upval)
            local v1, v2
            local Instance = p1.Instance
            local v3 = a2
            local v4 = 1
            local v5 = p1
            for i = 1, v3, v4 do
                v1 = Instance:FindFirstChild("InputField" .. tostring(i))
                v2 = v5.arguments.Format[i]
                if not v2 then
                    v2 = v5.arguments.Format[1]
                end
                if v5.arguments.Prefix then
                    v2 = v5.arguments.Prefix[i] .. v2
                end
                v1.Text = string.format(v2, getValueByIndex(v5.state.number.value, i, v5.arguments))
            end
        end
        return v1
    end
    local generateSliderScalar = 0
    local generateEnumSliderScalar = false
    local WidgetConstructor = nil
    local Args = 0
    local u167 = ""
    local function updateActiveDrag() -- Line: 461 -- upvalues: p2 (val), generateSliderScalar (ref), generateEnumSliderScalar (ref), WidgetConstructor (ref), u167 (ref), Args (ref), getValueByIndex (val), u7 (val), updateValueByIndex (val), p1 (val)
        local v1, v2
        local X = p2.getMouseLocation().X
        local v3 = X - generateSliderScalar
        generateSliderScalar = X
        if generateEnumSliderScalar == false or WidgetConstructor == nil then
            return
        end
        local number = WidgetConstructor.state.number
        if u167 == "Color3" then
            number = if Args == 4 then WidgetConstructor.state.transparency else WidgetConstructor.state.color
        elseif u167 ~= "Color4" then
        end
        if not WidgetConstructor.arguments.Increment then
            v1 = u7[u167][Args]
        else
            v1 = getValueByIndex(WidgetConstructor.arguments.Increment, Args, WidgetConstructor.arguments)
        end
        if p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            v2 = 10
        elseif not (p2.UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) then
            v2 = 1
        end
        v1 = v1 * v2
        if p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
            v2 = 0.1
        elseif not (p2.UserInputService:IsKeyDown(Enum.KeyCode.RightAlt)) then
            v2 = 1
        end
        v1 = v1 * v2
        if u167 == "Color3" then
            v2 = 5
        elseif u167 ~= "Color4" then
            v2 = 1
        end
        v1 = v1 * v2
        v2 = getValueByIndex(number.value, Args, WidgetConstructor.arguments)
        local v4 = v2 + v3 * v1
        if WidgetConstructor.arguments.Min ~= nil then
            v4 = math.max(v4, getValueByIndex(WidgetConstructor.arguments.Min, Args, WidgetConstructor.arguments))
        end
        if WidgetConstructor.arguments.Max ~= nil then
            v4 = math.min(v4, getValueByIndex(WidgetConstructor.arguments.Max, Args, WidgetConstructor.arguments))
        end
        number:set(updateValueByIndex(number.value, Args, v4, WidgetConstructor.arguments))
        WidgetConstructor.lastNumberChangedTick = p1._cycleTick + 1
    end
    local function DragMouseDown(a1, a2, p3, p4, p5) -- Line: 502 -- upvalues: p2 (val), p1 (val), generateEnumSliderScalar (ref), WidgetConstructor (ref), Args (ref), u167 (ref), updateActiveDrag (val)
        local v1 = p2.getTime()
        local v2 = v1 - a1.lastClickedTime
        local v3 = v2 < p1._config.MouseDoubleClickTime
        v2 = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
        if not v2 then
            v2 = p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
        end
        if not v3 then
            if v2 then
                a1.state.editingText:set(p3)
                return
            end
            a1.lastClickedTime = v1
            a1.lastClickedPosition = Vector2.new(p4, p5)
            generateEnumSliderScalar = true
            WidgetConstructor = a1
            Args = p3
            u167 = a2
            updateActiveDrag()
            return
        end
        local v4 = Vector2.new(p4, p5)
        if (v4 - a1.lastClickedPosition).Magnitude < p1._config.MouseDoubleClickMaxDist or v2 then
            a1.state.editingText:set(p3)
            return
        end
        a1.lastClickedTime = v1
        a1.lastClickedPosition = Vector2.new(p4, p5)
        generateEnumSliderScalar = true
        WidgetConstructor = a1
        Args = p3
        u167 = a2
        updateActiveDrag()
    end
    p2.UserInputService.InputChanged:Connect(updateActiveDrag)
    p2.UserInputService.InputEnded:Connect(function(p1) -- Line: 525 -- upvalues: generateEnumSliderScalar (ref), WidgetConstructor (ref), Args (ref)
        if p1.UserInputType == Enum.UserInputType.MouseButton1 and generateEnumSliderScalar then
            generateEnumSliderScalar = false
            WidgetConstructor = nil
            Args = 0
        end
    end)
    local function generateDragScalar(a1, a2, p3) -- Line: 533 -- upvalues: u2 (val), p2 (val), p1 (val), getValueByIndex (val), updateValueByIndex (val), DragMouseDown (val), u126 (val), u85 (val)
        local v1 = {
            hasState = true,
            hasChildren = false,
            Args = {
                Text = 1,
                Increment = 2,
                Min = 3,
                Max = 4,
                Format = 5,
            },
            Events = {numberChanged = u2, hovered = p2.EVENTS.hover(function(p1) -- Line: 546
                return p1.Instance
            end)},
        }
        function v1.Generate(a1_2) -- Line: 550 -- upvalues: a1 (val), p2 (upval), p1 (upval), a2 (val), getValueByIndex (upval), updateValueByIndex (upval), DragMouseDown (upval)
            local TextButton
            a1_2.lastClickedTime = -1
            a1_2.lastClickedPosition = Vector2.zero
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Drag" .. a1
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
            local v1 = 0
            local v2 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
            if a1 == "Color3" then
                v1 = v1 + (p1._config.ItemInnerSpacing.X + v2)
                local ImageLabel = Instance.new("ImageLabel")
                ImageLabel.Name = "ColorBox"
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.fromOffset(v2, v2)
                ImageLabel.ZIndex = a1_2.ZIndex + 5
                ImageLabel.LayoutOrder = a1_2.ZIndex + 5
                ImageLabel.Image = p2.ICONS.ALPHA_BACKGROUND_TEXTURE
                ImageLabel.ImageTransparency = 1
                p2.applyFrameStyle(ImageLabel, true, true)
                ImageLabel.Parent = Frame
            elseif a1 ~= "Color4" then
            end
            local v3 = UDim.new(p1._config.ContentWidth.Scale / a2, (p1._config.ContentWidth.Offset - p1._config.ItemInnerSpacing.X * (a2 - 1) - v1) / a2)
            local v4 = UDim.new(v3.Scale * (a2 - 1), v3.Offset * (a2 - 1) + p1._config.ItemInnerSpacing.X * (a2 - 1) + v1)
            local v5 = p1._config.ContentWidth - v4
            local v6 = a2
            local v7 = 1
            local u213 = a1_2
            for i = 1, v6, v7 do
                TextButton = Instance.new("TextButton")
                TextButton.Name = "DragField" .. tostring(i)
                TextButton.ZIndex = u213.ZIndex + i
                TextButton.LayoutOrder = u213.ZIndex + i
                if i ~= a2 then
                    TextButton.Size = UDim2.new(v3, UDim.new())
                else
                    TextButton.Size = UDim2.new(v5, UDim.new())
                end
                TextButton.AutomaticSize = Enum.AutomaticSize.Y
                TextButton.BackgroundColor3 = p1._config.FrameBgColor
                TextButton.BackgroundTransparency = p1._config.FrameBgTransparency
                TextButton.AutoButtonColor = false
                TextButton.Text = ""
                TextButton.ClipsDescendants = true
                p2.applyFrameStyle(TextButton)
                p2.applyTextStyle(TextButton)
                p2.UISizeConstraint(TextButton, Vector2.new(1, 0))
                TextButton.TextXAlignment = Enum.TextXAlignment.Center
                TextButton.Parent = Frame
                p2.applyInteractionHighlights(TextButton, TextButton, {
                    ButtonColor = p1._config.FrameBgColor,
                    ButtonTransparency = p1._config.FrameBgTransparency,
                    ButtonHoveredColor = p1._config.FrameBgHoveredColor,
                    ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
                    ButtonActiveColor = p1._config.FrameBgActiveColor,
                    ButtonActiveTransparency = p1._config.FrameBgActiveTransparency,
                })
                local TextBox = Instance.new("TextBox")
                TextBox.Name = "InputField"
                TextBox.ZIndex = u213.ZIndex + 5
                TextBox.LayoutOrder = u213.ZIndex + 2
                TextBox.Size = UDim2.new(1, 0, 1, 0)
                TextBox.BackgroundTransparency = 1
                TextBox.ClearTextOnFocus = false
                TextBox.TextTruncate = Enum.TextTruncate.AtEnd
                TextBox.ClipsDescendants = true
                TextBox.Visible = false
                p2.applyFrameStyle(TextBox, true)
                p2.applyTextStyle(TextBox)
                TextBox.Parent = TextButton
                TextBox.FocusLost:Connect(function() -- Line: 648 -- upvalues: TextBox (val), u213 (val), a1 (upval), i (val), getValueByIndex (upval), updateValueByIndex (upval), p1 (upval)
                    local v1
                    local v2 = tonumber(TextBox.Text:match("-?%d*%.?%d*"))
                    local number = u213.state.number
                    if a1 ~= "Color4" then
                        if a1 == "Color3" then
                            number = u213.state.color
                        elseif a1 ~= "Color4" then
                        end
                    elseif i == 4 then
                        number = u213.state.transparency
                    end
                    if v2 ~= nil then
                        if a1 == "Color3" then
                            v2 = v2 / 255
                        elseif a1 == "Color4" and u213.arguments.UseFloats then
                        end
                        if u213.arguments.Min ~= nil then
                            v2 = math.max(v2, getValueByIndex(u213.arguments.Min, i, u213.arguments))
                        end
                        if u213.arguments.Max ~= nil then
                            v2 = math.min(v2, getValueByIndex(u213.arguments.Max, i, u213.arguments))
                        end
                        if u213.arguments.Increment then
                            v1 = math.round(v2 / getValueByIndex(u213.arguments.Increment, i, u213.arguments))
                            v2 = v1 * getValueByIndex(u213.arguments.Increment, i, u213.arguments)
                        end
                        number:set(updateValueByIndex(number.value, i, v2, u213.arguments))
                        u213.lastNumberChangedTick = p1._cycleTick + 1
                    end
                    v1 = getValueByIndex(number.value, i, u213.arguments)
                    if a1 == "Color3" then
                        v1 = math.round(v1 * 255)
                    elseif a1 == "Color4" and u213.arguments.UseFloats then
                    end
                    local v3 = u213.arguments.Format[i]
                    if not v3 then
                        v3 = u213.arguments.Format[1]
                    end
                    if u213.arguments.Prefix then
                        v3 = u213.arguments.Prefix[i] .. v3
                    end
                    TextBox.Text = string.format(v3, v1)
                    u213.state.editingText:set(0)
                    TextBox:ReleaseFocus(true)
                end)
                TextBox.Focused:Connect(function() -- Line: 691 -- upvalues: TextBox (val), u213 (val), i (val)
                    TextBox.CursorPosition = #TextBox.Text + 1
                    TextBox.SelectionStart = 1
                    u213.state.editingText:set(i)
                end)
                TextButton.MouseButton1Down:Connect(function(p1, p2) -- Line: 699 -- upvalues: DragMouseDown (upval), u213 (val), a1 (upval), i (val)
                    DragMouseDown(u213, a1, i, p1, p2)
                end)
            end
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.Size = UDim2.fromOffset(0, v2)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = u213.ZIndex + 5
            TextLabel.LayoutOrder = u213.ZIndex + 5
            TextLabel.AutomaticSize = Enum.AutomaticSize.X
            p2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame
            return Frame
        end
        function v1.Update(p1) -- Line: 719 -- upvalues: a1 (val), a2 (val), u126 (upval), getValueByIndex (upval), u85 (upval)
            local Text = p1.arguments.Text
            if not Text then
                Text = ("Drag %*"):format(a1)
            end
            p1.Instance.TextLabel.Text = Text
            if not p1.arguments.Format then
                if not p1.arguments.Format then
                    local v1, v2, v3, v4
                    local v5 = {}
                    local v6 = a2
                    local v7 = 1
                    local v8 = p1
                    for i = 1, v6, v7 do
                        v3 = u126[a1][i]
                        if v8.arguments.Increment then
                            v4 = getValueByIndex(v8.arguments.Increment, i, v8.arguments)
                            if v4 ~= 0 then
                                v2 = v4
                            else
                                v2 = 1
                            end
                            v1 = math.ceil(-math.log10(v2))
                            v3 = math.max(v3, v1, v3)
                        end
                        if v8.arguments.Max then
                            v4 = getValueByIndex(v8.arguments.Max, i, v8.arguments)
                            if v4 ~= 0 then
                                v2 = v4
                            else
                                v2 = 1
                            end
                            v1 = math.ceil(-math.log10(v2))
                            v3 = math.max(v3, v1, v3)
                        end
                        if v8.arguments.Min then
                            v4 = getValueByIndex(v8.arguments.Min, i, v8.arguments)
                            if v4 ~= 0 then
                                v2 = v4
                            else
                                v2 = 1
                            end
                            v1 = math.ceil(-math.log10(v2))
                            v3 = math.max(v3, v1, v3)
                        end
                        if 0 >= v3 then
                            v5[i] = "%d"
                        else
                            v5[i] = ("%%.%*f"):format(v3)
                        end
                    end
                    v8.arguments.Format = v5
                    v8.arguments.Prefix = u85[a1]
                end
                return
            elseif typeof(p1.arguments.Format) ~= "table" then
                p1.arguments.Format = {p1.arguments.Format}
                return
            end
        end
        function v1.Discard(p1) -- Line: 759 -- upvalues: p2 (upval)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end
        function v1.GenerateState(a1) -- Line: 763 -- upvalues: p1 (upval), p3 (val)
            if a1.state.number == nil then
                a1.state.number = p1._widgetState(a1, "number", p3)
            end
            if a1.state.editingText == nil then
                a1.state.editingText = p1._widgetState(a1, "editingText", false)
            end
        end
        function v1.UpdateState(a1_2) -- Line: 771 -- upvalues: a2 (val), a1 (val), getValueByIndex (upval), p1 (upval)
            local ColorBox, InputField, number, v1, v2, v3
            local Instance = a1_2.Instance
            local v4 = a2
            local v5 = 1
            local v6 = a1_2
            for i = 1, v4, v5 do
                number = v6.state.number
                if a1 == "Color3" then
                    number = if i == 4 then v6.state.transparency else v6.state.color
                elseif a1 ~= "Color4" then
                end
                v1 = Instance:FindFirstChild("DragField" .. tostring(i))
                InputField = v1.InputField
                v2 = getValueByIndex(number.value, i, v6.arguments)
                if a1 == "Color3" then
                    if not v6.arguments.UseFloats then
                        v2 = math.round(v2 * 255)
                    end
                elseif a1 ~= "Color4" then
                end
                v3 = v6.arguments.Format[i]
                if not v3 then
                    v3 = v6.arguments.Format[1]
                end
                if v6.arguments.Prefix then
                    v3 = v6.arguments.Prefix[i] .. v3
                end
                v1.Text = string.format(v3, v2)
                InputField.Text = tostring(v2)
                if v6.state.editingText.value ~= i then
                    InputField.Visible = false
                    v1.TextTransparency = p1._config.TextTransparency
                else
                    InputField.Visible = true
                    InputField:CaptureFocus()
                    v1.TextTransparency = 1
                end
            end
            if a1 == "Color3" then
                ColorBox = Instance.ColorBox
                ColorBox.BackgroundColor3 = v6.state.color.value
                if a1 == "Color4" then
                    ColorBox.ImageTransparency = 1 - v6.state.transparency.value
                end
            elseif a1 == "Color4" then
                ColorBox = Instance.ColorBox
                ColorBox.BackgroundColor3 = v6.state.color.value
                if a1 == "Color4" then
                    ColorBox.ImageTransparency = 1 - v6.state.transparency.value
                end
            end
        end
        return v1
    end
    local function generateColorDragScalar(a1, ...) -- Line: 819 -- upvalues: generateDragScalar (ref), p2 (val), u85 (val), p1 (val)
        local v1
        local u1 = {...}
        if a1 ~= "Color4" then
            v1 = 3
        else
            v1 = 4
        end
        local v2 = generateDragScalar(a1, v1, u1[1])
        return p2.extend(v2, {
            Args = {Text = 1, UseFloats = 2, UseHSV = 3, Format = 4},
            Update = function(a1_2) -- Line: 830 -- upvalues: a1 (val), u85 (upval), p1 (upval)
                local Text = a1_2.arguments.Text
                if not Text then
                    Text = ("Drag %*"):format(a1)
                end
                a1_2.Instance.TextLabel.Text = Text
                if not a1_2.arguments.Format then
                    local v1
                    if not a1_2.arguments.UseFloats then
                        a1_2.arguments.Format = {"%d"}
                    else
                        a1_2.arguments.Format = {"%.3f"}
                    end
                    if not a1_2.arguments.UseHSV then
                        v1 = "_RGB"
                    else
                        v1 = "_HSV"
                    end
                    a1_2.arguments.Prefix = u85[a1 .. v1]
                elseif typeof(a1_2.arguments.Format) ~= "table" then
                    a1_2.arguments.Format = {a1_2.arguments.Format}
                end
                a1_2.arguments.Min = {0, 0, 0, 0}
                a1_2.arguments.Max = {1, 1, 1, 1}
                a1_2.arguments.Increment = {0.001, 0.001, 0.001, 0.001}
                if a1_2.state then
                    p1._widgets[a1_2.type].UpdateState(a1_2)
                end
            end,
            GenerateState = function(a1_2) -- Line: 857 -- upvalues: p1 (upval), u1 (val), a1 (val)
                if a1_2.state.color == nil then
                    a1_2.state.color = p1._widgetState(a1_2, "color", u1[1])
                end
                if a1 == "Color4" and a1_2.state.transparency == nil then
                    a1_2.state.transparency = p1._widgetState(a1_2, "transparency", u1[2])
                end
                if a1_2.state.editingText == nil then
                    a1_2.state.editingText = p1._widgetState(a1_2, "editingText", false)
                end
            end,
        })
    end
    WidgetConstructor = false
    Args = nil
    u167 = 0
    local Generate = ""
    local function updateActiveSlider() -- Line: 885 -- upvalues: WidgetConstructor (ref), Args (ref), u167 (ref), getValueByIndex (val), u7 (val), Generate (ref), u39 (val), u62 (val), p1 (val), p2 (val), updateValueByIndex (val)
        local v1, v2, v3, v4
        if WidgetConstructor == false or Args == nil then
            return
        end
        local v5 = Args.Instance:FindFirstChild("SliderField" .. tostring(u167))
        if not Args.arguments.Increment then
            v1 = u7[Generate][u167]
        else
            v1 = getValueByIndex(Args.arguments.Increment, u167, Args.arguments)
        end
        if not Args.arguments.Min then
            v2 = u39[Generate][u167]
        else
            v2 = getValueByIndex(Args.arguments.Min, u167, Args.arguments)
        end
        if not Args.arguments.Max then
            v3 = u62[Generate][u167]
        else
            v3 = getValueByIndex(Args.arguments.Max, u167, Args.arguments)
            if not v3 then
                v3 = u62[Generate][u167]
            end
        end
        local X = p1._config.FramePadding.X
        if v1 >= 1 then
            v4 = 1
        else
            v4 = 0
        end
        local v6 = math.floor((v4 + v3 - v2) / v1)
        local v7 = p2.getMouseLocation().X - (v5.AbsolutePosition.X + X)
        local v8 = math.floor(v7 / (v5.AbsoluteSize.X - X * 2) * v6) * v1 + v2
        v7 = math.clamp(v8, v2, v3)
        Args.state.number:set(updateValueByIndex(Args.state.number.value, u167, v7, Args.arguments))
        Args.lastNumberChangedTick = p1._cycleTick + 1
    end
    local function SliderMouseDown(p1, a2, p3) -- Line: 915 -- upvalues: p2 (val), WidgetConstructor (ref), Args (ref), u167 (ref), Generate (ref), updateActiveSlider (val)
        local v1 = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
        if not v1 then
            v1 = p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
        end
        if v1 then
            p1.state.editingText:set(p3)
            return
        end
        WidgetConstructor = true
        Args = p1
        u167 = p3
        Generate = a2
        updateActiveSlider()
    end
    p2.UserInputService.InputChanged:Connect(updateActiveSlider)
    p2.UserInputService.InputEnded:Connect(function(p1) -- Line: 931 -- upvalues: WidgetConstructor (ref), Args (ref), u167 (ref), Generate (ref)
        if p1.UserInputType == Enum.UserInputType.MouseButton1 and WidgetConstructor then
            WidgetConstructor = false
            Args = nil
            u167 = 0
            Generate = ""
        end
    end)
    function generateSliderScalar(a1, a2, p3, ...) -- Line: 940 -- upvalues: u2 (val), p2 (val), p1 (val), getValueByIndex (val), updateValueByIndex (val), SliderMouseDown (val), u126 (val), u85 (val), u7 (val), u39 (val), u62 (val)
        local v1 = {
            hasState = true,
            hasChildren = false,
            Args = {
                Text = 1,
                Increment = 2,
                Min = 3,
                Max = 4,
                Format = 5,
            },
            Events = {numberChanged = u2, hovered = p2.EVENTS.hover(function(p1) -- Line: 953
                return p1.Instance
            end)},
        }
        function v1.Generate(a1_2) -- Line: 957 -- upvalues: a1 (val), p2 (upval), p1 (upval), a2 (val), getValueByIndex (upval), updateValueByIndex (upval), SliderMouseDown (upval)
            local Frame_2, TextButton, TextLabel
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Slider" .. a1
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
            local v1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
            local v2 = UDim.new(p1._config.ContentWidth.Scale / a2, (p1._config.ContentWidth.Offset - p1._config.ItemInnerSpacing.X * (a2 - 1)) / a2)
            local v3 = UDim.new(v2.Scale * (a2 - 1), v2.Offset * (a2 - 1) + p1._config.ItemInnerSpacing.X * (a2 - 1))
            local v4 = p1._config.ContentWidth - v3
            local v5 = a2
            local v6 = 1
            local u277 = a1_2
            for i = 1, v5, v6 do
                TextButton = Instance.new("TextButton")
                TextButton.Name = "SliderField" .. tostring(i)
                TextButton.ZIndex = u277.ZIndex + i
                TextButton.LayoutOrder = u277.ZIndex + i
                if i ~= a2 then
                    TextButton.Size = UDim2.new(v2, UDim.new())
                else
                    TextButton.Size = UDim2.new(v4, UDim.new())
                end
                TextButton.AutomaticSize = Enum.AutomaticSize.Y
                TextButton.BackgroundColor3 = p1._config.FrameBgColor
                TextButton.BackgroundTransparency = p1._config.FrameBgTransparency
                TextButton.AutoButtonColor = false
                TextButton.Text = ""
                TextButton.ClipsDescendants = true
                p2.applyFrameStyle(TextButton)
                p2.applyTextStyle(TextButton)
                p2.UISizeConstraint(TextButton, Vector2.new(1, 0))
                TextButton.Parent = Frame
                TextLabel = Instance.new("TextLabel")
                TextLabel.Name = "OverlayText"
                TextLabel.Size = UDim2.fromScale(1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.ZIndex = u277.ZIndex + 10
                TextLabel.ClipsDescendants = true
                p2.applyTextStyle(TextLabel)
                TextLabel.TextXAlignment = Enum.TextXAlignment.Center
                TextLabel.Parent = TextButton
                p2.applyInteractionHighlights(TextButton, TextButton, {
                    ButtonColor = p1._config.FrameBgColor,
                    ButtonTransparency = p1._config.FrameBgTransparency,
                    ButtonHoveredColor = p1._config.FrameBgHoveredColor,
                    ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
                    ButtonActiveColor = p1._config.FrameBgActiveColor,
                    ButtonActiveTransparency = p1._config.FrameBgActiveTransparency,
                })
                local TextBox = Instance.new("TextBox")
                TextBox.Name = "InputField"
                TextBox.ZIndex = u277.ZIndex + 5
                TextBox.LayoutOrder = u277.ZIndex + 2
                TextBox.Size = UDim2.new(1, 0, 1, 0)
                TextBox.BackgroundTransparency = 1
                TextBox.ClearTextOnFocus = false
                TextBox.TextTruncate = Enum.TextTruncate.AtEnd
                TextBox.ClipsDescendants = true
                TextBox.Visible = false
                p2.applyFrameStyle(TextBox, true)
                p2.applyTextStyle(TextBox)
                TextBox.Parent = TextButton
                TextBox.FocusLost:Connect(function() -- Line: 1045 -- upvalues: TextBox (val), u277 (val), getValueByIndex (upval), i (val), updateValueByIndex (upval), p1 (upval)
                    local v1
                    local v2 = tonumber(TextBox.Text:match("-?%d*%.?%d*"))
                    if v2 ~= nil then
                        if u277.arguments.Min ~= nil then
                            v2 = math.max(v2, getValueByIndex(u277.arguments.Min, i, u277.arguments))
                        end
                        if u277.arguments.Max ~= nil then
                            v2 = math.min(v2, getValueByIndex(u277.arguments.Max, i, u277.arguments))
                        end
                        if u277.arguments.Increment then
                            v1 = math.round(v2 / getValueByIndex(u277.arguments.Increment, i, u277.arguments))
                            v2 = v1 * getValueByIndex(u277.arguments.Increment, i, u277.arguments)
                        end
                        u277.state.number:set(updateValueByIndex(u277.state.number.value, i, v2, u277.arguments))
                        u277.lastNumberChangedTick = p1._cycleTick + 1
                    end
                    v1 = u277.arguments.Format[i]
                    if not v1 then
                        v1 = u277.arguments.Format[1]
                    end
                    if u277.arguments.Prefix then
                        v1 = u277.arguments.Prefix[i] .. v1
                    end
                    TextBox.Text = string.format(v1, getValueByIndex(u277.state.number.value, i, u277.arguments))
                    u277.state.editingText:set(0)
                    TextBox:ReleaseFocus(true)
                end)
                TextBox.Focused:Connect(function() -- Line: 1075 -- upvalues: TextBox (val), u277 (val), i (val)
                    TextBox.CursorPosition = #TextBox.Text + 1
                    TextBox.SelectionStart = 1
                    u277.state.editingText:set(i)
                end)
                TextButton.MouseButton1Down:Connect(function() -- Line: 1083 -- upvalues: SliderMouseDown (upval), u277 (val), a1 (upval), i (val)
                    SliderMouseDown(u277, a1, i)
                end)
                Frame_2 = Instance.new("Frame")
                Frame_2.Name = "GrabBar"
                Frame_2.ZIndex = u277.ZIndex + 5
                Frame_2.LayoutOrder = u277.ZIndex + 5
                Frame_2.AnchorPoint = Vector2.new(0, 0.5)
                Frame_2.Position = UDim2.new(0, 0, 0.5, 0)
                Frame_2.BorderSizePixel = 0
                Frame_2.BackgroundColor3 = p1._config.SliderGrabColor
                Frame_2.Transparency = p1._config.SliderGrabTransparency
                if 0 < p1._config.GrabRounding then
                    p2.UICorner(Frame_2, p1._config.GrabRounding)
                end
                Frame_2.Parent = TextButton
            end
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "TextLabel"
            TextLabel_2.Size = UDim2.fromOffset(0, v1)
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.ZIndex = u277.ZIndex + 5
            TextLabel_2.LayoutOrder = u277.ZIndex + 5
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.X
            p2.applyTextStyle(TextLabel_2)
            TextLabel_2.Parent = Frame
            return Frame
        end
        function v1.Update(a1_2) -- Line: 1118 -- upvalues: a1 (val), a2 (val), u126 (upval), getValueByIndex (upval), u85 (upval), u7 (upval), u39 (upval), u62 (upval), p1 (upval)
            local GrabBar, v1, v2, v3, v4, v5, v6, v7, v8, v9
            local Instance = a1_2.Instance
            local Text = a1_2.arguments.Text
            if not Text then
                Text = ("Slider %*"):format(a1)
            end
            Instance.TextLabel.Text = Text
            if not a1_2.arguments.Format then
                local v10, v11
                v5 = {}
                v6 = a2
                local v12 = 1
                v1 = a1_2
                for i = 1, v6, v12 do
                    v11 = u126[a1][i]
                    if v1.arguments.Increment then
                        v8 = getValueByIndex(v1.arguments.Increment, i, v1.arguments)
                        if v8 ~= 0 then
                            v10 = v8
                        else
                            v10 = 1
                        end
                        v3 = math.ceil(-math.log10(v10))
                        v11 = math.max(v11, v3, v11)
                    end
                    if v1.arguments.Max then
                        v8 = getValueByIndex(v1.arguments.Max, i, v1.arguments)
                        if v8 ~= 0 then
                            v10 = v8
                        else
                            v10 = 1
                        end
                        v3 = math.ceil(-math.log10(v10))
                        v11 = math.max(v11, v3, v11)
                    end
                    if v1.arguments.Min then
                        v8 = getValueByIndex(v1.arguments.Min, i, v1.arguments)
                        if v8 ~= 0 then
                            v10 = v8
                        else
                            v10 = 1
                        end
                        v3 = math.ceil(-math.log10(v10))
                        v11 = math.max(v11, v3, v11)
                    end
                    if 0 >= v11 then
                        v5[i] = "%d"
                    else
                        v5[i] = ("%%.%*f"):format(v11)
                    end
                end
                v1.arguments.Format = v5
                v1.arguments.Prefix = u85[a1]
            elseif typeof(a1_2.arguments.Format) ~= "table" then
                a1_2.arguments.Format = {a1_2.arguments.Format}
                v1 = a1_2
            end
            v5 = a2
            v6 = 1
            for j = 1, v5, v6 do
                v7 = Instance:FindFirstChild("SliderField" .. tostring(j))
                GrabBar = v7.GrabBar
                if not v1.arguments.Increment then
                    v8 = u7[a1][j]
                else
                    v8 = getValueByIndex(v1.arguments.Increment, j, v1.arguments)
                end
                if not v1.arguments.Min then
                    v9 = u39[a1][j]
                else
                    v9 = getValueByIndex(v1.arguments.Min, j, v1.arguments)
                end
                if not v1.arguments.Max then
                    v2 = u62[a1][j]
                else
                    v2 = getValueByIndex(v1.arguments.Max, j, v1.arguments)
                end
                v4 = 1 / math.floor((v2 + 1 - v9) / v8)
                v3 = math.max(v4, p1._config.GrabMinSize / v7.AbsoluteSize.X)
                GrabBar.Size = UDim2.new(v3, 0, 1, 0)
            end
        end
        function v1.Discard(p1) -- Line: 1176 -- upvalues: p2 (upval)
            p1.Instance:Destroy()
            p2.discardState(p1)
        end
        function v1.GenerateState(a1) -- Line: 1180 -- upvalues: p1 (upval), p3 (val)
            if a1.state.number == nil then
                a1.state.number = p1._widgetState(a1, "number", p3)
            end
            if a1.state.editingText == nil then
                a1.state.editingText = p1._widgetState(a1, "editingText", false)
            end
        end
        function v1.UpdateState(a1_2) -- Line: 1188 -- upvalues: a2 (val), getValueByIndex (upval), u7 (upval), a1 (val), u39 (upval), u62 (upval), p1 (upval)
            local GrabBar, InputField, OverlayText, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
            local Instance = a1_2.Instance
            local v11 = a2
            local v12 = 1
            local v13 = a1_2
            for i = 1, v11, v12 do
                v9 = Instance:FindFirstChild("SliderField" .. tostring(i))
                InputField = v9.InputField
                OverlayText = v9.OverlayText
                GrabBar = v9.GrabBar
                v10 = getValueByIndex(v13.state.number.value, i, v13.arguments)
                v1 = v13.arguments.Format[i]
                if not v1 then
                    v1 = v13.arguments.Format[1]
                end
                if v13.arguments.Prefix then
                    v1 = v13.arguments.Prefix[i] .. v1
                end
                OverlayText.Text = string.format(v1, v10)
                InputField.Text = tostring(v10)
                if not v13.arguments.Increment then
                    v2 = u7[a1][i]
                else
                    v2 = getValueByIndex(v13.arguments.Increment, i, v13.arguments)
                end
                if not v13.arguments.Min then
                    v3 = u39[a1][i]
                else
                    v3 = getValueByIndex(v13.arguments.Min, i, v13.arguments)
                end
                if not v13.arguments.Max then
                    v4 = u62[a1][i]
                else
                    v4 = getValueByIndex(v13.arguments.Max, i, v13.arguments)
                end
                if v2 >= 1 then
                    v5 = 1
                else
                    v5 = 0
                end
                v6 = math.floor((v5 + v4 - v3) / v2)
                v8 = math.floor((v10 - v3) / (v4 - v3) * v6) / v6
                v7 = math.clamp(v8, 0, 1 - GrabBar.AbsoluteSize.X / (v9.AbsoluteSize.X - p1._config.FramePadding.X * 2))
                GrabBar.Position = UDim2.new(v7, 0, 0.5, 0)
                if v13.state.editingText.value ~= i then
                    InputField.Visible = false
                    OverlayText.Visible = true
                    GrabBar.Visible = true
                else
                    InputField.Visible = true
                    OverlayText.Visible = false
                    GrabBar.Visible = false
                    InputField:CaptureFocus()
                end
            end
        end
        return v1
    end
    function generateEnumSliderScalar(a1, a2) -- Line: 1238 -- upvalues: generateSliderScalar (ref), p2 (val), p1 (val)
        local v1 = generateSliderScalar("Enum", 1, a2.Value)
        local v2 = {string}
        for i, j in a1:GetEnumItems() do
            v2[j.Value] = j.Name
        end
        local v3 = {
            Args = {Text = 1},
        }
        function v3.Update(a1_2) -- Line: 1250 -- upvalues: a1 (val), p1 (upval)
            local Instance = a1_2.Instance
            Instance.TextLabel.Text = a1_2.arguments.Text or "Input Enum"
            a1_2.arguments.Increment = 1
            a1_2.arguments.Min = 0
            a1_2.arguments.Max = #a1:GetEnumItems() - 1
            local SliderField1 = Instance:FindFirstChild("SliderField1")
            local v1 = 1 / math.floor(#a1:GetEnumItems())
            local v2 = math.max(v1, p1._config.GrabMinSize / SliderField1.AbsoluteSize.X)
            SliderField1.GrabBar.Size = UDim2.new(v2, 0, 1, 0)
        end
        function v3.GenerateState(a1) -- Line: 1266 -- upvalues: p1 (upval), a2 (val)
            if a1.state.number == nil then
                a1.state.number = p1._widgetState(a1, "number", a2.Value)
            end
            if a1.state.enumItem == nil then
                a1.state.enumItem = p1._widgetState(a1, "enumItem", a2)
            end
            if a1.state.editingText == nil then
                a1.state.editingText = p1._widgetState(a1, "editingText", false)
            end
        end
        return p2.extend(v1, v3)
    end
    WidgetConstructor = generateInputScalar("Num", 1, 0)
    Args = WidgetConstructor.Args
    Args.NoButtons = 6
    p1.WidgetConstructor("InputNum", WidgetConstructor)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateInputScalar("Vector2", 2, Vector2.zero)
    WidgetConstructor("InputVector2", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateInputScalar("Vector3", 3, (Vector3.new(0, 0, 0)))
    WidgetConstructor("InputVector3", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateInputScalar("UDim", 2, UDim.new())
    WidgetConstructor("InputUDim", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateInputScalar("UDim2", 4, UDim2.new())
    WidgetConstructor("InputUDim2", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateInputScalar("Rect", 4, Rect.new(0, 0, 0, 0))
    WidgetConstructor("InputRect", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateDragScalar("Num", 1, 0)
    WidgetConstructor("DragNum", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateDragScalar("Vector2", 2, Vector2.zero)
    WidgetConstructor("DragVector2", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateDragScalar("Vector3", 3, (Vector3.new(0, 0, 0)))
    WidgetConstructor("DragVector3", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateDragScalar("UDim", 2, UDim.new())
    WidgetConstructor("DragUDim", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateDragScalar("UDim2", 4, UDim2.new())
    WidgetConstructor("DragUDim2", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateDragScalar("Rect", 4, Rect.new(0, 0, 0, 0))
    WidgetConstructor("DragRect", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateColorDragScalar("Color3", Color3.fromRGB(0, 0, 0))
    WidgetConstructor("InputColor3", u167)
    WidgetConstructor = p1.WidgetConstructor
    v1 = Color3.fromRGB(0, 0, 0)
    u167 = generateColorDragScalar("Color4", v1, 0)
    WidgetConstructor("InputColor4", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateSliderScalar("Num", 1, 0)
    WidgetConstructor("SliderNum", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateSliderScalar("Vector2", 2, Vector2.zero)
    WidgetConstructor("SliderVector2", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateSliderScalar("Vector3", 3, (Vector3.new(0, 0, 0)))
    WidgetConstructor("SliderVector3", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateSliderScalar("UDim", 2, UDim.new())
    WidgetConstructor("SliderUDim", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateSliderScalar("UDim2", 4, UDim2.new())
    WidgetConstructor("SliderUDim2", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = generateSliderScalar("Rect", 4, Rect.new(0, 0, 0, 0))
    WidgetConstructor("SliderRect", u167)
    WidgetConstructor = p1.WidgetConstructor
    u167 = {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, TextHint = 2},
        Events = {
            textChanged = {
                Init = function(p1) -- Line: 1319
                    p1.lastTextchangeTick = 0
                end,
                Get = function(a1) -- Line: 1322 -- upvalues: p1 (val)
                    local v1 = a1.lastTextchangeTick == p1._cycleTick
                    return v1
                end,
            },
            hovered = p2.EVENTS.hover(function(p1) -- Line: 1326
                return p1.Instance
            end),
        },
    }
    function Generate(a1) -- Line: 1330 -- upvalues: p1 (val), p2 (val)
        local Frame = Instance.new("Frame")
        Frame.Name = "Iris_InputText"
        Frame.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
        Frame.BackgroundTransparency = 1
        Frame.BorderSizePixel = 0
        Frame.ZIndex = a1.ZIndex
        Frame.LayoutOrder = a1.ZIndex
        Frame.AutomaticSize = Enum.AutomaticSize.Y
        p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
        local TextBox = Instance.new("TextBox")
        TextBox.Name = "InputField"
        TextBox.Size = UDim2.new(1, 0, 0, 0)
        TextBox.AutomaticSize = Enum.AutomaticSize.Y
        TextBox.BackgroundColor3 = p1._config.FrameBgColor
        TextBox.BackgroundTransparency = p1._config.FrameBgTransparency
        TextBox.Text = ""
        TextBox.PlaceholderColor3 = p1._config.TextDisabledColor
        TextBox.TextTruncate = Enum.TextTruncate.AtEnd
        TextBox.ClearTextOnFocus = false
        TextBox.ZIndex = a1.ZIndex + 1
        TextBox.LayoutOrder = a1.ZIndex + 1
        TextBox.ClipsDescendants = true
        p2.applyFrameStyle(TextBox)
        p2.applyTextStyle(TextBox)
        p2.UISizeConstraint(TextBox, Vector2.new(1, 0))
        TextBox.Parent = Frame
        TextBox.FocusLost:Connect(function() -- Line: 1362 -- upvalues: a1 (val), TextBox (val), p1 (upval)
            a1.state.text:set(TextBox.Text)
            a1.lastTextchangeTick = p1._cycleTick + 1
        end)
        local v1 = p1._config.TextSize + p1._config.FramePadding.Y * 2
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "TextLabel"
        TextLabel.Size = UDim2.fromOffset(0, v1)
        TextLabel.AutomaticSize = Enum.AutomaticSize.X
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        TextLabel.ZIndex = a1.ZIndex + 4
        TextLabel.LayoutOrder = a1.ZIndex + 4
        p2.applyTextStyle(TextLabel)
        TextLabel.Parent = Frame
        return Frame
    end
    u167.Generate = Generate
    function Generate(p1) -- Line: 1384
        local Instance = p1.Instance
        Instance.TextLabel.Text = p1.arguments.Text or "Input Text"
        Instance.InputField.PlaceholderText = p1.arguments.TextHint or ""
    end
    u167.Update = Generate
    function Generate(p1) -- Line: 1392 -- upvalues: p2 (val)
        p1.Instance:Destroy()
        p2.discardState(p1)
    end
    u167.Discard = Generate
    function Generate(a1) -- Line: 1396 -- upvalues: p1 (val)
        if a1.state.text == nil then
            a1.state.text = p1._widgetState(a1, "text", "")
        end
    end
    u167.GenerateState = Generate
    function Generate(p1) -- Line: 1401
        p1.Instance.InputField.Text = p1.state.text.value
    end
    u167.UpdateState = Generate
    WidgetConstructor("InputText", u167)
end