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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris
--                              Dumped in 0.000997 seconds
--                          Bytecode version 9  |  19 functions

require(script.Types)
local u4 = {}
local Internal = require(script.Internal)
local u10 = Internal(u4)
u4.Disabled = false
u4.Args = {}
local v1 = {}
u4.Events = v1
function u4.HasInit() -- Line: 12 -- upvalues: u10 (val)
    return u10._started
end
function u4.Init(p1, p2) -- Line: 16 -- upvalues: u10 (val), u4 (val)
    local Heartbeat, v1
    if p1 ~= nil then
        v1 = p1
    else
        v1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end
    if p2 ~= nil then
        Heartbeat = p2
    else
        Heartbeat = game:GetService("RunService").Heartbeat
    end
    u10.parentInstance = v1
    local v2 = u10._started == false
    assert(v2, "Iris.Init can only be called once.")
    u10._started = true
    u10._generateRootInstance()
    u10._generateSelectionImageObject()
    task.spawn(function() -- Line: 33 -- upvalues: Heartbeat (ref), u10 (upval)
        if typeof(Heartbeat) == "function" then
            while true do
                Heartbeat()
                u10._cycle()
            end
        end
        if Heartbeat ~= nil then
            Heartbeat:Connect(function() -- Line: 40 -- upvalues: u10 (upval)
                u10._cycle()
            end)
        end
    end)
    return u4
end
function u4.Connect(p1, p2) -- Line: 49 -- upvalues: u10 (val)
    if u10._started == false then
        warn("Iris:Connect() was called before calling Iris.Init(), the connected function will never run")
    end
    table.insert(u10._connectedFunctions, p2)
end
function u4.Append(p1) -- Line: 56 -- upvalues: u10 (val)
    local Parent
    local v1 = u10._GetParentWidget()
    if not u10._config.Parent then
        Parent = u10._widgets[v1.type].ChildAdded(v1, {type = "userInstance"})
    else
        Parent = u10._config.Parent
    end
    p1.Parent = Parent
end
function u4.End() -- Line: 67 -- upvalues: u10 (val)
    if u10._stackIndex == 1 then
        error("Callback has too many calls to Iris.End()", 2)
    end
    u10._IDStack[u10._stackIndex] = nil
    local v1 = u10
    v1._stackIndex = v1._stackIndex - 1
end
function u4.ForceRefresh() -- Line: 81 -- upvalues: u10 (val)
    u10._globalRefreshRequested = true
end
function u4.UpdateGlobalConfig(p1) -- Line: 85 -- upvalues: u10 (val), u4 (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        u10._rootConfig[i] = j
    end
    u4.ForceRefresh()
end
function u4.PushConfig(p1) -- Line: 92 -- upvalues: u4 (val), u10 (val)
    local v1 = u4.State(-1)
    if v1.value ~= -1 then
        local v2 = v1:get()
        if u10._deepCompare(v2, p1) == false then
            u10._localRefreshActive = true
            v1:set(p1)
        end
    else
        v1:set(p1)
    end
    u10._config = setmetatable(p1, {__index = u10._config})
end
function u4.PopConfig() -- Line: 110 -- upvalues: u10 (val)
    u10._localRefreshActive = false
    u10._config = getmetatable(u10._config).__index
end
u4.TemplateConfig = require(script.config)
u4.UpdateGlobalConfig(u4.TemplateConfig.colorDark)
u4.UpdateGlobalConfig(u4.TemplateConfig.sizeDefault)
u4.UpdateGlobalConfig(u4.TemplateConfig.utilityDefault)
u10._globalRefreshRequested = false
function u4.PushId(p1) -- Line: 127 -- upvalues: u10 (val)
    local v1 = typeof(p1) == "string"
    assert(v1, "Iris expected Iris.PushId id to PushId to be a string.")
    u10._pushedId = tostring(p1)
end
function u4.PopId() -- Line: 133 -- upvalues: u10 (val)
    u10._pushedId = nil
end
function u4.SetNextWidgetID(p1) -- Line: 137 -- upvalues: u10 (val)
    u10._nextWidgetId = p1
end
function u4.State(p1) -- Line: 147 -- upvalues: u10 (val)
    local v1 = u10._getID(2)
    if u10._states[v1] then
        return u10._states[v1]
    end
    u10._states[v1] = {value = p1, ConnectedWidgets = {}, ConnectedFunctions = {}}
    setmetatable(u10._states[v1], u10.StateClass)
    return u10._states[v1]
end
function u4.WeakState(p1) -- Line: 161 -- upvalues: u10 (val)
    local v1 = u10._getID(2)
    if not (u10._states[v1]) then
        u10._states[v1] = {value = p1, ConnectedWidgets = {}, ConnectedFunctions = {}}
        setmetatable(u10._states[v1], u10.StateClass)
        return u10._states[v1]
    end
    if #u10._states[v1].ConnectedWidgets ~= 0 then
        return u10._states[v1]
    end
    u10._states[v1] = nil
    u10._states[v1] = {value = p1, ConnectedWidgets = {}, ConnectedFunctions = {}}
    setmetatable(u10._states[v1], u10.StateClass)
    return u10._states[v1]
end
function u4.ComputedState(p1, p2) -- Line: 179 -- upvalues: u10 (val)
    local u5 = u10._getID(2)
    if u10._states[u5] then
        return u10._states[u5]
    end
    u10._states[u5] = {value = p2(p1.value), ConnectedWidgets = {}, ConnectedFunctions = {}}
    p1:onChange(function(p1) -- Line: 190 -- upvalues: u10 (upval), u5 (val), p2 (val)
        u10._states[u5]:set(p2(p1))
    end)
    setmetatable(u10._states[u5], u10.StateClass)
    return u10._states[u5]
end
local demoWindow = require(script.demoWindow)
u4.ShowDemoWindow = demoWindow(u4)
local widgets = require(script.widgets)
widgets(u10)
local API = require(script.API)
API(u4)
return u4