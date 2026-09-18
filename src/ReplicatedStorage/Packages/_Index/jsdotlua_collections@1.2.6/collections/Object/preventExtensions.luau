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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Object.preventExtensions
--                              Dumped in 0.000187 seconds
--                          Bytecode version 9  |  3 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1) -- Line: 9
    local u3 = tostring(p1)
    local v1 = {
        __metatable = false,
        __newindex = function(p1, p2, p3) -- Line: 14 -- upvalues: u3 (val)
            local v1 = tostring(p2)
            local v2 = typeof(p2)
            local v3 = ("%q (%s) is not a valid member of %s"):format(v1, v2, u3)
            error(v3, 2)
        end,
    }
    return (setmetatable(p1, v1))
end