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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterHealthHandler
--                              Dumped in 0.000879 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
game:GetService("Lighting")
game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Effects = Common_6:WaitForChild("Effects")
require(Effects:WaitForChild("Effects"))
local u136 = 0
local u137 = false
local u138 = 0
local u139 = false
local u140 = nil
State("blink")
local function getCurrentStamina(p1) -- Line: 51 -- upvalues: u137 (ref), u136 (ref)
    if u137 then
        return u136
    end
    return p1.stamina
end
local function getCurrentSprintStamina(p1) -- Line: 64 -- upvalues: u139 (ref), u138 (ref)
    if u139 then
        return u138
    end
    return p1.sprintStamina
end
local function onSendUpdatedInterfaceData(p1) -- Line: 101 -- upvalues: State (val), u140 (ref), Table (val), getCurrentStamina (val), getCurrentSprintStamina (val)
    local shifter = State("shifter")
    if not u140 then
        return
    end
    local v1 = Table.merge(u140.health, {
        stamina = {current = getCurrentStamina(p1), max = p1.maxStamina},
        sprinting = {current = getCurrentSprintStamina(p1), max = p1.maxSprintStamina},
    })
    shifter({visible = true, health = v1})
end
local function onUpdateShifterReference(p1) -- Line: 167 -- upvalues: u140 (ref)
    u140 = p1
end
return {
    getCurrentStamina = getCurrentStamina,
    canAffordStamina = function(p1, p2) -- Line: 89 -- upvalues: getCurrentStamina (val)
        local v1 = math.max(p2, 0)
        local v2 = v1 <= getCurrentStamina(p1)
        return v2
    end,
    onReduceStamina = function(p1, p2) -- Line: 122 -- upvalues: u136 (ref), getCurrentStamina (val), u137 (ref), onSendUpdatedInterfaceData (val)
        local v1 = getCurrentStamina(p1) - math.max(p2, 0)
        u136 = math.clamp(v1, 0, p1.maxStamina)
        u137 = true
        onSendUpdatedInterfaceData(p1)
    end,
    getCurrentSprintStamina = getCurrentSprintStamina,
    canAffordSprintStamina = function(p1, p2) -- Line: 78 -- upvalues: getCurrentSprintStamina (val)
        local v1 = math.max(p2, 0)
        local v2 = v1 <= getCurrentSprintStamina(p1)
        return v2
    end,
    onReduceSprintStamina = function(p1, p2) -- Line: 136 -- upvalues: u138 (ref), getCurrentSprintStamina (val), u139 (ref), onSendUpdatedInterfaceData (val)
        local v1 = getCurrentSprintStamina(p1) - math.max(p2, 0)
        u138 = math.clamp(v1, 0, p1.maxSprintStamina)
        u139 = true
        onSendUpdatedInterfaceData(p1)
    end,
    onRestoreSprintStamina = function(p1, p2) -- Line: 150 -- upvalues: u138 (ref), getCurrentSprintStamina (val), u139 (ref), onSendUpdatedInterfaceData (val)
        local v1 = getCurrentSprintStamina(p1) + math.max(p2, 0)
        u138 = math.clamp(v1, 0, p1.maxSprintStamina)
        u139 = true
        onSendUpdatedInterfaceData(p1)
    end,
    onUpdateHealthBars = function(p1) -- Line: 163 -- upvalues: onSendUpdatedInterfaceData (val)
        onSendUpdatedInterfaceData(p1)
    end,
    onLoadHealthHandler = function(p1) -- Line: 176 -- upvalues: onUpdateShifterReference (val), u136 (ref), u137 (ref), u138 (ref), u139 (ref), State (val)
        onUpdateShifterReference(p1)
        u136 = math.clamp(p1.stamina, 0, p1.maxStamina)
        u137 = true
        u138 = math.clamp(p1.sprintStamina, 0, p1.maxSprintStamina)
        u139 = true
        if p1.variant == "Normal" then end
        p1.trove:Add(function() -- Line: 251 -- upvalues: State (upval), u136 (upval), u137 (upval), u138 (upval), u139 (upval)
            State("shifter")(nil)
            u136 = 0
            u137 = false
            u138 = 0
            u139 = false
        end)
    end,
    onUpdateShifterReference = onUpdateShifterReference,
}