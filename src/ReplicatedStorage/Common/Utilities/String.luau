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
--                    File: ReplicatedStorage.Common.Utilities.String
--                              Dumped in 0.000914 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local function charCode(p1) -- Line: 11
    return utf8.char((tonumber(p1, 16)))
end
function u12.parseEscapeSequences(p1) -- Line: 15 -- upvalues: charCode (val)
    local v1 = p1:gsub("\\(.)", {t = "\t", n = "\n"})
    v1 = v1:gsub("\\u(%x%x%x%x)", charCode)
    return v1:gsub("\\x(%x%x)", charCode)
end
local function encodeControlChars(p1) -- Line: 24
    local v1 = p1:gsub("\\\\", "___!REQ_ESCAPE!___")
    v1 = v1:gsub("\\\"", "___!REQ_QUOTE!___")
    v1 = v1:gsub("\\'", "___!REQ_SQUOTE!___")
    return (v1:gsub("\\\n", "___!REQ_NL!___"))
end
local function decodeControlChars(p1) -- Line: 33
    local v1 = p1:gsub("___!REQ_ESCAPE!___", "\\")
    v1 = v1:gsub("___!REQ_QUOTE!___", "\"")
    return (v1:gsub("___!REQ_NL!___", "\n"))
end
function u12.split(p1, p2) -- Line: 37 -- upvalues: encodeControlChars (val), u12 (val), decodeControlChars (val)
    local v1, v2, v3, v4, v5, v6
    local huge = p2
    if not huge then
        huge = math.huge
    end
    local v7 = huge
    local v8 = {}
    local v9 = nil
    local v10 = nil
    for i in encodeControlChars(p1):gmatch("[^ ]+") do
        v6 = u12.parseEscapeSequences(i)
        v1 = v6:match("^(['\"])")
        v2 = v6:match("(['\"])$")
        v3 = v6:match("(\\*)['\"]$")
        if not v1 then
            if not v9 then
                if v9 then
                    v9 = v9 .. " " .. v6
                end
            elseif v2 == v10 and #v3 % 2 == 0 then
                v6 = v9 .. " " .. v6
                v9 = nil
                v10 = nil
            end
        elseif not v10 and not v2 then
            v9 = v6
            v10 = v1
        end
        if not v9 then
            if v7 >= #v8 then
                v5 = 1
            else
                v5 = 0
            end
            v4 = #v8 + v5
            v5 = v6:gsub("^(['\"])", "")
            v8[v4] = decodeControlChars((v5:gsub("(['\"])$", "")))
        end
    end
    if v9 then
        local v11
        if v7 >= #v8 then
            v11 = 1
        else
            v11 = 0
        end
        v8[#v8 + v11] = decodeControlChars(v9)
    end
    return v8
end
function u12.mashExcessArguments(p1, p2) -- Line: 70
    local v1, v2
    local v3 = {}
    local v4 = #p1
    local v5 = 1
    v2, v1 = p2, p1
    for i = 1, v4, v5 do
        if v2 >= i then
            v3[i] = v1[i]
        else
            v3[v2] = ("%s %s"):format(v3[v2] or "", v1[i])
        end
    end
    return v3
end
function u12.removeExcessSpaces(p1) -- Line: 82
    local v1 = tostring(p1)
    if v1:sub(1, 1) == " " then
        v1 = v1:sub(2)
    end
    if v1:sub(-1) == " " then
        v1 = v1:sub(1, -2)
    end
    return v1
end
function u12.capitalizeAllFirstLetters(p1) -- Line: 97
    local v1 = string.lower(p1):gsub("_", " ")
    return (v1:gsub("(%a)([%w_']*)", function(p1, p2) -- Line: 99
    return string.upper(p1) .. p2
end))
end
function u12.toUpperUnderscores(p1) -- Line: 106
    return p1:upper():gsub(" ", "_")
end
function u12.camelCaseToText(p1) -- Line: 111
    local v1 = p1:gsub("(%u)", " %1")
    return v1:gsub("^%l", string.upper)
end
function u12.hashToInt16(p1) -- Line: 115
    local v1
    local v2 = 2166136261
    local v3 = #p1
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = string.byte(p1, i)
        if v1 == nil then
            break
        end
        v2 = bit32.bxor(v2, v1) * 16777619 % 65536
    end
    return v2
end
function u12.hashToInt32(p1) -- Line: 131
    local v1
    local v2 = 2166136261
    local v3 = #p1
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = string.byte(p1, i)
        if v1 == nil then
            break
        end
        v2 = bit32.bxor(v2, v1) * 16777619 % 4294967296
    end
    return v2
end
return u12