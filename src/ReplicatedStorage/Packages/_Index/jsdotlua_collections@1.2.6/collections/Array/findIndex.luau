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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.findIndex
--                              Dumped in 0.000153 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2) -- Line: 6
    local v1 = #p1
    local v2 = 1
    for i = 1, v1, v2 do
        if p2(p1[i], i, p1) then
            return i
        end
    end
    return -1
end