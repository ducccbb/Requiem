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
--             File: ReplicatedStorage.Client.User.State.ClientStatusHandler
--                              Dumped in 0.000794 seconds
--                          Bytecode version 9  |  7 functions

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
local v2 = {
    CONCUSSED = "Concussed",
    BLOOD = "Blood",
    PECKISH = "Peckish",
    HUNGRY = "Hungry",
    STARVING = "Starving",
    THIRSTY = "Thirsty",
    PARCHED = "Parched",
    DEHYDRATED = "Dehydrated",
    COLD = "Cold",
    WARM = "Warm",
    HOT = "Hot",
    FREEZING = "Freezing",
    SHELTERED = "Sheltered",
    BLEEDING = "Bleeding",
    POISONED = "Poisoned",
}
local u32 = {}
local u33 = {added = {}, removed = {}}
local function removePlayerStatus(p1) -- Line: 51 -- upvalues: u32 (val), u33 (val)
    if not (u32[p1]) or u32[p1] == 0 then
        return
    end
    u32[p1] = u32[p1] - 1
    if u32[p1] == 0 and u33.removed[p1] then
        u33.removed[p1]:Fire()
    end
end
return {
    addPlayerStatus = function(p1, p2) -- Line: 82 -- upvalues: u32 (val), removePlayerStatus (val), u33 (val), Signal (val)
        u32[p1] = u32[p1] or 0
        u32[p1] = u32[p1] + 1
        if p2 then
            task.delay(p2, function() -- Line: 88 -- upvalues: removePlayerStatus (upval), p1 (val)
                removePlayerStatus(p1)
            end)
        end
        if u32[p1] == 1 then
            if not (u33.added[p1]) then
                u33.added[p1] = Signal.new()
            end
            u33.added[p1]:Fire(p2)
        end
    end,
    removePlayerStatus = removePlayerStatus,
    hasPlayerStatus = function(p1) -- Line: 72 -- upvalues: u32 (val)
        local v1 = u32[p1]
        if v1 then
            local v2 = u32[p1]
            v1 = 0 < v2
        end
        return v1
    end,
    getStatusAddedSignal = function(p1) -- Line: 108 -- upvalues: u33 (val), Signal (val)
        if not (u33.added[p1]) then
            u33.added[p1] = Signal.new()
        end
        return u33.added[p1]
    end,
    getStatusRemovedSignal = function(p1) -- Line: 121 -- upvalues: u33 (val), Signal (val)
        if not (u33.removed[p1]) then
            u33.removed[p1] = Signal.new()
        end
        return u33.removed[p1]
    end,
    Statuses = v2,
}