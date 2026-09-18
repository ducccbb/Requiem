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
--               File: ReplicatedStorage.Client.Interfaces.Hooks.useTheme
--                              Dumped in 0.000443 seconds
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
local Providers = v1.Parent.Parent:WaitForChild("Providers")
local ThemeProvider = require(Providers:WaitForChild("ThemeProvider"))
local Providers_2 = v1.Parent.Parent:WaitForChild("Providers")
local StoryControlsProvider = require(Providers_2:WaitForChild("StoryControlsProvider"))
local Components = v1.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Theme = require(Utilities:WaitForChild("Theme"))
return function() -- Line: 22 -- upvalues: react (val), StoryControlsProvider (val), ThemeProvider (val), Theme (val)
    local __QuickStoryControls_2, theme, u15
    local __QuickStoryControls = react.useContext(StoryControlsProvider.StoryControlsContext)
    if not __QuickStoryControls then
        __QuickStoryControls = _G.__QuickStoryControls
    end
    local u11 = react.useContext(ThemeProvider.ThemeContext)
    if not __QuickStoryControls then
        u15 = nil
    else
        u15 = __QuickStoryControls.Theme or "Requiem"
    end
    if not u11 then
        theme = "Requiem"
    else
        theme = u11.theme
    end
    if not _G.__DEV__ then
        __QuickStoryControls_2 = nil
    else
        __QuickStoryControls_2 = _G.__QuickStoryControls
    end
    local v1 = react.useMemo(function() -- Line: 31 -- upvalues: __QuickStoryControls (val), Theme (upval), u15 (val), theme (val), __QuickStoryControls_2 (val)
        if not __QuickStoryControls then
            return Theme.resolve(theme, __QuickStoryControls_2)
        end
        if __QuickStoryControls.Theme then
            return Theme.getTheme(u15)
        end
        return Theme.resolve("Requiem", __QuickStoryControls)
    end, {__QuickStoryControls, u15, theme, __QuickStoryControls_2})
    local v2 = react.useCallback(function(p1) -- Line: 43 -- upvalues: u11 (val)
        if not u11 then
            return
        end
        u11.setTheme(p1)
    end, {u11})
    if __QuickStoryControls then
        return v1, function() end
    end
    return v1, v2
end