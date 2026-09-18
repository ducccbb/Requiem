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
--                    File: ReplicatedStorage.Common.Types.Footsteps
--                              Dumped in 0.000675 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function writeI24(p1, p2, p3) -- Line: 76
    local v1 = p3 + 8388608
    buffer.writeu8(p1, p2, (bit32.band(v1, 255)))
    local v2 = bit32.rshift(v1, 8)
    buffer.writeu8(p1, p2 + 1, (bit32.band(v2, 255)))
    v2 = bit32.rshift(v1, 16)
    buffer.writeu8(p1, p2 + 2, (bit32.band(v2, 255)))
end
local function readI24(p1, p2) -- Line: 88
    local v1 = buffer.readu8(p1, p2)
    local v2 = buffer.readu8(p1, p2 + 1)
    return v1 + v2 * 256 + buffer.readu8(p1, p2 + 2) * 65536 - 8388608
end
local function encodeAxis(p1) -- Line: 100
    local v1 = math.round(p1 * 4)
    return (math.clamp(v1, -8388608, 8388607))
end
local function decodeAxis(p1) -- Line: 109
    return p1 * 0.25
end
local function writeFootstep(p1, p2, p3, p4, p5, p6) -- Line: 127 -- upvalues: writeI24 (val), encodeAxis (val)
    writeI24(p1, p2 + 0, encodeAxis(p3.X))
    writeI24(p1, p2 + 3, encodeAxis(p3.Y))
    writeI24(p1, p2 + 6, encodeAxis(p3.Z))
    buffer.writef32(p1, p2 + 9, p4)
    buffer.writeu32(p1, p2 + 13, p5)
    buffer.writeu32(p1, p2 + 17, p6)
end
local function readFootstep(p1, p2) -- Line: 149 -- upvalues: decodeAxis (val), readI24 (val)
    local v1 = {id = buffer.readu32(p1, p2 + 13), nextId = buffer.readu32(p1, p2 + 17)}
    local v2 = decodeAxis(readI24(p1, p2 + 0))
    local v3 = decodeAxis(readI24(p1, p2 + 3))
    v1.position = Vector3.new(v2, v3, decodeAxis(readI24(p1, p2 + 6)))
    v1.time = buffer.readf32(p1, p2 + 9)
    return v1
end
return {
    RECORD_SIZE = 21,
    NO_ID = 0,
    OFFSET_X = 0,
    OFFSET_Y = 3,
    OFFSET_Z = 6,
    OFFSET_INSERT_TIME = 9,
    OFFSET_ID = 13,
    OFFSET_NEXT_ID = 17,
    POSITION_PRECISION = 0.25,
    POSITION_SCALE = 4,
    POSITION_BIAS = 8388608,
    POSITION_MIN_ENCODED = -8388608,
    POSITION_MAX_ENCODED = 8388607,
    writeI24 = writeI24,
    readI24 = readI24,
    encodeAxis = encodeAxis,
    decodeAxis = decodeAxis,
    writeFootstep = writeFootstep,
    readFootstep = readFootstep,
    decodeFootstepBuffer = function(p1) -- Line: 168 -- upvalues: readFootstep (val)
        local v1 = buffer.len(p1) // 21
        local v2 = table.create(v1)
        local v3 = v1 - 1
        local v4 = 1
        for i = 0, v3, v4 do
            v2[i + 1] = readFootstep(p1, i * 21)
        end
        return v2
    end,
    encodeFootstepArray = function(p1) -- Line: 187 -- upvalues: writeFootstep (val)
        local v1 = buffer.create(#p1 * 21)
        local v2 = p1
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            writeFootstep(v1, (i - 1) * 21, j.position, j.time, j.id, j.nextId)
        end
        return v1
    end,
}