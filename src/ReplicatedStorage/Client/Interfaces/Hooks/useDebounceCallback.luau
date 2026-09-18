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
--          File: ReplicatedStorage.Client.Interfaces.Hooks.useDebounceCallback
--                              Dumped in 0.000390 seconds
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
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Timeout = Utilities:WaitForChild("Timeout")
local debounce = require(Timeout:WaitForChild("debounce"))
local useLatest = require(v1.Parent:WaitForChild("useLatest"))
local useUnmountEffect = require(v1.Parent:WaitForChild("useUnmountEffect"))
return function(p1, p2) -- Line: 62 -- upvalues: useLatest (val), react (val), debounce (val), useUnmountEffect (val)
    local u2
    if p2 ~= nil then
        u2 = p2
    else
        u2 = {}
    end
    local u6 = useLatest(p1)
    local u12 = react.useMemo(function() -- Line: 69 -- upvalues: debounce (upval), u6 (val), u2 (ref)
        local wait
        local function v1(...) -- Line: 70 -- upvalues: u6 (upval)
            if u6.current == nil then
                return
            end
            return u6.current(...)
        end
        if not u2 then
            wait = nil
        else
            wait = u2.wait
            if not wait then
                wait = nil
            end
        end
        return debounce(v1, wait, u2)
    end, {})
    useUnmountEffect(function() -- Line: 79 -- upvalues: u12 (val)
        u12.cancel()
    end)
    return {run = u12, cancel = u12.cancel, flush = u12.flush, pending = u12.pending}
end