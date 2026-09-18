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
--                            File: ReplicatedFirst.Profiling
--                              Dumped in 0.000695 seconds
--                          Bytecode version 9  |  1 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Profiling = require(Common:WaitForChild("Logger"))("Profiling")
local v3 = false
local v4 = false
local v5 = RunService:IsStudio() and false
local v6 = RunService:IsStudio() and false
local v7 = RunService:IsStudio() and false
if not v3 then
    v1 = nil
else
    v1 = 10
end
_G.__REACT_MICROPROFILER_LEVEL = v1
_G.__PROFILE__ = v3
_G.__NETWORK_SLOW_CALLBACK_TRACKING__ = v3
_G.__STORE_OBSERVER_DEBUG__ = v3
_G.__STORE_RENDER_DEBUG__ = v3
_G.__EXPERIMENTAL__ = v3
_G.__DEV__ = v3
_G.__PVP_DEBUGGING__ = v5
_G.__USING_INFINITE_GAS__ = false
_G.__TITAN_DEBUGGING__ = v6
_G.__ANIMAL_BLADE_DEBUG__ = v7
_G.__USING_CUSTOM_REPLICATION__ = v4
_G.__USING_NO_COOLDOWNS__ = false
if not (RunService:IsClient()) then
    if not (RunService:IsStudio()) and RunService:IsServer() then
        Profiling.info((("React Microprofiler Level: %*"):format(_G.__REACT_MICROPROFILER_LEVEL or "Not enabled")))
        Profiling.info((("Profiling Enabled: %*"):format(_G.__PROFILE__ or "Not enabled")))
        Profiling.info((("Network Slow Callback Tracking: %*"):format(_G.__NETWORK_SLOW_CALLBACK_TRACKING__ or "Not enabled")))
        Profiling.info((("Store Observer Debug: %*"):format(_G.__STORE_OBSERVER_DEBUG__ or "Not enabled")))
        Profiling.info((("Store Render Debug: %*"):format(_G.__STORE_RENDER_DEBUG__ or "Not enabled")))
        Profiling.info((("Experimental Mode: %*"):format(_G.__EXPERIMENTAL__ or "Not enabled")))
        Profiling.info((("Development Mode: %*"):format(_G.__DEV__ or "Not enabled")))
        Profiling.info((("PVP Debugging: %*"):format(_G.__PVP_DEBUGGING__ or "Not enabled")))
        Profiling.info((("Titan Debugging: %*"):format(_G.__TITAN_DEBUGGING__ or "Not enabled")))
        Profiling.info((("Animal Blade Debugging: %*"):format(_G.__ANIMAL_BLADE_DEBUG__ or "Not enabled")))
        Profiling.info((("Using Custom Replication: %*"):format(_G.__USING_CUSTOM_REPLICATION__ or "Not enabled")))
        Profiling.info((("Using No Cooldowns: %*"):format(_G.__USING_NO_COOLDOWNS__ or "Not enabled")))
        Profiling.info("Enchantment Health: Enabled")
    end
elseif RunService:IsStudio() then
    Profiling.info((("React Microprofiler Level: %*"):format(_G.__REACT_MICROPROFILER_LEVEL or "Not enabled")))
    Profiling.info((("Profiling Enabled: %*"):format(_G.__PROFILE__ or "Not enabled")))
    Profiling.info((("Network Slow Callback Tracking: %*"):format(_G.__NETWORK_SLOW_CALLBACK_TRACKING__ or "Not enabled")))
    Profiling.info((("Store Observer Debug: %*"):format(_G.__STORE_OBSERVER_DEBUG__ or "Not enabled")))
    Profiling.info((("Store Render Debug: %*"):format(_G.__STORE_RENDER_DEBUG__ or "Not enabled")))
    Profiling.info((("Experimental Mode: %*"):format(_G.__EXPERIMENTAL__ or "Not enabled")))
    Profiling.info((("Development Mode: %*"):format(_G.__DEV__ or "Not enabled")))
    Profiling.info((("PVP Debugging: %*"):format(_G.__PVP_DEBUGGING__ or "Not enabled")))
    Profiling.info((("Titan Debugging: %*"):format(_G.__TITAN_DEBUGGING__ or "Not enabled")))
    Profiling.info((("Animal Blade Debugging: %*"):format(_G.__ANIMAL_BLADE_DEBUG__ or "Not enabled")))
    Profiling.info((("Using Custom Replication: %*"):format(_G.__USING_CUSTOM_REPLICATION__ or "Not enabled")))
    Profiling.info((("Using No Cooldowns: %*"):format(_G.__USING_NO_COOLDOWNS__ or "Not enabled")))
    Profiling.info("Enchantment Health: Enabled")
elseif not (RunService:IsStudio()) and RunService:IsServer() then
    Profiling.info((("React Microprofiler Level: %*"):format(_G.__REACT_MICROPROFILER_LEVEL or "Not enabled")))
    Profiling.info((("Profiling Enabled: %*"):format(_G.__PROFILE__ or "Not enabled")))
    Profiling.info((("Network Slow Callback Tracking: %*"):format(_G.__NETWORK_SLOW_CALLBACK_TRACKING__ or "Not enabled")))
    Profiling.info((("Store Observer Debug: %*"):format(_G.__STORE_OBSERVER_DEBUG__ or "Not enabled")))
    Profiling.info((("Store Render Debug: %*"):format(_G.__STORE_RENDER_DEBUG__ or "Not enabled")))
    Profiling.info((("Experimental Mode: %*"):format(_G.__EXPERIMENTAL__ or "Not enabled")))
    Profiling.info((("Development Mode: %*"):format(_G.__DEV__ or "Not enabled")))
    Profiling.info((("PVP Debugging: %*"):format(_G.__PVP_DEBUGGING__ or "Not enabled")))
    Profiling.info((("Titan Debugging: %*"):format(_G.__TITAN_DEBUGGING__ or "Not enabled")))
    Profiling.info((("Animal Blade Debugging: %*"):format(_G.__ANIMAL_BLADE_DEBUG__ or "Not enabled")))
    Profiling.info((("Using Custom Replication: %*"):format(_G.__USING_CUSTOM_REPLICATION__ or "Not enabled")))
    Profiling.info((("Using No Cooldowns: %*"):format(_G.__USING_NO_COOLDOWNS__ or "Not enabled")))
    Profiling.info("Enchantment Health: Enabled")
end
game.Workspace.Retargeting = Enum.AnimatorRetargetingMode.Disabled
return {
    IS_USING_NO_COOLDOWNS = false,
    IS_USING_CLIENT_HORSE_ANIMATIONS = false,
    IS_USING_SERVER_HORSE_ANIMATIONS = false,
    IS_USING_LOCAL_HORSE_ANIMATIONS = false,
    IS_GAME_LOCKED = false,
    IS_RETARGETTING_DISABLED = true,
    IS_ENCHANTMENT_COUNT_MAX_HEALTH_BONUS_ENABLED = true,
    IS_USING_HEALTH_BASED_RESILIENCE = false,
    IS_DOING_PROFILING = v3,
    IS_DOING_PVP_DEBUGGING = v5,
    IS_DOING_TITAN_DEBUGGING = v6,
    IS_DOING_ANIMAL_BLADE_DEBUGGING = v7,
    IS_USING_CUSTOM_REPLICATION = v4,
}