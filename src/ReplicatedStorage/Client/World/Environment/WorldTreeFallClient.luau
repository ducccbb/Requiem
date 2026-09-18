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
--         File: ReplicatedStorage.Client.World.Environment.WorldTreeFallClient
--                               Dumped in 0.00139 seconds
--                          Bytecode version 9  |  14 functions

local onWaitForEntry
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local World = Common_3:WaitForChild("World")
local TreeFall = require(World:WaitForChild("TreeFall"))
local u84 = {}
local u85 = {}
local u86 = {}
local function onPlayTreeFallSound(p1) -- Line: 40 -- upvalues: u86 (val), Sounds (val), Universal (val)
    if u86[p1] then
        return
    end
    u86[p1] = true
    Sounds.playFalloffSoundEffect(Universal.TreeFallVariants, p1:GetPivot().Position, 2000, 2, {min = 0.9, max = 1.1})
end
local function onFinishTreeFall(p1, p2) -- Line: 61 -- upvalues: u85 (val)
    p2:Disconnect()
    u85[p1] = nil
end
local function onStopAnimation(p1) -- Line: 71 -- upvalues: u85 (val)
    local v1 = u85[p1]
    if not v1 then
        return
    end
    v1.connection:Disconnect()
    u85[p1] = nil
end
local function onAnimateTree(p1, p2) -- Line: 87 -- upvalues: u85 (val), TreeFall (val), Workspace (val), onStopAnimation (val), onPlayTreeFallSound (val), RunService (val), onFinishTreeFall (val)
    if p1:GetAttribute("Fallen") or u85[p1] then
        return
    end
    local FALL_DURATION = TreeFall.FALL_DURATION
    local FALL_ANGLE = TreeFall.FALL_ANGLE
    local u13 = p2.fallAt - FALL_DURATION
    local ServerTimeNow = Workspace:GetServerTimeNow()
    if p2.fallAt <= ServerTimeNow then
        return
    end
    onStopAnimation(p1)
    onPlayTreeFallSound(p1)
    local standingPivot = p2.standingPivot
    local u26 = nil
    u26 = RunService.Heartbeat:Connect(function() -- Line: 107 -- upvalues: p1 (val), onFinishTreeFall (upval), u26 (ref), Workspace (upval), p2 (val), u13 (val), FALL_DURATION (val), TreeFall (upval), FALL_ANGLE (val), standingPivot (val)
        if not p1.Parent or p1:GetAttribute("Fallen") then
            onFinishTreeFall(p1, u26)
            return
        end
        local ServerTimeNow = Workspace:GetServerTimeNow()
        if p2.fallAt <= ServerTimeNow then
            onFinishTreeFall(p1, u26)
            return
        end
        local v1 = math.clamp((ServerTimeNow - u13) / FALL_DURATION, 0, 1)
        local v2 = TreeFall.fallEaseIn(v1)
        p1:PivotTo(TreeFall.getRotatedPivot(standingPivot, p2.bottom, p2.axis, v2 * FALL_ANGLE))
    end)
    u85[p1] = {connection = u26}
end
local function onScheduleTree(p1, p2) -- Line: 133 -- upvalues: u84 (val), TreeFall (val), Workspace (val), onAnimateTree (val)
    if u84[p1] or p1:GetAttribute("Fallen") then
        return
    end
    u84[p1] = true
    local v1 = math.max(0, p2.fallAt - TreeFall.FALL_DURATION - Workspace:GetServerTimeNow())
    task.delay(v1, function() -- Line: 143 -- upvalues: p1 (val), onAnimateTree (upval), p2 (val)
        if p1.Parent and not (p1:GetAttribute("Fallen")) then
            onAnimateTree(p1, p2)
        end
    end)
end
function onWaitForEntry(p1, p2, p3) -- Line: 157 -- upvalues: TreeFall (val), onWaitForEntry (val)
    local v1 = TreeFall.readEntryFromAttributes(p1, p2)
    if v1 then
        return v1
    end
    if 20 <= p3 then
        return nil
    end
    task.wait(0.1)
    return onWaitForEntry(p1, p2, p3 + 1)
end
local function onSyncTree(p1, p2) -- Line: 177 -- upvalues: onWaitForEntry (val), TreeFall (val), onScheduleTree (val)
    if not (p1:IsA("Model")) then
        return
    end
    task.spawn(function() -- Line: 182 -- upvalues: p2 (val), onWaitForEntry (upval), p1 (val), TreeFall (upval), onScheduleTree (upval)
        local v1
        if not p2 then
            v1 = TreeFall.readEntryFromAttributes(p1)
        else
            v1 = onWaitForEntry(p1, p2, 0)
        end
        if v1 then
            onScheduleTree(p1, v1)
        end
    end)
end
local function onSyncPendingTrees() -- Line: 214 -- upvalues: Workspace (val), TreeFall (val), CollectionService (val), onSyncTree (val)
    local Attribute = Workspace:GetAttribute(TreeFall.WORKSPACE_STAMP_ATTRIBUTE)
    if typeof(Attribute) ~= "number" then
        return
    end
    for i, j in CollectionService:GetTagged("Fall") do
        if j:IsA("Model") then
            onSyncTree(j, Attribute)
        end
    end
end
local AttributeChangedSignal = Workspace:GetAttributeChangedSignal(TreeFall.WORKSPACE_STAMP_ATTRIBUTE)
AttributeChangedSignal:Connect(onSyncPendingTrees)
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Fall")
InstanceAddedSignal:Connect(function(p1) -- Line: 231 -- upvalues: Workspace (val), TreeFall (val), onSyncTree (val)
    if not (p1:IsA("Model")) then
        return
    end
    local Attribute = Workspace:GetAttribute(TreeFall.WORKSPACE_STAMP_ATTRIBUTE)
    if typeof(Attribute) == "number" then
        onSyncTree(p1, Attribute)
    end
end)
onSyncPendingTrees()
return {
    onBeginFemaleTitanCollapse = function(p1) -- Line: 202 -- upvalues: CollectionService (val), onSyncTree (val)
        for i, j in CollectionService:GetTagged("Fall") do
            if j:IsA("Model") then
                onSyncTree(j, p1)
            end
        end
    end,
    onSyncTree = onSyncTree,
}