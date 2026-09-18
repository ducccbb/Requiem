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
--       File: ReplicatedStorage.Client.User.Character.CharacterNourishmentHandler
--                              Dumped in 0.000732 seconds
--                          Bytecode version 9  |  7 functions

local u131
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Food = Common_2:WaitForChild("Food")
local NourishmentDebuffs = require(Food:WaitForChild("NourishmentDebuffs"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local Progression = script.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
_, u131 = useWalkSpeed()
local u132 = nil
local u133 = false
local function isNourishmentActive(p1) -- Line: 31 -- upvalues: Config (val)
    if p1 ~= 0 then
        return true
    end
    local v1 = Config.Constants.IsDebuggingPlace == true
    return v1
end
local function applyStatModifier(p1, p2) -- Line: 39
    if p2.mode == "add" then
        return p1 + p2.value
    end
    if p2.mode == "multiply" then
        return p1 * p2.value
    end
    if p2.mode == "set" then
        return p2.value
    end
    return p1
end
local function resolveNourishmentWalkSpeed() -- Line: 51 -- upvalues: ClientAttributesHandler (val), Vitality (val), u133 (ref), NourishmentDebuffs (val), applyStatModifier (val)
    local v1 = ClientAttributesHandler.getAttribute("BasePlayerWalkSpeed") or 16
    local v2 = Vitality.Store.client()
    if not v2 or not u133 then
        return v1
    end
    local v3 = NourishmentDebuffs.resolveDebuffState(v2.hunger or 0, v2.maxHunger or 100, v2.thirst or 0, v2.maxThirst or 100)
    local v4 = v1
    local stats = v3.stats
    local v5 = nil
    local v6 = nil
    for i, j in stats, v5, v6 do
        if j.attribute == "BasePlayerWalkSpeed" then
            v4 = applyStatModifier(v4, j)
        end
    end
    return v4
end
local function syncWalkSpeed() -- Line: 75 -- upvalues: u132 (ref), u133 (ref), resolveNourishmentWalkSpeed (val), u131 (val)
    if u132 then
        u132()
        u132 = nil
    end
    if not u133 then
        return
    end
    local v1 = resolveNourishmentWalkSpeed()
    if 16 <= v1 then
        return
    end
    u132 = u131("nourishment", v1, "set", 5)
end
local function updateNourishmentActive(p1) -- Line: 93 -- upvalues: u133 (ref), isNourishmentActive (val), syncWalkSpeed (val)
    u133 = isNourishmentActive(p1)
    syncWalkSpeed()
end
ClientAttributesHandler.onAttributeChanged("BasePlayerWalkSpeed"):Connect(syncWalkSpeed)
Players.LocalPlayer.CharacterAdded:Connect(syncWalkSpeed)
Vitality.Store.observe(Players.LocalPlayer, syncWalkSpeed)
Server.Store.observe(Players.LocalPlayer, function() -- Line: 102 -- upvalues: Server (val), updateNourishmentActive (val)
    local event
    local v1 = Server.Store.client()
    if not v1 then
        event = 0
    else
        event = v1.event
        if not event then
            event = 0
        end
    end
    updateNourishmentActive(event)
end)
return {}