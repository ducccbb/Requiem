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
--                    File: ReplicatedStorage.Common.Types.Resources
--                               Dumped in 0.00193 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u24 = {
    "Bandages Crate",
    "Compass Crate",
    "Handcuff Crate",
    "Musket Rack",
    "Sabre Rack",
    "Gas Tank",
    "Blade Box",
    "Gear Spawner",
    "Bow Crate",
    "Torch Crate",
    "Axe Crate",
    "Pickaxe Crate",
    "Flare Crate",
    "Spyglass Crate",
    "Bread Crate",
    "Canteen Crate",
    "Iron Ingot Crate",
    "Silver Ingot Crate",
    "Copper Ingot Crate",
    "Gold Ingot Crate",
    "Mythril Ingot Crate",
    "Platinum Ingot Crate",
    "Wood Crate",
    "Wood Plank Crate",
    "Stone Crate",
    "Clay Crate",
    "Cannonball Crate",
}
local u52 = {}
u52["Bandages Crate"] = "Bandage"
u52["Compass Crate"] = "Compass"
u52["Handcuff Crate"] = "Handcuffs"
u52["Musket Rack"] = "Musket"
u52["Sabre Rack"] = "Sabre"
u52["Gas Tank"] = "Gas"
u52["Blade Box"] = "Blades"
u52["Gear Spawner"] = "Gear"
u52["Bow Crate"] = "Bow"
u52["Torch Crate"] = "Torch"
u52["Axe Crate"] = "Axe"
u52["Pickaxe Crate"] = "Pickaxe"
u52["Flare Crate"] = "Flare Gun"
u52["Spyglass Crate"] = "Spyglass"
u52["Bread Crate"] = "Bread"
u52["Canteen Crate"] = "Canteen"
u52["Iron Ingot Crate"] = "Iron Ingot"
u52["Silver Ingot Crate"] = "Silver Ingot"
u52["Copper Ingot Crate"] = "Copper Ingot"
u52["Gold Ingot Crate"] = "Gold Ingot"
u52["Mythril Ingot Crate"] = "Mythril Ingot"
u52["Platinum Ingot Crate"] = "Platinum Ingot"
u52["Wood Crate"] = "Wood"
u52["Wood Plank Crate"] = "Wooden Planks"
u52["Stone Crate"] = "Stone"
u52["Clay Crate"] = "Clay"
u52["Cannonball Crate"] = "Cannonball"
local u80 = {}
u80["Bandages Crate"] = 50
u80["Compass Crate"] = 100
u80["Handcuff Crate"] = 20
u80["Musket Rack"] = 60
u80["Sabre Rack"] = 60
u80["Gas Tank"] = 48000
u80["Blade Box"] = 160
u80["Gear Spawner"] = 30
u80["Bow Crate"] = 80
u80["Torch Crate"] = 250
u80["Axe Crate"] = 100
u80["Pickaxe Crate"] = 100
u80["Flare Crate"] = 150
u80["Spyglass Crate"] = 100
u80["Bread Crate"] = 100
u80["Canteen Crate"] = 50
u80["Iron Ingot Crate"] = 100
u80["Silver Ingot Crate"] = 100
u80["Copper Ingot Crate"] = 100
u80["Gold Ingot Crate"] = 75
u80["Mythril Ingot Crate"] = 25
u80["Platinum Ingot Crate"] = 50
u80["Wood Crate"] = 500
u80["Wood Plank Crate"] = 400
u80["Stone Crate"] = 300
u80["Clay Crate"] = 300
u80["Cannonball Crate"] = 50
local v2 = {
    Gear = {"Gear Spawner", "Gas Tank", "Blade Box"},
}
v2["Field Equipment"] = {
    "Musket Rack",
    "Sabre Rack",
    "Handcuff Crate",
    "Compass Crate",
    "Flare Crate",
    "Bandages Crate",
    "Bow Crate",
    "Torch Crate",
    "Axe Crate",
    "Spyglass Crate",
    "Pickaxe Crate",
}
v2.Materials = {
    "Iron Ingot Crate",
    "Silver Ingot Crate",
    "Copper Ingot Crate",
    "Gold Ingot Crate",
    "Mythril Ingot Crate",
    "Platinum Ingot Crate",
    "Wood Crate",
    "Wood Plank Crate",
    "Stone Crate",
    "Clay Crate",
    "Cannonball Crate",
}
v2.Provisions = {"Bread Crate", "Canteen Crate"}
local v3 = {
    Bandage = {max = 8, cooldown = 7200},
    Bread = {max = 10, cooldown = 7200},
    Compass = {max = 1, cooldown = 43200},
    Canteen = {max = 1, cooldown = 43200},
    Spyglass = {max = 1, cooldown = 43200},
    Handcuffs = {max = 1, cooldown = 43200},
    Musket = {max = 1, cooldown = 43200},
    Sabre = {max = 1, cooldown = 43200},
    Gear = {max = 1, cooldown = 43200},
    Bow = {max = 1, cooldown = 43200},
    Torch = {max = 1, cooldown = 43200},
    Flare = {max = 1, cooldown = 43200},
    Pickaxe = {max = 1, cooldown = 43200},
}
local v4 = {max = 5, cooldown = 3600}
v3.Cannonball = v4
local function getIdFromVector3(p1) -- Line: 196
    local v1 = math.floor(p1.X * 10 + 0.5)
    local v2 = math.floor(p1.Y * 10 + 0.5)
    local v3 = Vector3.new(v1, v2, (math.floor(p1.Z * 10 + 0.5)))
    v2 = v3.X * 73856093
    local v4 = v3.Y * 19349663
    return (bit32.band(bit32.bxor(v2, v4, v3.Z * 83492791), 4294967295))
end
return {
    updateFunnelModelData = function(p1, p2) -- Line: 298 -- upvalues: u24 (val), u52 (val), u80 (val), getIdFromVector3 (val)
        local v1
        local Name = p1.Name
        if not (table.find(u24, Name)) then
            return warn("Invalid giver object name: " .. Name)
        end
        local v2 = p1:FindFirstChild("Interaction") or p1
        local v3 = u52[p1.Name]
        p1:AddTag("Funnel")
        v2:SetAttribute("Funnel", v3)
        v2:SetAttribute("Item", v3)
        local v4 = u80[p1.Name]
        local v5 = p1:GetAttribute("category") == "Schematics"
        if v5 then
            v1 = 0
        elseif not p2 then
            v1 = v4
        else
            v1 = 0
        end
        v2:SetAttribute("MaxAmount", v4)
        v2:SetAttribute("Amount", v1)
        p1:SetAttribute("funnelId", getIdFromVector3(p1:GetPivot().Position))
    end,
    getFunnelData = function(p1) -- Line: 274 -- upvalues: getIdFromVector3 (val)
        local v1 = p1:FindFirstChild("Interaction") or p1
        local Attribute = v1:GetAttribute("Funnel")
        local Attribute_2 = v1:GetAttribute("MaxAmount")
        local Attribute_3 = v1:GetAttribute("Amount")
        local Attribute_4 = p1:GetAttribute("funnelId")
        if not Attribute_4 then
            Attribute_4 = p1:GetAttribute("id")
        end
        if not Attribute_4 then
            Attribute_4 = getIdFromVector3(p1:GetPivot().Position)
        end
        return {
            resource = Attribute,
            maxAmount = Attribute_2,
            id = Attribute_4,
            amount = Attribute_3,
            model = p1,
        }
    end,
    getMaxAmountForResource = function(p1) -- Line: 213 -- upvalues: u80 (val), Table (val), u52 (val)
        if u80[p1] then
            return u80[p1], p1
        end
        local v1 = Table.inverse(u52)[p1]
        if u80[v1] then
            return u80[v1], v1
        end
        return u80[p1], p1
    end,
    getIdFromVector3 = getIdFromVector3,
    isResourceMatching = function(p1, p2) -- Line: 249 -- upvalues: Table (val), u52 (val)
        local v1, v2
        local v3 = string.lower(p1)
        if v3 == string.lower(p2) then
            return true
        end
        v3 = Table.inverse(u52)[p2]
        if not v3 then
            v1 = Table.inverse(u52)[p1]
            if v1 then
                v2 = string.lower(v1)
                if v2 == string.lower(p2) then
                    return true
                end
                return false
            end
            return false
        end
        v1 = string.lower(v3)
        if v1 == string.lower(p1) then
            return true
        end
        v1 = Table.inverse(u52)[p1]
        if not v1 then
            return false
        end
        v2 = string.lower(v1)
        if v2 == string.lower(p2) then
            return true
        end
        return false
    end,
    getResourceName = function(p1) -- Line: 230 -- upvalues: u52 (val), Table (val)
        if u52[p1] then
            return u52[p1]
        end
        if Table.inverse(u52)[p1] then
            return p1
        end
        warn("Invalid resource type: " .. p1)
        return p1
    end,
    RESOURCE_TYPE_MAP = u52,
    CATEGORIES = v2,
    GIVER_LIMITATIONS = v3,
}