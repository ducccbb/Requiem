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
--             File: ReplicatedStorage.Client.User.State.ClientStateHandler
--                               Dumped in 0.00257 seconds
--                          Bytecode version 9  |  18 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local States = require(Types:WaitForChild("States"))
local u92 = {}
local u93 = {
    GRAPPLING = "GRAPPLING",
    WALL_SLIDING = "WALL_SLIDING",
    HANDLES = "HANDLES",
    GEAR_SWING = "GEAR_SWING",
    REFILLING = "REFILLING",
    CHECKING_GAS = "CHECKING_GAS",
    SLIDING = "SLIDING",
    TURBINE = "TURBINE",
    CLASHING = "CLASHING",
    PARRYING = "PARRYING",
    STUNNED = "STUNNED",
    COUNTERING = "COUNTERING",
    WALL_HANGING = "WALL_HANGING",
    MOVEMENT = "MOVEMENT",
    TOOL = "TOOL",
    EQUIPPING = "EQUIPPING",
    AIMING = "AIMING",
    MOUNTED = "MOUNTED",
    LIMPING = "LIMPING",
    BANDAGING = "BANDAGING",
    BEING_CARRIED = "BEING_CARRIED",
    CARRYING = "CARRYING",
    RESURRECTING = "RESURRECTING",
    CUTSCENE = "CUTSCENE",
    LOCKED = "LOCKED",
    FREECAM = "FREECAM",
    STAFF_FREECAM = "STAFF_FREECAM",
    LIFTING = "LIFTING",
    HANDCUFFED = "HANDCUFFED",
    LOOTING = "LOOTING",
    COMBATTING = "COMBATTING",
    KNOCKED = "KNOCKED",
    NO_ITEM_EQUIPPING = "NO_ITEM_EQUIPPING",
    RAGDOLLED = "RAGDOLLED",
    CANNON_MOUNTED = "CANNON_MOUNTED",
    CANNON_RELOADING = "CANNON_RELOADING",
    TRANSFORMED = "TRANSFORMED",
    CROUCHING = "CROUCHING",
    SWIMMING = "SWIMMING",
    POISONED = "POISONED",
    ERADICATING = "ERADICATING",
}
local u135 = {
    STRICT = {
        u93.GRAPPLING,
        u93.WALL_SLIDING,
        u93.HANDLES,
        u93.GEAR_SWING,
        u93.MOUNTED,
        u93.REFILLING,
        u93.CHECKING_GAS,
        u93.BEING_CARRIED,
        u93.CUTSCENE,
        u93.TURBINE,
        u93.LOCKED,
        u93.STUNNED,
        u93.PARRYING,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.LOOTING,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.RESURRECTING,
    },
    NO_GEAR_HANDLE_USAGE = {
        u93.WALL_SLIDING,
        u93.GEAR_SWING,
        u93.REFILLING,
        u93.CHECKING_GAS,
        u93.CUTSCENE,
        u93.TURBINE,
        u93.LOCKED,
        u93.STUNNED,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.COMBATTING,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.COUNTERING,
        u93.RESURRECTING,
        u93.POISONED,
        u93.SWIMMING,
    },
    NO_GEAR_GRAPPLING = {
        u93.WALL_SLIDING,
        u93.REFILLING,
        u93.CHECKING_GAS,
        u93.BANDAGING,
        u93.MOUNTED,
        u93.STUNNED,
        u93.LOCKED,
        u93.CUTSCENE,
        u93.TOOL,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.COMBATTING,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.RESURRECTING,
        u93.POISONED,
        u93.SWIMMING,
    },
    NO_SLASHING = {
        u93.TOOL,
        u93.BEING_CARRIED,
        u93.BANDAGING,
        u93.CUTSCENE,
        u93.TURBINE,
        u93.LOCKED,
        u93.PARRYING,
        u93.STUNNED,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.COMBATTING,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.COUNTERING,
        u93.WALL_HANGING,
        u93.RESURRECTING,
        u93.SWIMMING,
    },
    NO_TOOL_EQUIPPING = {
        u93.BEING_CARRIED,
        u93.BANDAGING,
        u93.CUTSCENE,
        u93.SLIDING,
        u93.SWIMMING,
        u93.LOCKED,
        u93.PARRYING,
        u93.STUNNED,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.KNOCKED,
        u93.CARRYING,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.COUNTERING,
        u93.WALL_HANGING,
        u93.RESURRECTING,
    },
    NO_INTERACTION_USAGE = {
        u93.BEING_CARRIED,
        u93.BANDAGING,
        u93.CUTSCENE,
        u93.SLIDING,
        u93.SWIMMING,
        u93.LOCKED,
        u93.PARRYING,
        u93.STUNNED,
        u93.FREECAM,
        u93.REFILLING,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.LOOTING,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.WALL_HANGING,
        u93.RESURRECTING,
    },
    NO_ENCHANTMENT_USAGE = {
        u93.BEING_CARRIED,
        u93.CARRYING,
        u93.BANDAGING,
        u93.CUTSCENE,
        u93.SLIDING,
        u93.SWIMMING,
        u93.LOCKED,
        u93.PARRYING,
        u93.STUNNED,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.LOOTING,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.WALL_HANGING,
        u93.RESURRECTING,
    },
    NO_CROUCHING = {
        u93.BEING_CARRIED,
        u93.CARRYING,
        u93.BANDAGING,
        u93.CUTSCENE,
        u93.SLIDING,
        u93.SWIMMING,
        u93.LOCKED,
        u93.PARRYING,
        u93.STUNNED,
        u93.FREECAM,
        u93.LIFTING,
        u93.HANDCUFFED,
        u93.KNOCKED,
        u93.RAGDOLLED,
        u93.EQUIPPING,
        u93.TRANSFORMED,
        u93.CANNON_MOUNTED,
        u93.CANNON_RELOADING,
        u93.ERADICATING,
        u93.COUNTERING,
        u93.WALL_HANGING,
        u93.GRAPPLING,
        u93.WALL_SLIDING,
        u93.GEAR_SWING,
        u93.MOUNTED,
        u93.REFILLING,
        u93.CHECKING_GAS,
        u93.TURBINE,
        u93.CLASHING,
        u93.AIMING,
        u93.RESURRECTING,
        u93.POISONED,
    },
}
local v2 = {
    u93.TOOL,
    u93.LOCKED,
    u93.FREECAM,
    u93.LIFTING,
    u93.HANDCUFFED,
    u93.KNOCKED,
    u93.RAGDOLLED,
    u93.EQUIPPING,
    u93.TRANSFORMED,
    u93.CANNON_MOUNTED,
    u93.CANNON_RELOADING,
    u93.ERADICATING,
    u93.RESURRECTING,
}
u135.TOOLS = v2
local u349 = {}
local u350 = {}
local u351 = {}
local u352 = {}
local u353 = {}
local function stripScriptExt(p1) -- Line: 332
    local v1 = string.gsub(p1, "%.luau$", "")
    return (string.gsub(v1, "%.lua$", ""))
end
local function tokenizeSetterPath(p1) -- Line: 338
    local v1 = {}
    for i in string.gmatch(p1, "[^/.]+") do
        if i ~= "" then
            table.insert(v1, i)
        end
    end
    return v1
end
local u356 = {
    ReplicatedStorage = true,
    ServerStorage = true,
    ServerScriptService = true,
    StarterPlayer = true,
    StarterGui = true,
    StarterPack = true,
    Workspace = true,
    ReplicatedFirst = true,
    HttpService = true,
    RunService = true,
    TestService = true,
    StarterCharacterScripts = true,
}
local function normalizeSetterSource(p1) -- Line: 364 -- upvalues: tokenizeSetterPath (val), u356 (val), stripScriptExt (val)
    if p1 == nil or p1 == "" then
        return ""
    end
    local v1 = string.gsub(p1, "^@", "")
    v1 = string.gsub(v1, "^%[string%s+\"", "")
    v1 = string.gsub(v1, "\"%]$", "")
    v1 = string.gsub(v1, "\\", "/")
    local v2 = tokenizeSetterPath(v1)
    while 0 < #v2 do
        if string.lower(v2[1]) ~= "game" then
            break
        end
        table.remove(v2, 1)
    end
    while 0 < #v2 do
        if u356[v2[1]] ~= true then
            break
        end
        table.remove(v2, 1)
    end
    if #v2 == 0 then
        return ""
    end
    v2[#v2] = stripScriptExt(v2[#v2])
    return table.concat(v2, ".")
end
local function attributionFromCallerSkipping(p1) -- Line: 394 -- upvalues: normalizeSetterSource (val)
    local v1, v2, v3, v4, v5
    local v6 = 16
    local v7 = 1
    local v8 = p1
    for i = 3, v6, v7 do
        v1 = debug.info(i, "s")
        if v1 == nil or v1 == "" then
            break
        end
        v2 = false
        v3 = v8
        v4 = nil
        v5 = nil
        for j, k in v3, v4, v5 do
            if string.find(v1, k, 1, true) then
                v2 = true
                break
            end
        end
        if not v2 then
            v3 = debug.info(i, "l")
            v4 = normalizeSetterSource(v1)
            if v4 == "" then
                v4 = v1
            end
            if typeof(v3) == "number" and 0 < v3 then
                return v4 .. ":" .. tostring(v3)
            end
            return v4
        end
    end
    return ""
end
local function attributionFromCallerStack() -- Line: 426 -- upvalues: attributionFromCallerSkipping (val)
    return attributionFromCallerSkipping({"ClientStateHandler"})
end
local u360 = {
    u93.GRAPPLING,
    u93.WALL_SLIDING,
    u93.WALL_HANGING,
    u93.SLIDING,
    u93.TURBINE,
    u93.GEAR_SWING,
}
local u367 = {}
local v3 = u360
local v4 = nil
local v5 = nil
for i, j in v3, v4, v5 do
    u367[j] = true
end
local function clearSwimPreemptedStates() -- Line: 447 -- upvalues: u360 (val), u349 (val), u352 (val), attributionFromCallerStack (val), u350 (val)
    local v1 = u360
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if u349[j] then
            u352[j] = attributionFromCallerStack()
            u349[j] = false
            if u350[j] then
                u350[j]:Fire(false)
            end
        end
    end
end
local function isStateBusy(p1) -- Line: 475 -- upvalues: u93 (val), u349 (val)
    if u93[p1] then
        return u349[p1] or false, p1
    end
    return false, nil
end
local u404 = Table.inverse(States)
Player.State.listen(function(p1) -- Line: 568 -- upvalues: u92 (val), u404 (val), u353 (val), u351 (val)
    u92[p1.state] = p1.value
    local v1 = u404[p1.state]
    if typeof(v1) == "string" then
        u353[v1] = "Server"
    end
    if not (u351[p1.state]) then
        return
    end
    u351[p1.state]:Fire(p1.value)
end)
return {
    isStateBusy = isStateBusy,
    isServerStateBusy = function(p1) -- Line: 464 -- upvalues: u92 (val), Table (val), States (val)
        if u92[p1] then
            return u92[p1], Table.inverse(States)[p1]
        end
        return false, nil
    end,
    isAnyStateBusy = function(p1) -- Line: 483 -- upvalues: isStateBusy (val)
        for k, v in pairs(p1) do
            if isStateBusy(v) then
                return true
            end
        end
        return false
    end,
    updateState = function(p1, p2) -- Line: 515 -- upvalues: u93 (val), u349 (val), u367 (val), u352 (val), attributionFromCallerStack (val), u350 (val), clearSwimPreemptedStates (val)
        if not (u93[p1]) then
            return
        end
        if not p2 then
            if u349[p1] == p2 then
                return
            end
            u352[p1] = attributionFromCallerStack()
            u349[p1] = p2
            if u350[p1] then
                u350[p1]:Fire(p2)
            end
            if p1 == u93.SWIMMING and p2 then
                clearSwimPreemptedStates()
            end
            return
        elseif u349[u93.SWIMMING] and u367[p1] then
            return
        end
    end,
    onStateChanged = function(p1) -- Line: 541 -- upvalues: u350 (val), Signal (val)
        if not (u350[p1]) then
            u350[p1] = Signal.new()
        end
        return u350[p1]
    end,
    onServerStateChanged = function(p1) -- Line: 549 -- upvalues: u351 (val), Signal (val)
        if not (u351[p1]) then
            u351[p1] = Signal.new()
        end
        return u351[p1]
    end,
    isCategoryBusy = function(p1, p2) -- Line: 493 -- upvalues: isStateBusy (val)
        for i, v in ipairs(p1) do
            if isStateBusy(v) then
                if p2 and table.find(p2, v) then
                    continue
                end
                return true, v
            end
        end
        return false, nil
    end,
    resetStates = function() -- Line: 557 -- upvalues: u349 (val), u352 (val)
        for k, v in pairs(u349) do
            u349[k] = false
            u352[k] = nil
        end
    end,
    __getStateMap = function() -- Line: 507 -- upvalues: Table (val), u93 (val), u349 (val), u135 (val), u352 (val), u353 (val)
        return Table.mapKV(u93, function(p1, p2) -- Line: 508 -- upvalues: u349 (upval)
            return p2, u349[p2] or false
        end), u135, u352, u353
    end,
    __callerAttributionSkipping = attributionFromCallerSkipping,
    States = u93,
    Server = States,
    Categories = u135,
}