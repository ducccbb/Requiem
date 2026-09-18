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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.DepthOfFieldConfig
--                              Dumped in 0.000237 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local v2 = {}
local v3 = {Key = "FarIntensity", Label = "Far Intensity", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v4 = {Key = "FocusDistance", Label = "Focus Distance", Type = "number", NumberRange = NumberRange.new(0, 1000)}
local v5 = {Key = "InFocusRadius", Label = "In Focus Radius", Type = "number", NumberRange = NumberRange.new(0, 100)}
local v6 = {Key = "NearIntensity", Label = "Near Intensity", Type = "number", NumberRange = NumberRange.new(0, 1)}
v2[1] = v3
v2[2] = v4
v2[3] = v5
v2[4] = v6
return {
    Instances = {
        {
            InstanceName = "DepthOfField",
            GetInstance = function() -- Line: 69 -- upvalues: Lighting (val)
                return Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect")
            end,
            Properties = v2,
        },
    },
}