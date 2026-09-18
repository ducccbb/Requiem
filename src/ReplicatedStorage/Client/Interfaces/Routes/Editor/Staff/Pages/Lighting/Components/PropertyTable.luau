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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.Components.PropertyTable
--                               Dumped in 0.00115 seconds
--                          Bytecode version 9  |  3 functions

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
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor = Components_2:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Text = require(Universal:WaitForChild("Text"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks = Interfaces_3:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_4:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local PropertyRow = require(v1.Parent:WaitForChild("PropertyRow"))
local LightingTableLayout = require(v1.Parent.Parent:WaitForChild("LightingTableLayout"))
local INSTANCE_WIDTH_REM = LightingTableLayout.INSTANCE_WIDTH_REM
local PROPERTY_WIDTH_REM = LightingTableLayout.PROPERTY_WIDTH_REM
local VALUE_WIDTH_REM = LightingTableLayout.VALUE_WIDTH_REM
local COLUMN_PADDING_REM = LightingTableLayout.COLUMN_PADDING_REM
local TABLE_WIDTH_REM = LightingTableLayout.TABLE_WIDTH_REM
local function TableHeaderRow(p1) -- Line: 69 -- upvalues: useOrder (val), useRem (val), INSTANCE_WIDTH_REM (val), PROPERTY_WIDTH_REM (val), VALUE_WIDTH_REM (val), COLUMN_PADDING_REM (val), react (val), Text (val)
    local v1 = useOrder()
    local v2 = useRem()
    local v3 = v2(INSTANCE_WIDTH_REM)
    local v4 = v2(PROPERTY_WIDTH_REM)
    local v5 = v2(VALUE_WIDTH_REM)
    local v6 = v2(COLUMN_PADDING_REM)
    local v7 = v2(6)
    local v8 = {BackgroundTransparency = 1}
    local v9 = v2(20)
    v8.Size = UDim2.fromOffset(v3 + v4 + v5 + v6 * 2 + v7 * 2, v9 + v7 * 2)
    v8.LayoutOrder = p1.LayoutOrder
    return react.createElement("Frame", v8, {Box = react.createElement("Frame", {BackgroundTransparency = 0.94, ClipsDescendants = false, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Size = UDim2.fromScale(1, 1)}, {
        Stroke = react.createElement("UIStroke", {Transparency = 0.8, Thickness = 1, Color = Color3.fromRGB(255, 255, 255)}),
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v7), PaddingBottom = UDim.new(0, v7), PaddingLeft = UDim.new(0, v7), PaddingRight = UDim.new(0, v7)}),
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v6),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
        }),
        InstanceHeader = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v3, v2(20)), LayoutOrder = v1()}, {Text = react.createElement(Text, {
            Text = "Instance",
            Bold = true,
            Native = {TextXAlignment = Enum.TextXAlignment.Right},
        })}),
        PropertyHeader = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v4, v2(20)), LayoutOrder = v1()}, {Text = react.createElement(Text, {
            Text = "Property",
            Bold = true,
            Native = {TextXAlignment = Enum.TextXAlignment.Right},
        })}),
        ValueHeader = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v5, v2(20)), LayoutOrder = v1()}, {Text = react.createElement(Text, {
            Text = "Value",
            Bold = true,
            Native = {TextXAlignment = Enum.TextXAlignment.Right},
        })}),
    })})
end
return react.memo(function(p1) -- Line: 155 -- upvalues: useOrder (val), useRem (val), TABLE_WIDTH_REM (val), react (val), PropertyRow (val), INSTANCE_WIDTH_REM (val), PROPERTY_WIDTH_REM (val), VALUE_WIDTH_REM (val), COLUMN_PADDING_REM (val), FillProps (val), TableHeaderRow (val)
    local Instance
    local v1 = useOrder()
    local v2 = useRem()
    local v3 = v2(TABLE_WIDTH_REM)
    local v4 = v1()
    local v5 = {}
    local v6 = p1
    for i, v in ipairs(p1.config.Instances) do
        Instance = v.Instance
        if not Instance then
            Instance = v.GetInstance
            if Instance then
                Instance = v.GetInstance()
            end
        end
        if Instance then
            for i2, i3 in ipairs(v.Properties) do
                table.insert(v5, react.createElement(PropertyRow, {
                    InstanceName = v.InstanceName,
                    Instance = Instance,
                    PropertyKey = i3.Key,
                    Label = i3.Label,
                    Type = i3.Type,
                    NumberRange = i3.NumberRange,
                    PresetKey = i3.PresetKey,
                    LayoutOrder = v1(),
                    InstanceWidthRem = INSTANCE_WIDTH_REM,
                    PropertyWidthRem = PROPERTY_WIDTH_REM,
                    ValueWidthRem = VALUE_WIDTH_REM,
                    ColumnPaddingRem = COLUMN_PADDING_REM,
                    OnPropertyChange = v6.OnPropertyChange,
                    UpdateLightingState = v6.UpdateLightingState,
                }))
            end
        end
    end
    local Native = v6.Native
    if not Native then
        Native = {}
    end
    local v7 = FillProps(Native, {BackgroundTransparency = 1, ClipsDescendants = false, Size = UDim2.fromOffset(v3, 0), AutomaticSize = Enum.AutomaticSize.Y})
    return react.createElement("Frame", v7, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v2(6)),
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }), Header = react.createElement(TableHeaderRow, {LayoutOrder = v4}), Rows = react.createElement(react.Fragment, {}, table.unpack(v5))})
end)