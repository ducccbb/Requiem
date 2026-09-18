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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberStack.new
--                              Dumped in 0.000456 seconds
--                          Bytecode version 9  |  7 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local u18 = {}
local u19 = {}
local u23 = if _G.__DEV__ then {} else nil
local u24 = 0
return {
    createCursor = function(p1) -- Line: 34
        return {current = p1}
    end,
    isEmpty = function() -- Line: 40 -- upvalues: u24 (ref)
        local v1 = u24 == 0
        return v1
    end,
    pop = function(p1, p2) -- Line: 44 -- upvalues: u24 (ref), console (val), u23 (ref), u19 (val), u18 (val)
        if u24 < 1 then
            if _G.__DEV__ then
                console.error("Unexpected pop.")
            end
            return
        end
        if _G.__DEV__ and p2 ~= u23[u24] then
            console.error("Unexpected Fiber popped.")
        end
        local v1 = u19[u24]
        if v1 ~= u18 then
            p1.current = v1
        else
            p1.current = nil
        end
        u19[u24] = nil
        if _G.__DEV__ then
            u23[u24] = nil
        end
        u24 = u24 - 1
    end,
    push = function(p1, p2, p3) -- Line: 76 -- upvalues: u24 (ref), u19 (val), u18 (val), u23 (ref)
        u24 = u24 + 1
        local current = p1.current
        if current ~= nil then
            u19[u24] = current
        else
            u19[u24] = u18
        end
        if _G.__DEV__ then
            u23[u24] = p3
        end
        p1.current = p2
    end,
    checkThatStackIsEmpty = function() -- Line: 93 -- upvalues: u24 (ref), console (val)
        if _G.__DEV__ and u24 ~= 0 then
            console.error("Expected an empty stack. Something was not reset properly.")
        end
    end,
    resetStackAfterFatalErrorInDev = function() -- Line: 101 -- upvalues: u24 (ref), u19 (val), u23 (ref)
        if _G.__DEV__ then
            u24 = 0
            table.clear(u19)
            table.clear(u23)
        end
    end,
}