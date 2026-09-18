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
--   File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Vow.VowItem
--                               Dumped in 0.00205 seconds
--                          Bytecode version 9  |  15 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_2:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_4:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_5:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities_2:WaitForChild("Color"))
local Lines_2 = v1.Parent:WaitForChild("Lines")
local Lines = require(Lines_2:WaitForChild("Lines"))
local Upgrade = v1.Parent:WaitForChild("Upgrade")
local VowProgress = require(Upgrade:WaitForChild("VowProgress"))
local Primitives = v1.Parent.Parent.Parent.Parent:WaitForChild("Primitives")
local Hitbox = require(Primitives:WaitForChild("Hitbox"))
return function(p1) -- Line: 56 -- upvalues: useMotion (val), useRem (val), useTextScale (val), useTheme (val), useAsyncEffect (val), Promise (val), react (val), Lines (val), Hitbox (val), Color (val), Number (val), VowProgress (val)
    local Enabled, u4, u8, v1, v2
    v1, u4 = useMotion(1.5)
    v2, u8 = useMotion(0)
    local v3 = useMotion(0)
    local v4 = useRem()
    local v5 = useTextScale()
    local v6 = useTheme()
    useAsyncEffect(function() -- Line: 66 -- upvalues: p1 (val), Promise (upval), u4 (val)
        if not p1.Enabled or p1.Blocked then
            return Promise.delay(0):andThen(function() -- Line: 68 -- upvalues: u4 (upval)
                u4:immediate(1.5)
            end)
        end
        return Promise.delay(p1.Position * 0.1):andThen(function() -- Line: 72 -- upvalues: u4 (upval)
            u4:spring(0.5)
        end)
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 78 -- upvalues: p1 (val), Promise (upval), u4 (val)
        if p1.Blocked then
            return Promise.delay(0):andThen(function() -- Line: 80 -- upvalues: u4 (upval)
                u4:spring(1.5)
            end)
        end
        u4:immediate(1.5)
        return Promise.delay(p1.Position * 0.1):andThen(function() -- Line: 86 -- upvalues: u4 (upval)
            u4:spring(0.5)
        end)
    end, {p1.Label})
    react.useEffect(function() -- Line: 91 -- upvalues: p1 (val), u4 (val)
        if p1.Blocked then
            u4:spring(1.5)
        end
    end, {p1.Blocked, p1.Label})
    local v7 = {
        BackgroundColor3 = v6.PageBackground,
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0, 0.228),
        Size = UDim2.new(1, 0, 0, v4(250)),
        LayoutOrder = p1.Position,
        ZIndex = 50 - p1.Position,
    }
    v7[react.Event.MouseEnter] = function() -- Line: 107 -- upvalues: u8 (val)
        u8:spring(10)
    end
    v7[react.Event.MouseLeave] = function() -- Line: 111 -- upvalues: u8 (val)
        u8:spring(0)
    end
    local v8 = {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.749})}
    local v9 = {IsTopLayer = p1.IsTopLayer, Position = p1.Position}
    local Label = p1.Label
    local v10 = tostring(p1.Enabled)
    v9.Rerenderer = Label .. v10 .. tostring(not p1.Blocked)
    v9.Blocked = p1.Blocked
    Enabled = p1.Enabled
    if Enabled then
        Enabled = not p1.Blocked
    end
    v9.Enabled = Enabled
    v8.Lines = react.createElement(Lines, v9)
    v9 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v2:map(function(p1) -- Line: 132
            local v1 = UDim2.fromScale(0.5, 0.5)
            return v1 + UDim2.fromOffset(0, -p1)
        end),
        Size = v3:map(function(p1) -- Line: 136
            local v1 = UDim2.fromScale(1.27, 1.27)
            return v1 + UDim2.fromOffset(p1, p1)
        end),
    }
    local v11 = {Hitbox = react.createElement(Hitbox, {
        Enabled = p1.Enabled,
        Clicked = function() -- Line: 142 -- upvalues: p1 (val), u8 (val)
            local v1 = p1.Clicked()
            if v1 then
                u8:spring(0, {impulse = 0.3, tension = 70, friction = 5})
            end
            return v1
        end,
    })}
    local v12 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v6.PageBackground,
        Position = v1:map(function(p1) -- Line: 161
            return UDim2.fromScale(0.5, p1)
        end),
        Size = UDim2.fromScale(0.782, 0.782),
    }
    local v13 = {Locked = react.createElement("Frame", {
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = p1.Locked,
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Locked = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://75539289741459",
        ImageTransparency = 0.2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = v6.PageBackground,
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})}), Background = react.createElement("ImageLabel", {
        Image = "rbxassetid://122861996981815",
        ImageTransparency = 0.95,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = v6.Primary,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.495, 0.5),
        Size = UDim2.fromScale(0.96, 0.96),
    })}
    local v14 = {
        Image = "rbxassetid://118601874567169",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 6,
        ImageColor3 = Color.Darken(v6.Bar, 0.2),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(443, 190, 443, 190),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.492, 0.956),
    }
    local v15 = v4(152)
    v14.Size = UDim2.fromOffset(v15, v4(47))
    v13.Border = react.createElement("ImageLabel", v14)
    v14 = {
        Image = "rbxassetid://92385662241240",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 7,
        ImageColor3 = Color.Darken(v6.Bar, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(443, 190, 443, 190),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.492, 0.956),
    }
    v15 = v4(152)
    v14.Size = UDim2.fromOffset(v15, v4(47))
    local v16 = {}
    local v17 = {
        TextTransparency = 0.21,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 7,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
    }
    local v18 = tostring(p1.Label)
    v17.Text = v18 .. " " .. Number.ConvertNumberToRoman(p1.Position)
    v17.TextColor3 = v6.Primary
    v17.TextSize = v5(15)
    v17.TextYAlignment = Enum.TextYAlignment.Bottom
    v17.AnchorPoint = Vector2.new(0.5, 0.5)
    v17.AutomaticSize = Enum.AutomaticSize.X
    v17.Position = UDim2.fromScale(0.505, 0.51)
    v17.Size = UDim2.fromScale(1.3, 0.362)
    v16.Label = react.createElement("TextLabel", v17)
    v13.Backplate = react.createElement("ImageLabel", v14, v16)
    v13.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v13.Description = react.createElement("TextLabel", {
        TextSize = 15,
        TextTransparency = 0.75,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = p1.Descriptions,
        TextColor3 = v6.Primary,
        TextYAlignment = Enum.TextYAlignment.Top,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0.489, 0.494),
        Size = UDim2.fromScale(0.663, 0.693),
    })
    v14 = {MaxProgress = 5}
    local Enabled_2 = p1.Enabled
    if Enabled_2 then
        Enabled_2 = not p1.Locked
    end
    v14.Enabled = Enabled_2
    local Label_2 = p1.Label
    local v19 = tostring(p1.Enabled)
    v14.Rerenderer = Label_2 .. v19 .. tostring(not p1.Locked)
    v14.Progress = p1.Level
    v13.Progress = react.createElement(VowProgress, v14)
    v13.Level = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 6,
        BackgroundColor3 = Color.Darken(v6.PageBackground, 0.8),
        Position = UDim2.fromScale(0.82, -0.0259),
        Size = UDim2.fromScale(0.213, 0.159),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Level = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.61,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/Guru.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = Number.ConvertNumberToRoman(p1.Position),
        TextColor3 = v6.Primary,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),
    }), Stroke = react.createElement("UIStroke", {Thickness = 4.1, Color = Color.Darken(v6.Primary, 0.2)})})
    v11.Card = react.createElement("Frame", v12, v13)
    v8.Clipping = react.createElement("Frame", v9, v11)
    return react.createElement("Frame", v7, v8)
end