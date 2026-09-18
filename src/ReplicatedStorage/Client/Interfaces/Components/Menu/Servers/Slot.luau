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
--        File: ReplicatedStorage.Client.Interfaces.Components.Menu.Servers.Slot
--                               Dumped in 0.00183 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Administration_2 = Common_3:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local function Slot(p1) -- Line: 47 -- upvalues: useMotion (val), react (val)
    local u4, v1
    v1, u4 = useMotion(0.73)
    local v2 = react.useCallback(function() -- Line: 50 -- upvalues: u4 (val)
        u4:spring(0.5)
    end, {})
    local v3 = react.useCallback(function() -- Line: 54 -- upvalues: u4 (val)
        u4:spring(0.73)
    end, {})
    local v4 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.8,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.111),
        LayoutOrder = 100,
    }
    v4[react.Event.MouseEnter] = v2
    v4[react.Event.MouseLeave] = v3
    local v5 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})}
    local v6 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = ""}
    v6[react.Event.MouseButton1Click] = function() -- Line: 78 -- upvalues: p1 (val)
        p1.Clicked()
    end
    v5.Button = react.createElement("TextButton", v6)
    v5.Title = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        RichText = true,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0564, 0.219),
        Size = UDim2.fromScale(0.539, 0.274),
    })
    v5.Description = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Description,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0564, 0.505),
        Size = UDim2.fromScale(0.8, 0.233),
    })
    v5.Stroke = react.createElement("UIStroke", {Color = Color3.fromRGB(53, 53, 53)})
    v5.Border = react.createElement("ImageLabel", {
        Image = "rbxassetid://132892752874729",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageTransparency = v1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(287, 219, 357, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -5, 1, -5),
    })
    return react.createElement("Frame", v4, v5)
end
return function(p1) -- Line: 144 -- upvalues: useMotion (val), useStore (val), Administration (val), react (val), Table (val), Permissions (val), Slot (val), TransparencyGroup (val), UserInputService (val), PlayerGui (val)
    local u5, v1
    local v2 = {}
    v1, u5 = useMotion(-100)
    local u10 = useStore(Administration.Store, function(p1) -- Line: 149
        return p1
    end)
    local v3 = react.useMemo(function() -- Line: 153 -- upvalues: Table (upval), Permissions (upval), u10 (val)
        return Table.inverse(Permissions.Roles)[u10.permission or 1]
    end, {u10.permission})
    react.useEffect(function() -- Line: 158 -- upvalues: u5 (val), p1 (val)
        local v1
        if not p1.Visible then
            v1 = -100
        else
            v1 = 0
        end
        u5:spring(v1)
    end, {p1.Visible})
    v2["Staff Slot"] = react.createElement(Slot, {
        Description = "Access to all available administration features.",
        Name = ("<font color=\"rgb(10, 153, 255)\">%*</font> Slot"):format(v3),
        Visible = p1.Visible,
        Clicked = function() -- Line: 168 -- upvalues: p1 (val)
            p1.Clicked("Staff")
        end,
    })
    v2["Player Slot"] = react.createElement(Slot, {
        Name = "Lore Slot",
        Description = "Your current lore character, without any administration features.",
        Visible = p1.Visible,
        Clicked = function() -- Line: 178 -- upvalues: p1 (val)
            p1.Clicked("Player")
        end,
    })
    local v4 = {Enabled = p1.Visible, Tween = TweenInfo.new(0.2)}
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(10, 10, 16),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1:map(function(p1) -- Line: 193
            local v1 = UDim2.fromScale(0.5, 0.5)
            return v1 + UDim2.fromOffset(0, p1)
        end),
        Size = UDim2.fromScale(1, 1),
    }
    local v7 = {}
    local v8 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = ""}
    v8[react.Event.MouseButton1Click] = function(a1, ...) -- Line: 203 -- upvalues: UserInputService (upval), PlayerGui (upval), p1 (val)
        local MouseLocation = UserInputService:GetMouseLocation()
        local GuiObjectsAtPosition = PlayerGui:GetGuiObjectsAtPosition(MouseLocation.X, MouseLocation.Y)
        if table.find(GuiObjectsAtPosition, a1.Parent.Holder) then
            return
        end
        p1.Closed()
    end
    v8.ZIndex = -2
    v7.Close = react.createElement("TextButton", v8)
    v7.Info = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(8, 9, 13),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.504, 0.5),
        Size = UDim2.fromScale(1.5, 1),
    })})
    v7.Holder = react.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(31, 33, 39),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.305, 0.491),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}),
        Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 15), PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), PaddingTop = UDim.new(0, 15)}),
        Stroke = react.createElement("UIStroke", {Thickness = 2, Transparency = 0.76}),
        List = react.createElement("ScrollingFrame", {
            ScrollBarThickness = 4,
            Active = true,
            BackgroundTransparency = 0.95,
            BorderSizePixel = 0,
            ZIndex = 2,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Stroke = react.createElement("UIStroke", {Color = Color3.fromRGB(21, 22, 26)}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 3), PaddingRight = UDim.new(0, 3), PaddingTop = UDim.new(0, 3)}), List = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder})}, v2),
        Image = react.createElement("ImageLabel", {
            Image = "rbxassetid://116197358975616",
            ImageTransparency = 0.985,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 15, 1, 15),
        }),
        Ratio = react.createElement("UIAspectRatioConstraint"),
    })
    v7.Background = react.createElement("ImageLabel", {
        Image = "rbxassetid://116197358975616",
        ImageTransparency = 0.87,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(20, 21, 25),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(1000, 1000),
    })
    v5.Container = react.createElement("Frame", v6, v7)
    return react.createElement(TransparencyGroup, v4, v5)
end