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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxComponentTree
--                              Dumped in 0.000568 seconds
--                          Bytecode version 9  |  11 functions

require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
local shared = require(script.Parent.Parent.Parent:WaitForChild("shared"))
local u28 = nil
local u29 = nil
local u30 = nil
local u31 = nil
local u32 = nil
local u33 = nil
local invariant = shared.invariant
local v1 = {}
local u36 = {}
local u37 = {}
local u38 = {}
local v2 = tostring(math.random())
local v3 = string.sub(v2, 3)
local u48 = "__reactFiber$" .. v3
local u51 = "__reactContainer$" .. v3
function v1.precacheFiberNode(p1, p2) -- Line: 65 -- upvalues: u37 (val)
    u37[p2] = p1
end
function v1.uncacheFiberNode(p1) -- Line: 70 -- upvalues: u37 (val), u38 (val)
    u37[p1] = nil
    u38[p1] = nil
end
function v1.markContainerAsRoot(p1, p2) -- Line: 75 -- upvalues: u36 (val)
    u36[p2] = p1
end
function v1.unmarkContainerAsRoot(p1) -- Line: 81 -- upvalues: u36 (val)
    u36[p1] = nil
end
function v1.isContainerMarkedAsRoot(p1) -- Line: 87 -- upvalues: u36 (val)
    return not not u36[p1]
end
function v1.getClosestInstanceFromNode(p1) -- Line: 101 -- upvalues: u37 (val), u33 (ref)
    local alternate, v1, v2
    local v3 = u37[p1]
    if v3 then
        return v3
    end
    local Parent = p1.Parent
    local v4 = p1
    while Parent do
        v3 = u37[Parent]
        if not v3 then
            Parent = Parent.Parent
        else
            alternate = v3.alternate
            if v3.child == nil then
                if alternate ~= nil and alternate.child ~= nil then
                    if u33 == nil then
                        u33 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
                    end
                    v1 = u33(v4)
                    while v1 ~= nil do
                        v2 = u37[v1]
                        if v2 then
                            return v2
                        end
                        v1 = u33(v1)
                    end
                end
                return v3
            end
        end
    end
    return nil
end
function v1.getInstanceFromNode(p1) -- Line: 185 -- upvalues: u28 (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u48 (val), u51 (val)
    if u28 == nil then
        u28 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox")).ReactWorkTags
        u29 = u28.HostComponent
        u30 = u28.HostComponent
        u31 = u28.HostComponent
        u32 = u28.HostComponent
    end
    local v1 = p1[u48]
    if not v1 then
        v1 = p1[u51]
    end
    if not v1 then
        return nil
    end
    if v1.tag == u29 or v1.tag == u30 or v1.tag == u32 or v1.tag == u31 then
        return v1
    end
    return nil
end
function v1.getNodeFromInstance(p1) -- Line: 218 -- upvalues: u29 (ref), u30 (ref), invariant (val)
    if p1.tag == u29 or p1.tag == u30 then
        return p1.stateNode
    end
    invariant(false, "getNodeFromInstance: Invalid argument.")
    error("getNodeFromInstance: Invalid argument.")
end
function v1.getFiberCurrentPropsFromNode(p1) -- Line: 233 -- upvalues: u38 (val)
    return u38[p1]
end
function v1.updateFiberProps(p1, p2) -- Line: 237 -- upvalues: u38 (val)
    u38[p1] = p2
end
return v1