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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Environment
--                              Dumped in 0.000411 seconds
--                          Bytecode version 9  |  12 functions

local UserInputService = game:GetService("UserInputService")
local u5 = {EnvGlobalInjectionKey = "__hotreload_env_global_injection__"}
function SearchInEnv(p1, p2) -- Line: 6 -- upvalues: u5 (val)
    local v1
    local v2 = u5.GetEnvGlobalInjection()
    if not v2 then
        v1 = p2
    else
        v1 = v2[p1]
        if not v1 then
            v1 = p2
        end
    end
    return v1
end
function u5.GetEnvGlobalInjection() -- Line: 12 -- upvalues: u5 (val)
    return getfenv()[u5.EnvGlobalInjectionKey]
end
function u5.IsStory() -- Line: 17 -- upvalues: u5 (val)
    local v1 = u5.GetEnvGlobalInjection() ~= nil
    return v1
end
function UserInputFallback(p1) -- Line: 22 -- upvalues: UserInputService (val)
    if not p1 or p1 == UserInputService then
        return UserInputService
    end
    local v1 = {
        __index = function(p1, p2) -- Line: 32 -- upvalues: UserInputService (upval)
            local u3 = UserInputService[p2]
            if typeof(u3) == "function" then
                return function(p1, ...) -- Line: 36 -- upvalues: u3 (val), UserInputService (upval)
                    return u3(UserInputService, ...)
                end
            end
            return u3
        end,
    }
    return (setmetatable(table.clone(p1), v1))
end
u5.Unmount = SearchInEnv("Unmount", function() end)
u5.Reload = SearchInEnv("Reload", function() end)
u5.CreateSnapshot = SearchInEnv("CreateSnapshot", function() end)
u5.SetStoryHolder = SearchInEnv("SetStoryHolder", function() end)
function u5.GetJanitor() -- Line: 50
    return (SearchInEnv("StoryJanitor"))
end
u5.InputListener = SearchInEnv("InputListener", nil)
u5.UserInput = UserInputFallback(SearchInEnv("InputListener", UserInputService))
u5.EnvironmentUID = SearchInEnv("EnvironmentUID", "")
u5.PreviewUID = SearchInEnv("PreviewUID", "")
u5.OriginalG = SearchInEnv("OriginalG", _G)
u5.PluginWidget = SearchInEnv("PluginWidget", nil)
u5.Plugin = SearchInEnv("Plugin", plugin)
return u5