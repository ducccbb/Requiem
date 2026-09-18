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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Enchantments
--                               Dumped in 0.00611 seconds
--                          Bytecode version 9  |  38 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Proficiencies = require(Namespaces_2:WaitForChild("Proficiencies"))
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Profiling = require(ReplicatedFirst:WaitForChild("Profiling"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Number = require(Utilities_2:WaitForChild("Number"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Constants = require(Common_6:WaitForChild("Constants"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Promise = require(Common_7:WaitForChild("Promise"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Signals = require(Common_8:WaitForChild("Signals"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local EnchantmentItem = require(Screen:WaitForChild("EnchantmentItem"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useKeyPress = require(Hooks_2:WaitForChild("useKeyPress"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local Hooks_6 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_6:WaitForChild("useToast"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_10:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments_2 = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments_2:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_11:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local Proficiencies_2 = Progression_2:WaitForChild("Proficiencies")
local ClientProficienciesHandler = require(Proficiencies_2:WaitForChild("ClientProficienciesHandler"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_12:WaitForChild("Client")
local User = Client_3:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_13:WaitForChild("Common")
local Progression_3 = Common_9:WaitForChild("Progression")
local Enchantments_3 = Progression_3:WaitForChild("Enchantments")
local Rarities = require(Enchantments_3:WaitForChild("Rarities"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_14:WaitForChild("Client")
local User_2 = Client_4:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_15:WaitForChild("Client")
local User_3 = Client_5:WaitForChild("User")
local State_2 = User_3:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local u457 = {}
local u458 = {}
local function getProficiencyCooldownKey(p1, p2) -- Line: 102
    local v1 = string.lower(p1)
    return v1 .. "::" .. string.lower(p2 or "")
end
local function getProficiencyCooldownTotal(p1, p2) -- Line: 106
    return (math.max(p1, p2, 0.05))
end
local function getEffectiveAbilityCooldown(p1) -- Line: 110 -- upvalues: ClientProficienciesHandler (val)
    if p1.kind == "proficiency" then
        return ClientProficienciesHandler.getScaledActiveSkillCooldown(p1.cooldown)
    end
    return p1.cooldown
end
local function getKeycodeFromValue(p1) -- Line: 120
    for k, v in pairs(Enum.KeyCode:GetEnumItems()) do
        if v.Value == p1 then
            return v
        end
    end
    return Enum.KeyCode.Unknown
end
local function AbilityCooldownItem(p1) -- Line: 130 -- upvalues: useKeyPress (val), react (val), useMotion (val), useToast (val), ClientGearHandler (val), ClientStateHandler (val), ClientProficienciesHandler (val), getProficiencyCooldownKey (val), u457 (val), getProficiencyCooldownTotal (val), getEffectiveAbilityCooldown (val), Number (val), Constants (val), Character (val), ClientEnchantmentsHandler (val), Profiling (val), Proficiencies (val), Enchantments (val), Promise (val), u458 (val), Signals (val), useAsyncEffect (val), EnchantmentItem (val)
    local name, node, u14, u18, u22, u26, u27, u31, u32, u37, u9, v1, v2, v3, v4
    local u4 = useKeyPress(p1.Ability.keycode)
    _, u9 = react.useState(0)
    v2, u14 = useMotion(p1.Ability.color)
    v3, u18 = useMotion(0)
    v4, u22 = useMotion(0)
    u26, u27 = react.useState(false)
    u31, u32 = react.useState(false)
    v1, u37 = react.useState(0)
    local u39 = useToast()
    local u45 = react.useCallback(function() -- Line: 146 -- upvalues: p1 (val), ClientGearHandler (upval), u39 (val), ClientStateHandler (upval), ClientProficienciesHandler (upval), getProficiencyCooldownKey (upval), u457 (upval), getProficiencyCooldownTotal (upval), getEffectiveAbilityCooldown (upval), u22 (val), u32 (val), Number (upval), u27 (val), Constants (upval), Character (upval), ClientEnchantmentsHandler (upval)
        local v1
        if p1.Ability.kind ~= "proficiency" then
            if game.PlaceId == Constants.Places.Exam then
                return false
            end
            v1 = ClientGearHandler.getGearState()
            if v1 then
                if not p1.Ability then
                    if not p1.Ability then
                        if not v1 then
                            if not v1 or not p1.Ability.handles then
                                if not (ClientEnchantmentsHandler.verifyEnchantment(p1.Ability.name)) then
                                    return false
                                end
                                if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_ENCHANTMENT_USAGE) then
                                    if p1.Ability.name == "Dead Weight" then
                                        u27(true)
                                        return true
                                    end
                                    if p1.Ability.name ~= "Getaway" then
                                        u39({message = "You cannot use this enchantment at this time.", type = "error"})
                                        return false
                                    end
                                    u27(true)
                                    return true
                                end
                                u27(true)
                                return true
                            end
                            if not v1.handles then
                                u39({message = "You need to have your handles out to use this enchantment.", type = "error"})
                                return false
                            end
                            if not (ClientEnchantmentsHandler.verifyEnchantment(p1.Ability.name)) then
                                return false
                            end
                            if not (ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_ENCHANTMENT_USAGE)) or p1.Ability.name == "Dead Weight" then
                                u27(true)
                                return true
                            end
                            if p1.Ability.name ~= "Getaway" then
                                u39({message = "You cannot use this enchantment at this time.", type = "error"})
                                return false
                            end
                            u27(true)
                            return true
                        elseif p1.Ability.blades then
                            if not v1.blades then
                                u39({message = "You need to have your blades out to use this enchantment.", type = "error"})
                                return false
                            elseif not v1 then
                                u39({message = "You need to have your blades out to use this enchantment.", type = "error"})
                                return false
                            elseif not v1.handles then
                                u39({message = "You need to have your blades out to use this enchantment.", type = "error"})
                                return false
                            end
                        end
                    elseif p1.Ability.grounded and not (Character.isGrounded()) then
                        u39({message = "You need to be on the ground to use this enchantment.", type = "error"})
                        return false
                    end
                elseif p1.Ability.aerial and Character.isGrounded() then
                    u39({message = "You need to be in the air to use this enchantment.", type = "error"})
                    return false
                end
            elseif p1.Ability.gear then
                return false
            elseif p1.Ability.blades then
                return false
            elseif p1.Ability.handles then
                return false
            end
        else
            v1 = ClientGearHandler.getGearState()
            if v1 then
                if not v1 then
                    if not v1 then
                        if not p1.Ability.blocked_states then
                            if not (ClientProficienciesHandler.verifyProficiency(p1.Ability.name, p1.Ability.node or "")) then
                                return false
                            end
                            if p1.Ability.hasCooldown then
                                task.spawn(function() -- Line: 189 -- upvalues: ClientProficienciesHandler (upval), p1 (upval), getProficiencyCooldownKey (upval), u457 (upval), getProficiencyCooldownTotal (upval), getEffectiveAbilityCooldown (upval), u22 (upval), u32 (upval), u39 (upval), Number (upval), u27 (upval)
                                    local v1 = ClientProficienciesHandler.checkCooldown(p1.Ability.name, p1.Ability.node or ""):expect()
                                    if not v1.onCooldown then
                                        u27(true)
                                        return
                                    end
                                    if p1.Ability.node then
                                        local v2 = getProficiencyCooldownKey(p1.Ability.name, p1.Ability.node)
                                        u457[v2] = tick() + v1.remaining
                                        local v3 = getEffectiveAbilityCooldown(p1.Ability)
                                        local v4 = v1.remaining / math.max(getProficiencyCooldownTotal(v3, v1.remaining), 0.05)
                                        v3 = math.clamp(v4, 0, 1)
                                        u22:immediate(v3)
                                        u22:linear(0, {speed = 1 / math.max(v1.remaining, 0.05)})
                                        u32(true)
                                    end
                                    u39({type = "error", message = ("You cannot use this proficiency for another %*."):format((Number.FormatTimeString(v1.remaining)))})
                                end)
                                return true
                            end
                            u27(true)
                            return true
                        end
                        if ClientStateHandler.isAnyStateBusy(p1.Ability.blocked_states) or not (ClientProficienciesHandler.verifyProficiency(p1.Ability.name, p1.Ability.node or "")) then
                            return false
                        end
                        if p1.Ability.hasCooldown then
                            task.spawn(function() -- Line: 189 -- upvalues: ClientProficienciesHandler (upval), p1 (upval), getProficiencyCooldownKey (upval), u457 (upval), getProficiencyCooldownTotal (upval), getEffectiveAbilityCooldown (upval), u22 (upval), u32 (upval), u39 (upval), Number (upval), u27 (upval)
                                local v1 = ClientProficienciesHandler.checkCooldown(p1.Ability.name, p1.Ability.node or ""):expect()
                                if not v1.onCooldown then
                                    u27(true)
                                    return
                                end
                                if p1.Ability.node then
                                    local v2 = getProficiencyCooldownKey(p1.Ability.name, p1.Ability.node)
                                    u457[v2] = tick() + v1.remaining
                                    local v3 = getEffectiveAbilityCooldown(p1.Ability)
                                    local v4 = v1.remaining / math.max(getProficiencyCooldownTotal(v3, v1.remaining), 0.05)
                                    v3 = math.clamp(v4, 0, 1)
                                    u22:immediate(v3)
                                    u22:linear(0, {speed = 1 / math.max(v1.remaining, 0.05)})
                                    u32(true)
                                end
                                u39({type = "error", message = ("You cannot use this proficiency for another %*."):format((Number.FormatTimeString(v1.remaining)))})
                            end)
                            return true
                        end
                        u27(true)
                        return true
                    elseif p1.Ability.handles and not v1.handles then
                        u39({message = "You need to have your handles out to use this enchantment.", type = "error"})
                        return false
                    end
                elseif p1.Ability.blades then
                    if not v1.blades then
                        u39({message = "You need to have your blades out to use this enchantment.", type = "error"})
                        return false
                    elseif not v1 then
                        u39({message = "You need to have your blades out to use this enchantment.", type = "error"})
                        return false
                    elseif not v1.handles then
                        u39({message = "You need to have your blades out to use this enchantment.", type = "error"})
                        return false
                    end
                end
            elseif p1.Ability.gear then
                return false
            elseif p1.Ability.blades then
                return false
            elseif p1.Ability.handles then
                return false
            end
        end
    end, {p1.Ability})
    local function cancelAbilityAttempt() -- Line: 295 -- upvalues: u22 (val), u18 (val), u14 (val), p1 (val), u32 (val), u27 (val)
        u22:immediate(0)
        u18:immediate(0)
        u14:immediate(p1.Ability.color)
        u32(false)
        u27(false)
    end
    react.useEffect(function() -- Line: 303 -- upvalues: u26 (val), u31 (val), Profiling (upval), u9 (val), getEffectiveAbilityCooldown (upval), p1 (val), u22 (val), u18 (val), u32 (val), ClientProficienciesHandler (upval), cancelAbilityAttempt (val), Proficiencies (upval), getProficiencyCooldownKey (upval), u457 (upval), Enchantments (upval), ClientEnchantmentsHandler (upval), u14 (val), Promise (upval)
        local u31
        if not u26 then
            return
        end
        if not u31 then
            local commitActivation, runFinishAndActivate, startup
            u9(tick())
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://90785231095232"
            Sound.Volume = 0.75
            Sound.Parent = workspace
            Sound:Play()
            local v1 = getEffectiveAbilityCooldown(p1.Ability)
            if not Profiling.IS_USING_NO_COOLDOWNS then
                startup = p1.Ability.startup
            else
                startup = 0.1
            end
            if not Profiling.IS_USING_NO_COOLDOWNS then
                u31 = v1
            else
                u31 = 1
            end
            local u36 = startup <= 0
            if not u36 then
                u22:linear(1, {speed = 1 / startup})
            else
                u22:immediate(1)
            end
            u18:immediate(0)
            u32(true)
            local u59 = false
            if p1.Ability.kind ~= "proficiency" then
                function commitActivation() -- Line: 359 -- upvalues: u59 (ref), p1 (upval), Proficiencies (upval), ClientProficienciesHandler (upval), getProficiencyCooldownKey (upval), u457 (upval), u31 (val), Enchantments (upval), ClientEnchantmentsHandler (upval), u14 (upval), u22 (upval)
                    if u59 then
                        return
                    end
                    if p1.Ability.kind ~= "proficiency" then
                        Enchantments.Activate.post(p1.Ability.name)
                        ClientEnchantmentsHandler.activateEnchantment(p1.Ability.name)
                    else
                        Proficiencies.Activate.post({name = p1.Ability.name or "", node = p1.Ability.node or ""})
                        ClientProficienciesHandler.activateProficiency(p1.Ability.name or "", p1.Ability.node or "")
                        if p1.Ability.hasCooldown and p1.Ability.node then
                            local v1 = getProficiencyCooldownKey(p1.Ability.name, p1.Ability.node)
                            u457[v1] = tick() + u31
                        end
                    end
                    u14:linear(p1.Ability.color, {speed = 1 / u31 * 4})
                    u22:linear(0, {speed = 1 / u31})
                end
                function runFinishAndActivate() -- Line: 387 -- upvalues: u59 (ref), p1 (upval), ClientProficienciesHandler (upval), cancelAbilityAttempt (upval), u14 (upval), u18 (upval), u36 (val), commitActivation (val), Promise (upval)
                    local v1
                    if u59 then
                        return
                    end
                    if p1.Ability.kind ~= "proficiency" then
                        v1 = Color3.fromRGB(255, 255, 255)
                        u14:linear(v1, {speed = 6.666666666666667})
                        u18:linear(1, {speed = 2.2222222222222223})
                        if u36 then
                            commitActivation()
                            return
                        end
                        return Promise.delay(0.15):andThen(function() -- Line: 412 -- upvalues: commitActivation (upval)
                            task.spawn(commitActivation)
                        end)
                    end
                    local v2 = p1.Ability.name or ""
                    if not (ClientProficienciesHandler.finishProficiency(v2, p1.Ability.node or "")) then
                        u59 = true
                        cancelAbilityAttempt()
                        return
                    end
                    v1 = Color3.fromRGB(255, 255, 255)
                    u14:linear(v1, {speed = 6.666666666666667})
                    u18:linear(1, {speed = 2.2222222222222223})
                    if not u36 then
                        return Promise.delay(0.15):andThen(function() -- Line: 412 -- upvalues: commitActivation (upval)
                            task.spawn(commitActivation)
                        end)
                    end
                    commitActivation()
                end
                if not u36 then
                    Promise.delay(startup):andThen(runFinishAndActivate)
                else
                    runFinishAndActivate()
                end
                return function() -- Line: 426 -- upvalues: u59 (ref)
                    u59 = true
                end
            end
            local v2 = p1.Ability.name or ""
            if not (ClientProficienciesHandler.startProficiency(v2, p1.Ability.node or "")) then
                local u74 = true
                cancelAbilityAttempt()
                return function() -- Line: 353 -- upvalues: u74 (ref)
                    u74 = true
                end
            end
            function commitActivation() -- Line: 359 -- upvalues: u59 (ref), p1 (upval), Proficiencies (upval), ClientProficienciesHandler (upval), getProficiencyCooldownKey (upval), u457 (upval), u31 (val), Enchantments (upval), ClientEnchantmentsHandler (upval), u14 (upval), u22 (upval)
                if u59 then
                    return
                end
                if p1.Ability.kind ~= "proficiency" then
                    Enchantments.Activate.post(p1.Ability.name)
                    ClientEnchantmentsHandler.activateEnchantment(p1.Ability.name)
                else
                    Proficiencies.Activate.post({name = p1.Ability.name or "", node = p1.Ability.node or ""})
                    ClientProficienciesHandler.activateProficiency(p1.Ability.name or "", p1.Ability.node or "")
                    if p1.Ability.hasCooldown and p1.Ability.node then
                        local v1 = getProficiencyCooldownKey(p1.Ability.name, p1.Ability.node)
                        u457[v1] = tick() + u31
                    end
                end
                u14:linear(p1.Ability.color, {speed = 1 / u31 * 4})
                u22:linear(0, {speed = 1 / u31})
            end
            function runFinishAndActivate() -- Line: 387 -- upvalues: u59 (ref), p1 (upval), ClientProficienciesHandler (upval), cancelAbilityAttempt (upval), u14 (upval), u18 (upval), u36 (val), commitActivation (val), Promise (upval)
                local v1
                if u59 then
                    return
                end
                if p1.Ability.kind ~= "proficiency" then
                    v1 = Color3.fromRGB(255, 255, 255)
                    u14:linear(v1, {speed = 6.666666666666667})
                    u18:linear(1, {speed = 2.2222222222222223})
                    if u36 then
                        commitActivation()
                        return
                    end
                    return Promise.delay(0.15):andThen(function() -- Line: 412 -- upvalues: commitActivation (upval)
                        task.spawn(commitActivation)
                    end)
                end
                local v2 = p1.Ability.name or ""
                if not (ClientProficienciesHandler.finishProficiency(v2, p1.Ability.node or "")) then
                    u59 = true
                    cancelAbilityAttempt()
                    return
                end
                v1 = Color3.fromRGB(255, 255, 255)
                u14:linear(v1, {speed = 6.666666666666667})
                u18:linear(1, {speed = 2.2222222222222223})
                if not u36 then
                    return Promise.delay(0.15):andThen(function() -- Line: 412 -- upvalues: commitActivation (upval)
                        task.spawn(commitActivation)
                    end)
                end
                commitActivation()
            end
            if not u36 then
                Promise.delay(startup):andThen(runFinishAndActivate)
            else
                runFinishAndActivate()
            end
            return function() -- Line: 426 -- upvalues: u59 (ref)
                u59 = true
            end
        elseif not Profiling.IS_USING_NO_COOLDOWNS then
            return
        end
    end, {u26})
    react.useEffect(function() -- Line: 431 -- upvalues: u31 (val), getEffectiveAbilityCooldown (upval), p1 (val), Profiling (upval), getProficiencyCooldownKey (upval), u457 (upval), u458 (upval), Promise (upval), u27 (val), u32 (val)
        local v1, v2, v3, v4
        if not u31 then
            return
        end
        local v5 = getEffectiveAbilityCooldown(p1.Ability)
        if not Profiling.IS_USING_NO_COOLDOWNS then
            v1 = v5
        else
            v1 = 1
        end
        local v6 = v1
        local u48 = nil
        if p1.Ability.kind ~= "proficiency" then
            if p1.Ability.kind == "enchantment" then
                v2 = string.lower(p1.Ability.name)
                u48 = v2
                v3 = u458[v2]
                if v3 then
                    v4 = v3 - tick()
                    if 0 >= v4 then
                        u458[v2] = nil
                    else
                        v6 = math.max(v4, 0.05)
                    end
                end
            end
        elseif p1.Ability.node then
            v2 = getProficiencyCooldownKey(p1.Ability.name, p1.Ability.node)
            u48 = v2
            v3 = u457[v2]
            if v3 then
                v4 = v3 - tick()
                if 0 >= v4 then
                    u457[v2] = nil
                else
                    v6 = math.max(v4, 0.05)
                end
            end
        elseif p1.Ability.kind == "enchantment" then
            v2 = string.lower(p1.Ability.name)
            u48 = v2
            v3 = u458[v2]
            if v3 then
                v4 = v3 - tick()
                if 0 >= v4 then
                    u458[v2] = nil
                else
                    v6 = math.max(v4, 0.05)
                end
            end
        end
        local u62 = false
        Promise.delay(v6):andThen(function() -- Line: 475 -- upvalues: u62 (ref), u48 (ref), u457 (upval), u27 (upval), u32 (upval)
            if u62 then
                return
            end
            if u48 then
                u457[u48] = nil
            end
            u27(false)
            u32(false)
        end)
        return function() -- Line: 486 -- upvalues: u62 (ref)
            u62 = true
        end
    end, {u31, v1})
    react.useEffect(function() -- Line: 491 -- upvalues: Signals (upval), p1 (val), getProficiencyCooldownKey (upval), u457 (upval), getProficiencyCooldownTotal (upval), Profiling (upval), getEffectiveAbilityCooldown (upval), u22 (val), u32 (val), u37 (val)
        local u5 = Signals.ProficiencyCooldownAdjusted:Connect(function(a1) -- Line: 492 -- upvalues: p1 (upval), getProficiencyCooldownKey (upval), u457 (upval), getProficiencyCooldownTotal (upval), Profiling (upval), getEffectiveAbilityCooldown (upval), u22 (upval), u32 (upval), u37 (upval)
            local v1
            if p1.Ability.kind ~= "proficiency" or not p1.Ability.node or p1.Ability.name ~= a1.name or p1.Ability.node ~= a1.node then
                return
            end
            local v2 = tonumber(a1.remaining) or 0
            if v2 <= 0 then
                return
            end
            local v3 = getProficiencyCooldownKey(a1.name, a1.node)
            u457[v3] = tick() + v2
            if not Profiling.IS_USING_NO_COOLDOWNS then
                v1 = getEffectiveAbilityCooldown(p1.Ability)
            else
                v1 = 1
            end
            v1 = math.clamp(v2 / getProficiencyCooldownTotal(v1, v2), 0, 1)
            u22:immediate(v1)
            u22:linear(0, {speed = 1 / math.max(v2, 0.05)})
            u32(true)
            u37(function(p1) -- Line: 518
                return p1 + 1
            end)
        end)
        return function() -- Line: 523 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {p1.Ability.kind, p1.Ability.name, p1.Ability.node, p1.Ability.cooldown})
    react.useEffect(function() -- Line: 528 -- upvalues: Signals (upval), p1 (val), u458 (upval), cancelAbilityAttempt (val), Profiling (upval), getEffectiveAbilityCooldown (upval), u22 (val), u32 (val), u37 (val)
        local u5 = Signals.EnchantmentCooldownAdjusted:Connect(function(a1) -- Line: 529 -- upvalues: p1 (upval), u458 (upval), cancelAbilityAttempt (upval), Profiling (upval), getEffectiveAbilityCooldown (upval), u22 (upval), u32 (upval), u37 (upval)
            local v1
            if p1.Ability.kind ~= "enchantment" or p1.Ability.name ~= a1.name then
                return
            end
            local v2 = tonumber(a1.remaining)
            if v2 == nil then
                return
            end
            if v2 <= 0 then
                local v3 = string.lower(a1.name)
                u458[v3] = nil
                cancelAbilityAttempt()
                return
            end
            local v4 = string.lower(a1.name)
            u458[v4] = tick() + v2
            if not Profiling.IS_USING_NO_COOLDOWNS then
                v1 = getEffectiveAbilityCooldown(p1.Ability)
            else
                v1 = 1
            end
            v1 = math.clamp(v2 / math.max(v1, v2, 0.05), 0, 1)
            u22:immediate(v1)
            u22:linear(0, {speed = 1 / math.max(v2, 0.05)})
            u32(true)
            u37(function(p1) -- Line: 562
                return p1 + 1
            end)
        end)
        return function() -- Line: 567 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {p1.Ability.kind, p1.Ability.name, p1.Ability.cooldown, p1.Ability.color})
    react.useEffect(function() -- Line: 577 -- upvalues: p1 (val), getProficiencyCooldownKey (upval), u457 (upval), getProficiencyCooldownTotal (upval), Profiling (upval), getEffectiveAbilityCooldown (upval), u22 (val), u32 (val)
        local v1
        if p1.Ability.kind ~= "proficiency" or not p1.Ability.node then
            return
        end
        local v2 = getProficiencyCooldownKey(p1.Ability.name, p1.Ability.node)
        local v3 = u457[v2]
        if not v3 then
            return
        end
        local v4 = v3 - tick()
        if v4 <= 0 then
            u457[v2] = nil
            return
        end
        if not Profiling.IS_USING_NO_COOLDOWNS then
            v1 = getEffectiveAbilityCooldown(p1.Ability)
        else
            v1 = 1
        end
        v1 = math.clamp(v4 / getProficiencyCooldownTotal(v1, v4), 0, 1)
        u22:immediate(v1)
        u22:linear(0, {speed = 1 / math.max(v4, 0.05)})
        u32(true)
    end, {})
    react.useEffect(function() -- Line: 607 -- upvalues: p1 (val), Signals (upval), u26 (val), u31 (val), u45 (val)
        local u17
        if p1.Ability.kind ~= "proficiency" then
            u17 = Signals.ActivateEnchantment:Connect(function(a1) -- Line: 623 -- upvalues: p1 (upval), u26 (upval), u31 (upval), u45 (upval)
                if a1 ~= p1.Ability.name or u26 or u31 then
                    return
                end
                u45()
            end)
        else
            u17 = Signals.ActivateProficiency:Connect(function(a1) -- Line: 611 -- upvalues: p1 (upval), u26 (upval), u31 (upval), u45 (upval)
                if not a1 or a1.name ~= p1.Ability.name or a1.node ~= p1.Ability.node or u26 or u31 then
                    return
                end
                u45()
            end)
        end
        return function() -- Line: 638 -- upvalues: u17 (ref)
            u17:Disconnect()
        end
    end, {
        p1.Ability.kind,
        p1.Ability.name,
        p1.Ability.node,
        u26,
        u31,
        u45,
    })
    useAsyncEffect(function() -- Line: 652 -- upvalues: p1 (val), u4 (val), u26 (val), u45 (val)
        if p1.Ability.keycode == Enum.KeyCode.Unknown then
            return
        end
        if u4 and not u26 then
            u45()
        end
    end, {u4, u26, u45})
    name = p1.Ability.name
    if p1.Ability.kind == "proficiency" then
        node = p1.Ability.node
        if not node then
            node = p1.Ability.name
        end
        name = node
    end
    return react.createElement(EnchantmentItem, {
        Visible = true,
        Name = name,
        Color = v2,
        Progress = v4,
        Stroke = v3,
        IsBottomRight = p1.IsBottomRight,
    })
end
return function(p1) -- Line: 682 -- upvalues: useRem (val), react (val), ClientSettingsHandler (val), useStore (val), Enchantments (val), Table (val), ClientEnchantmentsHandler (val), Rarities (val), getKeycodeFromValue (val), Proficiencies (val), ClientProficienciesHandler (val), AbilityCooldownItem (val), Frame (val), VerticalListLayout (val)
    local Right, u7, v1, v2, v3, v4
    local v5 = useRem()
    v2, u7 = react.useState(true)
    react.useEffect(function() -- Line: 686 -- upvalues: ClientSettingsHandler (upval), u7 (val)
        local v1 = ClientSettingsHandler.getSettingFromName("Enchantment Position")
        local v2 = v1 == 2
        u7(v2)
        ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 690 -- upvalues: u7 (upval)
            if p1 == "Enchantment Position" then
                local v1 = p2 == 2
                u7(v1)
            end
        end)
    end, {})
    local v6 = useStore(Enchantments.Store, function(p1) -- Line: 697 -- upvalues: Table (upval), ClientEnchantmentsHandler (upval), Rarities (upval), getKeycodeFromValue (upval)
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        return Table.map(v1, function(p1, p2) -- Line: 698 -- upvalues: ClientEnchantmentsHandler (upval), Table (upval), Rarities (upval), getKeycodeFromValue (upval)
            local Blades, Gear, Handles, Name, Rarity
            local v1 = ClientEnchantmentsHandler.getEnchantmentFromHash(p1.hash)
            if not v1 then
                Rarity = 0
            else
                Rarity = v1.Rarity
            end
            local merge = Table.merge
            local v2 = p1
            if not v2 then
                v2 = {}
            end
            local merge_2 = Table.merge
            local v3 = v1
            if not v3 then
                v3 = {}
            end
            local v4 = {kind = "enchantment", key = ("Enchantment_%*_%*"):format(p1.hash, p2)}
            if not v1 then
                Name = "Unknown"
            else
                Name = v1.Name
            end
            v4.name = Name
            v4.color = Rarities.Colors[Rarity]
            v4.cooldown = p1.cooldown or 30
            v4.keycode = getKeycodeFromValue(p1.keybind)
            v4.startup = p1.startup or 1
            if not v1 then
                Blades = false
            else
                Blades = v1.Blades
            end
            v4.blades = Blades
            if not v1 then
                Handles = false
            else
                Handles = v1.Handles
            end
            v4.handles = Handles
            if not v1 then
                Gear = false
            else
                Gear = v1.Gear
                if not Gear then
                    Gear = false
                end
            end
            v4.gear = Gear
            return merge(v2, merge_2(v3, v4))
        end)
    end)
    v3 = useStore(Proficiencies.Store, function(p1) -- Line: 723 -- upvalues: ClientProficienciesHandler (upval), getKeycodeFromValue (upval)
        local Unknown, cooldown, hotbars, keybinds, meta, startup, unlocked, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = {}
        local v11 = p1
        if not v11 then
            v11 = {}
        end
        for i, v in ipairs(v11) do
            keybinds = v.keybinds
            if not keybinds then
                keybinds = {}
            end
            hotbars = v.hotbars
            if not hotbars then
                hotbars = {}
            end
            meta = v.meta
            if not meta then
                meta = {}
            end
            unlocked = v.unlocked
            if not unlocked then
                unlocked = {}
            end
            for i2, i3 in ipairs(unlocked) do
                v1 = keybinds[i3]
                v2 = hotbars[i3]
                v3 = meta[i3]
                v4 = ClientProficienciesHandler.getProficiencySettings(v.name, i3)
                if not v3 then
                    startup = 0
                else
                    startup = v3.startup
                end
                if not v3 then
                    cooldown = 0
                else
                    cooldown = v3.cooldown
                end
                v5 = if type(v2) == "number" then -1 < v2 else false
                v6 = if type(v1) == "number" then v1 ~= Enum.KeyCode.Unknown.Value else false
                if not v6 then
                    Unknown = Enum.KeyCode.Unknown
                else
                    Unknown = getKeycodeFromValue(v1)
                end
                v7 = 0 < cooldown
                if not v7 then
                    if v5 then
                        v8 = {
                            kind = "proficiency",
                            passive = false,
                            aerial = false,
                            grounded = false,
                            key = ("Proficiency_%*_%*"):format(v.name, i3),
                            name = v.name,
                            node = i3,
                            color = Color3.fromRGB(102, 196, 255),
                        }
                        if 0 >= cooldown then
                            v9 = 1
                        else
                            v9 = cooldown
                        end
                        v8.cooldown = v9
                        v8.startup = startup
                        v8.keycode = Unknown
                        v8.blades = v4.blades
                        v8.handles = v4.handles
                        v8.gear = v4.gear
                        v8.blocked_states = v4.blocked_states
                        if not v3 then
                            v9 = false
                        else
                            v9 = true
                            if v3.hasCooldown == 1 then end
                        end
                        v8.hasCooldown = v9
                        table.insert(v10, v8)
                    end
                elseif Unknown ~= Enum.KeyCode.Unknown then
                end
            end
        end
        return v10
    end)
    local v7 = {}
    v4 = {}
    for i, v in ipairs(v6) do
        table.insert(v4, v)
    end
    for i2, i3 in ipairs(v3) do
        table.insert(v4, i3)
    end
    for i4, j in ipairs(v4) do
        v7[j.key] = react.createElement(AbilityCooldownItem, {Ability = j, IsBottomRight = v2})
    end
    local createElement = react.createElement
    local v8 = {}
    if not v2 then
        v1 = Vector2.new(0.5, 1)
    else
        v1 = Vector2.new(1, 1)
    end
    v8.AnchorPoint = v1
    local v9 = v5(100)
    v8.Size = UDim2.new(0, v9, 0, v5(70))
    if not v2 then
        v1 = UDim2.new(0.5, 0, 0.8, 0)
    else
        v9 = -v5(10)
        v1 = UDim2.new(1, v9, 1, -v5(35))
    end
    v8.Position = v1
    v1 = {}
    local createElement_2 = react.createElement
    local v10 = {Spacing = 45}
    if not v2 then
        Right = Enum.HorizontalAlignment.Center
    else
        Right = Enum.HorizontalAlignment.Right
        if not Right then
            Right = Enum.HorizontalAlignment.Center
        end
    end
    v10.HorizontalAlignment = Right
    v1.Spacing = createElement_2(VerticalListLayout, v10)
    return createElement(Frame, v8, v1, v7)
end