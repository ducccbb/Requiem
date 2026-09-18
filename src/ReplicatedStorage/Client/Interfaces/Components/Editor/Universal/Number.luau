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
--     File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Number
--                               Dumped in 0.00283 seconds
--                          Bytecode version 9  |  25 functions

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
local Checkbox = require(v1.Parent:WaitForChild("Checkbox"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
return function(p1) -- Line: 53 -- upvalues: react (val), useTextScale (val), useRem (val), useOrder (val), FillProps (val), Checkbox (val)
    local XY, u23, u28, u5, u6, v1, v2, v3, v4, v5, v6, v7, v8
    u5, u6 = react.useState(p1.Default or 0)
    local u10 = react.useRef(nil)
    local u14 = react.useRef(nil)
    local u18 = react.useRef(nil)
    v7, u23 = react.useState(false)
    v8, u28 = react.useState(false)
    local v9 = p1.FontSize or 14
    local v10 = p1.Upscale or 1
    local v11 = useTextScale()
    local v12 = useRem()
    local u41 = react.useRef(p1.Default or 0)
    u41.current = u5
    react.useEffect(function() -- Line: 77 -- upvalues: u6 (val), p1 (val)
        u6(p1.Default or 0)
    end, {p1.Default})
    local function getDecimalPlaces(p1) -- Line: 82
        local v1 = tostring(p1)
        local v2 = string.find(v1, "%.")
        if not v2 then
            return 0
        end
        return #v1 - v2
    end
    local function roundNumber(a1, p2) -- Line: 93 -- upvalues: getDecimalPlaces (val), p1 (val)
        local v1 = p2
        if not v1 then
            v1 = getDecimalPlaces(p1.Increment or 1)
        end
        local v2 = 10 ^ v1
        return math.floor(a1 * v2 + 0.5) / v2
    end
    local function roundToIncrement(a1) -- Line: 100 -- upvalues: p1 (val), roundNumber (val)
        local v1 = p1.Increment or 1
        return roundNumber(math.floor(a1 / v1 + 0.5) * v1)
    end
    local function clampNumber(a1) -- Line: 110 -- upvalues: p1 (val), roundNumber (val)
        local v1 = a1
        if not p1.Negatives and v1 < 0 then
            v1 = 0
        end
        if p1.Range then
            v1 = math.clamp(v1, p1.Range.Min, p1.Range.Max)
        end
        return roundNumber(v1)
    end
    local function incrementNumber() -- Line: 128 -- upvalues: clampNumber (val), roundToIncrement (val), u41 (val), p1 (val), u6 (val)
        local v1 = clampNumber(roundToIncrement(u41.current + (p1.Increment or 1)))
        u41.current = v1
        u6(v1)
        if p1.Update then
            p1.Update(v1)
        end
    end
    local function decrementNumber() -- Line: 138 -- upvalues: clampNumber (val), roundToIncrement (val), u41 (val), p1 (val), u6 (val)
        local v1 = clampNumber(roundToIncrement(u41.current - (p1.Increment or 1)))
        u41.current = v1
        u6(v1)
        if p1.Update then
            p1.Update(v1)
        end
    end
    local function stopHold() -- Line: 148 -- upvalues: u14 (val), u10 (val)
        if u14.current then
            task.cancel(u14.current)
            u14.current = nil
        end
        if u10.current then
            task.cancel(u10.current)
            u10.current = nil
        end
    end
    local function startHold(p1) -- Line: 160 -- upvalues: stopHold (val), u14 (val), u10 (val)
        stopHold()
        p1()
        u14.current = task.delay(0.3, function() -- Line: 167 -- upvalues: p1 (val), u10 (upval)
            local repeatAction
            function repeatAction() -- Line: 169 -- upvalues: p1 (upval), u10 (upval), repeatAction (val)
                p1()
                u10.current = task.delay(0.05, repeatAction)
            end
            repeatAction()
        end)
    end
    react.useEffect(function() -- Line: 178 -- upvalues: stopHold (val)
        return stopHold
    end, {})
    local v13 = react.useCallback(function() -- Line: 182 -- upvalues: startHold (val), incrementNumber (val)
        startHold(incrementNumber)
    end, {})
    local v14 = react.useCallback(function() -- Line: 186 -- upvalues: startHold (val), decrementNumber (val)
        startHold(decrementNumber)
    end, {})
    local function onTextChanging(a1) -- Line: 191 -- upvalues: p1 (val)
        local v1, v2
        local Text = a1.Text
        if p1.Suffix then
            Text = string.gsub(Text, p1.Suffix, "")
        end
        if (p1.Increment or 1) % 1 ~= 0 then
            v1 = true
        else
            v1 = false
        end
        if not p1.Negatives then
            if not v1 then
                v2 = "^%d*"
            else
                v2 = "^%d*%.?%d*"
            end
        elseif not v1 then
            v2 = "^%-?%d*"
        else
            v2 = "^%-?%d*%.?%d*"
        end
        a1.Text = (string.match(Text, v2) or "") .. (p1.Suffix or "")
    end
    local function onTextSubmitted(a1) -- Line: 227 -- upvalues: p1 (val), u5 (val), roundToIncrement (val), clampNumber (val), u41 (val), u6 (val), u18 (val)
        local Text = a1.Text
        if p1.Suffix then
            Text = string.gsub(Text, p1.Suffix, "")
        end
        local v1 = string.match(Text, "^%s*(.-)%s*$") or ""
        if v1 == "-" or v1 == "." or v1 == "-." or v1 == "" then
            a1.Text = ("%*%*"):format(u5, p1.Suffix or "")
            return
        end
        local v2 = tonumber(v1)
        if not v2 then
            a1.Text = ("%*%*"):format(u5, p1.Suffix or "")
            return
        end
        local v3 = roundToIncrement(v2)
        local v4 = clampNumber(v3)
        u41.current = v4
        u6(v4)
        a1.Text = ("%*%*"):format(v4, p1.Suffix or "")
        if p1.Update then
            p1.Update(v4)
        end
        if not p1.Reset then
            return
        end
        task.defer(function() -- Line: 266 -- upvalues: u41 (upval), u6 (upval), u18 (upval), p1 (upval)
            u41.current = 0
            u6(0)
            if u18.current then
                u18.current.Text = ("0%*"):format(p1.Suffix or "")
            end
        end)
    end
    local Toggleable = p1.Toggleable
    if Toggleable then
        Toggleable = p1.Toggleable.Visible
    end
    local v15 = useOrder()
    local v16 = p1.Divider ~= nil
    local v17 = if p1.Arrows == nil then true else not (not p1.Arrows)
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v18 = {BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    if not v16 then
        v1 = UDim2.fromOffset(0, v12(24 * v10))
    else
        v1 = UDim2.fromOffset(0, v12(24 * v10))
    end
    v18.Size = v1
    if not v16 then
        XY = Enum.AutomaticSize.X
    else
        XY = Enum.AutomaticSize.XY
    end
    v18.AutomaticSize = XY
    local v19 = FillProps(Native, v18)
    local v20 = {}
    v18 = not v16
    if v18 then
        v18 = react.createElement("UIListLayout", {
            Padding = UDim.new(0, 5 * v10),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        })
    end
    v20.List = v18
    local Header = v16
    if Header then
        if Toggleable then
            local createElement_2 = react.createElement
            v2 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}
            v3 = {}
            v5 = {
                Padding = UDim.new(0, 5 * v10),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }
            v3.List = react.createElement("UIListLayout", v5)
            v4 = Toggleable
            if v4 then
                local Default
                local createElement_3 = react.createElement
                v5 = {}
                if not p1.Toggleable then
                    Default = false
                else
                    Default = p1.Toggleable.Default
                end
                v5.Default = Default
                function v5.Toggled(a1) -- Line: 333 -- upvalues: p1 (val)
                    if p1.Toggleable and p1.Toggleable.Changed then
                        p1.Toggleable.Changed(a1)
                    end
                end
                v5.Upscale = v10
                v5.Native = {LayoutOrder = 1}
                v4 = createElement_3(Checkbox, v5)
            end
            v3.Checkbox = v4
            local Header_2 = p1.Header
            if Header_2 then
                Header_2 = react.createElement("TextLabel", {
                    TextTransparency = 0.32,
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    ZIndex = 3,
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                    Text = p1.Header,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = v11(v9 * v10),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(0, v12(14 * v10)),
                    AutomaticSize = Enum.AutomaticSize.X,
                })
            end
            v3.Body = Header_2
            Header = createElement_2("Frame", v2, v3)
        else
            Header = p1.Header
            if not Header then end
        end
    end
    v20.LeftColumn = Header
    v18 = not v16
    if v18 then
        v18 = Toggleable
        if v18 then
            local Default_2
            local createElement_4 = react.createElement
            v2 = {}
            if not p1.Toggleable then
                Default_2 = false
            else
                Default_2 = p1.Toggleable.Default
            end
            v2.Default = Default_2
            function v2.Toggled(a1) -- Line: 366 -- upvalues: p1 (val)
                if p1.Toggleable and p1.Toggleable.Changed then
                    p1.Toggleable.Changed(a1)
                end
            end
            v2.Upscale = v10
            v2.Native = {LayoutOrder = v15()}
            v18 = createElement_4(Checkbox, v2)
        end
    end
    v20.Checkbox = v18
    local Header_3 = not v16
    if Header_3 then
        Header_3 = p1.Header
        if Header_3 then
            Header_3 = react.createElement("TextLabel", {
                TextTransparency = 0.32,
                BackgroundTransparency = 1,
                ZIndex = 3,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                Text = p1.Header,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = v11(v9 * v10),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                LayoutOrder = v15(),
                Size = UDim2.fromOffset(0, v12(14 * v10)),
                AutomaticSize = Enum.AutomaticSize.X,
            })
        end
    end
    v20.Body = Header_3
    local createElement_5 = react.createElement
    v2 = {BackgroundColor3 = Color3.fromRGB(20, 23, 27), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0}
    if not v16 then
        v3 = v15()
    else
        v3 = 0
    end
    v2.LayoutOrder = v3
    if not v16 then
        v3 = UDim2.fromOffset(0, 0)
    else
        v3 = UDim2.fromOffset(p1.Divider or 0, 0)
    end
    v2.Position = v3
    v4 = v12((p1.Width or 105) * v10)
    v2.Size = UDim2.fromOffset(v4, v12(18 * v10))
    v2[react.Event.MouseEnter] = function() -- Line: 403 -- upvalues: u23 (val)
        u23(true)
    end
    v2[react.Event.MouseLeave] = function() -- Line: 407 -- upvalues: u23 (val)
        u23(false)
    end
    v3 = {}
    v5 = {Transparency = 0.58}
    if v8 then
        v6 = Color3.fromRGB(85, 170, 255)
    elseif not v7 then
        v6 = Color3.fromRGB(81, 81, 81)
    else
        v6 = Color3.fromRGB(140, 140, 140)
    end
    v5.Color = v6
    v3.Stroke = react.createElement("UIStroke", v5)
    v3.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2 * v10)})
    v5 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
        Text = ("%*%*"):format(u5, p1.Suffix or ""),
        TextColor3 = Color3.fromRGB(157, 157, 157),
        TextSize = v11(v9 * v10),
    }
    local TextXAlignment = p1.TextXAlignment
    if not TextXAlignment then
        TextXAlignment = Enum.TextXAlignment.Left
    end
    v5.TextXAlignment = TextXAlignment
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BackgroundTransparency = 1
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.BorderSizePixel = 0
    v5.Position = UDim2.fromScale(0.341, 0.5)
    v5.Size = UDim2.fromScale(0.649, 0.8)
    v5.ClearTextOnFocus = true
    v5.ref = u18
    v5[react.Change.Text] = onTextChanging
    v5[react.Event.Focused] = function() -- Line: 443 -- upvalues: u28 (val)
        u28(true)
    end
    v5[react.Event.FocusLost] = function(p1) -- Line: 447 -- upvalues: u28 (val), onTextSubmitted (val)
        u28(false)
        onTextSubmitted(p1)
    end
    v3.TextBox = react.createElement("TextBox", v5)
    v3.Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 5 * v10)})
    v5 = {
        Image = "rbxassetid://11421092947",
        ImageColor3 = Color3.fromRGB(145, 145, 145),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }
    local v21 = UDim2.fromScale(1, 0.5)
    local v22 = v12(25 * v10)
    v5.Position = v21 - UDim2.fromOffset(v22, 0)
    v21 = v12(11 * v10)
    v5.Size = UDim2.fromOffset(v21, v12(11 * v10))
    v5.ZIndex = 5
    v5[react.Event.MouseButton1Down] = v13
    v5[react.Event.MouseButton1Up] = stopHold
    v5[react.Event.MouseLeave] = stopHold
    v5.Visible = v17
    v3.Up = react.createElement("ImageButton", v5)
    v5 = {
        Image = "rbxassetid://11421095840",
        ImageColor3 = Color3.fromRGB(145, 145, 145),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }
    v21 = UDim2.fromScale(1, 0.5)
    v22 = v12(10 * v10)
    v5.Position = v21 - UDim2.fromOffset(v22, 0)
    v21 = v12(11 * v10)
    v5.Size = UDim2.fromOffset(v21, v12(11 * v10))
    v5.ZIndex = 5
    v5[react.Event.MouseButton1Down] = v14
    v5[react.Event.MouseButton1Up] = stopHold
    v5[react.Event.MouseLeave] = stopHold
    v5.Visible = v17
    v3.Down = react.createElement("ImageButton", v5)
    v20.Input = createElement_5("Frame", v2, v3)
    return createElement("Frame", v19, v20)
end