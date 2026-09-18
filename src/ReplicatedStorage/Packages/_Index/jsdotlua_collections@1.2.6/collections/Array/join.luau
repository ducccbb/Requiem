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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.join
--                              Dumped in 0.000159 seconds
--                          Bytecode version 9  |  3 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local map = require(script.Parent:WaitForChild("map"))
return function(p1, p2) -- Line: 6 -- upvalues: map (val)
    if #p1 == 0 then
        return ""
    end
    local v1 = map(p1, function(p1) -- Line: 11
        return (tostring(p1))
    end)
    return table.concat(v1, p2 or ",")
end