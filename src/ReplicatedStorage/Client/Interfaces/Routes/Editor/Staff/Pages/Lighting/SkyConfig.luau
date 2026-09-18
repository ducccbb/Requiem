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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.SkyConfig
--                              Dumped in 0.000351 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local v2 = {}
local v3 = {Key = "Cover", Label = "Cover", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v4 = {Key = "Density", Label = "Density", Type = "number", NumberRange = NumberRange.new(0, 1)}
v2[1] = v3
v2[2] = v4
v2[3] = {Key = "Color", Label = "Color", Type = "Color3"}
v3 = {}
v4 = {}
local v5 = {
    InstanceName = "Clouds",
    GetInstance = function() -- Line: 62 -- upvalues: Workspace (val)
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
    Properties = v2,
}
local v6 = {
    InstanceName = "Sky",
    GetInstance = function() -- Line: 73 -- upvalues: Lighting (val)
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
    Properties = {
        {Key = "Preset", Label = "Preset", Type = "Preset", PresetKey = "Skybox"},
    },
}
v4[1] = v5
v4[2] = v6
v3.Instances = v4
return v3