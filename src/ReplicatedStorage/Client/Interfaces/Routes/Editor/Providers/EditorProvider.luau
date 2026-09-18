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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Providers.EditorProvider
--                              Dumped in 0.000601 seconds
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
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u71 = react.createContext(nil)
local u74 = react.createContext(nil)
local u77 = react.createContext(nil)
local u80 = react.createContext(nil)
return {
    EditorProvider = function(p1) -- Line: 56 -- upvalues: react (val), Table (val), Administration (val), u71 (val), u74 (val), u77 (val), u80 (val)
        local Select, Select_2, u14, u15, u23, u24, u4, u5
        u4, u5 = react.useState(false)
        Select, Select_2 = react.useState("Select")
        u14, u15 = react.useState({})
        local u19 = react.useRef({})
        u23, u24 = react.useState({freecam = false, indicator = false, visible = true})
        react.useEffect(function() -- Line: 70 -- upvalues: u19 (val), u23 (val), Table (upval), Administration (upval)
            if not u19.current then
                u19.current = u23
            end
            if not (Table.equals(u19.current, u23)) and u19.current then
                local v1
                u19.current = u23
                if u23.freecam then
                    v1 = 3
                elseif not u23.visible then
                    v1 = 1
                else
                    v1 = 0
                end
                Administration.State.post(v1)
            end
        end, {u23})
        local v1 = react.useMemo(function() -- Line: 88 -- upvalues: u5 (val), u4 (val)
            return {setEnabled = u5, enabled = u4}
        end, {u4})
        local v2 = react.useMemo(function() -- Line: 95 -- upvalues: Select_2 (val), Select (val)
            return {setTool = Select_2, tool = Select}
        end, {Select})
        local v3 = react.useMemo(function() -- Line: 102 -- upvalues: u15 (val), u14 (val)
            return {setPages = u15, pages = u14}
        end, {u14})
        local v4 = react.useMemo(function() -- Line: 109 -- upvalues: u24 (val), u23 (val)
            return {setStates = u24, states = u23}
        end, {u23})
        return react.createElement(u71.Provider, {value = v1}, {ToolProvider = react.createElement(u74.Provider, {value = v2}, {PagesProvider = react.createElement(u77.Provider, {value = v3}, {StatesProvider = react.createElement(u80.Provider, {value = v4}, p1.children)})})})
    end,
    EnabledContext = u71,
    ToolContext = u74,
    PagesContext = u77,
    StatesContext = u80,
}