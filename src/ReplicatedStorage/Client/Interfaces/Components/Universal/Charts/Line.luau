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
--      File: ReplicatedStorage.Client.Interfaces.Components.Universal.Charts.Line
--                               Dumped in 0.00245 seconds
--                          Bytecode version 9  |  5 functions

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
return function(p1) -- Line: 38 -- upvalues: useRem (val), useOrder (val), useTheme (val), react (val), useTooltip (val), Table (val), Color (val), FillProps (val)
    local AbsoluteSize, Data, u986, u989, u992, u995, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31
    local v32 = useRem()
    local v33 = useOrder()
    local v34 = useTheme()
    local v35 = react.useRef(nil)
    u986, u989 = react.useState(0)
    u992, u995 = useTooltip()
    local v36 = -1
    local v37 = pairs
    if not p1 then
        Data = {}
    else
        Data = p1.Data
    end
    local v38 = p1
    for k, v in v37(Data) do
        v1 = Table.highest(v.value)
        if not v36 then
            v36 = v1
        elseif v36 >= v1 then
        end
    end
    v37 = v38.Increment or 5
    local v39 = {}
    local v40 = {}
    local v41 = {}
    local v42 = {}
    v1 = {}
    local v43 = {}
    local v44 = Color.Inverse(v34.Secondary)
    local v45 = Color.Brighten(v44, 0.2, -1)
    react.useEffect(function() -- Line: 73 -- upvalues: u989 (val), u986 (val)
        u989(u986 + 1)
    end, {v35})
    local Data_2 = v38.Data
    if not Data_2 then
        Data_2 = {}
    end
    for k2, i in pairs(Data_2) do
        if v35.current then
            v3 = Table.reverse(i.value)
            for k3, j in pairs(v3) do
                v12 = #v3 - 1
                v9 = (k3 - 1) / math.max(v12, 1)
                v10 = v34.Secondary:lerp(v45, v9)
                local Tooltips = v38.Tooltips
                if Tooltips then
                    Tooltips = v38.Tooltips[#v38.Tooltips - k3 + 1]
                end
                if Tooltips then
                    v12 = Tooltips[1]
                    v15 = {BackgroundTransparency = 1}
                    v17 = v32(0)
                    v15.Size = UDim2.fromOffset(v17, v32(10))
                    v15.LayoutOrder = v33()
                    v15.AutomaticSize = Enum.AutomaticSize.X
                    v16 = {}
                    v19 = {BackgroundTransparency = 0, BorderSizePixel = 0}
                    v21 = v32(10)
                    v19.Size = UDim2.fromOffset(v21, v32(10))
                    v19.BackgroundColor3 = v10
                    v19.Position = UDim2.fromScale(0.5, 0.5)
                    v19.AnchorPoint = Vector2.new(0.5, 0.5)
                    v16.Circle = react.createElement("Frame", v19, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
                    v19 = {
                        BackgroundTransparency = 1,
                        TextSize = 14,
                        Size = UDim2.fromOffset(0, 1),
                        Text = Tooltips[1],
                        TextColor3 = Color.Darken(v34.Primary, 0.6),
                        Font = Enum.Font.SourceSans,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                    }
                    v21 = UDim2.fromScale(0.5, 0.5)
                    v22 = v32(10)
                    v19.Position = v21 + UDim2.fromOffset(v22, 0)
                    v19.AnchorPoint = Vector2.new(0, 0.5)
                    v19.AutomaticSize = Enum.AutomaticSize.X
                    v16.Label = react.createElement("TextLabel", v19)
                    v42[v12] = react.createElement("Frame", v15, v16)
                end
                v12 = v1[k2]
                if not v12 then
                    v12 = {}
                end
                v1[k2] = v12
                v14 = UDim2.fromScale((k2 - 0.5) / #v38.Data, 0 - j / v36 + 1 - 0.01)
                v1[k2][k3] = v14
                v15 = v1[k2 - 1]
                if v15 then
                    v15 = v1[k2 - 1][k3]
                end
                if v15 and v14 then
                    AbsoluteSize = v35.current.AbsoluteSize
                    v17 = v15.X.Scale * AbsoluteSize.X
                    v18 = v15.Y.Scale * AbsoluteSize.Y
                    v19 = v14.X.Scale * AbsoluteSize.X
                    v20 = v14.Y.Scale * AbsoluteSize.Y
                    v21 = Vector2.new(v17, v18)
                    v24 = tostring(k3)
                    v23 = v24 .. tostring(k2)
                    v25 = {
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        ZIndex = -1,
                        Size = UDim2.new(0, (v21 - Vector2.new(v19, v20)).Magnitude, 0, 3),
                        BackgroundColor3 = v10,
                        LayoutOrder = k3,
                    }
                    v27 = UDim2.new(0, (v17 + v19) / 2, 0, (v18 + v20) / 2)
                    v25.Position = v27 + UDim2.fromOffset(5, 5)
                    v25.AnchorPoint = Vector2.new(0.5, 0.5)
                    v27 = math.atan2(v20 - v18, v19 - v17)
                    v25.Rotation = v27 * (180 / math.pi)
                    v26 = {}
                    v28 = {Rotation = 90}
                    v29 = {}
                    v30 = NumberSequenceKeypoint.new(0, 1)
                    v31 = NumberSequenceKeypoint.new(0.5, 0)
                    v29[1] = v30
                    v29[2] = v31
                    v29[3] = NumberSequenceKeypoint.new(1, 1)
                    v28.Transparency = NumberSequence.new(v29)
                    v26.Gradient = react.createElement("UIGradient", v28)
                    v43[v23] = react.createElement("Frame", v25, v26)
                end
                v17 = tostring(k3)
                v16 = v17 .. tostring(k2)
                v19 = {}
                v21 = v32(10)
                v19.Size = UDim2.fromOffset(v21, v32(10))
                v19.BackgroundTransparency = 0
                v19.BackgroundColor3 = v10
                v19.BorderSizePixel = 0
                v19.LayoutOrder = k3
                v19.Position = v14
                v19[react.Event.MouseEnter] = function(...) -- Line: 178 -- upvalues: Tooltips (val), u992 (val), j (val)
                    if not Tooltips then
                        return
                    end
                    local v1 = Tooltips[1]
                    local v2 = string.format(Tooltips[2], j)
                    u992(v1, v2, ...)
                end
                v19[react.Event.MouseLeave] = function() -- Line: 185 -- upvalues: Tooltips (val), u995 (val)
                    if not Tooltips then
                        return
                    end
                    u995()
                end
                v40[v16] = react.createElement("Frame", v19, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
            end
            v4 = (k2 - 0.5) / #v38.Data
            v8 = {BackgroundTransparency = 1, BorderSizePixel = 0}
            v10 = UDim2.fromScale(0, 1)
            v12 = v32(50)
            v8.Size = v10 + UDim2.fromOffset(v12, 0)
            v8.BackgroundColor3 = v34.Secondary
            v8.LayoutOrder = v33()
            v8.AnchorPoint = Vector2.new(0.5, 0)
            v8.Position = UDim2.fromScale(v4, 0)
            v9 = {}
            v12 = {
                BackgroundTransparency = 1,
                TextSize = 14,
                Size = UDim2.fromScale(1, 0),
                Text = i.name,
                TextColor3 = Color.Darken(v34.Primary, 0.6),
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Bottom,
            }
            v14 = UDim2.fromScale(0.5, 1)
            v12.Position = v14 + UDim2.fromOffset(0, v32(33.333333333333336))
            v12.AnchorPoint = Vector2.new(0.5, 1)
            v9.Label = react.createElement("TextLabel", v12)
            v39[i.name] = react.createElement("Frame", v8, v9)
        end
    end
    v44 = v37 - 1
    local v46 = 1
    for k4 = 1, v44, v46 do
        v2 = tostring(k4)
        v5 = {BackgroundTransparency = 0.9, BorderSizePixel = 0}
        v7 = UDim2.fromScale(1, 0)
        v5.Size = v7 + UDim2.fromOffset(0, 2)
        v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v5.LayoutOrder = v37 - v33()
        v5.AnchorPoint = Vector2.new(1, 0)
        v7 = UDim2.fromScale(1, 0)
        v5.Position = v7 + UDim2.fromOffset(0, 300 - (250 / v37 * k4 + 50))
        v6 = {}
        v9 = {BackgroundTransparency = 1, TextSize = 14}
        v11 = UDim2.fromScale(1, 0)
        v9.Size = v11 + UDim2.fromOffset(0, v32(33.333333333333336))
        v11 = tostring((math.floor(k4 / v37 * v36)))
        v9.Text = v11 .. (v38.Suffix or "")
        v9.TextColor3 = Color.Darken(v34.Primary, 0.6)
        v9.Font = Enum.Font.SourceSans
        v9.TextXAlignment = Enum.TextXAlignment.Right
        v9.TextYAlignment = Enum.TextYAlignment.Center
        v11 = UDim2.fromScale(-1, 0.5)
        v13 = -v32(16.666666666666668)
        v9.Position = v11 + UDim2.fromOffset(v13, 0)
        v9.AnchorPoint = Vector2.new(0, 0.5)
        v6.Label = react.createElement("TextLabel", v9)
        v41[v2] = react.createElement("Frame", v5, v6)
    end
    local Native = v38.Native
    if not Native then
        Native = {}
    end
    v2 = {BackgroundTransparency = 1}
    v4 = UDim2.fromScale(1, 0)
    v2.Size = v4 + UDim2.fromOffset(0, v32(300))
    v2.AnchorPoint = Vector2.new(0.5, 0.5)
    v2.Position = UDim2.fromScale(0.5, 0.5)
    local v47 = FillProps(Native, v2)
    local v48 = {}
    v4 = {BackgroundTransparency = 1}
    v6 = UDim2.fromScale(1, 1)
    v8 = -v32(50)
    v4.Size = v6 + UDim2.fromOffset(v8, -v32(50))
    v4.AnchorPoint = Vector2.new(0.5, 0.5)
    v6 = UDim2.fromScale(0.5, 0.5)
    v8 = v32(25)
    v4.Position = v6 + UDim2.fromOffset(v8, -v32(25))
    v5 = {Stroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.5, Color = Color.Darken(v34.Primary, 0.6)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v32(5))}), Bars = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Position = UDim2.fromScale(0.5, 0), AnchorPoint = Vector2.new(0.5, 0)}, {}, v39), Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        ref = v35,
    }, v40, v43)}
    v8 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v8.Size = v10 + UDim2.fromOffset(0, v32(300) - 50)
    v8.Position = UDim2.fromOffset(0, 0)
    v8.AnchorPoint = Vector2.new(0, 0)
    v5.Lines = react.createElement("Frame", v8, v41)
    v6 = {}
    v9 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0)}
    v11 = UDim2.fromScale(1, 0)
    v13 = -v32(10)
    v9.Position = v11 + UDim2.fromOffset(v13, v32(-30))
    v11 = v32(10)
    v9.Size = UDim2.fromOffset(v11, v32(10))
    v6.Colors = react.createElement("Frame", v9, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v32(2)),
    })}, v42)
    v48.Chart = react.createElement("Frame", v4, v5, v6)
    return react.createElement("Frame", v47, v48)
end