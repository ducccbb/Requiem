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
--         File: ReplicatedStorage.Common.Network.Compressions.Stores.Reputation
--                               Dumped in 0.00177 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function readLengthPrefixedString(p1, p2) -- Line: 16
    local v1 = buffer.readu16(p1, p2)
    local v2 = p2 + 2
    if v1 == 0 then
        return "", v2
    end
    local v3 = buffer.create(v1)
    buffer.copy(v3, 0, p1, v2, v1)
    local v4 = buffer.tostring(v3)
    return v4, v2 + v1
end
local function writeLengthPrefixedString(p1, p2, p3) -- Line: 34
    local v1 = tostring(p3)
    local v2 = math.min(#v1, 65535)
    buffer.writeu16(p1, p2, v2)
    local v3 = p2 + 2
    if 0 < v2 then
        local v4 = buffer.fromstring(v1)
        buffer.copy(p1, v3, v4, 0, v2)
        v3 = v3 + v2
    end
    return v3
end
local function locationByteSize(p1) -- Line: 51
    return #tostring(p1.name or "") + 6 + 1 + 40 + 8 + 4
end
local function serializeLocation(p1, p2, p3) -- Line: 68 -- upvalues: writeLengthPrefixedString (val)
    local tax_last_claimed
    buffer.writei32(p1, p2, p3.id or 0)
    local v1 = writeLengthPrefixedString(p1, p2 + 4, p3.name or "")
    buffer.writei8(p1, v1, (p3.type or 0) % 256)
    v1 = v1 + 1
    buffer.writei32(p1, v1, p3.population or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.businesses or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.average_income or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.happiness or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.outlook or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.governor or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.civilian_tax or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.industrial_tax or 0)
    v1 = v1 + 4
    if type(p3.tax_last_claimed) ~= "number" then
        tax_last_claimed = 0
    else
        tax_last_claimed = p3.tax_last_claimed
        if not tax_last_claimed then
            tax_last_claimed = 0
        end
    end
    buffer.writef64(p1, v1, tax_last_claimed)
    v1 = v1 + 8
    buffer.writei32(p1, v1, p3.treasury or 0)
    return v1 + 4
end
local function deserializeLocation(p1, p2) -- Line: 103 -- upvalues: readLengthPrefixedString (val)
    local v1, v2
    local v3 = buffer.readi32(p1, p2)
    v1, v2 = readLengthPrefixedString(p1, p2 + 4)
    local v4 = v2
    local v5 = buffer.readi8(p1, v4)
    v4 = v4 + 1
    local v6 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v7 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v8 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v9 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v10 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v11 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v12 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v13 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v14 = buffer.readf64(p1, v4)
    v4 = v4 + 8
    local v15 = buffer.readi32(p1, v4)
    return {
        id = v3,
        name = v1,
        type = v5,
        population = v6,
        businesses = v7,
        average_income = v8,
        happiness = v9,
        outlook = v10,
        governor = v11,
        civilian_tax = v12,
        industrial_tax = v13,
        tax_last_claimed = v14,
        treasury = v15,
    }, v4 + 4
end
local function repEntryByteSize(p1) -- Line: 152
    return #tostring(p1.name or "") + 10 + 4 + 4
end
local function serializeRepEntry(p1, p2, p3) -- Line: 162 -- upvalues: writeLengthPrefixedString (val)
    buffer.writei32(p1, p2, p3.id or 0)
    local v1 = p2 + 4
    buffer.writei32(p1, v1, p3.type or 0)
    v1 = writeLengthPrefixedString(p1, v1 + 4, p3.name or "")
    buffer.writei32(p1, v1, p3.location or 0)
    v1 = v1 + 4
    buffer.writei32(p1, v1, p3.reputation or 0)
    return v1 + 4
end
local function deserializeRepEntry(p1, p2) -- Line: 181 -- upvalues: readLengthPrefixedString (val)
    local v1, v2
    local v3 = buffer.readi32(p1, p2)
    local v4 = p2 + 4
    local v5 = buffer.readi32(p1, v4)
    v1, v2 = readLengthPrefixedString(p1, v4 + 4)
    v4 = v2
    local v6 = buffer.readi32(p1, v4)
    v4 = v4 + 4
    local v7 = buffer.readi32(p1, v4)
    return {
        id = v3,
        type = v5,
        name = v1,
        location = v6,
        reputation = v7,
    }, v4 + 4
end
local function getEntriesAsArray(p1) -- Line: 205
    if type(p1) ~= "table" then
        return nil
    end
    local v1 = {}
    local v2 = true
    for i, v in ipairs(p1) do
        if type(v) == "table" and type(v.location) == "table" and type(v.reputation) == "table" then
            table.insert(v1, {location = v.location, reputation = v.reputation})
            continue
        end
        v2 = false
        break
    end
    if not v2 then
        local v3, v4, v5, v6
        v1 = {}
        local v7 = {}
        for k in pairs(p1) do
            table.insert(v7, k)
        end
        table.sort(v7, function(p1, p2) -- Line: 228
            local v1
            local v2 = tonumber(p1) or 0
            if v2 < tonumber(p2) or 0 then
                v1 = true
            else
                v1 = false
            end
            return v1
        end)
        local v8 = p1
        for i2, i3 in ipairs(v7) do
            v6 = v8[i3]
            if type(v6) == "table" then
                v3 = v6[2]
                v4 = if type(v3) == "table" then v3[4] else false
                if type(v4) == "table" and type(v4.location) == "table" and type(v4.reputation) == "table" then
                    table.insert(v1, {location = v4.location, reputation = v4.reputation})
                end
            end
        end
        if 0 >= #v1 then
            v5 = nil
        else
            v5 = v1
            if not v5 then
                v5 = nil
            end
        end
        return v5
    elseif 0 < #v1 then
        return v1
    end
end
local function isReputationStoreShape(p1) -- Line: 248 -- upvalues: getEntriesAsArray (val)
    local v1 = getEntriesAsArray(p1) ~= nil
    return v1
end
local function reputationPayloadByteSize(p1) -- Line: 256 -- upvalues: locationByteSize (val), repEntryByteSize (val)
    local reputation
    local v1 = 2
    for i, v in ipairs(p1) do
        v1 = v1 + locationByteSize(v.location) + 2
        reputation = v.reputation
        if not reputation then
            reputation = {}
        end
        for i2, i3 in ipairs(reputation) do
            v1 = v1 + repEntryByteSize(i3)
        end
    end
    return v1
end
local function serializeReputationPayload(p1) -- Line: 272 -- upvalues: getEntriesAsArray (val), reputationPayloadByteSize (val), serializeLocation (val), serializeRepEntry (val)
    local reputation, reputation_2, v1
    local v2 = getEntriesAsArray(p1)
    if not v2 then
        error("Invalid reputation payload shape")
    end
    local v3 = reputationPayloadByteSize(v2)
    local v4 = buffer.create(v3)
    local v5 = 0
    buffer.writeu16(v4, v5, (math.min(#v2, 65535)))
    v5 = v5 + 2
    for i, v in ipairs(v2) do
        v5 = serializeLocation(v4, v5, v.location)
        reputation = v.reputation
        if not reputation then
            reputation = {}
        end
        v1 = #reputation
        buffer.writeu16(v4, v5, (math.min(v1, 65535)))
        v5 = v5 + 2
        reputation_2 = v.reputation
        if not reputation_2 then
            reputation_2 = {}
        end
        for i2, i3 in ipairs(reputation_2) do
            v5 = serializeRepEntry(v4, v5, i3)
        end
    end
    return v4
end
local function deserializeReputationPayload(p1) -- Line: 297 -- upvalues: deserializeLocation (val), deserializeRepEntry (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = {}
    local v10 = 0
    local v11 = buffer.len(p1)
    if v11 < 2 then
        return v9
    end
    v10 = v10 + 2
    local v12 = buffer.readu16(p1, v10)
    local v13 = 1
    local v14 = p1
    for i = 1, v12, v13 do
        if v11 < v10 + 2 then
            break
        end
        v7, v8 = deserializeLocation(v14, v10)
        v10 = v8
        if v11 < v10 + 2 then
            break
        end
        v1 = buffer.readu16(v14, v10)
        v10 = v10 + 2
        v2 = {}
        v3 = v1
        v4 = 1
        for j = 1, v3, v4 do
            if v11 < v10 + 4 then
                break
            end
            v5, v6 = deserializeRepEntry(v14, v10)
            v10 = v6
            table.insert(v2, v5)
        end
        table.insert(v9, {location = v7, reputation = v2})
    end
    return v9
end
return {
    compress = function(p1) -- Line: 335 -- upvalues: isReputationStoreShape (val), serializeReputationPayload (val)
        local v1, v2
        if p1 == nil then
            return p1
        end
        local __full = p1.__full
        if not __full then
            if not (isReputationStoreShape(p1)) then
                __full = nil
            else
                __full = p1
                if not __full then
                    __full = nil
                end
            end
        end
        if __full == nil then
            return p1
        end
        v1, v2 = pcall(serializeReputationPayload, __full)
        if not v1 or not v2 then
            return p1
        end
        return {__compressed = true, __full = v2}
    end,
    decompress = function(p1) -- Line: 355 -- upvalues: deserializeReputationPayload (val)
        local v1, v2
        if p1 == nil or not p1.__compressed then
            return p1
        end
        local __full = p1.__full
        if typeof(__full) ~= "buffer" then
            return {}
        end
        v1, v2 = pcall(deserializeReputationPayload, __full)
        if not v1 or not v2 then
            return {}
        end
        return v2
    end,
}