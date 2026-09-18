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
--           File: ReplicatedStorage.Common.World.LightingExportPropertyConfig
--                              Dumped in 0.000666 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local LightingFogBubbleConfig = require(script.Parent:WaitForChild("LightingFogBubbleConfig"))
local v2 = {}
local v3 = {Key = "Brightness", Label = "Brightness", Type = "number", NumberRange = NumberRange.new(0, 5)}
local v4 = {Key = "EnvironmentDiffuseScale", Label = "Environment Diffuse", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v5 = {Key = "EnvironmentSpecularScale", Label = "Environment Specular", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v6 = {Key = "ExposureCompensation", Label = "Exposure Compensation", Type = "number", NumberRange = NumberRange.new(-2, 2)}
v2[1] = {Key = "Ambient", Label = "Ambient", Type = "Color3"}
v2[2] = v3
v2[3] = {Key = "OutdoorAmbient", Label = "Outdoor Ambient", Type = "Color3"}
v2[4] = {Key = "ColorShift_Bottom", Label = "Color Shift Bottom", Type = "Color3"}
v2[5] = {Key = "ColorShift_Top", Label = "Color Shift Top", Type = "Color3"}
v2[6] = v4
v2[7] = v5
v2[8] = v6
local v7 = {}
v3 = {Key = "Brightness", Label = "Brightness", Type = "number", NumberRange = NumberRange.new(-1, 1)}
local v8 = {Key = "Contrast", Label = "Contrast", Type = "number", NumberRange = NumberRange.new(-1, 1)}
local v9 = {Key = "Saturation", Label = "Saturation", Type = "number", NumberRange = NumberRange.new(-1, 1)}
v7[1] = v3
v7[2] = v8
v7[3] = v9
v7[4] = {Key = "TintColor", Label = "Tint Color", Type = "Color3"}
v3 = {}
v8 = {Key = "Cover", Label = "Cover", Type = "number", NumberRange = NumberRange.new(0, 1)}
v9 = {Key = "Density", Label = "Density", Type = "number", NumberRange = NumberRange.new(0, 1)}
v3[1] = v8
v3[2] = v9
v3[3] = {Key = "Color", Label = "Color", Type = "Color3"}
v8 = {}
v9 = {Key = "StarCount", Label = "Star Count", Type = "number", NumberRange = NumberRange.new(0, 10000)}
local v10 = {Key = "SunAngularSize", Label = "Sun Angular Size", Type = "number", NumberRange = NumberRange.new(0, 360)}
v4 = {Key = "MoonAngularSize", Label = "Moon Angular Size", Type = "number", NumberRange = NumberRange.new(0, 360)}
v8[1] = v9
v8[2] = v10
v8[3] = v4
v8[4] = {Key = "SkyboxBk", Label = "Skybox Bk", Type = "string"}
v8[5] = {Key = "SkyboxDn", Label = "Skybox Dn", Type = "string"}
v8[6] = {Key = "SkyboxFt", Label = "Skybox Ft", Type = "string"}
v8[7] = {Key = "SkyboxLf", Label = "Skybox Lf", Type = "string"}
v8[8] = {Key = "SkyboxRt", Label = "Skybox Rt", Type = "string"}
v8[9] = {Key = "SkyboxUp", Label = "Skybox Up", Type = "string"}
v8[10] = {Key = "SunTextureId", Label = "Sun Texture Id", Type = "string"}
v8[11] = {Key = "MoonTextureId", Label = "Moon Texture Id", Type = "string"}
v9 = {}
v10 = {Label = "Fog Bubble", Type = "boolean", Key = LightingFogBubbleConfig.PROPERTY_ENABLED}
v4 = {Label = "Bubble Size", Type = "number", Key = LightingFogBubbleConfig.PROPERTY_SIZE, NumberRange = NumberRange.new(LightingFogBubbleConfig.SIZE_MIN, LightingFogBubbleConfig.SIZE_MAX)}
v5 = {Key = "Density", Label = "Density", Type = "number", NumberRange = NumberRange.new(0, 1)}
v6 = {Key = "Offset", Label = "Offset", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v11 = {Key = "Glare", Label = "Glare", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v12 = {Key = "Haze", Label = "Haze", Type = "number", NumberRange = NumberRange.new(0, 1)}
v9[1] = v10
v9[2] = v4
v9[3] = v5
v9[4] = v6
v9[5] = {Key = "Color", Label = "Color", Type = "Color3"}
v9[6] = {Key = "Decay", Label = "Decay", Type = "Color3"}
v9[7] = v11
v9[8] = v12
v10 = {}
v4 = {Key = "Intensity", Label = "Intensity", Type = "number", NumberRange = NumberRange.new(0, 1)}
v5 = {Key = "Spread", Label = "Spread", Type = "number", NumberRange = NumberRange.new(0, 1)}
v10[1] = v4
v10[2] = v5
v4 = {}
v5 = {Key = "FarIntensity", Label = "Far Intensity", Type = "number", NumberRange = NumberRange.new(0, 1)}
v6 = {Key = "FocusDistance", Label = "Focus Distance", Type = "number", NumberRange = NumberRange.new(0, 100)}
local v13 = {Key = "InFocusRadius", Label = "In Focus Radius", Type = "number", NumberRange = NumberRange.new(0, 100)}
local v14 = {Key = "NearIntensity", Label = "Near Intensity", Type = "number", NumberRange = NumberRange.new(0, 1)}
v4[1] = v5
v4[2] = v6
v4[3] = v13
v4[4] = v14
return {
    ParseConfig = {
        Instances = {
            {InstanceName = "Lighting", Properties = v2},
            {InstanceName = "ColorCorrectionEffect", Properties = v7},
            {InstanceName = "Clouds", Properties = v3},
            {InstanceName = "Sky", Properties = v8},
            {InstanceName = "Atmosphere", Properties = v9},
            {InstanceName = "SunRays", Properties = v10},
            {InstanceName = "DepthOfField", Properties = v4},
        },
    },
    LightingProperties = v2,
    ColorCorrectionProperties = v7,
    CloudsProperties = v3,
    SkyProperties = v8,
    AtmosphereProperties = v9,
    SunRaysProperties = v10,
    DepthOfFieldProperties = v4,
}