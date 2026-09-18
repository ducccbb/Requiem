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
--         File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Scaler
--                              Dumped in 0.000795 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local SettingProvider = require(Providers:WaitForChild("SettingProvider"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local u68 = false
local u69 = 0.6
return function(p1) -- Line: 48 -- upvalues: react (val), SettingProvider (val), useMotion (val), u68 (ref), u69 (ref), Promise (val)
    local settings, u27, v1, v2, v3
    local v4 = react.useContext(SettingProvider.SettingContext)
    if not v4 then
        settings = {}
    else
        settings = v4.settings
    end
    local u15 = settings
    if u15 then
        u15 = settings.Interface.Performance[1].Value == 1
    end
    if not p1.Enabled then
        v2 = p1.Scaling or 0.9
    else
        v2 = 1
    end
    v1, u27 = useMotion(v2)
    if _G.__DEV__ and _G.__QuickStoryControls then
        u68 = _G.__QuickStoryControls.Instant
        u69 = _G.__QuickStoryControls.Speed
    end
    react.useEffect(function() -- Line: 61 -- upvalues: u15 (val), u27 (val), p1 (val), u68 (upval), u69 (upval), Promise (upval)
        local Enabled, v1, v2
        if u15 then
            if not p1.Enabled then
                v2 = p1.Scaling or 0.9
            else
                v2 = 1
            end
            u27:immediate(v2)
            return
        end
        if not p1.Delay then
            Enabled = 0
        elseif not p1.Enabled then
            Enabled = p1.Delay.Disabled
            if not Enabled then
                Enabled = 0
            end
        else
            Enabled = p1.Delay.Enabled
        end
        if not u68 then
            v1 = Enabled * u69
        else
            v1 = 0
        end
        local u38 = Promise.delay(v1):andThen(function() -- Line: 70 -- upvalues: u68 (upval), u27 (upval), p1 (upval), u69 (upval)
            local v1, v2
            if u68 then
                if not p1.Enabled then
                    v1 = p1.Scaling or 0.9
                else
                    v1 = 1
                end
                u27:immediate(v1)
                return
            end
            if not p1.Enabled then
                v1 = p1.Scaling or 0.9
            else
                v1 = 1
            end
            local v3 = {}
            if not u68 then
                v2 = u69 * 0.2
            else
                v2 = 0
            end
            v3.time = v2
            u27:tween(v1, v3)
        end)
        return function() -- Line: 81 -- upvalues: u38 (val)
            u38:cancel()
        end
    end, {p1.Enabled, u15})
    local createElement = react.createElement
    local v5 = {BackgroundTransparency = 1}
    if not u15 then
        v3 = v1:map(function(p1) -- Line: 87
            return UDim2.fromScale(p1, p1)
        end)
    else
        v3 = UDim2.fromScale(1, 1)
        if not v3 then
            v3 = v1:map(function(p1) -- Line: 87
                return UDim2.fromScale(p1, p1)
            end)
        end
    end
    v5.Size = v3
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v5.Position = UDim2.fromScale(0.5, 0.5)
    return createElement("Frame", v5, p1.children)
end