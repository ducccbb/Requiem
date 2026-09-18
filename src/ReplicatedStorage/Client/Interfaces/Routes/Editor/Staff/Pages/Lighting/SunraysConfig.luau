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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.SunraysConfig
--                              Dumped in 0.000211 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local v2 = {}
local v3 = {Key = "Intensity", Label = "Intensity", Type = "number", NumberRange = NumberRange.new(0, 1)}
local v4 = {Key = "Spread", Label = "Spread", Type = "number", NumberRange = NumberRange.new(0, 1)}
v2[1] = v3
v2[2] = v4
return {
    Instances = {
        {
            InstanceName = "SunRays",
            GetInstance = function() -- Line: 54 -- upvalues: Lighting (val)
                local SunRays = Lighting:FindFirstChild("SunRays")
                if not SunRays then
                    SunRays = Lighting:FindFirstChildWhichIsA("SunRaysEffect")
                end
                return SunRays
            end,
            Properties = v2,
        },
    },
}