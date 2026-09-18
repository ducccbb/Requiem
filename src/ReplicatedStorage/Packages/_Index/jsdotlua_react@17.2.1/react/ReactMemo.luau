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
--     File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactMemo
--                              Dumped in 0.000583 seconds
--                          Bytecode version 9  |  4 functions

local shared = require(script.Parent.Parent:WaitForChild("shared"))
local console = shared.console
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local inspect = v1.util.inspect
local ReactSymbols = shared.ReactSymbols
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local isValidElementType = shared.isValidElementType
local getComponentName = shared.getComponentName
return {
    memo = function(p1, p2) -- Line: 37 -- upvalues: isValidElementType (val), Object (val), Array (val), REACT_ELEMENT_TYPE (val), getComponentName (val), inspect (val), console (val), REACT_MEMO_TYPE (val)
        if _G.__DEV__ and not (isValidElementType(p1)) then
            local v1
            local v2 = ""
            if p1 == nil then
                v2 = v2 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
            elseif typeof(p1) == "table" and #Object.keys(p1) ~= 0 then
            end
            if p1 == nil then
                v1 = "nil"
            elseif Array.isArray(p1) then
                v1 = "array"
            elseif p1 == nil then
                v1 = typeof(p1)
                if p1 ~= nil then
                    v2 = "\n" .. inspect(p1)
                end
            elseif typeof(p1) == "table" and p1["$$typeof"] == REACT_ELEMENT_TYPE then
                v1 = string.format("<%s />", getComponentName(p1.type) or "UNKNOWN")
                v2 = " Did you accidentally export a JSX literal or Element instead of a component?"
            end
            console.error("memo: The first argument must be a component. Instead received: `%s`.%s", v1, v2)
        end
        local v3 = {}
        v3["$$typeof"] = REACT_MEMO_TYPE
        v3.type = p1
        v3.compare = p2 or nil
        if _G.__DEV__ then
            local u75 = nil
            setmetatable(v3, {
                __index = function(p1, p2) -- Line: 103 -- upvalues: u75 (ref)
                    if p2 == "displayName" then
                        return u75
                    end
                    return (rawget(p1, p2))
                end,
                __newindex = function(a1, p2, p3) -- Line: 109 -- upvalues: u75 (ref), p1 (val)
                    if p2 ~= "displayName" then
                        rawset(a1, p2, p3)
                        return
                    end
                    u75 = p3
                    if typeof(p1) ~= "table" or p1.displayName ~= nil then
                        return
                    end
                    p1.displayName = u75
                end,
            })
        end
        return v3
    end,
}