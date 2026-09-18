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
--                         File: ReplicatedStorage.Common.Config
--                               Dumped in 0.00119 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Constants = require(script.Parent:WaitForChild("Constants"))
local u19 = {}
local u20 = {}
local function normalizeSource(p1) -- Line: 47
    if p1 == nil or p1 == "" then
        return "Unknown"
    end
    local v1 = string.gsub(p1, "^@", "")
    v1 = string.gsub(v1, "^%[string%s+\"", "")
    v1 = string.gsub(v1, "\"%]$", "")
    v1 = string.gsub(v1, "\\", "/")
    v1 = string.gsub(v1, "^%./", "")
    v1 = string.gsub(v1, "^src/", "")
    v1 = string.gsub(v1, "%.luau$", "")
    v1 = string.gsub(v1, "%.lua$", "")
    if not (string.find(v1, "/", 1, true)) and string.find(v1, "%.", 1, true) then
        v1 = string.gsub(v1, "%.", "/")
    end
    v1 = string.gsub(v1, "/+", "/")
    v1 = string.gsub(v1, "^/", "")
    if v1 == "" then
        return "Unknown"
    end
    return v1
end
local function splitPath(p1) -- Line: 78
    local v1 = {}
    for i in string.gmatch(p1, "[^/]+") do
        table.insert(v1, i)
    end
    return v1
end
local function getCallerSource() -- Line: 92 -- upvalues: normalizeSource (val)
    local v1, v2
    local v3 = 3
    while true do
        v1 = debug.info(v3, "s")
        if v1 == nil then
            break
        end
        v2 = normalizeSource(v1)
        if v2 ~= "Unknown" and not (string.find(v2, "Common/Config", 1, true)) then
            return v2
        end
        v3 = v3 + 1
    end
    return "Unknown"
end
local function isUnderPrefix(p1, p2) -- Line: 117
    if p2 == "" or p1 == p2 then
        return true
    end
    local v1 = string.sub(p1, 1, #p2 + 1)
    local v2 = v1 == p2 .. "/"
    return v2
end
local function clearEntriesForSource(p1) -- Line: 134 -- upvalues: u20 (val)
    local v1 = 1
    local v2 = -1
    local v3 = p1
    for i = #u20, v1, v2 do
        if u20[i].source == v3 then
            table.remove(u20, i)
        end
    end
end
return {
    define = function(p1) -- Line: 149 -- upvalues: getCallerSource (val), splitPath (val), u19 (val), clearEntriesForSource (val), u20 (val)
        local v1 = getCallerSource()
        local v2 = splitPath(v1)
        u19[v1] = p1
        clearEntriesForSource(v1)
        for k, v in pairs(p1) do
            table.insert(u20, {source = v1, path = v2, key = k, value = v})
        end
        return p1
    end,
    getEntries = function() -- Line: 209 -- upvalues: u20 (val)
        return table.clone(u20)
    end,
    getEntriesForSource = function(p1) -- Line: 218 -- upvalues: normalizeSource (val), u20 (val)
        local v1 = normalizeSource(p1)
        local v2 = {}
        for i, v in ipairs(u20) do
            if v.source == v1 then
                table.insert(v2, v)
            end
        end
        return v2
    end,
    getEntriesUnder = function(p1) -- Line: 236 -- upvalues: normalizeSource (val), u20 (val), isUnderPrefix (val)
        local v1 = normalizeSource(p1)
        local v2 = {}
        for i, v in ipairs(u20) do
            if isUnderPrefix(v.source, v1) then
                table.insert(v2, v)
            end
        end
        return v2
    end,
    getSources = function() -- Line: 253 -- upvalues: u19 (val)
        local v1 = {}
        for k in pairs(u19) do
            table.insert(v1, k)
        end
        table.sort(v1)
        return v1
    end,
    getTree = function() -- Line: 268 -- upvalues: u20 (val)
        local v1, v2, v3
        local v4 = {name = "", path = {}, constants = {}, children = {}}
        for i, v in ipairs(u20) do
            v2 = v4
            v3 = {}
            for i2, i3 in ipairs(v.path) do
                table.insert(v3, i3)
                v1 = v2.children[i3]
                if v1 == nil then
                    v2.children[i3] = {name = i3, path = table.clone(v3), constants = {}, children = {}}
                end
                v2 = v1
            end
            v2.constants[v.key] = v.value
        end
        return v4
    end,
    getSubtree = function(p1) -- Line: 308 -- upvalues: normalizeSource (val), splitPath (val), u20 (val), isUnderPrefix (val)
        local v1, v2, v3, v4, v5, v6
        local v7 = normalizeSource(p1)
        local v8 = splitPath(v7)
        local v9 = #v8
        local v10 = {name = v8[v9] or "", path = v8, constants = {}, children = {}}
        for i, v in ipairs(u20) do
            if isUnderPrefix(v.source, v7) then
                v1 = v10
                v2 = table.clone(v8)
                v3 = #v.path
                v4 = 1
                for i2 = v9 + 1, v3, v4 do
                    v5 = v.path[i2]
                    table.insert(v2, v5)
                    v6 = v1.children[v5]
                    if v6 == nil then
                        v1.children[v5] = {name = v5, path = table.clone(v2), constants = {}, children = {}}
                    end
                    v1 = v6
                end
                v1.constants[v.key] = v.value
            end
        end
        return v10
    end,
    setValueAtPath = function(p1, p2, p3) -- Line: 178 -- upvalues: normalizeSource (val), u19 (val), u20 (val)
        local v1
        if typeof(p1) ~= "table" then
            v1 = normalizeSource(p1)
        else
            v1 = table.concat(p1, "/")
        end
        local v2 = u19[v1]
        if v2 == nil or v2[p2] == nil then
            return false
        end
        v2[p2] = p3
        local v3 = false
        for i, v in ipairs(u20) do
            if v.source == v1 and v.key == p2 then
                v.value = p3
                v3 = true
            end
        end
        return v3
    end,
    clear = function() -- Line: 356 -- upvalues: u19 (val), u20 (val)
        table.clear(u19)
        table.clear(u20)
    end,
    Constants = Constants,
}