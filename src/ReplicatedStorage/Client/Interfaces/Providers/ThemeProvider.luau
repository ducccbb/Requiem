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
--           File: ReplicatedStorage.Client.Interfaces.Providers.ThemeProvider
--                              Dumped in 0.000480 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Settings = require(Namespaces:WaitForChild("Settings"))
local Components = script.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Theme = require(Utilities:WaitForChild("Theme"))
local u73 = react.createContext(nil)
local function readThemeNameFromStore() -- Line: 36 -- upvalues: Settings (val), Players (val), Theme (val)
    local v1 = Settings.Store.get(Players.LocalPlayer)
    if not v1 then
        return nil
    end
    for k, v in pairs(v1) do
        if v.unique == 11 then
            return Theme.THEME_NAMES[v.value]
        end
    end
    return nil
end
return {
    ThemeProvider = function(p1) -- Line: 53 -- upvalues: react (val), readThemeNameFromStore (val), Settings (val), Players (val), u73 (val)
        local Requiem, Requiem_2
        Requiem, Requiem_2 = react.useState("Requiem")
        react.useEffect(function() -- Line: 56 -- upvalues: readThemeNameFromStore (upval), Requiem_2 (val), Settings (upval), Players (upval)
            local function syncThemeFromNetwork() -- Line: 57 -- upvalues: readThemeNameFromStore (upval), Requiem_2 (upval)
                local u1 = readThemeNameFromStore()
                if not u1 then
                    return
                end
                Requiem_2(function(p1) -- Line: 63 -- upvalues: u1 (val)
                    if p1 == u1 then
                        return p1
                    end
                    return u1
                end)
            end
            syncThemeFromNetwork()
            return Settings.Store.observe(Players.LocalPlayer, syncThemeFromNetwork)
        end, {})
        local v1 = react.useMemo(function() -- Line: 76 -- upvalues: Requiem (val), Requiem_2 (val)
            return {theme = Requiem, setTheme = Requiem_2}
        end, {Requiem})
        return react.createElement(u73.Provider, {value = v1}, p1.children)
    end,
    ThemeContext = u73,
}