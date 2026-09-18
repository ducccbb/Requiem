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
--           File: ReplicatedStorage.Client.Interfaces.Components.Screen.Popup
--                               Dumped in 0.00168 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
local v3 = {
    Header = function(p1) -- Line: 84 -- upvalues: useTextScale (val), useConstants (val), State (val), react (val), Error (val)
        local v1 = useTextScale()
        local v2 = useConstants()
        local u7 = State("popup-header-height")
        local u11 = react.useRef(nil)
        react.useEffect(function() -- Line: 97 -- upvalues: u11 (val), u7 (val)
            local current = u11.current
            if not current then
                return
            end
            u7(current.AbsoluteSize.Y)
            local PropertyChangedSignal = current:GetPropertyChangedSignal("AbsoluteSize")
            local u13 = PropertyChangedSignal:Connect(function() -- Line: 105 -- upvalues: u7 (upval), current (val)
                u7(current.AbsoluteSize.Y)
            end)
            return function() -- Line: 109 -- upvalues: u13 (val)
                u13:Disconnect()
            end
        end, {})
        return react.createElement(Error.Boundary, {}, {Container = react.createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 3,
            ref = u11,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v2.Padding.Sizes.Large), PaddingRight = UDim.new(0, v2.Padding.Sizes.Large), PaddingTop = UDim.new(0, v1(18))}), Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Left, Padding = UDim.new(0, v1(5))}), Header = react.createElement("TextLabel", {
            TextTransparency = 0.24,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Text = p1.Header,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v1(22),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.fromScale(1, 0),
        }), Body = react.createElement("TextLabel", {
            TextTransparency = 0.46,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = p1.Body,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v1(14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.fromScale(1, 0),
        })})})
    end,
    Body = function(p1) -- Line: 179 -- upvalues: useTextScale (val), State (val), react (val), Error (val)
        local u14, u7, v1
        local u2 = useTextScale()
        _, _, u7 = State("popup-header-height")
        v1, u14 = react.useState((u2(85)))
        react.useEffect(function() -- Line: 191 -- upvalues: u7 (val), u14 (val), u2 (val)
            return u7(function(p1) -- Line: 192 -- upvalues: u14 (upval), u2 (upval)
                if typeof(p1) == "number" and 0 < p1 then
                    u14(p1 + u2(26))
                end
            end)
        end, {u2})
        local v2 = {Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, u2(p1.Padding or 15)),
        })}
        local v3 = {BackgroundTransparency = 1, LayoutOrder = 50}
        local v4 = UDim2.fromScale(1, 0)
        v3.Size = v4 + UDim2.fromOffset(0, u2(p1.Bottom or 20))
        v2.Bottom = react.createElement("Frame", v3)
        if p1.children and type(p1.children) == "table" then
            for k, v in pairs(p1.children) do
                v2[k] = v
            end
        end
        local v5 = {}
        local v6 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0), AnchorPoint = Vector2.new(0.5, 0), AutomaticSize = Enum.AutomaticSize.Y}
        local v7 = UDim2.fromScale(0.5, 0)
        v6.Position = v7 + UDim2.fromOffset(0, v1)
        v5.Children = react.createElement("Frame", v6, v2)
        return react.createElement(Error.Boundary, {}, v5)
    end,
}
function v3.Buttons(p1) -- Line: 236 -- upvalues: useTextScale (val), useConstants (val), react (val), Error (val)
    local v1 = useTextScale()
    local v2 = {}
    local v3 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 1)}
    local v4 = UDim2.fromScale(1, 1)
    local v5 = -v1(useConstants().Padding.Sizes.Large)
    v3.Position = v4 + UDim2.fromOffset(v5, 0)
    v4 = UDim2.fromScale(1, 0)
    v3.Size = v4 + UDim2.fromOffset(0, v1(40))
    v2[1] = react.createElement("Frame", v3, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(15)),
    })}, p1.children)
    return react.createElement(Error.Boundary, {}, v2)
end
return v3