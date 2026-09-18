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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Root
--                              Dumped in 0.000647 seconds
--                          Bytecode version 9  |  7 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local u2 = 0
    p1.WidgetConstructor("Root", {
        hasState = false,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1) -- Line: 11 -- upvalues: p1 (val), p2 (val)
            local v1, v2
            local Folder = Instance.new("Folder")
            Folder.Name = "Iris_Root"
            if not p1._config.UseScreenGUIs then
                v1 = Instance.new("Folder")
            else
                v1 = Instance.new("ScreenGui")
                v1.ResetOnSpawn = false
                v1.DisplayOrder = p1._config.DisplayOrderOffset
                v1.IgnoreGuiInset = p1._config.IgnoreGuiInset
            end
            v1.Name = "PseudoWindowScreenGui"
            v1.Parent = Folder
            if not p1._config.UseScreenGUIs then
                v2 = Instance.new("Folder")
            else
                v2 = Instance.new("ScreenGui")
                v2.ResetOnSpawn = false
                v2.DisplayOrder = p1._config.DisplayOrderOffset + 1024
                v2.IgnoreGuiInset = p1._config.IgnoreGuiInset
                local Frame = Instance.new("Frame")
                Frame.Name = "TooltipContainer"
                Frame.AutomaticSize = Enum.AutomaticSize.XY
                Frame.Size = UDim2.fromOffset(0, 0)
                Frame.BackgroundTransparency = 1
                Frame.BorderSizePixel = 0
                p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.PopupBorderSize))
                Frame.Parent = v2
                local Frame_2 = Instance.new("Frame")
                Frame_2.Name = "MenuBarContainer"
                Frame_2.AutomaticSize = Enum.AutomaticSize.Y
                Frame_2.Size = UDim2.fromScale(1, 0)
                Frame_2.BackgroundTransparency = 1
                Frame_2.BorderSizePixel = 0
                Frame_2.Parent = v2
            end
            v2.Name = "PopupScreenGui"
            v2.Parent = Folder
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "PseudoWindow"
            Frame_3.Size = UDim2.new(0, 0, 0, 0)
            Frame_3.Position = UDim2.fromOffset(0, 22)
            Frame_3.AutomaticSize = Enum.AutomaticSize.XY
            Frame_3.BackgroundTransparency = p1._config.WindowBgTransparency
            Frame_3.BackgroundColor3 = p1._config.WindowBgColor
            Frame_3.BorderSizePixel = p1._config.WindowBorderSize
            Frame_3.BorderColor3 = p1._config.BorderColor
            Frame_3.Selectable = false
            Frame_3.SelectionGroup = true
            Frame_3.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
            Frame_3.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
            Frame_3.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
            Frame_3.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            Frame_3.Visible = false
            p2.UIPadding(Frame_3, p1._config.WindowPadding)
            p2.UIListLayout(Frame_3, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
            Frame_3.Parent = v1
            return Folder
        end,
        Update = function(p1) -- Line: 85 -- upvalues: u2 (ref)
            if 0 < u2 then
                p1.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = true
            end
        end,
        Discard = function(p1) -- Line: 93 -- upvalues: u2 (ref)
            u2 = 0
            p1.Instance:Destroy()
        end,
        ChildAdded = function(p1, p2) -- Line: 97 -- upvalues: u2 (ref)
            local Instance = p1.Instance
            if p2.type == "Window" then
                return p1.Instance
            end
            if p2.type == "Tooltip" then
                return Instance.PopupScreenGui.TooltipContainer
            end
            if p2.type == "MenuBar" then
                return Instance.PopupScreenGui.MenuBarContainer
            end
            local PseudoWindow = Instance.PseudoWindowScreenGui.PseudoWindow
            u2 = u2 + 1
            PseudoWindow.Visible = true
            return PseudoWindow
        end,
        ChildDiscarded = function(p1, p2) -- Line: 116 -- upvalues: u2 (ref)
            if p2.type ~= "Window" and p2.type ~= "Tooltip" and p2.type ~= "MenuBar" then
                u2 = u2 - 1
                if u2 == 0 then
                    p1.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = false
                end
            end
        end,
    })
end