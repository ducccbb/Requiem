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
--File: ReplicatedStorage.Common.Administration.Arguments.Universal.CustomizationValueArgument
--                              Dumped in 0.000883 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Extra = require(Customization:WaitForChild("Extra"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Customization_2 = Common_2:WaitForChild("Customization")
local Eyebrows = require(Customization_2:WaitForChild("Eyebrows"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Customization_3 = Common_3:WaitForChild("Customization")
local Eyes = require(Customization_3:WaitForChild("Eyes"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Customization_4 = Common_4:WaitForChild("Customization")
local Mouths = require(Customization_4:WaitForChild("Mouths"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u107 = {
    mouth = "Mouth",
    eyebrows = "Eyebrows",
    eyeframe = "Eye Frame",
    eyetype = "Eye Type",
    eyecolor = "Eye Color",
    complexion = "Complexion",
    burns = "Burns",
    freckles = "Freckles",
    moles = "Moles",
    scars = "Scars",
    haircolor = "Hair",
}
local u109 = {}
u109["Eye Type"] = {max = #Eyes}
u109["Eye Frame"] = {max = (function() -- Line: 33 -- upvalues: Eyes (val)
    local v1
    local v2 = 0
    local v3 = #Eyes
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = #Eyes[i].Frames
        if v2 < v1 then
            v2 = v1
        end
    end
    return v2
end)()}
u109.Mouth = {max = #Mouths.Mouths}
u109.Eyebrows = {max = #Eyebrows}
u109.Scars = {max = #Extra.Scars}
u109.Burns = {max = #Extra.Burns}
u109.Freckles = {max = #Extra.Freckles}
u109.Moles = {max = #Extra.Moles}
u109["Eye Color"] = {isColor = true}
u109.Hair = {isColor = true}
u109.Complexion = {isComplexion = true}
local function resolveTypeToken(p1) -- Line: 59 -- upvalues: u107 (val)
    if not p1 or p1 == "" then
        return nil
    end
    local v1 = p1:lower():gsub("%s+", "")
    if u107[v1] then
        return u107[v1]
    end
    for k, v in pairs(u107) do
        if v:lower():gsub("%s+", "") == v1 then
            return v
        end
    end
    return nil
end
local function getRangeForType(p1) -- Line: 75 -- upvalues: u109 (val)
    local v1 = u109[p1]
    if not v1 or v1.isColor then
        return nil
    end
    return v1.max
end
local function autocomplete(p1, p2, p3) -- Line: 96 -- upvalues: resolveTypeToken (val), getRangeForType (val), Table (val)
    local v1
    local v2 = if p2 and p3 and 1 <= p3 then resolveTypeToken(p2[p3]) else nil
    if not v2 then
        v1 = nil
    else
        v1 = getRangeForType(v2)
    end
    local v3 = {}
    if not v1 or 1 > v1 then
        return {}, Color3.fromRGB(255, 200, 150)
    end
    local v4 = v1
    local v5 = 1
    for i = 1, v4, v5 do
        table.insert(v3, (tostring(i)))
    end
    return Table.filter(v3, function(a1) -- Line: 115 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end), Color3.fromRGB(255, 200, 150)
end
local function getDescription(p1, p2) -- Line: 126 -- upvalues: resolveTypeToken (val), u109 (val)
    local v1 = if p1 and p2 and 1 <= p2 then resolveTypeToken(p1[p2]) else nil
    if not v1 then
        return "Value (ID or hex; depends on type)"
    end
    local v2 = u109[v1]
    if not v2 then
        return "Value (ID or hex; depends on type)"
    end
    if v2.isColor then
        return "Hex color (e.g. #RRGGBB)"
    end
    if v2.isComplexion then
        return "Complexion (0 - 1)"
    end
    local max = v2.max
    if not max then
        return "Value (ID or hex; depends on type)"
    end
    if 1 <= max then
        return ("ID (1 to %d)"):format(max)
    end
    return "Value (ID or hex; depends on type)"
end
local function sanitize(p1, p2) -- Line: 163
    return p2 or ""
end
return function(p1) -- Line: 169 -- upvalues: autocomplete (val), sanitize (val), getDescription (val)
    return {autocomplete = autocomplete, sanitize = sanitize, getDescription = getDescription, description = p1 or "Value (ID or hex; depends on type)"}
end