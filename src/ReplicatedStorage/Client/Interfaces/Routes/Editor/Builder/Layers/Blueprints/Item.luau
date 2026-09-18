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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Blueprints.Item
--                               Dumped in 0.00189 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Building = Types:WaitForChild("Building")
local Placeables = require(Building:WaitForChild("Placeables"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types_2 = Common_3:WaitForChild("Types")
require(Types_2:WaitForChild("Editor"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal_2 = Components_2:WaitForChild("Universal")
local ModelViewport = require(Universal_2:WaitForChild("ModelViewport"))
local Hooks = script.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSelection = require(Hooks:WaitForChild("useBuildSelection"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
return function(p1) -- Line: 37 -- upvalues: react (val), useRem (val), useBuildSelection (val), Placeables (val), Badge (val), Constants (val), ModelViewport (val)
    local u14, u5, v1, v2, v3, v4, v5, v6
    v1, u5 = react.useState(false)
    local v7 = useRem()
    local folder = p1.Item.folder
    if not folder then
        v5 = 0.322
    else
        v5 = 0.21
    end
    v6, u14 = useBuildSelection()
    local v8 = v6 == p1.Item.path
    local v9 = react.useMemo(function() -- Line: 46 -- upvalues: folder (val), Placeables (upval), p1 (val)
        if folder then
            return nil
        end
        local v1 = Placeables.getPlaceableSystemFromPath(p1.Item.path)
        if not v1 then
            return nil
        end
        return v1.getItemModel(p1.Item):Clone()
    end, {p1.Item, folder})
    local v10 = react.useMemo(function() -- Line: 64 -- upvalues: p1 (val)
        local Item = p1.Item
        if not Item or Item.folder then
            return nil
        end
        if Item.price then
            return Item.price
        end
        return nil
    end, {p1.Item, folder})
    local v11 = v10
    if v11 then
        local v12 = {Text = ("%*%*"):format(Constants.Currency.Symbol, v10), Color = Color3.fromRGB(63, 93, 35)}
        v2 = {}
        local v13 = UDim2.fromScale(1, 0)
        v3 = v7(5)
        v2.Position = v13 - UDim2.fromOffset(v3, -v7(5))
        v2.AnchorPoint = Vector2.new(1, 0)
        v12.Native = v2
        v11 = react.createElement(Badge, v12)
    end
    local createElement = react.createElement
    v2 = {BackgroundTransparency = 1, BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(255, 255, 255), LayoutOrder = p1.LayoutOrder}
    local v14 = {}
    v3 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", ZIndex = 10}
    v3[react.Event.MouseButton1Click] = function() -- Line: 97 -- upvalues: u14 (val), p1 (val)
        u14(p1.Item.path)
    end
    v3[react.Event.MouseEnter] = function() -- Line: 101 -- upvalues: u5 (val)
        u5(true)
    end
    v3[react.Event.MouseLeave] = function() -- Line: 105 -- upvalues: u5 (val)
        u5(false)
    end
    v14.Hitbox = react.createElement("TextButton", v3)
    v3 = {
        Image = "rbxassetid://18318517344",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(22, 22, 22),
        ScaleType = Enum.ScaleType.Tile,
        TileSize = UDim2.fromScale(0.25, 0.25),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 0.747),
    }
    local v15 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Ratio = react.createElement("UIAspectRatioConstraint", {AspectType = Enum.AspectType.ScaleWithParentSize})}
    local v16 = v9
    if v16 then
        v16 = react.createElement(ModelViewport, {
            Model = v9,
            Visible = not folder,
            Native = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Ambient = Color3.fromRGB(255, 255, 255),
                LightColor = Color3.fromRGB(172, 173, 182),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                LightDirection = Vector3.new(-10, 10, 10),
            },
        })
    end
    v15.Viewport = v16
    v14.Image = react.createElement("ImageLabel", v3, v15)
    v14.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v14.Folder = react.createElement("ImageLabel", {
        Image = "rbxassetid://13056279627",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.499, 0.373),
        Size = UDim2.fromScale(0.643, 0.48),
        Visible = folder,
    }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectType = Enum.AspectType.ScaleWithParentSize, DominantAxis = Enum.DominantAxis.Height})})
    v3 = {
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(22, 22, 23),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(0.999, v5),
    }
    v15 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Label = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Item.name,
        TextColor3 = Color3.fromRGB(176, 176, 176),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.04, 0.0857),
        Size = UDim2.fromOffset(143, 14),
    }), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})}
    v14.Body = react.createElement("Frame", v3, v15)
    v3 = {}
    if v8 then
        v15 = Color3.fromRGB(85, 170, 255)
    elseif not v1 then
        v15 = Color3.fromRGB(47, 50, 56)
    else
        v15 = Color3.fromRGB(120, 125, 135)
    end
    v3.Color = v15
    if v8 then
        v15 = 0.3
    elseif not v1 then
        v15 = 0.8
    else
        v15 = 0.6
    end
    v3.Transparency = v15
    if not v8 then
        v15 = 1
    else
        v15 = 2
    end
    v3.Thickness = v15
    v14.Stroke = react.createElement("UIStroke", v3)
    local createElement_2 = react.createElement
    v3 = {BorderSizePixel = 0, ZIndex = 4, AnchorPoint = Vector2.new(0.5, 1)}
    if not folder then
        v15 = Color3.fromRGB(204, 125, 165)
    else
        v15 = Color3.fromRGB(255, 196, 140)
        if not v15 then
            v15 = Color3.fromRGB(204, 125, 165)
        end
    end
    v3.BackgroundColor3 = v15
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    if not folder then
        v4 = 0.692
    else
        v4 = 0.79
    end
    v3.Position = UDim2.fromScale(0.5, v4)
    v3.Size = UDim2.fromScale(0.999, 0.00933)
    v14.Line = createElement_2("Frame", v3)
    return createElement("Frame", v2, v14, v11)
end