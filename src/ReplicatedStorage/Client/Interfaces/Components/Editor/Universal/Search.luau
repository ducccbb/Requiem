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
--     File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Search
--                              Dumped in 0.000903 seconds
--                          Bytecode version 9  |  8 functions

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
local Routes = v1.Parent.Parent.Parent.Parent:WaitForChild("Routes")
local Debug = Routes:WaitForChild("Debug")
local Hooks = Debug:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks:WaitForChild("useDebuggerTheme"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
return react.memo(function(p1) -- Line: 35 -- upvalues: useRem (val), useTextScale (val), useTheme (val), useDebuggerTheme (val), react (val)
    local Background, Primary, Secondary, Stroke, u16, u17, u22, u27, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useTextScale()
    if not p1.IsMenu then
        v2 = useDebuggerTheme()
    else
        v2 = useTheme()
    end
    u16, u17 = react.useState(p1.Default or "")
    v3, u22 = react.useState(false)
    v4, u27 = react.useState(false)
    local HeightPx = p1.HeightPx
    if not HeightPx then
        HeightPx = v5(23)
    end
    local Size = p1.Size
    if not Size then
        local WidthPx = p1.WidthPx
        if not WidthPx then
            WidthPx = v5(346)
        end
        Size = UDim2.fromOffset(WidthPx, HeightPx)
    end
    react.useEffect(function() -- Line: 48 -- upvalues: p1 (val), u16 (val)
        if p1.Changed then
            p1.Changed(u16)
        end
        if p1.OnQueryChange then
            p1.OnQueryChange(u16)
        end
    end, {u16})
    local createElement = react.createElement
    local v7 = {}
    if not p1.IsMenu then
        Background = v2.chrome.searchSurface
    else
        Background = v2.Container.Background
    end
    v7.BackgroundColor3 = Background
    v7.BorderSizePixel = 0
    v7.Size = Size
    v7.LayoutOrder = p1.LayoutOrder
    v7[react.Event.MouseEnter] = function() -- Line: 63 -- upvalues: u22 (val)
        u22(true)
    end
    v7[react.Event.MouseLeave] = function() -- Line: 67 -- upvalues: u22 (val)
        u22(false)
    end
    local v8 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v5(8))})}
    local createElement_2 = react.createElement
    local v9 = {Thickness = 1}
    if not v4 then
        if not v3 then
            if not p1.IsMenu then
                Stroke = v2.chrome.searchStrokeIdle
            else
                Stroke = v2.Container.Stroke
            end
        elseif not p1.IsMenu then
            Stroke = v2.chrome.searchStrokeHover
        else
            Stroke = v2.Container.Stroke
        end
    elseif not p1.IsMenu then
        Stroke = v2.chrome.searchStrokeFocused
    else
        Stroke = v2.Container.Stroke
    end
    v9.Color = Stroke
    if not v4 then
        v1 = 0.58
    else
        v1 = 0.28
    end
    v9.Transparency = v1
    v8.Stroke = createElement_2("UIStroke", v9)
    local createElement_3 = react.createElement
    v9 = {FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")}
    if not p1.IsMenu then
        Secondary = v2.text.searchPlaceholder
    else
        Secondary = v2.Text.Secondary
    end
    v9.PlaceholderColor3 = Secondary
    v9.PlaceholderText = p1.PlaceholderText or "Search..."
    v9.Text = u16
    if not p1.IsMenu then
        Primary = v2.text.searchInput
    else
        Primary = v2.Text.Primary
        if not Primary then
            Primary = v2.text.searchInput
        end
    end
    v9.TextColor3 = Primary
    v9.TextSize = v6(15)
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextTruncate = Enum.TextTruncate.AtEnd
    v9.ClearTextOnFocus = false
    v9.AnchorPoint = Vector2.new(0, 0.5)
    v9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v9.BackgroundTransparency = 1
    v9.BorderSizePixel = 0
    local v10 = v5(10)
    v9.Position = UDim2.new(0, v10, 0.5, 0)
    v10 = -v5(20)
    v9.Size = UDim2.new(1, v10, 0, HeightPx - v5(14))
    v9[react.Change.Text] = function(p1) -- Line: 101 -- upvalues: u17 (val)
        u17(p1.Text)
    end
    v9[react.Event.Focused] = function() -- Line: 105 -- upvalues: u27 (val)
        u27(true)
    end
    v9[react.Event.FocusLost] = function() -- Line: 109 -- upvalues: u27 (val)
        u27(false)
    end
    v8.Input = createElement_3("TextBox", v9)
    return createElement("Frame", v7, v8)
end)