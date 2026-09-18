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
--                       File: ReplicatedStorage.Common.Types.Item
--                              Dumped in 0.000417 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Ingots = require(script.Parent:WaitForChild("Ingots"))
local u32 = {
    ExtremelyHeavy = 50,
    VeryHeavy = 40,
    Heavy = 30,
    Medium = 20,
    Light = 10,
    ExtremelyLight = 5,
}
local u39 = {
    ExtremelyHeavy = Color3.fromRGB(255, 97, 97),
    VeryHeavy = Color3.fromRGB(255, 125, 64),
    Heavy = Color3.fromRGB(255, 191, 94),
    Medium = Color3.fromRGB(255, 236, 125),
    Light = Color3.fromRGB(151, 255, 151),
    ExtremelyLight = Color3.fromRGB(177, 255, 184),
}
return {
    getDisplayName = function(p1) -- Line: 51 -- upvalues: Ingots (val)
        local Name = p1.Name
        if not Name then
            Name = p1.name
            if not Name then
                Name = ""
            end
        end
        local Tags = p1.Tags
        if not Tags then
            Tags = p1.tags
            if not Tags then
                Tags = {}
            end
        end
        if Name == "Ingot" and 1 < #Tags then
            Name = "Alloy"
        end
        local v1 = Ingots.getMaskedNameFromTags(Tags)
        if not v1 then
            v1 = table.concat(Tags, " ")
        end
        return string.gsub(v1 .. " " .. Name, "^%s+", "")
    end,
    getRelativeItemWeight = function(p1) -- Line: 69 -- upvalues: u32 (val), u39 (val)
        local v1
        local v2 = nil
        local huge = math.huge
        local v3 = nil
        for k, v in pairs(u32) do
            v1 = math.abs(p1 - v)
            if v1 < huge then
                huge = v1
                v2 = v
                v3 = u39[k]
            end
        end
        return v2, v3
    end,
    CATEGORIES = {
        Weapon = "Weapon",
        Economy = "Economy",
        Tool = "Tool",
        Medical = "Medical",
        Exploration = "Exploration",
        Cooking = "Cooking",
        Building = "Building",
        Resource = "Resource",
        Administration = "Administration",
        Consumables = "Consumables",
        Special = "Special",
        Other = "Other",
    },
    ITEM_WEIGHTS = u32,
}