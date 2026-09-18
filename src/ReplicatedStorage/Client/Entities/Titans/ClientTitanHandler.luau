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
--           File: ReplicatedStorage.Client.Entities.Titans.ClientTitanHandler
--                               Dumped in 0.00126 seconds
--                          Bytecode version 9  |  14 functions

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
local Titan = require(Namespaces:WaitForChild("Titan"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Signal = require(Utilities_2:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Throttleable = require(Utilities_3:WaitForChild("Throttleable"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_6:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local Utilities_4 = v1.Parent:WaitForChild("Utilities")
local AnimationTitanClient = require(Utilities_4:WaitForChild("AnimationTitanClient"))
local Utilities_5 = v1.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_5:WaitForChild("KinematicTitanClient"))
local Utilities_6 = v1.Parent:WaitForChild("Utilities")
local ModelTitanClient = require(Utilities_6:WaitForChild("ModelTitanClient"))
local Utilities_7 = v1.Parent:WaitForChild("Utilities")
local TitanClientProximity = require(Utilities_7:WaitForChild("TitanClientProximity"))
local u170 = {}
local Types_2 = v1.Parent:WaitForChild("Types")
local Default = Types_2:WaitForChild("Default")
u170.default = require(Default:WaitForChild("DefaultTitanClient"))
local Types_3 = v1.Parent:WaitForChild("Types")
local Ice = Types_3:WaitForChild("Ice")
u170.ice = require(Ice:WaitForChild("IceTitanClient"))
local Types_4 = v1.Parent:WaitForChild("Types")
local Sprinter = Types_4:WaitForChild("Sprinter")
u170.sprinter = require(Sprinter:WaitForChild("SprinterTitanClient"))
local u216 = {}
local u217 = 0
local u218 = {}
local u219 = nil
local u220 = nil
local function onUpdateTitanClientLogic(p1) -- Line: 54 -- upvalues: TitanClientProximity (val), u217 (ref), u170 (val)
    local default
    debug.profilebegin("ClientTitanHandler.onUpdateTitanClientLogic")
    if not p1.throttle then
        debug.profileend()
        return
    end
    TitanClientProximity.setActiveTitanCount(u217)
    local v1 = TitanClientProximity.distanceToTitan(p1.root)
    if not v1 then
        default = u170[p1.variant]
        if not default then
            default = u170.default
        end
        default.onTitanStepped(p1)
        debug.profileend()
        return
    end
    local v2 = TitanClientProximity.getProximityTier(v1)
    if v2 == "mid" or v2 == "idle" then
        p1.throttle(TitanClientProximity.getThrottleForTier(v2))
        debug.profileend()
        return
    end
    default = u170[p1.variant]
    if not default then
        default = u170.default
    end
    default.onTitanStepped(p1)
    debug.profileend()
end
local function onDestroyTitan(p1) -- Line: 111 -- upvalues: KinematicTitanClient (val), u218 (val), u216 (val), u217 (ref), TitanClientProximity (val)
    debug.profilebegin("ClientTitanHandler.onDestroyTitan")
    KinematicTitanClient.clearLookAtStateForTitanId(p1.id)
    u218[p1.id] = nil
    local v1 = u216[p1.id]
    v1.inactive = true
    u216[p1.id].destroy:Destroy()
    u216[p1.id] = nil
    u217 = math.max(0, u217 - 1)
    TitanClientProximity.setActiveTitanCount(u217)
    debug.profileend()
end
local function onTitanCreated(p1) -- Line: 128 -- upvalues: ModelTitanClient (val), u216 (val), Signal (val), trove (val), Table (val), u219 (ref), Throttleable (val), u220 (ref), onUpdateTitanClientLogic (val), onDestroyTitan (val), u217 (ref), TitanClientProximity (val)
    local v1 = ModelTitanClient.onTitanModelCreated(p1)
    local id = p1.id
    u216[id] = {
        inactive = false,
        awake = false,
        id = p1.id,
        scale = p1.scale,
        isSupporter = p1.isSupporter,
        displayModel = p1.displayModel,
        model = {client = v1.client, server = v1.server},
        signals = {destroy = Signal.new()},
        cleanup = trove.new(),
        destroy = trove.new(),
        animations = {},
        animator = v1.animator,
        root = v1.root,
        hair = p1.hair,
        variant = p1.variant,
        attributes = p1.attributes,
        cooldowns = {},
    }
    if #Table.keys(u216) == 1 and not u219 then
        u219 = Throttleable.useThrottleable(function(p1) -- Line: 171 -- upvalues: u220 (upval)
            u220 = p1
        end)
    end
    local u42 = nil
    u42 = u220(function(a1) -- Line: 179 -- upvalues: u216 (upval), p1 (val), u42 (ref), onUpdateTitanClientLogic (upval)
        if not (u216[p1.id]) then
            if u42 then
                u42()
            end
            return
        end
        u216[p1.id].throttle = a1
        onUpdateTitanClientLogic(u216[p1.id])
        return u42
    end)
    u216[p1.id].destroy:Add(u42)
    u216[p1.id].signals.destroy:Connect(function() -- Line: 199 -- upvalues: onDestroyTitan (upval), u216 (upval), p1 (val)
        onDestroyTitan(u216[p1.id])
    end)
    u217 = u217 + 1
    TitanClientProximity.setActiveTitanCount(u217)
end
local function onBatchTitansReceived(p1) -- Line: 212 -- upvalues: onTitanCreated (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        onTitanCreated(j)
    end
end
Titan.Create.listen(onTitanCreated)
Titan.Animate.listen(function(p1, p2) -- Line: 240 -- upvalues: u216 (val), AnimationTitanClient (val)
    local v1 = u216[p1]
    if not v1 then
        return
    end
    AnimationTitanClient.onAnimationReceived(v1, p2)
end)
Titan.Action.listen(function(p1, p2, ...) -- Line: 85 -- upvalues: u216 (val), u170 (val)
    debug.profilebegin((("ClientTitanHandler.onActionReceived:%*"):format(p2)))
    local v1 = u216[p1]
    if not v1 or v1.inactive then
        debug.profileend()
        return
    end
    local default = u170[v1.variant]
    if not default then
        default = u170.default
    end
    default.onActionReceived(v1, p2, ...)
    debug.profileend()
end)
Titan.Destroy.listen(function(p1) -- Line: 257 -- upvalues: u216 (val)
    debug.profilebegin("ClientTitanHandler.onDestroySignal")
    local v1 = u216[p1]
    if not v1 then
        debug.profileend()
        return
    end
    v1.inactive = true
    debug.profileend()
end)
TitanClientProximity.init()
;(function() -- Line: 224 -- upvalues: Titan (val), onBatchTitansReceived (val)
    debug.profilebegin("ClientTitanHandler.onClientTitanHandlerLoaded")
    Titan.Batch.post({})
    Titan.Batch.listen(onBatchTitansReceived)
    debug.profileend()
end)()
return {
    getTitanById = function(p1) -- Line: 310 -- upvalues: u216 (val)
        debug.profilebegin("ClientTitanHandler.getTitanById")
        local v1 = u216[p1]
        debug.profileend()
        return v1
    end,
    getTitans = function() -- Line: 317 -- upvalues: u216 (val)
        debug.profilebegin("ClientTitanHandler.getTitans")
        debug.profileend()
        return u216
    end,
}