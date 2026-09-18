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
--                    File: ReplicatedStorage.Common.Utilities.Color
--                              Dumped in 0.000449 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
local v2 = Color3.fromRGB(35, 95, 173)
local v3 = Color3.fromRGB(173, 35, 35)
local v4 = Color3.fromRGB(202, 134, 24)
local v5 = Color3.fromRGB(255, 243, 7)
local v6 = Color3.fromRGB(69, 173, 35)
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v5
v1[5] = v6
v1[6] = Color3.fromRGB(166, 35, 173)
v5 = {}
function v5.fromHex(p1) -- Line: 17
    local v1, v2, v3
    v1, v2, v3 = string.match(p1, "^#?(%w%w)(%w%w)(%w%w)$")
    local v4 = tonumber(v1, 16)
    local v5 = tonumber(v2, 16)
    return Color3.fromRGB(v4, v5, (tonumber(v3, 16)))
end
function v5.toHex(p1) -- Line: 22
    return string.format("#%02X%02X%02X", p1.R * 255, p1.G * 255, p1.B * 255)
end
v5.palette = v1
function v5.darken(p1, p2, p3, p4) -- Line: 26
    local v1, v2, v3, v4
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    if p3 then
        v2 = math.clamp(v1.R * p2, p3 or 0, 1 - (p4 or 0))
        v3 = math.clamp(v1.G * p2, p3 or 0, 1 - (p4 or 0))
        v4 = v1.B * p2
        return Color3.new(v2, v3, (math.clamp(v4, p3 or 0, 1 - (p4 or 0))))
    end
    if not p4 then
        return Color3.new(v1.R * p2, v1.G * p2, v1.B * p2)
    end
    v2 = math.clamp(v1.R * p2, p3 or 0, 1 - (p4 or 0))
    v3 = math.clamp(v1.G * p2, p3 or 0, 1 - (p4 or 0))
    v4 = v1.B * p2
    return Color3.new(v2, v3, (math.clamp(v4, p3 or 0, 1 - (p4 or 0))))
end
return v5