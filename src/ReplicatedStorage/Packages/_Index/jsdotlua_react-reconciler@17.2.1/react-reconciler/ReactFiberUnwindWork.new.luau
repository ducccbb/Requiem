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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberUnwindWork.new
--                               Dumped in 0.00122 seconds
--                          Bytecode version 9  |  4 functions

require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local resetWorkInProgressVersions = require(script.Parent:WaitForChild("ReactMutableSource.new")).resetWorkInProgressVersions
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local v1 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local popHostContainer = v1.popHostContainer
local popHostContext = v1.popHostContext
local popSuspenseContext = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new")).popSuspenseContext
local resetHydrationState = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new")).resetHydrationState
local v2 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local isContextProvider = v2.isContextProvider
local popContext = v2.popContext
local popTopLevelContextObject = v2.popTopLevelContextObject
local popProvider = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).popProvider
local u117 = nil
local function u118(...) -- Line: 44 -- upvalues: u117 (ref)
    if not u117 then
        u117 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new")).popRenderLanes
    end
    return u117(...)
end
local transferActualDuration = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).transferActualDuration
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
function unwindInterruptedWork(p1) -- Line: 150 -- upvalues: ReactWorkTags (val), popContext (val), popHostContainer (val), popTopLevelContextObject (val), resetWorkInProgressVersions (val), popHostContext (val), popSuspenseContext (val), popProvider (val), u118 (val)
    if p1.tag == ReactWorkTags.ClassComponent then
        local childContextTypes
        childContextTypes = if typeof(p1.type) == "table" then p1.type.childContextTypes else nil
        if childContextTypes == nil then
            return
        end
        popContext(p1)
        return
    end
    if p1.tag == ReactWorkTags.HostRoot then
        popHostContainer(p1)
        popTopLevelContextObject(p1)
        resetWorkInProgressVersions()
        return
    end
    if p1.tag == ReactWorkTags.HostComponent then
        popHostContext(p1)
        return
    end
    if p1.tag == ReactWorkTags.HostPortal then
        popHostContainer(p1)
        return
    end
    if p1.tag == ReactWorkTags.SuspenseComponent or p1.tag == ReactWorkTags.SuspenseListComponent then
        popSuspenseContext(p1)
        return
    end
    if p1.tag == ReactWorkTags.ContextProvider then
        popProvider(p1)
        return
    end
    if p1.tag == ReactWorkTags.OffscreenComponent then
        u118(p1)
        return
    end
    if p1.tag ~= ReactWorkTags.LegacyHiddenComponent then
        return
    end
    u118(p1)
end
return {
    unwindWork = function(p1, p2) -- Line: 55 -- upvalues: ReactWorkTags (val), isContextProvider (val), popContext (val), ReactFiberFlags (val), enableProfilerTimer (val), ReactTypeOfMode (val), transferActualDuration (val), popHostContainer (val), popTopLevelContextObject (val), resetWorkInProgressVersions (val), invariant (val), popHostContext (val), popSuspenseContext (val), enableSuspenseServerRenderer (val), resetHydrationState (val), popProvider (val), u118 (val)
        local v1, v2
        if p1.tag == ReactWorkTags.ClassComponent then
            if isContextProvider(p1.type) then
                popContext(p1)
            end
            local flags = p1.flags
            if bit32.band(flags, ReactFiberFlags.ShouldCapture) == 0 then
                return nil
            end
            v2 = bit32.band(flags, (bit32.bnot(ReactFiberFlags.ShouldCapture)))
            p1.flags = bit32.bor(v2, ReactFiberFlags.DidCapture)
            if enableProfilerTimer then
                v1 = bit32.band(p1.mode, ReactTypeOfMode.ProfileMode)
                if v1 ~= ReactTypeOfMode.NoMode then
                    transferActualDuration(p1)
                end
            end
            return p1
        end
        if p1.tag == ReactWorkTags.HostRoot then
            popHostContainer(p1)
            popTopLevelContextObject(p1)
            resetWorkInProgressVersions()
            local flags_2 = p1.flags
            v2 = bit32.band(flags_2, ReactFiberFlags.DidCapture)
            v1 = v2 == ReactFiberFlags.NoFlags
            invariant(v1, "The root failed to unmount after an error. This is likely a bug in React. Please file an issue.")
            v1 = bit32.band(flags_2, (bit32.bnot(ReactFiberFlags.ShouldCapture)))
            p1.flags = bit32.bor(v1, ReactFiberFlags.DidCapture)
            return p1
        end
        if p1.tag == ReactWorkTags.HostComponent then
            popHostContext(p1)
            return nil
        end
        if p1.tag ~= ReactWorkTags.SuspenseComponent then
            if p1.tag == ReactWorkTags.SuspenseListComponent then
                popSuspenseContext(p1)
                return nil
            end
            if p1.tag == ReactWorkTags.HostPortal then
                popHostContainer(p1)
                return nil
            end
            if p1.tag == ReactWorkTags.ContextProvider then
                popProvider(p1)
                return nil
            end
            if p1.tag ~= ReactWorkTags.OffscreenComponent then
                if p1.tag ~= ReactWorkTags.LegacyHiddenComponent then
                    return nil
                end
                u118(p1)
                return nil
            end
            u118(p1)
            return nil
        end
        popSuspenseContext(p1)
        if enableSuspenseServerRenderer then
            local memoizedState = p1.memoizedState
            if memoizedState ~= nil and memoizedState.dehydrated ~= nil then
                v1 = p1.alternate ~= nil
                invariant(v1, "Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue.")
                resetHydrationState()
            end
        end
        local flags_3 = p1.flags
        if bit32.band(flags_3, ReactFiberFlags.ShouldCapture) == 0 then
            return nil
        end
        v1 = bit32.band(flags_3, (bit32.bnot(ReactFiberFlags.ShouldCapture)))
        p1.flags = bit32.bor(v1, ReactFiberFlags.DidCapture)
        if enableProfilerTimer then
            local v3 = bit32.band(p1.mode, ReactTypeOfMode.ProfileMode)
            if v3 ~= ReactTypeOfMode.NoMode then
                transferActualDuration(p1)
            end
        end
        return p1
    end,
    unwindInterruptedWork = unwindInterruptedWork,
}