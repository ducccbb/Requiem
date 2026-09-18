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
--                   File: ReplicatedStorage.Common.Utilities.Grammar
--                               Dumped in 0.00642 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {Disabled = 1, Low = 2, Medium = 3, High = 4}
local u13 = {
    "Well",
    "Yes",
    "However",
    "Therefore",
    "Meanwhile",
    "First",
    "Second",
    "Finally",
    "Also",
    "Otherwise",
    "Instead",
    "Besides",
    "Actually",
    "Unfortunately",
    "Fortunately",
    "Honestly",
    "Anyway",
    "After all",
    "For example",
    "In addition",
    "Of course",
}
local u35 = {"and", "but", "or", "yet"}
local u40 = {
    ok = true,
    okay = true,
    yes = true,
    no = true,
    thanks = true,
    please = true,
    hi = true,
    bye = true,
}
local u41 = {
    what = true,
    who = true,
    where = true,
    when = true,
    why = true,
    how = true,
    which = true,
    whose = true,
    whom = true,
}
local u42 = {is = true, are = true, was = true, were = true}
u42["do"] = true
u42.does = true
u42.did = true
u42.can = true
u42.could = true
u42.would = true
u42.should = true
u42.will = true
u42.have = true
u42.has = true
u42.had = true
u42.am = true
local u59 = {
    i = true,
    you = true,
    he = true,
    she = true,
    it = true,
    we = true,
    they = true,
    there = true,
}
local u60 = {
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
local u73 = {
    "When",
    "Although",
    "Though",
    "If",
    "After",
    "Before",
    "Because",
    "While",
}
local u82 = {
    {"im", "I'm"},
    {"i'm", "I'm"},
    {"hes", "he's"},
    {"he's", "he's"},
    {"shes", "she's"},
    {"she's", "she's"},
    {"theyre", "they're"},
    {"they're", "they're"},
    {"youre", "you're"},
    {"you're", "you're"},
    {"we're", "we're"},
    {"dont", "don't"},
    {"don't", "don't"},
    {"cant", "can't"},
    {"can't", "can't"},
    {"wont", "won't"},
    {"won't", "won't"},
    {"isnt", "isn't"},
    {"isn't", "isn't"},
    {"arent", "aren't"},
    {"aren't", "aren't"},
    {"wasnt", "wasn't"},
    {"wasn't", "wasn't"},
    {"werent", "weren't"},
    {"weren't", "weren't"},
    {"hasnt", "hasn't"},
    {"hasn't", "hasn't"},
    {"havent", "haven't"},
    {"haven't", "haven't"},
    {"hadnt", "hadn't"},
    {"hadn't", "hadn't"},
    {"couldnt", "couldn't"},
    {"couldn't", "couldn't"},
    {"wouldnt", "wouldn't"},
    {"wouldn't", "wouldn't"},
    {"shouldnt", "shouldn't"},
    {"shouldn't", "shouldn't"},
    {"doesnt", "doesn't"},
    {"doesn't", "doesn't"},
    {"didnt", "didn't"},
    {"didn't", "didn't"},
    {"wouldve", "would've"},
    {"would've", "would've"},
    {"couldve", "could've"},
    {"could've", "could've"},
    {"shouldve", "should've"},
    {"should've", "should've"},
    {"mightve", "might've"},
    {"might've", "might've"},
    {"mustve", "must've"},
    {"must've", "must've"},
    {"thatll", "that'll"},
    {"that'll", "that'll"},
    {"therell", "there'll"},
    {"there'll", "there'll"},
    {"itll", "it'll"},
    {"it'll", "it'll"},
    {"ive", "I've"},
    {"i've", "I've"},
    {"youve", "you've"},
    {"you've", "you've"},
    {"weve", "we've"},
    {"we've", "we've"},
    {"theyve", "they've"},
    {"they've", "they've"},
    {"ill", "I'll"},
    {"i'll", "I'll"},
    {"youll", "you'll"},
    {"you'll", "you'll"},
    {"he'll", "he'll"},
    {"shell", "she'll"},
    {"she'll", "she'll"},
    {"we'll", "we'll"},
    {"theyll", "they'll"},
    {"they'll", "they'll"},
    {"id", "I'd"},
    {"i'd", "I'd"},
    {"youd", "you'd"},
    {"you'd", "you'd"},
    {"hed", "he'd"},
    {"he'd", "he'd"},
    {"shed", "she'd"},
    {"she'd", "she'd"},
    {"wed", "we'd"},
    {"we'd", "we'd"},
    {"theyd", "they'd"},
    {"they'd", "they'd"},
    {"lets", "let's"},
    {"let's", "let's"},
    {"thats", "that's"},
    {"that's", "that's"},
    {"whos", "who's"},
    {"who's", "who's"},
    {"whats", "what's"},
    {"what's", "what's"},
    {"heres", "here's"},
    {"here's", "here's"},
    {"theres", "there's"},
    {"there's", "there's"},
    {"its a ", "it's a "},
    {"its not ", "it's not "},
    {"its the ", "it's the "},
    {"its going ", "it's going "},
    {"its been ", "it's been "},
    {"its ok ", "it's ok "},
    {"its fine ", "it's fine "},
    {"its just ", "it's just "},
    {"its only ", "it's only "},
    {"its going", "it's going"},
    {"its been", "it's been"},
    {"its not", "it's not"},
    {"its the", "it's the"},
}
local v2 = {"its a", "it's a"}
u82[113] = v2
u82[114] = {"its ok", "it's ok"}
u82[115] = {"its fine", "it's fine"}
u82[116] = {"its just", "it's just"}
u82[117] = {"its only", "it's only"}
local u434 = {
    {"your welcome ", "you're welcome "},
    {"your welcome", "you're welcome"},
    {"your going ", "you're going "},
    {"your going", "you're going"},
    {"your right ", "you're right "},
    {"your right", "you're right"},
    {"your wrong ", "you're wrong "},
    {"your wrong", "you're wrong"},
    {"your so ", "you're so "},
    {"your the ", "you're the "},
    {"your my ", "you're my "},
    {"your not ", "you're not "},
    {"your here ", "you're here "},
    {"your late ", "you're late "},
    {"your early ", "you're early "},
    {"your amazing ", "you're amazing "},
    {"your crazy ", "you're crazy "},
    {"your the best ", "you're the best "},
    {"your the one ", "you're the one "},
    {"your awesome ", "you're awesome "},
    {"your probably ", "you're probably "},
    {"your gonna ", "you're gonna "},
    {"your gonna", "you're gonna"},
    {"there going ", "they're going "},
    {"there going", "they're going"},
    {"there coming ", "they're coming "},
    {"there coming", "they're coming"},
    {"there here ", "they're here "},
    {"there here", "they're here"},
    {"there not ", "they're not "},
    {"there not", "they're not"},
    {"there waiting ", "they're waiting "},
    {"there waiting", "they're waiting"},
    {"there right ", "they're right "},
    {"there wrong ", "they're wrong "},
    {"their going ", "they're going "},
    {"their going", "they're going"},
    {"their here ", "they're here "},
    {"their coming ", "they're coming "},
    {"its a ", "it's a "},
    {"its not ", "it's not "},
    {"its the ", "it's the "},
    {"its going ", "it's going "},
    {"its going", "it's going"},
    {"its ok ", "it's okay "},
    {"its ok", "it's okay"},
    {"its okay ", "it's okay "},
    {"its true ", "it's true "},
    {"its time ", "it's time "},
    {"its just ", "it's just "},
    {"its been ", "it's been "},
    {"its all ", "it's all "},
    {"its so ", "it's so "},
    {"its really ", "it's really "},
    {"could of ", "could have "},
    {"could of", "could have"},
    {"would of ", "would have "},
    {"would of", "would have"},
    {"should of ", "should have "},
    {"should of", "should have"},
    {"must of ", "must have "},
    {"must of", "must have"},
    {"might of ", "might have "},
    {"might of", "might have"},
    {"to much ", "too much "},
    {"to much", "too much"},
    {"to many ", "too many "},
    {"to many", "too many"},
    {"to late ", "too late "},
    {"to late", "too late"},
    {"to early ", "too early "},
    {"to bad ", "too bad "},
    {"to bad", "too bad"},
    {"to long ", "too long "},
    {"to short ", "too short "},
    {"to far ", "too far "},
    {"to hard ", "too hard "},
    {"to easy ", "too easy "},
    {"to big ", "too big "},
    {"to small ", "too small "},
    {"better then ", "better than "},
    {"better then", "better than"},
    {"more then ", "more than "},
    {"more then", "more than"},
    {"less then ", "less than "},
    {"less then", "less than"},
    {"rather then ", "rather than "},
    {"rather then", "rather than"},
    {"alot of ", "a lot of "},
    {"alot of", "a lot of"},
    {"lets go ", "let's go "},
    {"lets go", "let's go"},
    {"lets do ", "let's do "},
    {"lets get ", "let's get "},
    {"lets try ", "let's try "},
    {"dont know ", "don't know "},
    {"dont think ", "don't think "},
    {"dont want ", "don't want "},
    {"dont have ", "don't have "},
    {"cant wait ", "can't wait "},
    {"cant do ", "can't do "},
    {"cant go ", "can't go "},
    {"wont be ", "won't be "},
    {"wont go ", "won't go "},
    {"isnt it ", "isn't it "},
    {"wasnt it ", "wasn't it "},
    {"hasnt been ", "hasn't been "},
    {"havent been ", "haven't been "},
    {"wouldnt have ", "wouldn't have "},
    {"couldnt have ", "couldn't have "},
    {"shouldnt have ", "shouldn't have "},
    {"didnt know ", "didn't know "},
    {"didnt see ", "didn't see "},
    {"doesnt work ", "doesn't work "},
    {"that isnt ", "that isn't "},
}
local u780 = {
    {"gonna", "going to"},
    {"wanna", "want to"},
    {"gotta", "got to"},
    {"outta", "out of"},
    {"lotta", "lot of"},
    {"lotsa", "lots of"},
    {"coulda", "could have"},
    {"woulda", "would have"},
    {"shoulda", "should have"},
    {"musta", "must have"},
    {"mighta", "might have"},
    {"kinda", "kind of"},
    {"sorta", "sort of"},
    {"dunno", "don't know"},
    {"lemme", "let me"},
    {"gimme", "give me"},
    {"gotcha", "got you"},
    {"betcha", "bet you"},
    {"every1", "everyone"},
    {"some1", "someone"},
    {"any1", "anyone"},
    {"no1", "no one"},
    {"nevermind", "never mind"},
    {"eachother", "each other"},
    {"noone", "no one"},
    {"alot", "a lot"},
    {"abit", "a bit"},
    {"cmon", "come on"},
    {"cuz", "because"},
    {"cos", "because"},
    {"coz", "because"},
    {"becuase", "because"},
    {"bc", "because"},
    {"b/c", "because"},
    {"2moro", "tomorrow"},
    {"2morrow", "tomorrow"},
    {"tmrw", "tomorrow"},
    {"tmw", "tomorrow"},
    {"tmr", "tomorrow"},
    {"2day", "today"},
    {"l8r", "later"},
    {"l8", "late"},
    {"gr8", "great"},
    {"omw", "on my way"},
    {"brb", "be right back"},
    {"idk", "I don't know"},
    {"idrc", "I don't really care"},
    {"idc", "I don't care"},
    {"imo", "in my opinion"},
    {"tbh", "to be honest"},
    {"nvm", "never mind"},
    {"ik", "I know"},
    {"btw", "by the way"},
    {"atm", "at the moment"},
    {"rn", "right now"},
    {"np", "no problem"},
    {"thanx", "thanks"},
    {"plz", "please"},
    {"pls", "please"},
    {"thx", "thanks"},
    {"tho", "though"},
    {"srry", "sorry"},
    {"taht", "that"},
    {"dat", "that"},
    {"tehm", "them"},
    {"dis", "this"},
    {"tihs", "this"},
    {"wut", "what"},
    {"wat", "what"},
    {"wht", "what"},
    {"waht", "what"},
    {"adn", "and"},
    {"yea", "yes"},
    {"rly", "really"},
    {"luv", "love"},
    {"nite", "night"},
    {"thru", "through"},
    {"prob", "probably"},
    {"probs", "probably"},
    {"def", "definitely"},
    {"defo", "definitely"},
    {"smth", "something"},
    {"sth", "something"},
    {"ppl", "people"},
    {"til", "until"},
    {"w/o", "without"},
    {"w/", "with"},
    {"ur", "your"},
    {"u", "you"},
    {"r", "are"},
    {"ya", "you"},
    {"b4", "before"},
    {"n", "and"},
}
local u1060 = {
    {"mp", "Military Police"},
    {"sg", "Stationary Guard"},
    {"sl", "Scouting Legion"},
    {"tc", "Trainee Corps"},
    {"rg", "Royal Guard"},
    {"cp", "Crown Prosecutor"},
    {"etc", "et cetera"},
    {"eg", "for example"},
    {"ie", "that is"},
    {"vs", "versus"},
    {"approx", "approximately"},
    {"info", "information"},
    {"asap", "as soon as possible"},
    {"fyi", "for your information"},
    {"qty", "quantity"},
    {"ok", "okay"},
}
local u1109 = {
    "Her Majesty",
    "Our Lady",
    "Royal Palace",
    "Trainee Camp",
    "Shiganshina",
    "Trost",
    "Ehrmich",
    "Krovla",
    "Mitras",
    "Utopia",
    "Karanese",
    "Holst",
    "Quinta",
    "Acrita",
    "Yarkel",
    "Orvud",
    "Stohess",
    "Fritz",
    "Crown Prosecutor",
}
local u1129 = {}
u1129[0] = "zero"
u1129[1] = "one"
u1129[2] = "two"
u1129[3] = "three"
u1129[4] = "four"
u1129[5] = "five"
u1129[6] = "six"
u1129[7] = "seven"
u1129[8] = "eight"
u1129[9] = "nine"
u1129[10] = "ten"
local function normalizeWhitespace(p1) -- Line: 608
    local v1 = p1:gsub("%s+", " ")
    return v1:match("^%s*(.-)%s*$") or v1
end
local function fixCapitalizationAndI(p1) -- Line: 617
    local v1, v2, v3, v4, v5
    if p1 == "" then
        return p1
    end
    local v6 = p1:gsub("^i(%f[%A])", "I%1"):gsub("(%f[%w])i$", "%1I"):gsub("(%f[%w])i(%f[%A])", "%1I%2")
    local v7 = v6:byte(1)
    if 97 <= v7 and v7 <= 122 then
        v1 = string.upper(v6:sub(1, 1))
        v6 = v1 .. v6:sub(2)
    end
    return (v6:gsub("([%%.%%!%%?])%%s+([%%a])([%%w]*)", function(p1) -- Line: 638
    local v7, v1, v2
    v7, v1, v2 = p1:match("^([%%.%%!%%?])%%s+([%%a])([%%w]*)")
    if not v7 then
        return p1
    elseif not v1 then
        return p1
    else
        return v7 .. " " .. string.upper(v1) .. (v2 or "")
    end
end):gsub(": ([%a][%w]*)", function(p1) -- Line: 647
    local v2, v3, v4, v5, v8
    if p1 ~= "" then
        v2 = string.upper(p1:sub(1, 1))
        return ": " .. v2 .. p1:sub(2)
    else
        return p1
    end
end))
end
local function escapePatternLiteral(p1) -- Line: 660
    return (p1:gsub("[%%%(%)%.%+%-%*%?%[%]%^%$]", "%%%0"))
end
local function wordCaseInsensitivePattern(p1) -- Line: 665 -- upvalues: escapePatternLiteral (val)
    local v1, v2, v3
    local v4 = {}
    local v5 = #p1
    local v6 = 1
    local v7 = p1
    for i = 1, v5, v6 do
        v1 = v7:sub(i, i)
        if not (v1:match("%a")) then
            v4[#v4 + 1] = escapePatternLiteral(v1)
        else
            v2 = #v4 + 1
            v3 = string.lower(v1)
            v4[v2] = "[" .. v3 .. string.upper(v1) .. "]"
        end
    end
    return table.concat(v4, "")
end
local function abbreviationPattern(p1) -- Line: 679 -- upvalues: escapePatternLiteral (val)
    local v1, v2, v3
    local v4 = {}
    local v5 = #p1
    local v6 = 1
    local v7 = p1
    for i = 1, v5, v6 do
        v1 = v7:sub(i, i)
        if not (v1:match("%a")) then
            v4[#v4 + 1] = escapePatternLiteral(v1)
        else
            v2 = #v4 + 1
            v3 = string.lower(v1)
            v4[v2] = "[" .. v3 .. string.upper(v1) .. "]"
        end
    end
    return table.concat(v4, "")
end
local function fixCommonTerms(p1) -- Line: 695 -- upvalues: u780 (val), escapePatternLiteral (val)
    local v1, v2
    local v3 = u780
    local v4 = nil
    local v5 = nil
    local v6 = p1
    for i, j in v3, v4, v5 do
        v1 = "(" .. "%f[%w]" .. ")(" .. escapePatternLiteral(j[1]) .. ")(" .. "%f[%A]" .. ")"
        v2 = "%1" .. j[2]:gsub("%%", "%%%%") .. "%3"
        v6 = v6:gsub(v1, v2)
    end
    return v6
end
local function fixNumberWords(p1) -- Line: 709 -- upvalues: u1129 (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = {}
    local v8 = 1
    local v9 = p1
    while v8 <= #v9 do
        v1 = v9:sub(v8, v8)
        if not (v1:match("%d")) then
            table.insert(v7, v1)
            v8 = v8 + 1
        else
            v2 = v8
            while v2 <= #v9 do
                v3 = v9:sub(v2, v2)
                if not (v3:match("%d")) then
                    break
                end
                v2 = v2 + 1
            end
            v3 = v9:sub(v8, v2 - 1)
            v4 = v9:sub(v2, v2 + 1)
            v5 = if v4 ~= "st" then if v4 ~= "nd" then if v4 ~= "rd" then v4 == "th" else true else true else true
            v6 = tonumber(v3)
            if v5 then
                table.insert(v7, v3)
            elseif v6 and 0 <= v6 and v6 <= 10 and u1129[v6] then
                table.insert(v7, u1129[v6])
            end
            v8 = v2
        end
    end
    return table.concat(v7, "")
end
local function fixAbbreviations(p1) -- Line: 740 -- upvalues: u1060 (val), abbreviationPattern (val)
    local v1, v2
    local v3 = u1060
    local v4 = nil
    local v5 = nil
    local v6 = p1
    for i, j in v3, v4, v5 do
        v2 = "(" .. "%f[%w]" .. ")(" .. abbreviationPattern(j[1]) .. ")(" .. "%f[%A]" .. ")"
        v1 = "%1" .. j[2]:gsub("%%", "%%%%") .. "%3"
        v6 = v6:gsub(v2, v1)
    end
    return v6
end
local function fixProperNames(p1) -- Line: 754 -- upvalues: u1109 (val), wordCaseInsensitivePattern (val)
    local v1, v2, v3
    local v4 = u1109
    local v5 = nil
    local v6 = nil
    local v7 = p1
    for i, j in v4, v5, v6 do
        v1 = {}
        for k in j:gmatch("%S+") do
            v1[#v1 + 1] = wordCaseInsensitivePattern(k)
        end
        v2 = table.concat(v1, " ")
        v3 = "%1" .. j:gsub("%%", "%%%%") .. "%3"
        v7 = v7:gsub("(" .. "%f[%w]" .. ")(" .. v2 .. ")(" .. "%f[%A]" .. ")", v3)
    end
    return v7
end
local function fixContractions(p1) -- Line: 768 -- upvalues: u82 (val), escapePatternLiteral (val), u434 (val)
    local v1, v2, v3
    local v4 = u82
    local v5 = nil
    local v6 = nil
    local v7 = p1
    for i, j in v4, v5, v6 do
        v2 = "(" .. "%f[%w]" .. ")(" .. escapePatternLiteral(j[1]) .. ")(" .. "%f[%A]" .. ")"
        v3 = "%1" .. j[2]:gsub("%%", "%%%%") .. "%3"
        v7 = v7:gsub(v2, v3)
    end
    v4 = u434
    v5 = nil
    v6 = nil
    for k, n in v4, v5, v6 do
        v1 = escapePatternLiteral(n[1])
        v7 = v7:gsub(v1, n[2])
    end
    return (v7:gsub("(%f[%w]we) well ", "%1 we'll "):gsub("(%f[%w]We) well ", "%1 we'll "):gsub("(%f[%w])were (going|here|there|able|about|doing|waiting|trying|coming|leaving|getting|having|being|thinking|working|playing|living|looking|taking|making|talking|walking|running|sitting|standing)(%f[%A])", "%1we're %2%3"))
end
local function addCommas(p1) -- Line: 797 -- upvalues: u13 (val), wordCaseInsensitivePattern (val), u60 (val), escapePatternLiteral (val), u73 (val), u35 (val)
    local v1, v2, v3, v4, v5, v6
    v1 = (function(p1) -- Line: 799 -- upvalues: u13 (upval), wordCaseInsensitivePattern (upval)
        local v1, v2
        local v3 = u13
        local v4 = nil
        local v5 = nil
        local v6 = p1
        for i, j in v3, v4, v5 do
            v1 = wordCaseInsensitivePattern(j)
            v2 = "^" .. v1 .. " "
            v2 = "([%.%!%?])%s+" .. v1 .. " "
            v6 = v6:gsub(v2, j .. ", "):gsub(v2, "%1 " .. j .. ", ")
        end
        return v6
    end)(p1)
    v3 = u60
    v4 = nil
    local v7 = nil
    for i, j in v3, v4, v7 do
        v6 = escapePatternLiteral(j)
        v2 = "^(" .. v6 .. " %d+) (%d%d%d%d) "
        v2 = "^(" .. v6 .. " %d+, %d%d%d%d) "
        v2 = "^(" .. v6 .. " %d+) "
        v2 = "([%.%!%?]) (" .. v6 .. " %d+) (%d%d%d%d) "
        v2 = "([%.%!%?]) (" .. v6 .. " %d+, %d%d%d%d) "
        v2 = "([%.%!%?]) (" .. v6 .. " %d+) "
        v1 = v1:gsub(v2, "%1, %2, "):gsub(v2, "%1, "):gsub(v2, "%1, "):gsub(v2, "%1 %2, %3, "):gsub(v2, "%1 %2, "):gsub(v2, "%1 %2, ")
    end
    local u16 = {
        we = true,
        i = true,
        they = true,
        he = true,
        she = true,
        it = true,
    }
    local u17 = {}
    v7 = u73
    local v8 = nil
    v5 = nil
    for k, n in v7, v8, v5 do
        u17[n:lower()] = n
    end
    local function insertSubordinatingComma(p1) -- Line: 835 -- upvalues: u17 (val), u16 (val)
        local v1
        local v2 = p1:match("^%s*(.-)%s*$") or p1
        local v3 = p1:match("^(%s*)") or ""
        local v4 = p1:match("(%s*)$") or ""
        local v5 = v2:match("^(%a+)")
        if not v5 then
            return p1
        end
        local v6 = u17[v5:lower()]
        if not v6 then
            return p1
        end
        local v7 = v2:sub(#v5 + 1)
        v7 = v7:match("^%s*(.-)%s*$")
        if not v7 then
            v7 = v2:sub(#v5 + 1)
        end
        if v7 == "" then
            return p1
        end
        local v8 = {}
        for i in v7:gmatch("%S+") do
            v8[#v8 + 1] = i
        end
        if #v8 == 0 then
            return p1
        end
        local function v9(p1) -- Line: 858 -- upvalues: u16 (upval)
            local v1 = u16[p1:lower()] == true
            return v1
        end
        local v10 = 1
        if not (v9(v8[1])) then
            while v10 <= #v8 do
                if v9(v8[v10]) then
                    v1 = p1
                    break
                end
                v10 = v10 + 1
            end
        else
            v10 = 2
            while v10 <= #v8 do
                if v9(v8[v10]) then
                    v1 = p1
                    break
                end
                v10 = v10 + 1
            end
        end
        if #v8 < v10 then
            return v1
        end
        local v11 = table.concat(v8, " ", 1, v10 - 1)
        local v12 = table.concat(v8, " ", v10, #v8)
        return v3 .. (v6 .. " " .. v11 .. ", " .. v12) .. v4
    end
    v8 = {}
    for m, i5, i6, i7, i8 in v1:gmatch("([^.!?]*(%.[%*%_])?)([!?]%s*|%.%s+)|([^.!?]*(%.[%*%_]))$") do
        if m then
            v8[#v8 + 1] = insertSubordinatingComma(m) .. (i6 or "")
        elseif i7 then
            v8[#v8 + 1] = insertSubordinatingComma(i7) .. ""
        end
    end
    if #v8 ~= 0 then
        v1 = table.concat(v8, "")
    else
        v1 = insertSubordinatingComma(v1)
    end
    v5 = #u35
    v6 = 1
    for i9 = 1, v5, v6 do
        v1 = v1:gsub("(%a)%s+(" .. escapePatternLiteral(u35[i9]) .. ")%s+", "%1, %2 ")
    end
    return (v1:gsub("(%w+), (%w+) (and)(%s)", "%1, %2, %3%4"):gsub("(%w+), (%w+) (or)(%s)", "%1, %2, %3%4"))
end
local function looksLikeQuestion(p1) -- Line: 916 -- upvalues: u41 (val), u42 (val), u59 (val)
    local v1 = p1:match("^%s*([%w']+)")
    local v2 = p1:match("^%s*[%w']+%s+(%S+)")
    if not v1 then
        return false
    end
    local v3 = v1:lower()
    if u41[v3] then
        return true
    end
    local v4 = {
        "what",
        "who",
        "where",
        "when",
        "why",
        "how",
        "which",
        "whose",
        "whom",
    }
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        if v3:sub(1, #j) == j then
            return true
        end
    end
    if not (u42[v3]) or not v2 then
        return false
    end
    if u59[v2:lower()] then
        return true
    end
    return false
end
local function ensureTrailingPeriod(p1) -- Line: 942 -- upvalues: u40 (val), looksLikeQuestion (val)
    local v1 = p1:gsub("%s+$", "")
    if v1 == "" or v1:sub(1, 1) == "/" or v1:match("[%.%!%?]$") or v1:match("%.%.%.$") or v1:match("—$") or v1:match(",$") then
        return v1
    end
    local v2 = v1:match("^([%w']+)$")
    if not v2 then
        if v1:match("[%w%'\"]$") then
            if looksLikeQuestion(v1) then
                return v1 .. "?"
            end
            return v1 .. "."
        end
        return v1
    end
    if u40[v2:lower()] or not (v1:match("[%w%'\"]$")) then
        return v1
    end
    if looksLikeQuestion(v1) then
        return v1 .. "?"
    end
    return v1 .. "."
end
return {
    Strength = u12,
    onProcessString = function(p1, p2) -- Line: 984 -- upvalues: u12 (val), normalizeWhitespace (val), fixCapitalizationAndI (val), fixCommonTerms (val), fixAbbreviations (val), fixNumberWords (val), fixContractions (val), fixProperNames (val), addCommas (val), ensureTrailingPeriod (val)
        local High = p2
        if not High then
            High = u12.High
        end
        if High <= u12.Disabled then
            return p1
        end
        local v1 = normalizeWhitespace(p1)
        if High <= u12.Low then
            return (fixCapitalizationAndI(v1))
        end
        v1 = fixCommonTerms(v1)
        v1 = fixAbbreviations(v1)
        if u12.High <= High then
            v1 = fixNumberWords(v1)
        end
        v1 = fixContractions(v1)
        v1 = fixCapitalizationAndI(v1)
        v1 = fixProperNames(v1)
        if u12.High <= High then
            v1 = addCommas(v1)
        end
        return (ensureTrailingPeriod(v1))
    end,
}