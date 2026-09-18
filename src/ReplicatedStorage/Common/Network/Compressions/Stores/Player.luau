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
--           File: ReplicatedStorage.Common.Network.Compressions.Stores.Player
--                               Dumped in 0.00124 seconds
--                          Bytecode version 9  |  12 functions

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
local function playerByteSize(p1) -- Line: 51
    local v1 = #tostring(p1.username or "") + 2 + 2
    local v2 = v1 + #tostring(p1.name or "") + 2
    local v3 = v2 + #tostring(p1.display or "") + 4 + 1 + 1 + 1 + 1 + 2
    local v4 = v3 + #tostring(p1.emote or "") + 1 + 1 + 1 + 2
    return v4 + #tostring(p1.tier or "")
end
local function serializePlayer(p1, p2, p3) -- Line: 78 -- upvalues: writeLengthPrefixedString (val)
    local v1 = writeLengthPrefixedString(p1, p2, p3.username or "")
    v1 = writeLengthPrefixedString(p1, v1, p3.name or "")
    v1 = writeLengthPrefixedString(p1, v1, p3.display or "")
    buffer.writei32(p1, v1, p3.userid or 0)
    v1 = v1 + 4
    buffer.writei8(p1, v1, (p3.branch or 0) % 256)
    v1 = v1 + 1
    buffer.writei8(p1, v1, (p3.rank or 0) % 256)
    v1 = v1 + 1
    buffer.writei8(p1, v1, (p3.status or 0) % 256)
    v1 = v1 + 1
    buffer.writei8(p1, v1, (p3.mia or 0) % 256)
    v1 = writeLengthPrefixedString(p1, v1 + 1, p3.emote or "")
    buffer.writei8(p1, v1, (p3.supporter or 0) % 256)
    v1 = v1 + 1
    buffer.writei8(p1, v1, (p3.tester or 0) % 256)
    v1 = v1 + 1
    buffer.writei8(p1, v1, (p3.sponsor or 0) % 256)
    return (writeLengthPrefixedString(p1, v1 + 1, p3.tier or ""))
end
local function deserializePlayer(p1, p2) -- Line: 109 -- upvalues: readLengthPrefixedString (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    v3, v4 = readLengthPrefixedString(p1, p2)
    v5, v6 = readLengthPrefixedString(p1, v4)
    v7, v8 = readLengthPrefixedString(p1, v6)
    local v9 = v8
    local v10 = buffer.readi32(p1, v9)
    v9 = v9 + 4
    local v11 = buffer.readi8(p1, v9)
    v9 = v9 + 1
    local v12 = buffer.readi8(p1, v9)
    v9 = v9 + 1
    local v13 = buffer.readi8(p1, v9)
    v9 = v9 + 1
    local v14 = buffer.readi8(p1, v9)
    v1, v2 = readLengthPrefixedString(p1, v9 + 1)
    v9 = v2
    local v15 = buffer.readi8(p1, v9)
    v9 = v9 + 1
    local v16 = buffer.readi8(p1, v9)
    v9 = v9 + 1
    local v17 = buffer.readi8(p1, v9)
    v9 = v9 + 1
    local v18 = "None"
    if v9 < buffer.len(p1) then
        local v19, v20, v21
        v19, v20 = readLengthPrefixedString(p1, v9)
        if v19 == "" then
            v21 = "None"
        else
            v21 = v19
            if not v21 then
                v21 = "None"
            end
        end
        v18 = v21
        v9 = v20
    end
    return {
        username = v3,
        name = v5,
        display = v7,
        userid = v10,
        branch = v11,
        rank = v12,
        status = v13,
        mia = v14,
        emote = v1,
        supporter = v15,
        tester = v16,
        sponsor = v17,
        tier = v18,
    }, v9
end
local function profileByteSize(p1) -- Line: 162 -- upvalues: playerByteSize (val)
    local v1 = 2
    local players = p1.players
    if not players then
        players = {}
    end
    for i, v in ipairs(players) do
        v1 = v1 + playerByteSize(v)
    end
    local client = p1.client
    if not client then
        client = {}
    end
    return v1 + playerByteSize(client)
end
local function serializeProfile(p1) -- Line: 176 -- upvalues: profileByteSize (val), serializePlayer (val)
    local v1 = profileByteSize(p1)
    local v2 = buffer.create(v1)
    local v3 = 0
    local players = p1.players
    if not players then
        players = {}
    end
    buffer.writeu16(v2, v3, (math.min(#players, 65535)))
    v3 = v3 + 2
    for i, v in ipairs(players) do
        v3 = serializePlayer(v2, v3, v)
    end
    local client = p1.client
    if not client then
        client = {}
    end
    return v2
end
local function deserializeProfile(p1) -- Line: 194 -- upvalues: deserializePlayer (val)
    local v1, v2
    local v3 = 0
    local v4 = buffer.len(p1)
    if v4 < 2 then
        return {players = {}, client = {}}
    end
    local v5 = buffer.readu16(p1, v3)
    v3 = v3 + 2
    local v6 = {}
    local v7 = v5
    local v8 = 1
    for i = 1, v7, v8 do
        if v4 <= v3 then
            break
        end
        v1, v2 = deserializePlayer(p1, v3)
        v3 = v2
        table.insert(v6, v1)
    end
    v7 = {}
    if v3 < v4 then
        v8 = deserializePlayer(p1, v3)
        v7 = v8
    end
    return {players = v6, client = v7}
end
local function isProfileShape(p1) -- Line: 228
    local v1 = if type(p1) == "table" then if p1.players == nil then p1.client ~= nil else true else false
    return v1
end
return {
    compress = function(p1) -- Line: 236 -- upvalues: isProfileShape (val), serializeProfile (val)
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
    decompress = function(p1) -- Line: 256 -- upvalues: deserializeProfile (val)
        local v1, v2
        if p1 == nil or not p1.__compressed then
            return p1
        end
        local __full = p1.__full
        if typeof(__full) ~= "buffer" then
            return {players = {}, client = {}}
        end
        v1, v2 = pcall(deserializeProfile, __full)
        if not v1 or not v2 then
            return {players = {}, client = {}}
        end
        return v2
    end,
}