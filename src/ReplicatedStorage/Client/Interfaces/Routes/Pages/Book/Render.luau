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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Book.Render
--                               Dumped in 0.00877 seconds
--                          Bytecode version 9  |  64 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TextService = game:GetService("TextService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local zlib = require(Utilities_2:WaitForChild("zlib"))
local u74 = 0
local function maybeYield() -- Line: 34 -- upvalues: u74 (ref)
    u74 = u74 + 1
    if 10 <= u74 then
        u74 = 0
        task.wait()
    end
end
local function resetYieldCounter() -- Line: 42 -- upvalues: u74 (ref)
    u74 = 0
end
local u77 = {}
local u78 = {}
local function computeContentHash(p1) -- Line: 54
    local v1 = 5381
    local v2 = math.min(#p1, 1000)
    local v3 = 1
    for i = 1, v2, v3 do
        v1 = (v1 * 33 + string.byte(p1, i)) % 2147483647
    end
    return (v1 * 33 + #p1) % 2147483647
end
local function getCachedPages(p1) -- Line: 63 -- upvalues: computeContentHash (val), u77 (val)
    return u77[computeContentHash(p1)]
end
local function setCachedPages(p1, p2) -- Line: 68 -- upvalues: computeContentHash (val), u77 (val), u78 (val)
    local v1 = computeContentHash(p1)
    if u77[v1] then
        return
    end
    local v2 = #u78
    if 8 <= v2 then
        v2 = table.remove(u78, 1)
        if v2 then
            u77[v2] = nil
        end
    end
    u77[v1] = p2
    table.insert(u78, v1)
end
local u84 = Font.fromEnum(Enum.Font.Antique)
local u85 = {4, 4, 4, 4}
local u90 = {3, 2, 2, 1}
local function joinWordsForDebug(p1) -- Line: 195
    return table.concat(p1, " ")
end
local function layoutDebug(p1) end
local function escapeRichPlain(p1) -- Line: 213
    local v1 = string.gsub(p1, "&", "&amp;")
    v1 = string.gsub(v1, "<", "&lt;")
    return (string.gsub(v1, ">", "&gt;"))
end
local function splitLines(p1) -- Line: 220
    local v1
    local v2 = {}
    local v3 = 1
    while true do
        v1 = string.find(p1, "\n", v3, true)
        if not v1 then
            break
        end
        table.insert(v2, (string.sub(p1, v3, v1 - 1)))
        v3 = v1 + 1
    end
    table.insert(v2, (string.sub(p1, v3)))
    return v2
end
local function wrapAtxHeaderLine(p1) -- Line: 236
    local v1 = string.match(p1, "^###%s+(.+)$")
    if v1 then
        return (("<font size=\"24\"><b>%*</b></font>"):format(v1))
    end
    v1 = string.match(p1, "^##%s+(.+)$")
    if v1 then
        return (("<font size=\"28\"><b>%*</b></font>"):format(v1))
    end
    v1 = string.match(p1, "^#%s+(.+)$")
    if v1 then
        return (("<font size=\"34\"><b>%*</b></font>"):format(v1))
    end
    return p1
end
local function applyDelimiterPairs(p1, p2, p3, p4) -- Line: 252
    local v1, v2
    local v3 = #p2
    local v4 = {}
    local v5 = 1
    while v5 <= #p1 do
        v1 = string.find(p1, p2, v5, true)
        if not v1 then
            table.insert(v4, (string.sub(p1, v5)))
            break
        end
        table.insert(v4, (string.sub(p1, v5, v1 - 1)))
        v2 = string.find(p1, p2, v1 + v3, true)
        if not v2 then
            table.insert(v4, (string.sub(p1, v1)))
            break
        end
        table.insert(v4, p3 .. string.sub(p1, v1 + v3, v2 - 1) .. p4)
        v5 = v2 + v3
    end
    return table.concat(v4)
end
local function applyItalicSingleAsterisk(p1) -- Line: 275
    local v1, v2, v3
    local v4 = {}
    local v5 = 1
    local v6 = p1
    while v5 <= #v6 do
        v1 = string.find(v6, "*", v5, true)
        if not v1 then
            table.insert(v4, (string.sub(v6, v5)))
            break
        end
        if string.sub(v6, v1, v1 + 1) ~= "**" then
            v2 = string.find(v6, "*", v1 + 1, true)
            if not v2 then
                table.insert(v4, (string.sub(v6, v5, v1)))
                v5 = v1 + 1
            elseif string.sub(v6, v2, v2 + 1) ~= "**" then
                table.insert(v4, (string.sub(v6, v5, v1 - 1)))
                v3 = string.sub(v6, v1 + 1, v2 - 1)
                table.insert(v4, (("<i>%*</i>"):format(v3)))
                v5 = v2 + 1
            end
        else
            table.insert(v4, (string.sub(v6, v5, v1)))
            v5 = v1 + 1
        end
    end
    return table.concat(v4)
end
local function markdownLineToRichText(p1) -- Line: 303 -- upvalues: escapeRichPlain (val), applyDelimiterPairs (val), applyItalicSingleAsterisk (val)
    if p1 == "" then
        return ""
    end
    local v1 = escapeRichPlain(p1)
    v1 = applyDelimiterPairs(v1, "**", "<b>", "</b>")
    v1 = applyDelimiterPairs(v1, "~~", "<s>", "</s>")
    v1 = applyDelimiterPairs(v1, "__", "<u>", "</u>")
    return (applyItalicSingleAsterisk(v1))
end
local function markdownToRichText(p1) -- Line: 315 -- upvalues: escapeRichPlain (val), splitLines (val), wrapAtxHeaderLine (val), applyDelimiterPairs (val), applyItalicSingleAsterisk (val)
    if p1 == "" then
        return ""
    end
    local v1 = escapeRichPlain(p1)
    local v2 = splitLines(v1)
    local v3 = #v2
    local v4 = 1
    for i = 1, v3, v4 do
        v2[i] = wrapAtxHeaderLine(v2[i])
    end
    v3 = table.concat(v2, "\n")
    v3 = applyDelimiterPairs(v3, "**", "<b>", "</b>")
    v3 = applyDelimiterPairs(v3, "~~", "<s>", "</s>")
    v3 = applyDelimiterPairs(v3, "__", "<u>", "</u>")
    return (applyItalicSingleAsterisk(v3))
end
local function getTextLineWidthAsync(p1, p2) -- Line: 332 -- upvalues: u84 (val), TextService (val)
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Text = p1
    GetTextBoundsParams.Font = u84
    GetTextBoundsParams.Size = 20
    GetTextBoundsParams.Width = 0
    GetTextBoundsParams.RichText = p2
    return TextService:GetTextBoundsAsync(GetTextBoundsParams).X
end
local function getMarkdownLineWidthAsync(p1) -- Line: 343 -- upvalues: markdownLineToRichText (val), getTextLineWidthAsync (val)
    if p1 == "" then
        return 0
    end
    local v1 = markdownLineToRichText(p1)
    return getTextLineWidthAsync(v1, true)
end
local u107 = nil
local function getWrappedLineHeightAtPageWidth() -- Line: 352 -- upvalues: u107 (ref), u84 (val), TextService (val)
    local v1 = u107
    if v1 ~= nil then
        return v1
    end
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Text = "Ay"
    GetTextBoundsParams.Font = u84
    GetTextBoundsParams.Size = 20
    GetTextBoundsParams.Width = 410
    GetTextBoundsParams.RichText = false
    local Y = TextService:GetTextBoundsAsync(GetTextBoundsParams).Y
    u107 = Y
    return Y
end
local function textFitsSingleColumnLineAsync(p1, p2, p3) -- Line: 368 -- upvalues: getTextLineWidthAsync (val), getWrappedLineHeightAtPageWidth (val), u84 (val), TextService (val)
    if p1 == "" then
        return true
    end
    local v1 = p3 or false
    local v2 = getTextLineWidthAsync(p1, v1)
    if v2 <= p2 + 2 then
        return true
    end
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Text = p1
    GetTextBoundsParams.Font = u84
    GetTextBoundsParams.Size = 20
    GetTextBoundsParams.Width = p2
    GetTextBoundsParams.RichText = v1
    local v3 = TextService:GetTextBoundsAsync(GetTextBoundsParams).Y <= getWrappedLineHeightAtPageWidth() + 0.5
    return v3
end
local function markdownFitsSingleColumnLineAsync(p1, p2) -- Line: 387 -- upvalues: markdownLineToRichText (val), textFitsSingleColumnLineAsync (val)
    if p1 == "" then
        return true
    end
    local v1 = markdownLineToRichText(p1)
    return textFitsSingleColumnLineAsync(v1, p2, true)
end
local function lineHasInlineFormatting(p1) -- Line: 395
    local v1, v2
    if string.find(p1, "%*%*", 1, true) or string.find(p1, "~~", 1, true) or string.find(p1, "__", 1, true) then
        return true
    end
    local v3 = 1
    while true do
        v1 = string.find(p1, "*", v3, true)
        if not v1 then
            break
        end
        if string.sub(p1, v1, v1 + 1) ~= "**" then
            v2 = string.find(p1, "*", v1 + 1, true)
            if not v2 or string.sub(p1, v2, v2 + 1) == "**" then
                break
            end
            return true
        else
            v3 = v1 + 2
        end
    end
    return false
end
local function parseFormattedTokens(p1) -- Line: 418
    local v1, v2, v3, v4
    local u225 = {}
    local v5 = 1
    local v6 = #p1
    local function addPlainToken(p1) -- Line: 423 -- upvalues: u225 (val)
        if p1 ~= "" then
            table.insert(u225, {formatType = "plain", openDelim = "", closeDelim = "", text = p1})
        end
    end
    local v7 = p1
    while v5 <= v6 do
        if string.sub(v7, v5, v5 + 1) == "**" then
            v2 = string.find(v7, "**", v5 + 2, true)
            if not v2 then
                addPlainToken((string.sub(v7, v5, v5 + 1)))
                v5 = v5 + 2
            else
                v3 = string.sub(v7, v5 + 2, v2 - 1)
                table.insert(u225, {formatType = "bold", openDelim = "**", closeDelim = "**", text = v3})
                v5 = v2 + 2
            end
        elseif string.sub(v7, v5, v5 + 1) == "~~" then
            v2 = string.find(v7, "~~", v5 + 2, true)
            if not v2 then
                addPlainToken((string.sub(v7, v5, v5 + 1)))
                v5 = v5 + 2
            else
                v3 = string.sub(v7, v5 + 2, v2 - 1)
                table.insert(u225, {formatType = "strikethrough", openDelim = "~~", closeDelim = "~~", text = v3})
                v5 = v2 + 2
            end
        elseif string.sub(v7, v5, v5 + 1) == "__" then
            v2 = string.find(v7, "__", v5 + 2, true)
            if not v2 then
                addPlainToken((string.sub(v7, v5, v5 + 1)))
                v5 = v5 + 2
            else
                v3 = string.sub(v7, v5 + 2, v2 - 1)
                table.insert(u225, {formatType = "underline", openDelim = "__", closeDelim = "__", text = v3})
                v5 = v2 + 2
            end
        elseif string.sub(v7, v5, v5) ~= "*" then
            v2 = v6 + 1
            v3 = {"**", "~~", "__", "*"}
            for i, v in ipairs(v3) do
                v1 = string.find(v7, v, v5, true)
                if v1 and v1 < v2 then
                    v2 = v1
                end
            end
            addPlainToken((string.sub(v7, v5, v2 - 1)))
            v5 = v2
        elseif string.sub(v7, v5 + 1, v5 + 1) ~= "*" then
            v2 = nil
            v3 = v6
            v4 = 1
            for i2 = v5 + 1, v3, v4 do
                if string.sub(v7, i2, i2) == "*" and string.sub(v7, i2 + 1, i2 + 1) ~= "*" then
                    if i2 ~= 1 and string.sub(v7, i2 - 1, i2 - 1) == "*" then
                        continue
                    end
                    v2 = i2
                    break
                end
            end
            if not v2 then
                addPlainToken((string.sub(v7, v5, v5)))
                v5 = v5 + 1
            else
                v3 = string.sub(v7, v5 + 1, v2 - 1)
                table.insert(u225, {formatType = "italic", openDelim = "*", closeDelim = "*", text = v3})
                v5 = v2 + 1
            end
        end
    end
    return u225
end
local function tokensToMarkdown(p1) -- Line: 522
    local v1 = {}
    for i, v in ipairs(p1) do
        table.insert(v1, v.openDelim .. v.text .. v.closeDelim)
    end
    return table.concat(v1)
end
local function splitFormattedLineIntoWords(p1) -- Line: 530 -- upvalues: parseFormattedTokens (val), tokensToMarkdown (val)
    local text, v1, v2, v3, v4, v5
    local v6 = parseFormattedTokens(p1)
    local u86 = {}
    local u5 = {}
    local u55 = ""
    local function flushWord() -- Line: 536 -- upvalues: u5 (ref), u55 (ref), u86 (val), tokensToMarkdown (upval)
        local v1 = #u5
        if 0 < v1 then
            if string.match(u55, "^%s*(.-)%s*$") or "" ~= "" then
                local text
                local v2 = {}
                local v3 = false
                for i, v in ipairs(u5) do
                    text = v.text
                    if not v3 then
                        text = string.gsub(text, "^%s+", "")
                    end
                    if text ~= "" then
                        v3 = true
                        table.insert(v2, {text = text, formatType = v.formatType, openDelim = v.openDelim, closeDelim = v.closeDelim})
                    end
                end
                if 0 < #v2 then
                    local v4 = v2[#v2]
                    v4.text = string.gsub(v4.text, "%s+$", "")
                    if v4.text == "" then
                        table.remove(v2)
                    end
                end
                if 0 < #v2 then
                    table.insert(u86, {raw = tokensToMarkdown(v2), tokens = v2})
                end
            end
            u5 = {}
            u55 = ""
        elseif u55 == "" then
        end
    end
    for i, v in ipairs(v6) do
        text = v.text
        v1 = 1
        v2 = #text
        while v1 <= v2 do
            v3, v4 = string.find(text, "%s+", v1)
            if not v3 then
                v5 = string.sub(text, v1)
                if v5 == "" then
                    break
                end
                table.insert(u5, {text = v5, formatType = v.formatType, openDelim = v.openDelim, closeDelim = v.closeDelim})
                u55 = u55 .. v.openDelim .. v5 .. v.closeDelim
                break
            else
                if v1 < v3 then
                    v5 = string.sub(text, v1, v3 - 1)
                    table.insert(u5, {text = v5, formatType = v.formatType, openDelim = v.openDelim, closeDelim = v.closeDelim})
                    u55 = u55 .. v.openDelim .. v5 .. v.closeDelim
                end
                flushWord()
                v1 = v4 + 1
            end
        end
    end
    flushWord()
    return u86
end
local function hyphenSplitWordAfterPrefixAsync(p1, p2, p3) -- Line: 616 -- upvalues: textFitsSingleColumnLineAsync (val), u85 (val), u90 (val)
    local v1, v2, v3
    if p1 == "" then
        return "", ""
    end
    local function candidateLine(p1) -- Line: 623 -- upvalues: p2 (val)
        if p2 == "" then
            return p1
        end
        return p2 .. " " .. p1
    end
    local function fits(p1) -- Line: 629 -- upvalues: textFitsSingleColumnLineAsync (upval), candidateLine (val), p3 (val)
        local v1 = candidateLine(p1)
        return textFitsSingleColumnLineAsync(v1, p3)
    end
    if fits(p1) then
        return p1, ""
    end
    local function longestFittingBreak(a1, p2) -- Line: 635 -- upvalues: p1 (val), fits (val)
        local v1, v2
        if p2 < a1 or a1 < 1 then
            return nil
        end
        local v3 = a1
        local v4 = p2
        local v5 = nil
        while v3 <= v4 do
            v1 = math.floor((v3 + v4) / 2)
            v2 = string.sub(p1, 1, v1) .. "-"
            if string.sub(p1, v1 + 1) == "" then
                v4 = v1 - 1
            elseif fits(v2) then
                v5 = v1
                v3 = v1 + 1
            end
        end
        return v5
    end
    v3 = #u85
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = longestFittingBreak(u85[i], #p1 - u90[i])
        if v1 then
            v2 = string.sub(p1, 1, v1) .. "-"
            return v2, (string.sub(p1, v1 + 1))
        end
    end
    if 5 >= #p1 then
        v3 = 1
    else
        v3 = 2
    end
    v4 = longestFittingBreak(v3, #p1 - 1)
    if not v4 then
        return p1, ""
    end
    local v5 = string.sub(p1, 1, v4) .. "-"
    return v5, (string.sub(p1, v4 + 1))
end
local function hyphenSplitWordAsync(p1, p2) -- Line: 670 -- upvalues: hyphenSplitWordAfterPrefixAsync (val)
    return hyphenSplitWordAfterPrefixAsync(p1, "", p2)
end
local function _shouldJustifyWordLine(p1, p2) -- Line: 674
    local v1 = 1 < #p1
    return v1
end
local function _justifyWordLineAsync(p1, p2) -- Line: 678 -- upvalues: getTextLineWidthAsync (val)
    local v1, v2, v3
    if #p1 <= 1 then
        return table.concat(p1, " ")
    end
    local v4 = #p1 - 1
    local u57 = table.create(v4)
    local v5 = v4
    local v6 = 1
    for i = 1, v5, v6 do
        u57[i] = 1
    end
    local function build() -- Line: 687 -- upvalues: p1 (val), u57 (val)
        local v1
        local v2 = p1[1]
        local v3 = #p1
        local v4 = 1
        for i = 2, v3, v4 do
            v1 = string.rep(" ", u57[i - 1])
            v2 = v2 .. v1 .. p1[i]
        end
        return v2
    end
    v6 = 0
    v1 = p2
    while v6 < 600 do
        v2 = getTextLineWidthAsync(build(), false)
        if v1 - 2 <= v2 then
            break
        end
        v6 = v6 + 1
        v3 = (v6 - 1) % v4 + 1
        u57[v3] = u57[v3] + 1
        if v6 % 50 == 0 then
            task.wait()
        end
    end
    return build()
end
local function mergeShortHyphenOrphanLinesInPlace(p1) -- Line: 710 -- upvalues: textFitsSingleColumnLineAsync (val)
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = 2
    local v9 = p1
    while v8 <= #v9 do
        v1 = v9[v8]
        v2 = false
        if #v1 == 1 then
            v3 = v1[1]
            if string.sub(v3, -1) == "-" then
                v4 = #v3 - 1
                if 1 <= v4 and v4 <= 4 then
                    v5 = v9[v8 - 1]
                    v6 = {}
                    for i, v in ipairs(v5) do
                        table.insert(v6, v)
                    end
                    table.insert(v6, v3)
                    v7 = table.concat(v6, " ")
                    if textFitsSingleColumnLineAsync(v7, 410) then
                        v9[v8 - 1] = v6
                        table.remove(v9, v8)
                        v2 = true
                    end
                end
            end
        end
        if not v2 then
            v8 = v8 + 1
        end
    end
end
local function _wrapPlainWordsToLinesAsync(p1) -- Line: 740 -- upvalues: layoutDebug (val), textFitsSingleColumnLineAsync (val), hyphenSplitWordAfterPrefixAsync (val), joinWordsForDebug (val), hyphenSplitWordAsync (val), mergeShortHyphenOrphanLinesInPlace (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = {}
    for i in string.gmatch(p1, "%S+") do
        table.insert(v10, i)
    end
    if #v10 == 0 then
        return {}
    end
    local v11 = {}
    local v12 = {}
    local v13 = 1
    layoutDebug((("wrap-start words=%* line=\"%*\""):format(#v10, p1)))
    while v13 <= #v10 do
        v5 = v10[v13]
        if #v12 ~= 0 then
            v6 = table.concat(v12, " ") .. " " .. v5
        else
            v6 = v5
        end
        v7 = textFitsSingleColumnLineAsync(v6, 410)
        layoutDebug((("try wi=%* curCount=%* word=\"%*\" trialFits=%*"):format(v13, #v12, v5, v7)))
        if v7 then
            table.insert(v12, v5)
            v13 = v13 + 1
        elseif 0 >= #v12 then
            v8, v9 = hyphenSplitWordAsync(v5, 410)
            layoutDebug((("empty-line hyphen word=\"%*\" head=\"%*\" restLen=%*"):format(v5, v8, #v9)))
            if v9 ~= "" then
                layoutDebug((("emit-hyphen-head line=\"%*\" nextRest=\"%*\""):format(v8, v9)))
                table.insert(v11, {v8})
                v10[v13] = v9
            elseif v8 == v5 then
                layoutDebug((("emit-oversize-word word=\"%*\""):format(v5)))
                table.insert(v11, {v5})
                v13 = v13 + 1
            end
        elseif 6 > #v5 then
            layoutDebug((("flush-line (short word, whitespace break) emitted=\"%*\""):format((joinWordsForDebug(v12)))))
            table.insert(v11, v12)
            v12 = {}
        else
            v8 = table.concat(v12, " ")
            v9, v1 = hyphenSplitWordAfterPrefixAsync(v5, v8, 410)
            v3 = joinWordsForDebug(v12)
            layoutDebug((("overflow wi=%* cur=\"%*\" word=\"%*\" head=\"%*\" restLen=%*"):format(v13, v3, v5, v9, #v1)))
            if v1 == "" then
                layoutDebug((("flush-line (no hyphen fit) emitted=\"%*\""):format((joinWordsForDebug(v12)))))
                table.insert(v11, v12)
                v12 = {}
            else
                v2 = {}
                for i2, v in ipairs(v12) do
                    table.insert(v2, v)
                end
                table.insert(v2, v9)
                v4 = joinWordsForDebug(v2)
                layoutDebug((("emit-hyphen-line wi=%* line=\"%*\" nextRest=\"%*\""):format(v13, v4, v1)))
                table.insert(v11, v2)
                v12 = {}
                v10[v13] = v1
            end
        end
    end
    if 0 < #v12 then
        layoutDebug((("emit-tail line=\"%*\""):format((joinWordsForDebug(v12)))))
        table.insert(v11, v12)
    end
    mergeShortHyphenOrphanLinesInPlace(v11)
    layoutDebug((("wrap-end lines=%*"):format(#v11)))
    return v11
end
local function layoutPlainLineAsync(p1) -- Line: 812 -- upvalues: _wrapPlainWordsToLinesAsync (val), _shouldJustifyWordLine (val), _justifyWordLineAsync (val)
    if p1 == "" then
        return ""
    end
    local v1 = _wrapPlainWordsToLinesAsync(p1)
    if #v1 == 0 then
        return p1
    end
    local v2 = {}
    for i, v in ipairs(v1) do
        if i == #v1 then
            table.insert(v2, table.concat(v, " "))
        elseif not (_shouldJustifyWordLine(v, 410)) then
            table.insert(v2, table.concat(v, " "))
        else
            table.insert(v2, _justifyWordLineAsync(v, 410))
        end
    end
    return table.concat(v2, "\n")
end
local function _justifyFormattedWordLineAsync(p1, p2) -- Line: 833 -- upvalues: getMarkdownLineWidthAsync (val)
    local v1, v2, v3
    if #p1 <= 1 then
        return table.concat(p1, " ")
    end
    local v4 = #p1 - 1
    local u56 = table.create(v4)
    local v5 = v4
    local v6 = 1
    for i = 1, v5, v6 do
        u56[i] = 1
    end
    local function build() -- Line: 842 -- upvalues: p1 (val), u56 (val)
        local v1
        local v2 = p1[1]
        local v3 = #p1
        local v4 = 1
        for i = 2, v3, v4 do
            v1 = string.rep(" ", u56[i - 1])
            v2 = v2 .. v1 .. p1[i]
        end
        return v2
    end
    v6 = 0
    v1 = p2
    while v6 < 600 do
        v2 = getMarkdownLineWidthAsync(build())
        if v1 - 2 <= v2 then
            break
        end
        v6 = v6 + 1
        v3 = (v6 - 1) % v4 + 1
        u56[v3] = u56[v3] + 1
        if v6 % 50 == 0 then
            task.wait()
        end
    end
    return build()
end
local function _wrapFormattedWordsToLinesAsync(p1) -- Line: 865 -- upvalues: splitFormattedLineIntoWords (val), layoutDebug (val), markdownFitsSingleColumnLineAsync (val)
    local raw, v1, v2
    local v3 = splitFormattedLineIntoWords(p1)
    if #v3 == 0 then
        return {}
    end
    local v4 = {}
    local v5 = {}
    local v6 = 1
    layoutDebug((("wrap-rich-start words=%* line=\"%*\""):format(#v3, p1)))
    while v6 <= #v3 do
        raw = v3[v6].raw
        if #v5 ~= 0 then
            v1 = table.concat(v5, " ") .. " " .. raw
        else
            v1 = raw
        end
        v2 = markdownFitsSingleColumnLineAsync(v1, 410)
        layoutDebug((("try-rich wi=%* curCount=%* word=\"%*\" trialFits=%*"):format(v6, #v5, raw, v2)))
        if v2 then
            table.insert(v5, raw)
            v6 = v6 + 1
        elseif 0 >= #v5 then
            layoutDebug((("emit-rich-oversize-word word=\"%*\""):format(raw)))
            table.insert(v4, {raw})
            v6 = v6 + 1
        else
            layoutDebug((("flush-rich-line emitted=\"%*\""):format((table.concat(v5, " ")))))
            table.insert(v4, v5)
            v5 = {}
        end
    end
    if 0 < #v5 then
        layoutDebug((("emit-rich-tail line=\"%*\""):format((table.concat(v5, " ")))))
        table.insert(v4, v5)
    end
    layoutDebug((("wrap-rich-end lines=%*"):format(#v4)))
    return v4
end
local function layoutRichLineAsync(p1) -- Line: 910 -- upvalues: _wrapFormattedWordsToLinesAsync (val), _shouldJustifyWordLine (val), _justifyFormattedWordLineAsync (val)
    if p1 == "" then
        return ""
    end
    local v1 = _wrapFormattedWordsToLinesAsync(p1)
    if #v1 == 0 then
        return p1
    end
    local v2 = {}
    for i, v in ipairs(v1) do
        if i == #v1 then
            table.insert(v2, table.concat(v, " "))
        elseif not (_shouldJustifyWordLine(v, 410)) then
            table.insert(v2, table.concat(v, " "))
        else
            table.insert(v2, _justifyFormattedWordLineAsync(v, 410))
        end
    end
    return table.concat(v2, "\n")
end
local function preprocessBookLayoutAsync(p1) -- Line: 931 -- upvalues: splitLines (val), resetYieldCounter (val), lineHasInlineFormatting (val), layoutRichLineAsync (val), maybeYield (val), layoutPlainLineAsync (val)
    if p1 == "" then
        return p1
    end
    local v1 = splitLines(p1)
    local v2 = {}
    resetYieldCounter()
    for i, v in ipairs(v1) do
        if v == "" then
            table.insert(v2, "")
        elseif string.match(v, "^#+%s") then
            table.insert(v2, v)
        elseif not (lineHasInlineFormatting(v)) then
            table.insert(v2, layoutPlainLineAsync(v))
            maybeYield()
        else
            table.insert(v2, layoutRichLineAsync(v))
            maybeYield()
        end
    end
    return table.concat(v2, "\n")
end
local function getMarkdownPageBoundsAsync(p1) -- Line: 954 -- upvalues: markdownToRichText (val), u84 (val), TextService (val)
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Text = markdownToRichText(p1)
    GetTextBoundsParams.Font = u84
    GetTextBoundsParams.Size = 20
    GetTextBoundsParams.Width = 0
    GetTextBoundsParams.RichText = true
    return TextService:GetTextBoundsAsync(GetTextBoundsParams)
end
local function fitsHeightAsync(p1, p2) -- Line: 964 -- upvalues: getMarkdownPageBoundsAsync (val)
    local v1 = getMarkdownPageBoundsAsync(p1).Y <= p2 + 0.5
    return v1
end
local function maxFittingPrefixLenAsync(p1, p2) -- Line: 969 -- upvalues: fitsHeightAsync (val)
    local v1, v2, v3, v4
    if p1 == "" then
        return 0
    end
    local v5 = 0
    local v6 = #p1
    v1, v2 = p1, p2
    while v5 < v6 do
        v3 = math.ceil((v5 + v6 + 1) / 2)
        v4 = string.sub(v1, 1, v3)
        if not (fitsHeightAsync(v4, v2)) then
            v6 = v3 - 1
        else
            v5 = v3
        end
    end
    if v5 == 0 then
        return 1
    end
    return v5
end
local function refineCutAsync(p1, p2, p3) -- Line: 988 -- upvalues: fitsHeightAsync (val)
    local v1, v2, v3, v4
    if p2 <= 1 then
        return p2
    end
    local v5 = 1
    local v6 = -1
    for i = p2 - 1, v5, v6 do
        if string.byte(p1, i) == 10 then
            v4 = string.sub(p1, 1, i)
            if fitsHeightAsync(v4, p3) then
                return i
            end
            v2, v1, v3 = p2, p1, p3
            break
        end
    end
    v5 = 1
    v6 = -1
    for j = v2 - 1, v5, v6 do
        if string.sub(v1, j, j) == " " then
            v4 = string.sub(v1, 1, j)
            if fitsHeightAsync(v4, v3) then
                return j
            end
        end
    end
    return v2
end
local function trimLeadingWhitespace(p1) -- Line: 1012
    return (string.gsub(p1, "^%s+", ""))
end
local function splitIntoPagesAsync(p1) -- Line: 1016 -- upvalues: fitsHeightAsync (val), maxFittingPrefixLenAsync (val), refineCutAsync (val), trimLeadingWhitespace (val)
    local v1, v2
    local v3 = {}
    local v4 = p1
    local v5 = 0
    while v4 ~= "" do
        if fitsHeightAsync(v4, 538) then
            table.insert(v3, v4)
            break
        end
        v1 = maxFittingPrefixLenAsync(v4, 538)
        v1 = refineCutAsync(v4, v1, 538)
        v2 = string.sub(v4, 1, v1)
        v4 = trimLeadingWhitespace((string.sub(v4, v1 + 1)))
        table.insert(v3, v2)
        v5 = v5 + 1
        if v5 % 2 == 0 then
            task.wait()
        end
    end
    if #v3 == 0 then
        table.insert(v3, "")
    end
    return v3
end
local function base91Decode(p1) -- Line: 1049
    local v1, v2, v3
    if p1 == "" then
        return ""
    end
    local v4 = {}
    local v5 = 0
    local v6 = 0
    local v7 = -1
    local v8 = #p1
    local v9 = 1
    local v10 = p1
    for i = 1, v8, v9 do
        v2 = string.sub(v10, i, i)
        v3 = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#$%&()*+,-./:;<=>?@[]^_`{|}~", v2, 1, true)
        if v3 then
            v3 = v3 - 1
            if v7 >= 0 then
                v7 = v7 + v3 * 91
                v5 = v5 + v7 * 2 ^ v6
                if 88 >= v7 % 8192 then
                    v1 = 14
                else
                    v1 = 13
                end
                v6 = v6 + v1
                while 7 < v6 do
                    table.insert(v4, (string.char(v5 % 256)))
                    v5 = math.floor(v5 / 256)
                    v6 = v6 - 8
                end
                v7 = -1
            else
                v7 = v3
            end
        end
    end
    if -1 < v7 then
        table.insert(v4, (string.char((v5 + v7 * 2 ^ v6) % 256)))
    end
    return table.concat(v4)
end
local function parseExportCode(p1) -- Line: 1086 -- upvalues: base91Decode (val), zlib (val)
    local u20, v1, v2, v3
    if string.sub(p1, 1, 5) ~= "BOOK:" then
        return nil, nil, nil
    end
    local v4 = string.sub(p1, 6)
    if v4 == "" then
        return "", "", ""
    end
    v1, u20 = pcall(base91Decode, v4)
    if not v1 or u20 == "" then
        return nil, nil, nil
    end
    v2, v3 = pcall(function() -- Line: 1099 -- upvalues: zlib (upval), u20 (val)
        return zlib.decompressDeflate(u20)
    end)
    if not v2 or not v3 then
        return nil, nil, nil
    end
    local v5 = string.find(v3, "\000\001\000", 1, true)
    if not v5 then
        return nil, nil, nil
    end
    local v6 = string.find(v3, "\000\001\000", v5 + 3, true)
    if not v6 then
        return nil, nil, nil
    end
    local v7 = string.sub(v3, 1, v5 - 1)
    local v8 = string.sub(v3, v5 + 3, v6 - 1)
    return v7, v8, (string.sub(v3, v6 + 3))
end
local function makeSpreadNavRow(p1, p2, p3, p4, p5, p6, p7) -- Line: 1121 -- upvalues: u84 (val)
    local TextButton = Instance.new("TextButton")
    TextButton.Name = p2
    TextButton.AnchorPoint = p3
    TextButton.Position = p4
    TextButton.BackgroundTransparency = 1
    TextButton.Text = ""
    TextButton.TextTransparency = 1
    TextButton.AutoButtonColor = false
    TextButton.Active = true
    TextButton.Selectable = false
    TextButton.AutomaticSize = Enum.AutomaticSize.XY
    TextButton.ZIndex = 6
    TextButton.Parent = p1
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UIListLayout.Padding = UDim.new(0, 8)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = TextButton
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "Icon"
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Size = UDim2.fromOffset(10, 10)
    ImageLabel.Image = p5
    ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.ImageTransparency = 0
    ImageLabel.ResampleMode = Enum.ResamplerMode.Pixelated
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.Active = false
    ImageLabel.Selectable = false
    ImageLabel.Parent = TextButton
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Hint"
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = p6
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 13
    TextLabel.FontFace = u84
    TextLabel.TextWrapped = false
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Size = UDim2.fromOffset(0, 0)
    TextLabel.AutomaticSize = Enum.AutomaticSize.XY
    TextLabel.Active = false
    TextLabel.Selectable = false
    TextLabel.Parent = TextButton
    if p7 then
        ImageLabel.LayoutOrder = 1
        TextLabel.LayoutOrder = 2
        return TextButton
    end
    TextLabel.LayoutOrder = 1
    ImageLabel.LayoutOrder = 2
    return TextButton
end
local function createBook(p1, p2, p3, p4) -- Line: 1191 -- upvalues: u84 (val), makeSpreadNavRow (val), markdownToRichText (val), Sounds (val), Universal (val), getCachedPages (val), preprocessBookLayoutAsync (val), splitIntoPagesAsync (val), setCachedPages (val)
    local TextLabel, u32, u33, u34, u40, u41, u42
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Size = UDim2.fromOffset(1000, 640)
    ImageLabel.Image = "rbxassetid://81723012428976"
    ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
    ImageLabel.Parent = p4
    local u21 = {}
    local u22 = 0
    local u23 = 1
    local u24 = 1
    local u25 = true
    local function createPageColumn(p1, p2, p3) -- Line: 1206 -- upvalues: ImageLabel (val), u84 (upval)
        local Left, v1, v2, v3
        local Frame = Instance.new("Frame")
        Frame.Name = p1
        Frame.BackgroundTransparency = 1
        Frame.ClipsDescendants = false
        if not p2 then
            v1 = Vector2.new(1, 0.5)
        else
            v1 = Vector2.new(0, 0.5)
        end
        Frame.AnchorPoint = v1
        if not p2 then
            v2 = 1
        else
            v2 = 0
        end
        local v4 = UDim2.fromScale(v2, 0.5)
        if not p2 then
            v3 = -45
        else
            v3 = 45
        end
        Frame.Position = v4 + UDim2.fromOffset(v3, 6.5)
        v4 = UDim2.fromOffset(500, 640)
        Frame.Size = v4 - UDim2.fromOffset(90, 90)
        Frame.Parent = ImageLabel
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "PageNumber"
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.TextSize = 20
        TextLabel.FontFace = u84
        if not p2 then
            Left = Enum.TextXAlignment.Right
        else
            Left = Enum.TextXAlignment.Left
        end
        TextLabel.TextXAlignment = Left
        TextLabel.TextYAlignment = Enum.TextYAlignment.Top
        TextLabel.TextTransparency = 0.5
        TextLabel.Text = ""
        TextLabel.ZIndex = 4
        TextLabel.Parent = Frame
        if not p2 then
            TextLabel.AnchorPoint = Vector2.new(1, 0)
            TextLabel.Position = UDim2.new(1, 0, 0, -17)
        else
            TextLabel.AnchorPoint = Vector2.new(0, 0)
            TextLabel.Position = UDim2.new(0, 0, 0, -17)
        end
        local TextLabel_2 = Instance.new("TextLabel")
        TextLabel_2.Name = "PageHeader"
        TextLabel_2.BackgroundTransparency = 1
        TextLabel_2.AnchorPoint = Vector2.new(0.5, 0)
        TextLabel_2.Position = UDim2.new(0.5, 0, 0, -17)
        TextLabel_2.Size = UDim2.new(1, 0, 0, 0)
        TextLabel_2.AutomaticSize = Enum.AutomaticSize.Y
        TextLabel_2.Text = p3
        TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_2.TextSize = 20
        TextLabel_2.FontFace = u84
        TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center
        TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
        TextLabel_2.TextWrapped = true
        TextLabel_2.ZIndex = 3
        TextLabel_2.Parent = Frame
        local Frame_2 = Instance.new("Frame")
        Frame_2.Name = "TextClip"
        Frame_2.BackgroundTransparency = 1
        Frame_2.ClipsDescendants = true
        Frame_2.Position = UDim2.new(0, 0, 0, 12)
        Frame_2.Size = UDim2.new(1, 0, 1, -12)
        Frame_2.ZIndex = 2
        Frame_2.Parent = Frame
        local TextLabel_3 = Instance.new("TextLabel")
        TextLabel_3.Name = "PageText"
        TextLabel_3.AnchorPoint = Vector2.new(0, 0)
        TextLabel_3.Position = UDim2.new(0, 0, 0, 0)
        TextLabel_3.Size = UDim2.new(1, 0, 0, 0)
        TextLabel_3.AutomaticSize = Enum.AutomaticSize.Y
        TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel_3.TextYAlignment = Enum.TextYAlignment.Top
        TextLabel_3.TextWrapped = false
        TextLabel_3.TextSize = 20
        TextLabel_3.FontFace = u84
        TextLabel_3.BackgroundTransparency = 1
        TextLabel_3.RichText = true
        TextLabel_3.ZIndex = 2
        TextLabel_3.Parent = Frame_2
        return Frame, TextLabel_3, TextLabel, TextLabel_2
    end
    _, u32, u33, u34 = createPageColumn("LeftPage", true, p1)
    _, u40, u41, u42 = createPageColumn("RightPage", false, p2)
    TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "LoadingLabel"
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel.Position = UDim2.fromScale(0.5, 0.5)
    TextLabel.Size = UDim2.fromOffset(0, 0)
    TextLabel.AutomaticSize = Enum.AutomaticSize.XY
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "Loading..."
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 20
    TextLabel.FontFace = u84
    TextLabel.TextTransparency = 0.3
    TextLabel.ZIndex = 10
    TextLabel.Parent = ImageLabel
    local v1 = Vector2.new(0, 0.5)
    local v2 = UDim2.new(0, 45, 1, -31)
    local u87 = makeSpreadNavRow(ImageLabel, "SpreadBack", v1, v2, "rbxassetid://84983001347853", "Previous Page", true)
    v2 = Vector2.new(1, 0.5)
    local v3 = UDim2.new(1, -45, 1, -31)
    local u104 = makeSpreadNavRow(ImageLabel, "SpreadForward", v2, v3, "rbxassetid://107809646005523", "Next Page", false)
    u87.Visible = false
    u104.Visible = false
    local function refreshSpreadView() -- Line: 1334 -- upvalues: u25 (ref), u32 (val), u40 (val), u33 (val), u41 (val), u87 (val), u104 (val), u24 (ref), markdownToRichText (upval), u21 (ref), u34 (val), p1 (val), u42 (val), p2 (val), u22 (ref), u23 (ref)
        local v1, v2
        if u25 then
            u32.Text = ""
            u40.Text = ""
            u33.Text = ""
            u33.Visible = false
            u41.Text = ""
            u41.Visible = false
            u87.Visible = false
            u104.Visible = false
            return
        end
        local v3 = (u24 - 1) * 2 + 1
        local v4 = v3 + 1
        if u21[v3] == nil then
            v2 = ""
        else
            v2 = u21[v3]
        end
        u32.Text = markdownToRichText(v2)
        if u21[v4] == nil then
            v2 = ""
        else
            v2 = u21[v4]
        end
        u40.Text = markdownToRichText(v2)
        u34.Text = p1
        u42.Text = p2
        if v3 > u22 then
            v1 = ""
        else
            v1 = tostring(v3)
        end
        u33.Text = v1
        v1 = v3 <= u22
        u33.Visible = v1
        if v4 > u22 then
            u41.Text = ""
            u41.Visible = false
        else
            u41.Text = tostring(v4)
            u41.Visible = true
        end
        local v5 = 1 < u24
        v1 = u24 < u23
        u87.Visible = v5
        u104.Visible = v1
    end
    local function playPageSound() -- Line: 1372 -- upvalues: Sounds (upval), Universal (upval)
        local v1 = Universal.Book[math.random(1, #Universal.Book)]
        Sounds.playGlobalSoundEffect(v1, 0.1, 1, 20, NumberRange.new(0.9, 1.1))
    end
    u87.MouseButton1Click:Connect(function() -- Line: 1376 -- upvalues: u25 (ref), u24 (ref), playPageSound (val), refreshSpreadView (val)
        if not u25 and 1 < u24 then
            playPageSound()
            u24 = u24 - 1
            refreshSpreadView()
        end
    end)
    u104.MouseButton1Click:Connect(function() -- Line: 1385 -- upvalues: u25 (ref), u24 (ref), u23 (ref), playPageSound (val), refreshSpreadView (val)
        if not u25 and u24 < u23 then
            playPageSound()
            u24 = u24 + 1
            refreshSpreadView()
        end
    end)
    refreshSpreadView()
    v2 = getCachedPages(p3)
    if not v2 then
        task.spawn(function() -- Line: 1405 -- upvalues: preprocessBookLayoutAsync (upval), p3 (val), ImageLabel (val), splitIntoPagesAsync (upval), setCachedPages (upval), u21 (ref), u22 (ref), u23 (ref), u25 (ref), TextLabel (val), refreshSpreadView (val)
            local v1 = preprocessBookLayoutAsync(p3)
            if not ImageLabel.Parent then
                return
            end
            local v2 = splitIntoPagesAsync(v1)
            if not ImageLabel.Parent then
                return
            end
            setCachedPages(p3, v2)
            u21 = v2
            u22 = #u21
            u23 = math.max(1, (math.ceil(u22 / 2)))
            u25 = false
            TextLabel:Destroy()
            refreshSpreadView()
        end)
    else
        u22 = #v2
        u23 = math.max(1, (math.ceil(u22 / 2)))
        u25 = false
        TextLabel:Destroy()
        refreshSpreadView()
    end
    return {
        instance = ImageLabel,
        destroy = function() -- Line: 1427 -- upvalues: ImageLabel (val)
            ImageLabel:Destroy()
        end,
        setSpread = function(p1) -- Line: 1430 -- upvalues: u25 (ref), u23 (ref), u24 (ref), refreshSpreadView (val)
            if not u25 and 1 <= p1 and p1 <= u23 then
                u24 = p1
                refreshSpreadView()
            end
        end,
        getSpreadCount = function() -- Line: 1436 -- upvalues: u23 (ref)
            return u23
        end,
        getCurrentSpread = function() -- Line: 1439 -- upvalues: u24 (ref)
            return u24
        end,
    }
end
return {
    createBookFromCode = function(p1, p2) -- Line: 1449 -- upvalues: parseExportCode (val), createBook (val)
        local v1, v2, v3
        v1, v2, v3 = parseExportCode(p1)
        if not v1 or not v2 or not v3 then
            return nil
        end
        return createBook(v1, v2, v3, p2)
    end,
    parseExportCode = parseExportCode,
}