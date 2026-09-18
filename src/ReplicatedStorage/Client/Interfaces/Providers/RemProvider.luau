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
--            File: ReplicatedStorage.Client.Interfaces.Providers.RemProvider
--                              Dumped in 0.000424 seconds
--                          Bytecode version 9  |  4 functions

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
local Hooks = v1.Parent.Parent:WaitForChild("Hooks")
local useCamera = require(Hooks:WaitForChild("useCamera"))
local Hooks_2 = v1.Parent.Parent:WaitForChild("Hooks")
local useDebounceState = require(Hooks_2:WaitForChild("useDebounceState"))
local Hooks_3 = v1.Parent.Parent:WaitForChild("Hooks")
local useEventListener = require(Hooks_3:WaitForChild("useEventListener"))
local u66 = Vector2.new(1920, 1080)
local u69 = react.createContext(16)
local function CalculateRem(p1) -- Line: 35 -- upvalues: u66 (val)
    local v1 = math.log(p1.X / u66.X, 2)
    local v2 = 2 ^ (v1 + (math.log(p1.Y / u66.Y, 2) - v1) * 0.5) * 16
    return (math.max(v2, 1))
end
return {
    RemProvider = function(p1) -- Line: 46 -- upvalues: useCamera (val), useDebounceState (val), CalculateRem (val), useEventListener (val), react (val), u69 (val)
        local u9, v1
        local u2 = useCamera()
        local v2 = CalculateRem(u2.ViewportSize)
        v1, u9 = useDebounceState(v2, {wait = 0.05, leading = true})
        local PropertyChangedSignal = u2:GetPropertyChangedSignal("ViewportSize")
        useEventListener(PropertyChangedSignal, function() -- Line: 50 -- upvalues: u9 (val), CalculateRem (upval), u2 (val)
            u9(CalculateRem(u2.ViewportSize))
        end)
        return react.createElement(u69.Provider, {value = v1}, p1.children)
    end,
    RemContext = u69,
}