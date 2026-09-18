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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactMutableSource.new
--                              Dumped in 0.000512 seconds
--                          Bytecode version 9  |  7 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = {}
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local isPrimaryRenderer = require(script.Parent:WaitForChild("ReactFiberHostConfig")).isPrimaryRenderer
local u37 = {}
local u41 = if _G.__DEV__ then {} else nil
function v1.markSourceAsDirty(p1) -- Line: 37 -- upvalues: u37 (val)
    table.insert(u37, p1)
end
function v1.resetWorkInProgressVersions() -- Line: 41 -- upvalues: u37 (val), isPrimaryRenderer (val)
    local v1 = u37
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if not isPrimaryRenderer then
            j._workInProgressVersionSecondary = nil
        else
            j._workInProgressVersionPrimary = nil
        end
    end
    table.clear(u37)
end
function v1.getWorkInProgressVersion(p1) -- Line: 53 -- upvalues: isPrimaryRenderer (val)
    if isPrimaryRenderer then
        return p1._workInProgressVersionPrimary
    end
    return p1._workInProgressVersionSecondary
end
function v1.setWorkInProgressVersion(p1, p2) -- Line: 62 -- upvalues: isPrimaryRenderer (val), u37 (val)
    if not isPrimaryRenderer then
        p1._workInProgressVersionSecondary = p2
    else
        p1._workInProgressVersionPrimary = p2
    end
    table.insert(u37, p1)
end
function v1.warnAboutMultipleRenderersDEV(p1) -- Line: 71 -- upvalues: isPrimaryRenderer (val), u41 (ref), console (val)
    if not _G.__DEV__ then
        return
    end
    if not isPrimaryRenderer then
        if p1._currentSecondaryRenderer == nil then
            p1._currentSecondaryRenderer = u41
            return
        end
        if p1._currentSecondaryRenderer ~= u41 then
            console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
        end
        return
    end
    if p1._currentPrimaryRenderer == nil then
        p1._currentPrimaryRenderer = u41
        return
    end
    if p1._currentPrimaryRenderer == u41 then
        return
    end
    console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
end
function v1.registerMutableSourceForHydration(p1, p2) -- Line: 100
    local v1 = p2._getVersion(p2._source)
    if p1.mutableSourceEagerHydrationData == nil then
        p1.mutableSourceEagerHydrationData = {p2, v1}
    end
end
return v1