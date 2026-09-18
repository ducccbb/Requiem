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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Debug
--                               Dumped in 0.00230 seconds
--                          Bytecode version 9  |  21 functions

local GetErrorData
local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    DirectoryToString = function(p1) -- Line: 15
        local v1 = p1:GetFullName():gsub("%.(%w*%s%w*)", "%[\"%1\"%]")
        v1 = v1:gsub("%.(%d+[%w%s]+)", "%[\"%1\"%]")
        return (v1:gsub("%.(%d+)", "%[%1%]"))
    end,
}
function u12.Stringify(p1) -- Line: 30 -- upvalues: u12 (val)
    local v1, v2
    local ClassName = typeof(p1)
    if ClassName ~= "Instance" then
        v1 = tostring(p1)
    else
        ClassName = p1.ClassName
        v1 = u12.DirectoryToString(p1)
    end
    if ClassName ~= v1 then
        v2 = ClassName .. " " .. v1
    else
        v2 = v1
        if not v2 then
            v2 = ClassName .. " " .. v1
        end
    end
    return v2
end
local u16 = {}
u16["Index ?"] = "__index"
u16["Newindex ?"] = "__newindex"
local function Format(p1, ...) -- Line: 60
    return p1:format(...)
end
local u20 = {Name = "Command bar"}
function GetErrorData(p1, ...) -- Line: 66 -- upvalues: u20 (val), u12 (val), Format (val), u16 (val), GetErrorData (ref)
    local Name, v1, v2, v3
    local v4 = {...}
    local v5 = debug.traceback()
    local v6 = select(2, v5:gsub("\n", "")) - 2
    v1, v2 = p1:gsub("^!", "", 1)
    local v7 = v1
    if v2 ~= 1 then
        local script = getfenv(v6).script
        if not script then
            script = u20
        end
        Name = script.Name
    else
        Name = table.remove(v4, 1)
    end
    v2 = nil
    local v8 = select("#", ...)
    local v9 = 1
    for i = 1, v8, v9 do
        v4[i] = u12.Stringify(v4[i])
    end
    v8 = v5:sub(1, -11)
    for j in v8:gmatch("%- [^\r\n]+[\r\n]") do
        v2 = j
    end
    v8 = v2:sub(3, -2)
    v8 = v8:gsub("%l+ (%S+)$", "%1")
    v8 = v8:gsub("^%l", string.upper, 1)
    v2 = v8:gsub(" ([^\n\r]+)", " %1", 1)
    v8 = 0
    for k in v7:gmatch("%%%l") do
        v8 = v8 + 1
        if k == "%q" then
            v4[v8] = v4[v8]:gsub(" (%S+)$", " \"%1\"", 1)
        end
    end
    local v10 = "[%s] {%s} " .. v7:gsub("%%q", "%%s")
    v9, v3 = pcall(Format, v10, Name, u16[v2] or v2, unpack(v4))
    if v9 then
        return v3, v6
    end
    error(GetErrorData("!Error formatting failed, perhaps try escaping non-formattable tags like so: %%%%f\n(Error Message): " .. v3, "Debug"))
end
function u12.Warn(...) -- Line: 104 -- upvalues: GetErrorData (ref)
    warn((GetErrorData(...)))
end
function u12.Error(...) -- Line: 108 -- upvalues: GetErrorData (ref)
    error(GetErrorData(...))
end
function u12.Assert(p1, ...) -- Line: 112 -- upvalues: GetErrorData (ref)
    local v1 = p1
    if not v1 then
        v1 = error(GetErrorData(...))
    end
    return v1
end
local function Alphabetically(p1, p2) -- Line: 118
    local v1
    local v2 = type(p1)
    local v3 = type(p2)
    if v2 ~= v3 then
        v1 = v2 < v3
        return v1
    end
    if v2 == "number" then
        v1 = p1 < p2
        return v1
    end
    local v4 = tostring(p1):lower()
    v1 = v4 < tostring(p2):lower()
    return v1
end
function u12.AlphabeticalOrder(p1) -- Line: 133 -- upvalues: u0 (val), Alphabetically (val)
    local v1 = 0
    local u2 = {}
    local v2 = next
    local v3 = p1
    local v4 = nil
    for i in v2, v3, v4 do
        v1 = v1 + 1
        u2[v1] = i
    end
    require(u0.SortedArray).new(u2, Alphabetically)
    return function(p1, p2) -- Line: 151 -- upvalues: u2 (val)
        local v1
        if p2 ~= nil then
            local v2 = u2:Find(p2)
            if not v2 then
                v2 = error("invalid key to 'AlphabeticalOrder' " .. tostring(p2))
            end
            v1 = v2 + 1
        else
            v1 = 1
        end
        local v3 = u2[v1]
        return v3, p1[v3]
    end, p1, nil
end
function u12.UnionIteratorFunctions(...) -- Line: 158 -- upvalues: GetErrorData (ref)
    local u24 = {...}
    local v1 = #u24
    local v2 = 1
    for i = 1, v1, v2 do
        if type(u24[i]) ~= "function" then
            error(GetErrorData("Cannot union Iterator functions which aren't functions"))
        end
    end
    return function(p1) -- Line: 172 -- upvalues: u24 (val), GetErrorData (upval)
        local v1, v2, v3, v4
        local u48 = 0
        local u2 = {}
        u2[0] = {}
        local v5 = {}
        local v6 = #u24
        local v7 = 1
        local v8 = p1
        for i = 1, v6, v7 do
            v2, v3, v4 = u24[i](v8)
            if type(v2) ~= "function" then
                error(GetErrorData("Iterator function " .. i .. " must return a stack of types as follows: Function, Table, Variant"))
            elseif type(v3) == "table" then
            end
            while true do
                v1 = {v2(v3, v4)}
                v4 = v1[1]
                if v4 == nil then
                    break
                end
                if not (v5[v4]) then
                    v5[v4] = true
                    u48 = u48 + 1
                    v1[#v1 + 1] = i
                    u2[u48] = v1
                end
            end
        end
        return function(p1, p2) -- Line: 197 -- upvalues: u48 (ref), u2 (val), GetErrorData (upval)
            local v1
            local v2 = u48
            local v3 = 1
            for i = 0, v2, v3 do
                if u2[i][1] == p2 then
                    v1 = u2[i + 1]
                    if v1 then
                        return unpack(v1)
                    end
                    return nil
                end
            end
            error(GetErrorData("invalid key to unioned iterator function: " .. p2))
        end, v8, nil
    end
end
local u30 = typeof
if not u30 then
    u30 = type
end
local u37 = u12.UnionIteratorFunctions(function(p1) -- Line: 220
    return function(p1, p2) -- Line: 221
        if p2 ~= nil then
            return
        end
        if p1[0] ~= nil then
            return 0, p1[0]
        end
    end, p1, nil
end, ipairs, u12.AlphabeticalOrder)
local ConvertTableIntoString = nil
local function Parse(p1, p2, p3, p4) -- Line: 232 -- upvalues: u30 (val), ConvertTableIntoString (ref), u12 (val)
    local v1, v2, v3
    local v4 = u30(p1)
    if v4 == "table" then
        v1 = next
        v2 = p4
        v3 = nil
        for j, k in v1, v2, v3 do
            if k == p1 then
                if j == 1 then
                    return "[self]"
                end
                return "[table " .. j .. "]"
            end
        end
        return ConvertTableIntoString(p1, nil, p2, (p3 or 1) + 1, p4)
    end
    if v4 == "string" then
        v1 = {}
        v2 = math.ceil(#p1 / 60)
        v3 = 1
        for i = 1, v2, v3 do
            table.insert(v1, p1:sub((i - 1) * 60 + 1, i * 60))
        end
        return "\"" .. table.concat(v1, "\n" .. ("   "):rep(p3 + 1)) .. "\""
    end
    if v4 == "Instance" then
        v1 = "<" .. u12.DirectoryToString(p1) .. ">"
    elseif v4 == "function" then
        v1 = v4
        if not v1 then
            v1 = tostring(p1)
        end
    elseif v4 ~= "userdata" then
        v1 = tostring(p1)
    else
        v1 = v4
        if not v1 then
            v1 = tostring(p1)
        end
    end
    return v1
end
function ConvertTableIntoString(p1, p2, p3, p4, p5) -- Line: 263 -- upvalues: u37 (val), Parse (val), ConvertTableIntoString (ref), GetErrorData (ref), u30 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    if type(p1) ~= "table" then
        error(GetErrorData("[Debug] TableToString needs a table to convert to a string! Got type " .. u30(p1)))
        return
    end
    p5[#p5 + 1] = p1
    local v9 = {}
    local v10 = 0
    v5, v6, v1, v7, v2 = p3, p4, p1, p5, p2
    for i, j, k in u37(p1) do
        if k >= 1 then
            if not v5 then
                v10 = v10 - 1
            else
                v10 = v10 + 1
                v9[v10] = "\n"
                v9[v10 + 1] = ("   "):rep(v6)
            end
            if type(i) ~= "string" then
                v9[v10 + 2] = "["
                v9[v10 + 3] = Parse(i, v5, v6, v7)
                v9[v10 + 4] = "]"
            elseif not (i:find("^%d")) and not (i:find("%s")) then
                v9[v10 + 2] = i
                v10 = v10 - 2
            end
            v9[v10 + 5] = " = "
            v9[v10 + 6] = Parse(j, v5, v6, v7)
            if not v5 then
                v3 = ", "
            else
                v3 = ";"
            end
            v9[v10 + 7] = v3
            v10 = v10 + 7
        else
            if v10 == 0 and v5 then
                v9[v10 + 1] = "\n"
                v9[v10 + 2] = ("   "):rep(v6)
                v10 = v10 + 2
            end
            if k ~= 1 then
                v4 = ""
            else
                v4 = "[0] = "
            end
            v9[v10 + 1] = v4 .. Parse(j, v5, v6, v7)
            v9[v10 + 2] = ", "
            v10 = v10 + 2
        end
    end
    local v11 = 1
    if v9[v10] == ", " then
        if v5 then
            v11 = v11 + 2
        end
        v10 = v10 - 1
    elseif v5 and v10 ~= 0 then
        v9[v10 + 1] = "\n"
        v9[v10 + 2] = ("   "):rep(v6)
        v10 = v10 + 2
    end
    local v12 = getmetatable(v1)
    v11 = v11 - 1
    if not v5 then
        v10 = v10 + 1
    elseif v9[v10 - 1] == "\n" then
    end
    v9[v11] = "{"
    if 1 >= v10 then
        v8 = "}"
    else
        v8 = ("   "):rep(v6 - 1) .. "}"
    end
    v9[v10] = v8
    if v12 then
        if type(v12) ~= "table" then
            warn((GetErrorData((v2 or "Table") .. "'s metatable cannot be accessed. Got:\n" .. tostring(v12))))
        else
            v9[v10 + 1] = " <- "
            v9[v10 + 2] = ConvertTableIntoString(v12, nil, v5, v6, v7)
            v10 = v10 + 2
        end
    end
    if v2 then
        v9[v11 - 1] = " = "
        v9[v11 - 2] = v2
        v11 = v11 - 2
    end
    return table.concat(v9, "", v11, v10)
end
function u12.TableToString(p1, p2, p3) -- Line: 353 -- upvalues: ConvertTableIntoString (ref)
    return ConvertTableIntoString(p1, p2, p3, 1, {})
end
ConvertTableIntoString = table.concat({
    "%",
    "^",
    "$",
    "(",
    ")",
    ".",
    "[",
    "]",
    "*",
    "+",
    "-",
    "?",
}, "%")
local u64 = "([%" .. ConvertTableIntoString .. "])"
function u12.EscapeString(p1) -- Line: 368 -- upvalues: u64 (val)
    local v1 = p1:gsub(u64, "%%%1")
    return (v1:gsub("([\"'\\])", "\\%1"))
end
function u12.Inspect(p1) -- Line: 388 -- upvalues: u12 (val)
    if type(p1) == "table" then
        return "table " .. u12.TableToString(p1)
    end
    return u12.Stringify(p1)
end
return u12