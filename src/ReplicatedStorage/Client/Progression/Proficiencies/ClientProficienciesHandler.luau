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
--  File: ReplicatedStorage.Client.Progression.Proficiencies.ClientProficienciesHandler
--                               Dumped in 0.00280 seconds
--                          Bytecode version 9  |  33 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Proficiencies = require(Namespaces:WaitForChild("Proficiencies"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Progression = Common_2:WaitForChild("Progression")
local ActiveSkillCooldown = require(Progression:WaitForChild("ActiveSkillCooldown"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Promise = require(Common_4:WaitForChild("Promise"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ClientAttributesHandler = require(u0.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local Enchantments = u0.Parent.Parent:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Progression_2 = Common_6:WaitForChild("Progression")
local Proficiencies_4 = Progression_2:WaitForChild("Proficiencies")
local Proficiencies_2 = require(Proficiencies_4:WaitForChild("Proficiencies"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Proficiencies_3 = require(Common_7:WaitForChild("Logger"))("Proficiencies")
local u169 = {}
local u170 = {}
local u171 = {}
local function getProficiencyKey(p1, p2) -- Line: 72
    local v1 = string.lower(p1)
    return v1 .. "::" .. string.lower(p2)
end
local function parseNodeFamilyAndLevel(p1) -- Line: 81 -- upvalues: Number (val)
    local v1, v2
    v1, v2 = string.match(p1, "^(.-)%s+([IVXLCDM]+)$")
    if not v1 or not v2 then
        return p1, 1
    end
    local v3 = Number.ConvertRomanToNumber(v2)
    if not v3 then
        return p1, 1
    end
    local v4 = string.gsub(v1, "%s+$", "")
    return v4, v3
end
local function resolveModule(p1, p2) -- Line: 99 -- upvalues: parseNodeFamilyAndLevel (val), u169 (val), getProficiencyKey (val)
    local v1, v2
    v1, v2 = parseNodeFamilyAndLevel(p2)
    local v3 = u169[getProficiencyKey(p1, v1)]
    if v3 then
        return v3, v1, v2
    end
    return u169[getProficiencyKey(p1, p2)], p2, 1
end
local function ensureProficiencyEffects(p1) -- Line: 115 -- upvalues: u170 (val)
    if not (u170[p1]) then
        u170[p1] = {}
    end
    return u170[p1]
end
local function clearFamilyEffect(p1, p2) -- Line: 128 -- upvalues: u170 (val), Proficiencies_3 (val)
    local v1 = u170[p1]
    if not v1 then
        return
    end
    local u4 = v1[p2]
    if u4 and u4.cleanup then
        local v2, v3
        v2, v3 = pcall(function() -- Line: 136 -- upvalues: u4 (val)
            u4.cleanup()
        end)
        if not v2 then
            Proficiencies_3.warn((("Client cleanup failed for %*.%*: %*"):format(p1, p2, v3)))
        end
    end
    v1[p2] = nil
end
local function clearProficiencyEffects(p1) -- Line: 153 -- upvalues: u170 (val), clearFamilyEffect (val)
    local v1 = u170[p1]
    if not v1 then
        return
    end
    for k in pairs(v1) do
        clearFamilyEffect(p1, k)
    end
    u170[p1] = nil
end
local function applyFamilyLevelEffect(p1, p2, p3, p4) -- Line: 174 -- upvalues: ensureProficiencyEffects (val), clearFamilyEffect (val), Proficiencies_3 (val)
    local v1, v2
    if not p4.unlocked then
        return
    end
    local v3 = ensureProficiencyEffects(p1)
    local v4 = v3[p2]
    if not v4 then
        clearFamilyEffect(p1, p2)
        v1, v2 = pcall(function() -- Line: 186 -- upvalues: p4 (val), p3 (val)
            return p4.unlocked(p3)
        end)
        if not v1 then
            Proficiencies_3.warn(string.format("Failed client unlocked handler %s.%s: %s", p1, p2, (tostring(v2))))
            return
        end
        v3[p2] = {level = p3, cleanup = v2}
        return
    end
    if p3 <= v4.level then
        return
    end
    clearFamilyEffect(p1, p2)
    v1, v2 = pcall(function() -- Line: 186 -- upvalues: p4 (val), p3 (val)
        return p4.unlocked(p3)
    end)
    if not v1 then
        Proficiencies_3.warn(string.format("Failed client unlocked handler %s.%s: %s", p1, p2, (tostring(v2))))
        return
    end
    v3[p2] = {level = p3, cleanup = v2}
end
local function runLifecycleHandler(p1, p2, p3) -- Line: 289 -- upvalues: resolveModule (val), Proficiencies_3 (val)
    local v1, v2
    local v3 = select(1, resolveModule(p1, p2))
    if not v3 then
        return true
    end
    local u11 = v3[p3]
    if type(u11) ~= "function" then
        return true
    end
    v1, v2 = pcall(function() -- Line: 300 -- upvalues: u11 (val)
        return u11()
    end)
    if not v1 then
        Proficiencies_3.warn(string.format("Failed %s handler %s.%s: %s", p3, p1, p2, (tostring(v2))))
        return false
    end
    local v4 = v2 ~= false
    return v4
end
local function refreshUnlockedEffectsFromStore(p1) -- Line: 448 -- upvalues: resolveModule (val), u170 (val), clearFamilyEffect (val), applyFamilyLevelEffect (val), clearProficiencyEffects (val)
    local name, unlocked, v1, v2, v3, v4, v5, v6
    local v7 = p1
    if not v7 then
        v7 = {}
    end
    local v8 = {}
    for i, v in ipairs(v7) do
        name = v.name
        v6 = string.lower(name)
        v8[v6] = true
        v6 = {}
        unlocked = v.unlocked
        if not unlocked then
            unlocked = {}
        end
        for i2, i3 in ipairs(unlocked) do
            v2, v3, v4 = resolveModule(name, i3)
            if v2 then
                v5 = v6[v3]
                if not v5 then
                    v6[v3] = {level = v4, module = v2}
                elseif v5.level >= v4 then
                end
            end
        end
        v1 = u170[name]
        if v1 then
            for k in pairs(v1) do
                if not (v6[k]) then
                    clearFamilyEffect(name, k)
                end
            end
        end
        for k2, j in pairs(v6) do
            applyFamilyLevelEffect(name, k2, j.level, j.module)
        end
    end
    for k3 in pairs(u170) do
        if not (v8[string.lower(k3)]) then
            clearProficiencyEffects(k3)
        end
    end
end
;(function() -- Line: 495 -- upvalues: u0 (val), Proficiencies_3 (val), u169 (val), getProficiencyKey (val)
    local v1, v2
    local Proficiencies = u0.Parent:FindFirstChild("Proficiencies")
    if not Proficiencies then
        return
    end
    for i, v in ipairs(Proficiencies:GetChildren()) do
        if v:IsA("Folder") then
            for i2, i3 in ipairs(v:GetChildren()) do
                if i3:IsA("ModuleScript") then
                    v1, v2 = pcall(function() -- Line: 511 -- upvalues: i3 (val)
                        return require(i3)
                    end)
                    if v1 then
                        u169[getProficiencyKey(v.Name, i3.Name)] = v2
                    else
                        Proficiencies_3.warn(string.format("Failed to cache client proficiency module %s.%s: %s", v.Name, i3.Name, (tostring(v2))))
                    end
                end
            end
        end
    end
end)()
Proficiencies.Request.listen(function(p1, ...) -- Line: 401 -- upvalues: resolveModule (val), Proficiencies_3 (val), Proficiencies (val)
    local name, node, v1, v2
    local u3 = table.pack(...)
    if type(p1) ~= "table" or type(p1.name) ~= "string" or p1.name == "" or type(p1.node) ~= "string" or p1.node == "" then
        return
    end
    local u21 = select(1, resolveModule(p1.name, p1.node))
    if not u21 or not u21.requested then
        return
    end
    v1, v2 = pcall(function() -- Line: 421 -- upvalues: u3 (val), Proficiencies_3 (upval), p1 (val), u21 (val), Proficiencies (upval)
        local v1 = ""
        local n = u3.n
        local v2 = 1
        for i = 1, n, v2 do
            v1 = v1 .. tostring(u3[i]) .. ", "
        end
        Proficiencies_3.info(string.format("Handling client request %s.%s", p1.name, p1.node)).append("Args: ").append(v1)
        v2 = table.unpack(u3, 1, u3.n)
        u21.requested(v2, function(...) -- Line: 431 -- upvalues: Proficiencies (upval), p1 (upval)
            Proficiencies.Request.unreliablePost({name = p1.name, node = p1.node}, ...)
        end)
    end)
    if not v1 then
        Proficiencies_3.warn(string.format("Failed handling client request %s.%s: %s", p1.name, p1.node, (tostring(v2))))
    end
end)
Proficiencies.CooldownResult.listen(function(p1) -- Line: 533 -- upvalues: u171 (val)
    if type(p1) ~= "table" or type(p1.id) ~= "number" then
        return
    end
    local v1 = u171[p1.id]
    if not v1 then
        return
    end
    u171[p1.id] = nil
    local v2 = {}
    local v3 = p1.onCooldown == 1
    v2.onCooldown = v3
    v2.remaining = tonumber(p1.remaining) or 0
    v1(v2)
end)
local LocalPlayer = Players.LocalPlayer
refreshUnlockedEffectsFromStore(Proficiencies.Store.get(LocalPlayer))
Proficiencies.Store.observe(LocalPlayer, function() -- Line: 555 -- upvalues: refreshUnlockedEffectsFromStore (val), Proficiencies (val), LocalPlayer (val)
    refreshUnlockedEffectsFromStore(Proficiencies.Store.get(LocalPlayer))
end)
return {
    activateProficiency = function(p1, p2) -- Line: 206 -- upvalues: resolveModule (val), Proficiencies_3 (val), Proficiencies (val)
        local v1, v2
        local u5 = resolveModule(p1, p2)
        if not u5 or not u5.activated then
            return
        end
        v1, v2 = pcall(function() -- Line: 212 -- upvalues: Proficiencies_3 (upval), p1 (val), p2 (val), u5 (val), Proficiencies (upval)
            Proficiencies_3.info(string.format("Activating client proficiency %s.%s", p1, p2))
            u5.activated(function(...) -- Line: 215 -- upvalues: Proficiencies (upval), p1 (upval), p2 (upval)
                Proficiencies.Request.post({name = p1, node = p2}, ...)
            end)
        end)
        if not v1 then
            Proficiencies_3.warn(string.format("Failed to activate client module %s.%s: %s", p1, p2, (tostring(v2))))
        end
    end,
    verifyProficiency = function(p1, p2) -- Line: 233 -- upvalues: Proficiencies_2 (val), ClientEnchantmentsHandler (val), Signals (val), resolveModule (val), Proficiencies_3 (val)
        local Enchantment, u41, u74, v1, v2, v3, v4, v5
        v2, v3 = pcall(function() -- Line: 234 -- upvalues: Proficiencies_2 (upval), p1 (val)
            return Proficiencies_2.getProficiencyTree(p1)
        end)
        if not v2 then
            u74, v1 = p1, p2
            u41 = resolveModule(u74, v1)
            if not u41 then
                Proficiencies_3.warn(string.format("Missing client module for %s.%s", u74, v1))
                return false
            end
            if not u41.verify then
                return true
            end
            v4, v5 = pcall(function() -- Line: 267 -- upvalues: u41 (val)
                return u41.verify()
            end)
            if not v4 then
                Proficiencies_3.warn(string.format("Failed to verify client module %s.%s: %s", u74, v1, (tostring(v5))))
                return false
            end
            if not v5 then
                return false
            end
            return true
        end
        local v6 = v3
        local v7 = nil
        local v8 = nil
        for i, j in v6, v7, v8 do
            if j.Name == p2 then
                Enchantment = j.Enchantment
                if not Enchantment or Enchantment == "" or ClientEnchantmentsHandler.hasEnchantment(Enchantment) then
                    u74, v1 = p1, p2
                    break
                end
                Signals.Toast:Fire({type = "error", message = ("You need the %* enchantment to use %*."):format(Enchantment, p2)})
                return false
            end
        end
        u41 = resolveModule(u74, v1)
        if not u41 then
            Proficiencies_3.warn(string.format("Missing client module for %s.%s", u74, v1))
            return false
        end
        if not u41.verify then
            return true
        end
        v4, v5 = pcall(function() -- Line: 267 -- upvalues: u41 (val)
            return u41.verify()
        end)
        if not v4 then
            Proficiencies_3.warn(string.format("Failed to verify client module %s.%s: %s", u74, v1, (tostring(v5))))
            return false
        end
        if not v5 then
            return false
        end
        return true
    end,
    startProficiency = function(p1, p2) -- Line: 317 -- upvalues: runLifecycleHandler (val)
        return runLifecycleHandler(p1, p2, "started")
    end,
    finishProficiency = function(p1, p2) -- Line: 327 -- upvalues: runLifecycleHandler (val)
        return runLifecycleHandler(p1, p2, "finished")
    end,
    checkCooldown = function(p1, p2) -- Line: 339 -- upvalues: Promise (val), u171 (val), Proficiencies (val)
        local u5 = math.random(1, 5000000)
        local v1 = Promise.new(function(a1) -- Line: 342 -- upvalues: u171 (upval), u5 (val), Proficiencies (upval), p1 (val), p2 (val)
            u171[u5] = a1
            Proficiencies.Cooldown.post({id = u5, name = p1, node = p2})
        end):timeout(3)
        return v1:catch(function() -- Line: 351 -- upvalues: u171 (upval), u5 (val)
            u171[u5] = nil
            return {onCooldown = false, remaining = 0}
        end)
    end,
    getProficiencySettings = function(p1, p2) -- Line: 380 -- upvalues: resolveModule (val)
        local blades, blocked_states, gear, handles
        local v1 = select(1, resolveModule(p1, p2))
        local settings = v1
        if settings then
            settings = v1.settings
        end
        local v2 = {}
        if not settings then
            gear = false
        else
            gear = settings.gear
        end
        v2.gear = gear
        if not settings then
            handles = false
        else
            handles = settings.handles
        end
        v2.handles = handles
        if not settings then
            blades = false
        else
            blades = settings.blades
        end
        v2.blades = blades
        if not settings then
            blocked_states = nil
        else
            blocked_states = settings.blocked_states
            if not blocked_states then
                blocked_states = nil
            end
        end
        v2.blocked_states = blocked_states
        return v2
    end,
    getScaledActiveSkillCooldown = function(p1) -- Line: 365 -- upvalues: ClientAttributesHandler (val), ActiveSkillCooldown (val)
        local ActiveSkillCooldownMultiplier = ClientAttributesHandler.getAttribute("ActiveSkillCooldownMultiplier")
        if typeof(ActiveSkillCooldownMultiplier) ~= "number" then
            return ActiveSkillCooldown.scaleCooldown(p1, nil)
        end
        return ActiveSkillCooldown.scaleCooldown(p1, ActiveSkillCooldownMultiplier)
    end,
}