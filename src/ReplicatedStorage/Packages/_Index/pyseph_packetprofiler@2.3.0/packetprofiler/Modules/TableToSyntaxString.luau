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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Modules.TableToSyntaxString
--                               Dumped in 0.00286 seconds
--                          Bytecode version 9  |  25 functions

local TableToSyntaxString
local Parent = script.Parent.Parent
local Packages = require(Parent.Modules.Packages)
local PacketSizeCounter = require(Packages.Directory.PacketSizeCounter)
local StudioSettings = require(Parent.Components.StudioSettings)
local u15 = {}
u15["\007"] = "\\a"
u15["\008"] = "\\b"
u15["\012"] = "\\f"
u15["\n"] = "\\n"
u15["\r"] = "\\r"
u15["\t"] = "\\t"
u15["\011"] = "\\v"
u15["\000"] = "\\0"
local u24 = {}
u24["and"] = true
u24["break"] = true
u24["do"] = true
u24["else"] = true
u24["elseif"] = true
u24["end"] = true
u24["false"] = true
u24["for"] = true
u24["function"] = true
u24["if"] = true
u24["in"] = true
u24["local"] = true
u24["nil"] = true
u24["not"] = true
u24["or"] = true
u24["repeat"] = true
u24["return"] = true
u24["then"] = true
u24["true"] = true
u24["until"] = true
u24["while"] = true
u24.continue = true
local u47 = {}
u47["&"] = "&amp;"
u47["<"] = "&lt;"
u47[">"] = "&gt;"
u47["\""] = "&quot;"
u47["'"] = "&apos;"
local function GetByteSize(p1) -- Line: 23 -- upvalues: PacketSizeCounter (val)
    local v1 = PacketSizeCounter.GetDataByteSize(p1)
    if v1 < 1000 then
        return (("%* bytes"):format(v1))
    end
    return string.format("%.3f kilobytes", v1 / 1000)
end
local u54 = {
    string = "ScriptString",
    number = "ScriptNumber",
    operator = "ScriptOperator",
    keyword = "ScriptKeyword",
    boolean = "ScriptKeyword",
    builtin = "ScriptBuiltInFunction",
    funcname = "ScriptFunctionName",
    text = "ScriptText",
}
u54["nil"] = "ScriptKeyword"
u54.bytesize = "ScriptComment"
u54.bracket = "ScriptBracket"
local u66 = {}
local function UpdateStyleGuideColors() -- Line: 47 -- upvalues: StudioSettings (val), u54 (val), u66 (val)
    local v1 = u54
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        u66[i] = ("#%*"):format((StudioSettings.Theme:GetColor(j):ToHex()))
    end
end
UpdateStyleGuideColors()
StudioSettings.ThemeChanged:Connect(UpdateStyleGuideColors)
local u75 = {}
u75.__index = u75
function u75.new(p1) -- Line: 61 -- upvalues: u75 (val)
    local v1 = {glyphCount = 0, trimmed = false, parts = {}, maxGlyphs = p1 or 20000}
    return (setmetatable(v1, u75))
end
function u75:getRemainingGlyphs() -- Line: 70
    return (math.max(0, self.maxGlyphs - self.glyphCount - 13))
end
function u75:canAddGlyphs(p2) -- Line: 74
    local v1 = self.glyphCount + p2 + 13
    local v2 = v1 <= self.maxGlyphs
    return v2
end
function u75:addRaw(p2) -- Line: 78
    if self.trimmed then
        return false
    end
    local v1 = #p2
    if self:canAddGlyphs(v1) then
        table.insert(self.parts, p2)
        self.glyphCount = self.glyphCount + v1
        return true
    end
    self.trimmed = true
    table.insert(self.parts, "... [Trimmed]")
    self.glyphCount = self.glyphCount + 13
    return false
end
function u75:addFormatted(p2, p3) -- Line: 94 -- upvalues: u66 (val)
    if self.trimmed then
        return false
    end
    local v1 = #p3
    if self:canAddGlyphs(v1) then
        table.insert(self.parts, p2)
        self.glyphCount = self.glyphCount + v1
        return true
    end
    local v2 = self:getRemainingGlyphs()
    if 0 < v2 then
        local v3 = string.sub(p3, 1, v2)
        local text = string.match(p2, "color=\"([^\"]+)\"")
        if not text then
            text = u66.text
        end
        table.insert(self.parts, string.format("<font color=\"%s\">%s</font>", text, v3))
        self.glyphCount = self.glyphCount + #v3
    end
    self.trimmed = true
    table.insert(self.parts, "... [Trimmed]")
    self.glyphCount = self.glyphCount + 13
    return false
end
function u75:toString() -- Line: 121
    return table.concat(self.parts)
end
function u75:isTrimmed() -- Line: 125
    return self.trimmed
end
local function Syntax(p1, p2, p3) -- Line: 129 -- upvalues: u66 (val)
    local text = u66[p2]
    if not text then
        text = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", text, p1)
    if not p3 then
        return v1
    end
    p3:addFormatted(v1, p1)
    return v1
end
local u84 = {}
u84["."] = function(p1) -- Line: 139 -- upvalues: u66 (val)
    local operator = u66.operator
    if not operator then
        operator = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", operator, ".")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, ".")
    return v1
end
u84[","] = function(p1) -- Line: 140 -- upvalues: u66 (val)
    local text = u66.text
    if not text then
        text = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", text, ",")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, ",")
    return v1
end
u84["="] = function(p1) -- Line: 141 -- upvalues: u66 (val)
    local operator = u66.operator
    if not operator then
        operator = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", operator, "=")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, "=")
    return v1
end
u84["("] = function(p1) -- Line: 142 -- upvalues: u66 (val)
    local bracket = u66.bracket
    if not bracket then
        bracket = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", bracket, "(")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, "(")
    return v1
end
u84[")"] = function(p1) -- Line: 143 -- upvalues: u66 (val)
    local bracket = u66.bracket
    if not bracket then
        bracket = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", bracket, ")")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, ")")
    return v1
end
u84["{"] = function(p1) -- Line: 144 -- upvalues: u66 (val)
    local bracket = u66.bracket
    if not bracket then
        bracket = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", bracket, "{")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, "{")
    return v1
end
u84["}"] = function(p1) -- Line: 145 -- upvalues: u66 (val)
    local bracket = u66.bracket
    if not bracket then
        bracket = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", bracket, "}")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, "}")
    return v1
end
u84["["] = function(p1) -- Line: 146 -- upvalues: u66 (val)
    local bracket = u66.bracket
    if not bracket then
        bracket = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", bracket, "[")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, "[")
    return v1
end
u84["]"] = function(p1) -- Line: 147 -- upvalues: u66 (val)
    local bracket = u66.bracket
    if not bracket then
        bracket = u66.text
    end
    local v1 = string.format("<font color=\"%s\">%s</font>", bracket, "]")
    if not p1 then
        return v1
    end
    p1:addFormatted(v1, "]")
    return v1
end
local function CleanupString(p1) -- Line: 150 -- upvalues: u15 (val), u47 (val)
    local v1 = string.gsub(p1, "[%c%z]", u15)
    return (string.gsub(v1, "[%&%<%>%\"%']", u47))
end
local function GetHierarchy(p1, p2) -- Line: 156 -- upvalues: u15 (val), u47 (val), u24 (val), u66 (val), u84 (val)
    local Parent, Parent_2, string, text, v1, v2, v3, v4, v5, v6, v7
    local v8 = {}
    local v9 = {}
    local v10 = true
    v1, v2 = p1, p2
    while v10 do
        Parent = v1.Parent
        Parent_2 = Parent
        if Parent_2 then
            Parent_2 = Parent.Parent
            if Parent_2 then
                Parent_2 = Parent ~= game
            end
        end
        v10 = Parent_2
        v7 = string.gsub(v1.Name, "[%c%z]", u15)
        v5 = string.gsub(v7, "[%&%<%>%\"%']", u47)
        if u24[v5] then
            v6 = ("&quot;%*&quot;"):format(v5)
            string = u66.string
            if not string then
                string = u66.text
            end
            v3 = u84["["](nil)
            v4 = u84["]"]
            table.insert(v8, 1, (("%*%*%*"):format(v3, string.format("<font color=\"%s\">%s</font>", string, v6), (v4(nil)))))
            table.insert(v9, 1, (("[\"%*\"]"):format(v5)))
        elseif string.match(v5, "^[_%a][_%w]*$") then
            if not v10 then
                v6 = ""
            else
                v6 = u84["."](nil)
            end
            text = u66.text
            if not text then
                text = u66.text
            end
            table.insert(v8, 1, (("%*%*"):format(v6, (string.format("<font color=\"%s\">%s</font>", text, v5)))))
            if not v10 then
                v3 = ""
            else
                v3 = "."
            end
            table.insert(v9, 1, (("%*%*"):format(v3, v5)))
        end
        v1 = Parent
    end
    local v11 = table.concat(v8)
    if v2 then
        v2:addFormatted(v11, (table.concat(v9)))
    end
    return v11
end
local function ReadBuffer(p1) -- Line: 192
    local v1 = buffer.len(p1)
    local v2 = table.create(v1)
    local v3 = v1 - 1
    local v4 = 1
    for i = 0, v3, v4 do
        table.insert(v2, (buffer.readu8(p1, i)))
    end
    return table.concat(v2, " ")
end
local function SerializeType(p1, p2, p3) -- Line: 202 -- upvalues: u15 (val), u47 (val), u66 (val), GetHierarchy (val), ReadBuffer (val), u84 (val)
    local string, v1, v2, v3, v4, v5, v6, v7
    if p2 == "string" then
        local v8 = string.gsub(p1, "[%c%z]", u15)
        v6 = string.gsub(v8, "[%&%<%>%\"%']", u47)
        v5 = ("\"%*\""):format(v6)
        v8 = ("&quot;%*&quot;"):format(v6)
        string = u66.string
        if not string then
            string = u66.text
        end
        v4 = string.format("<font color=\"%s\">%s</font>", string, v8)
        if p3 then
            p3:addFormatted(v4, v5)
        end
        return v4
    end
    if p2 == "Instance" then
        return (GetHierarchy(p1, p3))
    end
    if p2 == "buffer" then
        v6 = ReadBuffer(p1)
        v5 = ("buffer.new($%*)"):format(v6)
        local builtin = u66.builtin
        if not builtin then
            builtin = u66.text
        end
        v7 = u84["."](nil)
        local builtin_2 = u66.builtin
        if not builtin_2 then
            builtin_2 = u66.text
        end
        v1 = u84["("](nil)
        local number = u66.number
        if not number then
            number = u66.text
        end
        v2 = string.format("<font color=\"%s\">%s</font>", number, v6)
        v3 = u84[")"]
        v4 = ("%*%*%*%*%*%*"):format(string.format("<font color=\"%s\">%s</font>", builtin, "buffer"), v7, string.format("<font color=\"%s\">%s</font>", builtin_2, "new"), v1, v2, (v3(nil)))
    elseif type(p1) == p2 then
        v6 = tostring(p1)
        v5 = v6
        local text = u66[p2]
        if not text then
            text = u66.text
        end
        v4 = string.format("<font color=\"%s\">%s</font>", text, v6)
    else
        v6 = tostring(p1)
        v5 = ("%*.new(%*)"):format(p2, v6)
        local builtin_3 = u66.builtin
        if not builtin_3 then
            builtin_3 = u66.text
        end
        v7 = u84["."](nil)
        local builtin_4 = u66.builtin
        if not builtin_4 then
            builtin_4 = u66.text
        end
        v1 = u84["("](nil)
        local number_2 = u66.number
        if not number_2 then
            number_2 = u66.text
        end
        v2 = string.format("<font color=\"%s\">%s</font>", number_2, v6)
        v3 = u84[")"]
        v4 = ("%*%*%*%*%*%*"):format(string.format("<font color=\"%s\">%s</font>", builtin_3, p2), v7, string.format("<font color=\"%s\">%s</font>", builtin_4, "new"), v1, v2, (v3(nil)))
    end
    if p3 then
        p3:addFormatted(v4, v5)
    end
    return v4
end
function TableToSyntaxString(p1, p2, p3, p4, p5) -- Line: 232 -- upvalues: u75 (val), u66 (val), u84 (val), u15 (val), u47 (val), u24 (val), TableToSyntaxString (val), SerializeType (val), PacketSizeCounter (val)
    local bytesize, bytesize_2, string, string_2, v1, v2, v3, v4, v5, v6, v7
    local v8 = p5
    if not v8 then
        v8 = u75.new()
    end
    local v9 = v8
    v8 = p3
    if not v8 then
        v8 = {}
    end
    local v10 = v8
    if v10[p1] then
        v7 = v9
        string = u66.string
        if not string then
            string = u66.text
        end
        if v7 then
            v7:addFormatted(string.format("<font color=\"%s\">%s</font>", string, "&quot;[Cyclic reference]&quot;"), "&quot;[Cyclic reference]&quot;")
        end
        return v9:toString()
    end
    v10[p1] = true
    v7 = not p2
    local v11 = (p4 or 0) + 1
    local v12 = string.rep("    ", v11 - 1)
    local v13 = string.rep("    ", v11 - 2)
    local v14 = next(p1) == nil
    local v15 = true
    if v11 ~= 1 and not v14 then
        u84["{"](v9)
        v9:addRaw("\n")
    end
    local v16 = 1
    local v17 = p1
    local v18 = nil
    local v19 = nil
    for i, j in v17, v18, v19 do
        if v9:isTrimmed() then
            break
        end
        if v16 ~= i then
            v15 = false
        end
        v2 = typeof(i)
        v3 = typeof(j)
        if 1 < v16 then
            v9:addRaw("\n")
        end
        v9:addRaw(v12)
        if not v15 then
            if v2 ~= "string" then
                u84["["](v9)
                if v2 ~= "table" then
                    SerializeType(i, v2, v9)
                else
                    TableToSyntaxString(i, v1, v10, 1, v9)
                end
                u84["]"](v9)
            else
                v5 = string.gsub(i, "[%c%z]", u15)
                i = string.gsub(v5, "[%&%<%>%\"%']", u47)
                if u24[i] then
                    u84["["](v9)
                    v4 = ("&quot;%*&quot;"):format(i)
                    v5 = v9
                    string_2 = u66.string
                    if not string_2 then
                        string_2 = u66.text
                    end
                    if v5 then
                        v5:addFormatted(string.format("<font color=\"%s\">%s</font>", string_2, v4), v4)
                    end
                    u84["]"](v9)
                elseif string.match(i, "^[_%a][_%w]*$") then
                    v9:addRaw(i)
                end
            end
            if v2 ~= "table" and v7 then
                v6 = PacketSizeCounter.GetDataByteSize(i)
                if v6 >= 1000 then
                    v4 = string.format("%.3f kilobytes", v6 / 1000)
                else
                    v4 = ("%* bytes"):format(v6)
                end
                v5 = (": %* "):format(v4)
                v6 = v9
                bytesize = u66.bytesize
                if not bytesize then
                    bytesize = u66.text
                end
                if v6 then
                    v6:addFormatted(string.format("<font color=\"%s\">%s</font>", bytesize, v5), v5)
                end
            end
            v9:addRaw(" ")
            u84["="](v9)
            v9:addRaw(" ")
        end
        if v3 ~= "table" then
            SerializeType(j, v3, v9)
        else
            TableToSyntaxString(j, v1, v10, v11, v9)
        end
        if v3 ~= "table" and v7 then
            v5 = PacketSizeCounter.GetDataByteSize(j)
            if v5 >= 1000 then
                v4 = string.format("%.3f kilobytes", v5 / 1000)
            else
                v4 = ("%* bytes"):format(v5)
            end
            v5 = (": %*"):format(v4)
            v6 = v9
            bytesize_2 = u66.bytesize
            if not bytesize_2 then
                bytesize_2 = u66.text
            end
            if v6 then
                v6:addFormatted(string.format("<font color=\"%s\">%s</font>", bytesize_2, v5), v5)
            end
        end
        u84[","](v9)
        v16 = v16 + 1
    end
    if v11 == 1 then
        return v9:toString()
    end
    if not v14 then
        v9:addRaw("\n")
        v9:addRaw(v13)
        u84["}"](v9)
    else
        u84["{"](v9)
        u84["}"](v9)
    end
    return v9:toString()
end
return TableToSyntaxString