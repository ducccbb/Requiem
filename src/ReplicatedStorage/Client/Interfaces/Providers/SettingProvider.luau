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
--          File: ReplicatedStorage.Client.Interfaces.Providers.SettingProvider
--                              Dumped in 0.000632 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Settings = require(Namespaces:WaitForChild("Settings"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Settings_2 = require(Types:WaitForChild("Settings"))
local Hooks = script.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local u83 = react.createContext(nil)
local u86 = react.createContext(nil)
local u87 = 0
local u88 = {}
local function getSettingValuesFromStore(p1) -- Line: 37 -- upvalues: u88 (val)
    if not p1 then
        return u88
    end
    local v1 = {}
    for k, v in pairs(p1) do
        v1[v.unique] = v.value
    end
    return v1
end
return {
    SettingProvider = function(p1) -- Line: 52 -- upvalues: useStore (val), Settings (val), getSettingValuesFromStore (val), react (val), u87 (ref), Settings_2 (val), u86 (val), u83 (val)
        local u10, u9
        local u5 = useStore(Settings.Store, getSettingValuesFromStore)
        u9, u10 = react.useState(u87)
        local v1 = {u5}
        local u16 = react.useMemo(function() -- Line: 58 -- upvalues: Settings_2 (upval), u5 (val)
            local v1, v2, v3
            local v4 = {}
            for k, v in pairs(Settings_2.Settings) do
                v3 = {}
                v4[k] = v3
                for k2, i in pairs(v) do
                    v1 = {}
                    v3[k2] = v1
                    for i2, j in ipairs(i) do
                        v2 = u5[j.Unique]
                        if v2 ~= nil then
                            j.Value = v2
                        end
                        v1[i2] = j
                    end
                end
            end
            return v4
        end, v1)
        local u21 = react.useCallback(function() -- Line: 83 -- upvalues: u87 (upval), u10 (val)
            u87 = u87 + 1
            u10(u87)
        end, {})
        v1 = react.useMemo(function() -- Line: 88 -- upvalues: u21 (val)
            return {update = u21}
        end, {u21})
        local v2 = react.useMemo(function() -- Line: 94 -- upvalues: u16 (val), u21 (val), u9 (val)
            return {settings = u16, update = u21, __render = u9}
        end, {u16, u21, u9})
        return react.createElement(u86.Provider, {value = v1}, {Settings = react.createElement(u83.Provider, {value = v2}, p1.children)})
    end,
    SettingContext = u83,
    SettingActionsContext = u86,
}