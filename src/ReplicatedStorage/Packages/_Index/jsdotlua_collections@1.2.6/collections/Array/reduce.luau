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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.reduce
--                              Dumped in 0.000278 seconds
--                          Bytecode version 9  |  2 functions

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 10 -- upvalues: __DEV__ (val)
    local v1
    if __DEV__ then
        if typeof(p1) ~= "table" then
            error(string.format("Array.reduce called on %s", (typeof(p1))))
        end
        if typeof(p2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v2 = #p1
    local v3 = 1
    if p3 == nil then
        v3 = 2
        if v2 == 0 then
            error("reduce of empty array with no initial value")
        end
        v1 = p1[1]
    else
        v1 = p3
    end
    local v4 = v2
    local v5 = 1
    for i = v3, v4, v5 do
        v1 = p2(v1, p1[i], i, p1)
    end
    return v1
end