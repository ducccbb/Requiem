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
--         File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Color
--                               Dumped in 0.00163 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("react"))
function getLuminance(p1) -- Line: 54
    local v1
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    return v1.R * 0.299 + v1.G * 0.587 + v1.B * 0.114
end
local v2 = {
    Darken = function(p1, p2, p3, p4) -- Line: 14
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
    end,
    Desaturate = function(p1, p2) -- Line: 40
        local v1, v2, v3, v4
        if typeof(p1) ~= "table" then
            v1 = p1
        else
            v1 = p1:getValue()
            if not v1 then
                v1 = p1
            end
        end
        v2, v3, v4 = v1:ToHSV()
        return Color3.fromHSV(v2, v3 * p2, v4)
    end,
}
function v2.Classify(p1) -- Line: 77
    local v1 = {}
    local v2 = {name = "red", color = Color3.fromRGB(255, 0, 0)}
    local v3 = {name = "yellow", color = Color3.fromRGB(255, 255, 0)}
    local v4 = {name = "blue", color = Color3.fromRGB(0, 0, 255)}
    local v5 = {name = "orange", color = Color3.fromRGB(255, 165, 0)}
    local v6 = {name = "green", color = Color3.fromRGB(0, 255, 0)}
    local v7 = {name = "white", color = Color3.fromRGB(255, 255, 255)}
    local v8 = {name = "black", color = Color3.fromRGB(0, 0, 0)}
    local v9 = {name = "pink", color = Color3.fromRGB(255, 151, 151)}
    local v10 = {name = "purple", color = Color3.fromRGB(222, 59, 222)}
    local v11 = {name = "brown", color = Color3.fromRGB(139, 69, 19)}
    local v12 = {name = "cyan", color = Color3.fromRGB(0, 255, 255)}
    local v13 = {name = "magenta", color = Color3.fromRGB(255, 0, 255)}
    local v14 = {name = "lime", color = Color3.fromRGB(191, 255, 0)}
    local v15 = {name = "navy", color = Color3.fromRGB(0, 0, 128)}
    local v16 = {name = "teal", color = Color3.fromRGB(0, 128, 128)}
    local v17 = {name = "maroon", color = Color3.fromRGB(128, 0, 0)}
    v1[1] = v2
    v1[2] = v3
    v1[3] = v4
    v1[4] = v5
    v1[5] = v6
    v1[6] = v7
    v1[7] = v8
    v1[8] = v9
    v1[9] = v10
    v1[10] = v11
    v1[11] = v12
    v1[12] = v13
    v1[13] = v14
    v1[14] = v15
    v1[15] = v16
    v1[16] = v17
    v2 = {name = "olive", color = Color3.fromRGB(128, 128, 0)}
    v3 = {name = "silver", color = Color3.fromRGB(192, 192, 192)}
    v4 = {name = "gold", color = Color3.fromRGB(255, 215, 0)}
    v5 = {name = "beige", color = Color3.fromRGB(245, 245, 220)}
    v6 = {name = "coral", color = Color3.fromRGB(255, 127, 80)}
    v7 = {name = "lavender", color = Color3.fromRGB(230, 230, 250)}
    v8 = {name = "indigo", color = Color3.fromRGB(75, 0, 130)}
    v9 = {name = "violet", color = Color3.fromRGB(238, 130, 238)}
    v10 = {name = "turquoise", color = Color3.fromRGB(64, 224, 208)}
    v11 = {name = "salmon", color = Color3.fromRGB(250, 128, 114)}
    v12 = {name = "khaki", color = Color3.fromRGB(240, 230, 140)}
    v13 = {name = "plum", color = Color3.fromRGB(221, 160, 221)}
    v14 = {name = "orchid", color = Color3.fromRGB(218, 112, 214)}
    v15 = {name = "mint", color = Color3.fromRGB(189, 252, 201)}
    v1[17] = v2
    v1[18] = v3
    v1[19] = v4
    v1[20] = v5
    v1[21] = v6
    v1[22] = v7
    v1[23] = v8
    v1[24] = v9
    v1[25] = v10
    v1[26] = v11
    v1[27] = v12
    v1[28] = v13
    v1[29] = v14
    v1[30] = v15
    local name = ""
    local huge = math.huge
    for i, v in ipairs(v1) do
        v10 = (function(p1, p2) -- Line: 113
            local v1 = p1.R - p2.R
            local v2 = p1.G - p2.G
            local v3 = p1.B - p2.B
            local v4 = v1 * v1 + v2 * v2
            return (math.sqrt(v4 + v3 * v3))
        end)(p1, v.color)
        if v10 < huge then
            huge = v10
            name = v.name
        end
    end
    _, v6, v7 = Color3.toHSV(p1)
    if 0.9 > v7 then
        if 0.5 <= v7 then
            v8 = "bright"
        elseif 0.3 > v7 then
            v8 = "dark "
        else
            v8 = "normal"
        end
    elseif 0.7 < v6 then
        v8 = "neon"
    elseif 0.5 <= v7 then
        v8 = "bright"
    elseif 0.3 > v7 then
        v8 = "dark "
    else
        v8 = "normal"
    end
    return name, v8
end
function v2.IsDark(p1) -- Line: 47
    local v1, v2
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    _, _, v2 = Color3.toHSV(v1)
    local v3 = v2 < 0.1
    return v3
end
function v2.IsLight(p1, p2) -- Line: 60
    local v1, v2
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    local v3 = getLuminance(v1)
    if p2 or 0.65 < v3 then
        v2 = true
    else
        v2 = false
    end
    return v2
end
function v2.Brighten(p1, p2, p3) -- Line: 33
    local v1, v2, v3, v4
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    v2, v3, v4 = v1:ToHSV()
    local v5 = math.clamp(v3 - p2 * (p3 or 0.5), 0, 1)
    return Color3.fromHSV(v2, v5, (math.clamp(v4 + p2, 0, 1)))
end
function v2.GetDarkness(p1) -- Line: 66
    local v1, v2
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    _, _, v2 = Color3.toHSV(v1)
    return 1 - v2
end
function v2.Inverse(p1) -- Line: 72
    local v1
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    return Color3.new(1 - v1.R, 1 - v1.G, 1 - v1.B)
end
return v2