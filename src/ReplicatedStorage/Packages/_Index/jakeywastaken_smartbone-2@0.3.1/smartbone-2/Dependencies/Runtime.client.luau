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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Runtime
--                              Dumped in 0.000999 seconds
--                          Bytecode version 9  |  11 functions

local Parent = script.Parent
local u2 = nil
local u4 = nil
local u6 = false
local u7 = {}
local function c(p1) -- Line: 11 -- upvalues: u7 (val)
    table.insert(u7, p1)
end
local function cleanup() -- Line: 15 -- upvalues: u7 (val)
    local v1 = u7
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        j:Disconnect()
    end
end
local u10 = nil
while true do
    task.wait()
    if u6 then
        break
    end
end
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local u32 = (nil).new()
local Dependencies = u4.Dependencies
local DebugUi = require(Dependencies.DebugUi)
local u71 = nil
local Config = require(Dependencies.Config)
local Utilities = require(Dependencies.Utilities)
local ALLOW_LIVE_GAME_DEBUG = RunService:IsStudio()
if not ALLOW_LIVE_GAME_DEBUG then
    ALLOW_LIVE_GAME_DEBUG = Config.ALLOW_LIVE_GAME_DEBUG
end
local OverlayEvent = u4:WaitForChild("OverlayEvent")
local u54 = false
local u55 = {
    Begin = function(...) -- Line: 52 -- upvalues: OverlayEvent (val)
        OverlayEvent:Fire("Begin", ...)
    end,
    End = function(...) -- Line: 55 -- upvalues: OverlayEvent (val)
        OverlayEvent:Fire("End", ...)
    end,
    Text = function(...) -- Line: 58 -- upvalues: OverlayEvent (val)
        OverlayEvent:Fire("Text", ...)
    end,
}
shared.FrameCounter = 0
if ALLOW_LIVE_GAME_DEBUG then
    u71 = require(Dependencies.Iris)
    if not (u71.HasInit()) then
        u71 = u71.Init()
    end
end
Parent.Name = ("%* - %*"):format(u2.Name, u32.ID)
u32:LoadObject(u2)
local v1 = nil
local v2 = nil
local v3 = nil
for i, j in v1, v2, v3 do
    u32:LoadRawCollider(j[1], j[2])
end
local u146 = if ALLOW_LIVE_GAME_DEBUG then {
    DRAW_BONE = u71.State(false),
    DRAW_PHYSICAL_BONE = u71.State(false),
    DRAW_ROOT_PART = u71.State(false),
    DRAW_BOUNDING_BOX = u71.State(false),
    DRAW_AXIS_LIMITS = u71.State(false),
    DRAW_COLLIDERS = u71.State(false),
    DRAW_COLLIDER_INFLUENCE = u71.State(false),
    DRAW_COLLIDER_AWAKE = u71.State(false),
    DRAW_COLLIDER_BROADPHASE = u71.State(false),
    DRAW_FILL_COLLIDERS = u71.State(false),
    DRAW_CONTACTS = u71.State(false),
    DRAW_ROTATION_LIMITS = u71.State(false),
    DRAW_ACCELERATION_INFO = u71.State(false),
} else nil
if ALLOW_LIVE_GAME_DEBUG then
    u71:Connect(function() -- Line: 104 -- upvalues: u2 (ref), DebugUi (val), u71 (ref), u32 (val), u146 (ref)
        if u2:GetAttribute("Debug") ~= nil then
            DebugUi(u71, u32, u146)
        end
    end)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("SmartCollider")
v2 = InstanceAddedSignal:Connect(function(p1) -- Line: 111 -- upvalues: u2 (ref), Utilities (val), u32 (val)
    if not (p1:IsA("BasePart")) then
        return
    end
    local Attribute = p1:GetAttribute("ColliderKey")
    local Attribute_2 = u2:GetAttribute("ColliderKey")
    local v1 = tostring(Attribute)
    if v1 ~= tostring(Attribute_2) then
        return
    end
    v1 = Utilities.GetCollider(p1)
    u32:LoadRawCollider(v1, p1)
end)
table.insert(u7, v2)
v2 = Parent:BindToMessage("Destroy", function() -- Line: 128 -- upvalues: u54 (ref)
    u54 = true
end)
table.insert(u7, v2)
v2 = RunService.Heartbeat:ConnectParallel(function(p1) -- Line: 132 -- upvalues: u32 (val), u54 (ref), u7 (val), Parent (val), ALLOW_LIVE_GAME_DEBUG (val), u2 (ref), u146 (ref), u55 (val)
    local v1
    local v2 = shared
    v2.FrameCounter = v2.FrameCounter + 1
    if 131072 < shared.FrameCounter then
        shared.FrameCounter = 0
    end
    u32:StepBoneTrees(p1)
    if u32.ShouldDestroy then
        u32:Destroy()
        task.synchronize()
        v2 = u7
        local v3 = nil
        v1 = nil
        for i, j in v2, v3, v1 do
            j:Disconnect()
        end
        Parent:Destroy()
        return
    elseif not u54 then
        if ALLOW_LIVE_GAME_DEBUG and u2:GetAttribute("Debug") ~= nil then
            task.synchronize()
            v1 = u146.DRAW_COLLIDERS:get()
            local v4 = u146.DRAW_CONTACTS:get()
            local v5 = u146.DRAW_PHYSICAL_BONE:get()
            local v6 = u146.DRAW_BONE:get()
            local v7 = u146.DRAW_AXIS_LIMITS:get()
            local v8 = u146.DRAW_ROOT_PART:get()
            local v9 = u146.DRAW_FILL_COLLIDERS:get()
            local v10 = u146.DRAW_COLLIDER_INFLUENCE:get()
            local v11 = u146.DRAW_COLLIDER_AWAKE:get()
            local v12 = u146.DRAW_COLLIDER_BROADPHASE:get()
            local v13 = u146.DRAW_BOUNDING_BOX:get()
            local v14 = u146.DRAW_ROTATION_LIMITS:get()
            u32:DrawDebug(v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, u146.DRAW_ACCELERATION_INFO:get())
            u32:DrawOverlay(u55)
        end
        return
    end
end)
table.insert(u7, v2)