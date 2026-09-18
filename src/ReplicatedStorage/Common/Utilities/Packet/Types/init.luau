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
--                 File: ReplicatedStorage.Common.Utilities.Packet.Types
--                               Dumped in 0.00707 seconds
--                         Bytecode version 9  |  177 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local v3 = {}
local v4 = {}
local v5 = {}
local u21 = {}
local u22 = {}
local function Allocate(p1) -- Line: 51 -- upvalues: u15 (ref), u14 (ref), u13 (ref), u12 (ref)
    local v1 = u15 + p1
    if u14 < v1 then
        while u14 < v1 do
            u14 = u14 * 2
        end
        local v2 = buffer.create(u14)
        buffer.copy(v2, 0, u13, 0, u15)
        u12.Buffer = v2
        u13 = v2
    end
end
local function ReadS8() -- Line: 64 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readi8(u13, u15)
    u15 = u15 + 1
    return v1
end
local function WriteS8(p1) -- Line: 69 -- upvalues: u13 (ref), u15 (ref)
    buffer.writei8(u13, u15, p1)
    u15 = u15 + 1
end
local function ReadS16() -- Line: 73 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readi16(u13, u15)
    u15 = u15 + 2
    return v1
end
local function WriteS16(p1) -- Line: 78 -- upvalues: u13 (ref), u15 (ref)
    buffer.writei16(u13, u15, p1)
    u15 = u15 + 2
end
local function ReadS24() -- Line: 82 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readbits(u13, u15 * 8, 24) - 8388608
    u15 = u15 + 3
    return v1
end
local function WriteS24(p1) -- Line: 87 -- upvalues: u13 (ref), u15 (ref)
    buffer.writebits(u13, u15 * 8, 24, p1 + 8388608)
    u15 = u15 + 3
end
local function ReadS32() -- Line: 91 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readi32(u13, u15)
    u15 = u15 + 4
    return v1
end
local function WriteS32(p1) -- Line: 96 -- upvalues: u13 (ref), u15 (ref)
    buffer.writei32(u13, u15, p1)
    u15 = u15 + 4
end
local function ReadU8() -- Line: 100 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readu8(u13, u15)
    u15 = u15 + 1
    return v1
end
local function WriteU8(p1) -- Line: 105 -- upvalues: u13 (ref), u15 (ref)
    buffer.writeu8(u13, u15, p1)
    u15 = u15 + 1
end
local function ReadU16() -- Line: 109 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readu16(u13, u15)
    u15 = u15 + 2
    return v1
end
local function WriteU16(p1) -- Line: 114 -- upvalues: u13 (ref), u15 (ref)
    buffer.writeu16(u13, u15, p1)
    u15 = u15 + 2
end
local function ReadU24() -- Line: 118 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readbits(u13, u15 * 8, 24)
    u15 = u15 + 3
    return v1
end
local function WriteU24(p1) -- Line: 123 -- upvalues: u13 (ref), u15 (ref)
    buffer.writebits(u13, u15 * 8, 24, p1)
    u15 = u15 + 3
end
local function ReadU32() -- Line: 127 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readu32(u13, u15)
    u15 = u15 + 4
    return v1
end
local function WriteU32(p1) -- Line: 132 -- upvalues: u13 (ref), u15 (ref)
    buffer.writeu32(u13, u15, p1)
    u15 = u15 + 4
end
local function ReadF32() -- Line: 136 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readf32(u13, u15)
    u15 = u15 + 4
    return v1
end
local function WriteF32(p1) -- Line: 141 -- upvalues: u13 (ref), u15 (ref)
    buffer.writef32(u13, u15, p1)
    u15 = u15 + 4
end
local function ReadF64() -- Line: 145 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readf64(u13, u15)
    u15 = u15 + 8
    return v1
end
local function WriteF64(p1) -- Line: 150 -- upvalues: u13 (ref), u15 (ref)
    buffer.writef64(u13, u15, p1)
    u15 = u15 + 8
end
local function ReadString(p1) -- Line: 154 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.readstring(u13, u15, p1)
    u15 = u15 + p1
    return v1
end
local function WriteString(p1) -- Line: 159 -- upvalues: u13 (ref), u15 (ref)
    buffer.writestring(u13, u15, p1)
    u15 = u15 + #p1
end
local function ReadBuffer(p1) -- Line: 163 -- upvalues: u13 (ref), u15 (ref)
    local v1 = buffer.create(p1)
    buffer.copy(v1, 0, u13, u15, p1)
    u15 = u15 + p1
    return v1
end
local function WriteBuffer(p1) -- Line: 169 -- upvalues: u13 (ref), u15 (ref)
    buffer.copy(u13, u15, p1)
    u15 = u15 + buffer.len(p1)
end
local function ReadInstance() -- Line: 173 -- upvalues: u17 (ref), u16 (ref)
    u17 = u17 + 1
    return u16[u17]
end
local function WriteInstance(p1) -- Line: 177 -- upvalues: u17 (ref), u16 (ref)
    u17 = u17 + 1
    u16[u17] = p1
end
local function ReadF16() -- Line: 182 -- upvalues: u15 (ref), u13 (ref)
    local v1 = u15 * 8
    u15 = u15 + 2
    local v2 = buffer.readbits(u13, v1 + 0, 10)
    local v3 = buffer.readbits(u13, v1 + 10, 5)
    local v4 = buffer.readbits(u13, v1 + 15, 1)
    if v2 ~= 0 then
        if v3 == 31 then
            return (0 / 0)
        end
        if v4 == 0 then
            return (v2 / 1024 + 1) * 2 ^ (v3 - 15)
        end
        return -(v2 / 1024 + 1) * 2 ^ (v3 - 15)
    end
    if v3 == 0 then
        return 0
    end
    if v3 == 31 then
        if v4 == 0 then
            return math.huge
        end
        return -math.huge
    end
    if v4 == 0 then
        return (v2 / 1024 + 1) * 2 ^ (v3 - 15)
    end
    return -(v2 / 1024 + 1) * 2 ^ (v3 - 15)
end
local function WriteF16(p1) -- Line: 204 -- upvalues: u15 (ref), u13 (ref)
    local v1, v2, v3
    local v4 = u15 * 8
    u15 = u15 + 2
    if p1 == 0 then
        buffer.writebits(u13, v4, 16, 0)
        return
    end
    if 65520 <= p1 then
        buffer.writebits(u13, v4, 16, 31744)
        return
    end
    if p1 <= -65520 then
        buffer.writebits(u13, v4, 16, 64512)
        return
    end
    if p1 ~= p1 then
        buffer.writebits(u13, v4, 16, 31745)
        return
    end
    local v5 = 0
    if p1 >= 0 then
        v1 = p1
    else
        v5 = 1
        v1 = -p1
    end
    v2, v3 = math.frexp(v1)
    buffer.writebits(u13, v4 + 0, 10, v2 * 2048 - 1023.5)
    buffer.writebits(u13, v4 + 10, 5, v3 + 14)
    buffer.writebits(u13, v4 + 15, 1, v5)
end
local function ReadF24() -- Line: 228 -- upvalues: u15 (ref), u13 (ref)
    local v1 = u15 * 8
    u15 = u15 + 3
    local v2 = buffer.readbits(u13, v1 + 0, 17)
    local v3 = buffer.readbits(u13, v1 + 17, 6)
    local v4 = buffer.readbits(u13, v1 + 23, 1)
    if v2 ~= 0 then
        if v3 == 63 then
            return (0 / 0)
        end
        if v4 == 0 then
            return (v2 / 131072 + 1) * 2 ^ (v3 - 31)
        end
        return -(v2 / 131072 + 1) * 2 ^ (v3 - 31)
    end
    if v3 == 0 then
        return 0
    end
    if v3 == 63 then
        if v4 == 0 then
            return math.huge
        end
        return -math.huge
    end
    if v4 == 0 then
        return (v2 / 131072 + 1) * 2 ^ (v3 - 31)
    end
    return -(v2 / 131072 + 1) * 2 ^ (v3 - 31)
end
local function WriteF24(p1) -- Line: 250 -- upvalues: u15 (ref), u13 (ref)
    local v1, v2, v3
    local v4 = u15 * 8
    u15 = u15 + 3
    if p1 == 0 then
        buffer.writebits(u13, v4, 24, 0)
        return
    end
    if 4294959104 <= p1 then
        buffer.writebits(u13, v4, 24, 8257536)
        return
    end
    if p1 <= -4294959104 then
        buffer.writebits(u13, v4, 24, 16646144)
        return
    end
    if p1 ~= p1 then
        buffer.writebits(u13, v4, 24, 8257537)
        return
    end
    local v5 = 0
    if p1 >= 0 then
        v1 = p1
    else
        v5 = 1
        v1 = -p1
    end
    v2, v3 = math.frexp(v1)
    buffer.writebits(u13, v4 + 0, 17, v2 * 262144 - 131071.5)
    buffer.writebits(u13, v4 + 17, 6, v3 + 30)
    buffer.writebits(u13, v4 + 23, 1, v5)
end
v3.Any = "Any"
function v4.Any() -- Line: 276 -- upvalues: u21 (val), ReadU8 (val)
    return u21[ReadU8()]()
end
function v5.Any(p1) -- Line: 279 -- upvalues: u22 (val)
    local v1 = u22[typeof(p1)]
    v1(p1)
end
v3.Nil = "Nil"
function v4.Nil() -- Line: 284
    return nil
end
function v5.Nil(p1) end
v3.NumberS8 = "NumberS8"
function v4.NumberS8() -- Line: 290 -- upvalues: ReadS8 (val)
    return ReadS8()
end
function v5.NumberS8(p1) -- Line: 293 -- upvalues: Allocate (val), WriteS8 (val)
    Allocate(1)
    WriteS8(p1)
end
v3.NumberS16 = "NumberS16"
function v4.NumberS16() -- Line: 299 -- upvalues: ReadS16 (val)
    return ReadS16()
end
function v5.NumberS16(p1) -- Line: 302 -- upvalues: Allocate (val), WriteS16 (val)
    Allocate(2)
    WriteS16(p1)
end
v3.NumberS24 = "NumberS24"
function v4.NumberS24() -- Line: 308 -- upvalues: ReadS24 (val)
    return ReadS24()
end
function v5.NumberS24(p1) -- Line: 311 -- upvalues: Allocate (val), WriteS24 (val)
    Allocate(3)
    WriteS24(p1)
end
v3.NumberS32 = "NumberS32"
function v4.NumberS32() -- Line: 317 -- upvalues: ReadS32 (val)
    return ReadS32()
end
function v5.NumberS32(p1) -- Line: 320 -- upvalues: Allocate (val), WriteS32 (val)
    Allocate(4)
    WriteS32(p1)
end
v3.NumberU8 = "NumberU8"
function v4.NumberU8() -- Line: 326 -- upvalues: ReadU8 (val)
    return ReadU8()
end
function v5.NumberU8(p1) -- Line: 329 -- upvalues: Allocate (val), WriteU8 (val)
    Allocate(1)
    WriteU8(p1)
end
v3.NumberU16 = "NumberU16"
function v4.NumberU16() -- Line: 335 -- upvalues: ReadU16 (val)
    return ReadU16()
end
function v5.NumberU16(p1) -- Line: 338 -- upvalues: Allocate (val), WriteU16 (val)
    Allocate(2)
    WriteU16(p1)
end
v3.NumberU24 = "NumberU24"
function v4.NumberU24() -- Line: 344 -- upvalues: ReadU24 (val)
    return ReadU24()
end
function v5.NumberU24(p1) -- Line: 347 -- upvalues: Allocate (val), WriteU24 (val)
    Allocate(3)
    WriteU24(p1)
end
v3.NumberU32 = "NumberU32"
function v4.NumberU32() -- Line: 353 -- upvalues: ReadU32 (val)
    return ReadU32()
end
function v5.NumberU32(p1) -- Line: 356 -- upvalues: Allocate (val), WriteU32 (val)
    Allocate(4)
    WriteU32(p1)
end
v3.NumberF16 = "NumberF16"
function v4.NumberF16() -- Line: 362 -- upvalues: ReadF16 (val)
    return ReadF16()
end
function v5.NumberF16(p1) -- Line: 365 -- upvalues: Allocate (val), WriteF16 (val)
    Allocate(2)
    WriteF16(p1)
end
v3.NumberF24 = "NumberF24"
function v4.NumberF24() -- Line: 371 -- upvalues: ReadF24 (val)
    return ReadF24()
end
function v5.NumberF24(p1) -- Line: 374 -- upvalues: Allocate (val), WriteF24 (val)
    Allocate(3)
    WriteF24(p1)
end
v3.NumberF32 = "NumberF32"
function v4.NumberF32() -- Line: 380 -- upvalues: ReadF32 (val)
    return ReadF32()
end
function v5.NumberF32(p1) -- Line: 383 -- upvalues: Allocate (val), WriteF32 (val)
    Allocate(4)
    WriteF32(p1)
end
v3.NumberF64 = "NumberF64"
function v4.NumberF64() -- Line: 389 -- upvalues: ReadF64 (val)
    return ReadF64()
end
function v5.NumberF64(p1) -- Line: 392 -- upvalues: Allocate (val), WriteF64 (val)
    Allocate(8)
    WriteF64(p1)
end
v3.String = "String"
function v4.String() -- Line: 398 -- upvalues: ReadString (val), ReadU8 (val)
    return ReadString(ReadU8())
end
function v5.String(p1) -- Line: 401 -- upvalues: Allocate (val), WriteU8 (val), WriteString (val)
    local v1 = #p1
    Allocate(v1 + 1)
    WriteU8(v1)
    WriteString(p1)
end
v3.StringLong = "StringLong"
function v4.StringLong() -- Line: 409 -- upvalues: ReadString (val), ReadU16 (val)
    return ReadString(ReadU16())
end
function v5.StringLong(p1) -- Line: 412 -- upvalues: Allocate (val), WriteU16 (val), WriteString (val)
    local v1 = #p1
    Allocate(v1 + 2)
    WriteU16(v1)
    WriteString(p1)
end
v3.Buffer = "Buffer"
function v4.Buffer() -- Line: 420 -- upvalues: ReadBuffer (val), ReadU8 (val)
    return ReadBuffer(ReadU8())
end
function v5.Buffer(p1) -- Line: 423 -- upvalues: Allocate (val), WriteU8 (val), WriteBuffer (val)
    local v1 = buffer.len(p1)
    Allocate(1 + v1)
    WriteU8(v1)
    WriteBuffer(p1)
end
v3.BufferLong = "BufferLong"
function v4.BufferLong() -- Line: 431 -- upvalues: ReadBuffer (val), ReadU16 (val)
    return ReadBuffer(ReadU16())
end
function v5.BufferLong(p1) -- Line: 434 -- upvalues: Allocate (val), WriteU16 (val), WriteBuffer (val)
    local v1 = buffer.len(p1)
    Allocate(2 + v1)
    WriteU16(v1)
    WriteBuffer(p1)
end
v3.Instance = "Instance"
function v4.Instance() -- Line: 442 -- upvalues: ReadInstance (val)
    return ReadInstance()
end
function v5.Instance(p1) -- Line: 445 -- upvalues: WriteInstance (val)
    WriteInstance(p1)
end
v3.Boolean8 = "Boolean8"
function v4.Boolean8() -- Line: 450 -- upvalues: ReadU8 (val)
    local v1 = ReadU8() == 1
    return v1
end
function v5.Boolean8(p1) -- Line: 453 -- upvalues: Allocate (val), WriteU8 (val)
    local v1
    Allocate(1)
    if not p1 then
        v1 = 0
    else
        v1 = 1
    end
    WriteU8(v1)
end
v3.NumberRange = "NumberRange"
function v4.NumberRange() -- Line: 459 -- upvalues: ReadF32 (val)
    return NumberRange.new(ReadF32(), ReadF32())
end
function v5.NumberRange(p1) -- Line: 462 -- upvalues: Allocate (val), WriteF32 (val)
    Allocate(8)
    WriteF32(p1.Min)
    WriteF32(p1.Max)
end
v3.BrickColor = "BrickColor"
function v4.BrickColor() -- Line: 469 -- upvalues: ReadU16 (val)
    return BrickColor.new(ReadU16())
end
function v5.BrickColor(p1) -- Line: 472 -- upvalues: Allocate (val), WriteU16 (val)
    Allocate(2)
    WriteU16(p1.Number)
end
v3.Color3 = "Color3"
function v4.Color3() -- Line: 478 -- upvalues: ReadU8 (val)
    return Color3.fromRGB(ReadU8(), ReadU8(), ReadU8())
end
function v5.Color3(p1) -- Line: 481 -- upvalues: Allocate (val), WriteU8 (val)
    Allocate(3)
    WriteU8(p1.R * 255 + 0.5)
    WriteU8(p1.G * 255 + 0.5)
    WriteU8(p1.B * 255 + 0.5)
end
v3.UDim = "UDim"
function v4.UDim() -- Line: 489 -- upvalues: ReadS16 (val)
    local v1 = ReadS16() / 1000
    return UDim.new(v1, ReadS16())
end
function v5.UDim(p1) -- Line: 492 -- upvalues: Allocate (val), WriteS16 (val)
    Allocate(4)
    WriteS16(p1.Scale * 1000)
    WriteS16(p1.Offset)
end
v3.UDim2 = "UDim2"
function v4.UDim2() -- Line: 499 -- upvalues: ReadS16 (val)
    local v1 = ReadS16() / 1000
    local v2 = ReadS16() / 1000
    return UDim2.new(v1, ReadS16(), v2, ReadS16())
end
function v5.UDim2(p1) -- Line: 502 -- upvalues: Allocate (val), WriteS16 (val)
    Allocate(8)
    WriteS16(p1.X.Scale * 1000)
    WriteS16(p1.X.Offset)
    WriteS16(p1.Y.Scale * 1000)
    WriteS16(p1.Y.Offset)
end
v3.Rect = "Rect"
function v4.Rect() -- Line: 511 -- upvalues: ReadF32 (val)
    return Rect.new(ReadF32(), ReadF32(), ReadF32(), ReadF32())
end
function v5.Rect(p1) -- Line: 514 -- upvalues: Allocate (val), WriteF32 (val)
    Allocate(16)
    WriteF32(p1.Min.X)
    WriteF32(p1.Min.Y)
    WriteF32(p1.Max.X)
    WriteF32(p1.Max.Y)
end
v3.Vector2S16 = "Vector2S16"
function v4.Vector2S16() -- Line: 523 -- upvalues: ReadS16 (val)
    return Vector2.new(ReadS16(), ReadS16())
end
function v5.Vector2S16(p1) -- Line: 526 -- upvalues: Allocate (val), WriteS16 (val)
    Allocate(4)
    WriteS16(p1.X)
    WriteS16(p1.Y)
end
v3.Vector2F24 = "Vector2F24"
function v4.Vector2F24() -- Line: 533 -- upvalues: ReadF24 (val)
    return Vector2.new(ReadF24(), ReadF24())
end
function v5.Vector2F24(p1) -- Line: 536 -- upvalues: Allocate (val), WriteF24 (val)
    Allocate(6)
    WriteF24(p1.X)
    WriteF24(p1.Y)
end
v3.Vector2F32 = "Vector2F32"
function v4.Vector2F32() -- Line: 543 -- upvalues: ReadF32 (val)
    return Vector2.new(ReadF32(), ReadF32())
end
function v5.Vector2F32(p1) -- Line: 546 -- upvalues: Allocate (val), WriteF32 (val)
    Allocate(8)
    WriteF32(p1.X)
    WriteF32(p1.Y)
end
v3.Vector3S16 = "Vector3S16"
function v4.Vector3S16() -- Line: 553 -- upvalues: ReadS16 (val)
    return (Vector3.new(ReadS16(), ReadS16(), ReadS16()))
end
function v5.Vector3S16(p1) -- Line: 556 -- upvalues: Allocate (val), WriteS16 (val)
    Allocate(6)
    WriteS16(p1.X)
    WriteS16(p1.Y)
    WriteS16(p1.Z)
end
v3.Vector3F24 = "Vector3F24"
function v4.Vector3F24() -- Line: 564 -- upvalues: ReadF24 (val)
    return (Vector3.new(ReadF24(), ReadF24(), ReadF24()))
end
function v5.Vector3F24(p1) -- Line: 567 -- upvalues: Allocate (val), WriteF24 (val)
    Allocate(9)
    WriteF24(p1.X)
    WriteF24(p1.Y)
    WriteF24(p1.Z)
end
v3.Vector3F32 = "Vector3F32"
function v4.Vector3F32() -- Line: 575 -- upvalues: ReadF32 (val)
    return (Vector3.new(ReadF32(), ReadF32(), ReadF32()))
end
function v5.Vector3F32(p1) -- Line: 578 -- upvalues: Allocate (val), WriteF32 (val)
    Allocate(12)
    WriteF32(p1.X)
    WriteF32(p1.Y)
    WriteF32(p1.Z)
end
v3.NumberU4 = "NumberU4"
function v4.NumberU4() -- Line: 586 -- upvalues: u15 (ref), u13 (ref)
    local v1 = u15 * 8
    u15 = u15 + 1
    local v2 = {}
    local v3 = buffer.readbits(u13, v1 + 0, 4)
    v2[1] = v3
    v2[2] = buffer.readbits(u13, v1 + 4, 4)
    return v2
end
function v5.NumberU4(p1) -- Line: 594 -- upvalues: Allocate (val), u15 (ref), u13 (ref)
    Allocate(1)
    local v1 = u15 * 8
    u15 = u15 + 1
    buffer.writebits(u13, v1 + 0, 4, p1[1])
    buffer.writebits(u13, v1 + 4, 4, p1[2])
end
v3.BooleanNumber = "BooleanNumber"
function v4.BooleanNumber() -- Line: 603 -- upvalues: u15 (ref), u13 (ref)
    local v1 = u15 * 8
    u15 = u15 + 1
    local v2 = {}
    local v3 = buffer.readbits(u13, v1 + 0, 1) == 1
    v2.Boolean = v3
    v2.Number = buffer.readbits(u13, v1 + 1, 7)
    return v2
end
function v5.BooleanNumber(p1) -- Line: 611 -- upvalues: Allocate (val), u15 (ref), u13 (ref)
    local v1
    Allocate(1)
    local v2 = u15 * 8
    u15 = u15 + 1
    if not p1.Boolean then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 0, 1, v1)
    buffer.writebits(u13, v2 + 1, 7, p1.Number)
end
v3.Boolean1 = "Boolean1"
function v4.Boolean1() -- Line: 620 -- upvalues: u15 (ref), u13 (ref)
    local v1 = u15 * 8
    u15 = u15 + 1
    local v2 = {}
    local v3 = buffer.readbits(u13, v1 + 0, 1) == 1
    local v4 = buffer.readbits(u13, v1 + 1, 1) == 1
    local v5 = buffer.readbits(u13, v1 + 2, 1) == 1
    local v6 = buffer.readbits(u13, v1 + 3, 1) == 1
    local v7 = buffer.readbits(u13, v1 + 4, 1) == 1
    local v8 = buffer.readbits(u13, v1 + 5, 1) == 1
    local v9 = buffer.readbits(u13, v1 + 6, 1) == 1
    local v10 = buffer.readbits(u13, v1 + 7, 1) == 1
    v2[1] = v3
    v2[2] = v4
    v2[3] = v5
    v2[4] = v6
    v2[5] = v7
    v2[6] = v8
    v2[7] = v9
    v2[8] = v10
    return v2
end
function v5.Boolean1(p1) -- Line: 634 -- upvalues: Allocate (val), u15 (ref), u13 (ref)
    local v1
    Allocate(1)
    local v2 = u15 * 8
    u15 = u15 + 1
    if not (p1[1]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 0, 1, v1)
    if not (p1[2]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 1, 1, v1)
    if not (p1[3]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 2, 1, v1)
    if not (p1[4]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 3, 1, v1)
    if not (p1[5]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 4, 1, v1)
    if not (p1[6]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 5, 1, v1)
    if not (p1[7]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 6, 1, v1)
    if not (p1[8]) then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writebits(u13, v2 + 7, 1, v1)
end
v3.CFrameF24U8 = "CFrameF24U8"
function v4.CFrameF24U8() -- Line: 649 -- upvalues: ReadU8 (val), ReadF24 (val)
    local v1 = ReadU8() / 40.58451048843331
    local v2 = ReadU8() / 40.58451048843331
    local v3 = CFrame.fromEulerAnglesXYZ(v1, v2, ReadU8() / 40.58451048843331)
    return v3 + Vector3.new(ReadF24(), ReadF24(), ReadF24())
end
function v5.CFrameF24U8(p1) -- Line: 656 -- upvalues: Allocate (val), WriteU8 (val), WriteF24 (val)
    local v1, v2, v3
    v1, v2, v3 = p1:ToEulerAnglesXYZ()
    Allocate(12)
    WriteU8(v1 * 40.58451048843331 + 0.5)
    WriteU8(v2 * 40.58451048843331 + 0.5)
    WriteU8(v3 * 40.58451048843331 + 0.5)
    WriteF24(p1.X)
    WriteF24(p1.Y)
    WriteF24(p1.Z)
end
v3.CFrameF32U8 = "CFrameF32U8"
function v4.CFrameF32U8() -- Line: 668 -- upvalues: ReadU8 (val), ReadF32 (val)
    local v1 = ReadU8() / 40.58451048843331
    local v2 = ReadU8() / 40.58451048843331
    local v3 = CFrame.fromEulerAnglesXYZ(v1, v2, ReadU8() / 40.58451048843331)
    return v3 + Vector3.new(ReadF32(), ReadF32(), ReadF32())
end
function v5.CFrameF32U8(p1) -- Line: 675 -- upvalues: Allocate (val), WriteU8 (val), WriteF32 (val)
    local v1, v2, v3
    v1, v2, v3 = p1:ToEulerAnglesXYZ()
    Allocate(15)
    WriteU8(v1 * 40.58451048843331 + 0.5)
    WriteU8(v2 * 40.58451048843331 + 0.5)
    WriteU8(v3 * 40.58451048843331 + 0.5)
    WriteF32(p1.X)
    WriteF32(p1.Y)
    WriteF32(p1.Z)
end
v3.CFrameF32U16 = "CFrameF32U16"
function v4.CFrameF32U16() -- Line: 687 -- upvalues: ReadU16 (val), ReadF32 (val)
    local v1 = ReadU16() / 10430.219195527361
    local v2 = ReadU16() / 10430.219195527361
    local v3 = CFrame.fromEulerAnglesXYZ(v1, v2, ReadU16() / 10430.219195527361)
    return v3 + Vector3.new(ReadF32(), ReadF32(), ReadF32())
end
function v5.CFrameF32U16(p1) -- Line: 694 -- upvalues: Allocate (val), WriteU16 (val), WriteF32 (val)
    local v1, v2, v3
    v1, v2, v3 = p1:ToEulerAnglesXYZ()
    Allocate(18)
    WriteU16(v1 * 10430.219195527361 + 0.5)
    WriteU16(v2 * 10430.219195527361 + 0.5)
    WriteU16(v3 * 10430.219195527361 + 0.5)
    WriteF32(p1.X)
    WriteF32(p1.Y)
    WriteF32(p1.Z)
end
v3.Region3 = "Region3"
function v4.Region3() -- Line: 706 -- upvalues: ReadF32 (val)
    local v1 = Vector3.new(ReadF32(), ReadF32(), ReadF32())
    return Region3.new(v1, (Vector3.new(ReadF32(), ReadF32(), ReadF32())))
end
function v5.Region3(p1) -- Line: 709 -- upvalues: Allocate (val), WriteF32 (val)
    local v1 = p1.Size / 2
    local v2 = p1.CFrame.Position - v1
    local v3 = p1.CFrame.Position + v1
    Allocate(24)
    WriteF32(v2.X)
    WriteF32(v2.Y)
    WriteF32(v2.Z)
    WriteF32(v3.X)
    WriteF32(v3.Y)
    WriteF32(v3.Z)
end
v3.NumberSequence = "NumberSequence"
function v4.NumberSequence() -- Line: 723 -- upvalues: ReadU8 (val)
    local v1, v2
    local v3 = ReadU8()
    local v4 = table.create(v3)
    local v5 = v3
    local v6 = 1
    for i = 1, v5, v6 do
        v1 = ReadU8() / 255
        v2 = ReadU8() / 255
        table.insert(v4, NumberSequenceKeypoint.new(v1, v2, ReadU8() / 255))
    end
    return NumberSequence.new(v4)
end
function v5.NumberSequence(p1) -- Line: 731 -- upvalues: Allocate (val), WriteU8 (val)
    local v1 = #p1.Keypoints
    Allocate(v1 * 3 + 1)
    WriteU8(v1)
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        WriteU8(j.Time * 255 + 0.5)
        WriteU8(j.Value * 255 + 0.5)
        WriteU8(j.Envelope * 255 + 0.5)
    end
end
v3.ColorSequence = "ColorSequence"
function v4.ColorSequence() -- Line: 743 -- upvalues: ReadU8 (val)
    local v1
    local v2 = ReadU8()
    local v3 = table.create(v2)
    local v4 = v2
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = ReadU8() / 255
        table.insert(v3, ColorSequenceKeypoint.new(v1, Color3.fromRGB(ReadU8(), ReadU8(), ReadU8())))
    end
    return ColorSequence.new(v3)
end
function v5.ColorSequence(p1) -- Line: 751 -- upvalues: Allocate (val), WriteU8 (val)
    local v1 = #p1.Keypoints
    Allocate(v1 * 4 + 1)
    WriteU8(v1)
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        WriteU8(j.Time * 255 + 0.5)
        WriteU8(j.Value.R * 255 + 0.5)
        WriteU8(j.Value.G * 255 + 0.5)
        WriteU8(j.Value.B * 255 + 0.5)
    end
end
local u177 = {}
local Characters = require(v1.Characters)
local v6 = Characters
local v7 = nil
local v8 = nil
for i, j in v6, v7, v8 do
    u177[j] = i
end
v8 = #Characters + 1
local u198 = math.ceil((math.log(v8, 2)))
local u199 = u198 / 8
v3.Characters = "Characters"
function v4.Characters() -- Line: 771 -- upvalues: ReadU8 (val), u15 (ref), u199 (val), Characters (val), u13 (ref), u198 (val)
    local v1 = ReadU8()
    local v2 = table.create(v1)
    local v3 = u15 * 8
    u15 = u15 + math.ceil(v1 * u199)
    local v4 = v1
    local v5 = 1
    for i = 1, v4, v5 do
        table.insert(v2, Characters[buffer.readbits(u13, v3, u198)])
        v3 = v3 + u198
    end
    return table.concat(v2)
end
function v5.Characters(p1) -- Line: 782 -- upvalues: u199 (val), Allocate (val), WriteU8 (val), u15 (ref), u13 (ref), u198 (val), u177 (val)
    local v1 = #p1
    local v2 = math.ceil(v1 * u199)
    Allocate(v2 + 1)
    WriteU8(v1)
    local v3 = u15 * 8
    local v4 = v1
    local v5 = 1
    for i = 1, v4, v5 do
        buffer.writebits(u13, v3, u198, u177[p1:sub(i, i)])
        v3 = v3 + u198
    end
    u15 = u15 + v2
end
local u212 = {}
local Enums = require(v1.Enums)
local v9 = Enums
local v10 = nil
local v11 = nil
for k, n in v9, v10, v11 do
    u212[n] = k
end
v3.EnumItem = "EnumItem"
function v4.EnumItem() -- Line: 801 -- upvalues: Enums (val), ReadU8 (val), ReadU16 (val)
    local v1 = Enums[ReadU8()]
    return v1:FromValue(ReadU16())
end
function v5.EnumItem(p1) -- Line: 804 -- upvalues: Allocate (val), WriteU8 (val), u212 (val), WriteU16 (val)
    Allocate(3)
    WriteU8(u212[p1.EnumType])
    WriteU16(p1.Value)
end
local u240 = {}
local Static1 = require(v1.Static1)
v11 = Static1
local v12 = nil
local v13 = nil
for m, i5 in v11, v12, v13 do
    u240[i5] = m
end
v3.Static1 = "Static1"
function v4.Static1() -- Line: 816 -- upvalues: Static1 (val), ReadU8 (val)
    return Static1[ReadU8()]
end
function v5.Static1(p1) -- Line: 819 -- upvalues: Allocate (val), WriteU8 (val), u240 (val)
    Allocate(1)
    WriteU8(u240[p1] or 0)
end
local u266 = {}
local Static2 = require(v1.Static2)
v13 = Static2
local v14 = nil
local v15 = nil
for i6, i7 in v13, v14, v15 do
    u266[i7] = i6
end
v3.Static2 = "Static2"
function v4.Static2() -- Line: 830 -- upvalues: Static2 (val), ReadU8 (val)
    return Static2[ReadU8()]
end
function v5.Static2(p1) -- Line: 833 -- upvalues: Allocate (val), WriteU8 (val), u266 (val)
    Allocate(1)
    WriteU8(u266[p1] or 0)
end
local u292 = {}
local Static3 = require(v1.Static3)
v15 = Static3
local v16 = nil
local v17 = nil
for i8, i9 in v15, v16, v17 do
    u292[i9] = i8
end
v3.Static3 = "Static3"
function v4.Static3() -- Line: 844 -- upvalues: Static3 (val), ReadU8 (val)
    return Static3[ReadU8()]
end
function v5.Static3(p1) -- Line: 847 -- upvalues: Allocate (val), WriteU8 (val), u292 (val)
    Allocate(1)
    WriteU8(u292[p1] or 0)
end
u21[0] = function() -- Line: 853
    return nil
end
u22["nil"] = function(p1) -- Line: 856 -- upvalues: Allocate (val), WriteU8 (val)
    Allocate(1)
    WriteU8(0)
end
u21[1] = function() -- Line: 861 -- upvalues: ReadU8 (val)
    return -ReadU8()
end
u21[2] = function() -- Line: 864 -- upvalues: ReadU16 (val)
    return -ReadU16()
end
u21[3] = function() -- Line: 867 -- upvalues: ReadU24 (val)
    return -ReadU24()
end
u21[4] = function() -- Line: 870 -- upvalues: ReadU32 (val)
    return -ReadU32()
end
u21[5] = function() -- Line: 873 -- upvalues: ReadU8 (val)
    return ReadU8()
end
u21[6] = function() -- Line: 876 -- upvalues: ReadU16 (val)
    return ReadU16()
end
u21[7] = function() -- Line: 879 -- upvalues: ReadU24 (val)
    return ReadU24()
end
u21[8] = function() -- Line: 882 -- upvalues: ReadU32 (val)
    return ReadU32()
end
u21[9] = function() -- Line: 885 -- upvalues: ReadF32 (val)
    return ReadF32()
end
u21[10] = function() -- Line: 888 -- upvalues: ReadF64 (val)
    return ReadF64()
end
function u22.number(p1) -- Line: 891 -- upvalues: Allocate (val), WriteU8 (val), WriteU16 (val), WriteU24 (val), WriteU32 (val), WriteF64 (val), WriteF32 (val)
    if p1 % 1 ~= 0 then
        if -1048576 < p1 then
            if p1 < 1048576 then
                Allocate(5)
                WriteU8(9)
                WriteF32(p1)
                return
            end
            Allocate(9)
            WriteU8(10)
            WriteF64(p1)
            return
        end
        Allocate(9)
        WriteU8(10)
        WriteF64(p1)
        return
    end
    if p1 < 0 then
        if -256 < p1 then
            Allocate(2)
            WriteU8(1)
            WriteU8(-p1)
            return
        end
        if -65536 < p1 then
            Allocate(3)
            WriteU8(2)
            WriteU16(-p1)
            return
        end
        if -16777216 < p1 then
            Allocate(4)
            WriteU8(3)
            WriteU24(-p1)
            return
        end
        if -4294967296 < p1 then
            Allocate(5)
            WriteU8(4)
            WriteU32(-p1)
            return
        end
        Allocate(9)
        WriteU8(10)
        WriteF64(p1)
        return
    end
    if p1 < 256 then
        Allocate(2)
        WriteU8(5)
        WriteU8(p1)
        return
    end
    if p1 < 65536 then
        Allocate(3)
        WriteU8(6)
        WriteU16(p1)
        return
    end
    if p1 < 16777216 then
        Allocate(4)
        WriteU8(7)
        WriteU24(p1)
        return
    end
    if p1 < 4294967296 then
        Allocate(5)
        WriteU8(8)
        WriteU32(p1)
        return
    end
    Allocate(9)
    WriteU8(10)
    WriteF64(p1)
end
u21[11] = function() -- Line: 949 -- upvalues: ReadString (val), ReadU8 (val)
    return ReadString(ReadU8())
end
function u22.string(p1) -- Line: 952 -- upvalues: Allocate (val), WriteU8 (val), WriteString (val)
    local v1 = #p1
    Allocate(v1 + 2)
    WriteU8(11)
    WriteU8(v1)
    WriteString(p1)
end
u21[12] = function() -- Line: 960 -- upvalues: ReadBuffer (val), ReadU8 (val)
    return ReadBuffer(ReadU8())
end
function u22.buffer(p1) -- Line: 963 -- upvalues: Allocate (val), WriteU8 (val), WriteBuffer (val)
    local v1 = buffer.len(p1)
    Allocate(2 + v1)
    WriteU8(12)
    WriteU8(v1)
    WriteBuffer(p1)
end
u21[13] = function() -- Line: 971 -- upvalues: ReadInstance (val)
    return ReadInstance()
end
function u22.Instance(p1) -- Line: 974 -- upvalues: Allocate (val), WriteU8 (val), WriteInstance (val)
    Allocate(1)
    WriteU8(13)
    WriteInstance(p1)
end
u21[14] = function() -- Line: 980 -- upvalues: ReadU8 (val)
    local v1 = ReadU8() == 1
    return v1
end
function u22.boolean(p1) -- Line: 983 -- upvalues: Allocate (val), WriteU8 (val)
    local v1
    Allocate(2)
    WriteU8(14)
    if not p1 then
        v1 = 0
    else
        v1 = 1
    end
    WriteU8(v1)
end
u21[15] = function() -- Line: 989 -- upvalues: ReadF32 (val)
    return NumberRange.new(ReadF32(), ReadF32())
end
function u22.NumberRange(p1) -- Line: 992 -- upvalues: Allocate (val), WriteU8 (val), WriteF32 (val)
    Allocate(9)
    WriteU8(15)
    WriteF32(p1.Min)
    WriteF32(p1.Max)
end
u21[16] = function() -- Line: 999 -- upvalues: ReadU16 (val)
    return BrickColor.new(ReadU16())
end
function u22.BrickColor(p1) -- Line: 1002 -- upvalues: Allocate (val), WriteU8 (val), WriteU16 (val)
    Allocate(3)
    WriteU8(16)
    WriteU16(p1.Number)
end
u21[17] = function() -- Line: 1008 -- upvalues: ReadU8 (val)
    return Color3.fromRGB(ReadU8(), ReadU8(), ReadU8())
end
function u22.Color3(p1) -- Line: 1011 -- upvalues: Allocate (val), WriteU8 (val)
    Allocate(4)
    WriteU8(17)
    WriteU8(p1.R * 255 + 0.5)
    WriteU8(p1.G * 255 + 0.5)
    WriteU8(p1.B * 255 + 0.5)
end
u21[18] = function() -- Line: 1019 -- upvalues: ReadS16 (val)
    local v1 = ReadS16() / 1000
    return UDim.new(v1, ReadS16())
end
function u22.UDim(p1) -- Line: 1022 -- upvalues: Allocate (val), WriteU8 (val), WriteS16 (val)
    Allocate(5)
    WriteU8(18)
    WriteS16(p1.Scale * 1000)
    WriteS16(p1.Offset)
end
u21[19] = function() -- Line: 1029 -- upvalues: ReadS16 (val)
    local v1 = ReadS16() / 1000
    local v2 = ReadS16() / 1000
    return UDim2.new(v1, ReadS16(), v2, ReadS16())
end
function u22.UDim2(p1) -- Line: 1032 -- upvalues: Allocate (val), WriteU8 (val), WriteS16 (val)
    Allocate(9)
    WriteU8(19)
    WriteS16(p1.X.Scale * 1000)
    WriteS16(p1.X.Offset)
    WriteS16(p1.Y.Scale * 1000)
    WriteS16(p1.Y.Offset)
end
u21[20] = function() -- Line: 1041 -- upvalues: ReadF32 (val)
    return Rect.new(ReadF32(), ReadF32(), ReadF32(), ReadF32())
end
function u22.Rect(p1) -- Line: 1044 -- upvalues: Allocate (val), WriteU8 (val), WriteF32 (val)
    Allocate(17)
    WriteU8(20)
    WriteF32(p1.Min.X)
    WriteF32(p1.Min.Y)
    WriteF32(p1.Max.X)
    WriteF32(p1.Max.Y)
end
u21[21] = function() -- Line: 1053 -- upvalues: ReadF32 (val)
    return Vector2.new(ReadF32(), ReadF32())
end
function u22.Vector2(p1) -- Line: 1056 -- upvalues: Allocate (val), WriteU8 (val), WriteF32 (val)
    Allocate(9)
    WriteU8(21)
    WriteF32(p1.X)
    WriteF32(p1.Y)
end
u21[22] = function() -- Line: 1063 -- upvalues: ReadF32 (val)
    return (Vector3.new(ReadF32(), ReadF32(), ReadF32()))
end
function u22.Vector3(p1) -- Line: 1066 -- upvalues: Allocate (val), WriteU8 (val), WriteF32 (val)
    Allocate(13)
    WriteU8(22)
    WriteF32(p1.X)
    WriteF32(p1.Y)
    WriteF32(p1.Z)
end
u21[23] = function() -- Line: 1074 -- upvalues: ReadU16 (val), ReadF32 (val)
    local v1 = ReadU16() / 10430.219195527361
    local v2 = ReadU16() / 10430.219195527361
    local v3 = CFrame.fromEulerAnglesXYZ(v1, v2, ReadU16() / 10430.219195527361)
    return v3 + Vector3.new(ReadF32(), ReadF32(), ReadF32())
end
function u22.CFrame(p1) -- Line: 1081 -- upvalues: Allocate (val), WriteU8 (val), WriteU16 (val), WriteF32 (val)
    local v1, v2, v3
    v1, v2, v3 = p1:ToEulerAnglesXYZ()
    Allocate(19)
    WriteU8(23)
    WriteU16(v1 * 10430.219195527361 + 0.5)
    WriteU16(v2 * 10430.219195527361 + 0.5)
    WriteU16(v3 * 10430.219195527361 + 0.5)
    WriteF32(p1.X)
    WriteF32(p1.Y)
    WriteF32(p1.Z)
end
u21[24] = function() -- Line: 1093 -- upvalues: ReadF32 (val)
    local v1 = Vector3.new(ReadF32(), ReadF32(), ReadF32())
    return Region3.new(v1, (Vector3.new(ReadF32(), ReadF32(), ReadF32())))
end
function u22.Region3(p1) -- Line: 1096 -- upvalues: Allocate (val), WriteU8 (val), WriteF32 (val)
    local v1 = p1.Size / 2
    local v2 = p1.CFrame.Position - v1
    local v3 = p1.CFrame.Position + v1
    Allocate(25)
    WriteU8(24)
    WriteF32(v2.X)
    WriteF32(v2.Y)
    WriteF32(v2.Z)
    WriteF32(v3.X)
    WriteF32(v3.Y)
    WriteF32(v3.Z)
end
u21[25] = function() -- Line: 1110 -- upvalues: ReadU8 (val)
    local v1, v2
    local v3 = ReadU8()
    local v4 = table.create(v3)
    local v5 = v3
    local v6 = 1
    for i = 1, v5, v6 do
        v1 = ReadU8() / 255
        v2 = ReadU8() / 255
        table.insert(v4, NumberSequenceKeypoint.new(v1, v2, ReadU8() / 255))
    end
    return NumberSequence.new(v4)
end
function u22.NumberSequence(p1) -- Line: 1118 -- upvalues: Allocate (val), WriteU8 (val)
    local v1 = #p1.Keypoints
    Allocate(v1 * 3 + 2)
    WriteU8(25)
    WriteU8(v1)
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        WriteU8(j.Time * 255 + 0.5)
        WriteU8(j.Value * 255 + 0.5)
        WriteU8(j.Envelope * 255 + 0.5)
    end
end
u21[26] = function() -- Line: 1130 -- upvalues: ReadU8 (val)
    local v1
    local v2 = ReadU8()
    local v3 = table.create(v2)
    local v4 = v2
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = ReadU8() / 255
        table.insert(v3, ColorSequenceKeypoint.new(v1, Color3.fromRGB(ReadU8(), ReadU8(), ReadU8())))
    end
    return ColorSequence.new(v3)
end
function u22.ColorSequence(p1) -- Line: 1138 -- upvalues: Allocate (val), WriteU8 (val)
    local v1 = #p1.Keypoints
    Allocate(v1 * 4 + 2)
    WriteU8(26)
    WriteU8(v1)
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        WriteU8(j.Time * 255 + 0.5)
        WriteU8(j.Value.R * 255 + 0.5)
        WriteU8(j.Value.G * 255 + 0.5)
        WriteU8(j.Value.B * 255 + 0.5)
    end
end
u21[27] = function() -- Line: 1151 -- upvalues: Enums (val), ReadU8 (val), ReadU16 (val)
    local v1 = Enums[ReadU8()]
    return v1:FromValue(ReadU16())
end
function u22.EnumItem(p1) -- Line: 1154 -- upvalues: Allocate (val), WriteU8 (val), u212 (val), WriteU16 (val)
    Allocate(4)
    WriteU8(27)
    WriteU8(u212[p1.EnumType])
    WriteU16(p1.Value)
end
u21[28] = function() -- Line: 1161 -- upvalues: ReadU8 (val), u21 (val)
    local v1
    local v2 = {}
    while true do
        v1 = ReadU8()
        if v1 == 0 then
            break
        end
        v2[u21[v1]()] = u21[ReadU8()]()
    end
    return v2
end
function u22.table(p1) -- Line: 1172 -- upvalues: Allocate (val), WriteU8 (val), u22 (val)
    local v1
    Allocate(1)
    WriteU8(28)
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = u22[typeof(i)]
        v1(i)
        v1 = u22[typeof(j)]
        v1(j)
    end
    Allocate(1)
    WriteU8(0)
end
return {
    Import = function(p1) -- Line: 1184 -- upvalues: u12 (ref), u13 (ref), u14 (ref), u15 (ref), u16 (ref), u17 (ref)
        u12 = p1
        u13 = p1.Buffer
        u14 = p1.BufferLength
        u15 = p1.BufferOffset
        u16 = p1.Instances
        u17 = p1.InstancesOffset
    end,
    Export = function() -- Line: 1193 -- upvalues: u12 (ref), u14 (ref), u15 (ref), u17 (ref)
        u12.BufferLength = u14
        u12.BufferOffset = u15
        u12.InstancesOffset = u17
        return u12
    end,
    Truncate = function() -- Line: 1200 -- upvalues: u15 (ref), u13 (ref), u17 (ref), u16 (ref)
        local v1 = buffer.create(u15)
        buffer.copy(v1, 0, u13, 0, u15)
        if u17 == 0 then
            return v1
        end
        return v1, u16
    end,
    Ended = function() -- Line: 1210 -- upvalues: u15 (ref), u14 (ref)
        local v1 = u14 <= u15
        return v1
    end,
    Types = v3,
    Reads = v4,
    Writes = v5,
}