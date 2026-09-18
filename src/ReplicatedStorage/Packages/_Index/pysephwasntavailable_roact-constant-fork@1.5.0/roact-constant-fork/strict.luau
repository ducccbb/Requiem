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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.strict
--                              Dumped in 0.000219 seconds
--                          Bytecode version 9  |  4 functions

return function(p1, p2) -- Line: 2
    local u5 = p2
    if not u5 then
        u5 = tostring(p1)
    end
    local v1 = {}
    function v1.__index(p1, p2) -- Line: 8 -- upvalues: u5 (val)
        local v1 = tostring(p2)
        local v2 = typeof(p2)
        local v3 = ("%q (%s) is not a valid member of %s"):format(v1, v2, u5)
        error(v3, 2)
    end
    function v1.__newindex(p1, p2, p3) -- Line: 14 -- upvalues: u5 (val)
        local v1 = tostring(p2)
        local v2 = typeof(p2)
        local v3 = ("%q (%s) is not a valid member of %s"):format(v1, v2, u5)
        error(v3, 2)
    end
    return (setmetatable(p1, v1))
end