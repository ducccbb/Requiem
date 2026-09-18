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
--                     File: ReplicatedStorage.Common.Network.Buffer
--                               Dumped in 0.00230 seconds
--                          Bytecode version 9  |  9 functions

local deserializeValue, getSize, serializeValue
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
function getSize(p1, p2) -- Line: 11 -- upvalues: getSize (val)
    local v1
    if p2.__type == "string" then
        return #p1 + 4
    end
    if p2.__type == "number" then
        if p2.__numType == "f64" then
            return 8
        end
        if p2.__numType == "f32" then
            return 4
        end
        if p2.__numType == "i8" or p2.__numType == "u8" then
            return 1
        end
        if p2.__numType == "i16" or p2.__numType == "u16" then
            return 2
        end
        if p2.__numType == "i32" or p2.__numType == "u32" then
            return 4
        end
        error("Unsupported number type: " .. p2.__numType)
        return
    end
    if p2.__type == "boolean" then
        return 1
    end
    if p2.__type == "array" then
        v1 = 4
        for i3, k3 in ipairs(p1) do
            v1 = v1 + getSize(k3, p2.__arrayType)
        end
        return v1
    end
    if p2.__type == "map" then
        v1 = 4
        for k2, j in pairs(p1) do
            v1 = v1 + getSize(k2, p2.__keyType)
            v1 = v1 + getSize(j, p2.__valueType)
        end
        return v1
    end
    if p2.__type ~= "union" then
        v1 = 0
        for k, v in pairs(p1) do
            v1 = v1 + getSize(v, p2[k])
        end
        return v1
    end
    v1 = nil
    for i, i2 in ipairs(p2.__types) do
        if getSize(p1, i2) then
            v1 = i2
            break
        end
    end
    if not v1 then
        error("No matching type found in union for value: " .. tostring(p1))
    end
    return 1 + getSize(p1, v1)
end
function serializeValue(p1, p2, p3, p4) -- Line: 65 -- upvalues: serializeValue (val), getSize (val)
    local v1
    if p4.__type == "string" then
        buffer.writeu32(p1, p2, #p3)
        buffer.writestring(p1, p2 + 4, p3)
        return p2 + 4 + #p3
    end
    if p4.__type == "number" then
        if p4.__numType == "f64" then
            buffer.writef64(p1, p2, p3)
            return p2 + 8
        end
        if p4.__numType == "f32" then
            buffer.writef32(p1, p2, p3)
            return p2 + 4
        end
        if p4.__numType == "i8" then
            buffer.writei8(p1, p2, p3)
            return p2 + 1
        end
        if p4.__numType == "u8" then
            buffer.writeu8(p1, p2, p3)
            return p2 + 1
        end
        if p4.__numType == "i16" then
            buffer.writei16(p1, p2, p3)
            return p2 + 2
        end
        if p4.__numType == "u16" then
            buffer.writeu16(p1, p2, p3)
            return p2 + 2
        end
        if p4.__numType == "i32" then
            buffer.writei32(p1, p2, p3)
            return p2 + 4
        end
        if p4.__numType == "u32" then
            buffer.writeu32(p1, p2, p3)
            return p2 + 4
        end
        error("Unsupported number type: " .. p4.__numType)
        return
    end
    if p4.__type == "boolean" then
        local v2
        if not p3 then
            v2 = 0
        else
            v2 = 1
        end
        buffer.writeu8(p1, p2, v2)
        return p2 + 1
    end
    if p4.__type == "array" then
        buffer.writeu32(p1, p2, #p3)
        v1 = p2 + 4
        for i3, k3 in ipairs(p3) do
            v1 = serializeValue(p1, v1, k3, p4.__arrayType)
        end
        return v1
    end
    if p4.__type == "map" then
        buffer.writeu32(p1, p2, #p3)
        v1 = p2 + 4
        for k2, j in pairs(p3) do
            v1 = serializeValue(p1, v1, k2, p4.__keyType)
            v1 = serializeValue(p1, v1, j, p4.__valueType)
        end
        return v1
    end
    if p4.__type ~= "union" then
        v1 = p2
        for k, v in pairs(p3) do
            v1 = serializeValue(p1, v1, v, p4[k])
        end
        return v1
    end
    v1 = nil
    local v3 = nil
    for i, i2 in ipairs(p4.__types) do
        if getSize(p3, i2) then
            v1 = i
            v3 = i2
            break
        end
    end
    if not v3 then
        error("No matching type found in union for value: " .. tostring(p3))
    end
    buffer.writeu8(p1, p2, v1)
    return serializeValue(p1, p2 + 1, p3, v3)
end
function deserializeValue(p1, p2, p3) -- Line: 140 -- upvalues: deserializeValue (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    if p3.__type == "string" then
        v3 = buffer.readu32(p1, p2)
        return buffer.readstring(p1, p2 + 4, v3), p2 + 4 + v3
    end
    if p3.__type == "number" then
        if p3.__numType == "f64" then
            v3 = buffer.readf64(p1, p2)
            return v3, p2 + 8
        end
        if p3.__numType == "f32" then
            v3 = buffer.readf32(p1, p2)
            return v3, p2 + 4
        end
        if p3.__numType == "i8" then
            v3 = buffer.readi8(p1, p2)
            return v3, p2 + 1
        end
        if p3.__numType == "u8" then
            v3 = buffer.readu8(p1, p2)
            return v3, p2 + 1
        end
        if p3.__numType == "i16" then
            v3 = buffer.readi16(p1, p2)
            return v3, p2 + 2
        end
        if p3.__numType == "u16" then
            v3 = buffer.readu16(p1, p2)
            return v3, p2 + 2
        end
        if p3.__numType == "i32" then
            v3 = buffer.readi32(p1, p2)
            return v3, p2 + 4
        end
        if p3.__numType == "u32" then
            v3 = buffer.readu32(p1, p2)
            return v3, p2 + 4
        end
        error("Unsupported number type: " .. p3.__numType)
        return
    end
    if p3.__type == "boolean" then
        v3 = buffer.readu8(p1, p2) == 1
        return v3, p2 + 1
    end
    if p3.__type == "array" then
        local v9
        v3 = buffer.readu32(p1, p2)
        v4 = {}
        v5 = p2 + 4
        v6 = v3
        v7 = 1
        for j = 1, v6, v7 do
            v9, v1 = deserializeValue(p1, v5, p3.__arrayType)
            v5 = v1
            v4[j] = v9
        end
        return v4, v5
    end
    if p3.__type ~= "map" then
        if p3.__type == "union" then
            v3 = buffer.readu8(p1, p2)
            return deserializeValue(p1, p2 + 1, p3.__types[v3])
        end
        v3 = {}
        v4 = p2
        for k, v in pairs(p3) do
            v1, v2 = deserializeValue(p1, v4, v)
            v3[k] = v1
            v4 = v2
        end
        return v3, v4
    end
    v3 = buffer.readu32(p1, p2)
    v4 = {}
    v5 = p2 + 4
    v6 = v3
    v7 = 1
    for i = 1, v6, v7 do
        v1, v2 = deserializeValue(p1, v5, p3.__keyType)
        v8 = v1
        v1, v2 = deserializeValue(p1, v2, p3.__valueType)
        v5 = v2
        v4[v8] = v1
    end
    return v4, v5
end
local function serializeTags(p1, p2, p3) -- Line: 202
    buffer.writeu32(p1, p2, #p3)
    local v1 = p2 + 4
    for i, v in ipairs(p3) do
        buffer.writeu32(p1, v1, v)
        v1 = v1 + 4
    end
    return v1
end
local function deserializeTags(p1, p2) -- Line: 213
    local v1 = buffer.readu32(p1, p2)
    local v2 = p2 + 4
    local v3 = {}
    local v4 = v1
    local v5 = 1
    for i = 1, v4, v5 do
        v3[i] = buffer.readu32(p1, v2)
        v2 = v2 + 4
    end
    return v3, v2
end
function v1.serialize(p1, p2, p3) -- Line: 225 -- upvalues: getSize (val), serializeTags (val), serializeValue (val)
    local v1 = p3
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    v1 = getSize(p1, p2)
    local v3 = buffer.create(v1 + (#v2 * 4 + 4))
    local v4 = serializeTags(v3, 0, v2)
    serializeValue(v3, v4, p1, p2)
    return v3
end
function v1.deserialize(p1, p2) -- Line: 244 -- upvalues: deserializeTags (val), deserializeValue (val)
    local v1, v2
    v1, v2 = deserializeTags(p1, 0)
    local v3 = deserializeValue(p1, v2, p2)
    return v1, v3
end
function v1.extractTags(p1) -- Line: 251 -- upvalues: deserializeTags (val)
    local v1 = deserializeTags(p1, 0)
    return v1
end
return v1