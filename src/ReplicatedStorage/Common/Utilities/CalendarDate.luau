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
--                 File: ReplicatedStorage.Common.Utilities.CalendarDate
--                              Dumped in 0.000609 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local World = script.Parent.Parent:WaitForChild("World")
local u30 = 86400 / require(World:WaitForChild("Lighting")).Speed
local u31 = {
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
local u44 = {
    "Winter",
    "Winter",
    "Spring",
    "Spring",
    "Spring",
    "Summer",
    "Summer",
    "Summer",
    "Autumn",
    "Autumn",
    "Autumn",
    "Winter",
}
local function isLeapYear(p1) -- Line: 59
    local v1
    if p1 % 4 ~= 0 then
        v1 = p1 % 400 == 0
    else
        v1 = if p1 % 100 == 0 then p1 % 400 == 0 else true
    end
    return v1
end
local function getDaysInYear(p1) -- Line: 63 -- upvalues: isLeapYear (val)
    if isLeapYear(p1) then
        return 366
    end
    return 365
end
local function getDaysInMonth(p1, p2) -- Line: 67 -- upvalues: isLeapYear (val), u31 (val)
    if p2 ~= 2 then
        return u31[p2]
    end
    if isLeapYear(p1) then
        return 29
    end
    return u31[p2]
end
local function calculateDateTimeFromElapsedSeconds(p1) -- Line: 75 -- upvalues: getDaysInYear (val), getDaysInMonth (val)
    local v1 = 828
    local v2 = 1
    local v3 = 5
    local v4 = 0
    local v5 = 0
    local v6 = p1
    if 60 <= v6 then
        v5 = v5 + math.floor(v6 / 60)
        v6 = v6 % 60
    end
    if 60 <= v5 then
        v4 = v4 + math.floor(v5 / 60)
        v5 = v5 % 60
    end
    if 24 <= v4 then
        v3 = v3 + math.floor(v4 / 24)
        v4 = v4 % 24
    end
    local v7 = getDaysInYear(v1)
    while v7 < v3 do
        v3 = v3 - v7
        v1 = v1 + 1
        v7 = getDaysInYear(v1)
    end
    local v8 = getDaysInMonth(v1, v2)
    while v8 < v3 do
        v3 = v3 - v8
        v2 = v2 + 1
        if 12 < v2 then
            v2 = 1
            v1 = v1 + 1
        end
        v8 = getDaysInMonth(v1, v2)
    end
    return {
        year = v1,
        month = v2,
        day = v3,
        hour = v4,
        minute = v5,
        second = math.floor(v6),
    }
end
local function getCurrentDateTime() -- Line: 138 -- upvalues: Workspace (val), u30 (val), calculateDateTimeFromElapsedSeconds (val)
    local v1 = (Workspace:GetServerTimeNow() - 1781370901) * u30
    return calculateDateTimeFromElapsedSeconds(v1)
end
return {
    getCurrentDateTime = getCurrentDateTime,
    formatSeasonYear = function() -- Line: 152 -- upvalues: getCurrentDateTime (val), u44 (val)
        local v1 = getCurrentDateTime()
        local v2 = u44[v1.month] or "Summer"
        return (("%*, %*"):format(v2, v1.year))
    end,
}