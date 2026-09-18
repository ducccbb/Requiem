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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.forEach
--                              Dumped in 0.000255 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 11 -- upvalues: __DEV__ (val)
    local v1, v2, v3, v4
    if __DEV__ then
        if typeof(p1) ~= "table" then
            error(string.format("Array.forEach called on %s", (typeof(p1))))
        end
        if typeof(p2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v5 = #p1
    local v6 = 1
    v1, v3, v2 = p1, p3, p2
    while v6 <= v5 do
        v4 = v1[v6]
        if v3 == nil then
            v2(v4, v6, v1)
        else
            v2(v3, v4, v6, v1)
        end
        if #v1 < v5 then
            v5 = #v1
        end
        v6 = v6 + 1
    end
end