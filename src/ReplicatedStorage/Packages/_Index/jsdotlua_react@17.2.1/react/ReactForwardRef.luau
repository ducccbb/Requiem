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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactForwardRef
--                              Dumped in 0.000708 seconds
--                          Bytecode version 9  |  5 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
require(script.Parent.Parent:WaitForChild("shared"))
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local v1 = {}
function v1.forwardRef(p1) -- Line: 27 -- upvalues: REACT_MEMO_TYPE (val), console (val), REACT_FORWARD_REF_TYPE (val)
    local v1
    if _G.__DEV__ then
        if typeof(p1) ~= "table" then
            if typeof(p1) == "function" then
                v1 = debug.info(p1, "a")
                if v1 ~= 0 and v1 ~= 2 then
                    local v2
                    if v1 ~= 1 then
                        v2 = "Any additional parameter will be undefined."
                    else
                        v2 = "Did you forget to use the ref parameter?"
                    end
                    console.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v2)
                end
            else
                console.error("forwardRef requires a render function but was given %s.", (typeof(p1)))
            end
        elseif p1["$$typeof"] == REACT_MEMO_TYPE then
            console.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
        end
    end
    v1 = {}
    v1["$$typeof"] = REACT_FORWARD_REF_TYPE
    v1.render = p1
    if _G.__DEV__ then
        local u43 = nil
        setmetatable(v1, {
            __index = function(p1, p2) -- Line: 84 -- upvalues: u43 (ref)
                if p2 == "displayName" then
                    return u43
                end
                return (rawget(p1, p2))
            end,
            __newindex = function(p1, p2, p3) -- Line: 90 -- upvalues: u43 (ref)
                if p2 == "displayName" then
                    u43 = p3
                    return
                end
                rawset(p1, p2, p3)
            end,
        })
    end
    return v1
end
return v1