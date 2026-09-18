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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.AtmosphereConfig
--                              Dumped in 0.000360 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local World = Common:WaitForChild("World")
local LightingFogBubbleConfig = require(World:WaitForChild("LightingFogBubbleConfig"))
local v2 = {}
local v3 = {Label = "Fog Bubble", Type = "boolean", Key = LightingFogBubbleConfig.PROPERTY_ENABLED}
local v4 = {Label = "Bubble Size", Type = "number", Key = LightingFogBubbleConfig.PROPERTY_SIZE, NumberRange = NumberRange.new(LightingFogBubbleConfig.SIZE_MIN, LightingFogBubbleConfig.SIZE_MAX)}
local v5 = {Key = "Glare", Label = "Glare", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v6 = {Key = "Haze", Label = "Haze", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v7 = {Key = "Density", Label = "Density", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v8 = {Key = "Offset", Label = "Offset", Type = "number", NumberRange = NumberRange.new(0, 1)}
v2[1] = v3
v2[2] = v4
v2[3] = {Key = "Color", Label = "Color", Type = "Color3"}
v2[4] = {Key = "Decay", Label = "Decay", Type = "Color3"}
v2[5] = v5
v2[6] = v6
v2[7] = v7
v2[8] = v8
return {
    Instances = {
        {
            InstanceName = "Atmosphere",
            GetInstance = function() -- Line: 61 -- upvalues: Lighting (val)
                local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
                if not WorldAtmosphere then
                    WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
                end
                return WorldAtmosphere
            end,
            Properties = v2,
        },
    },
}