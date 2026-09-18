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
--                    File: ReplicatedStorage.Common.Utilities.Number
--                               Dumped in 0.00156 seconds
--                          Bytecode version 9  |  11 functions

local NumberToText
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local u17 = {
    I = 1,
    V = 5,
    X = 10,
    L = 50,
    C = 100,
    D = 500,
    M = 1000,
}
local u18 = {
    1,
    5,
    10,
    50,
    100,
    500,
    1000,
}
local u26 = {
    "I",
    "V",
    "X",
    "L",
    "C",
    "D",
    "M",
}
local v2 = {}
function v2.ToRomanNumerals(p1) -- Line: 23 -- upvalues: u18 (val), u26 (val)
    local v1, v2, v3, v4, v5
    local v6 = tonumber(p1)
    if not v6 then
        error("Unable to convert to number")
    elseif v6 == v6 then
    end
    if v6 == math.huge then
        error("Unable to convert infinity")
    end
    v6 = math.floor(v6)
    if v6 <= 0 then
        return (tostring(v6))
    end
    local v7 = ""
    local v8 = 1
    local v9 = -1
    for i = #u18, v8, v9 do
        v2 = u18[i]
        while 0 <= v6 - v2 do
            if 0 >= v6 then
                break
            end
            v7 = v7 .. u26[i]
            v6 = v6 - v2
        end
        v3 = i - 1
        v4 = 1
        for j = 1, v3, v4 do
            v5 = u18[j]
            v1 = v6 - (v2 - v5)
            if 0 <= v1 and v6 < v2 and 0 < v6 and v2 - v5 ~= v5 then
                v7 = v7 .. u26[j] .. u26[i]
                v6 = v6 - (v2 - v5)
                break
            end
        end
    end
    return (tostring(v7))
end
function v2.ToNumber(p1) -- Line: 56 -- upvalues: u17 (val)
    local v1, v2, v3, v4
    local v5 = p1:upper()
    local v6 = 0
    local v7 = 1
    while v7 <= v5:len() do
        v1 = v5:sub(v7, v7)
        if v1 ~= " " then
            v2 = u17[v1]
            if not v2 then
                v2 = error("Unknown Roman Numeral '" .. v1 .. "'")
            end
            v3 = v5:sub(v7 + 1, v7 + 1)
            v4 = u17[v3]
            if not v3 then
                v6 = v6 + v2
            elseif v4 then
                if v2 >= v4 then
                    v6 = v6 + v2
                else
                    v6 = v6 + (v4 - v2)
                    v7 = v7 + 1
                end
            end
        end
        v7 = v7 + 1
    end
    return v6
end
function NumberToText(p1) -- Line: 88 -- upvalues: NumberToText (val)
    local convertHundreds, v1
    if p1 == 0 then
        return "zero"
    end
    if type(p1) ~= "number" then
        error("Number must be between 0 and 1,000,000,000,000 (1 trillion)")
    elseif p1 >= 0 and 1000000000000 >= p1 then
    end
    if p1 < 0 then
        return "negative " .. NumberToText(-p1)
    end
    local u18 = {}
    u18[0] = "zero"
    u18[1] = "one"
    u18[2] = "two"
    u18[3] = "three"
    u18[4] = "four"
    u18[5] = "five"
    u18[6] = "six"
    u18[7] = "seven"
    u18[8] = "eight"
    u18[9] = "nine"
    u18[10] = "ten"
    u18[11] = "eleven"
    u18[12] = "twelve"
    u18[13] = "thirteen"
    u18[14] = "fourteen"
    u18[15] = "fifteen"
    u18[16] = "sixteen"
    u18[17] = "seventeen"
    u18[18] = "eighteen"
    u18[19] = "nineteen"
    local u40 = {}
    u40[20] = "twenty"
    u40[30] = "thirty"
    u40[40] = "forty"
    u40[50] = "fifty"
    u40[60] = "sixty"
    u40[70] = "seventy"
    u40[80] = "eighty"
    u40[90] = "ninety"
    local v2 = {}
    local v3 = {value = 1000000000, name = "billion"}
    local v4 = {value = 1000000, name = "million"}
    v2[1] = {value = 1000000000000, name = "trillion"}
    v2[2] = v3
    v2[3] = v4
    v2[4] = {value = 1000, name = "thousand"}
    v2[5] = {value = 100, name = "hundred"}
    function convertHundreds(p1) -- Line: 149 -- upvalues: u18 (val), convertHundreds (val), u40 (val)
        local v1, v2
        if p1 == 0 then
            return ""
        end
        if u18[p1] then
            return u18[p1]
        end
        if 100 > p1 then
            v1 = math.floor(p1 / 10) * 10
            v2 = p1 % 10
            if v2 == 0 then
                return u40[v1]
            end
            return u40[v1] .. " " .. u18[v2]
        end
        v1 = math.floor(p1 / 100)
        v2 = p1 % 100
        local v3 = u18[v1] .. " hundred"
        if 0 < v2 then
            v3 = v3 .. " " .. convertHundreds(v2)
        end
        return v3
    end
    if p1 < 1000 then
        return convertHundreds(p1)
    end
    v3 = {}
    v4 = p1
    for i, v in ipairs(v2) do
        if v.value <= v4 then
            v1 = convertHundreds((math.floor(v4 / v.value))) .. " " .. v.name
            table.insert(v3, v1)
            v4 = v4 % v.value
        end
    end
    if 0 < v4 then
        table.insert(v3, convertHundreds(v4))
    end
    return table.concat(v3, " ")
end
return {
    ConvertNumberToRoman = v2.ToRomanNumerals,
    ConvertRomanToNumber = v2.ToNumber,
    NumberToText = NumberToText,
    GetLeadingTimestamp = function(p1) -- Line: 209 -- upvalues: Workspace (val)
        local v1, v2
        local v3 = Workspace:GetServerTimeNow() - (p1 or 0)
        if v3 < 0 then
            return "A few seconds"
        end
        local v4 = v3 / 60
        local v5 = v4 / 60
        local v6 = v5 / 24
        local v7 = v6 / 30.44
        if 1 <= v7 then
            v1 = math.floor(v7)
            if 2 > v7 then
                v2 = "month"
            else
                v2 = "months"
            end
            return (("%* %*"):format(v1, v2))
        end
        if 1 <= v6 then
            v1 = math.floor(v6)
            if 2 > v6 then
                v2 = "day"
            else
                v2 = "days"
            end
            return (("%* %*"):format(v1, v2))
        end
        if 1 <= v5 then
            v1 = math.floor(v5)
            if 2 > v5 then
                v2 = "hour"
            else
                v2 = "hours"
            end
            return (("%* %*"):format(v1, v2))
        end
        if 1 <= v4 then
            v1 = math.floor(v4)
            if 2 > v4 then
                v2 = "minute"
            else
                v2 = "minutes"
            end
            return (("%* %*"):format(v1, v2))
        end
        v1 = math.floor(v3)
        if 2 > v3 then
            v2 = "second"
        else
            v2 = "seconds"
        end
        return (("%* %*"):format(v1, v2))
    end,
    FormatWithCommas = function(p1) -- Line: 235
        local v1, v2
        local v3 = tostring(p1)
        while true do
            v1, v2 = string.gsub(v3, "^(-?%d+)(%d%d%d)", "%1,%2")
            v3 = v1
            if v2 == 0 then
                break
            end
        end
        return v3
    end,
    ConvertIsoTimestampToLocalTime = function(p1) -- Line: 248
        local v1
        local v2 = DateTime.fromIsoDate(p1):ToLocalTime()
        local v3 = 12 <= v2.Hour
        if not v3 then
            v1 = "AM"
        else
            v1 = "PM"
        end
        return (string.format("%s/%s %s:%s %s", v2.Month, v2.Day, v2.Hour % 12, v2.Minute, v1))
    end,
    ConvertUnixTimestampToLocalTime = function(p1) -- Line: 266
        local v1
        local v2 = DateTime.fromUnixTimestamp(p1):ToLocalTime()
        local v3 = 12 <= v2.Hour
        local v4 = v2.Hour % 12
        if v4 == 0 then
            v4 = 12
        end
        if not v3 then
            v1 = "AM"
        else
            v1 = "PM"
        end
        return (string.format("%s/%s %s:%02d %s", v2.Month, v2.Day, v4, v2.Minute, v1))
    end,
    FormatTimeString = function(p1) -- Line: 282
        local name, v1
        local v2 = {}
        local v3 = {name = "week", duration = 604800}
        local v4 = {name = "day", duration = 86400}
        local v5 = {name = "minute", duration = 60}
        v2[1] = v3
        v2[2] = v4
        v2[3] = {name = "hour", duration = 3600}
        v2[4] = v5
        v2[5] = {name = "second", duration = 1}
        if p1 == 0 then
            return "0 seconds"
        end
        v3 = {}
        v4 = p1
        for i, v in ipairs(v2) do
            v1 = math.floor(v4 / v.duration)
            if 0 < v1 then
                if v1 ~= 1 then
                    name = v.name .. "s"
                else
                    name = v.name
                end
                table.insert(v3, v1 .. " " .. name)
                v4 = v4 % v.duration
            end
        end
        if 1 >= #v3 then
            return v3[1]
        end
        v5 = table.concat(v3, ", ", 1, #v3 - 1)
        return v5 .. ", " .. v3[#v3]
    end,
    Round = function(p1, p2) -- Line: 318
        local v1 = math.floor(p1 * 10 ^ p2)
        return v1 / 10 ^ p2
    end,
}