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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_number@1.2.6.number.isSafeInteger
--                              Dumped in 0.000139 seconds
--                          Bytecode version 9  |  2 functions

local isInteger = require(script.Parent:WaitForChild("isInteger"))
local MAX_SAFE_INTEGER = require(script.Parent:WaitForChild("MAX_SAFE_INTEGER"))
return function(p1) -- Line: 6 -- upvalues: isInteger (val), MAX_SAFE_INTEGER (val)
    local v1 = isInteger(p1)
    if v1 then
        local v2 = math.abs(p1)
        v1 = v2 <= MAX_SAFE_INTEGER
    end
    return v1
end