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
--       File: ReplicatedStorage.Client.Interfaces.Components.Utilities.QuickStory
--                              Dumped in 0.000408 seconds
--                          Bytecode version 9  |  3 functions

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
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u41 = require(Packages_2:WaitForChild("react-roblox"))
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local SettingProvider = require(Providers:WaitForChild("SettingProvider"))
local Providers_2 = v1.Parent.Parent.Parent:WaitForChild("Providers")
local StoryControlsProvider = require(Providers_2:WaitForChild("StoryControlsProvider"))
local Providers_3 = v1.Parent.Parent.Parent:WaitForChild("Providers")
local ThemeProvider = require(Providers_3:WaitForChild("ThemeProvider"))
local Providers_4 = v1.Parent.Parent.Parent:WaitForChild("Providers")
local ToastProvider = require(Providers_4:WaitForChild("ToastProvider"))
return function(p1, p2) -- Line: 26 -- upvalues: react (val), u41 (val), StoryControlsProvider (val), SettingProvider (val), ThemeProvider (val), ToastProvider (val)
    local v1 = {react = react, reactRoblox = u41, controls = p1}
    function v1.story(p1) -- Line: 36 -- upvalues: p2 (val), react (upval), StoryControlsProvider (upval), SettingProvider (upval), ThemeProvider (upval), ToastProvider (upval)
        local v1, v2
        v1, v2 = p2(p1.controls)
        if v2 then
            local StoryJanitor = getfenv().__hotreload_env_global_injection__.StoryJanitor
            if not (StoryJanitor:Get("QuickStory")) then
                StoryJanitor:Add(v2, true, "QuickStory")
            end
        end
        return react.createElement(StoryControlsProvider.StoryControlsProvider, {controls = p1.controls}, {react.createElement(SettingProvider.SettingProvider, {}, {react.createElement(ThemeProvider.ThemeProvider, {}, {react.createElement(ToastProvider.ToastProvider, {}, v1)})})})
    end
    return v1
end