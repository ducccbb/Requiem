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
--               File: ReplicatedStorage.Common.Utilities.RaycastHitboxV4
--                              Dumped in 0.000360 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local __PVP_DEBUGGING__ = _G.__PVP_DEBUGGING__
local CollectionService = game:GetService("CollectionService")
local HitboxCaster = require(v1.HitboxCaster)
local GoodSignal = require(v1.GoodSignal)
local u25 = {}
u25.__index = u25
u25.__type = "RaycastHitboxModule"
u25.DetectionMode = {Default = 1, PartMode = 2, Bypass = 3}
u25.SignalType = {Default = 1, Single = 2}
function u25.new(p1) -- Line: 199 -- upvalues: CollectionService (val), HitboxCaster (val), u25 (val), __PVP_DEBUGGING__ (val), GoodSignal (val)
    local v1
    if not p1 then
        v1 = setmetatable({
            HitboxPendingRemoval = false,
            HitboxStopTime = 0,
            HitboxActive = false,
            DebugLog = false,
            Tag = "_RaycastHitboxV4Managed",
            DetectionMode = u25.DetectionMode.Default,
            HitboxRaycastPoints = {},
            HitboxObject = p1,
            HitboxHitList = {},
            Visualizer = __PVP_DEBUGGING__,
            SignalType = u25.SignalType.Single,
            OnUpdate = GoodSignal.new(u25.SignalType.Single),
            OnHit = GoodSignal.new(u25.SignalType.Single),
        }, HitboxCaster)
        v1:_Init()
        return v1
    end
    if CollectionService:HasTag(p1, "_RaycastHitboxV4Managed") then
        return (HitboxCaster:_FindHitbox(p1))
    end
    v1 = setmetatable({
        HitboxPendingRemoval = false,
        HitboxStopTime = 0,
        HitboxActive = false,
        DebugLog = false,
        Tag = "_RaycastHitboxV4Managed",
        DetectionMode = u25.DetectionMode.Default,
        HitboxRaycastPoints = {},
        HitboxObject = p1,
        HitboxHitList = {},
        Visualizer = __PVP_DEBUGGING__,
        SignalType = u25.SignalType.Single,
        OnUpdate = GoodSignal.new(u25.SignalType.Single),
        OnHit = GoodSignal.new(u25.SignalType.Single),
    }, HitboxCaster)
    v1:_Init()
    return v1
end
function u25.GetHitbox(p1, p2) -- Line: 230 -- upvalues: HitboxCaster (val)
    if p2 then
        return HitboxCaster:_FindHitbox(p2)
    end
end
return u25