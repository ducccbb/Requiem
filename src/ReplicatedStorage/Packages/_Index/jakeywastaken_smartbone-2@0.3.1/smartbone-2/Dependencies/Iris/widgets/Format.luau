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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Format
--                              Dumped in 0.000668 seconds
--                          Bytecode version 9  |  17 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    p1.WidgetConstructor("Separator", {
        hasState = false,
        hasChildren = false,
        Args = {},
        Events = {},
        Generate = function(a1) -- Line: 9 -- upvalues: p1 (val), p2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Separator"
            Frame.BackgroundColor3 = p1._config.SeparatorColor
            Frame.BackgroundTransparency = p1._config.SeparatorTransparency
            Frame.BorderSizePixel = 0
            if a1.parentWidget.type ~= "SameLine" then
                Frame.Size = UDim2.new(1, 0, 0, 1)
            else
                Frame.Size = UDim2.new(0, 1, 1, 0)
            end
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            return Frame
        end,
        Update = function(p1) end,
        Discard = function(p1) -- Line: 29
            p1.Instance:Destroy()
        end,
    })
    p1.WidgetConstructor("Indent", {
        hasState = false,
        hasChildren = true,
        Args = {Width = 1},
        Events = {},
        Generate = function(a1) -- Line: 41 -- upvalues: p2 (val), p1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Indent"
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
            p2.UIPadding(Frame, Vector2.new(0, 0))
            return Frame
        end,
        Update = function(a1) -- Line: 56 -- upvalues: p1 (val)
            local Width
            if not a1.arguments.Width then
                Width = p1._config.IndentSpacing
            else
                Width = a1.arguments.Width
            end
            a1.Instance.UIPadding.PaddingLeft = UDim.new(0, Width)
        end,
        Discard = function(p1) -- Line: 67
            p1.Instance:Destroy()
        end,
        ChildAdded = function(p1, p2) -- Line: 70
            return p1.Instance
        end,
    })
    p1.WidgetConstructor("SameLine", {
        hasState = false,
        hasChildren = true,
        Args = {Width = 1, VerticalAlignment = 2},
        Events = {},
        Generate = function(p1) -- Line: 83 -- upvalues: p2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_SameLine"
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.ZIndex = p1.ZIndex
            Frame.LayoutOrder = p1.ZIndex
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, 0))
            return Frame
        end,
        Update = function(a1) -- Line: 97 -- upvalues: p1 (val)
            local Width
            local UIListLayout = a1.Instance.UIListLayout
            if not a1.arguments.Width then
                Width = p1._config.ItemSpacing.X
            else
                Width = a1.arguments.Width
            end
            UIListLayout.Padding = UDim.new(0, Width)
            if a1.arguments.VerticalAlignment then
                UIListLayout.VerticalAlignment = a1.arguments.VerticalAlignment
                return
            end
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        end,
        Discard = function(p1) -- Line: 113
            p1.Instance:Destroy()
        end,
        ChildAdded = function(p1, p2) -- Line: 116
            return p1.Instance
        end,
    })
    p1.WidgetConstructor("Group", {
        hasState = false,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1) -- Line: 126 -- upvalues: p2 (val), p1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Group"
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromOffset(0, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.XY
            Frame.ZIndex = a1.ZIndex
            Frame.LayoutOrder = a1.ZIndex
            Frame.ClipsDescendants = true
            p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.X))
            return Frame
        end,
        Update = function(p1) end,
        Discard = function(p1) -- Line: 142
            p1.Instance:Destroy()
        end,
        ChildAdded = function(p1, p2) -- Line: 145
            return p1.Instance
        end,
    })
end