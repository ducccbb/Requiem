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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Profile.Subpages.OutfitSubslotPicker
--                               Dumped in 0.00167 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Profile"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local CharacterViewport = require(Universal:WaitForChild("CharacterViewport"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Label = require(Primitives:WaitForChild("Label"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_4:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_5:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local u173 = {"Default", "Civilian", "Formal"}
local function getColumnGridCellSize(p1, p2, p3, p4) -- Line: 35
    if p2 <= 0 then
        return UDim2.fromOffset(120, p3)
    end
    local v1 = math.floor((p2 - p4 * (p1 - 1)) / p1)
    local v2 = math.max(1, v1)
    return UDim2.fromOffset(v2, p3)
end
local function toCustomId(p1) -- Line: 66
    if p1 == "" then
        return nil
    end
    return p1
end
local function toViewportOutfit(p1) -- Line: 74 -- upvalues: toCustomId (val)
    return {
        Shirt = {Category = p1.shirtCategory, Name = p1.shirtName, Custom = toCustomId(p1.shirtCustom)},
        Pants = {Category = p1.pantsCategory, Name = p1.pantsName, Custom = toCustomId(p1.pantsCustom)},
    }
end
local function OutfitSubslotTile(p1) -- Line: 89 -- upvalues: useRem (val), useTextScale (val), useTheme (val), react (val), CharacterViewport (val), toViewportOutfit (val), Label (val)
    local Primary, SemiBold, v1, v2
    local v3 = useRem()
    local v4 = useTextScale()
    local v5 = useTheme()
    local v6 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), LayoutOrder = p1.LayoutOrder}
    local v7 = {}
    local v8 = {BorderSizePixel = 0, ClipsDescendants = true, BackgroundColor3 = v5.Input.Background, Size = UDim2.fromScale(1, 1)}
    local v9 = {}
    local v10 = {CornerRadius = UDim.new(0, v3(10))}
    v9.Corner = react.createElement("UICorner", v10)
    if not p1.Selected then
        v1 = nil
    else
        v10 = {BorderSizePixel = 0, ZIndex = 0, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Size = UDim2.fromScale(1, 1)}
        local v11 = {}
        local v12 = {Rotation = 90}
        local v13 = {}
        local v14 = NumberSequenceKeypoint.new(0, 1)
        local v15 = NumberSequenceKeypoint.new(0.4, 0.99)
        local v16 = NumberSequenceKeypoint.new(0.75, 0.97)
        v13[1] = v14
        v13[2] = v15
        v13[3] = v16
        v13[4] = NumberSequenceKeypoint.new(1, 0.94)
        v12.Transparency = NumberSequence.new(v13)
        v11.Gradient = react.createElement("UIGradient", v12)
        v1 = react.createElement("Frame", v10, v11)
    end
    v9.Glow = v1
    if not p1.Enabled then
        v1 = nil
    else
        v1 = react.createElement(CharacterViewport, {
            Enabled = true,
            Outfit = toViewportOutfit(p1.Outfit),
            Native = {ZIndex = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.42), Size = UDim2.new(1, 0, 1, -v3(28))},
        })
    end
    v9.Viewport = v1
    v10 = {TextScaled = false, ZIndex = 2, Text = p1.Name, TextSize = v4(11)}
    if not p1.Selected then
        Primary = v5.Text.Secondary
    else
        Primary = v5.Text.Primary
    end
    v10.TextColor3 = Primary
    v10.TextXAlignment = Enum.TextXAlignment.Center
    v10.AnchorPoint = Vector2.new(0.5, 1)
    v10.Position = UDim2.new(0.5, 0, 1, -v3(8))
    local v17 = -v3(16)
    v10.Size = UDim2.new(1, v17, 0, v4(14))
    if not p1.Selected then
        SemiBold = Enum.FontWeight.Medium
    else
        SemiBold = Enum.FontWeight.SemiBold
    end
    v10.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", SemiBold, Enum.FontStyle.Normal)
    v9.Label = react.createElement(Label, v10)
    v10 = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 3,
    }
    v10[react.Event.MouseButton1Click] = p1.OnSelect
    v9.Button = react.createElement("TextButton", v10)
    v7.Shell = react.createElement("Frame", v8, v9)
    if not p1.Selected then
        v2 = nil
    else
        v2 = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, v3(1)),
            BackgroundColor3 = v5.Text.Primary,
        })
    end
    v7.SelectionBar = v2
    return react.createElement("Frame", v6, v7)
end
return function(p1) -- Line: 198 -- upvalues: useRem (val), useTheme (val), react (val), getColumnGridCellSize (val), u173 (val), OutfitSubslotTile (val)
    local u168, u169, v1, v2, v3
    local v4 = useRem()
    local v5 = useTheme()
    u168, u169 = react.useState(0)
    local v6 = v4(12)
    local v7 = v4(196)
    local v8 = getColumnGridCellSize(3, u168, v7, v6)
    local v9 = {}
    local u158 = p1
    for i, v in ipairs(u173) do
        v1 = u158.Subslots[v]
        if v1 then
            v2 = {LayoutOrder = i, Name = v, Outfit = v1}
            v3 = u158.ActiveSubslot == v
            v2.Selected = v3
            v2.Enabled = u158.Enabled
            function v2.OnSelect() -- Line: 216 -- upvalues: u158 (val), v (val)
                u158.OnSelect(v)
            end
            v9[v] = react.createElement(OutfitSubslotTile, v2)
        end
    end
    local v10 = {
        BorderSizePixel = 0,
        BackgroundColor3 = v5.Container.Background,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = u158.LayoutOrder,
    }
    local v11 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4(10))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v5.Container.Stroke}), Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v4(18)), PaddingBottom = UDim.new(0, v4(18)), PaddingLeft = UDim.new(0, v4(18)), PaddingRight = UDim.new(0, v4(18))}), Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}
    local createElement_3 = react.createElement
    local v12 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v7), LayoutOrder = 0}
    v12[react.Change.AbsoluteSize] = function(p1) -- Line: 258 -- upvalues: u168 (val), u169 (val)
        local X = p1.AbsoluteSize.X
        if X ~= u168 then
            u169(X)
        end
    end
    v11.Grid = createElement_3("Frame", v12, {Layout = react.createElement("UIGridLayout", {
        FillDirectionMaxCells = 3,
        CellPadding = UDim2.fromOffset(v6, v6),
        CellSize = v8,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })}, v9)
    return react.createElement("Frame", v10, v11)
end