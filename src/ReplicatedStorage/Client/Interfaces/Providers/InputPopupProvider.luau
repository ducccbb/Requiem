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
--        File: ReplicatedStorage.Client.Interfaces.Providers.InputPopupProvider
--                              Dumped in 0.000333 seconds
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
    InputProvider = function(p1) -- Line: 36 -- upvalues: react (val), u29 (val)
        local u12, u13, u17, u18, u26, u27, u7, u8
        u7, u8 = react.useState({"", "", ""})
        u12, u13 = react.useState({rerender = 0})
        u17, u18 = react.useState(false)
        u26, u27 = react.useState(Color3.fromRGB(255, 255, 255))
        local function setInput(p1, p2, p3, p4) -- Line: 43 -- upvalues: u8 (val), u13 (val), u12 (val)
            u8({p1, p2, p3})
            u13({current = p4, rerender = u12.rerender + 1})
        end
        local v1 = react.useMemo(function() -- Line: 48 -- upvalues: setInput (val), u18 (val), u27 (val), u7 (val), u12 (val), u17 (val), u26 (val)
            return {
                setInput = setInput,
                setVisible = u18,
                setColor = u27,
                components = u7,
                callback = u12,
                visible = u17,
                color = u26,
            }
        end, {u17, u7, u12.rerender, u12.current})
        return react.createElement(u29.Provider, {value = v1}, p1.children)
    end,
    InputContext = u29,
}