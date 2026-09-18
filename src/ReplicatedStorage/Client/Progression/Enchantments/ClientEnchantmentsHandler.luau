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
--   File: ReplicatedStorage.Client.Progression.Enchantments.ClientEnchantmentsHandler
--                               Dumped in 0.00180 seconds
--                          Bytecode version 9  |  12 functions

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
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Progression = Common_2:WaitForChild("Progression")
local ActiveSkillCooldown = require(Progression:WaitForChild("ActiveSkillCooldown"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ClientAttributesHandler = require(u0.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local u120 = {}
local u121 = {}
;(function() -- Line: 262 -- upvalues: u0 (val), String (val), u121 (val), u120 (val)
    local Parent, v1, v2
    local Enchantments = u0.Parent:WaitForChild("Enchantments")
    for i, v in ipairs(Enchantments:GetDescendants()) do
        if v:IsA("ModuleScript") then
            v1 = String.hashToInt32(v.Name)
            if u121[v1] then
                warn("Collision @", v1, v.Name)
            end
            Parent = v.Parent
            if not Parent then
                if not Parent then
                    if not Parent then
                        if not Parent then
                            if not Parent then
                                if not Parent then
                                    if not Parent then
                                        if not Parent then
                                            v2 = 0
                                        elseif Parent.Name == "Special" then
                                            v2 = 8
                                        end
                                    elseif Parent.Name == "Unique" then
                                        v2 = 7
                                    end
                                elseif Parent.Name == "Mythic" then
                                    v2 = 6
                                end
                            elseif Parent.Name == "Legendary" then
                                v2 = 5
                            end
                        elseif Parent.Name == "Epic" then
                            v2 = 4
                        end
                    elseif Parent.Name == "Rare" then
                        v2 = 3
                    end
                elseif Parent.Name == "Uncommon" then
                    v2 = 2
                end
            elseif Parent.Name == "Common" then
                v2 = 1
            end
            u120[v.Name] = require(v)
            u121[v.Name] = {module = v, hash = v1, rarity = v2}
        end
    end
end)()
Enchantments.Request.listen(function(p1, ...) -- Line: 174 -- upvalues: u120 (val)
    if p1 == "Calculator" then
        warn("[Calculator Client Handler]", "network request received for Calculator", ...)
    end
    local v1 = u120[p1]
    if not v1 then
        if p1 == "Calculator" then
            local v2 = v1 ~= nil
            warn("[Calculator Client Handler]", "missing requested handler in cache", v2)
        end
        return
    elseif v1.requested then
        v1.requested(...)
        return
    end
end)
return {
    getEnchantmentFromHash = function(p1) -- Line: 204 -- upvalues: u121 (val), u120 (val), Table (val)
        local art, blades, description, embers, gear, glow, handles, icon, merge, settings, settings_2, v1, v2, v3
        for k, v in pairs(u121) do
            if typeof(v) == "table" and v.hash == p1 then
                v2 = u120[k]
                settings = v2
                if settings then
                    settings = v2.settings
                end
                merge = Table.merge
                v3 = {Name = k, Rarity = v.rarity}
                if not v2 then
                    description = nil
                elseif v2.settings then
                    description = v2.settings.description
                end
                v3.Description = description
                if not v2 then
                    gear = false
                elseif v2.settings then
                    gear = v2.settings.gear
                end
                v3.Gear = gear
                if not v2 then
                    blades = false
                elseif v2.settings then
                    blades = v2.settings.blades
                end
                v3.Blades = blades
                if not v2 then
                    handles = false
                elseif v2.settings then
                    handles = v2.settings.handles
                end
                v3.Handles = handles
                if not v2 then
                    icon = nil
                elseif v2.settings then
                    icon = v2.settings.icon
                end
                v3.Icon = icon
                if not v2 then
                    art = nil
                elseif v2.settings then
                    art = v2.settings.art
                end
                v3.Art = art
                if not v2 then
                    glow = nil
                elseif v2.settings then
                    glow = v2.settings.glow
                end
                v3.Glow = glow
                if not v2 then
                    embers = nil
                elseif v2.settings then
                    embers = v2.settings.embers
                end
                v3.Embers = embers
                settings_2 = v2
                if settings_2 then
                    settings_2 = v2.settings
                    if settings_2 then
                        settings_2 = v2.settings.pulse
                    end
                end
                v1 = settings_2 == true
                v3.Pulse = v1
                return merge(v3, settings)
            end
        end
        return nil
    end,
    activateEnchantment = function(p1) -- Line: 108 -- upvalues: u121 (val), Enchantments (val), Signals (val)
        local u115, v1, v2, v3
        local v4 = u121[p1]
        local module = v4
        if module then
            module = v4.module
        end
        if not module then
            warn("Enchantment not found:", p1)
            return
        end
        v2, v3 = pcall(function() -- Line: 117 -- upvalues: module (val)
            return require(module)
        end)
        if not v2 then
            warn("Failed to activate enchantment:", p1, v3)
            return
        end
        local activated = v3.activated
        if not activated then
            warn("Enchantment does not have an activation function:", p1)
            return
        end
        if not v3.settings.prerequisites or not v3.settings.prerequisites.enchantments then
            u115 = p1
            activated(function(...) -- Line: 163 -- upvalues: Enchantments (upval), u115 (val)
                Enchantments.Request.unreliablePost(u115, ...)
            end)
            return
        end
        local v5 = Enchantments.Store.client()
        if not v5 then
            v5 = {}
        end
        u115 = p1
        for k, v in pairs(v3.settings.prerequisites.enchantments) do
            if not (u121[v]) then
                Signals.Toast:Fire({type = "error", message = "You do not have the prerequisite enchantment, " .. v .. "."})
                return
            end
            v1 = false
            for k2, i in pairs(v5) do
                if i.hash == u121[v].hash then
                    v1 = true
                    break
                end
            end
            if not v1 then
                Signals.Toast:Fire({type = "error", message = "You do not have the prerequisite enchantment, " .. v .. "."})
                return
            end
        end
        activated(function(...) -- Line: 163 -- upvalues: Enchantments (upval), u115 (val)
            Enchantments.Request.unreliablePost(u115, ...)
        end)
    end,
    verifyEnchantment = function(p1) -- Line: 59 -- upvalues: u121 (val)
        local v1, v2
        local v3 = u121[p1]
        local module = v3
        if module then
            module = v3.module
        end
        if not module then
            warn("Enchantment not found:", p1)
            return
        end
        v1, v2 = pcall(function() -- Line: 68 -- upvalues: module (val)
            return require(module)
        end)
        if not v1 then
            warn("Failed to verify enchantment:", p1, v2)
            return
        end
        local verify = v2.verify
        if not verify then
            return true
        end
        if not (verify()) then
            return false
        end
        return true
    end,
    hasEnchantment = function(p1) -- Line: 241 -- upvalues: u121 (val), Enchantments (val), Players (val)
        local v1 = u121[p1]
        if not v1 then
            return false
        end
        local v2 = Enchantments.Store.current[Players.LocalPlayer]
        for k, v in pairs(v2) do
            if v.hash == v1.hash then
                return true
            end
        end
        return false
    end,
    getEnchantmentHashFromName = function(p1) -- Line: 195 -- upvalues: String (val)
        return String.hashToInt32(p1)
    end,
    getScaledActiveSkillCooldown = function(p1) -- Line: 94 -- upvalues: ClientAttributesHandler (val), ActiveSkillCooldown (val)
        local ActiveSkillCooldownMultiplier = ClientAttributesHandler.getAttribute("ActiveSkillCooldownMultiplier")
        if typeof(ActiveSkillCooldownMultiplier) ~= "number" then
            return ActiveSkillCooldown.scaleCooldown(p1, nil)
        end
        return ActiveSkillCooldown.scaleCooldown(p1, ActiveSkillCooldownMultiplier)
    end,
}