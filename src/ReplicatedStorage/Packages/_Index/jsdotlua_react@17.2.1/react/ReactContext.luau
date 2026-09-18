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
--   File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactContext
--                              Dumped in 0.000521 seconds
--                          Bytecode version 9  |  4 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
return {
    createContext = function(p1, p2) -- Line: 23 -- upvalues: REACT_CONTEXT_TYPE (val), REACT_PROVIDER_TYPE (val), console (val)
        local u2 = {}
        u2["$$typeof"] = REACT_CONTEXT_TYPE
        u2._calculateChangedBits = p2
        u2._currentValue = p1
        u2._currentValue2 = p1
        u2._threadCount = 0
        u2.Provider = nil
        u2.Consumer = nil
        u2.displayName = nil
        u2._currentRenderer = nil
        u2._currentRenderer2 = nil
        local v1 = {}
        v1["$$typeof"] = REACT_PROVIDER_TYPE
        v1._context = u2
        u2.Provider = v1
        local u12 = false
        if not _G.__DEV__ then
            u2.Consumer = u2
        else
            local v2 = {}
            v2["$$typeof"] = REACT_CONTEXT_TYPE
            v2._context = u2
            v2._calculateChangedBits = u2._calculateChangedBits
            setmetatable(v2, {
                __index = function(p1, p2) -- Line: 68 -- upvalues: u2 (val)
                    if p2 == "_currentValue" then
                        return u2._currentValue
                    end
                    if p2 == "_currentValue2" then
                        return u2._currentValue2
                    end
                    if p2 == "_threadCount" then
                        return u2._threadCount
                    end
                    if p2 == "displayName" then
                        return u2.displayName
                    end
                    return nil
                end,
                __newindex = function(p1, p2, p3) -- Line: 81 -- upvalues: u2 (val), u12 (ref), console (upval)
                    if p2 == "_currentValue" then
                        u2._currentValue = p3
                        return
                    end
                    if p2 == "_currentValue2" then
                        u2._currentValue2 = p3
                        return
                    end
                    if p2 == "_threadCount" then
                        u2._threadCount = p3
                        return
                    end
                    if p2 == "displayName" and not u12 then
                        console.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. p3 .. ".")
                        u12 = true
                    end
                end,
            })
            u2.Consumer = v2
        end
        if _G.__DEV__ then
            u2._currentRenderer = nil
            u2._currentRenderer2 = nil
        end
        return u2
    end,
}