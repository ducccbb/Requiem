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
--           File: ReplicatedStorage.Client.Interfaces.Hooks.useEventListener
--                              Dumped in 0.000483 seconds
--                          Bytecode version 9  |  7 functions

local connect, disconnect
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local useLatest = require(script.Parent:WaitForChild("useLatest"))
function connect(p1, p2) -- Line: 29
    if typeof(p1) == "RBXScriptSignal" or p1.Connect ~= nil then
        return p1:Connect(p2)
    end
    if p1.connect ~= nil then
        return p1:connect(p2)
    end
    if p1.subscribe ~= nil then
        return p1:subscribe(p2)
    end
    error("Event-like object does not have a supported connect method.")
end
function disconnect(p1) -- Line: 52
    if type(p1) == "function" then
        p1()
        return
    end
    if typeof(p1) == "RBXScriptConnection" or p1.Disconnect ~= nil then
        p1:Disconnect()
        return
    end
    if p1.disconnect ~= nil then
        p1:disconnect()
    end
end
return function(p1, p2, p3) -- Line: 75 -- upvalues: useLatest (val), react (val), connect (val), disconnect (val)
    local v1 = p3
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    local u8 = v2.once or false
    local connected = v2.connected
    if connected == nil then
        connected = true
    end
    local u15 = useLatest(p2)
    local u20 = useLatest(p1)
    react.useEffect(function() -- Line: 95 -- upvalues: u20 (val), connected (ref), connect (upval), u8 (val), disconnect (upval), u15 (val)
        local current = u20.current
        if not current or not connected then
            return
        end
        local u3 = true
        local u4 = nil
        u4 = connect(current, function(...) -- Line: 104 -- upvalues: u8 (upval), disconnect (upval), u4 (ref), u3 (ref), u15 (upval)
            if u8 then
                disconnect(u4)
                u3 = false
            end
            u15.current(...)
        end)
        return function() -- Line: 113 -- upvalues: u3 (ref), disconnect (upval), u4 (ref)
            if u3 then
                disconnect(u4)
            end
        end
    end, {p1, connected})
end