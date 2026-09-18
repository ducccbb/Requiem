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
--       File: ReplicatedStorage.Common.Network.Compressions.Stores.Administration
--                               Dumped in 0.00114 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function profileBufferSize(p1) -- Line: 14
    local arguments, v1, v2, v3
    local v4 = 4
    local commands = p1.commands
    if not commands then
        commands = {}
    end
    for i, v in ipairs(commands) do
        v3 = tostring(v.name or "")
        v4 = v4 + (#v3 + 2 + 2 + #tostring(v.description or "") + 1)
        arguments = v.arguments
        if not arguments then
            arguments = {}
        end
        for i2, i3 in ipairs(arguments) do
            v1 = tostring(i3.name or "")
            v2 = tostring(i3.description or "")
            v4 = v4 + (#v1 + 2 + 2 + #v2 + 2 + #tostring(i3.path or ""))
        end
    end
    return v4
end
local function serializeProfile(p1) -- Line: 36 -- upvalues: profileBufferSize (val)
    local arguments, v1, v2, v3, v4, v5, v6, v7
    local v8 = profileBufferSize(p1)
    local v9 = buffer.create(v8)
    local v10 = 0
    buffer.writeu8(v9, v10, (p1.permission or 0) % 256)
    v10 = v10 + 1
    buffer.writeu8(v9, v10, (p1.staffSlot or 0) % 256)
    v10 = v10 + 1
    local commands = p1.commands
    if not commands then
        commands = {}
    end
    buffer.writeu16(v9, v10, (math.min(#commands, 65535)))
    v10 = v10 + 2
    for i, v in ipairs(commands) do
        v1 = tostring(v.name or "")
        v2 = tostring(v.description or "")
        buffer.writeu16(v9, v10, (math.min(#v1, 65535)))
        v10 = v10 + 2
        if 0 < #v1 then
            v3 = buffer.fromstring(v1)
            buffer.copy(v9, v10, v3, 0, #v1)
            v10 = v10 + #v1
        end
        buffer.writeu16(v9, v10, (math.min(#v2, 65535)))
        v10 = v10 + 2
        if 0 < #v2 then
            v3 = buffer.fromstring(v2)
            buffer.copy(v9, v10, v3, 0, #v2)
            v10 = v10 + #v2
        end
        arguments = v.arguments
        if not arguments then
            arguments = {}
        end
        buffer.writeu8(v9, v10, (math.min(#arguments, 255)))
        v10 = v10 + 1
        for i2, i3 in ipairs(arguments) do
            v4 = tostring(i3.name or "")
            v5 = tostring(i3.description or "")
            v6 = tostring(i3.path or "")
            buffer.writeu16(v9, v10, (math.min(#v4, 65535)))
            v10 = v10 + 2
            if 0 < #v4 then
                v7 = buffer.fromstring(v4)
                buffer.copy(v9, v10, v7, 0, #v4)
                v10 = v10 + #v4
            end
            buffer.writeu16(v9, v10, (math.min(#v5, 65535)))
            v10 = v10 + 2
            if 0 < #v5 then
                v7 = buffer.fromstring(v5)
                buffer.copy(v9, v10, v7, 0, #v5)
                v10 = v10 + #v5
            end
            buffer.writeu16(v9, v10, (math.min(#v6, 65535)))
            v10 = v10 + 2
            if 0 < #v6 then
                v7 = buffer.fromstring(v6)
                buffer.copy(v9, v10, v7, 0, #v6)
                v10 = v10 + #v6
            end
        end
    end
    return v9
end
local function readLengthPrefixedString(p1, p2) -- Line: 113
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
local function deserializeProfile(p1) -- Line: 129 -- upvalues: readLengthPrefixedString (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14
    local v15 = 0
    local v16 = buffer.readu8(p1, v15)
    v15 = v15 + 1
    local v17 = buffer.readu8(p1, v15)
    v15 = v15 + 1
    local v18 = buffer.readu16(p1, v15)
    v15 = v15 + 2
    local v19 = {}
    local v20 = v18
    local v21 = 1
    local v22 = p1
    for i = 1, v20, v21 do
        v14, v1 = readLengthPrefixedString(v22, v15)
        v2, v3 = readLengthPrefixedString(v22, v1)
        v15 = v3
        v4 = buffer.readu8(v22, v15)
        v15 = v15 + 1
        v5 = {}
        v6 = v4
        v7 = 1
        for j = 1, v6, v7 do
            v8, v9 = readLengthPrefixedString(v22, v15)
            v10, v11 = readLengthPrefixedString(v22, v9)
            v12, v13 = readLengthPrefixedString(v22, v11)
            v15 = v13
            table.insert(v5, {name = v8, description = v10, path = v12})
        end
        table.insert(v19, {name = v14, description = v2, arguments = v5})
    end
    return {commands = v19, permission = v16, staffSlot = v17}
end
local function isProfileShape(p1) -- Line: 171
    local v1 = if type(p1) == "table" then if p1.commands == nil then if p1.permission == nil then p1.staffSlot ~= nil else true else true else false
    return v1
end
return {
    compress = function(p1) -- Line: 179 -- upvalues: isProfileShape (val), serializeProfile (val)
        local v1, v2
        if p1 == nil then
            return p1
        end
        local __full = p1.__full
        if not __full then
            if not (isProfileShape(p1)) then
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
        v1, v2 = pcall(serializeProfile, __full)
        if not v1 or not v2 then
            return p1
        end
        return {__compressed = true, __full = v2}
    end,
    decompress = function(p1) -- Line: 198 -- upvalues: deserializeProfile (val)
        local v1, v2
        if p1 == nil or not p1.__compressed then
            return p1
        end
        local __full = p1.__full
        if typeof(__full) ~= "buffer" then
            return p1
        end
        v1, v2 = pcall(deserializeProfile, __full)
        if not v1 or not v2 then
            return p1
        end
        return v2
    end,
}