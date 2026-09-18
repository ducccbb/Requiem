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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.Lighting
--                               Dumped in 0.00240 seconds
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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks:WaitForChild("useEditorPages"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks_2 = Interfaces:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_2:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components = Interfaces_3:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_2 = Interfaces_4:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Dropdown = require(Universal_2:WaitForChild("Dropdown"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_3 = Interfaces_5:WaitForChild("Components")
local Editor_3 = Components_3:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Group = require(Universal_3:WaitForChild("Group"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_4 = Interfaces_6:WaitForChild("Components")
local Editor_4 = Components_4:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Text = require(Universal_4:WaitForChild("Text"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_8:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local AtmosphereConfig = require(v1.Parent:WaitForChild("AtmosphereConfig"))
local ColoringConfig = require(v1.Parent:WaitForChild("ColoringConfig"))
local DepthOfFieldConfig = require(v1.Parent:WaitForChild("DepthOfFieldConfig"))
local ExportCode = require(v1.Parent:WaitForChild("ExportCode"))
local LightingExportConfig = require(v1.Parent:WaitForChild("LightingExportConfig"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_9:WaitForChild("Common")
local World = Common_2:WaitForChild("World")
local LightingFogBubbleConfig = require(World:WaitForChild("LightingFogBubbleConfig"))
local LightingPresets = require(v1.Parent:WaitForChild("LightingPresets"))
local LightingTableLayout = require(v1.Parent:WaitForChild("LightingTableLayout"))
local Components_5 = v1.Parent:WaitForChild("Components")
local PropertyTable = require(Components_5:WaitForChild("PropertyTable"))
local SkyConfig = require(v1.Parent:WaitForChild("SkyConfig"))
local SunraysConfig = require(v1.Parent:WaitForChild("SunraysConfig"))
return function() -- Line: 49 -- upvalues: useOrder (val), useRem (val), LightingTableLayout (val), useEditorPages (val), react (val), LightingExportConfig (val), LightingFogBubbleConfig (val), ExportCode (val), Administration (val), LightingPresets (val), Container (val), Dropdown (val), Group (val), PropertyTable (val), SkyConfig (val), ColoringConfig (val), DepthOfFieldConfig (val), SunraysConfig (val), AtmosphereConfig (val), Text (val)
    local u16, u21, v1, v2
    local v3 = useOrder()
    local v4 = useRem()
    local v5 = v4(LightingTableLayout.TABLE_WIDTH_REM)
    local v6 = useEditorPages()
    v1, u16 = react.useState("")
    v2, u21 = react.useState(0)
    local u25 = react.useRef(nil)
    local u26 = LightingExportConfig
    local u30 = react.useRef({})
    local v7 = {}
    local u34 = react.useRef(v7)
    local v8 = {}
    react.useEffect(function() -- Line: 68 -- upvalues: LightingExportConfig (upval), LightingFogBubbleConfig (upval), u30 (val)
        local DEFAULT_ENABLED, Instance, InstanceName, Key, v1
        local v2 = {}
        for i, v in ipairs(LightingExportConfig.Instances) do
            Instance = v.Instance
            if not Instance then
                Instance = v.GetInstance
                if Instance then
                    Instance = v.GetInstance()
                end
            end
            if Instance then
                InstanceName = v.InstanceName
                v2[InstanceName] = {}
                for i2, i3 in ipairs(v.Properties) do
                    Key = i3.Key
                    if not (LightingFogBubbleConfig.isAttributeOnlyKey(Key)) then
                        DEFAULT_ENABLED = Instance[Key]
                    else
                        DEFAULT_ENABLED = Instance:GetAttribute(LightingFogBubbleConfig.getAttributeName(Key))
                        if i3.Type ~= "boolean" then
                            if i3.Type == "number" and typeof(DEFAULT_ENABLED) ~= "number" then
                                DEFAULT_ENABLED = LightingFogBubbleConfig.DEFAULT_SIZE
                            end
                        elseif typeof(DEFAULT_ENABLED) ~= "boolean" then
                            DEFAULT_ENABLED = LightingFogBubbleConfig.DEFAULT_ENABLED
                        end
                    end
                    if i3.Type ~= "Color3" then
                        if i3.Type == "string" then
                            if typeof(DEFAULT_ENABLED) == "string" then
                                v1 = DEFAULT_ENABLED
                            elseif DEFAULT_ENABLED == nil then
                                v1 = ""
                            else
                                v1 = tostring(DEFAULT_ENABLED)
                            end
                            v2[InstanceName][Key] = v1
                        elseif i3.Type ~= "boolean" then
                            v2[InstanceName][Key] = DEFAULT_ENABLED
                        else
                            if typeof(DEFAULT_ENABLED) ~= "boolean" then
                                v1 = false
                            else
                                v1 = DEFAULT_ENABLED
                            end
                            v2[InstanceName][Key] = v1
                        end
                    elseif typeof(DEFAULT_ENABLED) == "Color3" then
                        v2[InstanceName][Key] = {R = math.floor(DEFAULT_ENABLED.R * 255), G = math.floor(DEFAULT_ENABLED.G * 255), B = math.floor(DEFAULT_ENABLED.B * 255)}
                    end
                end
            end
        end
        u30.current = v2
    end, v8)
    local function refreshExportText() -- Line: 109 -- upvalues: u16 (val), ExportCode (upval), u26 (val), u30 (val)
        u16(ExportCode.buildExportText(u26, u30))
    end
    local function snapshotLightingState() -- Line: 113 -- upvalues: u30 (val)
        local v1
        local v2 = {}
        for k, v in pairs(u30.current) do
            v1 = {}
            for k2, i in pairs(v) do
                v1[k2] = i
            end
            v2[k] = v1
        end
        return v2
    end
    local function diffLightingState(p1, p2) -- Line: 127
        local v1, v2, v3, v4
        local v5 = {}
        local v6 = p1
        for k, v in pairs(p2) do
            v4 = v6[k]
            for k2, i in pairs(v) do
                if not v4 then
                    v1 = nil
                else
                    v1 = v4[k2]
                end
                if typeof(i) ~= "table" then
                    v2 = i ~= v1
                elseif typeof(v1) == "table" then
                    v3 = if i.R == v1.R then if i.G == v1.G then i.B ~= v1.B else true else true
                    v2 = v3
                end
                if v2 then
                    if not (v5[k]) then
                        v5[k] = {}
                    end
                    v5[k][k2] = i
                end
            end
        end
        return v5
    end
    local function applyLightingExportText(p1) -- Line: 153 -- upvalues: snapshotLightingState (val), ExportCode (upval), u26 (val), u30 (val), diffLightingState (val), Administration (upval), u34 (val), refreshExportText (val), u21 (val)
        ExportCode.applyExportText(u26, p1, u30)
        ExportCode.applyStateRefToInstances(u26, u30)
        local v1 = diffLightingState(snapshotLightingState(), u30.current)
        if next(v1) ~= nil then
            Administration.Lighting.post(v1)
            u34.current = {}
        end
        refreshExportText()
        u21(function(p1) -- Line: 166
            return p1 + 1
        end)
    end
    react.useEffect(refreshExportText, {})
    local function updateLightingState(p1, p2, p3) -- Line: 174 -- upvalues: u34 (val), u30 (val)
        if not (u34.current[p1]) then
            u34.current[p1] = {}
        end
        u34.current[p1][p2] = p3
        if not (u30.current[p1]) then
            u30.current[p1] = {}
        end
        u30.current[p1][p2] = p3
    end
    local function onPropertyChange() -- Line: 188 -- upvalues: refreshExportText (val), u25 (val), u34 (val), Administration (upval)
        refreshExportText()
        if u25.current then
            task.cancel(u25.current)
        end
        u25.current = task.delay(0.5, function() -- Line: 195 -- upvalues: u34 (upval), Administration (upval), u25 (upval)
            if next(u34.current) ~= nil then
                Administration.Lighting.post(u34.current)
                u34.current = {}
            end
            u25.current = nil
        end)
    end
    local v9 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v10 = {}
    local v11 = not (not v6.Lighting)
    v10.Visible = v11
    v9.Native = v10
    v10 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(20)),
    })}
    local v12 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(v5, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = v3()}
    local v13 = {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v4(20)),
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
        }),
        Presets = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v4(24)), LayoutOrder = v3()}, {Dropdown = react.createElement(Dropdown, {
            FillWidth = true,
            Options = LightingPresets.getPresetNames(),
            Default = LightingPresets.PLACEHOLDER_OPTION,
            Changed = function(p1) -- Line: 212 -- upvalues: LightingPresets (upval), applyLightingExportText (val)
                local v1 = LightingPresets.getExportCode(p1)
                if not v1 then
                    return
                end
                applyLightingExportText(v1)
            end,
            Native = {ZIndex = 5, Size = UDim2.fromScale(1, 1)},
        })}),
        Sky = react.createElement(Group, {
            Header = "Sky",
            ClipsDescendants = false,
            ContentWidthPx = v5,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Native = {ZIndex = 5},
        }, {Table = react.createElement(PropertyTable, {
            key = "sky-" .. v2,
            config = SkyConfig,
            OnPropertyChange = onPropertyChange,
            UpdateLightingState = updateLightingState,
            Native = {LayoutOrder = v3()},
        })}),
        Coloring = react.createElement(Group, {Header = "Coloring", ClipsDescendants = false, ContentWidthPx = v5, HorizontalAlignment = Enum.HorizontalAlignment.Left}, {Table = react.createElement(PropertyTable, {
            key = "coloring-" .. v2,
            config = ColoringConfig,
            OnPropertyChange = onPropertyChange,
            UpdateLightingState = updateLightingState,
            Native = {LayoutOrder = v3()},
        })}),
        Depth = react.createElement(Group, {Header = "Depth of Field", ClipsDescendants = false, ContentWidthPx = v5, HorizontalAlignment = Enum.HorizontalAlignment.Left}, {Table = react.createElement(PropertyTable, {
            key = "depth-" .. v2,
            config = DepthOfFieldConfig,
            OnPropertyChange = onPropertyChange,
            UpdateLightingState = updateLightingState,
            Native = {LayoutOrder = v3()},
        })}),
        Sunrays = react.createElement(Group, {Header = "Sunrays", ClipsDescendants = false, ContentWidthPx = v5, HorizontalAlignment = Enum.HorizontalAlignment.Left}, {Table = react.createElement(PropertyTable, {
            key = "sunrays-" .. v2,
            config = SunraysConfig,
            OnPropertyChange = onPropertyChange,
            UpdateLightingState = updateLightingState,
            Native = {LayoutOrder = v3()},
        })}),
        Atmosphere = react.createElement(Group, {Header = "Atmosphere", ClipsDescendants = false, ContentWidthPx = v5, HorizontalAlignment = Enum.HorizontalAlignment.Left}, {Table = react.createElement(PropertyTable, {
            key = "atmosphere-" .. v2,
            config = AtmosphereConfig,
            OnPropertyChange = onPropertyChange,
            UpdateLightingState = updateLightingState,
            Native = {LayoutOrder = v3()},
        })}),
    }
    local v14 = {BackgroundTransparency = 1, ClipsDescendants = true, Size = UDim2.new(1, 0, 0, v4(72)), LayoutOrder = v3()}
    local v15 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(4)),
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
    }), Breaker = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v4(5)), LayoutOrder = v3()}), Label = react.createElement(Text, {
        Text = "Export Code",
        Native = {LayoutOrder = v3()},
    })}
    local v16 = {
        LayoutOrder = v3(),
        Size = UDim2.new(1, 0, 0, v4(52)),
        BackgroundColor3 = Color3.fromRGB(24, 26, 31),
        BorderSizePixel = 0,
        Text = v1,
        TextColor3 = Color3.fromRGB(220, 220, 220),
        TextSize = v4(11),
        TextTransparency = 0.7,
        FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        ClearTextOnFocus = false,
        MultiLine = true,
        PlaceholderText = "Paste code or copy from above",
        PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
    }
    v16[react.Change.Text] = function(p1) -- Line: 389 -- upvalues: u16 (val)
        u16(p1.Text)
    end
    v16[react.Event.FocusLost] = function(p1) -- Line: 208 -- upvalues: applyLightingExportText (val)
        applyLightingExportText(p1.Text)
    end
    v15.TextBox = react.createElement("TextBox", v16, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v4(8)), PaddingRight = UDim.new(0, v4(8)), PaddingTop = UDim.new(0, v4(6)), PaddingBottom = UDim.new(0, v4(6))})})
    v13.ExportSection = react.createElement("Frame", v14, v15)
    v10.Column = react.createElement("Frame", v12, v13)
    return react.createElement(Container, v9, v10)
end