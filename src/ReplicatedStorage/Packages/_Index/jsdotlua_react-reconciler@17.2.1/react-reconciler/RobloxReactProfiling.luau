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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.RobloxReactProfiling
--                               Dumped in 0.00127 seconds
--                          Bytecode version 9  |  13 functions

local v1
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = _G.__REACT_MICROPROFILER_LEVEL or 0
local u29 = false
local u30 = nil
function startTimerSampling(p1) -- Line: 42 -- upvalues: u29 (ref), u30 (ref)
    if u29 then
        warn("RobloxReactProfiling Timer Sampling already running.")
    end
    u29 = true
    u30 = p1
end
function endTimerSampling() -- Line: 50 -- upvalues: u29 (ref), u30 (ref)
    u29 = false
    u30 = nil
end
function getFirstStringKey(p1) -- Line: 55
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if type(i) == "string" then
            return i
        end
    end
    return nil
end
function startTimer(p1) -- Line: 64 -- upvalues: u29 (ref)
    if u29 then
        p1.startTime = os.clock()
    end
end
function endTimer(p1) -- Line: 69 -- upvalues: u29 (ref), u30 (ref)
    if u29 then
        p1.endTime = os.clock()
        if u30 then
            u30(p1)
        end
    end
end
function profileRootBeforeUnitOfWork(p1) -- Line: 78
    local child
    local current = p1.current
    local Name = nil
    if current then
        if current.memoizedProps then
            Name = getFirstStringKey(current.memoizedProps)
        end
        if Name == nil and current.stateNode and current.stateNode.containerInfo then
            Name = current.stateNode.containerInfo.Name
        end
    end
    if Name == "Folder" and current.child then
        child = current.child
        local Name_2 = if child.memoizedProps then getFirstStringKey(child.memoizedProps) else nil
        if Name_2 == nil and child.stateNode and child.stateNode.containerInfo then
            Name_2 = child.stateNode.containerInfo.Name
        end
        if Name_2 ~= nil then
            Name = Name_2
        end
    end
    if Name == nil then
        return nil
    end
    local v1 = {startTime = 0, endTime = 0, id = Name}
    startTimer(v1)
    debug.profilebegin(Name)
    return v1
end
function profileRootAfterYielding(p1) -- Line: 132
    if p1 then
        endTimer(p1)
        debug.profileend()
    end
end
function profileUnitOfWorkBefore(p1) -- Line: 139 -- upvalues: getComponentName (val), ReactWorkTags (val)
    local v1 = getComponentName(p1.type)
    if p1.key then
        v1 = tostring(p1.key) .. "=" .. (v1 or "?")
    end
    local v2 = nil
    if p1.stateNode then
        if p1.tag == ReactWorkTags.HostComponent then
            local v3 = p1.stateNode:FindFirstAncestorWhichIsA("LayerCollector")
            if v3 then
                v2 = "[" .. v3:GetFullName() .. "] "
            end
        elseif p1.tag ~= ReactWorkTags.HostText then
        end
    end
    if v2 then
        v1 = v2 .. " : " .. (v1 or "?")
    end
    if v1 == nil then
        return false
    end
    debug.profilebegin(v1)
    return true
end
function profileUnitOfWorkAfter(p1) -- Line: 172
    if p1 then
        debug.profileend()
    end
end
function profileCommitBefore() -- Line: 178
    debug.profilebegin("Commit")
end
function profileCommitAfter() -- Line: 181
    debug.profileend()
end
function noop(...) end
local v3 = {startTimerSampling = startTimerSampling, endTimerSampling = endTimerSampling}
if 1 > v2 then
    v1 = noop
else
    v1 = profileRootBeforeUnitOfWork
end
v3.profileRootBeforeUnitOfWork = v1
if 1 > v2 then
    v1 = noop
else
    v1 = profileRootAfterYielding
end
v3.profileRootAfterYielding = v1
if 10 > v2 then
    v1 = noop
else
    v1 = profileUnitOfWorkBefore
end
v3.profileUnitOfWorkBefore = v1
if 10 > v2 then
    v1 = noop
else
    v1 = profileUnitOfWorkAfter
end
v3.profileUnitOfWorkAfter = v1
if 1 > v2 then
    v1 = noop
else
    v1 = profileCommitBefore
end
v3.profileCommitBefore = v1
if 1 > v2 then
    v1 = noop
else
    v1 = profileCommitAfter
end
v3.profileCommitAfter = v1
return v3