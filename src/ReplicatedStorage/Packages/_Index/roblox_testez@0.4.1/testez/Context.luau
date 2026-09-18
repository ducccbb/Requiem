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
--      File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.Context
--                              Dumped in 0.000189 seconds
--                          Bytecode version 9  |  3 functions

return {
    new = function(p1) -- Line: 7
        local v1
        local v2 = {}
        local u2 = {}
        v2.__index = u2
        if p1 then
            for k, v in pairs(getmetatable(p1).__index) do
                u2[k] = v
            end
        end
        function v2.__newindex(p1, p2, p3) -- Line: 18 -- upvalues: u2 (val)
            local v1 = u2[p2] == nil
            assert(v1, string.format("Cannot reassign %s in context", (tostring(p2))))
            u2[p2] = p3
        end
        v1 = {}
        return (setmetatable(v1, v2))
    end,
}