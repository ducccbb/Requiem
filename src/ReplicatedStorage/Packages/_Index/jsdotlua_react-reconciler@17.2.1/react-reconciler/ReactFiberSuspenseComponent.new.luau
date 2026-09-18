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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberSuspenseComponent.new
--                              Dumped in 0.000538 seconds
--                          Bytecode version 9  |  3 functions

require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberLane"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local DidCapture = ReactFiberFlags.DidCapture
local isSuspenseInstancePending = ReactFiberHostConfig.isSuspenseInstancePending
local isSuspenseInstanceFallback = ReactFiberHostConfig.isSuspenseInstanceFallback
return {
    shouldCaptureSuspense = function(p1, p2) -- Line: 83
        local memoizedState = p1.memoizedState
        if memoizedState then
            if memoizedState.dehydrated ~= nil then
                return true
            end
            return false
        end
        local memoizedProps = p1.memoizedProps
        if memoizedProps.fallback == nil then
            return false
        end
        if memoizedProps.unstable_avoidThisFallback ~= true then
            return true
        end
        if p2 then
            return false
        end
        return true
    end,
    findFirstSuspended = function(p1) -- Line: 112 -- upvalues: SuspenseComponent (val), isSuspenseInstancePending (val), isSuspenseInstanceFallback (val), SuspenseListComponent (val), DidCapture (val), NoFlags (val)
        local dehydrated, memoizedState, v1, v2
        local child = p1
        local v3 = p1
        while child ~= nil do
            if child.tag ~= SuspenseComponent then
                if child.tag == SuspenseListComponent and child.memoizedProps.revealOrder ~= nil then
                    v2 = bit32.band(child.flags, DidCapture)
                    v1 = v2 ~= NoFlags
                    if v1 then
                        return child
                    end
                    if child == v3 then
                        return nil
                    end
                    while child.sibling == nil do
                        if child.return_ ~= nil and child.return_ ~= v3 then
                            child = child.return_
                            continue
                        end
                        return nil
                    end
                    child.sibling.return_ = child.return_
                    child = child.sibling
                    continue
                end
                if child.child ~= nil then
                    child.child.return_ = child
                    child = child.child
                end
            else
                memoizedState = child.memoizedState
                if memoizedState then
                    dehydrated = memoizedState.dehydrated
                    if dehydrated ~= nil and not (isSuspenseInstancePending(dehydrated)) and not (isSuspenseInstanceFallback(dehydrated)) then end
                    return child
                end
            end
        end
        return nil
    end,
}