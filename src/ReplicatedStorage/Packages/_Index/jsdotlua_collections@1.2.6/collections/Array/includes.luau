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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.includes
--                              Dumped in 0.000154 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local indexOf = require(script.Parent:WaitForChild("indexOf"))
return function(p1, p2, p3) -- Line: 6 -- upvalues: indexOf (val)
    local v1 = indexOf(p1, p2, p3) ~= -1
    return v1
end