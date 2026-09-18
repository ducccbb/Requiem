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
--                      File: ReplicatedStorage.Common.Types.Ingots
--                               Dumped in 0.00106 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    Copper = Color3.fromRGB(86, 195, 175),
    Gold = Color3.fromRGB(138, 113, 51),
    Iron = Color3.fromRGB(240, 125, 96),
    Mythril = Color3.fromRGB(25, 74, 138),
    Platinum = Color3.fromRGB(150, 140, 135),
    Silver = Color3.fromRGB(216, 202, 194),
}
local u43 = {
    Copper = Color3.fromRGB(165, 131, 104),
    Gold = Color3.fromRGB(190, 167, 83),
    Iron = Color3.fromRGB(161, 157, 148),
    Mythril = Color3.fromRGB(95, 117, 190),
    Platinum = Color3.fromRGB(229, 228, 226),
    Silver = Color3.fromRGB(192, 192, 192),
}
local u74 = {}
u74[{"Iron", "Gold"}] = "Auriferrous"
u74[{"Iron", "Mythril"}] = "Ferril"
u74[{"Iron", "Copper"}] = "Ferricupric"
u74[{"Iron", "Silver"}] = "Argentiferrous"
u74[{"Iron", "Platinum"}] = "Platiferrous"
u74[{"Gold", "Mythril"}] = "Auril"
u74[{"Gold", "Copper"}] = "Tumbaga"
u74[{"Gold", "Silver"}] = "Electrum"
u74[{"Gold", "Platinum"}] = "Auriplatina"
u74[{"Mythril", "Copper"}] = "Cupril"
u74[{"Mythril", "Silver"}] = "Argil"
u74[{"Mythril", "Platinum"}] = "Mythratum"
u74[{"Copper", "Silver"}] = "Billon"
u74[{"Copper", "Platinum"}] = "Cupriplat"
u74[{"Silver", "Platinum"}] = "Argiplat"
u74[{"Iron", "Mythril", "Gold"}] = "Auroril"
u74[{"Iron", "Mythril", "Copper"}] = "Cuproril"
u74[{"Iron", "Mythril", "Silver"}] = "Argoril"
u74[{"Iron", "Mythril", "Platinum"}] = "Platoril"
u74[{"Iron", "Gold", "Copper"}] = "Tumbaferrum"
u74[{"Iron", "Gold", "Silver"}] = "Electroferrum"
u74[{"Iron", "Gold", "Platinum"}] = "Auriplafer"
u74[{"Iron", "Copper", "Silver"}] = "Billoferrum"
u74[{"Iron", "Copper", "Platinum"}] = "Cupriferrat"
u74[{"Iron", "Silver", "Platinum"}] = "Argiferplat"
u74[{"Gold", "Mythril", "Silver"}] = "Electril"
u74[{"Gold", "Copper", "Silver"}] = "Tumbillon"
local v2 = {"Gold", "Silver", "Platinum"}
u74[v2] = "Electraplat"
local function toLinear(p1) -- Line: 68
    if p1 <= 0.04045 then
        return p1 / 12.92
    end
    return ((p1 + 0.055) / 1.055) ^ 2.4
end
local function toSRGB(p1) -- Line: 77
    if p1 <= 0.0031308 then
        return p1 * 12.92
    end
    return 1.055 * p1 ^ 0.4166666666666667 - 0.055
end
local function mixColors(p1) -- Line: 86 -- upvalues: toLinear (val), toSRGB (val)
    local v1 = 0
    local v2 = 0
    local v3 = 0
    local v4 = #p1
    for i, v in ipairs(p1) do
        v1 = v1 + toLinear(v.R)
        v2 = v2 + toLinear(v.G)
        v3 = v3 + toLinear(v.B)
    end
    local v5 = toSRGB(v1 / v4)
    v1 = math.clamp(v5, 0, 1)
    v5 = toSRGB(v2 / v4)
    v2 = math.clamp(v5, 0, 1)
    v5 = toSRGB(v3 / v4)
    v3 = math.clamp(v5, 0, 1)
    return Color3.new(v1, v2, v3)
end
local function colorObjectFromTags(p1, p2, p3) -- Line: 103 -- upvalues: mixColors (val)
    local v1
    local v2 = {}
    local v3 = p3
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p2[j]
        if v1 then
            table.insert(v2, v1)
        end
    end
    if #v2 == 0 then
        return
    end
    p1.Color = mixColors(v2)
end
return {
    ORE_COLORS = u12,
    INGOT_COLORS = u43,
    MASK_NAMES = u74,
    colorObjectFromTags = colorObjectFromTags,
    colorOreModelFromMetal = function(p1, p2) -- Line: 163 -- upvalues: colorObjectFromTags (val), u12 (val)
        local Ore = p1:FindFirstChild("Ore")
        if Ore then
            colorObjectFromTags(Ore, u12, {p2})
        end
    end,
    getMaskedNameFromTags = function(p1) -- Line: 122 -- upvalues: u12 (val), u43 (val), u74 (val)
        local v1
        local v2 = table.clone(p1)
        local v3 = {}
        local v4 = 1
        local v5 = -1
        for i = #v2, v4, v5 do
            v1 = v2[i]
            if not (u12[v1]) and not (u43[v1]) then
                table.insert(v3, v1)
                table.remove(v2, i)
            end
        end
        if #v2 == 0 then
            return nil
        end
        table.sort(v2)
        v4 = table.concat(v2, ",")
        v5 = u74
        local v6 = nil
        v1 = nil
        for j, k in v5, v6, v1 do
            table.sort(j)
            if table.concat(j, ",") == v4 then
                if 0 < #v3 then
                    return table.concat(v3, " ") .. " " .. k
                end
                return k
            end
        end
        return nil
    end,
}