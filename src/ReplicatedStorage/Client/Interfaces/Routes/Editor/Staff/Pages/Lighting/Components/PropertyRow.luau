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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.Components.PropertyRow
--                               Dumped in 0.00297 seconds
--                          Bytecode version 9  |  14 functions

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
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Dropdown = require(Universal_2:WaitForChild("Dropdown"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_3 = Components_3:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Number = require(Universal_3:WaitForChild("Number"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_4 = Components_4:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Text = require(Universal_4:WaitForChild("Text"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_6:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_8:WaitForChild("Common")
local World = Common:WaitForChild("World")
local LightingFogBubbleConfig = require(World:WaitForChild("LightingFogBubbleConfig"))
local LightingTableLayout = require(v1.Parent.Parent:WaitForChild("LightingTableLayout"))
local SkyboxPresets = require(v1.Parent.Parent:WaitForChild("SkyboxPresets"))
local u235 = NumberRange.new(0, 255)
local u236 = {R = 0, G = 0, B = 0}
local function color3ToRgb(p1) -- Line: 64
    return {R = math.round(p1.R * 255), G = math.round(p1.G * 255), B = math.round(p1.B * 255)}
end
return react.memo(function(p1) -- Line: 72 -- upvalues: useOrder (val), useRem (val), LightingFogBubbleConfig (val), color3ToRgb (val), u236 (val), SkyboxPresets (val), react (val), LightingTableLayout (val), Text (val), Checkbox (val), Dropdown (val), Number (val), u235 (val)
    local B, DEFAULT_ENABLED, DEFAULT_SIZE, G, R, u102, u112, u120, u126, v1, v2, v3, v4, v5, v6, v7
    local v8 = useOrder()
    local v9 = useRem()
    local Instance = p1.Instance
    local PropertyKey = p1.PropertyKey
    local Type = p1.Type
    local NumberRange = p1.NumberRange
    if not NumberRange then
        NumberRange = NumberRange.new(0, 1)
    end
    local function readAttributeOrProperty(p1) -- Line: 81 -- upvalues: LightingFogBubbleConfig (upval), Instance (val)
        if LightingFogBubbleConfig.isAttributeOnlyKey(p1) then
            return Instance:GetAttribute(LightingFogBubbleConfig.getAttributeName(p1))
        end
        return Instance[p1]
    end
    if Type == "Preset" then
        v7 = nil
    else
        v7 = readAttributeOrProperty(PropertyKey)
    end
    if Type ~= "number" then
        if Type ~= "number" then
            DEFAULT_SIZE = 0
        elseif PropertyKey == LightingFogBubbleConfig.PROPERTY_SIZE then
            DEFAULT_SIZE = LightingFogBubbleConfig.DEFAULT_SIZE
        end
    elseif typeof(v7) == "number" then
        DEFAULT_SIZE = v7
    end
    if Type ~= "boolean" then
        DEFAULT_ENABLED = if Type == "boolean" then LightingFogBubbleConfig.DEFAULT_ENABLED else false
    elseif typeof(v7) == "boolean" then
        DEFAULT_ENABLED = v7
    end
    if Type ~= "Color3" then
        v1 = u236
    elseif typeof(v7) == "Color3" then
        v1 = color3ToRgb(v7)
    end
    if Type ~= "Preset" then
        v2 = SkyboxPresets.getPresetNames()[1] or "Default"
    elseif p1.PresetKey == "Skybox" and Instance then
        v2 = SkyboxPresets.getMatchingPresetName(Instance)
    end
    v3, u102 = react.useState(DEFAULT_SIZE)
    v4, u112 = react.useState(DEFAULT_ENABLED)
    v5, u120 = react.useState(v1)
    v6, u126 = react.useState(v2)
    react.useEffect(function() -- Line: 104 -- upvalues: Type (val), readAttributeOrProperty (val), PropertyKey (val), u102 (val), u112 (val), LightingFogBubbleConfig (upval), color3ToRgb (upval), u236 (upval), u120 (val)
        if Type == "number" then
            local v1 = readAttributeOrProperty(PropertyKey)
            if Type == "number" then
                local v2
                if typeof(v1) ~= "number" then
                    v2 = 0
                else
                    v2 = v1
                end
                u102(v2)
                return
            end
            if Type == "boolean" then
                local DEFAULT_ENABLED
                if typeof(v1) ~= "boolean" then
                    DEFAULT_ENABLED = LightingFogBubbleConfig.DEFAULT_ENABLED
                else
                    DEFAULT_ENABLED = v1
                end
                u112(DEFAULT_ENABLED)
                return
            end
            if Type == "Color3" then
                local u34
                if typeof(v1) ~= "Color3" then
                    u34 = u236
                else
                    u34 = color3ToRgb(v1)
                end
                u120(function(p1) -- Line: 117 -- upvalues: u34 (val)
                    if p1.R ~= u34.R or p1.G ~= u34.G then
                        return u34
                    end
                    if p1.B == u34.B then
                        return p1
                    end
                    return u34
                end)
            end
            return
        elseif Type ~= "Color3" and Type ~= "boolean" then
            return
        end
    end, {Instance, PropertyKey, Type})
    local function writeBoolean(a1) -- Line: 128 -- upvalues: u112 (val), p1 (val), PropertyKey (val)
        u112(a1)
        if p1.UpdateLightingState then
            p1.UpdateLightingState(p1.InstanceName, PropertyKey, a1)
        end
        if p1.OnPropertyChange then
            p1.OnPropertyChange()
        end
    end
    local function writeNumber(a1) -- Line: 138 -- upvalues: u102 (val), p1 (val), PropertyKey (val)
        u102(a1)
        if p1.UpdateLightingState then
            p1.UpdateLightingState(p1.InstanceName, PropertyKey, a1)
        end
        if p1.OnPropertyChange then
            p1.OnPropertyChange()
        end
    end
    local function writeRgb(a1) -- Line: 149 -- upvalues: u120 (val), p1 (val), PropertyKey (val)
        u120(a1)
        if p1.UpdateLightingState then
            p1.UpdateLightingState(p1.InstanceName, PropertyKey, a1)
        end
        if p1.OnPropertyChange then
            p1.OnPropertyChange()
        end
    end
    local LayoutOrder = p1.LayoutOrder
    if not LayoutOrder then
        LayoutOrder = v8()
    end
    local v10 = p1.PropertyWidthRem or 160
    local v11 = p1.ValueWidthRem or 280
    local v12 = p1.ColumnPaddingRem or 12
    local v13 = v9(p1.InstanceWidthRem or 72)
    local v14 = v9(v10)
    local v15 = v9(v11)
    local v16 = v9(v12)
    local v17 = v9(LightingTableLayout.ROW_PADDING_REM)
    local function roundForDisplay(p1) -- Line: 175
        return math.floor(p1 * 1000 + 0.5) / 1000
    end
    if Type ~= "Color3" then
        R = 0
    else
        R = v5.R
    end
    if Type ~= "Color3" then
        G = 0
    else
        G = v5.G
    end
    if Type ~= "Color3" then
        B = 0
    else
        B = v5.B
    end
    local createElement = react.createElement
    local v18 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(v13 + v14 + v15 + v16 * 2 + v17 * 2, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = LayoutOrder}
    local v19 = {}
    local createElement_2 = react.createElement
    local v20 = {BackgroundTransparency = 0.96, ClipsDescendants = false, BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    local v21 = UDim2.fromScale(1, 0)
    v20.Size = v21 + UDim2.fromOffset(0, 0)
    v20.AutomaticSize = Enum.AutomaticSize.Y
    local v22 = {
        Stroke = react.createElement("UIStroke", {Transparency = 0.85, Thickness = 1, Color = Color3.fromRGB(255, 255, 255)}),
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v17), PaddingBottom = UDim.new(0, v17), PaddingLeft = UDim.new(0, v17), PaddingRight = UDim.new(0, v17)}),
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v16),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
        }),
        InstanceCell = react.createElement("Frame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.fromOffset(v13, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = v8(),
        }, {Text = react.createElement(Text, {
            Text = p1.InstanceName,
            Native = {TextXAlignment = Enum.TextXAlignment.Right, TextTruncate = Enum.TextTruncate.AtEnd},
        })}),
    }
    local v23 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromOffset(v14, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = v8(),
    }
    local v24 = {}
    local v25 = {Text = p1.Label}
    local v26 = {TextXAlignment = Enum.TextXAlignment.Right, TextTruncate = Enum.TextTruncate.AtEnd}
    v25.Native = v26
    v24.Text = react.createElement(Text, v25)
    v22.PropertyCell = react.createElement("Frame", v23, v24)
    local createElement_3 = react.createElement
    v23 = {
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        Size = UDim2.fromOffset(v15, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = v8(),
    }
    if Type == "boolean" then
        v24 = {Padding = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v17 + 10)}), Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
        }), Checkbox = react.createElement(Checkbox, {
            Default = v4,
            Toggled = writeBoolean,
            Native = {LayoutOrder = v8()},
        })}
    elseif Type ~= "Preset" then
        if Type ~= "number" then
            v24 = {
                Padding = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v17 + 10)}),
                Layout = react.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, v9(4)),
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                }),
                R = react.createElement(Number, {
                    Width = 44,
                    Arrows = false,
                    Default = R,
                    Update = function(p1) -- Line: 346 -- upvalues: writeRgb (val), G (val), B (val)
                        writeRgb({R = p1, G = G, B = B})
                    end,
                    Range = u235,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Native = {LayoutOrder = v8()},
                }),
                G = react.createElement(Number, {
                    Width = 44,
                    Arrows = false,
                    Default = G,
                    Update = function(p1) -- Line: 357 -- upvalues: writeRgb (val), R (val), B (val)
                        writeRgb({R = R, G = p1, B = B})
                    end,
                    Range = u235,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Native = {LayoutOrder = v8()},
                }),
                B = react.createElement(Number, {
                    Width = 44,
                    Arrows = false,
                    Default = B,
                    Update = function(p1) -- Line: 368 -- upvalues: writeRgb (val), R (val), G (val)
                        writeRgb({R = R, G = G, B = p1})
                    end,
                    Range = u235,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Native = {LayoutOrder = v8()},
                }),
            }
        else
            v24 = {Padding = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v17 + 10)}), Layout = react.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0),
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
            })}
            v25 = {
                Width = 56,
                Increment = 0.01,
                Arrows = false,
                Default = roundForDisplay(v3),
                Update = writeNumber,
                Range = NumberRange,
            }
            v26 = NumberRange.Min < 0
            v25.Negatives = v26
            v25.TextXAlignment = Enum.TextXAlignment.Right
            v25.Native = {LayoutOrder = v8()}
            v24.Input = react.createElement(Number, v25)
            if not v24 then
                v24 = {
                    Padding = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v17 + 10)}),
                    Layout = react.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, v9(4)),
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    }),
                    R = react.createElement(Number, {
                        Width = 44,
                        Arrows = false,
                        Default = R,
                        Update = function(p1) -- Line: 346 -- upvalues: writeRgb (val), G (val), B (val)
                            writeRgb({R = p1, G = G, B = B})
                        end,
                        Range = u235,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Native = {LayoutOrder = v8()},
                    }),
                    G = react.createElement(Number, {
                        Width = 44,
                        Arrows = false,
                        Default = G,
                        Update = function(p1) -- Line: 357 -- upvalues: writeRgb (val), R (val), B (val)
                            writeRgb({R = R, G = p1, B = B})
                        end,
                        Range = u235,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Native = {LayoutOrder = v8()},
                    }),
                    B = react.createElement(Number, {
                        Width = 44,
                        Arrows = false,
                        Default = B,
                        Update = function(p1) -- Line: 368 -- upvalues: writeRgb (val), R (val), G (val)
                            writeRgb({R = R, G = G, B = p1})
                        end,
                        Range = u235,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Native = {LayoutOrder = v8()},
                    }),
                }
            end
        end
    elseif p1.PresetKey == "Skybox" then
        v24 = {Padding = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v17 + 10)}), Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
        }), Dropdown = react.createElement(Dropdown, {
            Width = 120,
            Options = SkyboxPresets.getPresetNames(),
            Default = v6,
            Changed = function(a1) -- Line: 292 -- upvalues: u126 (val), p1 (val), SkyboxPresets (upval)
                u126(a1)
                if p1.UpdateLightingState and a1 ~= "Custom" then
                    local v1 = SkyboxPresets.getPreset(a1)
                    if v1 then
                        for k, v in pairs(v1) do
                            if v then
                                p1.UpdateLightingState(p1.InstanceName, k, v)
                            end
                        end
                    end
                end
                if p1.OnPropertyChange then
                    p1.OnPropertyChange()
                end
            end,
            Native = {ZIndex = 5, LayoutOrder = v8()},
        })}
    end
    v22.ValueCell = createElement_3("Frame", v23, v24)
    v19.Box = createElement_2("Frame", v20, v22)
    return createElement("Frame", v18, v19)
end)