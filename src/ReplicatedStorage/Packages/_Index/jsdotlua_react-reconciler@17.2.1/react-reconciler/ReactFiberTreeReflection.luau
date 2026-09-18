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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberTreeReflection
--                               Dumped in 0.00163 seconds
--                          Bytecode version 9  |  12 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local get = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap.get
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ClassComponent = ReactWorkTags.ClassComponent
local HostComponent = ReactWorkTags.HostComponent
local HostRoot = ReactWorkTags.HostRoot
local HostPortal = ReactWorkTags.HostPortal
local HostText = ReactWorkTags.HostText
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local Placement = ReactFiberFlags.Placement
local Hydrating = ReactFiberFlags.Hydrating
local enableFundamentalAPI = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableFundamentalAPI
local ReactCurrentOwner = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local v1 = {}
local function getNearestMountedFiber(p1) -- Line: 47 -- upvalues: Placement (val), Hydrating (val), NoFlags (val), HostRoot (val)
    local return__3 = p1
    local return_ = p1
    if p1.alternate then
        while return__3.return_ do
            return__3 = return__3.return_
        end
    else
        local v1
        local return__2 = return__3
        while true do
            return__3 = return__2
            v1 = bit32.band(return__3.flags, (bit32.bor(Placement, Hydrating)))
            if v1 ~= NoFlags then
                return_ = return__3.return_
            end
            return__2 = return__3.return_
            if not return__2 then
                break
            end
        end
    end
    if return__3.tag == HostRoot then
        return return_
    end
    return nil
end
v1.getNearestMountedFiber = getNearestMountedFiber
function v1.getSuspenseInstanceFromFiber(p1) -- Line: 81 -- upvalues: SuspenseComponent (val)
    if p1.tag ~= SuspenseComponent then
        return nil
    end
    local memoizedState = p1.memoizedState
    if memoizedState == nil then
        local alternate = p1.alternate
        if alternate ~= nil then
            memoizedState = alternate.memoizedState
        end
    end
    if memoizedState then
        return memoizedState.dehydrated
    end
    return nil
end
function v1.getContainerFromFiber(p1) -- Line: 97 -- upvalues: HostRoot (val)
    if p1.tag == HostRoot then
        return p1.stateNode.containerInfo
    end
    return nil
end
function v1.isFiberMounted(p1) -- Line: 101 -- upvalues: getNearestMountedFiber (val)
    local v1 = getNearestMountedFiber(p1) == p1
    return v1
end
function v1.isMounted(p1) -- Line: 107 -- upvalues: ReactCurrentOwner (val), ClassComponent (val), console (val), getComponentName (val), get (val), getNearestMountedFiber (val)
    if _G.__DEV__ then
        local current = ReactCurrentOwner.current
        if current ~= nil and current.tag == ClassComponent then
            local stateNode = current.stateNode
            if not stateNode._warnedAboutRefsInRender then
                console.error("%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.", getComponentName(current.type) or "A component")
            end
            stateNode._warnedAboutRefsInRender = true
        end
    end
    local v1 = get(p1)
    if not v1 then
        return false
    end
    local v2 = getNearestMountedFiber(v1) == v1
    return v2
end
local function assertIsMounted(p1) -- Line: 137 -- upvalues: invariant (val), getNearestMountedFiber (val)
    local v1 = getNearestMountedFiber(p1) == p1
    invariant(v1, "Unable to find node on an unmounted component.")
end
local function findCurrentFiberUsingSlowPath(p1) -- Line: 144 -- upvalues: getNearestMountedFiber (val), invariant (val), HostRoot (val)
    local alternate_2, child, child_2, child_3, return_, return__2, v1, v2, v3, v4
    local alternate = p1.alternate
    if not alternate then
        v1 = getNearestMountedFiber(p1)
        local v5 = v1 ~= nil
        invariant(v5, "Unable to find node on an unmounted component.")
        if v1 ~= p1 then
            return nil
        end
        return p1
    end
    v1 = p1
    local v6 = alternate
    local v7 = p1
    while true do
        return_ = v1.return_
        if return_ == nil then
            break
        end
        alternate_2 = return_.alternate
        if alternate_2 ~= nil then
            if return_.child == alternate_2.child then
                child = return_.child
                while child do
                    if child == v1 then
                        v4 = getNearestMountedFiber(return_) == return_
                        invariant(v4, "Unable to find node on an unmounted component.")
                        return v7
                    end
                    if child == v6 then
                        v4 = getNearestMountedFiber(return_) == return_
                        invariant(v4, "Unable to find node on an unmounted component.")
                        return alternate
                    end
                    child = child.sibling
                end
                invariant(false, "Unable to find node on an unmounted component.")
            end
            if v1.return_ == v6.return_ then
                v2 = false
                child_2 = return_.child
                while child_2 do
                    if child_2 == v1 then
                        v2 = true
                        v1 = return_
                        v6 = alternate_2
                        break
                    end
                    if child_2 == v6 then
                        v2 = true
                        v6 = return_
                        v1 = alternate_2
                        break
                    end
                    child_2 = child_2.sibling
                end
                if not v2 then
                    child_3 = alternate_2.child
                    while child_3 do
                        if child_3 == v1 then
                            v2 = true
                            v1 = alternate_2
                            v6 = return_
                            break
                        end
                        if child_3 == v6 then
                            v2 = true
                            v6 = alternate_2
                            v1 = return_
                            break
                        end
                        child_3 = child_3.sibling
                    end
                    invariant(v2, "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.")
                end
            else
                v1 = return_
                v6 = alternate_2
            end
            v3 = v1.alternate == v6
            invariant(v3, "Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue.")
        else
            return__2 = return_.return_
            if return__2 == nil then
                break
            end
            v1 = return__2
            v6 = return__2
        end
    end
    local v8 = v1.tag == HostRoot
    invariant(v8, "Unable to find node on an unmounted component.")
    if v1.stateNode.current == v1 then
        return v7
    end
    return alternate
end
v1.findCurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath
function v1.findCurrentHostFiber(p1) -- Line: 279 -- upvalues: findCurrentFiberUsingSlowPath (val), HostComponent (val), HostText (val)
    local child, return_, sibling
    local v1 = findCurrentFiberUsingSlowPath(p1)
    if not v1 then
        return nil
    end
    local v2 = v1
    while true do
        child = v2.child
        if v2.tag == HostComponent or v2.tag == HostText then
            break
        end
        if not child then
            if v2 == v1 then
                return nil
            end
            return_ = v2.return_
            sibling = v2.sibling
            while not sibling do
                if return_ and return_ ~= v1 then
                    continue
                end
                return nil
            end
            sibling.return_ = return_
            v2 = sibling
        else
            child.return_ = v2
            v2 = child
        end
    end
    return v2
end
function v1.findCurrentHostFiberWithNoPortals(p1) -- Line: 318 -- upvalues: findCurrentFiberUsingSlowPath (val), HostComponent (val), HostText (val), enableFundamentalAPI (val), FundamentalComponent (val), HostPortal (val)
    local child, return_, sibling
    local v1 = findCurrentFiberUsingSlowPath(p1)
    if not v1 then
        return nil
    end
    local v2 = v1
    while true do
        child = v2.child
        if v2.tag == HostComponent or v2.tag == HostText then
            break
        end
        if enableFundamentalAPI and v2.tag == FundamentalComponent then
            break
        end
        if child and v2.tag ~= HostPortal then
            child.return_ = v2
            v2 = child
            continue
        end
        if v2 == v1 then
            return nil
        end
        return_ = v2.return_
        sibling = v2.sibling
        while not sibling do
            if return_ and return_ ~= v1 then
                continue
            end
            return nil
        end
        sibling.return_ = return_
        v2 = sibling
    end
    return v2
end
function v1.isFiberSuspenseAndTimedOut(p1) -- Line: 360 -- upvalues: SuspenseComponent (val)
    local memoizedState = p1.memoizedState
    local v1 = if p1.tag == SuspenseComponent then if memoizedState ~= nil then memoizedState.dehydrated == nil else false else false
    return v1
end
function v1.doesFiberContain(p1, p2) -- Line: 367
    local return_ = p2
    while return_ ~= nil do
        if return_ ~= p1 and return_ ~= p1.alternate then
            return_ = return_.return_
            continue
        end
        return true
    end
    return false
end
return v1