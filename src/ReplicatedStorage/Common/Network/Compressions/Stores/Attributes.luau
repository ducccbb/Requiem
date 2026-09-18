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
--         File: ReplicatedStorage.Common.Network.Compressions.Stores.Attributes
--                              Dumped in 0.000832 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function isAttributesShape(p1) -- Line: 19
    if type(p1) ~= "table" then
        return false
    end
    for k, v in pairs(p1) do
        if type(k) ~= "string" then
            return false
        end
        if type(v) ~= "number" and type(v) ~= "boolean" then
            return false
        end
    end
    return true
end
local function attributesBufferSize(p1) -- Line: 35
    local v1
    local v2 = 2
    for k, v in pairs(p1) do
        if type(v) ~= "boolean" then
            v1 = 4
        else
            v1 = 1
        end
        v2 = v2 + 2 + 1 + v1
    end
    return v2
end
local function serializeAttributes(p1) -- Line: 49 -- upvalues: attributesBufferSize (val)
    local v1, v2
    local v3 = attributesBufferSize(p1)
    local v4 = buffer.create(v3)
    local v5 = 0
    local v6 = {}
    for k, v in pairs(p1) do
        table.insert(v6, {id = tonumber(k) or 0, value = v})
    end
    table.sort(v6, function(p1, p2) -- Line: 58
        local v1 = p1.id < p2.id
        return v1
    end)
    buffer.writeu16(v4, v5, (math.min(#v6, 65535)))
    v5 = v5 + 2
    for i, i2 in ipairs(v6) do
        v1 = math.clamp(i2.id, 0, 65535)
        buffer.writeu16(v4, v5, v1)
        v5 = v5 + 2
        if type(i2.value) ~= "boolean" then
            buffer.writeu8(v4, v5, 0)
            v5 = v5 + 1
            buffer.writef32(v4, v5, i2.value)
            v5 = v5 + 4
        else
            buffer.writeu8(v4, v5, 1)
            v5 = v5 + 1
            if not i2.value then
                v2 = 0
            else
                v2 = 1
            end
            buffer.writeu8(v4, v5, v2)
            v5 = v5 + 1
        end
    end
    return v4
end
local function deserializeAttributes(p1) -- Line: 89
    local v1, v2, v3
    local v4 = {}
    local v5 = 0
    local v6 = buffer.len(p1)
    if v6 < 2 then
        return v4
    end
    v5 = v5 + 2
    local v7 = buffer.readu16(p1, v5)
    local v8 = 1
    local v9 = p1
    for i = 1, v7, v8 do
        if v6 < v5 + 3 then
            break
        end
        v3 = buffer.readu16(v9, v5)
        v5 = v5 + 2
        v5 = v5 + 1
        if buffer.readu8(v9, v5) ~= 1 then
            if v6 < v5 + 4 then
                break
            end
            v1 = tostring(v3)
            v4[v1] = buffer.readf32(v9, v5)
            v5 = v5 + 4
        else
            if v6 < v5 then
                break
            end
            v1 = tostring(v3)
            v2 = buffer.readu8(v9, v5) ~= 0
            v4[v1] = v2
            v5 = v5 + 1
        end
    end
    return v4
end
return {
    compress = function(p1) -- Line: 127 -- upvalues: isAttributesShape (val), serializeAttributes (val)
        local v1, v2
        if p1 == nil then
            return p1
        end
        local __full = p1.__full
        if not __full then
            if not (isAttributesShape(p1)) then
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
        v1, v2 = pcall(serializeAttributes, __full)
        if not v1 or not v2 then
            return p1
        end
        return {__compressed = true, __full = v2}
    end,
    decompress = function(p1) -- Line: 146 -- upvalues: deserializeAttributes (val)
        local v1, v2
        if p1 == nil or not p1.__compressed then
            return p1
        end
        local __full = p1.__full
        if typeof(__full) ~= "buffer" then
            return p1
        end
        v1, v2 = pcall(deserializeAttributes, __full)
        if not v1 or not v2 then
            return p1
        end
        return v2
    end,
}