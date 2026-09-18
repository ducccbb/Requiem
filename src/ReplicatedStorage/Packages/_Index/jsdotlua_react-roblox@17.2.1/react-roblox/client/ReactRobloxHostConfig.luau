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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxHostConfig
--                               Dumped in 0.00132 seconds
--                          Bytecode version 9  |  33 functions

local function unimplemented(p1) -- Line: 13
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(p1))
    error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
local CollectionService = game:GetService("CollectionService")
local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local inspect = v1.util.inspect
local console = require(script.Parent.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local ReactRobloxComponentTree = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local precacheFiberNode = ReactRobloxComponentTree.precacheFiberNode
local uncacheFiberNode = ReactRobloxComponentTree.uncacheFiberNode
local updateFiberProps = ReactRobloxComponentTree.updateFiberProps
local ReactRobloxComponent = require(script.Parent:WaitForChild("ReactRobloxComponent"))
local setInitialProperties = ReactRobloxComponent.setInitialProperties
local diffProperties = ReactRobloxComponent.diffProperties
local updateProperties = ReactRobloxComponent.updateProperties
local cleanupHostComponent = ReactRobloxComponent.cleanupHostComponent
local enableCreateEventHandleAPI = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableCreateEventHandleAPI
local function recursivelyUncacheFiberNode(p1) -- Line: 204 -- upvalues: uncacheFiberNode (val)
    if typeof(p1) ~= "Instance" then
        return
    end
    uncacheFiberNode(p1)
    for i, j in p1:GetDescendants() do
        uncacheFiberNode(j)
    end
end
local u76 = {}
v1.Object.assign(u76, require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFiberHostConfig.WithNoPersistence)
function u76.getRootHostContext(p1) -- Line: 225
    return p1.ClassName
end
function u76.getChildHostContext(p1, p2, p3) -- Line: 263
    return p1
end
function u76.getPublicInstance(p1) -- Line: 284
    return p1
end
function u76.prepareForCommit(p1) -- Line: 288 -- upvalues: enableCreateEventHandleAPI (val)
    if enableCreateEventHandleAPI then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
    return nil
end
function u76.beforeActiveInstanceBlur() -- Line: 303 -- upvalues: enableCreateEventHandleAPI (val)
    if enableCreateEventHandleAPI then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
end
function u76.afterActiveInstanceBlur() -- Line: 312 -- upvalues: enableCreateEventHandleAPI (val)
    if enableCreateEventHandleAPI then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
end
function u76.resetAfterCommit(p1) end
function u76.createInstance(p1, p2, p3, p4, p5) -- Line: 329 -- upvalues: precacheFiberNode (val), updateFiberProps (val)
    local v1 = Instance.new(p1)
    if not p5.key then
        local return_ = p5.return_
        while return_ do
            if return_.key then
                v1.Name = return_.key
                break
            end
            return_ = return_.return_
        end
    else
        v1.Name = p5.key
    end
    precacheFiberNode(p5, v1)
    updateFiberProps(v1, p2)
    return v1
end
function u76.appendInitialChild(p1, p2) -- Line: 396
    p2.Parent = p1
end
function u76.finalizeInitialChildren(p1, p2, p3, p4, p5) -- Line: 401 -- upvalues: setInitialProperties (val)
    setInitialProperties(p1, p2, p3, p4)
    return false
end
function u76.prepareUpdate(p1, p2, p3, p4, p5, p6) -- Line: 413 -- upvalues: diffProperties (val)
    return diffProperties(p1, p2, p3, p4, p5)
end
function u76.shouldSetTextContent(p1, p2) -- Line: 440
    return false
end
function u76.createTextInstance(p1, p2, p3, p4) -- Line: 456
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"))
    error("FIXME (roblox): createTextInstance is unimplemented", 2)
    return nil
end
u76.isPrimaryRenderer = true
u76.warnsIfNotActing = true
u76.scheduleTimeout = v1.setTimeout
u76.cancelTimeout = v1.clearTimeout
u76.noTimeout = -1
u76.supportsMutation = true
function u76.commitMount(p1, p2, p3, p4) -- Line: 482
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"))
    error("FIXME (roblox): commitMount is unimplemented", 2)
end
function u76.commitUpdate(p1, p2, p3, p4, p5, p6) -- Line: 504 -- upvalues: updateFiberProps (val), updateProperties (val)
    updateFiberProps(p1, p5)
    updateProperties(p1, p2, p4)
end
local function checkTags(p1) -- Line: 533 -- upvalues: console (val), inspect (val), CollectionService (val)
    if typeof(p1) ~= "Instance" then
        console.warn("Could not check tags on non-instance %s.", inspect(p1))
        return
    end
    if not (p1:IsDescendantOf(game)) then
        local v1 = #CollectionService:GetTags(p1)
        if 0 < v1 then
            console.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.", p1.ClassName, p1.Name)
        end
    end
end
function u76.appendChild(p1, p2) -- Line: 552 -- upvalues: checkTags (val)
    p2.Parent = p1
    if _G.__DEV__ then
        checkTags(p2)
    end
end
function u76.appendChildToContainer(p1, p2) -- Line: 561 -- upvalues: u76 (val)
    u76.appendChild(p1, p2)
end
function u76.insertBefore(p1, p2, p3) -- Line: 591 -- upvalues: checkTags (val)
    p2.Parent = p1
    if _G.__DEV__ then
        checkTags(p2)
    end
end
function u76.insertInContainerBefore(p1, p2, p3) -- Line: 601 -- upvalues: u76 (val)
    u76.insertBefore(p1, p2, p3)
end
function u76.removeChild(p1, p2) -- Line: 639 -- upvalues: uncacheFiberNode (val), cleanupHostComponent (val)
    if typeof(p2) == "Instance" then
        uncacheFiberNode(p2)
        for i, j in p2:GetDescendants() do
            uncacheFiberNode(j)
        end
    end
    cleanupHostComponent(p2)
    p2.Parent = nil
    p2:Destroy()
end
function u76.removeChildFromContainer(p1, p2) -- Line: 651 -- upvalues: u76 (val)
    u76.removeChild(p1, p2)
end
function u76.clearSuspenseBoundary(p1, p2) -- Line: 663
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"))
    error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2)
end
function u76.clearSuspenseBoundaryFromContainer(p1, p2) -- Line: 701
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"))
    error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2)
end
function u76.hideInstance(p1) -- Line: 715
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"))
    error("FIXME (roblox): hideInstance is unimplemented", 2)
end
function u76.hideTextInstance(p1) -- Line: 729
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"))
    error("FIXME (roblox): hideTextInstance is unimplemented", 2)
end
function u76.unhideInstance(p1, p2) -- Line: 734
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"))
    error("FIXME (roblox): unhideInstance is unimplemented", 2)
end
function u76.unhideTextInstance(p1, p2) -- Line: 748
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"))
    error("FIXME (roblox): unhideTextInstance is unimplemented", 2)
end
function u76.clearContainer(p1) -- Line: 753 -- upvalues: u76 (val)
    for i, j in p1:GetChildren() do
        u76.removeChild(p1, j)
    end
end
function u76.preparePortalMount(p1) end
return u76