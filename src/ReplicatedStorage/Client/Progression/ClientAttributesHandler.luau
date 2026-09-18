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
--          File: ReplicatedStorage.Client.Progression.ClientAttributesHandler
--                               Dumped in 0.00124 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = require(Common:WaitForChild("Network"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Attributes = require(Namespaces:WaitForChild("Attributes"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Progression = Common_3:WaitForChild("Progression")
local AttributeDiminishingConfig = require(Progression:WaitForChild("AttributeDiminishingConfig"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Progression_2 = Common_4:WaitForChild("Progression")
local Attributes_2 = require(Progression_2:WaitForChild("Attributes"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local String = require(Utilities_2:WaitForChild("String"))
local u131 = {}
local u132 = {}
local u133 = {}
local u135 = Signal.new()
local function loadClientAttributes(p1) -- Line: 46 -- upvalues: Attributes_2 (val), String (val), u131 (val), u132 (val)
    local v1, v2, v3, v4
    local v5 = p1
    for k, v in pairs(Attributes_2) do
        for k2, i in pairs(v) do
            v1 = String.hashToInt16(k2)
            if v5[tostring(v1)] then
                u131[v1] = k2
            end
        end
    end
    for k3, j in pairs(u131) do
        v2 = v5[tostring(k3)]
        v3 = u132
        if typeof(v2) ~= "number" then
            v4 = v2
        else
            v4 = math.round(v2 * 100) / 100
        end
        v3[j] = v4
    end
end
local function observeClientAttributesChanged(p1, p2) -- Line: 71 -- upvalues: u131 (val), u132 (val), u133 (val), u135 (val)
    local v1, v2, v3, v4, v5
    v1, v2 = p1, p2
    for k, v in pairs(u131) do
        v4 = v1[tostring(k)]
        if v4 ~= v2[tostring(k)] then
            v5 = u132
            if typeof(v4) ~= "number" then
                v3 = v4
            else
                v3 = math.round(v4 * 100) / 100
            end
            v5[v] = v3
            if u133[v] then
                u133[v]:Fire(v4)
            end
        end
    end
    u135:Fire()
end
local function getAttribute(p1) -- Line: 105 -- upvalues: u132 (val)
    return u132[p1]
end
local function applyHyperbolicDiminishing(p1, p2) -- Line: 111
    local v1
    if not p2.inverted then
        if p2.k <= 0 then
            return (math.min(p1, p2.cap))
        end
        v1 = p2.cap * p1 / (p1 + p2.k)
        if 0 <= p1 then
            return (math.min(p1, v1))
        end
        return (math.max(p1, v1))
    end
    if 1 <= p1 then
        return p1
    end
    v1 = 1 - p2.cap
    local v2 = math.max(0, 1 - p1)
    if p2.k <= 0 then
        return 1 - math.min(v2, v1)
    end
    return 1 - math.min(v2, v1 * v2 / (v2 + p2.k))
end
Network.loaded:andThen(function() -- Line: 179 -- upvalues: Attributes (val), Players (val), loadClientAttributes (val), observeClientAttributesChanged (val)
    local u5 = Attributes.Store.get(Players.LocalPlayer)
    local u6 = u5
    if u5 then
        loadClientAttributes(u5)
    end
    Attributes.Store.observe(Players.LocalPlayer, function() -- Line: 190 -- upvalues: u5 (ref), Attributes (upval), Players (upval), observeClientAttributesChanged (upval), u6 (ref)
        u5 = Attributes.Store.get(Players.LocalPlayer)
        observeClientAttributesChanged(u5, u6)
        u6 = u5
    end)
end)
return {
    getAttributes = function() -- Line: 201 -- upvalues: u132 (val)
        return u132
    end,
    Changed = u135,
    getAttribute = getAttribute,
    getDiminishedAttribute = function(p1, p2) -- Line: 152 -- upvalues: getAttribute (val), AttributeDiminishingConfig (val), applyHyperbolicDiminishing (val)
        local rawOverride, v1, v2
        if not p2 then
            rawOverride = getAttribute(p1)
        elseif p2.rawOverride ~= nil then
            rawOverride = p2.rawOverride
        end
        if typeof(rawOverride) ~= "number" then
            return rawOverride
        end
        if not p2 then
            v1 = AttributeDiminishingConfig[p1]
            if v1 then
                if v1.enabled == false or v1.model ~= "hyperbolic" then
                    return rawOverride
                end
                if v1.min == nil then
                    v2 = rawOverride
                else
                    v2 = math.max(rawOverride, v1.min)
                end
                return applyHyperbolicDiminishing(v2, v1)
            end
            return rawOverride
        end
        if p2.bypassCap then
            return rawOverride
        end
        v1 = AttributeDiminishingConfig[p1]
        if not v1 or v1.enabled == false or v1.model ~= "hyperbolic" then
            return rawOverride
        end
        if v1.min == nil then
            v2 = rawOverride
        else
            v2 = math.max(rawOverride, v1.min)
        end
        return applyHyperbolicDiminishing(v2, v1)
    end,
    onAttributeChanged = function(p1) -- Line: 92 -- upvalues: u133 (val), Signal (val)
        if not (u133[p1]) then
            u133[p1] = Signal.new()
        end
        return u133[p1]
    end,
}