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
--               File: ReplicatedStorage.Client.Interfaces.Hooks.useMotion
--                              Dumped in 0.000458 seconds
--                          Bytecode version 9  |  9 functions

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
local Ripple = require(Utilities:WaitForChild("Ripple"))
local MotionScheduler = require(v1.Parent:WaitForChild("MotionScheduler"))
local useLatestCallback = require(v1.Parent:WaitForChild("useLatestCallback"))
return function(p1) -- Line: 20 -- upvalues: react (val), Ripple (val), useLatestCallback (val), MotionScheduler (val)
    local u13, u14
    local u5 = react.useMemo(function() -- Line: 21 -- upvalues: Ripple (upval), p1 (val)
        return Ripple.createMotion(p1)
    end, {})
    local v1 = useLatestCallback(function() -- Line: 25 -- upvalues: u5 (val)
        return u5:get()
    end)
    u13, u14 = react.useBinding(v1())
    local u18 = react.useRef(nil)
    react.useEffect(function() -- Line: 32 -- upvalues: u5 (val), u18 (val), MotionScheduler (upval), u13 (val), u14 (val)
        local u5
        u5 = u5.onTargetChanged:Connect(function() -- Line: 33 -- upvalues: u18 (upval), MotionScheduler (upval), u5 (upval), u13 (upval), u14 (upval)
            if u18.current then
                return
            end
            u18.current = MotionScheduler.register(u5, function(p1) -- Line: 38 -- upvalues: u13 (upval), u14 (upval)
                if u13:getValue() ~= p1 then
                    u14(p1)
                end
            end, function() -- Line: 42 -- upvalues: u18 (upval)
                u18.current = nil
            end)
        end)
        return function() -- Line: 47 -- upvalues: u5 (val), u18 (upval), u5 (upval)
            u5:Disconnect()
            if u18.current then
                u18.current()
                u18.current = nil
            end
            u5:destroy()
        end
    end, {u5})
    return u13, u5
end