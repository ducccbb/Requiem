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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.SingleEventManager
--                              Dumped in 0.000613 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Logging = require(script.Parent.Logging)
local v2 = {Disabled = "Disabled", Suspended = "Suspended", Enabled = "Enabled"}
local u17 = {}
u17.__index = u17
function u17.new(p1) -- Line: 30 -- upvalues: u17 (val)
    local v1 = {
        _status = "Disabled",
        _isResuming = false,
        _suspendedEventQueue = {},
        _connections = {},
        _listeners = {},
        _instance = p1,
    }
    return (setmetatable(v1, u17))
end
function u17.connectEvent(p1, p2, p3) -- Line: 58
    p1:_connect(p2, p1._instance[p2], p3)
end
function u17.connectPropertyChange(p1, p2, p3) -- Line: 62
    local v1, v2
    v1, v2 = pcall(function() -- Line: 63 -- upvalues: p1 (val), p2 (val)
        return p1._instance:GetPropertyChangedSignal(p2)
    end)
    if not v1 then
        local v3 = tostring(p2)
        local v4 = ("Cannot get changed signal on property %q: %s"):format(v3, v2)
        error(v4, 0)
    end
    p1:_connect("Change." .. p2, v2, p3)
end
function u17:_connect(p2, p3, p4) -- Line: 77
    local _connections
    if p4 == nil then
        if self._connections[p2] ~= nil then
            self._connections[p2]:Disconnect()
            self._connections[p2] = nil
        end
        self._listeners[p2] = nil
        return
    end
    if self._connections[p2] == nil then
        _connections = self._connections
        _connections[p2] = p3:Connect(function(...) -- Line: 88 -- upvalues: self (val), p2 (val)
            if self._status == "Enabled" then
                self._listeners[p2](self._instance, ...)
                return
            end
            if self._status == "Suspended" then
                local v1 = select("#", ...)
                table.insert(self._suspendedEventQueue, {p2, v1, ...})
            end
        end)
    end
    self._listeners[p2] = p4
end
function u17.suspend(p1) -- Line: 105
    p1._status = "Suspended"
end
function u17.resume(p1) -- Line: 109 -- upvalues: Logging (val)
    local v1, v2, v3, v4, v5
    if p1._isResuming then
        return
    end
    p1._isResuming = true
    local v6 = 1
    local v7 = p1
    while v6 <= #v7._suspendedEventQueue do
        v1 = v7._suspendedEventQueue[v6]
        v2 = v7._listeners[v1[1]]
        if v2 ~= nil then
            v3 = coroutine.create(v2)
            v4, v5 = coroutine.resume(v3, v7._instance, unpack(v1, 3, 2 + v1[2]))
            if not v4 then
                Logging.warn("%s", v5)
            end
        end
        v6 = v6 + 1
    end
    v7._isResuming = false
    v7._status = "Enabled"
    v7._suspendedEventQueue = {}
end
return u17