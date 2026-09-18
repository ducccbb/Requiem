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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.ColoringConfig
--                              Dumped in 0.000505 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
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
v8 = {}
local v10 = {
    InstanceName = "ColorCorrectionEffect",
    GetInstance = function() -- Line: 122 -- upvalues: Lighting (val)
        local WorldColorCorrection = Lighting:FindFirstChild("WorldColorCorrection")
        if not WorldColorCorrection then
            WorldColorCorrection = Lighting:FindFirstChild("ColorCorrection")
            if not WorldColorCorrection then
                WorldColorCorrection = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
            end
        end
        return WorldColorCorrection
    end,
    Properties = v7,
}
v8[1] = {InstanceName = "Lighting", Instance = Lighting, Properties = v2}
v8[2] = v10
v3.Instances = v8
return v3