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
--          File: ReplicatedStorage.Client.Entities.Animals.ClientAnimalHandler
--                               Dumped in 0.00133 seconds
--                          Bytecode version 9  |  19 functions

local onAnimalSpawned
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
local Animal = require(Namespaces:WaitForChild("Animal"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Animals = Types:WaitForChild("Animals")
local Animal_2 = require(Animals:WaitForChild("Animal"))
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
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_4 = Common_6:WaitForChild("Utilities")
local AnimalSkinInteraction = require(Utilities_4:WaitForChild("AnimalSkinInteraction"))
local Utilities_5 = v1.Parent:WaitForChild("Utilities")
local AnimationAnimalClient = require(Utilities_5:WaitForChild("AnimationAnimalClient"))
local Utilities_6 = v1.Parent:WaitForChild("Utilities")
local ModelAnimalClient = require(Utilities_6:WaitForChild("ModelAnimalClient"))
local u171 = {}
local Types_2 = v1.Parent:WaitForChild("Types")
local Wolf = Types_2:WaitForChild("Wolf")
u171.Wolf = require(Wolf:WaitForChild("ClientWolfHandler"))
local Types_3 = v1.Parent:WaitForChild("Types")
local Bear = Types_3:WaitForChild("Bear")
u171.Bear = require(Bear:WaitForChild("ClientBearHandler"))
local u202 = {}
local u203 = nil
local u204 = nil
local function shutdownAnimalBrain(p1, p2) -- Line: 42 -- upvalues: ModelAnimalClient (val)
    p1.__internal.dead = true
    if p2 then
        p2:Clean()
    end
    if p1.cleanup then
        p1.cleanup:Clean()
    end
    if p1.throttle then
        p1.throttle(999)
    end
    if p1.model and p1.model.client and p1.root then
        ModelAnimalClient.anchorClientCorpse(p1.model.client, p1.root)
    end
end
local function onUpdateAnimalClientLogic(p1) -- Line: 69 -- upvalues: u171 (val)
    if not p1.throttle or p1.inactive or p1.__internal.dead then
        return
    end
    local v1 = u171[p1.variant]
    if v1 and v1.onAnimalStepped then
        v1.onAnimalStepped(p1)
    end
end
local function onDestroyAnimal(p1) -- Line: 157 -- upvalues: u202 (val)
    local v1 = u202[p1.id]
    v1.inactive = true
    u202[p1.id].destroy:Destroy()
    u202[p1.id] = nil
end
function onAnimalSpawned(p1, p2) -- Line: 168 -- upvalues: ModelAnimalClient (val), u202 (val), Signal (val), trove (val), Table (val), u203 (ref), Throttleable (val), u204 (ref), onUpdateAnimalClientLogic (val), onDestroyAnimal (val), u171 (val)
    local v1 = ModelAnimalClient.onAnimalModelCreated(p2)
    local id = p2.id
    u202[id] = {
        inactive = false,
        id = p2.id,
        variant = p2.variant,
        scale = p2.scale,
        model = {client = v1.client, server = v1.server},
        exposed = p2,
        signals = {destroy = Signal.new()},
        cleanup = trove.new(),
        destroy = trove.new(),
        animations = {},
        animator = v1.animator,
        root = v1.root,
        cooldowns = {},
        __internal = {},
    }
    if #Table.keys(u202) == 1 and not u203 then
        u203 = Throttleable.useThrottleable(function(p1) -- Line: 205 -- upvalues: u204 (upval)
            u204 = p1
        end)
    end
    local u40 = nil
    u40 = u204(function(p1) -- Line: 213 -- upvalues: u202 (upval), p2 (val), u40 (ref), onUpdateAnimalClientLogic (upval)
        if not (u202[p2.id]) then
            if u40 then
                u40()
            end
            return
        end
        u202[p2.id].throttle = p1
        onUpdateAnimalClientLogic(u202[p2.id])
        return u40
    end)
    u202[p2.id].destroy:Add(u40)
    u202[p2.id].signals.destroy:Connect(function() -- Line: 233 -- upvalues: onDestroyAnimal (upval), u202 (upval), p2 (val)
        onDestroyAnimal(u202[p2.id])
    end)
    local v2 = u171[p2.variant]
    if v2 and v2.onAnimalSpawned then
        v2.onAnimalSpawned(u202[p2.id])
    end
end
local function onAnimalCreated(p1) -- Line: 248 -- upvalues: Animal_2 (val), onAnimalSpawned (val)
    local v1 = Animal_2.getAnimalFolder():FindFirstChild((tostring(p1.id)))
    if not v1 then
        warn("Animal model not found: ", p1.id)
        return
    end
    onAnimalSpawned(v1, p1)
end
local function onBatchAnimalsReceived(p1) -- Line: 267 -- upvalues: onAnimalCreated (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        onAnimalCreated(j)
    end
end
Animal.Create.listen(onAnimalCreated)
Animal.Animate.listen(function(p1, p2) -- Line: 279 -- upvalues: u202 (val), AnimationAnimalClient (val)
    local v1 = u202[p1]
    if not v1 then
        return
    end
    AnimationAnimalClient.onAnimationReceived(v1, p2)
end)
Animal.Action.listen(function(p1, p2, p3, ...) -- Line: 92 -- upvalues: u202 (val), shutdownAnimalBrain (val), u171 (val)
    local v1
    local v2 = u202[p1]
    if not v2 or v2.inactive then
        return
    end
    if p2 == "UniversalDeadBehavior" then
        v2.cleanup:Clean()
        shutdownAnimalBrain(v2, v2.cleanup)
        v1 = u171[v2.variant]
        if v1 and v1.onActionReceived then
            v1.onActionReceived(v2, p2, p3, ...)
        end
        return
    end
    if v2.__internal.dead then
        return
    end
    v1 = u171[v2.variant]
    if v1 and v1.onActionReceived then
        v1.onActionReceived(v2, p2, p3, ...)
    end
end)
Animal.Respond.listen(function(p1, p2, ...) end)
Animal.ProximityUpdate.listen(function(p1, p2) -- Line: 142 -- upvalues: u202 (val)
    local v1 = u202[p1]
    if not v1 then
        return
    end
    v1.exposed.nearestPlayers = p2
end)
Animal.StateUpdate.listen(function(p1, p2) -- Line: 300 -- upvalues: u202 (val)
    local v1 = u202[p1]
    if v1 then
        v1.exposed.state = p2
    end
end)
Animal.Skinned.listen(function(p1) -- Line: 307 -- upvalues: u202 (val), AnimalSkinInteraction (val)
    local v1 = u202[p1]
    if not v1 then
        return
    end
    AnimalSkinInteraction.disableSkinInteraction(v1.model.client)
    AnimalSkinInteraction.disableSkinInteraction(v1.model.server)
    AnimalSkinInteraction.applySkinnedAppearance(v1.model.client)
end)
Animal.Batch.listen(onBatchAnimalsReceived)
Animal.Destroy.listen(function(p1) -- Line: 334 -- upvalues: u202 (val)
    local v1 = u202[p1]
    if not v1 then
        return
    end
    v1.inactive = true
end)
;(function() -- Line: 292 -- upvalues: Animal (val), onBatchAnimalsReceived (val)
    Animal.Batch.post({})
    Animal.Batch.listen(onBatchAnimalsReceived)
end)()
return {
    getAnimalById = function(p1) -- Line: 350 -- upvalues: u202 (val)
        return u202[p1]
    end,
}