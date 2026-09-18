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
--                   File: ReplicatedStorage.Common.Types.MissingLimbs
--                              Dumped in 0.000431 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u24 = {
    {
        name = "arm",
        attributes = {
            {attribute = "BladeDamageMultiplier", value = 0.4, modifier = "subtract"},
            {attribute = "PlayerDamageMultiplier", value = 0.4, modifier = "subtract"},
            {attribute = "MeleeDamageMultiplier", value = 0.4, modifier = "subtract"},
            {attribute = "FirearmAccuracyMultiplier", value = 0.25, modifier = "subtract"},
            {attribute = "FirearmRecoilMultiplier", value = 0.2, modifier = "add"},
            {attribute = "FirearmReloadMultiplier", value = 0.25, modifier = "subtract"},
        },
    },
    {
        name = "leg",
        attributes = {
            {attribute = "GearVelocityIncreaseRate", value = 0.2, modifier = "subtract"},
            {attribute = "GearSwiftnessMultiplier", value = 0.2, modifier = "subtract"},
            {attribute = "BasePlayerRunMultiplier", value = 0.2, modifier = "subtract"},
            {attribute = "BasePlayerJumpMultiplier", value = 0.25, modifier = "subtract"},
        },
    },
}
local function getLimb(p1) -- Line: 103 -- upvalues: Table (val), u24 (val)
    local v1, v2
    v1 = Table.find(u24, function(a1) -- Line: 104 -- upvalues: p1 (val)
        local v1 = a1.name == p1
        return v1
    end)
    if not v1 then
        v2 = nil
    else
        v2 = u24[v1]
        if not v2 then
            v2 = nil
        end
    end
    return v2
end
return {
    getLimb = getLimb,
    getLimbAttributes = function(p1) -- Line: 116 -- upvalues: getLimb (val)
        local v1 = getLimb(p1)
        if not v1 then
            return nil
        end
        return v1.attributes
    end,
    getLimbs = function() -- Line: 129 -- upvalues: Table (val), u24 (val)
        return Table.values(u24)
    end,
}