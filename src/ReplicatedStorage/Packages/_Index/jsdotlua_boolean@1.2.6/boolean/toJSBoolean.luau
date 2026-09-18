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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_boolean@1.2.6.boolean.toJSBoolean
--                              Dumped in 0.000207 seconds
--                          Bytecode version 9  |  2 functions

local number = require(script.Parent.Parent:WaitForChild("number"))
return function(p1) -- Line: 5 -- upvalues: number (val)
    local v1 = not not p1
    if v1 then
        v1 = if p1 ~= 0 then if p1 ~= "" then not number.isNaN(p1) else false else false
    end
    return v1
end