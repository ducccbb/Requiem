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
--                File: ReplicatedStorage.Common.Economy.MerchantPricing
--                              Dumped in 0.000687 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Merchant = v1.Parent:WaitForChild("Merchant")
local FallbackPrices = require(Merchant:WaitForChild("FallbackPrices"))
local Equipment = v1.Parent.Parent:WaitForChild("Equipment")
local ItemGiverIssued = require(Equipment:WaitForChild("ItemGiverIssued"))
local function resolveMerchantBaseUnit(p1, p2, p3, p4) -- Line: 34 -- upvalues: FallbackPrices (val)
    local v1 = FallbackPrices.get(p1)
    if typeof(v1) ~= "number" then
        if typeof(p4) == "number" then
            if 0 < p4 then
                return p4
            end
            return 0
        end
        return 0
    end
    if 0 < v1 then
        return v1
    end
    if typeof(p4) ~= "number" then
        return 0
    end
    if 0 < p4 then
        return p4
    end
    return 0
end
local function merchantQuoteFromBase(p1) -- Line: 50
    if p1 <= 0 then
        return 0, 0
    end
    local v1 = math.ceil(p1 * 1.1)
    local v2 = math.ceil(p1)
    local v3 = math.floor(v1 / 1.1)
    if v3 < v2 then
        v2 = v3
    end
    if v1 <= v2 then
        v2 = math.max(1, v1 - 1)
    end
    return v1, v2
end
local function hasFallbackUnitPrice(p1) -- Line: 69 -- upvalues: FallbackPrices (val)
    local v1 = FallbackPrices.get(p1)
    local v2 = if typeof(v1) == "number" then 0 < v1 else false
    return v2
end
local u38 = {Bandage = true, Handcuffs = true}
u38["Flare Gun"] = true
u38.Kar98k = true
u38.ScopedKar98k = true
u38.TrenchShotgun = true
local function isMerchantSellBlocked(p1) -- Line: 84 -- upvalues: u38 (val)
    if u38[p1] then
        return true
    end
    local v1 = string.gsub(p1, "%s+", "")
    local v2 = u38[v1] == true
    return v2
end
local function isMerchantSellEligible(p1, p2, p3) -- Line: 93 -- upvalues: isMerchantSellBlocked (val), hasFallbackUnitPrice (val)
    if isMerchantSellBlocked(p1) then
        return false
    end
    return hasFallbackUnitPrice(p1)
end
local function merchantUnitPrice(p1, p2, p3, p4) -- Line: 106 -- upvalues: resolveMerchantBaseUnit (val), merchantQuoteFromBase (val)
    local v1 = resolveMerchantBaseUnit(p1, p2, p3, p4)
    if v1 <= 0 then
        return 0
    end
    local v2 = merchantQuoteFromBase(v1)
    return v2
end
local function merchantSellUnitPrice(p1, p2, p3) -- Line: 121 -- upvalues: resolveMerchantBaseUnit (val), merchantQuoteFromBase (val)
    local v1
    local v2 = resolveMerchantBaseUnit(p1, p2, p3, nil)
    if v2 <= 0 then
        return 0
    end
    _, v1 = merchantQuoteFromBase(v2)
    return v1
end
return {
    MERCHANT_MARKUP = 1.1,
    merchantUnitPrice = merchantUnitPrice,
    merchantSellUnitPrice = merchantSellUnitPrice,
    merchantLineBuyPrice = function(p1, p2, p3, p4) -- Line: 134 -- upvalues: merchantUnitPrice (val)
        local v1 = merchantUnitPrice(p1, p3, p4)
        return v1 * math.max(1, (math.floor(p2)))
    end,
    merchantSellPayout = function(p1, p2, p3, p4) -- Line: 144 -- upvalues: isMerchantSellEligible (val), merchantSellUnitPrice (val)
        if not (isMerchantSellEligible(p1, p3, p4)) then
            return 0
        end
        local v1 = merchantSellUnitPrice(p1, p3, p4)
        return v1 * math.max(1, (math.floor(p2)))
    end,
    itemTagsBlockMerchantSell = function(p1) -- Line: 157 -- upvalues: ItemGiverIssued (val)
        if not p1 then
            return false
        end
        for k, v in pairs(p1) do
            if v == ItemGiverIssued.MILITARY_GRADE_TAG then
                return true
            end
        end
        return false
    end,
    isMerchantSellEligible = isMerchantSellEligible,
}