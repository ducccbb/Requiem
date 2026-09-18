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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.SingleEventManager
--                              Dumped in 0.000554 seconds
--                          Bytecode version 9  |  8 functions

local console = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).console
local v1 = {Disabled = "Disabled", Suspended = "Suspended", Enabled = "Enabled"}
local u13 = {}
u13.__index = u13
function u13.new(p1) -- Line: 47 -- upvalues: u13 (val)
    local v1 = {
        _status = "Disabled",
        _isResuming = false,
        _suspendedEventQueue = {},
        _connections = {},
        _listeners = {},
        _instance = p1,
    }
    return (setmetatable(v1, u13))
end
function u13.connectEvent(p1, p2, p3) -- Line: 75
    p1:_connect(p2, p1._instance[p2], p3)
end
function u13.connectPropertyChange(p1, p2, p3) -- Line: 79
    local v1, v2
    v1, v2 = pcall(p1._instance.GetPropertyChangedSignal, p1._instance, p2)
    if not v1 then
        local v3 = tostring(p2)
        local v4 = string.format("Cannot get changed signal on property %q: %s", v3, v2)
        error(v4, 0)
    end
    p1:_connect("Change." .. p2, v2, p3)
end
function u13:_connect(p2, p3, p4) -- Line: 97
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
        _connections[p2] = p3:Connect(function(...) -- Line: 108 -- upvalues: self (val), p2 (val)
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
function u13.suspend(p1) -- Line: 128
    p1._status = "Suspended"
end
function u13.resume(p1) -- Line: 132 -- upvalues: console (val)
    local v1, v2, v3, v4
    if p1._isResuming then
        return
    end
    p1._isResuming = true
    local _suspendedEventQueue = p1._suspendedEventQueue
    local v5 = nil
    local v6 = nil
    for i, j in _suspendedEventQueue, v5, v6 do
        v2 = p1._listeners[j[1]]
        if v2 ~= nil then
            v3 = coroutine.create(v2)
            v4, v1 = coroutine.resume(v3, p1._instance, unpack(j, 3, 2 + j[2]))
            if not v4 then
                console.warn("%s", v1)
            end
        end
    end
    p1._isResuming = false
    p1._status = "Enabled"
    table.clear(p1._suspendedEventQueue)
end
return u13