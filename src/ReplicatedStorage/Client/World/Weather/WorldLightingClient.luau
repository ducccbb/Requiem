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
--           File: ReplicatedStorage.Client.World.Weather.WorldLightingClient
--                               Dumped in 0.00235 seconds
--                          Bytecode version 9  |  19 functions

local deepMerge
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Progression = script.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u59 = {}
local u60 = nil
local u61 = {}
local u62 = nil
local u63 = nil
local u64 = false
local function getInstanceFromKey(p1) -- Line: 78 -- upvalues: Lighting (val), Workspace (val)
    local Clouds
    if p1 == "Atmosphere" then
        local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
        if not WorldAtmosphere then
            WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
        end
        if not WorldAtmosphere then
            WorldAtmosphere = Instance.new("Atmosphere")
            WorldAtmosphere.Parent = Lighting
        end
        return WorldAtmosphere
    end
    if p1 == "ColorCorrection" then
        local WorldColorCorrection = Lighting:FindFirstChild("WorldColorCorrection")
        if not WorldColorCorrection then
            WorldColorCorrection = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
        end
        if not WorldColorCorrection then
            WorldColorCorrection = Instance.new("ColorCorrectionEffect")
            WorldColorCorrection.Parent = Lighting
        end
        return WorldColorCorrection
    end
    if p1 ~= "Clouds" then
        return Lighting
    end
    local Terrain = Workspace:WaitForChild("Terrain")
    Clouds = Terrain:FindFirstChildWhichIsA("Clouds")
    if not Clouds then
        Clouds = Instance.new("Clouds")
        Clouds.Parent = Workspace:WaitForChild("Terrain")
    end
    return Clouds
end
local function captureDefaultProperties() -- Line: 109 -- upvalues: Lighting (val), getInstanceFromKey (val)
    local v1 = {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        ExposureCompensation = Lighting.ExposureCompensation,
    }
    local Atmosphere = getInstanceFromKey("Atmosphere")
    if Atmosphere and Atmosphere:IsA("Atmosphere") then
        v1.Atmosphere = {
            Density = Atmosphere.Density,
            Offset = Atmosphere.Offset,
            Color = Atmosphere.Color,
            Decay = Atmosphere.Decay,
            Glare = Atmosphere.Glare,
            Haze = Atmosphere.Haze,
        }
    end
    local ColorCorrection = getInstanceFromKey("ColorCorrection")
    if ColorCorrection and ColorCorrection:IsA("ColorCorrectionEffect") then
        v1.ColorCorrection = {Brightness = ColorCorrection.Brightness, Contrast = ColorCorrection.Contrast, Saturation = ColorCorrection.Saturation, TintColor = ColorCorrection.TintColor}
    end
    local Clouds = getInstanceFromKey("Clouds")
    if Clouds and Clouds:IsA("Clouds") then
        v1.Clouds = {Cover = Clouds.Cover, Density = Clouds.Density, Color = Clouds.Color}
    end
    return v1
end
function deepMerge(p1, p2) -- Line: 163 -- upvalues: Table (val), deepMerge (val)
    local v1 = Table.copy(p1)
    for k, v in pairs(p2) do
        if type(v) ~= "table" then
            v1[k] = v
        elseif type(v1[k]) == "table" then
            v1[k] = deepMerge(v1[k], v)
        end
    end
    return v1
end
local function getMergedProperties() -- Line: 181 -- upvalues: u60 (ref), captureDefaultProperties (val), Table (val), u62 (ref), deepMerge (val), u59 (val)
    if not u60 then
        u60 = captureDefaultProperties()
    end
    local v1 = Table.copy(u60)
    if u62 then
        v1 = deepMerge(v1, u62)
    end
    local v2 = {}
    for k in pairs(u59) do
        table.insert(v2, k)
    end
    table.sort(v2, function(p1, p2) -- Line: 200
        local v1 = p2 < p1
        return v1
    end)
    for i, v in ipairs(v2) do
        v1 = deepMerge(v1, u59[v])
    end
    return v1
end
local function applyPropertyToInstance(p1, p2, p3) -- Line: 218 -- upvalues: u61 (val), TweenService (val)
    if next(p2) == nil then
        return
    end
    local v1 = u61[p1]
    if v1 then
        v1:Cancel()
        u61[p1] = nil
    end
    if not p3 then
        for k, v in pairs(p2) do
            p1[k] = v
        end
        return
    end
    local v2 = TweenService:Create(p1, p3, p2)
    v2:Play()
    u61[p1] = v2
end
local function applyProperties(p1, p2) -- Line: 248 -- upvalues: ClientAttributesHandler (val), applyPropertyToInstance (val), Lighting (val), getInstanceFromKey (val)
    local Atmosphere, Clouds, ColorCorrection, v1
    local FogVisibilityMultiplier = ClientAttributesHandler.getAttribute("FogVisibilityMultiplier")
    local v2 = {}
    if p1.Ambient ~= nil then
        v2.Ambient = p1.Ambient
    end
    if p1.Brightness ~= nil then
        v2.Brightness = p1.Brightness
    end
    if p1.ColorShift_Bottom ~= nil then
        v2.ColorShift_Bottom = p1.ColorShift_Bottom
    end
    if p1.ColorShift_Top ~= nil then
        v2.ColorShift_Top = p1.ColorShift_Top
    end
    if p1.EnvironmentDiffuseScale ~= nil then
        v2.EnvironmentDiffuseScale = p1.EnvironmentDiffuseScale
    end
    if p1.EnvironmentSpecularScale ~= nil then
        v2.EnvironmentSpecularScale = p1.EnvironmentSpecularScale
    end
    if p1.OutdoorAmbient ~= nil then
        v2.OutdoorAmbient = p1.OutdoorAmbient
    end
    if p1.ExposureCompensation ~= nil then
        v2.ExposureCompensation = p1.ExposureCompensation
    end
    applyPropertyToInstance(Lighting, v2, p2)
    if p1.Atmosphere then
        Atmosphere = getInstanceFromKey("Atmosphere")
        if Atmosphere and Atmosphere:IsA("Atmosphere") then
            v1 = {}
            if p1.Atmosphere.Density ~= nil then
                v1.Density = p1.Atmosphere.Density * FogVisibilityMultiplier
            end
            if p1.Atmosphere.Offset ~= nil then
                v1.Offset = p1.Atmosphere.Offset
            end
            if p1.Atmosphere.Color ~= nil then
                v1.Color = p1.Atmosphere.Color
            end
            if p1.Atmosphere.Decay ~= nil then
                v1.Decay = p1.Atmosphere.Decay
            end
            if p1.Atmosphere.Glare ~= nil then
                v1.Glare = p1.Atmosphere.Glare
            end
            if p1.Atmosphere.Haze ~= nil then
                v1.Haze = p1.Atmosphere.Haze
            end
            applyPropertyToInstance(Atmosphere, v1, p2)
        end
    end
    if p1.ColorCorrection then
        ColorCorrection = getInstanceFromKey("ColorCorrection")
        if ColorCorrection and ColorCorrection:IsA("ColorCorrectionEffect") then
            v1 = {}
            if p1.ColorCorrection.Brightness ~= nil then
                v1.Brightness = p1.ColorCorrection.Brightness
            end
            if p1.ColorCorrection.Contrast ~= nil then
                v1.Contrast = p1.ColorCorrection.Contrast
            end
            if p1.ColorCorrection.Saturation ~= nil then
                v1.Saturation = p1.ColorCorrection.Saturation
            end
            if p1.ColorCorrection.TintColor ~= nil then
                v1.TintColor = p1.ColorCorrection.TintColor
            end
            applyPropertyToInstance(ColorCorrection, v1, p2)
        end
    end
    if p1.Clouds then
        Clouds = getInstanceFromKey("Clouds")
        if Clouds and Clouds:IsA("Clouds") then
            v1 = {}
            if p1.Clouds.Cover ~= nil then
                v1.Cover = p1.Clouds.Cover
            end
            if p1.Clouds.Density ~= nil then
                v1.Density = p1.Clouds.Density
            end
            if p1.Clouds.Color ~= nil then
                v1.Color = p1.Clouds.Color
            end
            applyPropertyToInstance(Clouds, v1, p2)
        end
    end
end
local function updateWorldLightingProperties(p1, p2, p3) -- Line: 352 -- upvalues: u60 (ref), captureDefaultProperties (val), u59 (val), Table (val), getMergedProperties (val), applyProperties (val)
    if not u60 then
        u60 = captureDefaultProperties()
    end
    u59[p2] = Table.copy(p1)
    applyProperties(getMergedProperties(), p3)
    return function(p1) -- Line: 370 -- upvalues: u59 (upval), p2 (val), getMergedProperties (upval), applyProperties (upval), p3 (val)
        u59[p2] = nil
        local v1 = p1
        if not v1 then
            v1 = p3
        end
        applyProperties(getMergedProperties(), v1)
    end
end
local function readServerLightingFromAttributes() -- Line: 386 -- upvalues: Lighting (val), getInstanceFromKey (val)
    local v1, v2
    local v3 = {}
    local v4 = false
    local Attribute = Lighting:GetAttribute("World_Ambient")
    if Attribute ~= nil then
        v3.Ambient = Attribute
        v4 = true
    end
    local Attribute_2 = Lighting:GetAttribute("World_Brightness")
    if Attribute_2 ~= nil then
        v3.Brightness = Attribute_2
        v4 = true
    end
    local Attribute_3 = Lighting:GetAttribute("World_ColorShift_Bottom")
    if Attribute_3 ~= nil then
        v3.ColorShift_Bottom = Attribute_3
        v4 = true
    end
    local Attribute_4 = Lighting:GetAttribute("World_ColorShift_Top")
    if Attribute_4 ~= nil then
        v3.ColorShift_Top = Attribute_4
        v4 = true
    end
    local Attribute_5 = Lighting:GetAttribute("World_EnvironmentDiffuseScale")
    if Attribute_5 ~= nil then
        v3.EnvironmentDiffuseScale = Attribute_5
        v4 = true
    end
    local Attribute_6 = Lighting:GetAttribute("World_EnvironmentSpecularScale")
    if Attribute_6 ~= nil then
        v3.EnvironmentSpecularScale = Attribute_6
        v4 = true
    end
    local Attribute_7 = Lighting:GetAttribute("World_OutdoorAmbient")
    if Attribute_7 ~= nil then
        v3.OutdoorAmbient = Attribute_7
        v4 = true
    end
    local Attribute_8 = Lighting:GetAttribute("World_ExposureCompensation")
    if Attribute_8 ~= nil then
        v3.ExposureCompensation = Attribute_8
        v4 = true
    end
    local Atmosphere = getInstanceFromKey("Atmosphere")
    if Atmosphere and Atmosphere:IsA("Atmosphere") then
        local v5 = {}
        v1 = false
        local Attribute_9 = Atmosphere:GetAttribute("World_Atmosphere_Density")
        if Attribute_9 ~= nil then
            v5.Density = Attribute_9
            v1 = true
        end
        local Attribute_10 = Atmosphere:GetAttribute("World_Atmosphere_Offset")
        if Attribute_10 ~= nil then
            v5.Offset = Attribute_10
            v1 = true
        end
        local Attribute_11 = Atmosphere:GetAttribute("World_Atmosphere_Color")
        if Attribute_11 ~= nil then
            v5.Color = Attribute_11
            v1 = true
        end
        local Attribute_12 = Atmosphere:GetAttribute("World_Atmosphere_Decay")
        if Attribute_12 ~= nil then
            v5.Decay = Attribute_12
            v1 = true
        end
        local Attribute_13 = Atmosphere:GetAttribute("World_Atmosphere_Glare")
        if Attribute_13 ~= nil then
            v5.Glare = Attribute_13
            v1 = true
        end
        local Attribute_14 = Atmosphere:GetAttribute("World_Atmosphere_Haze")
        if Attribute_14 ~= nil then
            v5.Haze = Attribute_14
            v1 = true
        end
        if v1 then
            v3.Atmosphere = v5
            v4 = true
        end
    end
    local ColorCorrection = getInstanceFromKey("ColorCorrection")
    if ColorCorrection and ColorCorrection:IsA("ColorCorrectionEffect") then
        v1 = {}
        v2 = false
        local Attribute_15 = ColorCorrection:GetAttribute("World_ColorCorrection_Brightness")
        if Attribute_15 ~= nil then
            v1.Brightness = Attribute_15
            v2 = true
        end
        local Attribute_16 = ColorCorrection:GetAttribute("World_ColorCorrection_Contrast")
        if Attribute_16 ~= nil then
            v1.Contrast = Attribute_16
            v2 = true
        end
        local Attribute_17 = ColorCorrection:GetAttribute("World_ColorCorrection_Saturation")
        if Attribute_17 ~= nil then
            v1.Saturation = Attribute_17
            v2 = true
        end
        local Attribute_18 = ColorCorrection:GetAttribute("World_ColorCorrection_TintColor")
        if Attribute_18 ~= nil then
            v1.TintColor = Attribute_18
            v2 = true
        end
        if v2 then
            v3.ColorCorrection = v1
            v4 = true
        end
    end
    local Clouds = getInstanceFromKey("Clouds")
    if Clouds and Clouds:IsA("Clouds") then
        v2 = {}
        local v6 = false
        local Attribute_19 = Clouds:GetAttribute("World_Clouds_Cover")
        if Attribute_19 ~= nil then
            v2.Cover = Attribute_19
            v6 = true
        end
        local Attribute_20 = Clouds:GetAttribute("World_Clouds_Density")
        if Attribute_20 ~= nil then
            v2.Density = Attribute_20
            v6 = true
        end
        local Attribute_21 = Clouds:GetAttribute("World_Clouds_Color")
        if Attribute_21 ~= nil then
            v2.Color = Attribute_21
            v6 = true
        end
        if v6 then
            v3.Clouds = v2
            v4 = true
        end
    end
    if not v4 then
        return nil
    end
    return v3
end
local function refreshServerPropertiesFromAttributes() -- Line: 581 -- upvalues: u62 (ref), readServerLightingFromAttributes (val)
    u62 = readServerLightingFromAttributes()
end
refreshServerPropertiesFromAttributes()
;(function() -- Line: 623 -- upvalues: Lighting (val), refreshServerPropertiesFromAttributes (val), getInstanceFromKey (val)
    local AttributeChangedSignal_4
    local v1 = {
        "World_Ambient",
        "World_Brightness",
        "World_ColorShift_Bottom",
        "World_ColorShift_Top",
        "World_EnvironmentDiffuseScale",
        "World_EnvironmentSpecularScale",
        "World_OutdoorAmbient",
        "World_ExposureCompensation",
    }
    for i, v in ipairs(v1) do
        AttributeChangedSignal_4 = Lighting:GetAttributeChangedSignal(v)
        AttributeChangedSignal_4:Connect(function() -- Line: 635 -- upvalues: refreshServerPropertiesFromAttributes (upval)
            refreshServerPropertiesFromAttributes()
        end)
    end
    local Atmosphere = getInstanceFromKey("Atmosphere")
    if Atmosphere and Atmosphere:IsA("Atmosphere") then
        local AttributeChangedSignal
        local v2 = {
            "World_Atmosphere_Density",
            "World_Atmosphere_Offset",
            "World_Atmosphere_Color",
            "World_Atmosphere_Decay",
            "World_Atmosphere_Glare",
            "World_Atmosphere_Haze",
        }
        for i2, i3 in ipairs(v2) do
            AttributeChangedSignal = Atmosphere:GetAttributeChangedSignal(i3)
            AttributeChangedSignal:Connect(function() -- Line: 651 -- upvalues: refreshServerPropertiesFromAttributes (upval)
                refreshServerPropertiesFromAttributes()
            end)
        end
    end
    local ColorCorrection = getInstanceFromKey("ColorCorrection")
    if ColorCorrection and ColorCorrection:IsA("ColorCorrectionEffect") then
        local AttributeChangedSignal_2
        local v3 = {"World_ColorCorrection_Brightness", "World_ColorCorrection_Contrast", "World_ColorCorrection_Saturation", "World_ColorCorrection_TintColor"}
        for i4, j in ipairs(v3) do
            AttributeChangedSignal_2 = ColorCorrection:GetAttributeChangedSignal(j)
            AttributeChangedSignal_2:Connect(function() -- Line: 666 -- upvalues: refreshServerPropertiesFromAttributes (upval)
                refreshServerPropertiesFromAttributes()
            end)
        end
    end
    local Clouds = getInstanceFromKey("Clouds")
    if Clouds and Clouds:IsA("Clouds") then
        local AttributeChangedSignal_3
        local v4 = {"World_Clouds_Cover", "World_Clouds_Density", "World_Clouds_Color"}
        for i5, k in ipairs(v4) do
            AttributeChangedSignal_3 = Clouds:GetAttributeChangedSignal(k)
            AttributeChangedSignal_3:Connect(function() -- Line: 680 -- upvalues: refreshServerPropertiesFromAttributes (upval)
                refreshServerPropertiesFromAttributes()
            end)
        end
    end
end)()
return {
    updateWorldLightingProperties = updateWorldLightingProperties,
    setCustomLighting = function(p1, p2) -- Line: 592 -- upvalues: u63 (ref), updateWorldLightingProperties (val), u64 (ref)
        if u63 then
            u63(p2)
            u63 = nil
        end
        u63 = updateWorldLightingProperties(p1, 1000, p2)
        u64 = true
    end,
    restoreServerLighting = function(p1) -- Line: 607 -- upvalues: u63 (ref), u64 (ref)
        if u63 then
            u63(p1)
            u63 = nil
        end
        u64 = false
    end,
}