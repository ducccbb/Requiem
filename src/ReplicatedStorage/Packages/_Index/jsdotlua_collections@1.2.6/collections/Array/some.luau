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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.some
--                              Dumped in 0.000257 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3) -- Line: 12
    local v1, v2, v3
    if typeof(p1) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(p1))))
    end
    if typeof(p2) ~= "function" then
        error("callback is not a function")
    end
    local v4 = p1
    local v5 = nil
    local v6 = nil
    v3, v2, v1 = p3, p2, p1
    for i, j in v4, v5, v6 do
        if v3 == nil then
            if j ~= nil and v2(j, i, v1) then
                return true
            end
        elseif j ~= nil and v2(v3, j, i, v1) then
            return true
        end
    end
    return false
end