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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Screen.ContextMenu
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_2:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local ContextMenuProvider = require(Providers:WaitForChild("ContextMenuProvider"))
return {
    ContextPage = function() -- Line: 61 -- upvalues: react (val), ContextMenuProvider (val), useConstants (val), useTheme (val), useTextScale (val), useRem (val), Color (val), Frame (val)
        local u19, u9, v1, v2, v3
        local u4 = react.useContext(ContextMenuProvider.ContextMenuContext)
        v1, u9 = react.useState(false)
        v3, u19 = react.useState(UDim2.new(0, 0, 0, 0))
        local v4 = useConstants()
        local v5 = useTheme()
        local v6 = useTextScale()
        local v7 = useRem()
        react.useEffect(function() -- Line: 72 -- upvalues: u9 (val), u4 (val), u19 (val)
            u9(u4.visible)
            u19(u4.position)
        end, {u4.visible, u4.contexts, u4.position})
        local v8 = {}
        for k, v in pairs(u4.contexts) do
            v2 = {
                Text = v.label,
                Size = UDim2.new(0, 0, 0, v7(30)),
                Font = Enum.Font.SourceSans,
                TextSize = v6(14),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                AutomaticSize = Enum.AutomaticSize.X,
                TextTransparency = 0.4,
                BackgroundColor3 = Color.Darken(v5.PageBackground, 0.8),
                LayoutOrder = k,
            }
            v2[react.Event.MouseButton1Click] = function() -- Line: 93 -- upvalues: u4 (val), k (val)
                if u4.callback.current then
                    u4.callback.current(k)
                end
                u4.setVisible(false)
            end
            v8[v.label] = react.createElement("TextButton", v2, {Padding = react.createElement("UIPadding", v4.Padding.Width.Small), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})
        end
        local v9 = {}
        v9[react.Event.InputBegan] = function(p1, p2) -- Line: 108 -- upvalues: u9 (val), u4 (val)
            if p2.UserInputType == Enum.UserInputType.MouseButton1 then
                u9(false)
                u4.setVisible(false)
            end
        end
        v9.Visible = v1
        return react.createElement(Frame, v9, {Frame = react.createElement("Frame", {Visible = v1, Position = v3, AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = Color.Darken(v5.PageBackground, 0.8)}, {Layout = react.createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, FillDirection = Enum.FillDirection.Vertical, Padding = UDim.new(0, 5)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color.Darken(v5.PageBackground, 1.4)}), Padding = react.createElement("UIPadding", v4.Padding.Universal.Small)}, v8)})
    end,
    ContextMenu = function(p1) -- Line: 35 -- upvalues: react (val), ContextMenuProvider (val), FillProps (val), UserInputService (val)
        local u5 = react.useContext(ContextMenuProvider.ContextMenuContext)
        local Native = p1.Native
        if not Native then
            Native = {}
        end
        local v1 = {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1}
        v1[react.Event.InputBegan] = function(a1, p2) -- Line: 48 -- upvalues: UserInputService (upval), u5 (val), p1 (val)
            if p2.UserInputType == Enum.UserInputType.MouseButton2 then
                local MouseLocation = UserInputService:GetMouseLocation()
                u5.setPosition(UDim2.new(0, MouseLocation.X, 0, MouseLocation.Y))
                u5.setContexts(p1.Contexts, p1.Callback)
                u5.setVisible(true)
            end
        end
        return react.createElement("Frame", FillProps(Native, v1))
    end,
}