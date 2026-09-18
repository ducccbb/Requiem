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
--                         File: ReplicatedStorage.Common.Logger
--                               Dumped in 0.00206 seconds
--                          Bytecode version 9  |  31 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local u17 = {
    red = "rgb(255, 118, 118)",
    yellow = "rgb(255, 214, 120)",
    green = "rgb(120, 220, 150)",
    blue = "rgb(120, 180, 255)",
    purple = "rgb(192, 160, 255)",
    pink = "rgb(255, 150, 200)",
    orange = "rgb(255, 164, 107)",
    cyan = "rgb(125, 224, 255)",
    white = "rgb(235, 235, 235)",
    gray = "rgb(168, 168, 168)",
    grey = "rgb(168, 168, 168)",
    black = "rgb(20, 20, 20)",
}
local u18 = {}
local u19 = 0
local u20 = {}
local u21 = 0
local function nextId() -- Line: 83 -- upvalues: u19 (ref)
    u19 = u19 + 1
    return u19
end
local function inferChannel() -- Line: 92 -- upvalues: RunService (val)
    if RunService:IsServer() then
        return "Server"
    end
    if RunService:IsClient() then
        return "Client"
    end
    return "Unknown"
end
local function shortenSource(p1) -- Line: 109
    if p1 == nil or p1 == "" then
        return "<unknown>"
    end
    local v1 = string.gsub(p1, "^[^%w]+", "")
    v1 = string.gsub(v1, "\"%]$", "")
    if v1 == "" then
        return p1
    end
    local v2 = string.split(v1, ".")
    if #v2 <= 2 then
        return v1
    end
    local v3 = {}
    local v4 = #v2
    local v5 = 1
    for i = #v2 - 2 + 1, v4, v5 do
        table.insert(v3, v2[i])
    end
    return table.concat(v3, ".")
end
local function contextToString(p1) -- Line: 138
    if p1 == nil then
        return ""
    end
    local v1 = {}
    for k in pairs(p1) do
        table.insert(v1, (tostring(k)))
    end
    table.sort(v1)
    local v2 = {}
    local v3 = v1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        table.insert(v2, string.format("%s=%s", j, (tostring(p1[j]))))
    end
    if #v2 == 0 then
        return ""
    end
    return " {" .. table.concat(v2, ", ") .. "}"
end
local function pushToBuffer(p1) -- Line: 167 -- upvalues: u18 (val)
    table.insert(u18, p1)
    local v1 = #u18
    if 500 < v1 then
        table.remove(u18, 1)
    end
end
local function emitToConsole(p1) end
local function emitEntry(p1) -- Line: 206 -- upvalues: pushToBuffer (val), emitToConsole (val), u20 (val)
    pushToBuffer(p1)
    emitToConsole(p1)
    for k, v in pairs(u20) do
        v(p1)
    end
end
local function resolveCategory(p1, p2) -- Line: 244
    if p2 == nil then
        return p1
    end
    local category = p2.category
    if typeof(category) ~= "string" then
        return p1
    end
    if category ~= "" then
        return category
    end
    return p1
end
local function findCallerLine(p1) -- Line: 264 -- upvalues: shortenSource (val)
    local v1, v2
    local v3 = 12
    local v4 = 1
    local v5 = p1
    for i = 2, v3, v4 do
        v1 = debug.info(i, "s")
        if v1 == nil then
            return nil
        end
        if shortenSource(v1) == v5 then
            v2 = debug.info(i, "l")
            if typeof(v2) == "number" and 0 < v2 then
                return v2
            end
        end
    end
    return nil
end
local u36 = string.format("%%.%df", 2)
local function roundFloatsInText(p1) -- Line: 296 -- upvalues: u36 (val)
    return (string.gsub(p1, "%-?%d+%.%d+", function(p1) -- Line: 297 -- upvalues: u36 (upval)
    local v1, v2
    v1 = tonumber(p1)
    if v1 ~= nil then
        v2 = math.round(v1 * 100) / 100
        if v2 == 0 then
            v2 = 0
        end
        return string.format(u36, v2)
    else
        return p1
    end
end))
end
local function normalizeText(p1) -- Line: 319 -- upvalues: roundFloatsInText (val)
    local v1
    if typeof(p1) ~= "string" then
        v1 = tostring(p1)
    else
        v1 = p1
    end
    return roundFloatsInText(v1)
end
local function escapeRichText(p1) -- Line: 330
    local v1 = string.gsub(p1, "&", "&amp;")
    v1 = string.gsub(v1, "<", "&lt;")
    return (string.gsub(v1, ">", "&gt;"))
end
local function resolveColor(p1) -- Line: 343 -- upvalues: u17 (val)
    if typeof(p1) ~= "string" or p1 == "" then
        return nil
    end
    local v1 = u17[string.lower(p1)]
    if v1 then
        return v1
    end
    if string.match(p1, "^rgb%(.+%)$") or string.match(p1, "^#%x+$") then
        return p1
    end
    return nil
end
local function buildMessage(p1) -- Line: 368 -- upvalues: escapeRichText (val)
    local v1
    local v2 = {}
    local v3 = p1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = escapeRichText(j.text)
        if j.color then
            v1 = string.format("<font color=\"%s\">%s</font>", j.color, v1)
        end
        if i ~= 1 then
            v2[i] = "\n\t" .. v1
        else
            v2[i] = v1
        end
    end
    return table.concat(v2)
end
local function makeChain(p1, p2, p3) -- Line: 398 -- upvalues: buildMessage (val), u20 (val), normalizeText (val), resolveColor (val)
    local u3 = {}
    local function rebuildAndNotify() -- Line: 401 -- upvalues: p1 (val), buildMessage (upval), p2 (val), p3 (val), u20 (upval)
        p1.message = buildMessage(p2)
        if p3.emitted then
            for k, v in pairs(u20) do
                v(p1)
            end
        end
    end
    function u3.append(p1) -- Line: 411 -- upvalues: p2 (val), normalizeText (upval), rebuildAndNotify (val), u3 (val)
        table.insert(p2, {text = normalizeText(p1)})
        rebuildAndNotify()
        return u3
    end
    function u3.color(p1) -- Line: 417 -- upvalues: resolveColor (upval), p2 (val), u3 (val), rebuildAndNotify (val)
        local v1 = resolveColor(p1)
        if #p2 == 0 then
            return u3
        end
        p2[#p2].color = v1
        rebuildAndNotify()
        return u3
    end
    return u3
end
local function createLogger(p1, p2) -- Line: 438 -- upvalues: shortenSource (val), nextId (val), resolveCategory (val), inferChannel (val), findCallerLine (val), normalizeText (val), buildMessage (val), emitEntry (val), makeChain (val)
    local u16, u4
    local v1 = {}
    if not p1 then
        u4 = "General"
    elseif p1 ~= "" then
        u4 = p1
    end
    if typeof(p2) ~= "string" then
        u16 = shortenSource(debug.info(3, "s"))
    elseif p2 == "" then
        u16 = shortenSource(debug.info(3, "s"))
    else
        u16 = p2
    end
    local function emit(p1, p2, p3) -- Line: 447 -- upvalues: nextId (upval), resolveCategory (upval), u4 (val), u16 (val), inferChannel (upval), findCallerLine (upval), normalizeText (upval), buildMessage (upval), emitEntry (upval), makeChain (upval)
        local v1 = resolveCategory(u4, p3)
        local v2 = u16
        local v3 = findCallerLine(v2)
        local v4 = {
            {text = normalizeText(p2)},
        }
        local u20 = {
            logId = nextId(),
            timestamp = os.date("%H:%M:%S"),
            unixTimestamp = os.time(),
            source = v2,
            line = v3,
            channel = inferChannel(),
            category = v1,
            level = p1,
            message = buildMessage(v4),
            context = p3,
        }
        local u29 = {emitted = false}
        task.defer(function() -- Line: 474 -- upvalues: u29 (val), emitEntry (upval), u20 (val)
            if u29.emitted then
                return
            end
            u29.emitted = true
            emitEntry(u20)
        end)
        return makeChain(u20, v4, u29)
    end
    function v1.debug(p1, p2) -- Line: 491 -- upvalues: emit (val)
        return emit("DEBUG", p1, p2)
    end
    function v1.info(p1, p2) -- Line: 501 -- upvalues: emit (val)
        return emit("INFO", p1, p2)
    end
    function v1.warn(p1, p2) -- Line: 511 -- upvalues: emit (val)
        return emit("WARN", p1, p2)
    end
    function v1.error(p1, p2) -- Line: 521 -- upvalues: emit (val)
        return emit("ERROR", p1, p2)
    end
    return v1
end
local v2 = {
    getRecentLogs = function() -- Line: 219 -- upvalues: u18 (val)
        return table.clone(u18)
    end,
    subscribe = function(p1) -- Line: 228 -- upvalues: u21 (ref), u20 (val)
        u21 = u21 + 1
        local u3 = u21
        u20[u3] = p1
        return function() -- Line: 233 -- upvalues: u20 (upval), u3 (val)
            u20[u3] = nil
        end
    end,
}
setmetatable(v2, {
    __call = function(p1, p2, p3) -- Line: 534 -- upvalues: createLogger (val)
        return createLogger(p2, p3)
    end,
})
return v2