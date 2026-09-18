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
--              File: ReplicatedStorage.Common.Utilities.PlayerInformation
--                              Dumped in 0.000455 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
}
local u25 = {
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
}
local function hasHadBirthdayThisYear(p1, p2, p3) -- Line: 52
    if p2 < p1.month then
        return true
    end
    if p1.month ~= p2 then
        return false
    end
    if p3 <= p1.day then
        return true
    end
    return false
end
local function isLeapYear(p1) -- Line: 64
    local v1
    if p1 % 4 ~= 0 then
        v1 = p1 % 400 == 0
    else
        v1 = if p1 % 100 == 0 then p1 % 400 == 0 else true
    end
    return v1
end
local function getDaysInMonth(p1, p2) -- Line: 68 -- upvalues: isLeapYear (val), u12 (val)
    if p1 ~= 2 or not p2 then
        return u12[p1] or 28
    end
    if isLeapYear(p2) then
        return 29
    end
    return u12[p1] or 28
end
return {
    MIN_AGE = 18,
    hasHadBirthdayThisYear = hasHadBirthdayThisYear,
    assignRandomBirthday = function(p1) -- Line: 78 -- upvalues: getDaysInMonth (val)
        local v1 = math.random(1, 12)
        return v1, (math.random(1, getDaysInMonth(v1, p1)))
    end,
    computeAge = function(p1, p2, p3, p4, p5, p6) -- Line: 86 -- upvalues: hasHadBirthdayThisYear (val)
        local v1 = p1 - p2
        if p5 and p6 then
            local v2 = {year = p1, month = p5, day = p6}
            if not (hasHadBirthdayThisYear(v2, p3, p4)) then
                v1 = v1 - 1
            end
        end
        return (math.max(v1, 18))
    end,
    formatDateOfBirth = function(p1, p2, p3) -- Line: 109 -- upvalues: u25 (val)
        local v1 = u25[p2]
        if not v1 then
            v1 = tostring(p2)
        end
        return (("%* %*, %*"):format(v1, p3, p1))
    end,
}