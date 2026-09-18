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
--        File: ReplicatedStorage.Client.Interfaces.Providers.ContextMenuProvider
--                              Dumped in 0.000321 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local u29 = react.createContext(nil)
return {
    ContextMenuProvider = function(p1) -- Line: 43 -- upvalues: react (val), u29 (val)
        local u10, u14, u15, u24, u25, u4, u5, u9
        u4, u5 = react.useState({})
        u9, u10 = react.useState({})
        u14, u15 = react.useState(false)
        u24, u25 = react.useState(UDim2.new(0, 0, 0, 0))
        local function setContext(p1, p2) -- Line: 50 -- upvalues: u5 (val), u10 (val)
            u5(p1)
            u10({current = p2})
        end
        local v1 = react.useMemo(function() -- Line: 55 -- upvalues: setContext (val), u15 (val), u25 (val), u4 (val), u9 (val), u14 (val), u24 (val)
            return {
                setContexts = setContext,
                setVisible = u15,
                setPosition = u25,
                contexts = u4,
                callback = u9,
                visible = u14,
                position = u24,
            }
        end, {u14, u4})
        return react.createElement(u29.Provider, {value = v1}, p1.children)
    end,
    ContextMenuContext = u29,
}