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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactNoopUpdateQueue
--                              Dumped in 0.000340 seconds
--                          Bytecode version 9  |  6 functions

local v1
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local u10 = {}
local function warnNoop(p1, p2) -- Line: 14 -- upvalues: u10 (val), console (val)
    if not _G.__DEV__ then
        return
    end
    local v1 = p1.__componentName or "ReactClass"
    local v2 = v1 .. "." .. p2
    if u10[v2] then
        return
    end
    console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", p2, v1)
    u10[v2] = true
end
v1 = {
    isMounted = function(p1) -- Line: 49
        return false
    end,
}
function v1.enqueueForceUpdate(p1, p2, p3) -- Line: 67 -- upvalues: u10 (val), console (val)
    if not _G.__DEV__ then
        return
    end
    local v1 = p1.__componentName or "ReactClass"
    local v2 = v1 .. "." .. "forceUpdate"
    if u10[v2] then
        return
    end
    console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "forceUpdate", v1)
    u10[v2] = true
end
function v1.enqueueReplaceState(p1, p2, p3, p4) -- Line: 83 -- upvalues: u10 (val), console (val)
    if not _G.__DEV__ then
        return
    end
    local v1 = p1.__componentName or "ReactClass"
    local v2 = v1 .. "." .. "replaceState"
    if u10[v2] then
        return
    end
    console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "replaceState", v1)
    u10[v2] = true
end
function v1.enqueueSetState(p1, p2, p3, p4) -- Line: 98 -- upvalues: u10 (val), console (val)
    if not _G.__DEV__ then
        return
    end
    local v1 = p1.__componentName or "ReactClass"
    local v2 = v1 .. "." .. "setState"
    if u10[v2] then
        return
    end
    console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "setState", v1)
    u10[v2] = true
end
return v1