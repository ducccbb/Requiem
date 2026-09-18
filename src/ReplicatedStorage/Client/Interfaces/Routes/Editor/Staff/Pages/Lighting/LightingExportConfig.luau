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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.LightingExportConfig
--                              Dumped in 0.000566 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local World = Common:WaitForChild("World")
local LightingExportPropertyConfig = require(World:WaitForChild("LightingExportPropertyConfig"))
local v2 = {}
local v3 = {}
local v4 = {InstanceName = "Lighting", Instance = Lighting, Properties = LightingExportPropertyConfig.LightingProperties}
local v5 = {
    InstanceName = "ColorCorrectionEffect",
    GetInstance = function() -- Line: 40 -- upvalues: Lighting (val)
        local WorldColorCorrection = Lighting:FindFirstChild("WorldColorCorrection")
        if not WorldColorCorrection then
            WorldColorCorrection = Lighting:FindFirstChild("ColorCorrection")
            if not WorldColorCorrection then
                WorldColorCorrection = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
            end
        end
        return WorldColorCorrection
    end,
    Properties = LightingExportPropertyConfig.ColorCorrectionProperties,
}
local v6 = {
    InstanceName = "Clouds",
    GetInstance = function() -- Line: 49 -- upvalues: Workspace (val)
        local Terrain = Workspace:FindFirstChild("Terrain")
        if not Terrain then
            return nil
        end
        local Clouds = Terrain:FindFirstChildWhichIsA("Clouds")
        if not Clouds then
            Clouds = Terrain:FindFirstChild("Clouds")
        end
        return Clouds
    end,
    Properties = LightingExportPropertyConfig.CloudsProperties,
}
local v7 = {
    InstanceName = "Sky",
    GetInstance = function() -- Line: 60 -- upvalues: Lighting (val)
        local Sky = Lighting:FindFirstChild("Sky")
        if not Sky then
            Sky = Lighting:FindFirstChildWhichIsA("Sky")
        end
        if not Sky then
            Sky = Instance.new("Sky")
            Sky.Parent = Lighting
        end
        return Sky
    end,
    Properties = LightingExportPropertyConfig.SkyProperties,
}
local v8 = {
    InstanceName = "Atmosphere",
    GetInstance = function() -- Line: 72 -- upvalues: Lighting (val)
        local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
        if not WorldAtmosphere then
            WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
        end
        return WorldAtmosphere
    end,
    Properties = LightingExportPropertyConfig.AtmosphereProperties,
}
local v9 = {
    InstanceName = "SunRays",
    GetInstance = function() -- Line: 79 -- upvalues: Lighting (val)
        local SunRays = Lighting:FindFirstChild("SunRays")
        if not SunRays then
            SunRays = Lighting:FindFirstChildWhichIsA("SunRaysEffect")
        end
        return SunRays
    end,
    Properties = LightingExportPropertyConfig.SunRaysProperties,
}
local v10 = {
    InstanceName = "DepthOfField",
    GetInstance = function() -- Line: 86 -- upvalues: Lighting (val)
        return Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect")
    end,
    Properties = LightingExportPropertyConfig.DepthOfFieldProperties,
}
v3[1] = v4
v3[2] = v5
v3[3] = v6
v3[4] = v7
v3[5] = v8
v3[6] = v9
v3[7] = v10
v2.Instances = v3
return v2