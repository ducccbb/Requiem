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
--          File: ReplicatedStorage.Client.Interfaces.Hooks.useThrottleCallback
--                              Dumped in 0.000329 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local useMemo = require(Packages:WaitForChild("react")).useMemo
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Timeout = Utilities:WaitForChild("Timeout")
local throttle = require(Timeout:WaitForChild("throttle"))
local useLatest = require(v1.Parent:WaitForChild("useLatest"))
local useUnmountEffect = require(v1.Parent:WaitForChild("useUnmountEffect"))
return function(p1, p2, p3) -- Line: 35 -- upvalues: useLatest (val), useMemo (val), throttle (val), useUnmountEffect (val)
    local u3
    if p2 ~= nil then
        u3 = p2
    else
        u3 = {}
    end
    local u7 = useLatest(p1)
    local u13 = useMemo(function() -- Line: 40 -- upvalues: throttle (upval), u7 (val), u3 (ref)
        return throttle(function(...) -- Line: 41 -- upvalues: u7 (upval)
            return u7.current(unpack({...}))
        end, u3.wait, u3)
    end, p3)
    useUnmountEffect(function() -- Line: 46 -- upvalues: u13 (val)
        u13.cancel()
    end)
    return {run = u13, cancel = u13.cancel, flush = u13.flush, pending = u13.pending}
end