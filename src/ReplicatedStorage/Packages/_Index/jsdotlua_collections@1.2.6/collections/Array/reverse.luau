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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.reverse
--                              Dumped in 0.000196 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1) -- Line: 6
    local v1
    local v2 = #p1
    local v3 = 1
    while v3 < v2 do
        v1 = p1[v3]
        p1[v3] = p1[v2]
        p1[v2] = v1
        v3 = v3 + 1
        v2 = v2 - 1
    end
    return p1
end