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
--        File: ReplicatedStorage.Client.Interfaces.Components.Universal.Keybind
--                               Dumped in 0.00217 seconds
--                          Bytecode version 9  |  6 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities_2:WaitForChild("Color"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
return function(p1) -- Line: 42 -- upvalues: useRem (val), useTheme (val), useToast (val), react (val), Color (val), String (val), UserInputService (val)
    local Primary, u10, u11, v1
    local v2 = useRem()
    local v3 = useTheme()
    local u6 = useToast()
    u10, u11 = react.useState(p1.Default)
    local v4 = react.useMemo(function() -- Line: 50 -- upvalues: u10 (val)
        for k, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Value == u10 then
                return v
            end
        end
        return Enum.KeyCode.Unknown
    end, {p1.Default, u10})
    react.useEffect(function() -- Line: 60 -- upvalues: u11 (val), p1 (val)
        u11(p1.Default)
    end, {p1.Default})
    local v5 = p1.PopupType or false
    local createElement = react.createElement
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(0, v2(25)),
    }
    local v7 = {}
    local createElement_2 = react.createElement
    local v8 = {BorderSizePixel = 0, ZIndex = 2, AutomaticSize = Enum.AutomaticSize.X}
    if not v5 then
        v1 = Color.Darken(v3.PageBackground, 1.35)
    else
        v1 = Color3.fromRGB(255, 255, 255)
    end
    v8.BackgroundColor3 = v1
    v8.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v8.Size = UDim2.fromOffset(0, v2(25))
    v1 = {}
    local createElement_3 = react.createElement
    local v9 = {
        TextTransparency = 0.3,
        TextScaled = false,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = String.camelCaseToText(v4.Name),
    }
    if not v5 then
        Primary = v3.Primary
    else
        Primary = Color3.fromRGB(0, 0, 0)
        if not Primary then
            Primary = v3.Primary
        end
    end
    v9.TextColor3 = Primary
    v9.TextSize = v2(15)
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.AnchorPoint = Vector2.new(0, 0.5)
    v9.AutomaticSize = Enum.AutomaticSize.X
    v9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v9.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v9.Position = UDim2.fromScale(0, 0.5)
    v9.Size = UDim2.fromScale(1.18, 0.517)
    v1.textLabel = createElement_3("TextLabel", v9)
    v1.uIPadding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15)})
    v1.uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 6)})
    v7.frame = createElement_2("Frame", v8, v1)
    v7.frame1 = react.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(17, 17, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.075),
        Size = UDim2.fromScale(1, 1),
    }, {uICorner1 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 6)})})
    v8 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 3,
    }
    v8[react.Event.MouseButton1Down] = function(a1) -- Line: 137 -- upvalues: p1 (val), u6 (val), UserInputService (upval), String (upval), u11 (val)
        local u6
        if not p1.Changed then
            return
        end
        u6({message = "Press any key to bind.", type = "info"})
        u6 = nil
    end
    v7.Button = react.createElement("TextButton", v8)
    return createElement("Frame", v6, v7)
end