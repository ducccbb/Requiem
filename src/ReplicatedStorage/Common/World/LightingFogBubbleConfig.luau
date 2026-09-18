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
--             File: ReplicatedStorage.Common.World.LightingFogBubbleConfig
--                              Dumped in 0.000228 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {FogBubbleEnabled = true, FogBubbleSize = true}
return {
    PROPERTY_ENABLED = "FogBubbleEnabled",
    PROPERTY_SIZE = "FogBubbleSize",
    ATTRIBUTE_ENABLED = "World_Atmosphere_FogBubbleEnabled",
    ATTRIBUTE_SIZE = "World_Atmosphere_FogBubbleSize",
    DEFAULT_ENABLED = false,
    DEFAULT_SIZE = 10000,
    SIZE_MIN = 1,
    SIZE_MAX = 50000,
    ATTRIBUTE_ONLY_KEYS = u12,
    isAttributeOnlyKey = function(p1) -- Line: 59 -- upvalues: u12 (val)
        local v1 = u12[p1] == true
        return v1
    end,
    getAttributeName = function(p1) -- Line: 63
        if p1 == "FogBubbleEnabled" then
            return "World_Atmosphere_FogBubbleEnabled"
        end
        if p1 == "FogBubbleSize" then
            return "World_Atmosphere_FogBubbleSize"
        end
        return "World_Atmosphere_" .. p1
    end,
    scaleFromBubbleSize = function(p1) -- Line: 77
        local v1 = math.abs(p1)
        return (Vector3.new(-v1, v1, v1))
    end,
}