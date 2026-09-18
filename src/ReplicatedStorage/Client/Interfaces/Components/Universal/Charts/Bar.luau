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
--       File: ReplicatedStorage.Client.Interfaces.Components.Universal.Charts.Bar
--                               Dumped in 0.00182 seconds
--                          Bytecode version 9  |  4 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities_2:WaitForChild("Color"))
local Utilities_3 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_3:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTooltip = require(Hooks_4:WaitForChild("useTooltip"))
return function(p1) -- Line: 38 -- upvalues: useRem (val), useOrder (val), useTheme (val), useTooltip (val), Table (val), Color (val), react (val), FillProps (val)
    local Data_2, u723, u725, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20
    local v21 = useRem()
    local v22 = useOrder()
    local v23 = useTheme()
    u723, u725 = useTooltip()
    local v24 = -1
    local Data = p1.Data
    if not Data then
        Data = {}
    end
    local v25 = p1
    for k, v in pairs(Data) do
        v1 = Table.highest(v.value)
        if not v24 then
            v24 = v1
        elseif v24 >= v1 then
        end
    end
    local v26 = v25.Increment or 5
    local v27 = {}
    local v28 = {}
    local v29 = {}
    v1 = Color.Inverse(v23.Secondary)
    local v30 = Color.Brighten(v1, 0.2, -1)
    v1 = pairs
    if not v25 then
        Data_2 = {}
    else
        Data_2 = v25.Data
    end
    for k2, i in v1(Data_2) do
        v3 = {}
        v4 = Table.reverse(i.value)
        for k3, j in pairs(v4) do
            v10 = (k3 - 1) / math.max(#v4 - 1, 1)
            v11 = v23.Secondary:lerp(v30, v10)
            v12 = j / v24 * 250
            local Tooltips = v25.Tooltips
            if Tooltips then
                Tooltips = v25.Tooltips[#v25.Tooltips - k3 + 1]
            end
            if Tooltips then
                v14 = Tooltips[1]
                v15 = {BackgroundTransparency = 1}
                v17 = v21(0)
                v15.Size = UDim2.fromOffset(v17, v21(10))
                v15.LayoutOrder = v22()
                v15.AutomaticSize = Enum.AutomaticSize.X
                v16 = {}
                v18 = {BackgroundTransparency = 0, BorderSizePixel = 0}
                v19 = v21(10)
                v18.Size = UDim2.fromOffset(v19, v21(10))
                v18.BackgroundColor3 = v11
                v18.Position = UDim2.fromScale(0.5, 0.5)
                v18.AnchorPoint = Vector2.new(0.5, 0.5)
                v16.Circle = react.createElement("Frame", v18, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
                v18 = {
                    BackgroundTransparency = 1,
                    TextSize = 14,
                    Size = UDim2.fromOffset(0, 1),
                    Text = Tooltips[1],
                    TextColor3 = Color.Darken(v23.Primary, 0.6),
                    Font = Enum.Font.SourceSans,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                }
                v19 = UDim2.fromScale(0.5, 0.5)
                v20 = v21(10)
                v18.Position = v19 + UDim2.fromOffset(v20, 0)
                v18.AnchorPoint = Vector2.new(0, 0.5)
                v18.AutomaticSize = Enum.AutomaticSize.X
                v16.Label = react.createElement("TextLabel", v18)
                v29[v14] = react.createElement("Frame", v15, v16)
            end
            v14 = tostring(k3)
            v15 = {}
            v17 = UDim2.fromScale(1 / #i.value, 0)
            v15.Size = v17 + UDim2.fromOffset(-2, v12)
            v15.BackgroundTransparency = 0
            v15.BackgroundColor3 = v11
            v15.BorderSizePixel = 0
            v15.LayoutOrder = k3
            v17 = UDim2.fromScale(1 - k3 / #i.value, 0)
            v15.Position = v17 + UDim2.fromOffset(0, 300 - v12 - 300)
            v15[react.Event.MouseEnter] = function(...) -- Line: 122 -- upvalues: Tooltips (val), u723 (val), j (val)
                if not Tooltips then
                    return
                end
                local v1 = Tooltips[1]
                local v2 = string.format(Tooltips[2], j)
                u723(v1, v2, ...)
            end
            v15[react.Event.MouseLeave] = function() -- Line: 129 -- upvalues: Tooltips (val), u725 (val)
                if not Tooltips then
                    return
                end
                u725()
            end
            v3[v14] = react.createElement("Frame", v15)
        end
        v8 = {BackgroundTransparency = 0, BorderSizePixel = 0}
        v10 = v21(50)
        v8.Size = UDim2.fromOffset(v10, 0)
        v8.BackgroundColor3 = v23.Secondary
        v8.LayoutOrder = v22()
        v9 = {}
        v12 = {
            BackgroundTransparency = 1,
            TextSize = 14,
            Size = UDim2.fromScale(1, 0),
            Text = i.name,
            TextColor3 = Color.Darken(v23.Primary, 0.6),
            Font = Enum.Font.SourceSans,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom,
        }
        v14 = UDim2.fromScale(0.5, 1)
        v12.Position = v14 + UDim2.fromOffset(0, v21(33.333333333333336))
        v12.AnchorPoint = Vector2.new(0.5, 1)
        v9.Label = react.createElement("TextLabel", v12)
        v27[i.name] = react.createElement("Frame", v8, v9, v3)
    end
    v1 = v26 - 1
    local v31 = 1
    for k4 = 1, v1, v31 do
        v2 = tostring(k4)
        v5 = {BackgroundTransparency = 0.9, BorderSizePixel = 0}
        v7 = UDim2.fromScale(1, 0)
        v5.Size = v7 + UDim2.fromOffset(0, 2)
        v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v5.LayoutOrder = v26 - v22()
        v5.AnchorPoint = Vector2.new(1, 0)
        v7 = UDim2.fromScale(1, 0)
        v5.Position = v7 + UDim2.fromOffset(0, 300 - (250 / v26 * k4 + 50))
        v6 = {}
        v9 = {BackgroundTransparency = 1, TextSize = 14}
        v11 = UDim2.fromScale(1, 0)
        v9.Size = v11 + UDim2.fromOffset(0, v21(33.333333333333336))
        v11 = tostring((math.floor(k4 / v26 * v24)))
        v9.Text = v11 .. (v25.Suffix or "")
        v9.TextColor3 = Color.Darken(v23.Primary, 0.6)
        v9.Font = Enum.Font.SourceSans
        v9.TextXAlignment = Enum.TextXAlignment.Right
        v9.TextYAlignment = Enum.TextYAlignment.Center
        v11 = UDim2.fromScale(-1, 0.5)
        v13 = -v21(16.666666666666668)
        v9.Position = v11 + UDim2.fromOffset(v13, 0)
        v9.AnchorPoint = Vector2.new(0, 0.5)
        v6.Label = react.createElement("TextLabel", v9)
        v28[v2] = react.createElement("Frame", v5, v6)
    end
    local Native = v25.Native
    if not Native then
        Native = {}
    end
    v2 = {BackgroundTransparency = 1}
    v4 = UDim2.fromScale(1, 0)
    v2.Size = v4 + UDim2.fromOffset(0, v21(300))
    v2.AnchorPoint = Vector2.new(0.5, 0.5)
    v2.Position = UDim2.fromScale(0.5, 0.5)
    local v32 = FillProps(Native, v2)
    local v33 = {}
    v4 = {BackgroundTransparency = 1}
    v6 = UDim2.fromScale(1, 1)
    v8 = -v21(50)
    v4.Size = v6 + UDim2.fromOffset(v8, -v21(50))
    v4.AnchorPoint = Vector2.new(0.5, 0.5)
    v6 = UDim2.fromScale(0.5, 0.5)
    v8 = v21(25)
    v4.Position = v6 + UDim2.fromOffset(v8, -v21(25))
    v5 = {Stroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.5, Color = Color.Darken(v23.Primary, 0.6)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v21(5))}), Bars = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0), Position = UDim2.fromScale(0.5, 1), AnchorPoint = Vector2.new(0.5, 0)}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v21(5)),
    })}, v27)}
    v8 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v8.Size = v10 + UDim2.fromOffset(0, v21(300) - 50)
    v8.Position = UDim2.fromOffset(0, 0)
    v8.AnchorPoint = Vector2.new(0, 0)
    v5.Lines = react.createElement("Frame", v8, v28)
    v6 = {}
    v9 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0)}
    v11 = UDim2.fromScale(1, 0)
    v13 = -v21(10)
    v9.Position = v11 + UDim2.fromOffset(v13, v21(-30))
    v11 = v21(10)
    v9.Size = UDim2.fromOffset(v11, v21(10))
    v6.Colors = react.createElement("Frame", v9, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v21(2)),
    })}, v29)
    v33.Chart = react.createElement("Frame", v4, v5, v6)
    return react.createElement("Frame", v32, v33)
end