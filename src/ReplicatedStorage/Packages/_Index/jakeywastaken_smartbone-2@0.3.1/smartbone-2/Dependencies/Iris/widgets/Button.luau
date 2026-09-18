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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Button
--                              Dumped in 0.000442 seconds
--                          Bytecode version 9  |  12 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local u2 = {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1},
        Events = {
            clicked = p2.EVENTS.click(function(p1) -- Line: 11
                return p1.Instance
            end),
            rightClicked = p2.EVENTS.rightClick(function(p1) -- Line: 14
                return p1.Instance
            end),
            doubleClicked = p2.EVENTS.doubleClick(function(p1) -- Line: 17
                return p1.Instance
            end),
            ctrlClicked = p2.EVENTS.ctrlClick(function(p1) -- Line: 20
                return p1.Instance
            end),
            hovered = p2.EVENTS.hover(function(p1) -- Line: 23
                return p1.Instance
            end),
        },
        Generate = function(a1) -- Line: 27 -- upvalues: p1 (val), p2 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Size = UDim2.fromOffset(0, 0)
            TextButton.BackgroundColor3 = p1._config.ButtonColor
            TextButton.BackgroundTransparency = p1._config.ButtonTransparency
            TextButton.AutoButtonColor = false
            p2.applyTextStyle(TextButton)
            TextButton.AutomaticSize = Enum.AutomaticSize.XY
            p2.applyFrameStyle(TextButton)
            p2.applyInteractionHighlights(TextButton, TextButton, {
                ButtonColor = p1._config.ButtonColor,
                ButtonTransparency = p1._config.ButtonTransparency,
                ButtonHoveredColor = p1._config.ButtonHoveredColor,
                ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
                ButtonActiveColor = p1._config.ButtonActiveColor,
                ButtonActiveTransparency = p1._config.ButtonActiveTransparency,
            })
            TextButton.ZIndex = a1.ZIndex
            TextButton.LayoutOrder = a1.ZIndex
            return TextButton
        end,
        Update = function(p1) -- Line: 53
            p1.Instance.Text = p1.arguments.Text or "Button"
        end,
        Discard = function(p1) -- Line: 57
            p1.Instance:Destroy()
        end,
    }
    p2.abstractButton = u2
    p1.WidgetConstructor("Button", p2.extend(u2, {
        Generate = function(p1) -- Line: 66 -- upvalues: u2 (val)
            local v1 = u2.Generate(p1)
            v1.Name = "Iris_Button"
            return v1
        end,
    }))
    p1.WidgetConstructor("SmallButton", p2.extend(u2, {
        Generate = function(p1) -- Line: 78 -- upvalues: u2 (val)
            local v1 = u2.Generate(p1)
            v1.Name = "Iris_SmallButton"
            local UIPadding = v1.UIPadding
            UIPadding.PaddingLeft = UDim.new(0, 2)
            UIPadding.PaddingRight = UDim.new(0, 2)
            UIPadding.PaddingTop = UDim.new(0, 0)
            UIPadding.PaddingBottom = UDim.new(0, 0)
            return v1
        end,
    }))
end