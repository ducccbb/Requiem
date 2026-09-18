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
--                     File: ReplicatedStorage.Common.Utilities.zlib
--                               Dumped in 0.0148 seconds
--                          Bytecode version 9  |  72 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local v2 = {}
u12.cache = v2
local function __modImpl() -- Line: 40
    local v1 = {}
    function v1.push(p1, p2, p3) -- Line: 41
        local v1
        local v2 = p3 + 1
        p1[v2] = p2
        local v3 = v2
        local v4 = (v3 - v3 % 2) / 2
        while 1 <= v4 do
            if p2[1] >= p1[v4][1] then
                break
            end
            v1 = p1[v4]
            p1[v4] = p2
            p1[v3] = v1
            v3 = v4
            v4 = (v4 - v4 % 2) / 2
        end
    end
    function v1.pop(p1, p2) -- Line: 57
        local v1, v2
        local v3 = p1[1]
        local v4 = p1[p2]
        local v5 = v4[1]
        p1[1] = v4
        p1[p2] = v3
        local v6 = p2 - 1
        local v7 = 1
        local v8 = v7 * 2
        local v9 = v8 + 1
        local v10 = p1
        while v8 <= v6 do
            v1 = v10[v8]
            if v9 <= v6 then
                v2 = v10[v9][1]
                if v2 < v1[1] then
                    v2 = v10[v9]
                    if v2[1] >= v5 then
                        break
                    end
                    v10[v9] = v4
                    v10[v7] = v2
                    v9 = v9 * 2 + 1
                    continue
                end
            end
            if v1[1] >= v5 then
                break
            end
            v10[v8] = v4
            v10[v7] = v1
            v8 = v8 * 2
            v9 = v8 + 1
        end
        return v3
    end
    return v1
end
function u12.a() -- Line: 103 -- upvalues: u12 (val), __modImpl (val)
    local a = u12.cache.a
    if not a then
        u12.cache.a = {c = __modImpl()}
    end
    return a.c
end
local function __modImpl_2() -- Line: 113
    local u0 = {}
    local v1 = 1
    local v2 = 32
    local v3 = 1
    for i = 0, v2, v3 do
        u0[i] = v1
        v1 = v1 * 2
    end
    return {
        getStoreBlockSize = function(p1, p2, p3) -- Line: 124
            return 3 + (8 - (p3 + 3) % 8) % 8 + 32 + (p2 - p1 + 1) * 8
        end,
        compressStoreBlock = function(p1, p2, p3, p4, p5, p6, p7) -- Line: 134 -- upvalues: u0 (val)
            local v1
            if not p3 then
                v1 = 0
            else
                v1 = 1
            end
            p1(v1, 1)
            p1(0, 2)
            local v2 = (8 - (p7 + 3) % 8) % 8
            if 0 < v2 then
                p1(u0[v2] - 1, v2)
            end
            v1 = p6 - p5 + 1
            p1(v1, 16)
            p1(255 - v1 % 256 + (255 - (v1 - v1 % 256) / 256) * 256, 16)
            p2(p4:sub(p5, p6))
        end,
    }
end
function u12.b() -- Line: 164 -- upvalues: u12 (val), __modImpl_2 (val)
    local b = u12.cache.b
    if not b then
        u12.cache.b = {c = __modImpl_2()}
    end
    return b.c
end
local function __modImpl_3() -- Line: 174
    local byte = string.byte
    return function(p1) -- Line: 177 -- upvalues: byte (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
        if type(p1) ~= "string" then
            error("Usage: LibDeflate.Adler32(str): 'str' - string expected got 'type(str)'.", 2)
        end
        local v17 = #p1
        local v18 = 1
        local v19 = 1
        local v20 = 0
        while v18 <= v17 - 15 do
            v12, v13, v14, v15, v16, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11 = byte(p1, v18, v18 + 15)
            v20 = (v20 + v19 * 16 + v12 * 16 + 15 * v13 + 14 * v14 + 13 * v15 + 12 * v16 + 11 * v1 + 10 * v2 + 9 * v3 + 8 * v4 + 7 * v5 + 6 * v6 + 5 * v7 + 4 * v8 + 3 * v9 + 2 * v10 + v11) % 65521
            v19 = (v19 + v12 + v13 + v14 + v15 + v16 + v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8 + v9 + v10 + v11) % 65521
            v18 = v18 + 16
        end
        while v18 <= v17 do
            v19 = (v19 + byte(p1, v18, v18)) % 65521
            v20 = (v20 + v19) % 65521
            v18 = v18 + 1
        end
        return (v20 * 65536 + v19) % 4294967296
    end
end
function u12.c() -- Line: 224 -- upvalues: u12 (val), __modImpl_3 (val)
    local c = u12.cache.c
    if not c then
        u12.cache.c = {c = __modImpl_3()}
    end
    return c.c
end
local function __modImpl_4() -- Line: 234
    return function(p1, p2) -- Line: 235
        local v1 = p1 % 4294967296 == p2 % 4294967296
        return v1
    end
end
function u12.d() -- Line: 241 -- upvalues: u12 (val), __modImpl_4 (val)
    local d = u12.cache.d
    if not d then
        u12.cache.d = {c = __modImpl_4()}
    end
    return d.c
end
local function __modImpl_5() -- Line: 251 -- upvalues: u12 (val)
    local u2 = u12.c()
    local u5 = u12.d()
    local byte = string.byte
    return function(p1, p2, p3) -- Line: 257 -- upvalues: u2 (val), u5 (val), byte (val)
        local v1
        if type(p1) ~= "string" then
            v1 = "Usage: LibDeflate.createDictionary(str, strlen, adler32):" .. (" 'str' - string expected got '%*'."):format((type(p1)))
            error(v1, 2)
        end
        if type(p2) ~= "number" then
            v1 = "Usage: LibDeflate.createDictionary(str, strlen, adler32):" .. (" 'strlen' - number expected got '%*'."):format((type(p2)))
            error(v1, 2)
        end
        if type(p3) ~= "number" then
            v1 = "Usage: LibDeflate.createDictionary(str, strlen, adler32):" .. (" 'adler32' - number expected got '%*'."):format((type(p3)))
            error(v1, 2)
        end
        if p2 ~= #p1 then
            error(("Usage: LibDeflate.createDictionary(str, strlen, adler32): 'strlen' does not match the actual length of 'str'. 'strlen': %u, '#str': %u . Please check if 'str' is modified unintentionally."):format(p2, #p1))
        end
        if p2 == 0 then
            error("Usage: LibDeflate.createDictionary(str, strlen, adler32): 'str' - Empty string is not allowed.", 2)
        end
        if 32768 < p2 then
            v1 = "Usage: LibDeflate.createDictionary(str, strlen, adler32):" .. " 'str' - string longer than 32768 bytes is not allowed." .. (" Got %* bytes."):format(p2)
            error(v1, 2)
        end
        local v2 = u2(p1)
        if not (u5(p3, v2)) then
            error(("Usage: LibDeflate.createDictionary(str, strlen, adler32): 'adler32' does not match the actual adler32 of 'str'. 'adler32': %u, 'Adler32(str)': %u . Please check if 'str' is modified unintentionally."):format(p3, v2))
        end
        v1 = {adler32 = p3, hash_tables = {}, string_table = {}, strlen = p2}
        local string_table = v1.string_table
        local hash_tables = v1.hash_tables
        string_table[1] = byte(p1, 1, 1)
        string_table[2] = byte(p1, 2, 2)
        if 3 <= p2 then
            local v3, v4, v5, v6, v7, v8
            local v9 = 1
            local v10 = string_table[1] * 256
            local v11 = v10 + string_table[2]
            v4, v3 = p2, p1
            while v9 <= v4 - 2 - 3 do
                v10, v5, v6, v7 = byte(v3, v9 + 2, v9 + 5)
                string_table[v9 + 2] = v10
                string_table[v9 + 3] = v5
                string_table[v9 + 4] = v6
                string_table[v9 + 5] = v7
                v11 = (v11 * 256 + v10) % 16777216
                v8 = hash_tables[v11]
                if not v8 then
                    hash_tables[v11] = {}
                end
                v8[#v8 + 1] = v9 - v4
                v9 = v9 + 1
                v11 = (v11 * 256 + v5) % 16777216
                v8 = hash_tables[v11]
                if not v8 then
                    hash_tables[v11] = {}
                end
                v8[#v8 + 1] = v9 - v4
                v9 = v9 + 1
                v11 = (v11 * 256 + v6) % 16777216
                v8 = hash_tables[v11]
                if not v8 then
                    hash_tables[v11] = {}
                end
                v8[#v8 + 1] = v9 - v4
                v9 = v9 + 1
                v11 = (v11 * 256 + v7) % 16777216
                v8 = hash_tables[v11]
                if not v8 then
                    hash_tables[v11] = {}
                end
                v8[#v8 + 1] = v9 - v4
                v9 = v9 + 1
            end
            while v9 <= v4 - 2 do
                v10 = byte(v3, v9 + 2)
                string_table[v9 + 2] = v10
                v11 = (v11 * 256 + v10) % 16777216
                v5 = hash_tables[v11]
                if not v5 then
                    hash_tables[v11] = {}
                end
                v5[#v5 + 1] = v9 - v4
                v9 = v9 + 1
            end
        end
        return v1
    end
end
function u12.e() -- Line: 385 -- upvalues: u12 (val), __modImpl_5 (val)
    local e = u12.cache.e
    if not e then
        u12.cache.e = {c = __modImpl_5()}
    end
    return e.c
end
local function __modImpl_6() -- Line: 395
    local v1 = {}
    v1[0] = {
        false,
        nil,
        0,
        0,
        0,
    }
    v1[1] = {
        false,
        nil,
        4,
        8,
        4,
    }
    v1[2] = {
        false,
        nil,
        5,
        18,
        8,
    }
    v1[3] = {
        false,
        nil,
        6,
        32,
        32,
    }
    v1[4] = {
        true,
        4,
        4,
        16,
        16,
    }
    v1[5] = {
        true,
        8,
        16,
        32,
        32,
    }
    v1[6] = {
        true,
        8,
        16,
        128,
        128,
    }
    v1[7] = {
        true,
        8,
        32,
        128,
        256,
    }
    v1[8] = {
        true,
        32,
        128,
        258,
        1024,
    }
    v1[9] = {
        true,
        32,
        258,
        258,
        4096,
    }
    return v1
end
function u12.f() -- Line: 411 -- upvalues: u12 (val), __modImpl_6 (val)
    local f = u12.cache.f
    if not f then
        u12.cache.f = {c = __modImpl_6()}
    end
    return f.c
end
local function __modImpl_7() -- Line: 421 -- upvalues: u12 (val)
    local v1, v2
    local u176 = u12.f()
    u12.e()
    local u184 = {}
    local u203 = {}
    local u192 = {}
    local v3 = 18
    local v4 = 16
    local v5 = 265
    local v6 = 1
    local v7 = 258
    local v8 = 1
    for i = 3, v7, v8 do
        if i <= 10 then
            u184[i] = i + 254
            u192[i] = 0
        elseif i ~= 258 then
            if v3 < i then
                v3 = v3 + v4
                v4 = v4 * 2
                v5 = v5 + 4
                v6 = v6 + 1
            end
            v1 = i - v3 - 1 + v4 / 2
            u184[i] = (v1 - v1 % (v4 / 8)) / (v4 / 8) + v5
            u192[i] = v6
            u203[i] = v1 % (v4 / 8)
        else
            u184[i] = 285
            u192[i] = 0
        end
    end
    local u153 = {}
    local u154 = {}
    local u155 = {}
    u153[1] = 0
    u153[2] = 1
    u155[1] = 0
    u155[2] = 0
    v6 = 3
    v7 = 4
    v8 = 2
    local v9 = 0
    v1 = 256
    local v10 = 1
    for j = 3, v1, v10 do
        if v7 < j then
            v6 = v6 * 2
            v7 = v7 * 2
            v8 = v8 + 2
            v9 = v9 + 1
        end
        if j > v6 then
            v2 = v8 + 1
        else
            v2 = v8
        end
        u153[j] = v2
        if v9 >= 0 then
            v2 = v9
        else
            v2 = 0
        end
        u155[j] = v2
        if 8 <= v7 then
            u154[j] = (j - v7 / 2 - 1) % (v7 / 4)
        end
    end
    return function(p1, p2, p3, p4, p5, p6, p7) -- Line: 489 -- upvalues: u176 (val), u184 (val), u192 (val), u153 (val), u154 (val), u155 (val), u203 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
        local v24 = u176[p1]
        local v25 = v24[1]
        local v26 = v24[2]
        local v27 = v24[3]
        local v28 = v24[4]
        local v29 = v24[5]
        if v25 then
            v2 = 2147483646
        else
            v2 = v27
        end
        local v30 = v29 - v29 % 4 / 4
        local hash_tables = nil
        local string_table = nil
        local strlen = 0
        if p7 then
            hash_tables = p7.hash_tables
            string_table = p7.string_table
            strlen = p7.strlen
            if p4 <= p5 and 2 <= strlen then
                v3 = string_table[strlen - 1] * 65536 + string_table[strlen] * 256 + p2[1]
                v4 = p3[v3]
                if not v4 then
                    p3[v3] = {}
                end
                v4[#v4 + 1] = -1
            end
            if p4 + 1 <= p5 and 1 <= strlen then
                v3 = string_table[strlen] * 65536 + p2[1] * 256 + p2[2]
                v4 = p3[v3]
                if not v4 then
                    p3[v3] = {}
                end
                v4[#v4 + 1] = 0
            end
        end
        v4 = strlen + 3
        v3 = (p2[p4 - p6] or 0) * 256 + (p2[p4 + 1 - p6] or 0)
        local v31 = {}
        local v32 = 0
        local v33 = {}
        local v34 = {}
        local v35 = 0
        local v36 = {}
        local v37 = {}
        local v38 = 0
        local v39 = {}
        local v40 = 0
        local v41 = false
        local v42 = 0
        local v43 = 0
        local v44 = p4
        if not v25 then
            v8 = 0
        else
            v8 = 1
        end
        local v45 = p5 + v8
        v22, v1, v5, v11 = p6, p2, p3, p5
        while v44 <= v45 do
            v8 = v44 - v22
            v9 = v22 - 3
            v6 = v42
            v7 = v43
            v42 = 0
            v3 = (v3 * 256 + (v1[v8 + 2] or 0)) % 16777216
            v12 = nil
            v13 = v5[v3]
            if v13 then
                v12 = v13
                v10 = #v13
            else
                v14 = 0
                v5[v3] = {}
                if not hash_tables then
                    v10 = 0
                else
                    v12 = hash_tables[v3]
                    if not v12 then
                        v15 = 0
                    else
                        v15 = #v12
                    end
                    v10 = v15
                end
            end
            if v44 <= v11 then
                v13[v14 + 1] = v44
            end
            if 0 < v10 and v44 + 2 <= v11 then
                if not v25 then
                    if not v25 then
                        v15 = v29
                    elseif v26 <= v6 then
                        v15 = v30
                    end
                    v16 = v11 - v44
                    if 257 > v16 then
                        v17 = v16
                    else
                        v17 = 257
                    end
                    v16 = v17 + v8
                    v17 = v8 + 3
                    while 1 <= v10 do
                        if 0 >= v15 then
                            break
                        end
                        v18 = v12[v10]
                        if 32768 < v44 - v18 then
                            break
                        end
                        if v18 < v44 then
                            v19 = v17
                            if -257 > v18 then
                                v20 = v4 + v18
                                while v19 <= v16 do
                                    if string_table[v20] ~= v1[v19] then
                                        break
                                    end
                                    v19 = v19 + 1
                                    v20 = v20 + 1
                                end
                            else
                                v20 = v18 - v9
                                while v19 <= v16 do
                                    if v1[v20] ~= v1[v19] then
                                        break
                                    end
                                    v19 = v19 + 1
                                    v20 = v20 + 1
                                end
                            end
                            v20 = v19 - v8
                            if v42 < v20 then
                                v42 = v20
                                v43 = v44 - v18
                            end
                            if v28 <= v42 then
                                break
                            end
                        end
                        v10 = v10 - 1
                        v15 = v15 - 1
                        if v10 == 0 and 0 < v18 and hash_tables then
                            v12 = hash_tables[v3]
                            if not v12 then
                                v19 = 0
                            else
                                v19 = #v12
                            end
                            v10 = v19
                        end
                    end
                elseif v6 >= v27 then
                end
            end
            if not v25 then
                v6 = v42
                v7 = v43
            end
            if not v25 then
                if 3 < v6 then
                    if v42 <= v6 then
                        v15 = u184[v6]
                        v16 = u192[v6]
                        if v7 > 256 then
                            v17 = 16
                            v18 = 7
                            v20 = 384
                            v21 = 512
                            while v7 > v20 do
                                if v7 > v21 then
                                    v17 = v17 + 2
                                    v18 = v18 + 1
                                    v20 = v20 * 2
                                    v21 = v21 * 2
                                    continue
                                else
                                    v19 = (v7 - v21 / 2 - 1) % (v21 / 4)
                                    v17 = v17 + 1
                                end
                                v32 = v32 + 1
                                v31[v32] = v15
                                v33[v15] = (v33[v15] or 0) + 1
                                v35 = v35 + 1
                                v34[v35] = v17
                                v36[v17] = (v36[v17] or 0) + 1
                                if 0 < v16 then
                                    v38 = v38 + 1
                                    v37[v38] = u203[v6]
                                end
                                if 0 < v18 then
                                    v40 = v40 + 1
                                    v39[v40] = v19
                                end
                                if not v25 then
                                    v23 = 1
                                else
                                    v23 = 2
                                end
                                v20 = v44 + v6 - v23
                                v21 = 1
                                for i = v44 + 1, v20, v21 do
                                    v3 = (v3 * 256 + (v1[i - v22 + 2] or 0)) % 16777216
                                    if v6 <= v2 then
                                        v13 = v5[v3]
                                        if not v13 then
                                            v5[v3] = {}
                                        end
                                        v13[#v13 + 1] = i
                                    end
                                end
                                if not v25 then
                                    v21 = 0
                                else
                                    v21 = 1
                                end
                                v44 = v44 + v6 - v21
                                v41 = false
                                break
                            end
                            v19 = (v7 - v21 / 2 - 1) % (v21 / 4)
                        else
                            v17 = u153[v7]
                            v19 = u154[v7]
                            v18 = u155[v7]
                        end
                    elseif not v25 then
                        if not v25 then
                            v16 = v8
                        else
                            v16 = v8 - 1
                        end
                        v15 = v1[v16]
                        v32 = v32 + 1
                        v31[v32] = v15
                        v33[v15] = (v33[v15] or 0) + 1
                        v44 = v44 + 1
                    elseif not v41 then
                        v41 = true
                        v44 = v44 + 1
                    end
                elseif v6 == 3 and v7 >= 4096 then
                end
            elseif not v41 then
            end
        end
        v31[v32 + 1] = 256
        v33[256] = (v33[256] or 0) + 1
        return v31, v37, v33, v34, v39, v36
    end
end
function u12.g() -- Line: 744 -- upvalues: u12 (val), __modImpl_7 (val)
    local g = u12.cache.g
    if not g then
        u12.cache.g = {c = __modImpl_7()}
    end
    return g.c
end
local function __modImpl_8() -- Line: 754 -- upvalues: u12 (val)
    local u2 = u12.f()
    local function isValidDictionary(p1) -- Line: 757
        if type(p1) ~= "table" then
            return false, (("'dictionary' - table expected got '%*'."):format((type(p1))))
        end
        if type(p1.adler32) ~= "number" or type(p1.string_table) ~= "table" or type(p1.strlen) ~= "number" or p1.strlen <= 0 or 32768 < p1.strlen or p1.strlen ~= #p1.string_table or type(p1.hash_tables) ~= "table" then
            return false, "'dictionary' - corrupted dictionary."
        end
        return true, ""
    end
    return function(p1, p2, p3, p4, p5) -- Line: 775 -- upvalues: isValidDictionary (val), u2 (val)
        local v1
        if type(p1) ~= "string" then
            return false, (("'str' - string expected got '%*'."):format((type(p1))))
        end
        if p2 then
            local v2
            v1, v2 = isValidDictionary(p3)
            if not v1 then
                return false, v2
            end
        elseif not p4 then
            return true, ""
        else
            v1 = type(p5)
            if v1 == "nil" then
                if v1 ~= "table" then
                    return true, ""
                end
                for k, v in pairs(p5) do
                    if k ~= "level" and k ~= "strategy" then
                        return false, (("'configs' - unsupported table key in the configs: '%*"):format(k))
                    end
                    if k == "level" and not (u2[v]) then
                        return false, (("'configs' - unsupported 'level': %*."):format(v))
                    end
                    if k == "strategy" and v ~= "fixed" and v ~= "huffman_only" and v ~= "dynamic" then
                        return false, (("'configs' - unsupported 'strategy': '%*'."):format(v))
                    end
                end
                return true, ""
            elseif v1 ~= "table" then
                return false, (("'configs' - nil or table expected got '%*'."):format((type(p5))))
            end
        end
    end
end
function u12.h() -- Line: 813 -- upvalues: u12 (val), __modImpl_8 (val)
    local h = u12.cache.h
    if not h then
        u12.cache.h = {c = __modImpl_8()}
    end
    return h.c
end
local function __modImpl_9() -- Line: 823
    return function(p1, p2, p3, p4, p5) -- Line: 824
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
        local v17 = p3 - p5
        while v17 <= p4 - 15 - p5 do
            v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16 = string.byte(p1, v17 + p5, v17 + 15 + p5)
            p2[v17] = v1
            p2[v17 + 1] = v2
            p2[v17 + 2] = v3
            p2[v17 + 3] = v4
            p2[v17 + 4] = v5
            p2[v17 + 5] = v6
            p2[v17 + 6] = v7
            p2[v17 + 7] = v8
            p2[v17 + 8] = v9
            p2[v17 + 9] = v10
            p2[v17 + 10] = v11
            p2[v17 + 11] = v12
            p2[v17 + 12] = v13
            p2[v17 + 13] = v14
            p2[v17 + 14] = v15
            p2[v17 + 15] = v16
            v17 = v17 + 16
        end
        while v17 <= p4 - p5 do
            p2[v17] = string.byte(p1, v17 + p5, v17 + p5)
            v17 = v17 + 1
        end
        return p2
    end
end
function u12.i() -- Line: 846 -- upvalues: u12 (val), __modImpl_9 (val)
    local i = u12.cache.i
    if not i then
        u12.cache.i = {c = __modImpl_9()}
    end
    return i.c
end
local function __modImpl_10() -- Line: 856 -- upvalues: u12 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local v13 = u12.a()
    local v14 = u12.b()
    local u521 = u12.g()
    local u681 = u12.d()
    local u560 = u12.h()
    local u509 = u12.i()
    local push = v13.push
    local pop = v13.pop
    local getStoreBlockSize = v14.getStoreBlockSize
    local compressStoreBlock = v14.compressStoreBlock
    local u840 = {createDictionary = u12.e()}
    local byte = string.byte
    local char = string.char
    local sub = string.sub
    local concat = table.concat
    local sort = table.sort
    local u324 = {}
    local u367 = {}
    local u275 = {}
    local u591 = {
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        13,
        15,
        17,
        19,
        23,
        27,
        31,
        35,
        43,
        51,
        59,
        67,
        83,
        99,
        115,
        131,
        163,
        195,
        227,
        258,
    }
    local u457 = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        4,
        4,
        4,
        4,
        5,
        5,
        5,
        5,
        0,
    }
    local u603 = {}
    u603[0] = 1
    u603[1] = 2
    u603[2] = 3
    u603[3] = 4
    u603[4] = 5
    u603[5] = 7
    u603[6] = 9
    u603[7] = 13
    u603[8] = 17
    u603[9] = 25
    u603[10] = 33
    u603[11] = 49
    u603[12] = 65
    u603[13] = 97
    u603[14] = 129
    u603[15] = 193
    u603[16] = 257
    u603[17] = 385
    u603[18] = 513
    u603[19] = 769
    u603[20] = 1025
    u603[21] = 1537
    u603[22] = 2049
    u603[23] = 3073
    u603[24] = 4097
    u603[25] = 6145
    u603[26] = 8193
    u603[27] = 12289
    u603[28] = 16385
    u603[29] = 24577
    local u615 = {}
    u615[0] = 0
    u615[1] = 0
    u615[2] = 0
    u615[3] = 0
    u615[4] = 1
    u615[5] = 1
    u615[6] = 2
    u615[7] = 2
    u615[8] = 3
    u615[9] = 3
    u615[10] = 4
    u615[11] = 4
    u615[12] = 5
    u615[13] = 5
    u615[14] = 6
    u615[15] = 6
    u615[16] = 7
    u615[17] = 7
    u615[18] = 8
    u615[19] = 8
    u615[20] = 9
    u615[21] = 9
    u615[22] = 10
    u615[23] = 10
    u615[24] = 11
    u615[25] = 11
    u615[26] = 12
    u615[27] = 12
    u615[28] = 13
    u615[29] = 13
    local u444 = {
        16,
        17,
        18,
        0,
        8,
        7,
        9,
        6,
        10,
        5,
        11,
        4,
        12,
        3,
        13,
        2,
        14,
        1,
        15,
    }
    local u484 = nil
    local u641 = nil
    local u471 = nil
    local u629 = nil
    local u496 = nil
    local u665 = nil
    local u653 = nil
    local v15 = 255
    local v16 = 1
    for i = 0, v15, v16 do
        u367[i] = char(i)
    end
    v15 = 1
    v16 = 32
    local v17 = 1
    for j = 0, v16, v17 do
        u324[j] = v15
        v15 = v15 * 2
    end
    v15 = 9
    v16 = 1
    for k = 1, v15, v16 do
        u275[k] = {}
        v2 = u324[k + 1] - 1
        v3 = 1
        for n = 0, v2, v3 do
            v4 = 0
            v5 = n
            v6 = k
            v7 = 1
            for m = 1, v6, v7 do
                if v4 % 2 == 1 then
                    v8 = 1
                elseif v5 % 2 ~= 1 then
                    v8 = 0
                end
                v4 = v4 - v4 % 2 + v8
                v5 = (v5 - v5 % 2) / 2
                v4 = v4 * 2
            end
            u275[k][n] = (v4 - v4 % 2) / 2
        end
    end
    function u840.adler32(p1) -- Line: 1081 -- upvalues: byte (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
        if type(p1) ~= "string" then
            error("Usage: LibDeflate.adler32(str): 'str' - string expected got 'type(str)'.", 2)
        end
        local v17 = #p1
        local v18 = 1
        local v19 = 1
        local v20 = 0
        while v18 <= v17 - 15 do
            v12, v13, v14, v15, v16, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11 = byte(p1, v18, v18 + 15)
            v20 = (v20 + v19 * 16 + v12 * 16 + 15 * v13 + 14 * v14 + 13 * v15 + 12 * v16 + 11 * v1 + 10 * v2 + 9 * v3 + 8 * v4 + 7 * v5 + 6 * v6 + 5 * v7 + 4 * v8 + 3 * v9 + 2 * v10 + v11) % 65521
            v19 = (v19 + v12 + v13 + v14 + v15 + v16 + v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8 + v9 + v10 + v11) % 65521
            v18 = v18 + 16
        end
        while v18 <= v17 do
            v19 = (v19 + byte(p1, v18, v18)) % 65521
            v20 = (v20 + v19) % 65521
            v18 = v18 + 1
        end
        return (v20 * 65536 + v19) % 4294967296
    end
    local function createWriter() -- Line: 1134 -- upvalues: u324 (val), u367 (val), char (val), concat (val)
        local u0 = 0
        local u1 = 0
        local u2 = 0
        local u3 = 0
        local u4 = {}
        local u5 = {}
        return function(p1, p2) -- Line: 1143 -- upvalues: u1 (ref), u324 (upval), u2 (ref), u3 (ref), u0 (ref), u4 (ref), u367 (upval)
            u1 = u1 + p1 * u324[u2]
            u2 = u2 + p2
            u3 = u3 + p2
            if 32 <= u2 then
                u0 = u0 + 1
                u4[u0] = u367[u1 % 256] .. u367[(u1 - u1 % 256) / 256 % 256] .. u367[(u1 - u1 % 65536) / 65536 % 256] .. u367[(u1 - u1 % 16777216) / 16777216 % 256]
                local v1 = u324[32 - u2 + p2]
                u1 = (p1 - p1 % v1) / v1
                u2 = u2 - 32
            end
        end, function(p1) -- Line: 1160 -- upvalues: u2 (ref), u0 (ref), u4 (ref), u1 (ref), char (upval), u3 (ref)
            local v1 = u2
            local v2 = 8
            for i = 1, v1, v2 do
                u0 = u0 + 1
                u4[u0] = char(u1 % 256)
                u1 = (u1 - u1 % 256) / 256
            end
            u2 = 0
            u0 = u0 + 1
            u4[u0] = p1
            u3 = u3 + #p1 * 8
        end, function(p1) -- Line: 1172 -- upvalues: u3 (ref), u2 (ref), u1 (ref), u324 (upval), u0 (ref), u4 (ref), u367 (upval), concat (upval), u5 (val)
            local v1
            if p1 == 3 then
                return u3
            end
            if p1 == 1 then
                v1 = (8 - u2 % 8) % 8
                if 0 < u2 then
                    u1 = u1 - u324[u2] + u324[u2 + v1]
                    local v2 = u2
                    local v3 = 8
                    for i = 1, v2, v3 do
                        u0 = u0 + 1
                        u4[u0] = u367[u1 % 256]
                        u1 = (u1 - u1 % 256) / 256
                    end
                    u1 = 0
                    u2 = 0
                end
                if p1 == 2 then
                    u3 = u3 + v1
                    return u3
                end
                v1 = concat(u4)
                u4 = {}
                u0 = 0
                u5[#u5 + 1] = v1
                if p1 == 0 then
                    return u3
                end
                return u3, concat(u5)
            elseif p1 ~= 2 then
                v1 = concat(u4)
                u4 = {}
                u0 = 0
                u5[#u5 + 1] = v1
                if p1 == 0 then
                    return u3
                end
                return u3, concat(u5)
            end
        end
    end
    local function getHuffmanCodeFromBitlen(p1, p2, p3, p4) -- Line: 1212 -- upvalues: u275 (val)
        local v1, v2, v3, v4, v5
        local v6 = 0
        local v7 = {}
        local v8 = {}
        local v9 = p4
        local v10 = 1
        for i = 1, v9, v10 do
            v6 = (v6 + (p1[i - 1] or 0)) * 2
            v7[i] = v6
        end
        v9 = p3
        v10 = 1
        local v11 = p2
        for j = 0, v9, v10 do
            v1 = v11[j]
            if v1 then
                v6 = v7[v1]
                v7[v1] = v6 + 1
                if v1 > 9 then
                    v2 = 0
                    v3 = v1
                    v4 = 1
                    for k = 1, v3, v4 do
                        if v2 % 2 == 1 then
                            v5 = 1
                        elseif v6 % 2 ~= 1 then
                            v5 = 0
                        end
                        v2 = v2 - v2 % 2 + v5
                        v6 = (v6 - v6 % 2) / 2
                        v2 = v2 * 2
                    end
                    v8[j] = (v2 - v2 % 2) / 2
                else
                    v8[j] = u275[v1][v6]
                end
            end
        end
        return v8
    end
    local function sortByFirstThenSecond(p1, p2) -- Line: 1249
        local v1 = if p1[1] >= p2[1] then if p1[1] == p2[1] then p1[2] < p2[2] else false else true
        return v1
    end
    local function getHuffmanBitlenAndCode(p1, p2, p3) -- Line: 1253 -- upvalues: sort (val), sortByFirstThenSecond (val), pop (val), push (val), getHuffmanCodeFromBitlen (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = -1
        local v11 = {}
        local v12 = {}
        local v13 = {}
        local v14 = {}
        local v15 = {}
        local v16 = 0
        for k, v in pairs(p1) do
            v16 = v16 + 1
            v11[v16] = {v, k}
        end
        if v16 == 0 then
            return {}, {}, -1
        end
        if v16 == 1 then
            v2 = v11[1][2]
            v13[v2] = 1
            v14[v2] = 0
            return v13, v14, v2
        end
        sort(v11, sortByFirstThenSecond)
        local v17 = v16
        v2 = v17
        local v18 = 1
        for i = 1, v2, v18 do
            v12[i] = v11[i]
        end
        while 1 < v17 do
            v2 = pop(v12, v17)
            v17 = v17 - 1
            v18 = pop(v12, v17)
            v17 = v17 - 1
            push(v12, {v2[1] + v18[1], -1, v2, v18}, v17)
            v17 = v17 + 1
        end
        v2 = 0
        v18 = {v12[1], 0, 0, 0}
        local v19 = 1
        local v20 = 1
        v12[1][1] = 0
        v1, v8 = p2, p3
        while v20 <= v19 do
            v3 = v18[v20]
            v4 = v3[1]
            v5 = v3[2]
            v6 = v3[3]
            v7 = v3[4]
            if v6 then
                v19 = v19 + 1
                v18[v19] = v6
                v6[1] = v4 + 1
            end
            if v7 then
                v19 = v19 + 1
                v18[v19] = v7
                v7[1] = v4 + 1
            end
            v20 = v20 + 1
            if v1 < v4 then
                v2 = v2 + 1
                v4 = v1
            end
            if 0 <= v5 then
                v13[v5] = v4
                if v10 >= v5 then
                    v9 = v10
                else
                    v9 = v5
                end
                v10 = v9
                v15[v4] = (v15[v4] or 0) + 1
            end
        end
        if 0 < v2 then
            while true do
                v3 = v1 - 1
                while v15[v3] or 0 == 0 do
                    v3 = v3 - 1
                end
                v15[v3] = v15[v3] - 1
                v15[v3 + 1] = (v15[v3 + 1] or 0) + 2
                v15[v1] = v15[v1] - 1
                v2 = v2 - 2
                if v2 <= 0 then
                    break
                end
            end
            v20 = 1
            v3 = 1
            v4 = -1
            for j = v1, v3, v4 do
                v6 = v15[j] or 0
                while 0 < v6 do
                    v13[v11[v20][2]] = j
                    v6 = v6 - 1
                    v20 = v20 + 1
                end
            end
        end
        v14 = getHuffmanCodeFromBitlen(v15, v13, v8, v1)
        return v13, v14, v10
    end
    local function runLengthEncodeHuffmanBitlen(p1, p2, p3, p4) -- Line: 1360
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = 0
        local v9 = {}
        local v10 = {}
        local v11 = 0
        local v12 = {}
        local v13 = nil
        local v14 = 0
        if p4 >= 0 then
            v3 = p4
        else
            v3 = 0
        end
        v3 = p2 + v3 + 1
        local v15 = v3 + 1
        local v16 = 1
        v2, v1, v7 = p2, p1, p3
        for i = 0, v15, v16 do
            if i <= v2 then
                v4 = v1[i]
                if not v4 then
                    v4 = 0
                end
            elseif i > v3 then
                v4 = nil
            else
                v4 = v7[i - v2 - 1]
                if not v4 then
                    v4 = 0
                end
            end
            if v4 ~= v13 then
                if v14 == 1 then
                    v8 = v8 + 1
                    v9[v8] = v13
                    v10[v13] = (v10[v13] or 0) + 1
                elseif v14 == 2 then
                    v8 = v8 + 1
                    v9[v8] = v13
                    v8 = v8 + 1
                    v9[v8] = v13
                    v10[v13] = (v10[v13] or 0) + 2
                elseif 3 <= v14 then
                    v8 = v8 + 1
                    if v13 ~= 0 then
                        v5 = 16
                    elseif v14 > 10 then
                        v5 = 18
                    else
                        v5 = 17
                    end
                    v9[v8] = v5
                    v10[v5] = (v10[v5] or 0) + 1
                    v11 = v11 + 1
                    if v14 > 10 then
                        v6 = v14 - 11
                    else
                        v6 = v14 - 3
                    end
                    v12[v11] = v6
                end
                v13 = v4
                if not v4 then
                    v14 = 1
                elseif v4 ~= 0 then
                    v8 = v8 + 1
                    v9[v8] = v4
                    v10[v4] = (v10[v4] or 0) + 1
                    v14 = 0
                end
            else
                v14 = v14 + 1
                if v4 == 0 then
                    if v4 == 0 and v14 == 138 then
                        v8 = v8 + 1
                        v9[v8] = 18
                        v11 = v11 + 1
                        v12[v11] = 127
                        v10[18] = (v10[18] or 0) + 1
                        v14 = 0
                    end
                elseif v14 == 6 then
                    v8 = v8 + 1
                    v9[v8] = 16
                    v11 = v11 + 1
                    v12[v11] = 3
                    v10[16] = (v10[16] or 0) + 1
                    v14 = 0
                end
            end
        end
        return v9, v12, v10
    end
    local function getBlockDynamicHuffmanHeader(p1, p2) -- Line: 1432 -- upvalues: getHuffmanBitlenAndCode (val), runLengthEncodeHuffmanBitlen (val), u444 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        v4, v5, v6 = getHuffmanBitlenAndCode(p1, 15, 285)
        v7, v8, v9 = getHuffmanBitlenAndCode(p2, 15, 29)
        v10, v11, v1 = runLengthEncodeHuffmanBitlen(v4, v6, v7, v9)
        v2, v3 = getHuffmanBitlenAndCode(v1, 7, 18)
        local v12 = 0
        local v13 = 19
        local v14 = 1
        for i = 1, v13, v14 do
            if v2[u444[i]] or 0 ~= 0 then
                v12 = i
            end
        end
        v14 = v9 + 1 - 1
        if v14 < 0 then
            v14 = 0
        end
        return v6 + 1 - 257, v14, v12 - 4, v2, v3, v10, v11, v4, v5, v7, v8
    end
    local function getDynamicHuffmanBlockSize(p1, p2, p3, p4, p5, p6, p7) -- Line: 1477 -- upvalues: u457 (val)
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = 17 + (p3 + 4) * 3
        local v9 = p5
        local v10 = nil
        local v11 = nil
        v1, v2, v6, v7, v5 = p1, p2, p6, p7, p4
        for i, j in v9, v10, v11 do
            v8 = v8 + v5[j]
            if 16 <= j then
                if j == 16 then
                    v3 = 2
                elseif j ~= 17 then
                    v3 = 7
                else
                    v3 = 3
                end
                v8 = v8 + v3
            end
        end
        v9 = 0
        v10 = v1
        v11 = nil
        local v12 = nil
        for k, n in v10, v11, v12 do
            v8 = v8 + v6[n]
            if 256 < n then
                v9 = v9 + 1
                if 264 < n and n < 285 then
                    v8 = v8 + u457[n - 256]
                end
                v4 = v2[v9]
                v8 = v8 + v7[v4]
                if 3 < v4 then
                    v8 = v8 + ((v4 - v4 % 2) / 2 - 1)
                end
            end
        end
        return v8
    end
    local function compressDynamicHuffmanBlock(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) -- Line: 1519 -- upvalues: u444 (val), u457 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
        if not p2 then
            v9 = 0
        else
            v9 = 1
        end
        p1(v9, 1)
        p1(2, 2)
        p1(p7, 5)
        p1(p8, 5)
        p1(p9, 4)
        local v19 = p9 + 4
        v9 = 1
        for i = 1, v19, v9 do
            p1(p10[u444[i]] or 0, 3)
        end
        v19 = 1
        v9 = #p12
        local v20 = 1
        v3, v1, v2, v18, v4, v10, v15, v16, v17, v5, v6, v7, v8 = p12, p1, p11, p10, p13, p3, p4, p5, p6, p14, p15, p16, p17
        for j = 1, v9, v20 do
            v11 = v3[j]
            v1(v2[v11], v18[v11])
            if 16 <= v11 then
                if v11 == 16 then
                    v13 = 2
                elseif v11 ~= 17 then
                    v13 = 7
                else
                    v13 = 3
                end
                v1(v4[v19], v13)
                v19 = v19 + 1
            end
        end
        v9 = 0
        v20 = 0
        local v21 = 0
        v11 = #v10
        local v22 = 1
        for k = 1, v11, v22 do
            v12 = v10[k]
            v1(v6[v12], v5[v12])
            if 256 < v12 then
                v9 = v9 + 1
                if 264 < v12 and v12 < 285 then
                    v20 = v20 + 1
                    v1(v15[v20], u457[v12 - 256])
                end
                v14 = v16[v9]
                v1(v8[v14], v7[v14])
                if 3 < v14 then
                    v21 = v21 + 1
                    v1(v17[v21], (v14 - v14 % 2) / 2 - 1)
                end
            end
        end
    end
    local function getFixedHuffmanBlockSize(p1, p2) -- Line: 1595 -- upvalues: u471 (ref), u457 (val)
        local v1, v2, v3, v4
        local v5 = 3
        local v6 = 0
        local v7 = #p1
        local v8 = 1
        v1, v2 = p1, p2
        for i = 1, v7, v8 do
            v3 = v1[i]
            v5 = v5 + u471[v3]
            if 256 < v3 then
                v6 = v6 + 1
                if 264 < v3 and v3 < 285 then
                    v5 = v5 + u457[v3 - 256]
                end
                v4 = v2[v6]
                v5 = v5 + 5
                if 3 < v4 then
                    v5 = v5 + ((v4 - v4 % 2) / 2 - 1)
                end
            end
        end
        return v5
    end
    local function compressFixedHuffmanBlock(p1, p2, p3, p4, p5, p6) -- Line: 1620 -- upvalues: u484 (ref), u471 (ref), u457 (val), u496 (ref)
        local v1, v2, v3, v4, v5, v6, v7, v8
        if not p2 then
            v8 = 0
        else
            v8 = 1
        end
        p1(v8, 1)
        p1(1, 2)
        local v9 = 0
        v8 = 0
        local v10 = 0
        local v11 = #p3
        local v12 = 1
        v4, v1, v5, v6, v7 = p3, p1, p4, p5, p6
        for i = 1, v11, v12 do
            v2 = v4[i]
            v1(u484[v2], u471[v2])
            if 256 < v2 then
                v9 = v9 + 1
                if 264 < v2 and v2 < 285 then
                    v8 = v8 + 1
                    v1(v5[v8], u457[v2 - 256])
                end
                v3 = v6[v9]
                v1(u496[v3], 5)
                if 3 < v3 then
                    v10 = v10 + 1
                    v1(v7[v10], (v3 - v3 % 2) / 2 - 1)
                end
            end
        end
    end
    local function deflate(p1, p2, p3, p4, p5, p6) -- Line: 1654 -- upvalues: u509 (val), u521 (val), getBlockDynamicHuffmanHeader (val), getDynamicHuffmanBlockSize (val), getFixedHuffmanBlockSize (val), getStoreBlockSize (val), compressStoreBlock (val), compressFixedHuffmanBlock (val), compressDynamicHuffmanBlock (val)
        local strlen, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38
        local v39 = {}
        local v40 = {}
        local v41 = nil
        local v42 = nil
        local v43 = nil
        local v44 = p4(3)
        local v45 = #p5
        local level = nil
        local strategy = nil
        if p1 then
            if p1.level then
                level = p1.level
            end
            if p1.strategy then
                strategy = p1.strategy
            end
        end
        if not level then
            if v45 < 2048 then
                level = 7
            elseif 65536 >= v45 then
                level = 5
            else
                level = 3
            end
        end
        while not v41 do
            if v42 then
                v42 = v43 + 1
                v43 = v43 + 32768
                v2 = v42 - 32768 - 1
            else
                v42 = 1
                v43 = 65535
                v2 = 0
            end
            if v45 > v43 then
                v41 = false
            else
                v43 = v45
                v41 = true
            end
            v3 = nil
            v4 = nil
            v7 = nil
            v8 = nil
            v10 = nil
            v11 = nil
            v12 = nil
            v13 = nil
            v14 = nil
            v15 = nil
            v16 = nil
            v17 = nil
            v18 = nil
            v19 = nil
            v20 = nil
            v21 = nil
            v22 = nil
            if level ~= 0 then
                u509(v27, v39, v42, v43 + 3, v2)
                if v42 == 1 and v37 then
                    strlen = v37.strlen
                    v30 = -strlen + 1
                    if v30 >= -257 then
                        v26 = -strlen + 1
                    else
                        v26 = -257
                    end
                    v28 = -1
                    for i = 0, v26, v28 do
                        v39[i] = v37.string_table[strlen + i]
                    end
                end
                if strategy ~= "huffman_only" then
                    v24, v25, v26, v28, v29, v30 = u521(level, v39, v40, v42, v43, v2, v37)
                    v3 = v24
                    v4 = v25
                    v5 = v26
                    v7 = v28
                    v8 = v29
                    v9 = v30
                else
                    v3 = {}
                    u509(v27, v3, v42, v43, v42 - 1)
                    v4 = {}
                    v5 = {}
                    v3[v43 - v42 + 2] = 256
                    v24 = v43 - v42 + 2
                    v25 = 1
                    for j = 1, v24, v25 do
                        v28 = v3[j]
                        v5[v28] = (v5[v28] or 0) + 1
                    end
                    v7 = {}
                    v8 = {}
                    v9 = {}
                end
                v24, v25, v26, v28, v29, v30, v31, v32, v33, v34, v35 = getBlockDynamicHuffmanHeader(v5, v9)
                v10 = v24
                v11 = v25
                v14 = v29
                v16 = v31
                v18 = v33
                v20 = v35
                v21 = getDynamicHuffmanBlockSize(v3, v7, v26, v28, v30, v32, v34)
                v22 = getFixedHuffmanBlockSize(v3, v7)
            end
            v23 = getStoreBlockSize(v42, v43, v44)
            v24 = v23
            if not v22 then
                v25 = v24
            elseif v22 < v24 then
                v25 = v22
            end
            v24 = v25
            if not v21 then
                v25 = v24
            elseif v21 < v24 then
                v25 = v21
            end
            v24 = v25
            if level == 0 then
                compressStoreBlock(v1, v6, v41, v27, v42, v43, v44)
                v44 = v44 + v23
            elseif strategy == "fixed" then
                if strategy == "dynamic" then
                    if strategy == "dynamic" then
                        compressDynamicHuffmanBlock(v1, v41, v3, v4, v7, v8, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
                        v44 = v44 + v21
                    elseif v21 ~= v24 then
                    end
                elseif strategy == "fixed" then
                    compressFixedHuffmanBlock(v1, v41, v3, v4, v7, v8)
                    v44 = v44 + v22
                elseif v22 ~= v24 then
                end
            elseif strategy ~= "dynamic" and v23 ~= v24 then
            end
            if not v41 then end
            if not v41 then
                if v37 and v42 == 1 then
                    v25 = 0
                    while v39[v25] do
                        v39[v25] = nil
                        v25 = v25 - 1
                    end
                end
                v37 = nil
                v25 = 1
                v26 = v43
                v28 = 1
                for k = v43 - 32767, v26, v28 do
                    v39[v25] = v39[k - v2]
                    v25 = v25 + 1
                end
                for k2, v in pairs(v40) do
                    v32 = #v
                    if 0 < v32 then
                        v33 = v43 + 1 - v[1]
                        if 32768 < v33 then
                            if v32 ~= 1 then
                                v33 = {}
                                v34 = 0
                                v35 = v32
                                v36 = 1
                                for n = 2, v35, v36 do
                                    v25 = v[n]
                                    v38 = v43 + 1 - v25
                                    if v38 <= 32768 then
                                        v34 = v34 + 1
                                        v33[v34] = v25
                                    end
                                end
                                v40[k2] = v33
                            else
                                v40[k2] = nil
                            end
                        end
                    end
                end
            end
        end
    end
    local function compressDeflateInternal(p1, p2, p3) -- Line: 1862 -- upvalues: createWriter (val), deflate (val)
        local v1, v2, v3, v4, v5
        v1, v2, v3 = createWriter()
        deflate(p3, v1, v2, v3, p1, p2)
        v4, v5 = v3(1)
        return v5, (8 - v4 % 8) % 8
    end
    local function compressZlibInternal(p1, p2, p3) -- Line: 1874 -- upvalues: createWriter (val), deflate (val), u840 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        v6, v7, v8 = createWriter()
        v6(120, 8)
        if not p2 then
            v9 = 0
        else
            v9 = 1
        end
        local v11 = 128 + v9 * 32
        v6(v11 + (31 - (30720 + v11) % 31), 8)
        if v9 == 1 then
            local adler32 = p2.adler32
            v1 = adler32 % 256
            v10 = (adler32 - v1) / 256
            v2 = v10 % 256
            v10 = (v10 - v2) / 256
            v3 = v10 % 256
            v6((v10 - v3) / 256 % 256, 8)
            v6(v3, 8)
            v6(v2, 8)
            v6(v1, 8)
        end
        deflate(p3, v6, v7, v8, p1, p2)
        v8(2)
        v10 = u840.adler32(p1)
        v1 = v10 % 256
        v10 = (v10 - v1) / 256
        v2 = v10 % 256
        v10 = (v10 - v2) / 256
        v3 = v10 % 256
        v6((v10 - v3) / 256 % 256, 8)
        v6(v3, 8)
        v6(v2, 8)
        v6(v1, 8)
        v4, v5 = v8(1)
        return v5, (8 - v4 % 8) % 8
    end
    function u840.compressDeflate(p1, p2) -- Line: 1931 -- upvalues: u560 (val), compressDeflateInternal (val)
        local v1, v2
        v1, v2 = u560(p1, false, nil, true, p2)
        if not v1 then
            local v3 = ("Usage: LibDeflate.compressDeflate(str, configs): %*"):format(v2)
            error(v3, 2)
        end
        return compressDeflateInternal(p1, nil, p2)
    end
    function u840.compressDeflateWithDict(p1, p2, p3) -- Line: 1939 -- upvalues: u560 (val), compressDeflateInternal (val)
        local v1, v2
        v1, v2 = u560(p1, true, p2, true, p3)
        if not v1 then
            local v3 = "Usage: LibDeflate.compressDeflateWithDict" .. ("(str, dictionary, configs): %*"):format(v2)
            error(v3, 2)
        end
        return compressDeflateInternal(p1, p2, p3)
    end
    function u840.compressZlib(p1, p2) -- Line: 1951 -- upvalues: u560 (val), compressZlibInternal (val)
        local v1, v2
        v1, v2 = u560(p1, false, nil, true, p2)
        if not v1 then
            local v3 = ("Usage: LibDeflate.compressZlib(str, configs): %*"):format(v2)
            error(v3, 2)
        end
        return compressZlibInternal(p1, nil, p2)
    end
    function u840.compressZlibWithDict(p1, p2, p3) -- Line: 1959 -- upvalues: u560 (val), compressZlibInternal (val)
        local v1, v2
        v1, v2 = u560(p1, true, p2, true, p3)
        if not v1 then
            local v3 = ("Usage: LibDeflate.compressZlibWithDict(str, dictionary, configs): %*"):format(v2)
            error(v3, 2)
        end
        return compressZlibInternal(p1, p2, p3)
    end
    local function createReader(p1) -- Line: 1971 -- upvalues: u324 (val), byte (val), char (val), sub (val), u275 (val)
        local u1 = #p1
        local u2 = 1
        local u3 = 0
        local u4 = 0
        return function(a1) -- Line: 1978 -- upvalues: u324 (upval), u3 (ref), u4 (ref), p1 (val), u2 (ref), byte (upval)
            local v1, v2, v3, v4, v5
            local v6 = u324[a1]
            if a1 <= u3 then
                v1 = u4 % v6
                u4 = (u4 - v1) / v6
                u3 = u3 - a1
                return v1
            end
            local v7 = u324[u3]
            v2, v3, v4, v5 = byte(p1, u2, u2 + 3)
            u4 = u4 + ((v2 or 0) + (v3 or 0) * 256 + (v4 or 0) * 65536 + (v5 or 0) * 16777216) * v7
            u2 = u2 + 4
            u3 = u3 + 32 - a1
            v1 = u4 % v6
            u4 = (u4 - v1) / v6
            return v1
        end, function(a1, p2, p3) -- Line: 2001 -- upvalues: u3 (ref), u4 (ref), char (upval), u1 (val), u2 (ref), p1 (val), sub (upval)
            local v1, v2
            if u3 / 8 >= a1 then
                v1 = a1
            else
                v1 = u3 / 8
            end
            local v3 = v1
            local v4 = 1
            local v5 = p3
            for i = 1, v3, v4 do
                v2 = u4 % 256
                v5 = v5 + 1
                p2[v5] = char(v2)
                u4 = (u4 - v2) / 256
            end
            u3 = u3 - v1 * 8
            local v6 = a1 - v1
            v4 = (u1 - u2 - v6 + 1) * 8
            v3 = v4 + u3
            if v3 < 0 then
                return -1
            end
            v3 = u2 + v6 - 1
            v4 = 1
            for j = u2, v3, v4 do
                v5 = v5 + 1
                p2[v5] = sub(p1, j, j)
            end
            u2 = u2 + v6
            return v5
        end, function(a1, p2, p3) -- Line: 2023 -- upvalues: u3 (ref), p1 (val), u324 (upval), u2 (ref), byte (upval), u4 (ref), u275 (upval)
            local v1, v2, v3, v4, v5
            local v6 = 0
            local v7 = 0
            local v8 = 0
            if 0 >= p3 then
                local v9, v10
                v4 = 15
                v5 = 1
                v9, v10 = a1, p2
                for i = p3 + 1, v4, v5 do
                    v1 = u4 % 2
                    u4 = (u4 - v1) / 2
                    u3 = u3 - 1
                    if v1 ~= 1 then
                        v2 = v6
                    else
                        v2 = v6 + 1 - v6 % 2
                    end
                    v6 = v2
                    v3 = v9[i] or 0
                    v2 = v6 - v7
                    if v2 < v3 then
                        return v10[v8 + v2]
                    end
                    v8 = v8 + v3
                    v7 = (v7 + v3) * 2
                    v6 = v6 * 2
                end
                return -10
            else
                if u3 < 15 and p1 then
                    local v11
                    v4 = u324[u3]
                    v5, v11, v1, v2 = byte(p1, u2, u2 + 3)
                    u4 = u4 + ((v5 or 0) + (v11 or 0) * 256 + (v1 or 0) * 65536 + (v2 or 0) * 16777216) * v4
                    u2 = u2 + 4
                    u3 = u3 + 32
                end
                v4 = u324[p3]
                u3 = u3 - p3
                v6 = u4 % v4
                u4 = (u4 - v6) / v4
                v6 = u275[p3][v6]
                v3 = a1[p3]
                if v6 < v3 then
                    return p2[v6]
                end
                v8 = v3
                v7 = v3 * 2
                v6 = v6 * 2
            end
        end, function() -- Line: 2083 -- upvalues: u1 (val), u2 (ref), u3 (ref)
            return (u1 - u2 + 1) * 8 + u3
        end, function() -- Line: 2087 -- upvalues: u3 (ref), u324 (upval), u4 (ref)
            local v1 = u3 % 8
            local v2 = u324[v1]
            u3 = u3 - v1
            u4 = (u4 - u4 % v2) / v2
        end
    end
    local function createDecompressState(p1, p2) -- Line: 2097 -- upvalues: createReader (val)
        local v1, v2, v3, v4, v5
        v1, v2, v3, v4, v5 = createReader(p1)
        return {
            buffer_size = 0,
            ReadBits = v1,
            ReadBytes = v2,
            Decode = v3,
            ReaderBitlenLeft = v4,
            SkipToByteBoundary = v5,
            buffer = {},
            result_buffer = {},
            dictionary = p2,
        }
    end
    local function getHuffmanForDecode(p1, p2, p3) -- Line: 2116
        local v1, v2, v3, v4, v5, v6
        local v7 = {}
        local v8 = p3
        local v9 = p2
        local v10 = 1
        v1, v2, v4 = p1, p2, p3
        for i = 0, v9, v10 do
            v5 = v1[i] or 0
            if 0 >= v5 then
                v6 = v8
            elseif v5 < v8 then
                v6 = v5
            end
            v8 = v6
            v7[v5] = (v7[v5] or 0) + 1
        end
        v9 = v7[0]
        if v9 == v2 + 1 then
            return 0, v7, {}, 0
        end
        v9 = 1
        v10 = v4
        local v11 = 1
        for j = 1, v10, v11 do
            v9 = v9 * 2 - (v7[j] or 0)
            if v9 < 0 then
                return v9
            end
        end
        v10 = {0}
        v11 = v4 - 1
        v5 = 1
        for k = 1, v11, v5 do
            v10[k + 1] = v10[k] + (v7[k] or 0)
        end
        v11 = {}
        v5 = v2
        v6 = 1
        for n = 0, v5, v6 do
            v3 = v1[n] or 0
            if v3 ~= 0 then
                v11[v10[v3]] = n
                v10[v3] = v10[v3] + 1
            end
        end
        return v9, v7, v11, v8
    end
    local function decodeUntilEndOfBlock(p1, p2, p3, p4, p5, p6, p7) -- Line: 2161 -- upvalues: u367 (val), u591 (val), u457 (val), u603 (val), u615 (val), concat (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
        local buffer = p1.buffer
        local buffer_size = p1.buffer_size
        local ReadBits = p1.ReadBits
        local Decode = p1.Decode
        local ReaderBitlenLeft = p1.ReaderBitlenLeft
        local result_buffer = p1.result_buffer
        local dictionary = p1.dictionary
        local string_table = nil
        local strlen = nil
        local v14 = 1
        if not dictionary then
            v2, v6, v10, v11, v12, v13, v1 = p2, p3, p4, p5, p6, p7, p1
        elseif buffer[0] then
            v2, v6, v10, v11, v12, v13, v1 = p2, p3, p4, p5, p6, p7, p1
        else
            string_table = dictionary.string_table
            strlen = dictionary.strlen
            v14 = -strlen + 1
            v7 = -strlen + 1
            if v7 >= -257 then
                v3 = -strlen + 1
            else
                v3 = -257
            end
            v4 = -1
            for i = 0, v3, v4 do
                buffer[i] = u367[string_table[strlen + i]]
            end
        end
        while true do
            v3 = Decode(v2, v6, v10)
            if v3 < 0 or 285 < v3 then
                break
            end
            if v3 < 256 then
                buffer_size = buffer_size + 1
                buffer[buffer_size] = u367[v3]
            elseif 256 < v3 then
                v3 = v3 - 256
                v4 = u591[v3]
                if 8 > v3 then
                    v5 = v4
                else
                    v5 = v4 + ReadBits(u457[v3])
                end
                v4 = v5
                v3 = Decode(v11, v12, v13)
                if v3 >= 0 and 29 >= v3 then
                    v5 = u603[v3]
                    if 4 >= v5 then
                        v7 = v5
                    else
                        v7 = v5 + ReadBits(u615[v3])
                    end
                    v7 = buffer_size - v7 + 1
                    if v7 < v14 then
                        return -11
                    end
                    if -257 > v7 then
                        v7 = strlen + v7
                        v8 = v4
                        v9 = 1
                        for j = 1, v8, v9 do
                            buffer_size = buffer_size + 1
                            buffer[buffer_size] = u367[string_table[v7]]
                            v7 = v7 + 1
                        end
                    else
                        v8 = v4
                        v9 = 1
                        for k = 1, v8, v9 do
                            buffer_size = buffer_size + 1
                            buffer[buffer_size] = buffer[v7]
                            v7 = v7 + 1
                        end
                    end
                    if ReaderBitlenLeft() < 0 then
                        return 2
                    end
                    if 65536 <= buffer_size then
                        result_buffer[#result_buffer + 1] = concat(buffer, "", 1, 32768)
                        v4 = buffer_size
                        v5 = 1
                        for n = 32769, v4, v5 do
                            buffer[n - 32768] = buffer[n]
                        end
                        buffer_size = buffer_size - 32768
                        buffer[buffer_size + 1] = nil
                    end
                    if v3 ~= 256 then
                        continue
                    end
                    v1.buffer_size = buffer_size
                    return 0
                end
                return -10
            end
        end
        return -10
    end
    local function decompressStoreBlock(p1) -- Line: 2249 -- upvalues: concat (val)
        local buffer = p1.buffer
        local ReadBits = p1.ReadBits
        local ReaderBitlenLeft = p1.ReaderBitlenLeft
        local result_buffer = p1.result_buffer
        p1.SkipToByteBoundary()
        local v1 = ReadBits(16)
        if ReaderBitlenLeft() < 0 then
            return 2
        end
        local v2 = ReadBits(16)
        if ReaderBitlenLeft() < 0 then
            return 2
        end
        if v1 % 256 + v2 % 256 ~= 255 then
            return -2
        end
        local v3 = (v1 - v1 % 256) / 256
        if v3 + (v2 - v2 % 256) / 256 ~= 255 then
            return -2
        end
        local v4 = p1.ReadBytes(v1, buffer, p1.buffer_size)
        if v4 < 0 then
            return 2
        end
        if 65536 <= v4 then
            result_buffer[#result_buffer + 1] = concat(buffer, "", 1, 32768)
            local v5 = v4
            v3 = 1
            for i = 32769, v5, v3 do
                buffer[i - 32768] = buffer[i]
            end
            v4 = v4 - 32768
            buffer[v4 + 1] = nil
        end
        p1.buffer_size = v4
        return 0
    end
    local function decompressFixBlock(p1) -- Line: 2293 -- upvalues: decodeUntilEndOfBlock (val), u629 (ref), u641 (ref), u653 (ref), u665 (ref)
        return decodeUntilEndOfBlock(p1, u629, u641, 7, u653, u665, 5)
    end
    local function decompressDynamicBlock(p1) -- Line: 2305 -- upvalues: u444 (val), getHuffmanForDecode (val), decodeUntilEndOfBlock (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        local ReadBits = p1.ReadBits
        local Decode = p1.Decode
        local v12 = ReadBits(5) + 257
        local v13 = ReadBits(5) + 1
        local v14 = ReadBits(4) + 4
        if 286 < v12 or 30 < v13 then
            return -3
        end
        local v15 = {}
        local v16 = v14
        local v17 = 1
        for i = 1, v16, v17 do
            v15[u444[i]] = ReadBits(3)
        end
        v16, v17, v11, v1 = getHuffmanForDecode(v15, 18, 7)
        if v16 ~= 0 then
            return -4
        end
        local v18 = {}
        local v19 = {}
        local v20 = 0
        local v21 = p1
        while v20 < v12 + v13 do
            v2 = Decode(v17, v11, v1)
            if v2 < 0 then
                return v2
            end
            if v2 >= 16 then
                v3 = 0
                if v2 ~= 16 then
                    if v2 ~= 17 then
                        v2 = 11 + ReadBits(7)
                    else
                        v2 = 3 + ReadBits(3)
                    end
                    if v12 + v13 < v20 + v2 then
                        return -6
                    end
                    while 0 < v2 do
                        v2 = v2 - 1
                        if v20 >= v12 then
                            v19[v20 - v12] = v3
                        else
                            v18[v20] = v3
                        end
                        v20 = v20 + 1
                    end
                else
                    if v20 == 0 then
                        return -5
                    end
                    if v20 - 1 >= v12 then
                        v3 = v19[v20 - v12 - 1]
                    else
                        v3 = v18[v20 - 1]
                    end
                    v2 = 3 + ReadBits(2)
                end
            else
                if v20 >= v12 then
                    v19[v20 - v12] = v2
                else
                    v18[v20] = v2
                end
                v20 = v20 + 1
            end
        end
        if not (v18[256] or 0 ~= 0) then
            return -9
        end
        v2, v3, v4, v5 = getHuffmanForDecode(v18, v12 - 1, 15)
        if v2 == 0 then
            v6, v7, v8, v9 = getHuffmanForDecode(v19, v13 - 1, 15)
            if v6 ~= 0 then
                if v6 < 0 then
                    return -8
                end
                v10 = v7[0] or 0
                if v13 ~= v10 + (v7[1] or 0) then
                    return -8
                end
                return decodeUntilEndOfBlock(v21, v3, v4, v5, v7, v8, v9)
            end
            return decodeUntilEndOfBlock(v21, v3, v4, v5, v7, v8, v9)
        end
        if v2 < 0 then
            return -7
        end
        v7 = v3[0] or 0
        if v12 ~= v7 + (v3[1] or 0) then
            return -7
        end
        v6, v7, v8, v9 = getHuffmanForDecode(v19, v13 - 1, 15)
        if v6 == 0 then
            return decodeUntilEndOfBlock(v21, v3, v4, v5, v7, v8, v9)
        end
        if v6 < 0 then
            return -8
        end
        v10 = v7[0] or 0
        if v13 ~= v10 + (v7[1] or 0) then
            return -8
        end
        return decodeUntilEndOfBlock(v21, v3, v4, v5, v7, v8, v9)
    end
    local function inflate(p1) -- Line: 2430 -- upvalues: decompressStoreBlock (val), decompressFixBlock (val), decompressDynamicBlock (val), concat (val)
        local v1, v2
        local ReadBits = p1.ReadBits
        local v3 = nil
        local v4 = p1
        while not v3 do
            v3 = ReadBits(1) == 1
            v1 = ReadBits(2)
            if v1 == 0 then
                v2 = decompressStoreBlock(v4)
            elseif v1 == 1 then
                v2 = decompressFixBlock(v4)
            elseif v1 ~= 2 then
                return nil, -1
            else
                v2 = decompressDynamicBlock(v4)
                if v2 ~= 0 then
                    return nil, v2
                end
            end
        end
        v4.result_buffer[#v4.result_buffer + 1] = concat(v4.buffer, "", 1, v4.buffer_size)
        return (concat(v4.result_buffer))
    end
    local function decompressDeflateInternal(p1, p2) -- Line: 2457 -- upvalues: createDecompressState (val), inflate (val)
        local v1, v2
        local v3 = createDecompressState(p1, p2)
        v1, v2 = inflate(v3)
        if not v1 then
            return nil, v2
        end
        local v4 = v3.ReaderBitlenLeft()
        return v1, (v4 - v4 % 8) / 8
    end
    local function decompressZlibInternal(p1, p2) -- Line: 2472 -- upvalues: createDecompressState (val), u681 (val), inflate (val), u840 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = createDecompressState(p1, p2)
        local ReadBits = v10.ReadBits
        local v11 = ReadBits(8)
        if v10.ReaderBitlenLeft() < 0 then
            return nil, 2
        end
        local v12 = v11 % 16
        local v13 = (v11 - v12) / 16
        if v12 ~= 8 then
            return nil, -12
        end
        if 7 < v13 then
            return nil, -13
        end
        local v14 = ReadBits(8)
        if v10.ReaderBitlenLeft() < 0 then
            return nil, 2
        end
        if (v11 * 256 + v14) % 31 ~= 0 then
            return nil, -14
        end
        if (v14 - v14 % 32) / 32 % 2 ~= 1 then
            v9, v1 = inflate(v10)
            if not v9 then
                return nil, v1
            end
            v10.SkipToByteBoundary()
            v2 = ReadBits(8)
            v3 = ReadBits(8)
            v4 = ReadBits(8)
            v5 = ReadBits(8)
            if v10.ReaderBitlenLeft() < 0 then
                return nil, 2
            end
            v8 = v2 * 16777216 + v3 * 65536
            v6 = v8 + v4 * 256 + v5
            v7 = u840.adler32(v9)
            if not (u681(v6, v7)) then
                return nil, -15
            end
            v8 = v10.ReaderBitlenLeft()
            return v9, (v8 - v8 % 8) / 8
        end
        if not p2 then
            return nil, -16
        end
        v9 = ReadBits(8)
        v1 = ReadBits(8)
        v2 = ReadBits(8)
        v6 = v9 * 16777216 + v1 * 65536
        v4 = v6 + v2 * 256 + ReadBits(8)
        if v10.ReaderBitlenLeft() < 0 then
            return nil, 2
        end
        if not (u681(v4, p2.adler32)) then
            return nil, -17
        end
        v9, v1 = inflate(v10)
        if not v9 then
            return nil, v1
        end
        v10.SkipToByteBoundary()
        v2 = ReadBits(8)
        v3 = ReadBits(8)
        v4 = ReadBits(8)
        v5 = ReadBits(8)
        if v10.ReaderBitlenLeft() < 0 then
            return nil, 2
        end
        v8 = v2 * 16777216 + v3 * 65536
        v6 = v8 + v4 * 256 + v5
        v7 = u840.adler32(v9)
        if not (u681(v6, v7)) then
            return nil, -15
        end
        v8 = v10.ReaderBitlenLeft()
        return v9, (v8 - v8 % 8) / 8
    end
    function u840.decompressDeflate(p1) -- Line: 2543 -- upvalues: u560 (val), decompressDeflateInternal (val)
        local v1, v2
        v1, v2 = u560(p1)
        if not v1 then
            error("Usage: LibDeflate.decompressDeflate(str): " .. v2, 2)
        end
        return decompressDeflateInternal(p1)
    end
    function u840.decompressDeflateWithDict(p1, p2) -- Line: 2551 -- upvalues: u560 (val), decompressDeflateInternal (val)
        local v1, v2
        v1, v2 = u560(p1, true, p2)
        if not v1 then
            error("Usage: LibDeflate.decompressDeflateWithDict(str, dictionary): " .. v2, 2)
        end
        return decompressDeflateInternal(p1, p2)
    end
    function u840.decompressZlib(p1) -- Line: 2562 -- upvalues: u560 (val), decompressZlibInternal (val)
        local v1, v2
        v1, v2 = u560(p1)
        if not v1 then
            error("Usage: LibDeflate.decompressZlib(str): " .. v2, 2)
        end
        return decompressZlibInternal(p1)
    end
    function u840.decompressZlibWithDict(p1, p2) -- Line: 2570 -- upvalues: u560 (val), decompressZlibInternal (val)
        local v1, v2
        v1, v2 = u560(p1, true, p2)
        if not v1 then
            error("Usage: LibDeflate.decompressZlibWithDict(str, dictionary): " .. v2, 2)
        end
        return decompressZlibInternal(p1, p2)
    end
    u471 = {}
    local v18 = 143
    local v19 = 1
    for i5 = 0, v18, v19 do
        u471[i5] = 8
    end
    v18 = 255
    v19 = 1
    for i6 = 144, v18, v19 do
        u471[i6] = 9
    end
    u471[256] = 7
    u471[257] = 7
    u471[258] = 7
    u471[259] = 7
    u471[260] = 7
    u471[261] = 7
    u471[262] = 7
    u471[263] = 7
    u471[264] = 7
    u471[265] = 7
    u471[266] = 7
    u471[267] = 7
    u471[268] = 7
    u471[269] = 7
    u471[270] = 7
    u471[271] = 7
    u471[272] = 7
    u471[273] = 7
    u471[274] = 7
    u471[275] = 7
    u471[276] = 7
    u471[277] = 7
    u471[278] = 7
    u471[279] = 7
    u471[280] = 8
    u471[281] = 8
    u471[282] = 8
    u471[283] = 8
    u471[284] = 8
    u471[285] = 8
    u471[286] = 8
    u471[287] = 8
    v1 = {}
    v18 = 31
    v19 = 1
    for i7 = 0, v18, v19 do
        v1[i7] = 5
    end
    _, v19, v9 = getHuffmanForDecode(u471, 287, 9)
    u629 = v19
    v10, v11, v12 = getHuffmanForDecode(v1, 31, 5)
    u653 = v11
    return u840
end
function u12.j() -- Line: 2629 -- upvalues: u12 (val), __modImpl_10 (val)
    local j = u12.cache.j
    if not j then
        u12.cache.j = {c = __modImpl_10()}
    end
    return j.c
end
v2 = u12.j()
return {
    compressDeflate = v2.compressDeflate,
    decompressDeflate = v2.decompressDeflate,
    compressDeflateWithDict = v2.compressDeflateWithDict,
    decompressDeflateWithDict = v2.decompressDeflateWithDict,
    compressZlib = v2.compressZlib,
    decompressZlib = v2.decompressZlib,
    compressZlibWithDict = v2.compressZlibWithDict,
    decompressZlibWithDict = v2.decompressZlibWithDict,
    calculateAdler32 = v2.adler32,
    createDictionary = v2.createDictionary,
}