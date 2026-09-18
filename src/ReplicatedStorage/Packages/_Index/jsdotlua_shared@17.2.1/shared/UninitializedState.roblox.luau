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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.UninitializedState.roblox
--                              Dumped in 0.000186 seconds
--                          Bytecode version 9  |  4 functions

local console = require(script.Parent:WaitForChild("console"))
local v1 = {}
setmetatable(v1, {
    __metatable = "UninitializedState",
    __index = function(p1, p2) -- Line: 23 -- upvalues: console (val)
        if _G.__DEV__ then
            console.warn("Attempted to access uninitialized state. Use setState to initialize state")
        end
        return nil
    end,
    __newindex = function(p1, p2) -- Line: 31 -- upvalues: console (val)
        if _G.__DEV__ then
            console.error("Attempted to directly mutate state. Use setState to assign new values to state.")
        end
        return nil
    end,
    __tostring = function(p1) -- Line: 39
        return "<uninitialized component state>"
    end,
})
return v1