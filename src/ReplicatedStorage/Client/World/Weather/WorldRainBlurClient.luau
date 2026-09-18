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
--           File: ReplicatedStorage.Client.World.Weather.WorldRainBlurClient
--                              Dumped in 0.000926 seconds
--                          Bytecode version 9  |  13 functions

local u84
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Statistics = require(Utilities_2:WaitForChild("Statistics"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics_2 = Common_3:WaitForChild("Statistics")
local useBlurEffect = require(Statistics_2:WaitForChild("useBlurEffect"))
local u77 = TweenInfo.new(10, Enum.EasingStyle.Linear)
local u81 = TweenInfo.new(3, Enum.EasingStyle.Linear)
_, u84 = useBlurEffect()
local u85 = 0
local u86 = nil
local u87 = nil
local u88 = nil
local u89 = nil
local u90 = nil
local function isWeatherImmune() -- Line: 42 -- upvalues: Players (val)
    local v1 = Players.LocalPlayer:GetAttribute("WeatherImmunity") == true
    return v1
end
local function syncHoodBlur(p1) -- Line: 50 -- upvalues: isWeatherImmune (val), u87 (ref), u84 (val), u81 (val)
    if isWeatherImmune() then
        return
    end
    if p1 then
        if u87 then
            return
        end
        u87 = u84("rain_hood", 10, "subtract", 4, u81)
        return
    end
    if u87 then
        u87(u81)
        u87 = nil
    end
end
local function bindCloakedListener() -- Line: 75 -- upvalues: u88 (ref), Character (val), syncHoodBlur (val)
    if u88 then
        u88:Disconnect()
        u88 = nil
    end
    local u8 = Character.getCharacter()
    if not u8 then
        syncHoodBlur(false)
        return
    end
    local v1 = u8:GetAttribute("Cloaked") == true
    syncHoodBlur(v1)
    local AttributeChangedSignal = u8:GetAttributeChangedSignal("Cloaked")
    u88 = AttributeChangedSignal:Connect(function() -- Line: 89 -- upvalues: syncHoodBlur (upval), u8 (val)
        local v1 = u8:GetAttribute("Cloaked") == true
        syncHoodBlur(v1)
    end)
end
local function unbindCloakedListener() -- Line: 97 -- upvalues: u88 (ref), u89 (ref)
    if u88 then
        u88:Disconnect()
        u88 = nil
    end
    if u89 then
        u89:Disconnect()
        u89 = nil
    end
end
local function clearRainBlur() -- Line: 112 -- upvalues: u87 (ref), u81 (val), Statistics (val), u86 (ref), u77 (val)
    if u87 then
        u87(u81)
        u87 = nil
    elseif Statistics.Contains("blur", "rain_hood") then
        Statistics.Remove("blur", "rain_hood", u81)
    end
    if u86 then
        u86(u77)
        u86 = nil
        return
    end
    if Statistics.Contains("blur", "rain") then
        Statistics.Remove("blur", "rain", u77)
    end
end
local function applyRainBlur() -- Line: 131 -- upvalues: isWeatherImmune (val), Statistics (val), u86 (ref), u84 (val), u77 (val)
    if isWeatherImmune() then
        return
    end
    if Statistics.Contains("blur", "rain") then
        Statistics.Remove("blur", "rain", nil)
    end
    u86 = u84("rain", 10, "set", 3, u77)
end
local function syncImmunityBlur() -- Line: 146 -- upvalues: isWeatherImmune (val), u88 (ref), clearRainBlur (val), u85 (ref), applyRainBlur (val), bindCloakedListener (val)
    if not (isWeatherImmune()) then
        if 0 < u85 then
            applyRainBlur()
            bindCloakedListener()
        end
        return
    end
    if u88 then
        u88:Disconnect()
        u88 = nil
    end
    clearRainBlur()
end
local function bindImmunityListener() -- Line: 165 -- upvalues: u90 (ref), Players (val), syncImmunityBlur (val)
    if u90 then
        return
    end
    local AttributeChangedSignal = Players.LocalPlayer:GetAttributeChangedSignal("WeatherImmunity")
    u90 = AttributeChangedSignal:Connect(syncImmunityBlur)
    syncImmunityBlur()
end
bindImmunityListener()
return {
    begin = function() -- Line: 179 -- upvalues: u85 (ref), bindImmunityListener (val), isWeatherImmune (val), applyRainBlur (val), bindCloakedListener (val), Players (val), u89 (ref)
        u85 = u85 + 1
        if 1 < u85 then
            return
        end
        bindImmunityListener()
        if not (isWeatherImmune()) then
            applyRainBlur()
            bindCloakedListener()
        end
        if not u89 then
            u89 = Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 194 -- upvalues: u85 (upval), isWeatherImmune (upval), bindCloakedListener (upval)
                if 0 < u85 and not (isWeatherImmune()) then
                    bindCloakedListener()
                end
            end)
        end
    end,
    stop = function() -- Line: 205 -- upvalues: u85 (ref), unbindCloakedListener (val), clearRainBlur (val)
        if u85 <= 0 then
            return
        end
        u85 = u85 - 1
        if 0 < u85 then
            return
        end
        unbindCloakedListener()
        clearRainBlur()
    end,
}