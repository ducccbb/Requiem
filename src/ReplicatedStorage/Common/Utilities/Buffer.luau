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
--                    File: ReplicatedStorage.Common.Utilities.Buffer
--                               Dumped in 0.00195 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
function v1.parser() -- Line: 23
    local u0 = 4
    local u3 = buffer.create(u0)
    local u4 = 0
    local function u5(p1) -- Line: 28 -- upvalues: u4 (ref), u0 (ref), u3 (ref)
        local v1 = u4 + p1
        if u0 < v1 then
            local v2 = u0 + p1
            u0 = v2
            u3 = buffer.create(v2)
            buffer.copy(u3, 0, u3)
        end
    end
    local function u8(p1) -- Line: 41 -- upvalues: u4 (ref)
        local read
        function read() -- Line: 42 -- upvalues: u4 (upval), p1 (val), read (val)
            local v1, v2, v3, v4
            if buffer.len(p1) <= u4 then
                error("Attempted to read past end of buffer at offset " .. u4)
            end
            local v5 = buffer.readu8(p1, u4)
            u4 = u4 + 1
            if v5 == 1 then
                v1 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v2 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v3 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                return (Vector3.new(v1, v2, v3))
            end
            if v5 == 7 then
                v1 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v2 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v3 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                return Color3.new(v1, v2, v3)
            end
            if v5 == 8 then
                v1 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v2 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v3 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v4 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                return UDim2.new(v1, v2, v3, v4)
            end
            if v5 == 10 then
                v1 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                v2 = buffer.readu8(p1, u4)
                u4 = u4 + 1
                v3 = buffer.readu8(p1, u4)
                u4 = u4 + 1
                local EnumItems = Enum.EasingStyle:GetEnumItems()
                v4 = EnumItems[v2 + 1]
                local EnumItems_2 = Enum.EasingDirection:GetEnumItems()
                return TweenInfo.new(v1, v4, EnumItems_2[v3 + 1])
            end
            if v5 == 9 then
                v1 = buffer.readu8(p1, u4)
                u4 = u4 + 1
                v2 = v1 == 1
                return v2
            end
            if v5 == 2 then
                v1 = buffer.readi16(p1, u4)
                u4 = u4 + 2
                return v1
            end
            if v5 == 3 then
                v1 = buffer.readi32(p1, u4)
                u4 = u4 + 4
                return v1
            end
            if v5 == 4 then
                v1 = buffer.readf32(p1, u4)
                u4 = u4 + 4
                return v1
            end
            if v5 == 5 then
                v1 = buffer.readf64(p1, u4)
                u4 = u4 + 8
                return v1
            end
            if v5 == 6 then
                v1 = buffer.readu32(p1, u4)
                u4 = u4 + 4
                v2 = {}
                v3 = v1
                v4 = 1
                for n = 1, v3, v4 do
                    v2[n] = string.char((buffer.readu8(p1, u4)))
                    u4 = u4 + 1
                end
                return table.concat(v2)
            end
            if v5 == 12 then
                v1 = buffer.readu32(p1, u4)
                u4 = u4 + 4
                v2 = {}
                v3 = v1
                v4 = 1
                for k = 1, v3, v4 do
                    v2[k] = read()
                end
                return v2
            end
            if v5 == 13 then
                v1 = buffer.readu32(p1, u4)
                u4 = u4 + 4
                v2 = {}
                v3 = v1
                v4 = 1
                for j = 1, v3, v4 do
                    v2[read()] = read()
                end
                return v2
            end
            if v5 ~= 11 then
                error("Invalid Datatype Read Support: " .. v5 .. " at offset " .. u4 - 1)
                return
            end
            v1 = buffer.readu32(p1, u4)
            u4 = u4 + 4
            v2 = {}
            v3 = v1
            v4 = 1
            for i = 1, v3, v4 do
                v2[i] = string.char((buffer.readu8(p1, u4)))
                u4 = u4 + 1
            end
            v3 = table.concat(v2)
            v4 = string.split(v3, ".")
            local v6 = game
            for i2, v in ipairs(v4) do
                v6 = v6[v]
            end
            return v6
        end
        return read()
    end
    local function u9(p1) -- Line: 155 -- upvalues: u5 (val), u3 (ref), u4 (ref)
        local write
        function write(p1) -- Line: 156 -- upvalues: u5 (upval), u3 (upval), u4 (upval), write (val)
            local v1 = typeof(p1)
            if v1 == "Vector3" then
                u5(13)
                buffer.writei8(u3, u4, 1)
                u4 = u4 + 1
                buffer.writef32(u3, u4, p1.X)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.Y)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.Z)
                u4 = u4 + 4
            elseif v1 == "Color3" then
                u5(13)
                buffer.writei8(u3, u4, 7)
                u4 = u4 + 1
                buffer.writef32(u3, u4, p1.R)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.G)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.B)
                u4 = u4 + 4
            elseif v1 == "UDim2" then
                u5(17)
                buffer.writei8(u3, u4, 8)
                u4 = u4 + 1
                buffer.writef32(u3, u4, p1.X.Scale)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.X.Offset)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.Y.Scale)
                u4 = u4 + 4
                buffer.writef32(u3, u4, p1.Y.Offset)
                u4 = u4 + 4
            elseif v1 == "TweenInfo" then
                u5(10)
                buffer.writei8(u3, u4, 10)
                u4 = u4 + 1
                buffer.writef32(u3, u4, p1.Time)
                u4 = u4 + 4
                buffer.writeu8(u3, u4, p1.EasingStyle.Value)
                u4 = u4 + 1
                buffer.writeu8(u3, u4, p1.EasingDirection.Value)
                u4 = u4 + 1
            else
                local v2
                if v1 == "boolean" then
                    u5(2)
                    buffer.writei8(u3, u4, 9)
                    u4 = u4 + 1
                    if not p1 then
                        v2 = 0
                    else
                        v2 = 1
                    end
                    buffer.writeu8(u3, u4, v2)
                    u4 = u4 + 1
                else
                    local v3
                    if v1 ~= "number" then
                        local v4, v5
                        if v1 == "string" then
                            v3 = #p1
                            u5(v3 + 5)
                            buffer.writei8(u3, u4, 6)
                            u4 = u4 + 1
                            buffer.writeu32(u3, u4, v3)
                            u4 = u4 + 4
                            v4 = v3
                            v5 = 1
                            for n = 1, v4, v5 do
                                buffer.writei8(u3, u4, string.byte(p1, n))
                                u4 = u4 + 1
                            end
                        elseif v1 == "table" then
                            v3 = true
                            v4 = 0
                            local v6 = p1
                            for k, v in pairs(p1) do
                                v4 = v4 + 1
                                if type(k) ~= "number" then
                                    v3 = false
                                elseif k == math.floor(k) and k > 0 and v4 >= k then
                                end
                            end
                            u5(5)
                            if not v3 then
                                buffer.writei8(u3, u4, 13)
                            else
                                buffer.writei8(u3, u4, 12)
                            end
                            u4 = u4 + 1
                            buffer.writeu32(u3, u4, v4)
                            u4 = u4 + 4
                            if not v3 then
                                for k2, j in pairs(v6) do
                                    write(k2)
                                    write(j)
                                end
                            else
                                v5 = v4
                                v2 = 1
                                for k3 = 1, v5, v2 do
                                    write(v6[k3])
                                end
                            end
                        elseif v1 ~= "Instance" then
                            error("Invalid Datatype Write Support: " .. v1)
                        else
                            local FullName = p1:GetFullName()
                            v4 = #FullName
                            u5(v4 + 5)
                            buffer.writei8(u3, u4, 11)
                            u4 = u4 + 1
                            buffer.writeu32(u3, u4, v4)
                            u4 = u4 + 4
                            v5 = v4
                            v2 = 1
                            for i = 1, v5, v2 do
                                buffer.writei8(u3, u4, string.byte(FullName, i))
                                u4 = u4 + 1
                            end
                        end
                    elseif math.floor(p1) ~= p1 then
                        v3 = math.abs(p1)
                        if v3 >= 3.4028235e+38 then
                            u5(9)
                            buffer.writei8(u3, u4, 5)
                            u4 = u4 + 1
                            buffer.writef64(u3, u4, p1)
                            u4 = u4 + 8
                        else
                            u5(5)
                            buffer.writei8(u3, u4, 4)
                            u4 = u4 + 1
                            buffer.writef32(u3, u4, p1)
                            u4 = u4 + 4
                        end
                    elseif -32768 > p1 then
                        if -2147483648 > p1 then
                            u5(9)
                            buffer.writei8(u3, u4, 5)
                            u4 = u4 + 1
                            buffer.writef64(u3, u4, p1)
                            u4 = u4 + 8
                        elseif p1 > 2147483647 then
                            u5(9)
                            buffer.writei8(u3, u4, 5)
                            u4 = u4 + 1
                            buffer.writef64(u3, u4, p1)
                            u4 = u4 + 8
                        else
                            u5(5)
                            buffer.writei8(u3, u4, 3)
                            u4 = u4 + 1
                            buffer.writei32(u3, u4, p1)
                            u4 = u4 + 4
                        end
                    elseif p1 <= 32767 then
                        u5(3)
                        buffer.writei8(u3, u4, 2)
                        u4 = u4 + 1
                        buffer.writei16(u3, u4, p1)
                        u4 = u4 + 2
                    end
                end
            end
            return nil
        end
        write(p1)
        return u3
    end
    return {
        deserialize = function(p1) -- Line: 305 -- upvalues: u4 (ref), u8 (ref)
            u4 = 0
            return u8(p1)
        end,
        serialize = function(p1) -- Line: 310 -- upvalues: u4 (ref), u3 (ref), u0 (ref), u9 (ref)
            u4 = 0
            u3 = buffer.create(4)
            u0 = 4
            u9(p1)
            return u3
        end,
    }
end
return v1