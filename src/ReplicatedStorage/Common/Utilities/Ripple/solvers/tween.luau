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
--             File: ReplicatedStorage.Common.Utilities.Ripple.solvers.tween
--                              Dumped in 0.000456 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local TweenService = game:GetService("TweenService")
require(v1.Parent.Parent.types)
local config = require(v1.Parent.Parent.config)
local intermediate = require(v1.Parent.Parent.utils.intermediate)
local merge = require(v1.Parent.Parent.utils.merge)
local function createTween(p1, p2, p3) -- Line: 21 -- upvalues: TweenService (val)
    local v1 = TweenInfo.new(p3.time, p3.style, p3.direction, p3.repeatCount, p3.reverses, p3.delayTime)
    local NumberValue = Instance.new("NumberValue")
    local v2 = TweenService:Create(NumberValue, v1, {Value = p2})
    NumberValue.Value = p1
    return {complete = false, value = NumberValue, tween = v2}
end
return function(p1, p2) -- Line: 43 -- upvalues: merge (val), config (val), intermediate (val), createTween (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    local u11 = merge(config.tween.default, v1)
    local u16 = intermediate.to(p1)
    local u17 = {}
    return function(p1, p2) -- Line: 48 -- upvalues: intermediate (upval), u16 (val), createTween (upval), u11 (val), u17 (val)
        local v1 = intermediate.index(u16, p1)
        if not v1 then
            return false
        end
        if not p2.destructor then
            local u13 = createTween(p2.value, v1, u11)
            u17[p1] = u13
            u13.tween.Completed:Connect(function() -- Line: 60 -- upvalues: u13 (val)
                u13.complete = true
                u13.value:Destroy()
                u13.tween:Destroy()
            end)
            u13.tween:Play()
            function p2.destructor() -- Line: 68 -- upvalues: u13 (val), u17 (upval), p1 (val)
                u13.tween:Destroy()
                u13.value:Destroy()
                u17[p1] = nil
            end
        end
        local v2 = u17[p1]
        if not v2 then
            p2.complete = true
            return
        end
        if not v2.complete then
            p2.value = v2.value.Value
            return
        end
        p2.complete = true
        p2.value = v1
    end
end